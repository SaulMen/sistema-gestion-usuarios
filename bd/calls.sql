-- REGISTRO DE CARRERAS 5
CALL crearCarrera('Ingenieria Ciencias y Sistemas'); -- 2
CALL crearCarrera('Ingenieria Electronica'); -- 3
CALL crearCarrera('Ingenieria Mecanica Electrica'); -- 4   
CALL crearCarrera('Ingenieria Quimica'); -- 5
   

-- REGISTRO DE DOCENTES 10
CALL registrarDocente(1,'Docente1','Apellido1','30-10-1999','docente1@ing.usac.edu.gt','55531245','dirdocente1',1234567891000,'pass1');
CALL registrarDocente(2,'Docente2','Apellido2','20-11-1999','docente2@ing.usac.edu.gt','55596783','dirdocente2',1234567891111,'pass2');
CALL registrarDocente(3,'Docente3','Apellido3','20-12-1980','docente3@ing.usac.edu.gt','55500874','dirdocente3',1234567891222,'pass3');
CALL registrarDocente(4,'Docente4','Apellido4','20-11-1981','docente4@ing.usac.edu.gt','55572019','dirdocente4',1234567891333,'pass4');
CALL registrarDocente(5,'Docente5','Apellido5','20-09-1982','docente5@ing.usac.edu.gt','55549382','dirdocente5',1234567891444,'pass5');
CALL registrarDocente(6,'Docente6','Apellido6','30-10-1999','docente6@ing.usac.edu.gt','55510567','dirdocente1',1234567891555,'pass6');
CALL registrarDocente(7,'Docente7','Apellido7','12-01-2000','docente7@ing.usac.edu.gt','55583629','dirdocente2',1234567891666,'pass7');
CALL registrarDocente(8,'Docente8','Apellido8','21-02-1990','docente8@ing.usac.edu.gt','55564180','dirdocente3',1234567891777,'pass8');
CALL registrarDocente(9,'Docente9','Apellido9','25-01-1987','docente9@ing.usac.edu.gt','55529734','dirdocente4',1234567891888,'pass9');
CALL registrarDocente(10,'Docente10','Apellido10','20-09-1982','docente10@ing.usac.edu.gt','12345678','dirdocente5',1234567891999,'pass10');


-- REGISTRO DE ESTUDIANTES 36
-- SISTEMAS
CALL registrarEstudiante(202000011,'Estudiante','Sistemas1','30-10-1999','sistemas1@gmail.com','52572486','dirsist1',337859510101,2,'pass1');
CALL registrarEstudiante(202000012,'Estudiante','Sistemas2','03-05-2000','sistemas2@gmail.com','52563897','dirsist2',327815801012,2,'pass2');
CALL registrarEstudiante(202000013,'Estudiante','Sistemas3','03-05-2002','sistemas3@gmail.com','52581729','dirsist3',127915801983,2,'pass3');
CALL registrarEstudiante(202000014,'Estudiante','Sistemas4','09-06-2002','sistemas4@gmail.com','52540962','dirsist4',787866801574,2,'pass4');
CALL registrarEstudiante(202000015,'Estudiante','Sistemas5','10-05-2001','sistemas5@gmail.com','52556301','dirsist5',987917801365,2,'pass5');
CALL registrarEstudiante(202000016,'Estudiante','Sistemas6','30-10-1999','sistemas6@gmail.com','52529074','dirsist1',337859510106,2,'pass6');
CALL registrarEstudiante(202000017,'Estudiante','Sistemas7','23-08-2000','sistemas7@gmail.com','52598613','dirsist2',327815801017,2,'pass7');
CALL registrarEstudiante(202000018,'Estudiante','Sistemas8','03-09-2001','sistemas8@gmail.com','52517503','dirsist3',127915801988,2,'pass8');
CALL registrarEstudiante(202000019,'Estudiante','Sistemas9','12-12-2003','sistemas9@gmail.com','52546285','dirsist4',787866801579,2,'pass9');

