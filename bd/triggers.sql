-- -----------------------------------------------------
--          Trigger para tabla Estudiante
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION EstudianteInsertTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se inserto un nuevo registro en Estudiante', 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER EstudianteInsert
AFTER INSERT ON Estudiante
FOR EACH ROW
EXECUTE FUNCTION EstudianteInsertTrigger();

CREATE OR REPLACE FUNCTION EstudianteUpdateTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se actualizo un registro en Estudiante', 'UPDATE');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER EstudianteUpdate
AFTER UPDATE ON Estudiante
FOR EACH ROW
EXECUTE FUNCTION EstudianteUpdateTrigger();

CREATE OR REPLACE FUNCTION EstudianteDeleteTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se elimino un registro en Estudiante', 'DELETE');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER EstudianteDelete
AFTER DELETE ON Estudiante
FOR EACH ROW
EXECUTE FUNCTION EstudianteDeleteTrigger();


-- -----------------------------------------------------
--          Trigger para tabla Curso
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION CursoInsertTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se inserto un nuevo registro en Curso', 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER CursoInsert
AFTER INSERT ON Curso
FOR EACH ROW
EXECUTE FUNCTION CursoInsertTrigger();

CREATE OR REPLACE FUNCTION CursoUpdateTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se actualizo un registro en Curso', 'UPDATE');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER CursoUpdate
AFTER UPDATE ON Curso
FOR EACH ROW
EXECUTE FUNCTION CursoUpdateTrigger();

CREATE OR REPLACE FUNCTION CursoDeleteTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se elimino un registro en Curso', 'DELETE');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CursoDelete
AFTER DELETE ON Curso
FOR EACH ROW
EXECUTE FUNCTION CursoDeleteTrigger();

-- -----------------------------------------------------
--          Trigger para tabla CursoCarrera
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION CursoCarreraInsertTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se inserto un nuevo registro en CursoCarrera', 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER CursoCarreraInsert
AFTER INSERT ON CursoCarrera
FOR EACH ROW
EXECUTE FUNCTION CursoCarreraInsertTrigger();

CREATE OR REPLACE FUNCTION CursoCarreraUpdateTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se actualizo un registro en CursoCarrera', 'UPDATE');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER CursoCarreraUpdate
AFTER UPDATE ON CursoCarrera
FOR EACH ROW
EXECUTE FUNCTION CursoCarreraUpdateTrigger();

CREATE OR REPLACE FUNCTION CursoCarreraDeleteTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se elimino un registro en CursoCarrera', 'DELETE');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CursoCarreraDelete
AFTER DELETE ON CursoCarrera
FOR EACH ROW
EXECUTE FUNCTION CursoCarreraDeleteTrigger();


-- -----------------------------------------------------
--          Trigger para tabla Prerequistos
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION PrerequistosInsertTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se inserto un nuevo registro en Prerequistos', 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER PrerequistosInsert
AFTER INSERT ON Prerequistos
FOR EACH ROW
EXECUTE FUNCTION PrerequistosInsertTrigger();

CREATE OR REPLACE FUNCTION PrerequistosUpdateTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se actualizo un registro en Prerequistos', 'UPDATE');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER PrerequistosUpdate
AFTER UPDATE ON Prerequistos
FOR EACH ROW
EXECUTE FUNCTION PrerequistosUpdateTrigger();

CREATE OR REPLACE FUNCTION PrerequistosDeleteTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se elimino un registro en Prerequistos', 'DELETE');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER PrerequistosDelete
AFTER DELETE ON Prerequistos
FOR EACH ROW
EXECUTE FUNCTION PrerequistosDeleteTrigger();

-- -----------------------------------------------------
--          Trigger para tabla Simultaneidad
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION SimultaneidadInsertTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se inserto un nuevo registro en Simultaneidad', 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER SimultaneidadInsert
AFTER INSERT ON Simultaneidad
FOR EACH ROW
EXECUTE FUNCTION SimultaneidadInsertTrigger();

CREATE OR REPLACE FUNCTION SimultaneidadUpdateTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se actualizo un registro en Simultaneidad', 'UPDATE');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER SimultaneidadUpdate
AFTER UPDATE ON Simultaneidad
FOR EACH ROW
EXECUTE FUNCTION SimultaneidadUpdateTrigger();

CREATE OR REPLACE FUNCTION SimultaneidadDeleteTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se elimino un registro en Simultaneidad', 'DELETE');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER SimultaneidadDelete
AFTER DELETE ON Simultaneidad
FOR EACH ROW
EXECUTE FUNCTION SimultaneidadDeleteTrigger();

-- -----------------------------------------------------
--          Trigger para tabla HabilitarCurso
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION HabilitarCursoInsertTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se inserto un nuevo registro en HabilitarCurso', 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER HabilitarCursoInsert
AFTER INSERT ON HabilitarCurso
FOR EACH ROW
EXECUTE FUNCTION HabilitarCursoInsertTrigger();

CREATE OR REPLACE FUNCTION HabilitarCursoUpdateTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se actualizo un registro en HabilitarCurso', 'UPDATE');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER HabilitarCursoUpdate
AFTER UPDATE ON HabilitarCurso
FOR EACH ROW
EXECUTE FUNCTION HabilitarCursoUpdateTrigger();

