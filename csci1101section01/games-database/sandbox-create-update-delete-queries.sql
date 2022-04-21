INSERT INTO
	sandbox(int16_value, double_value, datetime_value)
VALUES
	(-235, 1557.2467, '2030-02-15 13:18:56')

UPDATE
	sandbox
SET
	int32_value = 781650874,
	bool_value = 1
WHERE
	id = 27

DELETE FROM sandbox WHERE id = 37