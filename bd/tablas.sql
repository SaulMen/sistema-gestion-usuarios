CREATE DATABASE SING;

CREATE TABLE Carrera (
    id_carrera SERIAL PRIMARY KEY,
    nombre_carrera VARCHAR(40) NOT NULL
);

CREATE TABLE Docente (
    siif           INT PRIMARY KEY,
    contrasenia    VARCHAR(255) NOT NULL,
    nombres        VARCHAR(40) NOT NULL,
    apellidos      VARCHAR(40) NOT NULL,
    fecha_nac      DATE NOT NULL,
    correo         VARCHAR(40) NOT NULL,
    telefono       VARCHAR(8) NOT NULL,
    direccion      VARCHAR(80) NOT NULL,
    dpi            BIGINT NOT NULL,
    fecha_creacion TIMESTAMP NOT NULL
);


CREATE TABLE Estudiante (
    carnet             INT PRIMARY KEY,
    contrasenia        VARCHAR(255) NOT NULL,
    nombres            VARCHAR(40) NOT NULL,
    apellidos          VARCHAR(40) NOT NULL,
    fecha_nac          DATE NOT NULL,
    correo             VARCHAR(40) NOT NULL,
    telefono           VARCHAR(8)  NOT NULL,
    direccion          VARCHAR(80) NOT NULL,
    dpi                BIGINT NOT NULL,
    fecha_creacion     TIMESTAMP NOT NULL,
    estado             BOOLEAN
);

CREATE TABLE Simultaneidad (
    carnet              INT NOT NULL,
    id_carrera          INT NOT NULL,
    creditos_ganados    INT NOT NULL,
    FOREIGN KEY (carnet) REFERENCES Estudiante(carnet),
    FOREIGN KEY (id_carrera) REFERENCES Carrera(id_carrera),
    PRIMARY KEY (carnet, id_carrera)
);


CREATE TABLE Curso (
    codigo_curso        INT PRIMARY KEY,
    nombre              VARCHAR(50) NOT NULL UNIQUE,
    creditos_necesarios INT NOT NULL,
    creditos_otorga     INT NOT NULL,
    obligatorio         BOOLEAN
);

CREATE TABLE CursoCarrera (
    codigo_curso        INT NOT NULL,
    id_carrera          INT NOT NULL,
    FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo_curso),
    FOREIGN KEY (id_carrera) REFERENCES Carrera(id_carrera),
    PRIMARY KEY (codigo_curso, id_carrera)
);

CREATE TABLE Prerequistos (
    codigo_curso        INT NOT NULL,
    pre_requisito       INT NOT NULL,
    FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo_curso),
    FOREIGN KEY (pre_requisito) REFERENCES Curso(codigo_curso),
    PRIMARY KEY (codigo_curso, pre_requisito)
);

CREATE TABLE HabilitarCurso (
    id_habilitado      SERIAL PRIMARY KEY,
    anio               VARCHAR(4) NOT NULL,
    cantidad_asignados INT NOT NULL,
    codigo_curso       INT NOT NULL,
    ciclo              VARCHAR(2) NOT NULL,
    siif               INT NOT NULL,
    cupo_maximo        INT NOT NULL,
    acta_generada      BOOLEAN,
    seccion            VARCHAR(1) NOT NULL,

    FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo_curso),
    FOREIGN KEY (siif) REFERENCES Docente(siif)
);

CREATE TABLE Horario (
    id_horario                   SERIAL PRIMARY KEY,
    nombre                       VARCHAR(50) NOT NULL,
    id_habilitado                INT NOT NULL,
    siif                         INT NOT NULL,
    nombre_aux                   VARCHAR(50),
    ubicacion                    VARCHAR(50),
    dia                          INT NOT NULL,
    hora                         VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_habilitado)  REFERENCES HabilitarCurso(id_habilitado),
    FOREIGN KEY (siif) REFERENCES Docente(siif),
    FOREIGN KEY (nombre) REFERENCES Curso(nombre)

);

CREATE TABLE Asignacion (
    no_asignacion      SERIAL PRIMARY KEY,
    codigo_curso       INT NOT NULL,
    ciclo              VARCHAR(2) NOT NULL,
    seccion            VARCHAR(1) NOT NULL,
    carnet             INT NOT NULL,
    anio               VARCHAR(4) NOT NULL,
    id_carrera         INT NOT NULL,
    FOREIGN KEY (id_carrera) REFERENCES Carrera(id_carrera),
    FOREIGN KEY (carnet) REFERENCES Estudiante(carnet),
    FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo_curso)
);


CREATE TABLE Desasignacion (
    no_desasignacion   SERIAL PRIMARY KEY,
    codigo_curso       INT NOT NULL,
    ciclo              VARCHAR(2) NOT NULL,
    seccion            VARCHAR(1) NOT NULL,
    carnet             INT NOT NULL,
    anio               VARCHAR(4) NOT NULL,
    id_carrera         INT NOT NULL,
    FOREIGN KEY (id_carrera) REFERENCES Carrera(id_carrera),
    FOREIGN KEY (carnet) REFERENCES Estudiante(carnet),
    FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo_curso)
);

CREATE TABLE Nota (
    id_nota            SERIAL PRIMARY KEY,
    codigo_curso       INT NOT NULL,
    ciclo              VARCHAR(2) NOT NULL,
    seccion            VARCHAR(1) NOT NULL,
    carnet             INT NOT NULL,
    nota               INT NOT NULL,
    anio               VARCHAR(4) NOT NULL,
    id_carrera         INT NOT NULL,
    FOREIGN KEY (id_carrera) REFERENCES Carrera(id_carrera),
    FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo_curso),
    FOREIGN KEY (carnet) REFERENCES Estudiante(carnet)
);

CREATE TABLE Acta (
    no_acta            SERIAL PRIMARY KEY,
    ciclo              VARCHAR(2) NOT NULL,
    seccion            VARCHAR(1) NOT NULL,
    fecha_creacion     TIMESTAMP NOT NULL,
    codigo_curso       INT NOT NULL,
    FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo_curso)
);

CREATE TABLE Transaccion (
    id_transaccion SERIAL PRIMARY KEY,
    fecha          TIMESTAMP NOT NULL,
    descripcion    VARCHAR(100) NOT NULL,
    tipo           VARCHAR(20) NOT NULL
);