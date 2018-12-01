import (
       "fmt"
       "log"
       "time"
       "database/sql"

       _ "github.com/go-sql-driver/mysql"
       "github.com/labstack/echo"
       "github.com/labstack/echo/middleware"
       "golang.org/x/net/websocket"
)

func sqltest() bool {
       // sql.DB connect
       db, err := sql.Open("mysql", "push:rgbplace.com@tcp(127.0.0.1:3306)/home")
       if err != nil {
               log.Fatal(err)
       }
       defer db.Close()

       var id int
       var name string
       rows, err := db.Query("SELECT id, name FROM test1 where id >= ?", 0)
       if err != nil {
               log.Fatal(err)
       }
       defer rows.Close()

       for rows.Next() {
               err := rows.Scan(&id, &name)
               if err != nil {
                       log.Fatal(err)
               }
               fmt.Println(id, name)
       }

       return true
}

func hello(c echo.Context) error {
       websocket.Handler(func(ws *websocket.Conn) {
               defer ws.Close()
               for {
                       // Write
                       err := websocket.Message.Send(ws, "Hello, Client!")
                       if err != nil {
                               c.Logger().Error(err)
                       }

                       time.Sleep(1000 * time.Millisecond)
               }
       }).ServeHTTP(c.Response(), c.Request())
       return nil
}

func main() {
       sqltest()
       e := echo.New()
       e.Use(middleware.Logger())
       e.Use(middleware.Recover())
       e.Static("/test", "./assets")
       e.GET("/ws", hello)
       e.Logger.Fatal(e.Start(":1323"))
}
