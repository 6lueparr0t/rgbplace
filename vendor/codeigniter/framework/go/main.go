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

	//!! live directory permission check !!
	err := http.ListenAndServeTLS(*addr, "/etc/letsencrypt/live/rgbplace.com/fullchain.pem", "/etc/letsencrypt/live/rgbplace.com/privkey.pem", nil)
	//err := http.ListenAndServe(*addr, nil)
	if err != nil {
		log.Fatal("ListenAndServeTLS: ", err)
		//log.Fatal("ListenAndServe: ", err)
	}
}