-- ELECTRONICA
CALL registrarEstudiante(202000021,'Estudiante','Electro1','20-10-1999','electro1@gmail.com','52581047','direlectro1',164378551040,3,'pass1');
CALL registrarEstudiante(202000022,'Estudiante','Electro2','13-05-2000','electro2@gmail.com','52572459','direlectro2',255276818011,3,'pass2');
CALL registrarEstudiante(202000023,'Estudiante','Electro3','23-05-2002','electro3@gmail.com','52539168','direlectro3',347627918018,3,'pass3');
CALL registrarEstudiante(202000024,'Estudiante','Electro4','29-06-2002','electro4@gmail.com','52594672','direlectro4',428878680517,3,'pass4');
CALL registrarEstudiante(202000025,'Estudiante','Electro5','04-05-2001','electro5@gmail.com','52552816','direlectro5',518791788016,3,'pass5');
CALL registrarEstudiante(202000026,'Estudiante','Electro6','22-10-1999','electro6@gmail.com','52560382','direlectro1',664378551040,3,'pass6');
CALL registrarEstudiante(202000027,'Estudiante','Electro7','16-05-2000','electro7@gmail.com','52528714','direlectro2',755276818011,3,'pass7');
CALL registrarEstudiante(202000028,'Estudiante','Electro8','20-05-2002','electro8@gmail.com','52510983','direlectro3',847627918018,3,'pass8');
CALL registrarEstudiante(202000029,'Estudiante','Electro9','21-06-2002','electro9@gmail.com','52541520','direlectro4',928878680517,3,'pass9');

-- MECANICA ELECTRICA
CALL registrarEstudiante(202000031,'Estudiante','MElectr1','20-10-1999','melectr1@gmail.com','53587236','dirmelectr1',163434851001,4,'pass1');
CALL registrarEstudiante(202000032,'Estudiante','MElectr2','13-05-2000','melectr2@gmail.com','53564195','dirmelectr2',353524688012,4,'pass2');
CALL registrarEstudiante(202000033,'Estudiante','MElectr3','23-05-2002','melectr3@gmail.com','53550378','dirmelectr3',543764798083,4,'pass3');
CALL registrarEstudiante(202000034,'Estudiante','MElectr4','19-06-2002','melectr4@gmail.com','53592840','dirmelectr4',238848605724,4,'pass4');
CALL registrarEstudiante(202000035,'Estudiante','MElectr5','04-05-2001','melectr5@gmail.com','53536721','dirmelectr5',911387417805,4,'pass5');
CALL registrarEstudiante(202000036,'Estudiante','MElectr6','22-11-1999','melectr6@gmail.com','53510489','dirmelectr1',163434851006,4,'pass6');
CALL registrarEstudiante(202000037,'Estudiante','MElectr7','19-01-2000','melectr7@gmail.com','53575923','dirmelectr2',353524688017,4,'pass7');
CALL registrarEstudiante(202000038,'Estudiante','MElectr8','28-02-2002','melectr8@gmail.com','53528647','dirmelectr3',543764798088,4,'pass8');
CALL registrarEstudiante(202000039,'Estudiante','MElectr9','03-03-2002','melectr9@gmail.com','53563479','dirmelectr4',238848605729,4,'pass9');

-- QUIMICA
CALL registrarEstudiante(202000041,'Estudiante','Quimica1','20-10-1999','quimica1@gmail.com','55571238','dirquimik1',643485081501,5,'pass1');
CALL registrarEstudiante(202000042,'Estudiante','Quimica2','13-05-2000','quimica2@gmail.com','55549063','dirquimik2',552468082165,5,'pass2');
CALL registrarEstudiante(202000043,'Estudiante','Quimica3','23-05-2002','quimica3@gmail.com','55583925','dirquimik3',476479083878,5,'pass3');
CALL registrarEstudiante(202000044,'Estudiante','Quimica4','09-06-2002','quimica4@gmail.com','55526749','dirquimik4',384860784982,5,'pass4');
CALL registrarEstudiante(202000045,'Estudiante','Quimica5','22-05-2001','quimica5@gmail.com','55558401','dirquimik5',138741885021,5,'pass5');
CALL registrarEstudiante(202000046,'Estudiante','Quimica6','18-06-2000','quimica2@gmail.com','55530678','dirquimik2',552468086165,5,'pass6');
CALL registrarEstudiante(202000047,'Estudiante','Quimica7','16-08-2002','quimica3@gmail.com','55595127','dirquimik3',476479087878,5,'pass7');
CALL registrarEstudiante(202000048,'Estudiante','Quimica8','15-10-2002','quimica4@gmail.com','55512436','dirquimik4',384860788982,5,'pass8');
CALL registrarEstudiante(202000049,'Estudiante','Quimica9','12-12-2001','quimica5@gmail.com','55567894','dirquimik5',138741889021,5,'pass9');


