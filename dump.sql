-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema turchin_3008120
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema turchin_3008120
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `turchin_3008120` DEFAULT CHARACTER SET utf8 ;
USE `turchin_3008120` ;

-- -----------------------------------------------------
-- Table `turchin_3008120`.`autoservice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turchin_3008120`.`autoservice` (
  `id_service` INT NOT NULL AUTO_INCREMENT,
  `adress` MEDIUMTEXT NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_service`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turchin_3008120`.`mechanic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turchin_3008120`.`mechanic` (
  `mechanic_id` INT NOT NULL AUTO_INCREMENT,
  `FIO` VARCHAR(15) NOT NULL,
  `special` VARCHAR(15) NOT NULL,
  `autoservice` VARCHAR(15) NOT NULL,
  `phone` VARCHAR(15) NULL,
  `autoservice_id_service` INT NOT NULL,
  PRIMARY KEY (`mechanic_id`),
  INDEX `fk_mechanic_autoservice1_idx` (`autoservice_id_service` ASC) VISIBLE,
  CONSTRAINT `fk_mechanic_autoservice1`
    FOREIGN KEY (`autoservice_id_service`)
    REFERENCES `turchin_3008120`.`autoservice` (`id_service`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turchin_3008120`.`nameservice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turchin_3008120`.`nameservice` (
  `name_service` VARCHAR(15) NOT NULL,
  `opisanie` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name_service`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turchin_3008120`.`owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turchin_3008120`.`owner` (
  `passport_owner` INT NULL AUTO_INCREMENT,
  `FIO` VARCHAR(15) NOT NULL,
  `bd` DATE NULL,
  `phone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(15) NULL,
  PRIMARY KEY (`passport_owner`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turchin_3008120`.`car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turchin_3008120`.`car` (
  `VIN` INT NOT NULL,
  `model` VARCHAR(15) NOT NULL,
  `release` VARCHAR(15) NOT NULL,
  `odometr` INT NOT NULL,
  `owner_passport_owner` INT NOT NULL,
  PRIMARY KEY (`VIN`),
  INDEX `fk_car_owner1_idx` (`owner_passport_owner` ASC) VISIBLE,
  CONSTRAINT `fk_car_owner1`
    FOREIGN KEY (`owner_passport_owner`)
    REFERENCES `turchin_3008120`.`owner` (`passport_owner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turchin_3008120`.`autoservice_has_owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turchin_3008120`.`autoservice_has_owner` (
  `autoservice_id_service` INT NOT NULL,
  `owner_passport_owner` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`autoservice_id_service`, `owner_passport_owner`, `date`),
  INDEX `fk_autoservice_has_owner_owner1_idx` (`owner_passport_owner` ASC) VISIBLE,
  INDEX `fk_autoservice_has_owner_autoservice_idx` (`autoservice_id_service` ASC) VISIBLE,
  CONSTRAINT `fk_autoservice_has_owner_autoservice`
    FOREIGN KEY (`autoservice_id_service`)
    REFERENCES `turchin_3008120`.`autoservice` (`id_service`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_autoservice_has_owner_owner1`
    FOREIGN KEY (`owner_passport_owner`)
    REFERENCES `turchin_3008120`.`owner` (`passport_owner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `turchin_3008120`.`remont`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `turchin_3008120`.`remont` (
  `car_VIN` INT NOT NULL,
  `nameservice_name_service` INT NOT NULL,
  `mechanic_mechanic_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `status` VARCHAR(15) NOT NULL,
  `price` INT NULL,
  PRIMARY KEY (`car_VIN`, `nameservice_name_service`, `mechanic_mechanic_id`),
  INDEX `fk_car_has_nameservice_nameservice1_idx` (`nameservice_name_service` ASC) VISIBLE,
  INDEX `fk_car_has_nameservice_car1_idx` (`car_VIN` ASC) VISIBLE,
  INDEX `fk_car_has_nameservice_mechanic1_idx` (`mechanic_mechanic_id` ASC) VISIBLE,
  CONSTRAINT `fk_car_has_nameservice_car1`
    FOREIGN KEY (`car_VIN`)
    REFERENCES `turchin_3008120`.`car` (`VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_car_has_nameservice_nameservice1`
    FOREIGN KEY (`nameservice_name_service`)
    REFERENCES `turchin_3008120`.`nameservice` (`name_service`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_car_has_nameservice_mechanic1`
    FOREIGN KEY (`mechanic_mechanic_id`)
    REFERENCES `turchin_3008120`.`mechanic` (`mechanic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
