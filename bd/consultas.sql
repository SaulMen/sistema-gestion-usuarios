-- -----------------------------------------------------
--              Consultar PENSUM 
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION consultaPensum(
    carrera_estudiante_in INT
)
	RETURNS TABLE (
        codigo_curso    INT,
        nombre_curso    VARCHAR,
        creditos_otorga INT,
        creditos_necesarios  INT,
        obligatorio     TEXT
    )
    LANGUAGE plpgsql
    AS $$
    BEGIN
        return QUERY
        SELECT c.codigo_curso, c.nombre, c.creditos_otorga, c.creditos_necesarios, 
        CASE WHEN c.obligatorio = true THEN 'SI' ELSE 'NO' END AS obligatorio
        FROM curso c, cursocarrera cc 
        WHERE c.codigo_curso = cc.codigo_curso
        AND (cc.id_carrera = carrera_estudiante_in or cc.id_carrera = 1);
    END;
$$;

-- -----------------------------------------------------
--              Consultar ESTUDIANTE 
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION consultaEstudiante(
    carnet_in INT
)
	RETURNS TABLE (
        carnet              INT,
        nombre_completo     TEXT,
        fecha_nac           TEXT,
        correo              VARCHAR(40),
        telefono            VARCHAR(8),
        direccion           VARCHAR(80),
        dpi                 BIGINT,
        nombre_carrera      TEXT,
        creditos_ganados    INT
    )
    LANGUAGE plpgsql
    AS $$
    BEGIN
        IF NOT ExisteCarnet(carnet_in) THEN
            RAISE EXCEPTION 'El numero de carnet no existe';
        END IF;

        return QUERY
        SELECT e.carnet, 
        concat(e.nombres,' ', e.apellidos) AS nombre_completo,
        to_char(e.fecha_nac, 'DD-MM-YYYY'),
        e.correo,
        e.telefono,
        e.direccion,
        e.dpi,
        concat(c.id_carrera,' - ',c.nombre_carrera) AS nombre_carrera,
        s.creditos_ganados
        FROM estudiante e, simultaneidad s, carrera c 
        WHERE e.carnet = carnet_in
        AND s.carnet = carnet_in
        AND c.id_carrera = s.id_carrera;
    END;
$$;

-- -----------------------------------------------------
--              Consultar DOCENTE 
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION consultaDocente(
    siif_in INT
)
	RETURNS TABLE (
        siif                INT,
        nombre_completo     TEXT,
        fecha_nac           TEXT,
        correo              VARCHAR(40),
        telefono            VARCHAR(8),
        direccion           VARCHAR(80),
        dpi                 BIGINT
    )
    LANGUAGE plpgsql
    AS $$
    BEGIN
        IF NOT ExisteDocente(siif_in) THEN
            RAISE EXCEPTION 'El SIIF del docente no existe';
        END IF;

        return QUERY
        SELECT d.siif, 
        concat(d.nombres,' ', d.apellidos) AS nombre_completo, 
        to_char(d.fecha_nac, 'DD-MM-YYYY'),
        d.correo,
        d.telefono,
        d.direccion,
        d.dpi 
        FROM docente d
        WHERE d.siif = siif_in;
    END;
$$;


-- -----------------------------------------------------
--          Consultar ESTUDIANTES ASIGNADOS
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION consultaAsignados(
    codigo_in INT,
    ciclo_in VARCHAR(2),
    anio_in VARCHAR(4),
    seccion_in VARCHAR(1)
)
	RETURNS TABLE (
        carnet              INT,
        nombre_completo     TEXT,
        nombre_carrera      VARCHAR(40)
    )
    LANGUAGE plpgsql
    AS $$
    BEGIN

        IF NOT ExisteCurso(codigo_in) THEN
            RAISE EXCEPTION 'El codigo de curso "%" no existe', codigo_in;
        END IF;

        return QUERY
        SELECT a.carnet,
        concat(e.nombres,' ', e.apellidos) AS nombre_completo,
        c.nombre_carrera 
        FROM asignacion a, estudiante e, carrera c 
        WHERE a.codigo_curso = 101
        AND a.ciclo = ciclo_in
        AND a.anio = anio_in
        AND a.seccion = UPPER(seccion_in)
        AND a.carnet = e.carnet 
        AND a.id_carrera = c.id_carrera;
    END;
