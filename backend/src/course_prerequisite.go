package src

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type prerequisite struct {
	CourseId       string `json:"course_id"`       // Curso principal
	PrerequisiteId string `json:"prerequisite_id"` // Curso prerrequisito
}

func AddCoursePrerequisite(c *gin.Context) {
	var prerequisite prerequisite
	c.BindJSON(&prerequisite)

	_, err := connection.DB.Exec(fmt.Sprintf("call crearPrerequisito(%s, %s)",
		prerequisite.CourseId,
		prerequisite.PrerequisiteId,
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
			"Se agregó el curso %s como prerrequisito para el curso  %s",
			prerequisite.PrerequisiteId,
			prerequisite.CourseId,
		),
	})
}
