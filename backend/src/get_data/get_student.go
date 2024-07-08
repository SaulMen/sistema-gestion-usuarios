package getdata

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type student struct {
	Id               string   `json:"id"`
	Name             string   `json:"fullname"`
	DateOfBirth      string   `json:"date_birth"`
	Email            string   `json:"email"`
	PhoneNumber      string   `json:"phone_number"`
	Address          string   `json:"address"`
	DPI              string   `json:"dpi"`
	Career           []string `json:"career"`
	CompletedCredits string   `json:"completed_credits"`
}

func GetStudent(c *gin.Context) {
	studentId := c.Query("studentId")
	rows, err := connection.DB.Query(fmt.Sprintf("SELECT * FROM consultaEstudiante(%s)", studentId))
	if err != nil {
		c.JSON(400, gin.H{
			"error":   err.(*pq.Error).Message,
			"success": "",
		})
		return
	}
	defer rows.Close()

	var student student
	// Se utiliza un auxiliar por las carreras simultáneas
	var careers []string
	var career string
	for rows.Next() {
		rows.Scan(
			&student.Id,
			&student.Name,
			&student.DateOfBirth,
			&student.Email,
			&student.PhoneNumber,
			&student.Address,
			&student.DPI,
			&career,
			&student.CompletedCredits,
		)
		careers = append(careers, career)
	}
	// Actualiza el arreglo de carreras en el struct
	student.Career = careers

	c.JSON(200, gin.H{
		"error":   "",
		"success": student,
	})
}
