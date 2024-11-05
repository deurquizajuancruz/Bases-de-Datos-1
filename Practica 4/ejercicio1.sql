/*
Crea un usuario para las bases de datos usando el nombre ‘appointments_user’.
Asigne a estos todos los permisos sobre sus respectivas tablas. Habiendo creado
este usuario evitaremos el uso de ‘root’ para el resto del trabajo práctico.
Adicionalmente, con respecto a esta base de datos:
a. Cree un usuario sólo con permisos para realizar consultas de selección, es
decir que no puedan realizar cambios en la base. Use el nombre
‘appointments_select’.
b. Cree un usuario que pueda realizar consultas de selección, inserción,
actualización y eliminación a nivel de filas, pero que no puedan modificar el
esquema. Use el nombre ‘appointments_update’.
c. Cree un usuario que tenga los permisos de los anteriores, pero que además
pueda modificar el esquema de la base de datos. Use el nombre
'appointments_schema’.
*/
-- Usuario con todos los permisos
CREATE USER 'appointments_user'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON appointments.* TO 'appointments_user'@'localhost';
FLUSH PRIVILEGES;

-- Usuario con solo permisos de selección
CREATE USER 'appointments_select'@'localhost' IDENTIFIED BY 'root';
GRANT SELECT ON appointments.* TO 'appointments_select'@'localhost';
FLUSH PRIVILEGES;

-- Usuario con permisos para manipular datos pero no el esquema
CREATE USER 'appointments_update'@'localhost' IDENTIFIED BY 'root';
GRANT SELECT, INSERT, UPDATE, DELETE ON appointments.* TO 'appointments_update'@'localhost';
FLUSH PRIVILEGES;

-- Usuario con permisos para manipular datos y el esquema
CREATE USER 'appointments_schema'@'localhost' IDENTIFIED BY 'root';
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER, CREATE, DROP, INDEX ON appointments.* TO 'appointments_schema'@'localhost';
FLUSH PRIVILEGES;