-- CREACION DE CURSOS 17
-- 1SEMESTRE AREA COMUN
CALL crearCurso(101,'MATEMATICA BASICA 1',  0,7,TRUE); 
CALL perteneceCurso(101,1);

CALL crearCurso(17,'SOCIAL HUMANISTICA 1',  0,4,TRUE);
CALL perteneceCurso(17,1);

CALL crearCurso(348,'QUIMICA GENERAL 1',    0,3,TRUE);
CALL perteneceCurso(348,1);

CALL crearCurso(69,'TECNICA COMPLEMENTARIA',0,3,TRUE); 
CALL perteneceCurso(69,1);

CALL crearCurso(39,'DEPORTES 1',            0,1,FALSE); 
CALL perteneceCurso(39,1);

CALL crearCurso(6,'IDIOMA TECNICO 1',      0,2,FALSE); 
CALL perteneceCurso(6,1);

-- 2SEMESTRE AREA COMUN
CALL crearCurso(103,'MATEMATICA BASICA 2',  0,7,TRUE);
CALL perteneceCurso(103,1);
CALL crearPrerequisito(103,101);

CALL crearCurso(19,'SOCIAL HUMANISTICA 2',  0,4,TRUE);
CALL perteneceCurso(19,1);
CALL crearPrerequisito(019,017);

CALL crearCurso(147,'FISICA BASICA',        0,5,TRUE);
CALL perteneceCurso(147,1);
CALL crearPrerequisito(147,101);

CALL crearCurso(8,'IDIOMA TECNICO 2',      0,2,FALSE); 
CALL perteneceCurso(8,1);
CALL crearPrerequisito(8,6);

CALL crearCurso(40,'DEPORTES 2',            0,1,FALSE); 
CALL perteneceCurso(40,1);
CALL crearPrerequisito(40,39);

-- 3SEMESTRE AREA COMUN
CALL crearCurso(107,'MATEMATICA INTERMEDIA 1',  0,10,TRUE);
CALL perteneceCurso(107,1);
CALL crearPrerequisito(107,103);

CALL crearCurso(150,'FISICA 1',             0,6, TRUE);
CALL perteneceCurso(150,1);
CALL crearPrerequisito(150,103);
CALL crearPrerequisito(150,147);

CALL crearCurso(9,'IDIOMA TECNICO 3',      0,2,FALSE); 
CALL perteneceCurso(9,1);
CALL crearPrerequisito(9,8);

-- 4SEMESTRE AREA COMUN
CALL crearCurso(152,'FISICA 2',              0,6, TRUE);
CALL perteneceCurso(152,1);
CALL crearPrerequisito(152,107);
CALL crearPrerequisito(152,150);

CALL crearCurso(11,'IDIOMA TECNICO 4',      0,2,FALSE); 
CALL perteneceCurso(11,1);
CALL crearPrerequisito(11,9);

CALL crearCurso(112,'MATEMATICA INTERMEDIA 2',      0,5,TRUE); 
CALL perteneceCurso(112,1);
CALL crearPrerequisito(112,107);

CALL crearCurso(114,'MATEMATICA INTERMEDIA 3',      0,5,TRUE); 
CALL perteneceCurso(114,1);
CALL crearPrerequisito(114,107);

-- CURSOS DE VARIAS CARRERAS

CALL crearCurso(154,'FISICA 3',     0,6, TRUE);
CALL perteneceCurso(154,3);
CALL perteneceCurso(154,4);
CALL crearPrerequisito(154,152);

CALL crearCurso(462,'ELECTRICIDAD Y ELECTRONICA BASICA',0,5, TRUE);
CALL perteneceCurso(462,3);
CALL perteneceCurso(462,4);
CALL crearPrerequisito(462,152);

CALL crearCurso(204,'CIRCUITOS ELECTRICOS 1',0,6, TRUE);
CALL perteneceCurso(204,3);
CALL perteneceCurso(204,4);
CALL crearPrerequisito(204,152);
CALL crearPrerequisito(204,112);
CALL crearPrerequisito(204,114);

CALL crearCurso(206,'CIRCUITOS ELECTRICOS 2',0,6,TRUE);
CALL perteneceCurso(206,3);
CALL perteneceCurso(206,4);
CALL crearPrerequisito(206,204);

