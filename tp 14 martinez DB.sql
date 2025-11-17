CREATE DATABASE eventos_escolares;
USE eventos_escolares;

CREATE TABLE cursos (
    id_curso INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    turno VARCHAR(100) NOT NULL,
    nivel VARCHAR(100) NOT NULL
);

CREATE TABLE estudiantes (
    id_estudiante INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    dni VARCHAR(20) UNIQUE NOT NULL,
    id_curso INT NOT NULL,
    fecha_nacimiento DATE,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE eventos (
    id_evento INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    descripcion TEXT,
    estado VARCHAR (100) NOT NULL DEFAULT 'Programado',
    UNIQUE(nombre, fecha)
);

CREATE TABLE actividades (
    id_actividad INT PRIMARY KEY,
    id_evento INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    horario TIME NOT NULL,
    lugar VARCHAR(100),
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    UNIQUE(id_evento, nombre)  
);

CREATE TABLE recursos (
    id_recurso INT PRIMARY KEY,
    id_actividad INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    
    FOREIGN KEY (id_actividad) REFERENCES actividades(id_actividad)
);

CREATE TABLE participaciones (
    id_participacion INT PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_actividad INT NOT NULL,
    rol VARCHAR(100) NOT NULL,

    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_actividad) REFERENCES actividades(id_actividad),
    UNIQUE(id_estudiante, id_actividad)  
);

INSERT INTO cursos (id_curso, nombre, turno, nivel)
VALUES
(1, '1A', 'Mañana', 'Secundario'),
(2, '1B', 'Tarde', 'Secundario'),
(3, '2A', 'Mañana', 'Secundario'),
(4, '3A', 'Mañana', 'Secundario'),
(5, '6B', 'Tarde', 'Secundario');


INSERT INTO estudiantes (id_estudiante, nombre, email, dni, id_curso, fecha_nacimiento)
VALUES
(1, 'Juan Pérez', 'juan@example.com', '44555666', 1, '2008-03-10'),
(2, 'María López', 'maria@example.com', '43999888', 2, '2007-05-21'),
(3, 'Carlos Gómez', 'carlos@example.com', '41222333', 3, '2006-11-04'),
(4, 'Lucía García', 'lucia@example.com', '40111222', 4, '2005-09-11'),
(5, 'Ana Torres', 'ana@example.com', '40990011', 5, '2007-01-30');

INSERT INTO eventos (id_evento, nombre, fecha, descripcion, estado)
VALUES
(1, 'Día del Estudiante', '2025-09-21', 'Actividades recreativas', 'Programado'),
(3, 'Semana de la Dulzura', '2025-07-01', 'Intercambio de golosinas', 'Programado'),
(2, 'Fiesta de Fin de Año', '2025-12-10', 'Evento escolar general', 'Programado'),
(4, 'Día de la Música', '2025-11-22', 'Celebración musical', 'Programado'),
(5, 'Día del Chocolate', '2025-05-10', 'Actividades dulces', 'Programado');

