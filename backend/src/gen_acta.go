package src

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type acta struct {
	Codigo  string `json:"codigo"`
	Section string `json:"section"`
	Ciclo   string `json:"ciclo"`
}

func GenerateAct(c *gin.Context) {
	var acta acta
	c.BindJSON(&acta)
	if _, err := connection.DB.Exec(fmt.Sprintf("call generarActa(%s,'%s','%s')",
		acta.Codigo,
		acta.Section,
		acta.Ciclo)); err != nil {
		c.JSON(200, gin.H{
			"error":   err.(*pq.Error).Message,
			"success": "",
		})
		return
	}

	c.JSON(200, gin.H{
		"error":   "",
		"success": fmt.Sprintf("Se generó correctamente el acta del curso '%s'", acta.Codigo),
	})
}
