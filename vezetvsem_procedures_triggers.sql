USE vezetvsem;
DROP PROCEDURE IF EXISTS sp_add_user;
DELIMITER //
CREATE PROCEDURE sp_add_user(username VARCHAR(50),
							firstname VARCHAR(100),
                                                         lastname VARCHAR(100),
							 email VARCHAR(100),
							 phone BIGINT,
							 password_hash VARCHAR(100),
                                                         location_index VARCHAR(100))
BEGIN

	INSERT INTO users
		(username, firstname, lastname, email,phone, password_hash,location_index)
	VALUES
		(username, firstname, lastname, email,phone, password_hash,location_index);

	SELECT last_insert_id() INTO @last_user_id;

	INSERT INTO customers
		(users_id)
	VALUES
		(@last_user_id);
	
END ;

END //
DELIMITER ;



USE vezetvsem;
DELIMITER //
CREATE TRIGGER `customers_BEFORE_INSERT`
BEFORE INSERT ON `customers` FOR EACH ROW BEGIN
    IF NEW.bithday > NOW() THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Дата рождения должна быть в прошлом';
    END IF;
END //
DELIMITER ;

