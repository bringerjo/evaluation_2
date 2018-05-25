CREATE DATABASE hotel CHARACTER SET 'utf8';
USE `hotel`;

DROP TABLE IF EXISTS `Room`;
CREATE TABLE `Room` (
  	`id_room` INT unsigned NOT NULL AUTO_INCREMENT,
  	`name` VARCHAR(55) NOT NULL,
  	`superficy` INT NOT NULL,
  	`room_category` TINYINT(1) NOT NULL,
  	`floor` INT NOT NULL,
  	`view` VARCHAR(255) NOT NULL,
  	`accessibility` TINYINT(1) NOT NULL,
  	`bed` VARCHAR(255) NOT NULL,
  	`bathroom` VARCHAR(255) NOT NULL,
  	`price` INT NOT NULL,
  	`service_reduced` TINYINT(1) NOT NULL,
  	PRIMARY KEY (`id_room`)
) 	ENGINE=InnoDB;

DROP TABLE IF EXISTS `Customer`;
CREATE TABLE `Customer` (
  	`id_customer` INT unsigned NOT NULL AUTO_INCREMENT,
  	`name` VARCHAR(55) NOT NULL,
  	`firstname` VARCHAR(55) NOT NULL,
  	`phone` VARCHAR(55) NOT NULL,
  	`mail` VARCHAR(255) NOT NULL,
  	`address` VARCHAR(255) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
  	PRIMARY KEY (`id_customer`)
) 	ENGINE=InnoDB;

DROP TABLE IF EXISTS `Category`;
CREATE TABLE `Category` (
	`id_category` INT unsigned NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(55) NOT NULL,
	PRIMARY KEY (`id_category`)
) 	ENGINE=InnoDB;

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
	`id_user` INT unsigned NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(55) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id_user`)
) 	ENGINE=InnoDB;

DROP TABLE IF EXISTS `Service`;
CREATE TABLE `Service` (
	`id_service` INT unsigned NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(55) NOT NULL,
	`content` TEXT NOT NULL,
	`price` INT NOT NULL,
	`id_category` INT unsigned NOT NULL,
	CONSTRAINT FK_id_category FOREIGN KEY (id_category) REFERENCES Category(id_category),
	PRIMARY KEY (`id_service`)

) 	ENGINE=InnoDB;

DROP TABLE IF EXISTS `Assoc`;
CREATE TABLE `Assoc` (
	`id_assoc` INT unsigned  NOT NULL AUTO_INCREMENT,
	`id_service` INT unsigned NOT NULL,
	`id_customer` INT unsigned NOT NULL,
	CONSTRAINT FK_id_service FOREIGN KEY (id_service) REFERENCES Service(id_service),
	CONSTRAINT FK_customer FOREIGN KEY (id_customer) REFERENCES Customer(id_customer),
	PRIMARY KEY (`id_Assoc`)
) 	ENGINE=InnoDB;

DROP TABLE IF EXISTS `Booking`;
CREATE TABLE `Booking` (
  	`id_booking` INT unsigned NOT NULL AUTO_INCREMENT,
  	`id_customer` INT unsigned NOT NULL,
  	`id_room` INT unsigned NOT NULL,
  	`arrival` DATE NOT NULL,
  	`departure` DATE NOT NULL,
  	`customer_service` INT unsigned NOT NULL,
	`price` INT NOT NULL,
  	`statut` VARCHAR(255) NOT NULL,
	CONSTRAINT FK_id_room FOREIGN KEY (id_room) REFERENCES Room(id_room),
    CONSTRAINT FK_id_customer FOREIGN KEY (id_customer) REFERENCES Customer(id_customer),
    CONSTRAINT FK_customer_service FOREIGN KEY (customer_service) REFERENCES Assoc(id_customer),
    PRIMARY KEY (`id_booking`)
) 	ENGINE=InnoDB;

INSERT INTO `Room` (`name`, `superficy`, `room_category`, `floor`, `view`, `accessibility`, `bed`, `bathroom`, `price`, `service_reduced`) VALUES
('Paris', '25', '0', '1', 'parking', '1', 'lit simple', 'douche', '50', '1'),
('Venise', '25', '0', '1', 'ville', '0', 'lit simple', 'douche', '70', '1'),
('Rome', '40', '1', '2', 'montagne', '1', 'lit double : queen size', 'baignoire', '100', '0'),
('Madrid', '50', '1', '2', 'mer', '1', 'lit double : king size', 'douche et baignoire', '125', '0');

INSERT INTO `Customer` (`name`, `firstname`, `phone`, `mail`, `address`, `password`) VALUES
('Metairie', 'Robert', '0505483848', 'robert.Metairie@gmail.com', 'Les metairies Stade louis michel Sete', 'FCSETE34'),
('Lebo', 'Albert', '0554638237', 'albert.lebo@gmail.com', '45 rue des avoines Gigean', 'vroumvroum'),
('Salami', 'Fred', '0678985467', 'fred.salami@gmail.com', 'rue des 7 nains', 'blanche neige'),
('Caron', 'Antoine', '0476904367', 'antoine.caron@gmail.com', '666 rue du pays merveilleux', 'sheitan');

INSERT INTO `Category` (`name`) VALUES
('matériel'),
('bien-être'),
('repas'),
('spécial');

INSERT INTO `Users` (`name`, `password`) VALUES
('gerant', 'iamtheking');

INSERT INTO `Service` (`name`, `content`, `price`, `id_category`) VALUES
('petit déjeuner', 'Petit déjeuner dans la salle de réception ou dans votre chambre', '7', 3),
('mini bar', 'Mini bar disponible dans votre chambre dés votre arrivé', '35', 1),
('champagne', 'Bouteille de champagne en chambre pedant votre séjour ou à votre arrivé', '25', 4);

INSERT INTO `Assoc` (`id_service`, `id_customer`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 2),
(3, 3),
(1, 3),
(2, 4),
(3, 4);

INSERT INTO `Booking` (`id_customer`, `id_room`, `arrival`, `departure`, `customer_service`, `price`, `statut`) VALUES
(1, 1, '2018-06-18', '2018-06-25', 1, '200', 'en cours'),
(2, 2, '2018-03-05', '2018-03-12', 2, '155', 'paiement effectué'),
(3, 3, '2018-05-17', '2018-05-23', 3, '275', 'paiement effectué'),
(4, 4, '2018-07-15', '2018-07-18', 4, '350', 'annulée');