-- CURSOS DE SISTEMAS
CALL crearCurso(960,'MATE COMPUTO 1',       33,5, TRUE);
CALL perteneceCurso(960,2);
CALL crearPrerequisito(960,103);

CALL crearCurso(795,'LOGICA DE SISTEMAS',   33,2, TRUE);
CALL perteneceCurso(795,2);
CALL crearPrerequisito(795,103);

CALL crearCurso(770,'INTR. A LA PROG. Y COMPUTACION 1', 33,4, TRUE);
CALL perteneceCurso(770,2);
CALL crearPrerequisito(770,103);

-- CURSOS DE ING. MEC. ELEC.
CALL crearCurso(530,'MECANISMOS',            0,3,TRUE);
CALL perteneceCurso(530,4);
CALL crearPrerequisito(530,150);

CALL crearCurso(170,'MECANICA ANALITICA 1',  0,5, TRUE); 
CALL perteneceCurso(170,4);
CALL crearPrerequisito(170,107);
CALL crearPrerequisito(170,150);

CALL crearCurso(452,'CIENCIA DE LOS MATERIALES',  0,5, TRUE); 
CALL perteneceCurso(452,4);
CALL crearPrerequisito(452,152);

-- CURSOS DE ING. QUIMICA
CALL crearCurso(354,'QUIMICA 3',             0,5, TRUE); 
CALL perteneceCurso(354,5);

CALL crearCurso(356,'QUIMICA 4',             0,5, TRUE); 
CALL perteneceCurso(356,5);
CALL crearPrerequisito(356,354);

CALL crearCurso(362,'ANALISIS CUALITATIVO 1',0,5, TRUE); 
CALL perteneceCurso(362,5);
CALL crearPrerequisito(362,356);

-- CURSOS DE ING. ELECTRONICA
CALL crearCurso(242,'COMUNICACIONES 1',      0,6, TRUE); 
CALL perteneceCurso(242,3);
CALL crearPrerequisito(242,206);

CALL crearCurso(156,'FISICA 4',     0,6, TRUE);
CALL perteneceCurso(156,3);
CALL crearPrerequisito(156,154);


-- ---- ESTUDIANTE CON SIMULTANEA 21
CALL simultaneaEstudiante(202000011,3); -- DE SISTEMAS CON ELECTRONICA

-- ---- AGREGAR HABILITAR_CURSO 7

call habilitarCurso(17,'1S',1,110,'A');
call habilitarCurso(17,'1S',1,110,'B');                    
call habilitarCurso(69,'1S',2,110,'A');                    
call habilitarCurso(69,'1S',3,110,'B');                    
call habilitarCurso(101,'1S',4,110,'A');   
call habilitarCurso(101,'1S',5,110,'B');
call habilitarCurso(101,'1S',5,110,'Y');

-- ---- AGREGAR HORARIO 30

call agregarHorario('SOCIAL HUMANISTICA 1',1,1,'Jose Daniel','T-3 111',1,'07:00-09:00');
call agregarHorario('SOCIAL HUMANISTICA 1',1,1,'Jose Daniel','T-3 111',2,'07:00-09:00');
call agregarHorario('SOCIAL HUMANISTICA 1',1,1,'Jose Daniel','T-3 111',3,'07:00-09:00');
call agregarHorario('SOCIAL HUMANISTICA 1',1,1,'Jose Daniel','T-3 111',4,'07:00-09:00');
call agregarHorario('SOCIAL HUMANISTICA 1',1,1,'Jose Daniel','T-3 111',5,'07:00-09:00');

call agregarHorario('SOCIAL HUMANISTICA 1',2,1,'Jose Daniel','T-3 111',1,'09:00-11:00');
call agregarHorario('SOCIAL HUMANISTICA 1',2,1,'Jose Daniel','T-3 111',2,'09:00-11:00');
call agregarHorario('SOCIAL HUMANISTICA 1',2,1,'Jose Daniel','T-3 111',3,'09:00-11:00');
call agregarHorario('SOCIAL HUMANISTICA 1',2,1,'Jose Daniel','T-3 111',4,'09:00-11:00');
call agregarHorario('SOCIAL HUMANISTICA 1',2,1,'Jose Daniel','T-3 111',5,'09:00-11:00');

