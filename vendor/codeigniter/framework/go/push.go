package main

import (
       "fmt"
       "log"
	   "net/http"
       "database/sql"

       _ "github.com/go-sql-driver/mysql"
	   "github.com/gorilla/websocket"
       "github.com/labstack/echo"
	   "github.com/labstack/echo/middleware"
)

var (
	upgrader = websocket.Upgrader{
		ReadBufferSize:  1024,
		WriteBufferSize: 1024,
		CheckOrigin: func(r *http.Request) bool {
			return true
		},
	}
)

func sqltest() bool {
       // sql.DB connect
       db, err := sql.Open("mysql", "push:rgbplace.com@tcp(127.0.0.1:3306)/home")
       if err != nil {
               log.Fatal(err)
       }
       defer db.Close()

       var alert string
       rows, err := db.Query("select JSON_QUERY( msg, concat('$.total[',JSON_LENGTH(msg)-1,']') ) alert from user_info where sn = ?", 1)
       if err != nil {
               log.Fatal(err)
       }
       defer rows.Close()

       for rows.Next() {
               err := rows.Scan(&alert)
               if err != nil {
                       log.Fatal(err)
               }
               fmt.Println(alert)
       }

       return true
}

func hello(c echo.Context) error {
	ws, err := upgrader.Upgrade(c.Response(), c.Request(), nil)
	if err != nil {
		return err
	}
	defer ws.Close()

	for {
		// Read
		_, msg, err := ws.ReadMessage()
		if err != nil {
			c.Logger().Error(err)
		} else {
			// Write
			err := ws.WriteMessage(websocket.TextMessage, []byte(msg))
			if err != nil {
				c.Logger().Error(err)
			}
		}
		fmt.Printf("%s\n", msg)
	}
}


func main() {
       sqltest()
       e := echo.New()
       e.Use(middleware.Logger())
       e.Use(middleware.Recover())
       e.GET("/say", hello)
       e.Logger.Fatal(e.Start(":1323"))
}
