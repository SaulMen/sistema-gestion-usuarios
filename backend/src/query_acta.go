package src

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
)

// Retorna las actas de un curso en específico

type codigoc struct {
	Codigo string `json:"codigo"`
}

type actadata struct {
	Codigo    int    `json:"codigo"`
	Seccion   string `json:"seccion"`
	Ciclo     string `json:"ciclo"`
	Anio      string `json:"anio"`
	Asignados int    `json:"asignado"`
	Fecha     string `json:"fecha"`
}

func QueryActa(c *gin.Context) {
	var curso codigoc
	c.BindJSON(&curso)

	rows, err := connection.DB.Query(fmt.Sprintf("select * from consultar_acta(%s);",
		curso.Codigo))

	if err != nil {
		c.JSON(400, gin.H{
			"error":   "Error en el servidor",
			"success": "",
		})
		return
	}
	var lista []actadata
	var data actadata
	for rows.Next() {
		rows.Scan(&data.Codigo, &data.Seccion, &data.Ciclo, &data.Anio, &data.Asignados, &data.Fecha)
		lista = append(lista, data)
	}

	c.JSON(200, gin.H{
		"error":   "",
		"success": lista,
	})
}
