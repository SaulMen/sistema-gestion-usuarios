package getdata

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type approvedCourse struct {
	Id               string `json:"id"`
	Name             string `json:"name"`
	CompletedCredits string `json:"completed_credits"` // Créditos obtenidos
	Score            string `json:"score"`             // Nota que se obtenida
	ApprovalDate     string `json:"approval_date"`     // Fecha en que se aprobó el curso
}

func GetApprovedCourses(c *gin.Context) {
	studentId := c.Query("studentId")
	careerId := c.Query("careerId")
	rows, err := connection.DB.Query(fmt.Sprintf("SELECT * FROM cursosAprobados(%s, %s)", studentId, careerId))
	if err != nil {
		c.JSON(400, gin.H{
			"error":   err.(*pq.Error).Message,
			"success": "",
		})
		return
	}
	defer rows.Close()

	var approvedCourses []approvedCourse
	var approvedCourse approvedCourse
	for rows.Next() {
		rows.Scan(
			&approvedCourse.Id,
			&approvedCourse.Name,
			&approvedCourse.CompletedCredits,
			&approvedCourse.Score,
			&approvedCourse.ApprovalDate,
		)
		approvedCourses = append(approvedCourses, approvedCourse)
	}

	if approvedCourses == nil {
		c.JSON(200, gin.H{
			"error":   "",
			"success": []string{},
		})
		return
	}

	fmt.Println(approvedCourses)
	c.JSON(200, gin.H{
		"error":   "",
		"success": approvedCourses,
	})
}
