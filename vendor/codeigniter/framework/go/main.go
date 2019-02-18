package main

import (
	"flag"
	"log"
	"net/http"
)

var addr = flag.String("addr", ":1323", "http service address")

func main() {

	flag.Parse()
	hub := newHub()
	go hub.run()

	http.HandleFunc("/push", func(w http.ResponseWriter, r *http.Request) {
		serve(hub, w, r)
	})
	err := http.ListenAndServe(*addr, nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
