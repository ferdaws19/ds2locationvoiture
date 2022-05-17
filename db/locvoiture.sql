-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 17 mai 2022 à 02:42
-- Version du serveur :  5.7.24
-- Version de PHP : 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `locvoiture`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `namePren` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `mdp` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `dateNais` date NOT NULL,
  `role` varchar(1) CHARACTER SET utf8mb4 DEFAULT 'U'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `namePren`, `email`, `mdp`, `dateNais`, `role`) VALUES
(111111, 'Ferdaws Ziadia', 'ferdawsziadia@gmail.com', 'fer123456', '2000-09-19', 'A'),
(222222, 'Slim rabeb', 'slimrabeb1@gmail.com', 'rabeb123', '2000-10-31', 'U'),
(9641075, 'Mohamed Ilyes Helal', 'mohamedhelalilyes@gmail.com', 'Midou123', '2000-02-19', 'A'),
(12345678, 'ali ben salah', 'alisalah@gmail.com', 'ali123', '1995-05-18', 'U');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `numRes` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `mat` int(11) NOT NULL,
  `dateP` date NOT NULL,
  `dateR` date NOT NULL,
  `etat` varchar(1) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`numRes`, `id`, `mat`, `dateP`, `dateR`, `etat`, `total`) VALUES
(53, 12345678, 33333, '2022-05-18', '2022-05-23', 'A', 1500),
(54, 111111, 22222, '2022-05-19', '2022-05-21', 'P', 1200),
(55, 222222, 11111, '2022-05-18', '2022-05-19', 'P', 700);

-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE `voitures` (
  `mat` int(11) NOT NULL,
  `nomV` varchar(50) NOT NULL,
  `dateA` date NOT NULL,
  `description` text NOT NULL,
  `img` text NOT NULL,
  `pJ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `voitures`
--

INSERT INTO `voitures` (`mat`, `nomV`, `dateA`, `description`, `img`, `pJ`) VALUES
(11111, 'mercedes', '2022-05-17', 'luxe\r\nneuve', '555918_mercedes.jpg', 350),
(22222, 'Range Rover', '2022-05-17', 'blanche, neuve', '76548_rangRover.jpg', 400),
(33333, 'bmw', '2022-05-17', 'neuve,noire', '994213_bmw.jpg', 250);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`numRes`),
  ADD KEY `matr` (`mat`),
  ADD KEY `idrt` (`id`);

--
-- Index pour la table `voitures`
--
ALTER TABLE `voitures`
  ADD PRIMARY KEY (`mat`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `numRes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `idrt` FOREIGN KEY (`id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matr` FOREIGN KEY (`mat`) REFERENCES `voitures` (`mat`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
