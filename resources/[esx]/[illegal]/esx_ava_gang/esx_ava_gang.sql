INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('gang_vagos','Vagos', 1)
	('gang_vagos_black','Vagos', 1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('gang_vagos','Vagos', 1)
;

CREATE TABLE `user_gang` (
	`identifier` varchar(50) NOT NULL,
	`name` varchar(50) NOT NULL,
	`grade` int(2) NOT NULL DEFAULT '0',

	PRIMARY KEY (`identifier`)
);
