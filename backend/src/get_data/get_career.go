package getdata

import (
	"main/connection"

	"github.com/gin-gonic/gin"
)

type career struct {
	Name string `json:"carrera"`
}

// Obtiene nombres de carrera
func GetCareer(c *gin.Context) {
	rows, err := connection.DB.Query("select concat(id_carrera,' - ',nombre_carrera) from carrera where id_carrera>1;")
	if err != nil {
		c.JSON(400, gin.H{
			"error":   "Erro en el servidor",
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
