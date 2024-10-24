CREATE DATABASE parcialjstl;
USE parcialjstl;

DROP TABLE IF EXISTS administrador;
DROP TABLE IF EXISTS coordinacion;
DROP TABLE IF EXISTS evaluador_estudiante;
DROP TABLE IF EXISTS director_estudiante;
DROP TABLE IF EXISTS idea_estudiante;
DROP TABLE IF EXISTS estudiante;
DROP TABLE IF EXISTS idea_docente;
DROP TABLE IF EXISTS idea_anteproyecto;
DROP TABLE IF EXISTS aprobar_proyecto;
DROP TABLE IF EXISTS docentes;



CREATE TABLE administrador (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    admin_cedula VARCHAR(10) NOT NULL UNIQUE,
    admin_contra VARCHAR(30) NOT NULL
);
    
    INSERT INTO administrador (id, admin_cedula, admin_contra)
    VALUES(1, "1096062691", "Santiago2004");

CREATE TABLE coordinacion(
    id int(10) PRIMARY KEY AUTO_INCREMENT,
    coor_cedula VARCHAR(10) NOT NULL UNIQUE,
    coor_nombre VARCHAR(30) NOT NULL,
    coor_apellidos VARCHAR(40) NOT NULL,
    coor_email VARCHAR(50) NOT NULL,
    coor_telefono VARCHAR(10) NOT NULL,
    coor_programa VARCHAR(100) NOT NULL,
    coor_facultad VARCHAR(100) NOT NULL,
    coor_contra VARCHAR(20) NOT NULL
    );
    insert into coordinacion (id, coor_cedula, coor_nombre,coor_apellidos,coor_email,coor_telefono,coor_programa,coor_facultad,coor_contra )
    values (1,"123456789", "Yesid Yair", "García Zambrano", "sistemas@correo.uts.edu.co", "6475567","Ingenieria de Sistemas", "Facultad de Ciencias Naturales e Ingenierias","Sistemas123" );


CREATE TABLE docentes(
    id int(10) PRIMARY KEY AUTO_INCREMENT,
    doc_cedula VARCHAR(10) NOT NULL UNIQUE,
    doc_nombre VARCHAR(30) NOT NULL,
    doc_apellidos VARCHAR(40) NOT NULL,
    doc_email VARCHAR(50) NOT NULL,
    doc_telefono VARCHAR(10) NOT NULL,
    doc_direccion VARCHAR(100) NOT NULL,
    doc_nivel VARCHAR(50) NOT NULL,
    doc_jornada VARCHAR(20) NULL,
    doc_facultad VARCHAR(100) NOT NULL,
    rol ENUM('director', 'evaluador') NOT NULL,
    doc_contra VARCHAR(20) NOT NULL
);
insert into docentes(id, doc_cedula,doc_nombre,doc_apellidos,doc_email,doc_telefono,doc_direccion,doc_nivel, doc_jornada,doc_facultad,rol, doc_contra)
    values (1,"1096062691", "Julian Barney","Jaimes Rincon", "jbjaimes@correo.uts.edu.co", "3625874585",  "Real de Minas", "Maestria","Diurna", "Ciencias", "director", "Julian1234");
       insert into docentes(id, doc_cedula,doc_nombre,doc_apellidos,doc_email,doc_telefono,doc_direccion,doc_nivel, doc_jornada,doc_facultad,rol, doc_contra)
    values (2,"1096062692","Ruben Dario","Fontecha Sanabria", "rfontecha@correo.uts.edu.co", "3252587411", "Real de minas",   "Maestria", "Diurna", "Ciencias", "Evaluador", "Ruben123");




CREATE TABLE aprobar_proyecto(
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(20) NOT NULL
);

INSERT INTO aprobar_proyecto (estado) VALUES ("Aprobado"), ("Desaprobado");


