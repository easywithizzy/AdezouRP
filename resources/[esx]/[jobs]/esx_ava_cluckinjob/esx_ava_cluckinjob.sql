INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_cluckin','Cluckin Bell',1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_cluckin','Cluckin Bell', 1)
;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_cluckin', 'Cluckin Bell', 1)
;

INSERT INTO `jobs`(`name`, `label`, `whitelisted`) VALUES
	('cluckin', 'Cluckin Bell', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('cluckin',0,'employe','Employé', 200, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}','{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	('cluckin',1,'chef','Chef', 400, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}','{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	('cluckin',2,'boss','Patron', 500,'{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}','{"tshirt_1":15,"tshirt_2":0,"torso_1":14,"torso_2":15,"shoes_1":12,"shoes_2":0,"pants_1":9, "pants_2":5, "arms":1, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}')
;


INSERT INTO `items` (`name`, `label`, `limit`) VALUES
	('alive_chicken', 'Poule en cage', 20),
	('plucked_chicken', 'Poulet déplumé', 20),
	('raw_chicken', 'Poulet cru', 160),
	('nuggets', 'Boite de nuggets', 20),
	('chickenburger', 'Chicken Burger', 20),
	('frites', 'Frites', 20),
	('sprite', 'Sprite', 20),
	('orangina', 'Orangina', 20),
	('potato', 'Patate', 20),

	('doublechickenburger', 'Double Chicken Burger', 20),
	('potatoes', 'Potatoes', 20),
	('tenders', 'Tenders', 20),
	('chickenwrap', 'Wrap au poulet', 20)

;

INSERT INTO `vehicles_society`(`name`, `model`, `price`, `society`) VALUES 
('Benson', 'benson', 200000, 'society_cluckin'),
('FoodTruck', 'taco', 200000, 'society_cluckin');