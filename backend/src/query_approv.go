package src

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
)

//Retorna la lista de alumnos aprobados y reprobados de un curso

type aprov struct {
	Codigo  string `json:"codigo"`
	Ciclo   string `json:"ciclo"`
	Anio    string `json:"anio"`
	Section string `json:"seccion"`
}

type studentappr struct {
	Carnet string `json:"carnet"`
	Nombre string `json:"nombre"`
	Estado string `json:"estado"`
}

func QueryApprov(c *gin.Context) {
	var assignment aprov
	c.BindJSON(&assignment)

	rows, err := connection.DB.Query(fmt.Sprintf("select * from consultaAprobacion(%s, '%s','%s', '%s');",
		assignment.Codigo,
		assignment.Ciclo,
		assignment.Anio,
		assignment.Section))

	if err != nil {
		c.JSON(400, gin.H{
			"error":   "Error en el servidor",
			"success": "",
		})
		return
	}
	var lista []studentappr
	var aprobado studentappr
	for rows.Next() {
		rows.Scan(&aprobado.Carnet, &aprobado.Nombre, &aprobado.Estado)
		lista = append(lista, aprobado)
	}

	c.JSON(200, gin.H{
		"error":   "",
		"success": lista,
	})
}
