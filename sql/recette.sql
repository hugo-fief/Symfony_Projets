-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 20 juin 2020 à 18:02
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
-- Base de données :  `recette`
--

-- --------------------------------------------------------

--
-- Structure de la table `aliment`
--

DROP TABLE IF EXISTS `aliment`;
CREATE TABLE IF NOT EXISTS `aliment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calorie` int(11) NOT NULL,
  `proteine` double NOT NULL,
  `glucide` double NOT NULL,
  `lipide` double NOT NULL,
  `updated_at` datetime NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_70FF972BC54C8C93` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `aliment`
--

INSERT INTO `aliment` (`id`, `nom`, `prix`, `image`, `calorie`, `proteine`, `glucide`, `lipide`, `updated_at`, `type_id`) VALUES
(1, 'Carotte', 5, 'carotte-5eece8fba3d0b830290762-5eee4a1135f59315389829.png', 5, 5, 5, 5, '2020-06-20 17:40:33', 2),
(2, 'Patate', 5, 'patate-5eece91333486163177238-5eee4a261770d437135454.jpg', 5, 5, 5, 5, '2020-06-20 17:40:54', 1),
(3, 'Pomme', 5, 'pomme-5eece923df43b581545182-5eee4a3667f57922123835.png', 5, 5, 5, 5, '2020-06-20 17:41:10', 1),
(4, 'Tomate', 5, 'tomate-5eece93b356fb575347797-5eee4a466b012835909353.png', 5, 5, 5, 5, '2020-06-20 17:41:26', 2);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20191014070613', '2020-06-19 17:26:37'),
('20191018094037', '2020-06-19 17:26:37'),
('20191021073555', '2020-06-19 17:26:37'),
('20191021093130', '2020-06-19 17:26:37'),
('20191021104620', '2020-06-19 17:26:37'),
('20191021121624', '2020-06-19 17:26:37');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `libelle`, `image`, `created_at`) VALUES
(1, 'Fruits', 'fruits-5eece8bae1cd5849274614-5eee49d665301909837310.jpg', '2020-06-20 17:39:33'),
(2, 'Legumes', 'legumes-5eece8cb2abf5344414579-5eee49e45040d401682012.jpg', '2020-06-20 17:39:48');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ROLE_USER',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `username`, `password`, `roles`) VALUES
(1, 'admin', '$argon2id$v=19$m=65536,t=4,p=1$RTVweEhsUERJR2JNV0xMaA$vkN9iWvNByBhbngh5NVz+lX3awfWjXgQCXpgd9NSqSo', 'ROLE_ADMIN'),
(2, 'admin2', '$argon2id$v=19$m=65536,t=4,p=1$OFhDSTVHUElXYnpNSDlwSA$GbfkICDDo6ApjZZsMfNaZr/ScJM7/+ma/rgtEpINWwU', 'ROLE_USER');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `aliment`
--
ALTER TABLE `aliment`
  ADD CONSTRAINT `FK_70FF972BC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
