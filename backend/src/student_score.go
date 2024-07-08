package src

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type student_score struct {
	CourseId      string `json:"course_id"`
	Semester      string `json:"semester"`
	CourseSection string `json:"course_section"`
	StudentId     string `json:"student_id"`
	Score         string `json:"score"` // Nota obtenida por el estudiante
	CareerId      string `json:"career_id"`
}

func Score(c *gin.Context) {
	var student_score student_score
	c.BindJSON(&student_score)

	_, err := connection.DB.Exec(fmt.Sprintf("call ingresarNota(%s, '%s', '%s', %s, %s, %s)",
		student_score.CourseId,
		student_score.Semester,
		student_score.CourseSection,
		student_score.StudentId,
		student_score.Score,
		student_score.CareerId,
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
			"Se ingresó la nota %s para el estudiante %s en el curso %s",
			student_score.Score,
			student_score.StudentId,
			student_score.CourseId,
		),
	})
}