$$;


-- -----------------------------------------------------
--              Consultar APROBACIONES
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION consultaAprobacion(
    codigo_in INT,
    ciclo_in VARCHAR(2),
    anio_in VARCHAR(4),
    seccion_in VARCHAR(1)
)
	RETURNS TABLE (
        carnet              INT,
        nombre_completo     TEXT,
        estado              TEXT
    )
    LANGUAGE plpgsql
    AS $$
    BEGIN

        IF NOT ExisteCurso(codigo_in) THEN
            RAISE EXCEPTION 'El codigo de curso "%" no existe', codigo_in;
        END IF;

        return QUERY
        SELECT n.carnet, 
        concat(e.nombres,' ', e.apellidos) AS nombre_completo,
        CASE WHEN n.nota >= 61 THEN 'APROBADO' ELSE 'DESAPROBADO' END AS estado
        FROM nota n, estudiante e
        where n.codigo_curso = codigo_in
        and n.ciclo  = ciclo_in
        and n.anio  = anio_in
        and n.seccion = UPPER(seccion_in)
        and n.carnet  = e.carnet;
    END;
$$;

-- -----------------------------------------------------
--                  Consultar ACTAS
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION consultar_acta(codigo_curso_h integer)
    RETURNS TABLE(
        codigo_curso    INT,
        seccion     VARCHAR(1),
        ciclo       TEXT,
        anio        TEXT,
        asignados   INT,
        fecha       TEXT
    )
LANGUAGE plpgsql
AS
$$
BEGIN
    IF NOT ExisteCurso(codigo_curso_h) THEN
        RAISE EXCEPTION 'El curso "%" no existe',codigo_curso_h;
    END IF;
   
    RETURN QUERY
        SELECT 
        c.codigo_curso,
        c.seccion,
        CASE
            WHEN c.ciclo = 'VJ' THEN 'Vacaciones Junio'
            WHEN c.ciclo = 'VD' THEN 'Vacaciones Diciembre'
            WHEN c.ciclo = '1S' THEN 'Primer Semestre'
            ELSE 'Segundo Semestre'
        END AS ciclo,
        to_char(c.fecha_creacion, 'YYYY'),
        hc.cantidad_asignados,
        to_char(c.fecha_creacion, 'DD/MM/YYYY HH24:MI:SS') AS fecha_creacion
        FROM acta c,habilitarcurso hc
        WHERE c.codigo_curso = codigo_curso_h
        AND c.codigo_curso = hc.codigo_curso
        AND c.ciclo = hc.ciclo
        AND c.seccion = hc.seccion
        AND to_char(c.fecha_creacion, 'YYYY') = hc.anio
        ORDER BY c.fecha_creacion ASC;
END
$$;


-- -----------------------------------------------------
--           Consultar cursos aprobados 
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION cursosAprobados(
    carnet_in INT,
    carrera_estudiante_in INT
)
	RETURNS TABLE (
        codigo_curso INT,
        nombre_curso VARCHAR,
        creditos_otorga INT,
        nota INT,
        fecha_aprobado TEXT
    )
    LANGUAGE plpgsql
    AS $$
    BEGIN
        IF NOT ExisteCarnet(carnet_in) THEN
            RAISE EXCEPTION 'El carnet "%" no existe', carnet_in;
        END IF;

        return QUERY
        SELECT n.codigo_curso, c.nombre, c.creditos_otorga,  n.nota, concat(n.ciclo, n.anio) AS fecha_aprobado
        FROM nota n, curso c  
        WHERE n.nota >= 61
        AND n.carnet = carnet_in
        AND n.id_carrera = carrera_estudiante_in
        AND n.codigo_curso  = c.codigo_curso;
    END;
$$;
