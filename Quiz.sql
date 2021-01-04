-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : sam. 04 juil. 2020 à 15:46
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Quiz`
--

-- --------------------------------------------------------

--
-- Structure de la table `Answers`
--

CREATE TABLE `Answers` (
  `id` int(11) NOT NULL,
  `choice` varchar(30) DEFAULT NULL,
  `correct_answer` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Answers`
--

INSERT INTO `Answers` (`id`, `choice`, `correct_answer`) VALUES
(2, 'Vert à poids rouge.', 0),
(3, 'Blanc.', 1),
(4, 'Jaune.', 0),
(5, 'C\'était un zèbre.', 0);

-- --------------------------------------------------------

--
-- Structure de la table `Categories`
--

CREATE TABLE `Categories` (
  `id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Categories`
--

INSERT INTO `Categories` (`id`, `title`) VALUES
(1, 'Histoire');

-- --------------------------------------------------------

--
-- Structure de la table `Questions`
--

CREATE TABLE `Questions` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `Subcat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Questions`
--

INSERT INTO `Questions` (`id`, `title`, `Subcat_id`) VALUES
(3, 'Quelle est la couleur du cheval blanc d\'Henri IV ?', 5);

-- --------------------------------------------------------

--
-- Structure de la table `Questions_Answers`
--

CREATE TABLE `Questions_Answers` (
  `Questions_id` int(11) DEFAULT NULL,
  `Answers_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Questions_Answers`
--

INSERT INTO `Questions_Answers` (`Questions_id`, `Answers_id`) VALUES
(3, 2),
(3, 3),
(3, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `Subcategories`
--

CREATE TABLE `Subcategories` (
  `id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `Cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Subcategories`
--

INSERT INTO `Subcategories` (`id`, `title`, `Cat_id`) VALUES
(5, 'Les rois de France', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Answers`
--
ALTER TABLE `Answers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Questions`
--
ALTER TABLE `Questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Subcat_id` (`Subcat_id`);

--
-- Index pour la table `Questions_Answers`
--
ALTER TABLE `Questions_Answers`
  ADD KEY `Questions_id` (`Questions_id`),
  ADD KEY `Answers_id` (`Answers_id`);

--
-- Index pour la table `Subcategories`
--
ALTER TABLE `Subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Cat_id` (`Cat_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Answers`
--
ALTER TABLE `Answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Questions`
--
ALTER TABLE `Questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Subcategories`
--
ALTER TABLE `Subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Questions`
--
ALTER TABLE `Questions`
  ADD CONSTRAINT `Subcat_id` FOREIGN KEY (`Subcat_id`) REFERENCES `Subcategories` (`id`);

--
-- Contraintes pour la table `Questions_Answers`
--
ALTER TABLE `Questions_Answers`
  ADD CONSTRAINT `Answers_id` FOREIGN KEY (`Answers_id`) REFERENCES `Answers` (`id`),
  ADD CONSTRAINT `Questions_id` FOREIGN KEY (`Questions_id`) REFERENCES `Questions` (`id`);

--
-- Contraintes pour la table `Subcategories`
--
ALTER TABLE `Subcategories`
  ADD CONSTRAINT `Cat_id` FOREIGN KEY (`Cat_id`) REFERENCES `Categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
