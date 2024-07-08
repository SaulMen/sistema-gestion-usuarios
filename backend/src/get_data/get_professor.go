package getdata

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type professor struct {
	Id          string `json:"id"`
	Name        string `json:"fullname"`
	DateOfBirth string `json:"date_birth"`
	Email       string `json:"email"`
	PhoneNumber string `json:"phone_number"`
	Address     string `json:"address"`
	DPI         string `json:"dpi"`
}

func GetProfessor(c *gin.Context) {
	professorId := c.Query("professorId")
	row := connection.DB.QueryRow(fmt.Sprintf("SELECT * FROM consultaDocente(%s)", professorId))

	var professor professor
	if err := row.Scan(&professor.Id, &professor.Name, &professor.DateOfBirth,
		&professor.Email, &professor.PhoneNumber, &professor.Address, &professor.DPI); err != nil {

		c.JSON(400, gin.H{
			"error":   err.(*pq.Error).Message,
			"success": "",
		})
		return
	}

	c.JSON(200, gin.H{
		"error":   "",
		"success": professor,
	})
}
