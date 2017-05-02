DELIMITER $$

/*
drop_map (country, number)
*/

DROP PROCEDURE IF EXISTS drop_map $$
CREATE PROCEDURE drop_map (IN in_country char(2), in_number bigint)
BEGIN

DELETE FROM map_code WHERE country = in_country AND number = in_number;

SET @post = CONCAT('DROP TABLE map_', in_country, in_number, '_post');
PREPARE stmt1 FROM @post;
EXECUTE stmt1;

SET @reply= CONCAT('DROP TABLE map_', in_country, in_number, '_reply');
PREPARE stmt2 FROM @reply;
EXECUTE stmt2;

DEALLOCATE PREPARE stmt1;
DEALLOCATE PREPARE stmt2;
END$$

DELIMITER ;
