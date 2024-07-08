-- -----------------------------------------------------
--          Procedimiento para crear carrera
-- -----------------------------------------------------
CREATE OR REPLACE PROCEDURE crearCarrera(nombre_in VARCHAR(40))
    LANGUAGE plpgsql
    AS $$
    BEGIN
    
        IF UPPER(nombre_in) = 'AREA COMUN' then
            RAISE EXCEPTION 'El area comun se crea automaticamente';
            END IF;
        
        IF NOT ExisteNombreCarrera('AREA COMUN') THEN
            INSERT INTO Carrera(nombre_carrera) VALUES ( 'AREA COMUN' );
        END IF;

        IF NOT SoloLetras(nombre_in) THEN
            RAISE EXCEPTION 'El nombre de la carrera solo debe contener letras';
        END IF;
    
        IF ExisteNombreCarrera(UPPER(nombre_in)) THEN
            RAISE EXCEPTION 'La carrera % ya existe', nombre_in;
        END IF;

        INSERT INTO Carrera(nombre_carrera) VALUES ( UPPER(nombre_in) );

        RAISE NOTICE 'Carrera "%" creada', UPPER(nombre_in);
    END;
$$;


-- -----------------------------------------------------
--       Procedimiento para registrar Estudiante
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE registrarEstudiante(
    carnet_in INT,
    nombres_in VARCHAR(40),
    apellidos_in VARCHAR(40),
    fecha_nac_in VARCHAR(20),
    correo_in VARCHAR(40),
    telefono_in VARCHAR(8),
    direccion_in VARCHAR(80),
    dpi_in BIGINT,
    idcarrera_in INT,
    contrasenia_in VARCHAR(25)
)
    LANGUAGE plpgsql
    AS $$
    DECLARE
        fechaTdate DATE;
    BEGIN
        fechaTdate := TO_DATE(fecha_nac_in, 'DD-MM-YYYY');

        IF ExisteCarnet(carnet_in) THEN
            RAISE EXCEPTION 'El numero de carnet ya existe';
        END IF;

        IF NOT SoloLetras(nombres_in) THEN
            RAISE EXCEPTION 'El nombre solo debe contener letras';
        END IF;

        IF NOT ValidarCorreo(correo_in) THEN
            RAISE EXCEPTION 'El formato del correo no es valido';
        END IF;

        IF NOT ExisteCarrera(idcarrera_in) THEN
            RAISE EXCEPTION 'La carrera no existe';
        END IF;

        IF idcarrera_in <= 1 THEN
            RAISE EXCEPTION 'La carrera 1 esta reservada para área comun';
        END IF;

        INSERT INTO Estudiante(carnet, contrasenia, nombres, apellidos, fecha_nac, correo, telefono, direccion, dpi, fecha_creacion, estado) 
        VALUES (carnet_in, contrasenia_in, nombres_in, apellidos_in, fechaTdate, correo_in, telefono_in, direccion_in, dpi_in, CURRENT_TIMESTAMP, TRUE);

        INSERT INTO Simultaneidad(carnet, id_carrera, creditos_ganados) 
        VALUES (carnet_in, idcarrera_in, 0);

        RAISE NOTICE 'El estudiante "%" ha sido registrado', carnet_in;
    END;
$$;

-- -----------------------------------------------------
--     Procedimiento para simultanea de estudiante
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE simultaneaEstudiante(
    carnet_in INT,
    idcarrera_in INT
)
    LANGUAGE plpgsql
    AS $$
    BEGIN
        
        IF NOT ExisteCarnet(carnet_in) THEN
            RAISE EXCEPTION 'El numero de carnet no existe';
        END IF;

        IF NOT ExisteCarrera(idcarrera_in) THEN
            RAISE EXCEPTION 'La carrera no existe';
        END IF;

        INSERT INTO Simultaneidad(carnet, id_carrera, creditos_ganados) 
        VALUES (carnet_in, idcarrera_in, 0);

        RAISE NOTICE 'El estudiante "%" tiene nueva carrera simultanea', carnet_in;
    END;
