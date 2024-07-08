-- -----------------------------------------------------
--      Funcion booleana para nombre de Carrera
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION ExisteNombreCarrera(carrera_in VARCHAR(40))
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS(SELECT 1 FROM carrera c 
    WHERE c.nombre_carrera  = carrera_in);
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--      Funcion booleana para login de Estudiante
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION LoginEstudiante(carnet_in INT, contrasenia_in VARCHAR(25))
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS(SELECT 1 FROM Estudiante e 
    WHERE e.carnet = carnet_in 
    AND e.contrasenia = contrasenia_in);
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--      Funcion booleana para login de Docente
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION LoginDocente(siif_in INT, contrasenia_in VARCHAR(25))
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS(SELECT 1 FROM Docente d 
    WHERE d.siif = siif_in 
    AND d.contrasenia = contrasenia_in);
END;
$$ LANGUAGE plpgsql;


-- -----------------------------------------------------
--          Funcion booleana para solo letras
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION SoloLetras(input VARCHAR(255))
RETURNS BOOLEAN AS $$
BEGIN
    RETURN input ~ '^[A-Za-z ]+$';
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--          Funcion booleana para solo enteros
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION ValidarEnteroPositivo(numero INT)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN numero::TEXT ~ '^[0-9]+$';
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--        Funcion booleana para cursos repetidos
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION ExisteCurso(codigo_in INT)
RETURNS BOOLEAN AS $$
DECLARE
    existe BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1 FROM Curso c WHERE c.codigo_curso = codigo_in) INTO existe;
    RETURN existe;
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--   Funcion booleana para existencia nombre de curso
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION ExisteNombreCurso(nombre_in VARCHAR(100))
RETURNS BOOLEAN AS $$
DECLARE
    existe BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1 FROM Curso c WHERE c.nombre = nombre_in) INTO existe;
    RETURN existe;
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--        Funcion booleana para validar carrera
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION ExisteCarrera(id_carrera_in INT)
RETURNS BOOLEAN AS $$
DECLARE
    existe BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1 FROM Carrera c WHERE c.id_carrera = id_carrera_in) INTO existe;
    RETURN existe;
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--        Funcion booleana para validar ciclos
-- -----------------------------------------------------


CREATE OR REPLACE FUNCTION ValidarCiclo(ciclo VARCHAR(2))
RETURNS BOOLEAN AS $$
DECLARE
    valido BOOLEAN;
BEGIN
    IF UPPER(ciclo) = '1S' OR UPPER(ciclo) = '2S' OR UPPER(ciclo) = 'VJ' OR UPPER(ciclo) = 'VD' THEN
        valido := TRUE;
    ELSE
        valido := FALSE;
    END IF;
    RETURN valido;
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--        Funcion booleana para validar siif 
-- -----------------------------------------------------


CREATE OR REPLACE FUNCTION ExisteDocente(siif_in INT)
RETURNS BOOLEAN AS $$
DECLARE
    existe BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1 FROM Docente d WHERE d.siif = siif_in) INTO existe;
    RETURN existe;
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--     Funcion booleana para validar unico caracter
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION ValidarLetraSeccion(seccion VARCHAR(1))
RETURNS BOOLEAN AS $$
DECLARE
    valido BOOLEAN;
BEGIN
    IF (SELECT REGEXP_INSTR(seccion, '^[a-zA-Z]$') = 1) THEN
        valido := TRUE;
    ELSE
        valido := FALSE;
    END IF;
    RETURN valido;
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--       Funcion booleana para validar 7 dias
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION ValidarDia(dia INT)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN dia BETWEEN 1 AND 6;
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--     Funcion booleana para validar id habilitado
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION ExisteIdHabilitado(id_habilitado_in INT)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS(SELECT 1 FROM HabilitarCurso ch WHERE ch.id_habilitado = id_habilitado_in);
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--      Funcion booleana para carnet existente
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION ExisteCarnet(carnet_in INT)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS(SELECT 1 FROM Estudiante e WHERE e.carnet = carnet_in);
END;
$$ LANGUAGE plpgsql;


-- -----------------------------------------------------
--      Funcion booleana para si esta asignado
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION YaAsignado(
    codigo_c INT, 
    ciclo_in VARCHAR(2), 
    carnet_in INT, 
    seccion_in VARCHAR(1), 
    anio_in VARCHAR(4))
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS(
        SELECT 1 
        FROM Asignacion a
        LEFT JOIN Desasignacion d ON a.carnet = d.carnet
        AND a.codigo_curso = d.codigo_curso
        AND a.ciclo = d.ciclo
        AND a.anio = d.anio
        WHERE d.codigo_curso IS NULL
        AND a.carnet = carnet_in
        AND a.codigo_curso = codigo_c
        AND a.ciclo = UPPER(ciclo_in)
        AND a.seccion = seccion_in
        AND a.anio = anio_in
    );
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--      Funcion booleana para si hay id_habilitado
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION idHabilitado(codigo_in INT, ciclo_in VARCHAR(2), seccion_in VARCHAR(1), anio_actual VARCHAR(4))
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS(
        SELECT 1 
        FROM HabilitarCurso ch
        WHERE ch.codigo_curso = codigo_in
        AND ch.ciclo = UPPER(ciclo_in)
        AND ch.anio = anio_actual
        AND ch.seccion = seccion_in
    );
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--      Funcion booleana para si hay id_habilitado
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION get_idHabilitado(codigo_in INT, ciclo_in VARCHAR(2), seccion_in VARCHAR(1), anio_actual VARCHAR(4))
RETURNS INT AS $$
DECLARE
    existe INT;
BEGIN
    SELECT id_habilitado INTO existe 
    FROM HabilitarCurso ch
    WHERE ch.codigo_curso = codigo_in
    AND ch.ciclo = UPPER(ciclo_in)
    AND ch.anio = anio_actual
    AND ch.seccion = seccion_in;
    
    RETURN existe;
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--      Funcion booleana para acta existente
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION ExisteActaCurso(id_habili INT)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS(
        SELECT 1 
        FROM HabilitarCurso hc 
        WHERE hc.acta_generada = TRUE
        AND hc.id_habilitado = id_habili
    );
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--      Funcion booleana para acta existente
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION ValidarHora(horario VARCHAR(12))
RETURNS BOOLEAN AS $$
BEGIN
    RETURN horario ~ '^(([0-1][0-9]:[0-5][0])|(2[0-1]:[0-5][0]))-(([0-1][0-9]:[0-5][0])|(2[0-1]:[0-5][0]))$';
END;
$$ LANGUAGE plpgsql;

-- -----------------------------------------------------
--          Funcion booleana para correos
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION ValidarCorreo(correo VARCHAR(40))
RETURNS BOOLEAN AS $$
BEGIN
    RETURN correo ~ '^[a-zA-Z]+[a-zA-Z0-9_-]*@([a-zA-Z]+[.])+[a-zA-Z]+$';
END;
$$ LANGUAGE plpgsql;
