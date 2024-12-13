/*
Hallar aquellos pacientes que para todas sus consultas médicas siempre hayan
dejado su número de teléfono primario (nunca el teléfono secundario)
*/

SELECT p.*
FROM appointments.patient AS p
WHERE NOT EXISTS (
    SELECT 1
    FROM appointments.appointment AS a
    WHERE a.patient_id = p.patient_id 
    AND a.contact_phone <> p.primary_phone
);