call agregarHorario('TECNICA COMPLEMENTARIA',3,2,'Jonathan Toc','S-12 102',1,'09:00-11:00');
call agregarHorario('TECNICA COMPLEMENTARIA',3,2,'Jonathan Toc','S-12 102',2,'09:00-11:00');
call agregarHorario('TECNICA COMPLEMENTARIA',3,2,'Jonathan Toc','S-12 102',3,'09:00-11:00');
call agregarHorario('TECNICA COMPLEMENTARIA',3,2,'Jonathan Toc','S-12 102',4,'09:00-11:00');
call agregarHorario('TECNICA COMPLEMENTARIA',3,2,'Jonathan Toc','S-12 102',5,'09:00-11:00');

call agregarHorario('TECNICA COMPLEMENTARIA',4,3,'Edin Montes','S-12 103',1,'07:00-09:00');
call agregarHorario('TECNICA COMPLEMENTARIA',4,3,'Edin Montes','S-12 103',2,'07:00-09:00');
call agregarHorario('TECNICA COMPLEMENTARIA',4,3,'Edin Montes','S-12 103',3,'07:00-09:00');
call agregarHorario('TECNICA COMPLEMENTARIA',4,3,'Edin Montes','S-12 103',4,'07:00-09:00');
call agregarHorario('TECNICA COMPLEMENTARIA',4,3,'Edin Montes','S-12 103',5,'07:00-09:00');

call agregarHorario('MATEMATICA BASICA 1',5,4,'Bryan Paez','T-3 109',1,'07:00-11:00');
call agregarHorario('MATEMATICA BASICA 1',5,4,'Bryan Paez','T-3 109',2,'07:00-11:00');
call agregarHorario('MATEMATICA BASICA 1',5,4,'Bryan Paez','T-3 109',3,'07:00-11:00');
call agregarHorario('MATEMATICA BASICA 1',5,4,'Bryan Paez','T-3 109',4,'07:00-11:00');
call agregarHorario('MATEMATICA BASICA 1',5,4,'Bryan Paez','T-3 109',5,'07:00-11:00');

call agregarHorario('MATEMATICA BASICA 1',6,4,'Bryan Paez','T-3 109',1,'13:00-17:00');
call agregarHorario('MATEMATICA BASICA 1',6,4,'Bryan Paez','T-3 109',2,'13:00-17:00');
call agregarHorario('MATEMATICA BASICA 1',6,4,'Bryan Paez','T-3 109',3,'13:00-17:00');
call agregarHorario('MATEMATICA BASICA 1',6,4,'Bryan Paez','T-3 109',4,'13:00-17:00');
call agregarHorario('MATEMATICA BASICA 1',6,4,'Bryan Paez','T-3 109',5,'13:00-17:00');

call agregarHorario('MATEMATICA BASICA 1',7,5,'Mauro Esbadillo','T-3 105',1,'07:00-11:00');
call agregarHorario('MATEMATICA BASICA 1',7,5,'Mauro Esbadillo','T-3 105',2,'07:00-11:00');
call agregarHorario('MATEMATICA BASICA 1',7,5,'Mauro Esbadillo','T-3 105',3,'07:00-11:00');
call agregarHorario('MATEMATICA BASICA 1',7,5,'Mauro Esbadillo','T-3 105',4,'07:00-11:00');
call agregarHorario('MATEMATICA BASICA 1',7,5,'Mauro Esbadillo','T-3 105',5,'07:00-11:00');

-- ---- AGREGAR ASIGNACION 

call asignarCurso(101,'1S','A',202000011,2);-- Estudiante de Sistemas
call asignarCurso(101,'1S','A',202000012,2);-- Estudiante de Sistemas
call asignarCurso(101,'1S','A',202000013,2);-- Estudiante de Sistemas
call asignarCurso(101,'1S','A',202000014,2);-- Estudiante de Sistemas
call asignarCurso(101,'1S','A',202000015,2);-- Estudiante de Sistemas
call asignarCurso(101,'1S','A',202000016,2);-- Estudiante de Sistemas
call asignarCurso(101,'1S','A',202000017,2);-- Estudiante de Sistemas
call asignarCurso(101,'1S','A',202000018,2);-- Estudiante de Sistemas
call asignarCurso(101,'1S','A',202000019,2);-- Estudiante de Sistemas

