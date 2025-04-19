-- Ajoute la colonne de réputation dans la table users
ALTER TABLE `users`
ADD COLUMN `reputation` INT NOT NULL DEFAULT 0 COMMENT 'Points de réputation pour le receleur';
