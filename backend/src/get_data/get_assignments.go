package getdata

import (
	"fmt"
	"main/connection"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type assignment struct {
	StudentId string `json:"student_id"`
	Name      string `json:"name"`   // Nombre del estudiante
	Career    string `json:"career"` // Carrera del estudiante
}

func GetAssignments(c *gin.Context) {
	courseId := strings.Trim(c.Query("courseId"), "\"")
	semester := strings.Trim(c.Query("semester"), "\"")
	year := strings.Trim(c.Query("year"), "\"")
	section := strings.Trim(c.Query("section"), "\"") // Section del curso

	rows, err := connection.DB.Query(fmt.Sprintf(
		"SELECT * FROM consultaAsignados(%s,'%s','%s','%s')",
		courseId,
		semester,
		year,
		section,
	))
	if err != nil {
		c.JSON(400, gin.H{
			"error":   err.(*pq.Error).Message,
			"success": "",
		})
		return
	}
	defer rows.Close()

	var assignments []assignment
	var assignment assignment
	for rows.Next() {
		rows.Scan(&assignment.StudentId, &assignment.Name, &assignment.Career)
		assignments = append(assignments, assignment)
	}

	if assignments == nil {
		c.JSON(200, gin.H{
			"error":   "",
			"success": []string{},
		})
		return
	}

	c.JSON(200, gin.H{
		"error":   "",
		"success": assignments,
	})
}