call asignarCurso(101,'1S','A',202000021,3);-- Estudiante de Electronica 
call asignarCurso(101,'1S','A',202000022,3);-- Estudiante de Electronica 
call asignarCurso(101,'1S','A',202000023,3);-- Estudiante de Electronica 
call asignarCurso(101,'1S','A',202000024,3);-- Estudiante de Electronica 
call asignarCurso(101,'1S','A',202000025,3);-- Estudiante de Electronica 
call asignarCurso(101,'1S','A',202000026,3);-- Estudiante de Electronica 
call asignarCurso(101,'1S','A',202000027,3);-- Estudiante de Electronica 
call asignarCurso(101,'1S','A',202000028,3);-- Estudiante de Electronica 
call asignarCurso(101,'1S','A',202000029,3);-- Estudiante de Electronica 

call asignarCurso(101,'1S','B',202000031,4);-- Estudiante de Mec. Elec 
call asignarCurso(101,'1S','B',202000032,4);-- Estudiante de Mec. Elec 
call asignarCurso(101,'1S','B',202000033,4);-- Estudiante de Mec. Elec 
call asignarCurso(101,'1S','B',202000034,4);-- Estudiante de Mec. Elec 
call asignarCurso(101,'1S','B',202000035,4);-- Estudiante de Mec. Elec 
call asignarCurso(101,'1S','B',202000036,4);-- Estudiante de Mec. Elec 
call asignarCurso(101,'1S','B',202000037,4);-- Estudiante de Mec. Elec 
call asignarCurso(101,'1S','B',202000038,4);-- Estudiante de Mec. Elec 
call asignarCurso(101,'1S','B',202000039,4);-- Estudiante de Mec. Elec

call asignarCurso(101,'1S','Y',202000041,5);-- Estudiante de Quimica 
call asignarCurso(101,'1S','Y',202000042,5);-- Estudiante de Quimica 
call asignarCurso(101,'1S','Y',202000043,5);-- Estudiante de Quimica 
call asignarCurso(101,'1S','Y',202000044,5);-- Estudiante de Quimica 
call asignarCurso(101,'1S','Y',202000045,5);-- Estudiante de Quimica 
call asignarCurso(101,'1S','Y',202000046,5);-- Estudiante de Quimica 
call asignarCurso(101,'1S','Y',202000047,5);-- Estudiante de Quimica 
call asignarCurso(101,'1S','Y',202000048,5);-- Estudiante de Quimica 
call asignarCurso(101,'1S','Y',202000049,5);-- Estudiante de Quimica

--      SOCIAL HUMANISTICA 1

call asignarCurso(17,'1S','A',202000011,2);-- Estudiante de Sistemas
call asignarCurso(17,'1S','A',202000012,2);-- Estudiante de Sistemas
call asignarCurso(17,'1S','A',202000013,2);-- Estudiante de Sistemas
call asignarCurso(17,'1S','A',202000014,2);-- Estudiante de Sistemas
call asignarCurso(17,'1S','A',202000015,2);-- Estudiante de Sistemas
call asignarCurso(17,'1S','A',202000016,2);-- Estudiante de Sistemas
call asignarCurso(17,'1S','A',202000017,2);-- Estudiante de Sistemas
call asignarCurso(17,'1S','A',202000018,2);-- Estudiante de Sistemas
call asignarCurso(17,'1S','A',202000019,2);-- Estudiante de Sistemas

call asignarCurso(17,'1S','A',202000021,3);-- Estudiante de Electronica 
call asignarCurso(17,'1S','A',202000022,3);-- Estudiante de Electronica 
call asignarCurso(17,'1S','A',202000023,3);-- Estudiante de Electronica 
call asignarCurso(17,'1S','A',202000024,3);-- Estudiante de Electronica 
call asignarCurso(17,'1S','A',202000025,3);-- Estudiante de Electronica 
call asignarCurso(17,'1S','A',202000026,3);-- Estudiante de Electronica 
call asignarCurso(17,'1S','A',202000027,3);-- Estudiante de Electronica 
call asignarCurso(17,'1S','A',202000028,3);-- Estudiante de Electronica 
call asignarCurso(17,'1S','A',202000029,3);-- Estudiante de Electronica 

