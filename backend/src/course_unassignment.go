package src

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type unassignment struct {
	CourseId      string `json:"course_id"`
	Semester      string `json:"semester"`
	CourseSection string `json:"course_section"`
	StudentId     string `json:"student_id"`
	CareerId      string `json:"career_id"`
}

func CourseUnassignment(c *gin.Context) {
	var unassignment unassignment
	c.BindJSON(&unassignment)

	_, err := connection.DB.Exec(fmt.Sprintf("call desasignarCurso(%s, '%s', '%s', %s, %s)",
		unassignment.CourseId,
		unassignment.Semester,
		unassignment.CourseSection,
		unassignment.StudentId,
		unassignment.CareerId,
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
			"%s se desasignó del curso %s con éxito",
			unassignment.StudentId,
			unassignment.CourseId,
		),
	})
}
