-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 25 Mai 2018 à 11:55
-- Version du serveur :  5.7.22-0ubuntu0.16.04.1
-- Version de PHP :  7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `hotel`
--

-- --------------------------------------------------------

--
-- Structure de la table `Assoc`
--

CREATE TABLE `Assoc` (
  `id_assoc` int(10) UNSIGNED NOT NULL,
  `id_service` int(10) UNSIGNED NOT NULL,
  `id_customer` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Assoc`
--

INSERT INTO `Assoc` (`id_assoc`, `id_service`, `id_customer`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 1, 2),
(5, 2, 2),
(6, 3, 3),
(7, 1, 3),
(8, 2, 4),
(9, 3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `Booking`
--

CREATE TABLE `Booking` (
  `id_booking` int(10) UNSIGNED NOT NULL,
  `id_customer` int(10) UNSIGNED NOT NULL,
  `id_room` int(10) UNSIGNED NOT NULL,
  `arrival` date NOT NULL,
  `departure` date NOT NULL,
  `customer_service` int(10) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `statut` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Booking`
--

INSERT INTO `Booking` (`id_booking`, `id_customer`, `id_room`, `arrival`, `departure`, `customer_service`, `price`, `statut`) VALUES
(1, 1, 1, '2018-06-18', '2018-06-25', 1, 200, 'en cours'),
(2, 2, 2, '2018-03-05', '2018-03-12', 2, 155, 'paiement effectué'),
(3, 3, 3, '2018-05-17', '2018-05-23', 3, 275, 'paiement effectué'),
(4, 4, 4, '2018-07-15', '2018-07-18', 4, 350, 'annulée');

-- --------------------------------------------------------

--
-- Structure de la table `Category`
--

CREATE TABLE `Category` (
  `id_category` int(10) UNSIGNED NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Category`
--

INSERT INTO `Category` (`id_category`, `name`) VALUES
(1, 'matériel'),
(2, 'bien-être'),
(3, 'repas'),
(4, 'spécial');

-- --------------------------------------------------------

--
-- Structure de la table `Customer`
--

CREATE TABLE `Customer` (
  `id_customer` int(10) UNSIGNED NOT NULL,
  `name` varchar(55) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `phone` varchar(55) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Customer`
--

INSERT INTO `Customer` (`id_customer`, `name`, `firstname`, `phone`, `mail`, `address`, `password`) VALUES
(1, 'Metairie', 'Robert', '0505483848', 'robert.Metairie@gmail.com', 'Les metairies Stade louis michel Sete', 'FCSETE34'),
(2, 'Lebo', 'Albert', '0554638237', 'albert.lebo@gmail.com', '45 rue des avoines Gigean', 'vroumvroum'),
(3, 'Salami', 'Fred', '0678985467', 'fred.salami@gmail.com', 'rue des 7 nains', 'blanche neige'),
(4, 'Caron', 'Antoine', '0476904367', 'antoine.caron@gmail.com', '666 rue du pays merveilleux', 'sheitan');

-- --------------------------------------------------------

--
-- Structure de la table `Room`
--

CREATE TABLE `Room` (
  `id_room` int(10) UNSIGNED NOT NULL,
  `name` varchar(55) NOT NULL,
  `superficy` int(11) NOT NULL,
  `room_category` tinyint(1) NOT NULL,
  `floor` int(11) NOT NULL,
  `view` varchar(255) NOT NULL,
  `accessibility` tinyint(1) NOT NULL,
  `bed` varchar(255) NOT NULL,
  `bathroom` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `service_reduced` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Room`
--

INSERT INTO `Room` (`id_room`, `name`, `superficy`, `room_category`, `floor`, `view`, `accessibility`, `bed`, `bathroom`, `price`, `service_reduced`) VALUES
(1, 'Paris', 25, 0, 1, 'parking', 1, 'lit simple', 'douche', 50, 1),
(2, 'Venise', 25, 0, 1, 'ville', 0, 'lit simple', 'douche', 70, 1),
(3, 'Rome', 40, 1, 2, 'montagne', 1, 'lit double : queen size', 'baignoire', 100, 0),
(4, 'Madrid', 50, 1, 2, 'mer', 1, 'lit double : king size', 'douche et baignoire', 125, 0);

-- --------------------------------------------------------

--
-- Structure de la table `Service`
--

CREATE TABLE `Service` (
  `id_service` int(10) UNSIGNED NOT NULL,
  `name` varchar(55) NOT NULL,
  `content` text NOT NULL,
  `price` int(11) NOT NULL,
  `id_category` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Service`
--

INSERT INTO `Service` (`id_service`, `name`, `content`, `price`, `id_category`) VALUES
(1, 'petit déjeuner', 'Petit déjeuner dans la salle de réception ou dans votre chambre', 7, 3),
(2, 'mini bar', 'Mini bar disponible dans votre chambre dés votre arrivé', 35, 1),
(3, 'champagne', 'Bouteille de champagne en chambre pedant votre séjour ou à votre arrivé', 25, 4);

-- --------------------------------------------------------

--
-- Structure de la table `Users`
--

CREATE TABLE `Users` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `name` varchar(55) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Users`
--

INSERT INTO `Users` (`id_user`, `name`, `password`) VALUES
(1, 'gerant', 'iamtheking');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Assoc`
--
ALTER TABLE `Assoc`
  ADD PRIMARY KEY (`id_assoc`),
  ADD KEY `FK_id_service` (`id_service`),
  ADD KEY `FK_customer` (`id_customer`);

--
-- Index pour la table `Booking`
--
ALTER TABLE `Booking`
  ADD PRIMARY KEY (`id_booking`),
  ADD KEY `FK_id_room` (`id_room`),
  ADD KEY `FK_id_customer` (`id_customer`),
  ADD KEY `FK_customer_service` (`customer_service`);

--
-- Index pour la table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id_category`);

--
-- Index pour la table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Index pour la table `Room`
--
ALTER TABLE `Room`
  ADD PRIMARY KEY (`id_room`);

--
-- Index pour la table `Service`
--
ALTER TABLE `Service`
  ADD PRIMARY KEY (`id_service`),
  ADD KEY `FK_id_category` (`id_category`);

--
-- Index pour la table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Assoc`
--
ALTER TABLE `Assoc`
  MODIFY `id_assoc` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `Booking`
--
ALTER TABLE `Booking`
  MODIFY `id_booking` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `Category`
--
ALTER TABLE `Category`
  MODIFY `id_category` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `id_customer` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `Room`
--
ALTER TABLE `Room`
  MODIFY `id_room` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `Service`
--
ALTER TABLE `Service`
  MODIFY `id_service` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `Users`
--
ALTER TABLE `Users`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Assoc`
--
ALTER TABLE `Assoc`
  ADD CONSTRAINT `FK_customer` FOREIGN KEY (`id_customer`) REFERENCES `Customer` (`id_customer`),
  ADD CONSTRAINT `FK_id_service` FOREIGN KEY (`id_service`) REFERENCES `Service` (`id_service`);

--
-- Contraintes pour la table `Booking`
--
ALTER TABLE `Booking`
  ADD CONSTRAINT `FK_customer_service` FOREIGN KEY (`customer_service`) REFERENCES `Assoc` (`id_customer`),
  ADD CONSTRAINT `FK_id_customer` FOREIGN KEY (`id_customer`) REFERENCES `Customer` (`id_customer`),
  ADD CONSTRAINT `FK_id_room` FOREIGN KEY (`id_room`) REFERENCES `Room` (`id_room`);

--
-- Contraintes pour la table `Service`
--
ALTER TABLE `Service`
  ADD CONSTRAINT `FK_id_category` FOREIGN KEY (`id_category`) REFERENCES `Category` (`id_category`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
