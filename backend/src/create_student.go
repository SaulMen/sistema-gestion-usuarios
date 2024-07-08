package src

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type student struct {
	Carnet    string `json:"carnet"`
	Names     string `json:"names"`
	Lastname  string `json:"lastname"`
	Date      string `json:"date"`
	Email     string `json:"email"`
	Phone     string `json:"phone"`
	Direction string `json:"direccion"`
	Dpi       string `json:"dpi"`
	Carrer    string `json:"career"`
	Password  string `json:"password"`
}

func StudentReg(c *gin.Context) {
	var student student
	c.BindJSON(&student)
	_, err := connection.DB.Exec(fmt.Sprintf("call registrarEstudiante(%s,'%s','%s','%s','%s','%s','%s',%s,%s,'%s');",
		student.Carnet,
		student.Names,
		student.Lastname,
		student.Date,
		student.Email,
		student.Phone,
		student.Direction,
		student.Dpi,
		student.Carrer,
		student.Password))
	if err != nil {
		c.JSON(400, gin.H{
			"error":   err.(*pq.Error).Message,
			"success": "",
		})
		return
	}
	c.JSON(200, gin.H{
		"error":   "",
		"success": fmt.Sprintf("El estudiante %s ha sido registrado", student.Carnet),
	})

}