CREATE TABLE estudiante (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    est_cedula VARCHAR(15) NOT NULL UNIQUE,
    est_nombre VARCHAR(30),
    est_apellidos VARCHAR(40),
    est_email VARCHAR(50),
    est_telefono VARCHAR(10),
    est_jornada VARCHAR(20),
    est_programa VARCHAR(100),
    est_semestre VARCHAR(2),
    est_archivo BLOB,
    est_fecha DATE,
    est_contra VARCHAR(20),
    id_estado INT(10),
    id_director INT(10),
    id_evaluador INT(10),
    FOREIGN KEY (id_estado) REFERENCES aprobar_proyecto(id),
    FOREIGN KEY (id_director) REFERENCES docentes(id),
    FOREIGN KEY (id_evaluador) REFERENCES docentes(id)
);
INSERT INTO estudiante (est_cedula, est_nombre, est_apellidos, est_email, est_telefono, est_jornada, est_programa, est_semestre, est_archivo, est_fecha,  est_contra, id_estado, id_director,id_evaluador )
VALUES ('1096062691', 'Santiago', 'Ruiz Hernandez', 'sruizh@uts.edu.co', '3639521479', 'Diurna', 'Tecnologia en desarrollo de sistemas informaticos', '5', null, '2024-05-09', 'Santiago123', null, '1','2');


CREATE TABLE idea_anteproyecto(
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    ante_codigo VARCHAR(10) NOT NULL UNIQUE,
    ante_autor VARCHAR(60) NOT NULL,
    ante_region VARCHAR(30) NOT NULL,
    ante_facultad VARCHAR(100) NOT NULL,
    ante_titulo VARCHAR(255) NOT NULL,
    ante_objetivo VARCHAR(500) NOT NULL,
    ante_descripcion VARCHAR(2000) NOT NULL,
    proyecto_estado INT(10),
    FOREIGN KEY (proyecto_estado) REFERENCES aprobar_proyecto(id)
);

INSERT INTO idea_anteproyecto(ante_codigo, ante_autor, ante_region, ante_facultad, ante_titulo, ante_objetivo, ante_descripcion, proyecto_estado)
VALUES ('0362', 'Carlos Andrés López Gómez', 'Bucaramanga', 'Ciencias Basicas', 'verena', 'Desarrollar estrategias en investigación formativa y proyectos de investigación, tecnología como eje entre la comunidad y la academia para fortalecer la cultura investigativa.', 'la calidad académica se basa en la docencia, la investigación y la proyección social, que son áreas donde los profesores generan conocimiento y fomentan actitudes positivas para abordar problemas, tanto durante la formación como en la práctica profesional. ', 1);


INSERT INTO idea_anteproyecto(ante_codigo, ante_autor, ante_region, ante_facultad, ante_titulo, ante_objetivo, ante_descripcion, proyecto_estado)
VALUES ('0400', 'Laura Marcela Ramírez Rojas', 'Bucaramanga', 'Ciencias Basicas', 'verena', 'Desarrollar estrategias de mecanismo para el fortalecimiento del desarrollo de competencias matemáticas en la educación superior', 'Las competencias son habilidades esenciales para el éxito en diferentes ámbitos. La educación superior busca formar profesionales competentes, y algunos países utilizan pruebas estandarizadas para medir el nivel de competencias adquiridas por los estudiantes.', 2);


CREATE TABLE idea_estudiante(
	id INT(10) PRIMARY KEY AUTO_INCREMENT,
	id_estudianteP INT(10) NOT NULL,
	id_proyectoP INT(10) NOT NULL,
	FOREIGN KEY (id_estudianteP) REFERENCES estudiante(id),
	FOREIGN KEY (id_proyectoP) REFERENCES idea_anteproyecto(id)
);


CREATE TABLE idea_docente (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    id_docente INT(10) NOT NULL,
    id_idea INT(10) NOT NULL,
    FOREIGN KEY (id_docente) REFERENCES docentes(id),
    FOREIGN KEY (id_idea) REFERENCES idea_anteproyecto(id)
);

INSERT INTO idea_docente(id_docente, id_idea) VALUES (1,2);



