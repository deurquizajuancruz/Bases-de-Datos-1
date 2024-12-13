/*
Hallar los pacientes (únicamente es necesario su id) que se atendieron con todos los
doctores de la ciudad en la que viven
a. Realice la consulta sin utilizar la vista creada anteriormente
Restricción: resolver este ejercicio sin usar la cláusula “NOT EXIST”.
*/

SELECT p.patient_id
FROM appointments.patient AS p
WHERE (
SELECT COUNT(doctor_id)
 FROM appointments.doctor AS d
 WHERE p.patient_city = d.doctor_city)
= (
	SELECT COUNT(DISTINCT d.doctor_id)
    FROM appointments.medical_review AS M
    INNER JOIN appointments.doctor AS d
    ON M.doctor_id = d.doctor_id
    WHERE p.patient_id = M.patient_id
    AND p.patient_city = d.doctor_city
)