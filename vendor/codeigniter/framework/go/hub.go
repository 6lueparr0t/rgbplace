package main

import (
	"strconv"
)


// Hub maintains the set of active clients and broadcasts messages to the
// clients.
type Hub struct {
	// Inbound messages from the clients.
	broadcast chan []byte

	// watcher only
	multicast chan []byte


	// Register requests from the clients.
	register chan *Client

	// Unregister requests from clients.
	unregister chan *Client

	// Registered clients.
	clients map[*Client]bool


	// Watcher requests from the clients. (map & post)
	watcher chan *Client

	// Closer requests from clients
	closer chan *Client

	// Target : request URL info	
	target chan string

	// Watcher clients.
	views map[*Client]string
}

func newHub() *Hub {
	return &Hub{
		broadcast:  make(chan []byte),
		multicast:  make(chan []byte),

		register:   make(chan *Client),
		unregister: make(chan *Client),
		clients:    make(map[*Client]bool),

		watcher:    make(chan *Client),
		closer:     make(chan *Client),
		target:     make(chan string),
		views:      make(map[*Client]string),
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
		case client := <-h.watcher:
			h.views[client] = <-h.target
		case client := <-h.closer:
			if _, ok := h.views[client]; ok {
				delete(h.views, client)
				close(client.count)
				close(client.send)
			}
		case message := <-h.multicast:
			target := <-h.target
			for client, url := range h.views {
				if url == target {
					select {
					case client.send <- message:
					default:
						close(client.send)
						delete(h.views, client)
					}
				}
			}
		}
	}
}
