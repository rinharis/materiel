-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema materiel
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `materiel` ;

-- -----------------------------------------------------
-- Schema materiel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `materiel` DEFAULT CHARACTER SET utf8 ;
USE `materiel` ;

-- -----------------------------------------------------
-- Table `materiel`.`MATERIEL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `materiel`.`MATERIEL` ;

CREATE TABLE IF NOT EXISTS `materiel`.`MATERIEL` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `designation` VARCHAR(255) NULL,
  `dateAchat` DATE NULL,
  `prixJour` DECIMAL(6,2) NULL,
  `categorie` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `materiel`.`CATEGORIE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `materiel`.`CATEGORIE` ;

CREATE TABLE IF NOT EXISTS `materiel`.`CATEGORIE` (
  `id` INT NOT NULL,
  `libellé` VARCHAR(2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `materiel`.`ADRESSE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `materiel`.`ADRESSE` ;

CREATE TABLE IF NOT EXISTS `materiel`.`ADRESSE` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(10) NULL,
  `nomRue` VARCHAR(255) NULL,
  `nomVille` VARCHAR(255) NULL,
  `codePostal` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `materiel`.`CLIENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `materiel`.`CLIENT` ;

CREATE TABLE IF NOT EXISTS `materiel`.`CLIENT` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NULL,
  `type` TINYINT(1) NULL,
  `telephone` VARCHAR(20) NULL,
  `ADRESSE_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CLIENT_ADRESSE1_idx` (`ADRESSE_id` ASC) VISIBLE,
  CONSTRAINT `fk_CLIENT_ADRESSE1`
    FOREIGN KEY (`ADRESSE_id`)
    REFERENCES `materiel`.`ADRESSE` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `materiel`.`FICHE_LOCATION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `materiel`.`FICHE_LOCATION` ;

CREATE TABLE IF NOT EXISTS `materiel`.`FICHE_LOCATION` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dureeEnJour` INT NULL,
  `dateDebut` DATE NULL,
  `dateFin` DATE NULL,
  `CLIENT_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_FICHE_LOCATION_CLIENT1_idx` (`CLIENT_id` ASC) VISIBLE,
  CONSTRAINT `fk_FICHE_LOCATION_CLIENT1`
    FOREIGN KEY (`CLIENT_id`)
    REFERENCES `materiel`.`CLIENT` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `materiel`.`FICHE_LOCATION_CONCERNE_MATERIEL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `materiel`.`FICHE_LOCATION_CONCERNE_MATERIEL` ;

CREATE TABLE IF NOT EXISTS `materiel`.`FICHE_LOCATION_CONCERNE_MATERIEL` (
  `FICHE_LOCATION_id` INT NOT NULL,
  `MATERIEL_id` INT NOT NULL,
  PRIMARY KEY (`FICHE_LOCATION_id`, `MATERIEL_id`),
  INDEX `fk_FICHE_LOCATION_has_MATERIEL_MATERIEL1_idx` (`MATERIEL_id` ASC) VISIBLE,
  INDEX `fk_FICHE_LOCATION_has_MATERIEL_FICHE_LOCATION1_idx` (`FICHE_LOCATION_id` ASC) VISIBLE,
  CONSTRAINT `fk_FICHE_LOCATION_has_MATERIEL_FICHE_LOCATION1`
    FOREIGN KEY (`FICHE_LOCATION_id`)
    REFERENCES `materiel`.`FICHE_LOCATION` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FICHE_LOCATION_has_MATERIEL_MATERIEL1`
    FOREIGN KEY (`MATERIEL_id`)
    REFERENCES `materiel`.`MATERIEL` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