call asignarCurso(17,'1S','B',202000031,4);-- Estudiante de Mec. Elec 
call asignarCurso(17,'1S','B',202000032,4);-- Estudiante de Mec. Elec 
call asignarCurso(17,'1S','B',202000033,4);-- Estudiante de Mec. Elec 
call asignarCurso(17,'1S','B',202000034,4);-- Estudiante de Mec. Elec 
call asignarCurso(17,'1S','B',202000035,4);-- Estudiante de Mec. Elec 
call asignarCurso(17,'1S','B',202000036,4);-- Estudiante de Mec. Elec 
call asignarCurso(17,'1S','B',202000037,4);-- Estudiante de Mec. Elec 
call asignarCurso(17,'1S','B',202000038,4);-- Estudiante de Mec. Elec 
call asignarCurso(17,'1S','B',202000039,4);-- Estudiante de Mec. Elec

call asignarCurso(17,'1S','B',202000041,5);-- Estudiante de Quimica 
call asignarCurso(17,'1S','B',202000042,5);-- Estudiante de Quimica 
call asignarCurso(17,'1S','B',202000043,5);-- Estudiante de Quimica 
call asignarCurso(17,'1S','B',202000044,5);-- Estudiante de Quimica 
call asignarCurso(17,'1S','B',202000045,5);-- Estudiante de Quimica 
call asignarCurso(17,'1S','B',202000046,5);-- Estudiante de Quimica 
call asignarCurso(17,'1S','B',202000047,5);-- Estudiante de Quimica 
call asignarCurso(17,'1S','B',202000048,5);-- Estudiante de Quimica 
call asignarCurso(17,'1S','B',202000049,5);-- Estudiante de Quimica

--      TECNICA COMPLEMENTARIA 1

call asignarCurso(69,'1S','A',202000011,2);-- Estudiante de Sistemas
call asignarCurso(69,'1S','A',202000012,2);-- Estudiante de Sistemas
call asignarCurso(69,'1S','A',202000013,2);-- Estudiante de Sistemas
call asignarCurso(69,'1S','A',202000014,2);-- Estudiante de Sistemas
call asignarCurso(69,'1S','A',202000015,2);-- Estudiante de Sistemas
call asignarCurso(69,'1S','A',202000016,2);-- Estudiante de Sistemas
call asignarCurso(69,'1S','A',202000017,2);-- Estudiante de Sistemas
call asignarCurso(69,'1S','A',202000018,2);-- Estudiante de Sistemas
call asignarCurso(69,'1S','A',202000019,2);-- Estudiante de Sistemas

call asignarCurso(69,'1S','A',202000021,3);-- Estudiante de Electronica 
call asignarCurso(69,'1S','A',202000022,3);-- Estudiante de Electronica 
call asignarCurso(69,'1S','A',202000023,3);-- Estudiante de Electronica 
call asignarCurso(69,'1S','A',202000024,3);-- Estudiante de Electronica 
call asignarCurso(69,'1S','A',202000025,3);-- Estudiante de Electronica 
call asignarCurso(69,'1S','A',202000026,3);-- Estudiante de Electronica 
call asignarCurso(69,'1S','A',202000027,3);-- Estudiante de Electronica 
call asignarCurso(69,'1S','A',202000028,3);-- Estudiante de Electronica 
call asignarCurso(69,'1S','A',202000029,3);-- Estudiante de Electronica 

call asignarCurso(69,'1S','B',202000031,4);-- Estudiante de Mec. Elec 
call asignarCurso(69,'1S','B',202000032,4);-- Estudiante de Mec. Elec 
call asignarCurso(69,'1S','B',202000033,4);-- Estudiante de Mec. Elec 
call asignarCurso(69,'1S','B',202000034,4);-- Estudiante de Mec. Elec 
call asignarCurso(69,'1S','B',202000035,4);-- Estudiante de Mec. Elec 
call asignarCurso(69,'1S','B',202000036,4);-- Estudiante de Mec. Elec 
call asignarCurso(69,'1S','B',202000037,4);-- Estudiante de Mec. Elec 
call asignarCurso(69,'1S','B',202000038,4);-- Estudiante de Mec. Elec 
call asignarCurso(69,'1S','B',202000039,4);-- Estudiante de Mec. Elec

call asignarCurso(69,'1S','B',202000041,5);-- Estudiante de Quimica 
call asignarCurso(69,'1S','B',202000042,5);-- Estudiante de Quimica 
call asignarCurso(69,'1S','B',202000043,5);-- Estudiante de Quimica 
call asignarCurso(69,'1S','B',202000044,5);-- Estudiante de Quimica 
call asignarCurso(69,'1S','B',202000045,5);-- Estudiante de Quimica 
call asignarCurso(69,'1S','B',202000046,5);-- Estudiante de Quimica 
call asignarCurso(69,'1S','B',202000047,5);-- Estudiante de Quimica 
call asignarCurso(69,'1S','B',202000048,5);-- Estudiante de Quimica 
call asignarCurso(69,'1S','B',202000049,5);-- Estudiante de Quimica

