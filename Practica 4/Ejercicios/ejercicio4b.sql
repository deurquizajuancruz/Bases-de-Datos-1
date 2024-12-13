/*
Hallar los pacientes (únicamente es necesario su id) que se atendieron con todos los
doctores de la ciudad en la que viven
b. Realice la consulta utilizando la vista creada anteriormente
Restricción: resolver este ejercicio sin usar la cláusula “NOT EXIST”.
*/

SELECT p.patient_id
FROM appointments.patient AS p
WHERE (
    SELECT COUNT(DISTINCT doctor_id)
    FROM doctors_per_patients AS dpp
    WHERE dpp.patient_id = p.patient_id
    AND EXISTS (
        SELECT 1
        FROM appointments.medical_review AS mr
        WHERE mr.patient_id = p.patient_id
        AND mr.doctor_id = dpp.doctor_id
    )
) = (
    SELECT COUNT(doctor_id)
    FROM appointments.doctor AS d
    WHERE d.doctor_city = p.patient_city
);

SELECT p.patient_id
FROM appointments.patient AS p
WHERE (
    SELECT COUNT(DISTINCT doctor_id)
    FROM doctors_per_patients AS dpp
    WHERE dpp.patient_id = p.patient_id
) = (
    SELECT COUNT(DISTINCT d.doctor_id)
    FROM appointments.medical_review AS mr
    JOIN appointments.doctor AS d
    ON mr.doctor_id = d.doctor_id
    WHERE d.doctor_city = p.patient_city
    AND mr.patient_id = p.patient_id
);