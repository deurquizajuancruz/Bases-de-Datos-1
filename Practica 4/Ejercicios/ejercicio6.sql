/*
Crear un Stored Procedure que realice los siguientes pasos dentro de una
transacción:
a. Realizar una consulta que para cada pacient (identificado por id_patient),
calcule la cantidad de appointments que tiene registradas. Registrar la fecha
en la que se realiza esta carga y además del usuario con el se realiza.
b. Guardar el resultado de la consulta en un cursor.
c. Iterar el cursor e insertar los valores correspondientes en la tabla
APPOINTMENTS PER PATIENT
*/

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_appointments_per_patient`()
BEGIN
	DECLARE fin INT DEFAULT 0;
    DECLARE id_patient INT;
    DECLARE cur CURSOR FOR
        SELECT p.patient_id
        FROM appointments.patient AS p;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;
    START TRANSACTION;
    OPEN cur;
    loop_cursor: LOOP
        FETCH cur INTO id_patient;
        IF fin = 1 THEN
            LEAVE loop_cursor;
        END IF;
        INSERT INTO appointments.appointments_per_patient (id_patient, count_appointments, last_update, user)
        VALUES (id_patient, 
        (SELECT COUNT(*)
        FROM appointments.medical_review AS mr
        WHERE mr.patient_id = id_patient), 
        NOW(),
        CURRENT_USER());
    END LOOP;
    CLOSE cur;
    COMMIT;
END

CALL appointments.`insert_appointments_per_patient`();

SELECT * FROM appointments.appointments_per_patient;