package src

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
)

type login struct {
	User     string `json:"user"`
	Password string `json:"password"`
	Rol      string `json:"rol"`
}

func Login(c *gin.Context) {
	var log login
	c.BindJSON(&log)
	if log.Rol == "2" {
		if log.User == "admin" && log.Password == "admin" {
			c.JSON(200, gin.H{
				"error":   "",
				"success": true,
			})
			return
		}
		c.JSON(200, gin.H{
			"error":   "No existe usuario admin",
			"success": "",
		})
		return
	}

	if log.Rol == "1" {
		var bandera bool
		connection.DB.QueryRow(fmt.Sprintf(`SELECT exists(select siif,contrasenia 
			from docente 
			where siif=%s AND contrasenia='%s')`, log.User, log.Password)).Scan(&bandera)
		if bandera {
			c.JSON(200, gin.H{
				"error":   "",
				"success": true,
			})
			return
		}
		c.JSON(200, gin.H{
			"error":   "Credenciales de docente incorrectas",
			"success": "",
		})
		return
	}

	if log.Rol == "0" {
		var bandera bool
		connection.DB.QueryRow(fmt.Sprintf(`SELECT exists(select carnet,contrasenia 
			from estudiante
			where carnet=%s AND contrasenia='%s')`, log.User, log.Password)).Scan(&bandera)
		if bandera {
			c.JSON(200, gin.H{
				"error":   "",
				"success": true,
			})
			return
		}
		c.JSON(200, gin.H{
			"error":   "Credenciales de estudiante incorrectas",
			"success": "",
		})
	}
}
