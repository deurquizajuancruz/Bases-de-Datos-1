/*
Dado el siguiente esquema:
DUEÑO (id_dueño, nombre, teléfono, dirección, dni)
CHOFER (id_chofer, nombre, teléfono, dirección, fecha_licencia_desde,
fecha_licencia_hasta, dni)
AUTO (patente, id_dueño, id_chofer, marca, modelo, año)
VIAJE (patente, hora_desde, hora_hasta, origen, destino, tarifa, metraje)
a. Listar el dni, nombre y teléfono de todos los dueños que NO son choferes
b. Listar la patente y el id_chofer de todos los autos a cuyos choferes les
caduca la licencia el 01/01/2024
*/

/* a */
SELECT d.dni, d.nombre, d.telefono
FROM DUEÑO AS d
WHERE d.dni NOT IN (
SELECT c.dni
FROM CHOFER AS c)

/* b */
SELECT a.patente, a.id_chofer
FROM AUTO AS a
INNER JOIN CHOFER AS c 
ON a.id_chofer = c.id_chofer
WHERE c.fecha_licencia_hasta = '2024-01-01'

/*
ESTUDIANTE (#legajo, nombreCompleto, nacionalidad, añoDeIngreso, códigoDeCarrera)
CARRERA (códigoDeCarrera, nombre)
INSCRIPCIONAMATERIA (#legajo, códigoDeMateria)
MATERIA (códigoDeMateria, nombre)
a. Obtener el nombre de los estudiantes que ingresaron en 2019.
b. Obtener el nombre de los estudiantes con nacionalidad “Argentina” que NO
estén en la carrera con código “LI07”
*/

/* a */
SELECT e.nombreCompleto
FROM ESTUDIANTE AS e
WHERE añoDeIngreso = 2019

/* b */
SELECT e.nombreCompleto
FROM ESTUDIANTE AS e
WHERE nacionalidad = 'Argentina' AND códigoDeCarrera <> "LI07"