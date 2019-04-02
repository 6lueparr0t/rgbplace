package main

import (
	"strconv"
)


// Hub maintains the set of active clients and broadcasts messages to the
// clients.
type Hub struct {
	// Registered clients.
	clients map[*Client]bool

	// Inbound messages from the clients.
	broadcast chan []byte

	// Register requests from the clients.
	register chan *Client

	// Unregister requests from clients.
	unregister chan *Client
}

func newHub() *Hub {
	return &Hub{
		broadcast:  make(chan []byte),
		register:   make(chan *Client),
		unregister: make(chan *Client),
		clients:    make(map[*Client]bool),
	}
}

func (h *Hub) run() {
	for {
		select {
		case client := <-h.register:
			h.clients[client] = true
			for client := range h.clients {
				client.count <- []byte(`{"act":"noti", "mode":"count", "data":`+strconv.Itoa(len(h.clients))+`}`)
			}
		case client := <-h.unregister:
			for client := range h.clients {
				client.count <- []byte(`{"act":"noti", "mode":"count", "data":`+strconv.Itoa(len(h.clients)-1)+`}`)
			}
			if _, ok := h.clients[client]; ok {
				delete(h.clients, client)
				close(client.count)
				close(client.send)
			}
		case message := <-h.broadcast:
			for client := range h.clients {
				select {
				case client.send <- message:
				default:
					close(client.send)
					delete(h.clients, client)
				}
			}
		}
	}
}