$$;


-- -----------------------------------------------------
--       Procedimiento para registrar Docente
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE registrarDocente(
    siif_in INT,
    nombres_in VARCHAR(40),
    apellidos_in VARCHAR(40),
    fecha_nac_in VARCHAR(20),
    correo_in VARCHAR(40),
    telefono_in VARCHAR(8),
    direccion_in VARCHAR(80),
    dpi_in BIGINT,
    contrasenia_in VARCHAR(25)
)
LANGUAGE plpgsql
    AS $$
    DECLARE
        fechaTdate DATE;
    BEGIN
        fechaTdate := TO_DATE(fecha_nac_in, 'DD-MM-YYYY');

        IF ExisteDocente(siif_in) THEN
            RAISE EXCEPTION 'El SIIF del docente ya existe';
        END IF;

        IF NOT ValidarCorreo(correo_in) THEN
            RAISE EXCEPTION 'El formato del correo no es válido';
        END IF;

        INSERT INTO Docente(siif, contrasenia, nombres, apellidos, fecha_nac, correo, telefono, direccion, dpi, fecha_creacion) 
        VALUES (siif_in, contrasenia_in, nombres_in, apellidos_in, fechaTdate, correo_in, telefono_in, direccion_in, dpi_in, CURRENT_TIMESTAMP);

        RAISE NOTICE 'El docente "%" ha sido registrado', nombres_in;
    END;
$$;


-- -----------------------------------------------------
--          Procedimiento para registrar curso
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE crearCurso(
    codigo_in INT,
    nombre_in VARCHAR(100),
    creditosnec_in INT,
    creditosotor_in INT,
    obligatorio_in BOOLEAN
)
    LANGUAGE plpgsql
    AS $$
    BEGIN
        IF ExisteCurso(codigo_in) THEN
            RAISE EXCEPTION 'El codigo de curso "%" ya existe', codigo_in;
        END IF;

        IF NOT ValidarEnteroPositivo(creditosnec_in) THEN
            RAISE EXCEPTION 'Los creditos necesarios deben ser enteros positivos';
        END IF;

        IF NOT ValidarEnteroPositivo(creditosotor_in) THEN
            RAISE EXCEPTION 'Los creditos que otorga deben ser enteros positivos';
        END IF;

        INSERT INTO Curso(codigo_curso, nombre, creditos_necesarios, creditos_otorga, obligatorio) 
        VALUES (codigo_in, nombre_in, creditosnec_in, creditosotor_in, obligatorio_in);       

        RAISE NOTICE 'El curso "%" ha sido creado', nombre_in;
    END;
$$;

-- -----------------------------------------------------
--   Procedimiento para asignar carrera a un curso
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE perteneceCurso(
    codigo_in INT,
    idcarrera_in INT
)
    LANGUAGE plpgsql
    AS $$
    BEGIN

        IF NOT ExisteCurso(codigo_in) THEN
            RAISE EXCEPTION 'El codigo de curso "%" no existe', codigo_in;
        END IF;

        IF NOT ExisteCarrera(idcarrera_in) THEN
            RAISE EXCEPTION 'La carrera a la que pertenecera el curso no existe';
        END IF;

        INSERT INTO CursoCarrera(codigo_curso, id_carrera)
        VALUES (codigo_in, idcarrera_in);

        RAISE NOTICE 'Se asigno nueva carrera al curso "%"', codigo_in;
    END;
$$;
-- -----------------------------------------------------
--     Procedimiento para prerequisito de curso
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE crearPrerequisito(
    codigo_curso_in INT,
    codigo_prerequisito_in INT
)
LANGUAGE plpgsql
    AS $$
    BEGIN
        
        IF NOT ExisteCurso(codigo_curso_in) THEN
            RAISE EXCEPTION 'El codigo de curso "%" no existe', codigo_curso_in;
        END IF;

        IF NOT ExisteCurso(codigo_prerequisito_in) THEN
            RAISE EXCEPTION 'El codigo de curso prerequisito "%" no existe', codigo_prerequisito_in;
        END IF;

        INSERT INTO Prerequistos(codigo_curso, pre_requisito) 
        VALUES (codigo_curso_in, codigo_prerequisito_in);

        RAISE NOTICE 'El curso "%" ahora tiene como prerequisto a %', codigo_curso_in, codigo_prerequisito_in;
    END;
