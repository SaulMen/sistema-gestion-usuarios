package src

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type carrer struct {
	Name string `json:"name"`
}

func CreateCareer(c *gin.Context) {
	var carr carrer
	c.BindJSON(&carr)

	_, err := connection.DB.Exec(fmt.Sprintf("call crearCarrera('%s')", carr.Name))
	//var msg string
	if err != nil {
		c.JSON(200, gin.H{
			"error":   err.(*pq.Error).Message,
			"success": "",
		})
		return
	}
	c.JSON(200, gin.H{
		"error":   "",
		"success": fmt.Sprintf("Carrera %s creada", carr.Name),
	})
}
