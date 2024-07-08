package src

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type docente struct {
	Siif     string `json:"siif"`
	Name     string `json:"name"`
	Lastname string `json:"lastname"`
	Date     string `json:"date"`
	Email    string `json:"email"`
	Phone    string `json:"phone"`
	Direct   string `json:"direct"`
	Dpi      string `json:"dpi"`
	Passwrod string `json:"passwrod"`
}

func DocenteReg(c *gin.Context) {
	var doc docente
	c.BindJSON(&doc)

	_, err := connection.DB.Exec(fmt.Sprintf("call registrarDocente(%s,'%s','%s','%s','%s','%s','%s',%s,'%s')",
		doc.Siif,
		doc.Name,
		doc.Lastname,
		doc.Date,
		doc.Email,
		doc.Phone,
		doc.Direct,
		doc.Dpi,
		doc.Passwrod))
	if err != nil {
		c.JSON(200, gin.H{
			"error":   err.(*pq.Error).Message,
			"success": "",
		})
		return
	}

	c.JSON(200, gin.H{
		"error":   "",
		"success": fmt.Sprintf("El docente %s ha sido registrado", doc.Name),
	})
}