$$;


-- -----------------------------------------------------
--       Procedimiento para habilitar curso
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE habilitarCurso(
    cursocodigo_in  INT,
    ciclo_in        VARCHAR(2),
    siif_in         INT,
    cupo_in         INT,
    seccion_in      VARCHAR(1)
)
LANGUAGE plpgsql
    AS $$
    DECLARE
        anio_habil VARCHAR(4);
        seccion_existe INT;
    BEGIN
        anio_habil := EXTRACT(YEAR FROM CURRENT_DATE);

        IF NOT ExisteCurso(cursocodigo_in) THEN
            RAISE EXCEPTION 'El curso "%" no existe', cursocodigo_in;
        END IF;

        IF NOT ValidarCiclo(ciclo_in) THEN
            RAISE EXCEPTION 'El formato del ciclo "%" no es válido', ciclo_in;
        END IF;

        IF NOT ExisteDocente(siif_in) THEN
            RAISE EXCEPTION 'El docente no existe';
        END IF;

        IF NOT ValidarEnteroPositivo(cupo_in) THEN
            RAISE EXCEPTION 'El cupo máximo debe ser un número entero positivo';
        END IF;

        IF NOT ValidarLetraSeccion(seccion_in) THEN
            RAISE EXCEPTION 'La sección debe ser una letra';
        END IF;

        SELECT COUNT(*) INTO seccion_existe
        FROM HabilitarCurso ch
        WHERE ch.codigo_curso = cursocodigo_in AND ch.ciclo = UPPER(ciclo_in) 
        AND ch.seccion = UPPER(seccion_in) AND ch.anio = anio_habil;

        IF seccion_existe <> 0 THEN
            RAISE EXCEPTION 'La sección "%" ya existe para el curso "%"', seccion_in, cursocodigo_in;
        END IF;

        INSERT INTO HabilitarCurso(anio, cantidad_asignados, codigo_curso, ciclo, siif, cupo_maximo, acta_generada, seccion) 
        VALUES (anio_habil, 0, cursocodigo_in, UPPER(ciclo_in), siif_in, cupo_in, FALSE, UPPER(seccion_in));

        RAISE NOTICE 'El curso "%" se ha habilitado correctamente', cursocodigo_in;
    END;
$$;

-- -----------------------------------------------------
--       Procedimiento para registrar Horario
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE agregarHorario(
    nombre_in       VARCHAR(100),
    id_habilitado_in INT, 
    siif_in         INT,
    nombre_aux_in   VARCHAR(50),
    ubicacion_in    VARCHAR(50),
    dia_in          INT, 
    hora_in         VARCHAR(18)
)
LANGUAGE plpgsql
AS $$
DECLARE
    hora_inicio TIME;
    hora_fin TIME;
BEGIN
    IF NOT existeidHabilitado(id_habilitado_in) THEN
        RAISE EXCEPTION 'El ID del curso habilitado no existe';
    END IF;

    IF NOT ValidarDia(dia_in) THEN
        RAISE EXCEPTION 'El día no está dentro del dominio [1-6] revise %', dia_in;
    END IF;

    IF NOT ExisteDocente(siif_in) THEN
        RAISE EXCEPTION 'El docente no existe';
    END IF;

    IF NOT ExisteNombreCurso(nombre_in) THEN
        RAISE EXCEPTION 'El curso "%" no existe', nombre_in;
    END IF;

    IF NOT ValidarHora(hora_in) THEN
        RAISE EXCEPTION 'El formato de la hora debe ser HH:MM-HH:MM revise %', hora_in;
    END IF;

    hora_inicio := CAST(SPLIT_PART(hora_in, '-', 1) AS TIME);
    hora_fin := CAST(SPLIT_PART(hora_in, '-', 2) AS TIME);

    IF EXISTS (SELECT 1 
        FROM horario h 
        WHERE h.hora = hora_in
        AND h.dia = dia_in
        AND h.ubicacion = ubicacion_in) THEN
        RAISE EXCEPTION 'Este horario ya esta en uso, cambie el edificio, hora o dia';
    END IF;

    INSERT INTO Horario(nombre, id_habilitado, siif, nombre_aux, ubicacion, dia, hora) 
    VALUES ( nombre_in, id_habilitado_in, siif_in, nombre_aux_in, ubicacion_in, dia_in, hora_in);
    
    RAISE NOTICE 'El horario de % hasta % se agregó correctamente', hora_inicio, hora_fin;
