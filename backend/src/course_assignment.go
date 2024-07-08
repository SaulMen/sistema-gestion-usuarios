package src

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type assignment struct {
	CourseId      string `json:"course_id"`
	Semester      string `json:"semester"`
	CourseSection string `json:"course_section"`
	StudentId     string `json:"student_id"`
	CareerId      string `json:"career_id"`
}

func CourseAssignment(c *gin.Context) {
	var assignment assignment
	c.BindJSON(&assignment)

	_, err := connection.DB.Exec(fmt.Sprintf("call asignarCurso(%s, '%s', '%s', %s, %s)",
		assignment.CourseId,
		assignment.Semester,
		assignment.CourseSection,
		assignment.StudentId,
		assignment.CareerId,
	))

	if err != nil {
		c.JSON(200, gin.H{
			"error":   err.(*pq.Error).Message,
			"success": "",
		})
		return
	}

	c.JSON(200, gin.H{
		"error": "",
		"success": fmt.Sprintf(
			"%s se asignó al curso %s con éxito",
			assignment.StudentId,
			assignment.CourseId,
		),
	})
}
