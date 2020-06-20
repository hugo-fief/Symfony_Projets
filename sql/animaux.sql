-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 20 juin 2020 à 18:01
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `animaux`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

DROP TABLE IF EXISTS `animal`;
CREATE TABLE IF NOT EXISTS `animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poids` int(11) NOT NULL,
  `dangereux` tinyint(1) NOT NULL,
  `famille_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6AAB231F97A77B84` (`famille_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `animal`
--

INSERT INTO `animal` (`id`, `nom`, `description`, `image`, `poids`, `dangereux`, `famille_id`) VALUES
(21, 'Chien', 'Un animal domestique', 'chien.png', 10, 0, 7),
(22, 'Cochon', 'Un animal d\'élevage', 'cochon.png', 300, 0, 7),
(23, 'Serpent', 'Un animal dangereux', 'serpent.png', 5, 1, 8),
(24, 'Crocodile', 'Un animal très dangereux', 'croco.png', 500, 1, 8),
(25, 'Requin', 'Un animal marin très dangereux', 'requin.png', 800, 1, 9);

-- --------------------------------------------------------

--
-- Structure de la table `continent`
--

DROP TABLE IF EXISTS `continent`;
CREATE TABLE IF NOT EXISTS `continent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `continent`
--

INSERT INTO `continent` (`id`, `libelle`) VALUES
(6, 'Europe'),
(7, 'Asie'),
(8, 'Afrique'),
(9, 'Océanie'),
(10, 'Amérique');

-- --------------------------------------------------------

--
-- Structure de la table `continent_animal`
--

DROP TABLE IF EXISTS `continent_animal`;
CREATE TABLE IF NOT EXISTS `continent_animal` (
  `continent_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  PRIMARY KEY (`continent_id`,`animal_id`),
  KEY `IDX_E557C2C8921F4C77` (`continent_id`),
  KEY `IDX_E557C2C88E962C16` (`animal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `continent_animal`
--

INSERT INTO `continent_animal` (`continent_id`, `animal_id`) VALUES
(6, 21),
(6, 22),
(7, 21),
(7, 23),
(8, 21),
(8, 23),
(8, 24),
(9, 21),
(9, 23),
(9, 24),
(9, 25),
(10, 21),
(10, 22),
(10, 25);

-- --------------------------------------------------------

--
-- Structure de la table `dispose`
--

DROP TABLE IF EXISTS `dispose`;
CREATE TABLE IF NOT EXISTS `dispose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `animal_id` int(11) DEFAULT NULL,
  `personne_id` int(11) DEFAULT NULL,
  `nb` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6262E0668E962C16` (`animal_id`),
  KEY `IDX_6262E066A21BD112` (`personne_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dispose`
--

INSERT INTO `dispose` (`id`, `animal_id`, `personne_id`, `nb`) VALUES
(1, 21, 1, 30),
(2, 22, 1, 10),
(3, 23, 1, 2),
(4, 23, 2, 5),
(5, 24, 2, 10),
(6, 25, 3, 20);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20200617130321', '2020-06-17 13:05:47', 99),
('DoctrineMigrations\\Version20200617140452', '2020-06-17 14:05:48', 1804),
('DoctrineMigrations\\Version20200617144908', '2020-06-17 14:49:53', 954),
('DoctrineMigrations\\Version20200617162808', '2020-06-17 16:29:09', 4272),
('DoctrineMigrations\\Version20200617184746', '2020-06-17 18:50:42', 2703);

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

DROP TABLE IF EXISTS `famille`;
CREATE TABLE IF NOT EXISTS `famille` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `famille`
--

INSERT INTO `famille` (`id`, `libelle`, `description`) VALUES
(7, 'mammifères', 'Animaux vertébrés nourrissant leurs petits avec du lait'),
(8, 'reptiles', 'Animaux vertébrés qui rampent'),
(9, 'poissons', 'Animaux invertébrés du monde aquatique');

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id`, `nom`) VALUES
(1, 'Milo'),
(2, 'Tya'),
(3, 'Lili');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `FK_6AAB231F97A77B84` FOREIGN KEY (`famille_id`) REFERENCES `famille` (`id`);

--
-- Contraintes pour la table `continent_animal`
--
ALTER TABLE `continent_animal`
  ADD CONSTRAINT `FK_E557C2C88E962C16` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E557C2C8921F4C77` FOREIGN KEY (`continent_id`) REFERENCES `continent` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `dispose`
--
ALTER TABLE `dispose`
  ADD CONSTRAINT `FK_6262E0668E962C16` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `FK_6262E066A21BD112` FOREIGN KEY (`personne_id`) REFERENCES `personne` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
