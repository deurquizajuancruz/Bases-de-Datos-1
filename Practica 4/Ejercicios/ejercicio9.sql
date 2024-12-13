/*
Ejecutar el stored procedure del punto 9 con los siguientes datos:
patient_id: 10004427
4
Cátedra de Bases de Datos 1
Cursada 2024
doctor_id: 1003
appointment_duration: 30
contact_phone: +54 15 2913 9963
observations: ‘Hospital Italiano’
medication_name: ‘Paracetamol
*/
CALL appointments.add_appointment(10004427, 1003, 30, '+54 15 2913 9963', 'Hospital Italiano', 'Paracetamol');
