/*Insert todas semillas*/
insert into semilla(nombre,elemento,nivel,tiempo_espera) values('patata fuego','fuego',1,5), ('zanahoria fuego','fuego',2,15), ('col fuego','fuego',3,30), ('garbanzo fuego','fuego',4,60), 
															   ('patata agua','agua',1,5), ('zanahoria agua','agua',2,15), ('col agua','agua',3,30), ('garbanzo agua','agua',4,60),
                                                               ('patata tierra','tierra',1,5), ('zanahoria tierra','tierra',2,15), ('col tierra','tierra',3,30), ('garbanzo tierra','tierra',4,60),
                                                               ('patata aire','aire',1,5), ('zanahoria aire','aire',2,15), ('col aire','aire',3,30), ('garbanzo aire','aire',4,60);

	

/*Insert todas plantas*/
insert into planta(nombre,elemento,nivel) values('patata fuego','fuego',1), ('zanahoria fuego','fuego',2), ('col fuego','fuego',3), ('garbanzo fuego','fuego',4), 
															   ('patata agua','agua',1), ('zanahoria agua','agua',2), ('col agua','agua',3), ('garbanzo agua','agua',4),
                                                               ('patata tierra','tierra',1), ('zanahoria tierra','tierra',2), ('col tierra','tierra',3), ('garbanzo tierra','tierra',4),
                                                               ('patata aire','aire',1), ('zanahoria aire','aire',2), ('col aire','aire',3), ('garbanzo aire','aire',4);

/*Insert todos los zumos*/
insert into zumo(nombre,elemento,tipo,tiempo_espera) values('patata fuego','fuego',1,5), ('zanahoria fuego','fuego',2,15), ('col fuego','fuego',3,30), ('garbanzo fuego','fuego',4,60), 
															   ('patata agua','agua',1,5), ('zanahoria agua','agua',2,15), ('col agua','agua',3,30), ('garbanzo agua','agua',4,60),
                                                               ('patata tierra','tierra',1,5), ('zanahoria tierra','tierra',2,15), ('col tierra','tierra',3,30), ('garbanzo tierra','tierra',4,60),
                                                               ('patata aire','aire',1,5), ('zanahoria aire','aire',2,15), ('col aire','aire',3,30), ('garbanzo aire','aire',4,60);         
                                                               
/*Ejemplo insert usuario*/										
insert into usuario(nombre,apellido,edad,email,contrasena,nick,privacidad)	values('alvaro','martin','1991-10-07','alvaro@alvaro.com','1234','alvaromn91',1);	

/*Ejemplo insert granja*/
insert into granja(nombre,elemento,fk_id_usuario) values('landia','aire',2);       

/*Ejemplo insert usuario*/										
insert into usuario(nombre,apellido,edad,email,contrasena,nick,privacidad)	values('oscar','melgarejo','2000-01-01','oscar@oscar.com','1234','zzeddy',1);	

/*Ejemplo insert granja*/
insert into granja(nombre,elemento,fk_id_usuario) values('zzeddys','fuego',2);                                                                                                                                                                                                                                                                                                                               