CREATE DEFINER=`root`@`localhost` TRIGGER `appointment_AFTER_INSERT` AFTER INSERT ON `appointment` FOR EACH ROW BEGIN
	DECLARE nuevaCantidad INT;
    SET nuevaCantidad = (SELECT COUNT(*)
    FROM appointment AS a
    WHERE a.patient_id = NEW.patient_id);
    UPDATE appointments_per_patient
    SET count_appointments = nuevaCantidad,
		last_update = now()
    WHERE id_patient = NEW.patient_id;
END