-- ---- AGREGAR DESASIGNACION 1

call desasignarCurso(101,'1S','A',202000011,2);-- Estudiante de Sistemas y Electronica

-- ---- AGREGAR NOTA 9

call ingresarNota(101, '1S', 'A', 202000011, 85.5,  2); -- Error: se desasigno
call ingresarNota(101, '1S', 'A', 202000012, 90,    2);
call ingresarNota(101, '1S', 'A', 202000013, 89,    2);
call ingresarNota(101, '1S', 'A', 202000014, 100,   2);
call ingresarNota(101, '1S', 'A', 202000015, 50,    2);
call ingresarNota(101, '1S', 'A', 202000016, 56,    2);
call ingresarNota(101, '1S', 'A', 202000017, 79,    2);
call ingresarNota(101, '1S', 'A', 202000018, 100,   2);
call ingresarNota(101, '1S', 'A', 202000019, 68,    2);

call ingresarNota(101, '1S', 'A', 202000021, 73,    3);
call ingresarNota(101, '1S', 'A', 202000022, 62.5,  3);
call ingresarNota(101, '1S', 'A', 202000023, 74,    3);
call ingresarNota(101, '1S', 'A', 202000024, 98,    3);
call ingresarNota(101, '1S', 'A', 202000025, 91,    3);
call ingresarNota(101, '1S', 'A', 202000026, 76,    3);
call ingresarNota(101, '1S', 'A', 202000027, 62.5,  3);
call ingresarNota(101, '1S', 'A', 202000028, 63,    3);
call ingresarNota(101, '1S', 'A', 202000029, 46,    3);

call ingresarNota(101, '1S', 'B', 202000031, 72,    4);
call ingresarNota(101, '1S', 'B', 202000032, 68.5,  4);
call ingresarNota(101, '1S', 'B', 202000033, 76,    4);
call ingresarNota(101, '1S', 'B', 202000034, 68,    4);
call ingresarNota(101, '1S', 'B', 202000035, 81,    4);
call ingresarNota(101, '1S', 'B', 202000036, 26,    4);
call ingresarNota(101, '1S', 'B', 202000037, 12.5,  4);
call ingresarNota(101, '1S', 'B', 202000038, 33,    4);
call ingresarNota(101, '1S', 'B', 202000039, 46,    4);

call ingresarNota(101, '1S', 'Y', 202000041, 12,    5);
call ingresarNota(101, '1S', 'Y', 202000042, 38.5,  5);
call ingresarNota(101, '1S', 'Y', 202000043, 56,    5);
call ingresarNota(101, '1S', 'Y', 202000044, 88,    5);
call ingresarNota(101, '1S', 'Y', 202000045, 91,    5);
call ingresarNota(101, '1S', 'Y', 202000046, 100,   5);
call ingresarNota(101, '1S', 'Y', 202000047, 90.5,  5);
call ingresarNota(101, '1S', 'Y', 202000048, 33,    5);
call ingresarNota(101, '1S', 'Y', 202000049, 58,    5);

call generarActa(101, 'A', '1S');
call generarActa(101, 'B', '1S');
call generarActa(101, 'Y', '1S');


-- ----------------------------------------------------
--                   CONSULTAS
-- ----------------------------------------------------

select * from cursosAprobados(202000025,3);

select * from consultaPensum(2); 
select * from consultaPensum(3); 
select * from consultaPensum(4); 
select * from consultaPensum(5);

select * from consultaEstudiante(202000011);
select * from consultaEstudiante(202000012);

select * from consultaDocente(1);
select * from consultaDocente(2);

select * from consultaAsignados(101, '1S','2024', 'A');
select * from consultaAsignados(101, '1S','2024', 'B');
select * from consultaAsignados(101, '1S','2024', 'Y');

select * from consultaAprobacion(101, '1S','2024', 'A');
select * from consultaAprobacion(101, '1S','2024', 'B');
select * from consultaAprobacion(101, '1S','2024', 'Y');

select * from consultar_acta(101);