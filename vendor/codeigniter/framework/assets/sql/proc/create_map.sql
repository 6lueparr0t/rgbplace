DELIMITER $$

/*
create_map (country, locality, political1, political2)
*/

DROP PROCEDURE IF EXISTS create_map $$
CREATE PROCEDURE create_map (IN in_country char(2), in_local varchar(200), in_pol1 varchar(400), in_pol2 varchar(400))
BEGIN

DECLARE in_number bigint default 0;
SELECT number into in_number FROM map_code WHERE country = in_country LIMIT 1;
SET in_number = in_number + 1;

-- locality:서울특별시|Seoul&political1:동작구|Dongjak-gu&political2:흑석동|Heukseok-dong
INSERT INTO map_code (country, number, place) values(in_country, in_number, concat("locality:", in_local, "&political1:", in_pol1, "&political2:", in_pol2));
SET @post = CONCAT('CREATE TABLE map_', in_country, in_number, '_post (
	no      bigint not null auto_increment,
	uid     varchar(100) not null,
	name    varchar(100) not null,
	ctim    datetime not null default current_timestamp,
	dtim    datetime not null,
	utim    datetime not null,
	title   varchar(1000) not null,
	content text not null,
	type    varchar(20) not null,
	tag     varchar(20) not null,
	keyword varchar(400) not null,
	PRIMARY KEY (no)
)');

PREPARE stmt1 FROM @post;
EXECUTE stmt1;

SET @reply = CONCAT('CREATE TABLE map_', in_country,  in_number, '_reply(
	no		bigint			not null auto_increment,
	uid		varchar(100)	not null,
	name	varchar(100)	not null,
	ctim	datetime		not null default current_timestamp,
	utim	datetime,
	dtim	datetime,
	content	varchar(2000)	not null,
	parent	bigint,
	PRIMARY KEY (no)
)');

PREPARE stmt2 FROM @reply;
EXECUTE stmt2;

DEALLOCATE PREPARE stmt1;
DEALLOCATE PREPARE stmt2;
END$$

DELIMITER ;