CREATE OR REPLACE FUNCTION HabilitarCursoDeleteTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se elimino un registro en HabilitarCurso', 'DELETE');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER HabilitarCursoDelete
AFTER DELETE ON HabilitarCurso
FOR EACH ROW
EXECUTE FUNCTION HabilitarCursoDeleteTrigger();

-- -----------------------------------------------------
--          Trigger para tabla Horario
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION HorarioInsertTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se inserto un nuevo registro en Horario', 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER HorarioInsert
AFTER INSERT ON Horario
FOR EACH ROW
EXECUTE FUNCTION HorarioInsertTrigger();

CREATE OR REPLACE FUNCTION HorarioUpdateTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se actualizo un registro en Horario', 'UPDATE');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER HorarioUpdate
AFTER UPDATE ON Horario
FOR EACH ROW
EXECUTE FUNCTION HorarioUpdateTrigger();

CREATE OR REPLACE FUNCTION HorarioDeleteTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se elimino un registro en Horario', 'DELETE');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER HorarioDelete
AFTER DELETE ON Horario
FOR EACH ROW
EXECUTE FUNCTION HorarioDeleteTrigger();

-- -----------------------------------------------------
--          Trigger para tabla Asignacion
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION AsignacionInsertTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se inserto un nuevo registro en Asignacion', 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER AsignacionInsert
AFTER INSERT ON Asignacion
FOR EACH ROW
EXECUTE FUNCTION AsignacionInsertTrigger();

CREATE OR REPLACE FUNCTION AsignacionUpdateTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se actualizo un registro en Asignacion', 'UPDATE');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER AsignacionUpdate
AFTER UPDATE ON Asignacion
FOR EACH ROW
EXECUTE FUNCTION AsignacionUpdateTrigger();

CREATE OR REPLACE FUNCTION AsignacionDeleteTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se elimino un registro en Asignacion', 'DELETE');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER AsignacionDelete
AFTER DELETE ON Asignacion
FOR EACH ROW
EXECUTE FUNCTION AsignacionDeleteTrigger();

-- -----------------------------------------------------
--          Trigger para tabla Desasignacion
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION DesasignacionInsertTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se inserto un nuevo registro en Desasignacion', 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER DesasignacionInsert
AFTER INSERT ON Desasignacion
FOR EACH ROW
EXECUTE FUNCTION DesasignacionInsertTrigger();

CREATE OR REPLACE FUNCTION DesasignacionUpdateTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se actualizo un registro en Desasignacion', 'UPDATE');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER DesasignacionUpdate
AFTER UPDATE ON Desasignacion
FOR EACH ROW
EXECUTE FUNCTION DesasignacionUpdateTrigger();

CREATE OR REPLACE FUNCTION DesasignacionDeleteTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se elimino un registro en Desasignacion', 'DELETE');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER DesasignacionDelete
AFTER DELETE ON Desasignacion
FOR EACH ROW
EXECUTE FUNCTION DesasignacionDeleteTrigger();

-- -----------------------------------------------------
--          Trigger para tabla Nota
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION NotaInsertTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se inserto un nuevo registro en Nota', 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER NotaInsert
AFTER INSERT ON Nota
FOR EACH ROW
EXECUTE FUNCTION NotaInsertTrigger();

CREATE OR REPLACE FUNCTION NotaUpdateTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se actualizo un registro en Nota', 'UPDATE');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER NotaUpdate
AFTER UPDATE ON Nota
FOR EACH ROW
EXECUTE FUNCTION NotaUpdateTrigger();

CREATE OR REPLACE FUNCTION NotaDeleteTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se elimino un registro en Nota', 'DELETE');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER NotaDelete
AFTER DELETE ON Nota
FOR EACH ROW
EXECUTE FUNCTION NotaDeleteTrigger();

-- -----------------------------------------------------
--          Trigger para tabla Acta
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION ActaInsertTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se inserto un nuevo registro en Acta', 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER ActaInsert
AFTER INSERT ON Acta
FOR EACH ROW
EXECUTE FUNCTION ActaInsertTrigger();

CREATE OR REPLACE FUNCTION ActaUpdateTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se actualizo un registro en Acta', 'UPDATE');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER ActaUpdate
AFTER UPDATE ON Acta
FOR EACH ROW
EXECUTE FUNCTION ActaUpdateTrigger();

CREATE OR REPLACE FUNCTION ActaDeleteTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se elimino un registro en Acta', 'DELETE');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER ActaDelete
AFTER DELETE ON Acta
FOR EACH ROW
EXECUTE FUNCTION ActaDeleteTrigger();

-- -----------------------------------------------------
--          Trigger para tabla Docente
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION DocenteInsertTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se inserto un nuevo registro en Docente', 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER DocenteInsert
AFTER INSERT ON Docente
FOR EACH ROW
EXECUTE FUNCTION DocenteInsertTrigger();

CREATE OR REPLACE FUNCTION DocenteUpdateTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se actualizo un registro en Docente', 'UPDATE');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER DocenteUpdate
AFTER UPDATE ON Docente
FOR EACH ROW
EXECUTE FUNCTION DocenteUpdateTrigger();

CREATE OR REPLACE FUNCTION DocenteDeleteTrigger()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Transaccion(fecha, descripcion, tipo) 
    VALUES (CURRENT_TIMESTAMP, 'Se elimino un registro en Docente', 'DELETE');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER DocenteDelete
AFTER DELETE ON Docente
FOR EACH ROW
EXECUTE FUNCTION DocenteDeleteTrigger();
