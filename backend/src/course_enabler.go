package src

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type courseEnabler struct {
	CourseId           string `json:"course_id"`
	Semester           string `json:"semester"`
	ProfessorId        string `json:"professor_id"` //SIIF del profesor
	EnrollmentCapacity string `json:"enrollment_capacity"`
	CourseSection      string `json:"course_section"`
}

func AddCourse(c *gin.Context) {
	var course courseEnabler
	c.BindJSON(&course)

	_, err := connection.DB.Exec(fmt.Sprintf("call habilitarCurso(%s,'%s',%s,%s,'%s')",
		course.CourseId,
		course.Semester,
		course.ProfessorId,
		course.EnrollmentCapacity,
		course.CourseSection,
	))

	if err != nil {
		c.JSON(200, gin.H{
			"error":   err.(*pq.Error).Message,
			"success": "",
		})
		return
	}

	c.JSON(200, gin.H{
		"error":   "",
		"success": fmt.Sprintf("El curso %s ha sido habilitado para asignación", course.CourseId),
	})
}
