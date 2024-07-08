package getdata

import (
	"main/connection"

	"github.com/gin-gonic/gin"
)

// Obtiene codigo y nombre de curso
func GetCouse(c *gin.Context) {
	rows, err := connection.DB.Query("select concat(codigo_curso,' - ',nombre) from curso;")
	if err != nil {
		c.JSON(400, gin.H{
			"error":   "Error del servidor",
			"success": "",
		})
		return
	}
	defer rows.Close()
	var lista []career
	var carrera career
	for rows.Next() {
		rows.Scan(&carrera.Name)
		lista = append(lista, carrera)
	}

	c.JSON(200, gin.H{
		"error":   "",
		"success": lista,
	})
}
