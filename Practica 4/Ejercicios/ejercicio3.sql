/*
Crear una vista llamada ‘doctors_per_patients’ que muestre los id de los pacientes y
los id de doctores de la ciudad donde vive el cliente
*/

DROP VIEW doctors_per_patients;

CREATE VIEW doctors_per_patients AS 
(SELECT p.patient_id, d.doctor_id
FROM appointments.patient AS p
INNER JOIN appointments.doctor AS d
ON p.patient_city = d.doctor_city);

SELECT * FROM doctors_per_patients;