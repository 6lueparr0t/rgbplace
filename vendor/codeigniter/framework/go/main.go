package main

import (
	"flag"
	"log"
	"net/http"

	//"github.com/labstack/echo"
	//"github.com/labstack/echo/middleware"
)

var addr = flag.String("addr", ":1323", "http service address")

func main() {

	//e := echo.New()
	//e.Use(middleware.Logger())
	//e.Use(middleware.Recover())

	flag.Parse()
	hub := newHub()
	go hub.run()

	http.HandleFunc("/say", func(w http.ResponseWriter, r *http.Request) {
		serveWs(hub, w, r)
	})
	err := http.ListenAndServe(*addr, nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
