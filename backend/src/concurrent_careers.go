package src

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type concurrent_career struct {
	StudentId string `json:"student_id"`
	CareerId  string `json:"career_id"`
}

func AssignConcurrentCareer(c *gin.Context) {
	var concurrent_career concurrent_career
	c.BindJSON(&concurrent_career)

	_, err := connection.DB.Exec(fmt.Sprintf("call simultaneaEstudiante(%s, %s)",
		concurrent_career.StudentId,
		concurrent_career.CareerId,
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
			"Se inscribió a %s en la carrera %s",
			concurrent_career.StudentId,
			concurrent_career.CareerId,
		),
	})
}
