package getdata

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
)

type studentcourse struct {
	CourseId      string `json:"codigo"`
	CourseName    string `json:"nombre"`
	CourseSection string `json:"seccion"`
	Professor     string `json:"profesor"`
}

type data struct {
	Carnet string `json:"carnet"`
	Ciclo  string `json:"ciclo"`
	Anio   string `json:"anio"`
}

func StudentCourses(c *gin.Context) {
	var std data
	c.BindJSON(&std)

	rows, err := connection.DB.Query(fmt.Sprintf(`
	select a.codigo_curso,
	c.nombre,
	a.seccion,
	concat(d.nombres,' ', d.apellidos) as docente
	from asignacion a, curso c, habilitarcurso h, docente d
	where a.anio = '%s'
	and a.ciclo = '%s'
	and a.carnet = %s
	and a.codigo_curso = c.codigo_curso
	and c.codigo_curso = h.codigo_curso
	and h.ciclo = '%s'
	and h.anio = '%s'
	and h.seccion = a.seccion
	and d.siif = h.siif
	`, std.Anio, std.Ciclo, std.Carnet, std.Ciclo, std.Anio))
	if err != nil {
		c.JSON(200, gin.H{
			"error":   "Error en el servidor",
			"success": "",
		})
		return
	}
	var lista []studentcourse
	var course studentcourse
	for rows.Next() {
		rows.Scan(&course.CourseId, &course.CourseName, &course.CourseSection, &course.Professor)
		lista = append(lista, course)
	}

	c.JSON(200, gin.H{
		"error":   "",
		"success": lista,
	})
}