END;
$$;

-- -----------------------------------------------------
--       Procedimiento para asignar Curso
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE asignarCurso(
    codigo_in             INT,
    ciclo_in            VARCHAR(2),
    seccion_in          VARCHAR(1),
    carnet_in             INT,
    carrera_estudiante_in INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    asignados_temp INT;
    cupo_temp INT;
    carrera_curso INT;
    creditos_nec INT;
    creditos_estudiante INT;
    anio_actual VARCHAR(4);
    idcursohabilitado_temp INT;
    pre_requisito_temp INT;
    nota_prerequisito_temp INT;

BEGIN
    anio_actual := EXTRACT(YEAR FROM CURRENT_DATE);
    idcursohabilitado_temp := 0;

    IF NOT ExisteCurso(codigo_in) THEN
        RAISE EXCEPTION 'El curso "%" no existe', codigo_in;
    END IF;

    IF NOT ValidarCiclo(ciclo_in) THEN
        RAISE EXCEPTION 'El formato del ciclo no es válido';
    END IF;

    IF NOT ValidarLetraSeccion(UPPER(seccion_in)) THEN
        RAISE EXCEPTION 'La sección debe ser una letra';
    END IF;

    IF NOT ExisteCarnet(carnet_in) THEN
        RAISE EXCEPTION 'El carnet "%" no existe', carnet_in;
    END IF;

    IF EXISTS (SELECT 1 FROM Nota N
                   WHERE n.carnet = carnet_in
                   AND n.codigo_curso = codigo_in
                   AND n.id_carrera = carrera_estudiante_in
                   AND n.nota >= 61) THEN
        RAISE EXCEPTION 'El estudiante ya tiene aprobado este curso';
    END IF;


    IF YaAsignado(codigo_in, ciclo_in, carnet_in, UPPER(seccion_in), anio_actual) THEN
        RAISE EXCEPTION 'El estudiante "%" ya se encuentra asignado al curso "%"', carnet_in, codigo_in;
    END IF;

    IF NOT EXISTS (SELECT 1 
        FROM HabilitarCurso ch
        WHERE ch.codigo_curso = codigo_in
        AND ch.ciclo = UPPER(ciclo_in)
        AND ch.anio = anio_actual
        AND ch.seccion = UPPER(seccion_in)) THEN

        RAISE EXCEPTION 'No hay curso habilitado para esta asignación';
    END IF;

    SELECT ch.id_habilitado INTO idcursohabilitado_temp
    FROM HabilitarCurso ch
    WHERE ch.codigo_curso = codigo_in
    AND ch.ciclo = UPPER(ciclo_in)
    AND ch.anio = anio_actual
    AND ch.seccion = UPPER(seccion_in);

    IF NOT EXISTS (SELECT 1
                FROM cursocarrera c 
                WHERE c.codigo_curso = codigo_in
                AND (c.id_carrera = carrera_estudiante_in or c.id_carrera =1)) THEN
        RAISE EXCEPTION 'El estudiante no se puede asignar un curso de otra carrera';
    END IF;

    -- --------- PREREQUISTO -----------
    
    IF EXISTS (SELECT 1 FROM prerequistos p WHERE p.codigo_curso = codigo_in) THEN
        SELECT p.pre_requisito INTO pre_requisito_temp
        FROM prerequistos p
        WHERE p.codigo_curso = codigo_in;

        IF NOT EXISTS (SELECT 1 FROM Nota N
                   WHERE n.carnet = carnet_in
                   AND n.codigo_curso = pre_requisito_temp
                   AND n.id_carrera = carrera_estudiante_in
                   AND n.nota >= 61) THEN
            RAISE EXCEPTION 'El estudiante % no a aprobado el prerequisto "%"', carnet_in, pre_requisito_temp;
        END IF;
    END IF;

    -- --------- Creditos Necesarios ---------

    SELECT c.creditos_necesarios INTO creditos_nec
    FROM Curso c
    WHERE c.codigo_curso = codigo_in;

    SELECT s.creditos_ganados INTO creditos_estudiante
    FROM Simultaneidad s
    WHERE s.carnet = carnet_in
    AND s.id_carrera = carrera_estudiante_in;

    IF creditos_nec > creditos_estudiante THEN
        RAISE EXCEPTION 'No cuenta con los créditos necesarios para asignarse al curso';
    END IF;
   

    SELECT ch.cupo_maximo, ch.cantidad_asignados INTO cupo_temp, asignados_temp
    FROM HabilitarCurso ch
    WHERE ch.id_habilitado = idcursohabilitado_temp;

    IF asignados_temp = cupo_temp THEN
        RAISE EXCEPTION 'Se alcanzó el cupo máximo del curso, no puede asignarse';
    END IF;

    asignados_temp := asignados_temp + 1;

    UPDATE HabilitarCurso SET cantidad_asignados = asignados_temp
    WHERE id_habilitado = idcursohabilitado_temp;

    INSERT INTO Asignacion(codigo_curso, ciclo, seccion, carnet, anio, id_carrera)
    VALUES (codigo_in, ciclo_in, UPPER(seccion_in), carnet_in, anio_actual, carrera_estudiante_in);

    RAISE NOTICE 'El estudiante "%" se asignó correctamente al curso %',  carnet_in, codigo_in;
END;
$$;

-- -----------------------------------------------------
--       Procedimiento para desasignar Curso
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE desasignarCurso(
    codigo_in INT,
    ciclo_in VARCHAR(2),
    seccion_in VARCHAR(1),
    carnet_in INT,
    carrera_estudiante_in INT
)
    LANGUAGE plpgsql
    AS $$
    DECLARE
        no_asignacion           INT;
        cant_asignados          INT;
        idcursohabilitado_temp  INT;
        anio_actual         VARCHAR(4);
    BEGIN
        anio_actual := EXTRACT(YEAR FROM CURRENT_DATE);
        cant_asignados := 0;

        IF NOT ExisteCurso(codigo_in) THEN
            RAISE EXCEPTION 'El curso "%" no existe', codigo_in;
        END IF;

        IF NOT ValidarCiclo(ciclo_in) THEN
            RAISE EXCEPTION 'El formato del ciclo no es válido';
        END IF;

        IF NOT ValidarLetraSeccion(UPPER(seccion_in)) THEN
            RAISE EXCEPTION 'La sección debe ser una letra';
        END IF;

        IF NOT ExisteCarnet(carnet_in) THEN
            RAISE EXCEPTION 'El carnet "%" no existe', carnet_in;
        END IF;

        IF NOT YaAsignado(codigo_in, ciclo_in, carnet_in, UPPER(seccion_in), anio_actual) THEN
            RAISE EXCEPTION 'El carnet "%" debe estar asignado previamente al curso', carnet_in;
        END IF;

        SELECT cantidad_asignados, id_habilitado INTO cant_asignados, idcursohabilitado_temp
        FROM HabilitarCurso
        WHERE codigo_curso = codigo_in 
        AND ciclo = UPPER(ciclo_in) 
        AND anio = anio_actual 
        AND seccion = UPPER(seccion_in);

        cant_asignados := cant_asignados - 1;

        DELETE FROM asignacion
        WHERE codigo_curso = codigo_in
        AND ciclo = ciclo_in
        AND seccion = UPPER(seccion_in)
        AND carnet = carnet_in
        AND anio = anio_actual;

        UPDATE HabilitarCurso SET cantidad_asignados = cant_asignados
        WHERE id_habilitado = idcursohabilitado_temp;

        INSERT INTO Desasignacion(codigo_curso, ciclo, seccion, carnet, anio, id_carrera)
        VALUES (codigo_in, ciclo_in, UPPER(seccion_in), carnet_in, anio_actual, carrera_estudiante_in);

        RAISE NOTICE 'El estudiante "%" se desasignó correctamente del curso "%"', carnet_in, codigo_in;
    END;
$$;

-- -----------------------------------------------------
--       Procedimiento para nota Curso
-- -----------------------------------------------------


CREATE OR REPLACE PROCEDURE ingresarNota(
    codigo_in INT,
    ciclo_in VARCHAR(2),
    seccion_in VARCHAR(1),
    carnet_in INT,
    nota_in DECIMAL,
    carrera_estudiante_in INT
)
LANGUAGE plpgsql
AS $$
DECLARE 
    creditos_otorgados INT;
    nota_rounded INT;
    creditos_estudiante INT;
    anio_actual VARCHAR(4);
BEGIN
    IF NOT ExisteCurso(codigo_in) THEN
        RAISE EXCEPTION 'El curso "%" no existe', codigo_in;
    END IF;

    IF NOT ValidarCiclo(ciclo_in) THEN
        RAISE EXCEPTION 'El formato del ciclo no es válido';
    END IF;

    IF NOT ValidarLetraSeccion(UPPER(seccion_in)) THEN
        RAISE EXCEPTION 'La sección debe ser una letra';
    END IF;

    IF NOT ExisteCarnet(carnet_in) THEN
        RAISE EXCEPTION 'El estudiante "%" no existe', carnet_in;
    END IF;

    anio_actual := EXTRACT(YEAR FROM CURRENT_DATE);

    IF NOT YaAsignado(codigo_in, ciclo_in, carnet_in, UPPER(seccion_in), anio_actual) THEN
        RAISE EXCEPTION 'El estudiante "%" no está asignado al curso "%"', carnet_in, codigo_in;
    END IF;

    nota_rounded := ROUND(nota_in);

    IF nota_rounded < 0 OR nota_rounded > 100 THEN
        RAISE EXCEPTION 'La nota ingresada debe estar en el rango [0-100]';
    END IF;

    IF nota_rounded >= 61 THEN
        SELECT c.creditos_otorga INTO creditos_otorgados
        FROM Curso c
        WHERE c.codigo_curso = codigo_in;

        SELECT s.creditos_ganados INTO creditos_estudiante
        FROM Simultaneidad s
        WHERE s.carnet = carnet_in
        AND s.id_carrera = carrera_estudiante_in;

        creditos_estudiante := creditos_estudiante + creditos_otorgados;

        UPDATE Simultaneidad
        SET creditos_ganados = creditos_estudiante
        WHERE carnet = carnet_in
        AND id_carrera = carrera_estudiante_in;
    END IF;

    INSERT INTO Nota(codigo_curso, ciclo, seccion, carnet, nota, anio, id_carrera) 
    VALUES (codigo_in, ciclo_in, seccion_in, carnet_in, nota_rounded, anio_actual, carrera_estudiante_in);

    RAISE NOTICE 'Se agregó la nota del estudiante "%" correctamente', carnet_in;
END;
$$;

-- -----------------------------------------------------
--       Procedimiento para Acta del Curso
-- -----------------------------------------------------


CREATE OR REPLACE PROCEDURE generarActa(
    codigo_in INT,
    seccion_in VARCHAR(1),
    ciclo_in VARCHAR(2)
)
LANGUAGE plpgsql
AS $$
DECLARE 
    asignados INT;
    notas_ingresadas INT;
    cantidad INT;
    anio_actual VARCHAR(4);
    idcursohabilitado_temp INT;
BEGIN
    IF NOT ExisteCurso(codigo_in) THEN
        RAISE EXCEPTION 'El curso "%" no existe', codigo_in;
    END IF;

    IF NOT ValidarCiclo(ciclo_in) THEN
        RAISE EXCEPTION 'El formato del ciclo no es válido';
    END IF;

    IF NOT ValidarLetraSeccion(UPPER(seccion_in)) THEN
        RAISE EXCEPTION 'La sección debe ser una letra';
    END IF;

    anio_actual := EXTRACT(YEAR FROM CURRENT_DATE);

    IF NOT idHabilitado(codigo_in, ciclo_in, UPPER(seccion_in), anio_actual) THEN
        RAISE EXCEPTION 'El curso habilitado no existe';
    END IF;

    SELECT get_idHabilitado(codigo_in, ciclo_in, UPPER(seccion_in), anio_actual) INTO idcursohabilitado_temp;

    IF ExisteActaCurso(idcursohabilitado_temp) THEN
        RAISE EXCEPTION 'Ya existe un acta para dicho curso, no se puede modificar';
    END IF;

    SELECT h.cantidad_asignados INTO asignados
    FROM habilitarcurso h 
    where h.codigo_curso = codigo_in
    and h.seccion = seccion_in
    and h.ciclo = ciclo_in
    and h.anio  = anio_actual;

    SELECT COUNT(*) INTO notas_ingresadas
    FROM Nota n
    WHERE n.codigo_curso = codigo_in
    AND n.seccion = seccion_in
    AND n.ciclo = ciclo_in
    AND n.anio = anio_actual;

    cantidad := asignados - notas_ingresadas;

    IF asignados != notas_ingresadas THEN
        RAISE EXCEPTION 'Aún hay % estudiantes pendientes con nota', cantidad;
    END IF;

    UPDATE HabilitarCurso SET acta_generada = TRUE
    WHERE id_habilitado = idcursohabilitado_temp;

    INSERT INTO Acta(ciclo, seccion, fecha_creacion, codigo_curso) 
    VALUES (ciclo_in, seccion_in, CURRENT_TIMESTAMP, codigo_in);

    RAISE NOTICE 'Se generó correctamente el acta del curso "%"', codigo_in;
END;
$$;


-- -----------------------------------------------------
--       Procedimiento para cambio de carrera
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE cambioCarrera(
    carnet_in             INT,
    carrera_actual_in     INT,
    carrera_nueva_in      INT
)
LANGUAGE plpgsql
AS $$
DECLARE 
    creditos_actuales INT;
BEGIN
    IF NOT ExisteCarnet(carnet_in) THEN
        RAISE EXCEPTION 'El estudiante "%" no existe', carnet_in;
    END IF;

    IF NOT ExisteCarrera(carrera_nueva_in) THEN
        RAISE EXCEPTION 'La carrera a la que se quiere hacer cambio no existe';
    END IF;   

    SELECT s.creditos_ganados INTO creditos_actuales
    FROM simultaneidad s 
    WHERE s.carnet = carnet_in
    AND s.id_carrera = carrera_actual_in;

    IF creditos_actuales < 20 THEN
        RAISE EXCEPTION 'El estudiante debe poseer como minimo 20 créditos y posee "%"', creditos_actuales;
    END IF; 

    UPDATE Simultaneidad 
    SET id_carrera = carrera_nueva_in,
    creditos_ganados = 0
    WHERE carnet = carnet_in
    AND id_carrera = carrera_actual_in;

    RAISE NOTICE 'El estudiante "%" se cambio de carrera exitosamente', codigo_in;
END;
$$;


-- -----------------------------------------------------
--       Procedimiento para darse de baja
-- -----------------------------------------------------

CREATE OR REPLACE PROCEDURE darseBaja(
    carnet_in     INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT ExisteCarnet(carnet_in) THEN
        RAISE EXCEPTION 'El estudiante "%" no existe', carnet_in;
    END IF;

    UPDATE Estudiante
    SET estado = FALSE
    WHERE carnet = carnet_in;

    RAISE NOTICE 'El estudiante "%" se dio de baja', codigo_in;
END;
$$;