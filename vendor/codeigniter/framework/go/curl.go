package main

import (
	//"fmt"
	"net/http"

	"github.com/labstack/echo"
	//"github.com/labstack/echo/middleware"
)

// User
type User struct {
  Sn string `json:"sn" form:"sn"`
	Uid string `json:"uid" form:"uid"`
}

// Handler
func response (c echo.Context) (err error) {
  u := new(User)
  if err = c.Bind(u); err != nil {
    return
  }
  return c.JSON(http.StatusOK, u)
}

func main() {
	e := echo.New()
	//e.Use(middleware.Logger())
	//e.Use(middleware.Recover())

	e.POST("/curl", response)

	e.Logger.Fatal(e.Start(":1323"))
}
