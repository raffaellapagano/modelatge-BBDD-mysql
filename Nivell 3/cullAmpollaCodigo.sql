-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Cul d'Ampolla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cul d'Ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cul d'Ampolla` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema cul d'ampolla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cul d'ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cul d'ampolla` DEFAULT CHARACTER SET utf8 ;
USE `Cul d'Ampolla` ;

-- -----------------------------------------------------
-- Table `Cul d'Ampolla`.`Proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul d'Ampolla`.`Proveidor` (
  `id_Proveidor` INT NOT NULL AUTO_INCREMENT,
  `nom_Proveidor` VARCHAR(45) NOT NULL,
  `carrer_Proveidor` VARCHAR(45) NULL,
  `numero_Proveidor` INT NULL,
  `pis` INT NULL,
  `porta_Proveidor` INT NULL,
  `ciutat_Proveidor` VARCHAR(45) NULL,
  `codi_postal_Proveidor` INT(5) NULL,
  `país_Proveidor` VARCHAR(45) NULL,
  `telefon_Proveidor` INT(9) UNSIGNED NULL,
  `fax_Proveidor` INT(9) UNSIGNED NULL,
  `NIF_Proveidor` VARCHAR(9) NULL,
  PRIMARY KEY (`id_Proveidor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul d'Ampolla`.`Amic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul d'Ampolla`.`Amic` (
  `id_Amic` INT NOT NULL AUTO_INCREMENT,
  `Clients_id_Clients` INT NOT NULL,
  PRIMARY KEY (`id_Amic`),
  INDEX `fk_Amic_Clients1_idx` (`Clients_id_Clients` ASC) VISIBLE,
  CONSTRAINT `fk_Amic_Clients1`
    FOREIGN KEY (`Clients_id_Clients`)
    REFERENCES `Cul d'Ampolla`.`Clients` (`id_Clients`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul d'Ampolla`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul d'Ampolla`.`Clients` (
  `id_Clients` INT NOT NULL AUTO_INCREMENT,
  `nom_Client` VARCHAR(45) NOT NULL,
  `adreça_Client` VARCHAR(45) NOT NULL,
  `email_Client` VARCHAR(45) NOT NULL,
  `alta_Clients` DATETIME NULL,
  `Amistad_id_Amistad` INT NULL,
  `Amic_id_Amic` INT NULL,
  PRIMARY KEY (`id_Clients`),
  UNIQUE INDEX `email_Client_UNIQUE` (`email_Client` ASC) VISIBLE,
  INDEX `fk_Clients_Amic1_idx` (`Amic_id_Amic` ASC) VISIBLE,
  CONSTRAINT `fk_Clients_Amic1`
    FOREIGN KEY (`Amic_id_Amic`)
    REFERENCES `Cul d'Ampolla`.`Amic` (`id_Amic`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul d'Ampolla`.`Empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul d'Ampolla`.`Empleats` (
  `id_Empleat` INT NOT NULL AUTO_INCREMENT,
  `nom_Empleat` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Empleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul d'Ampolla`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul d'Ampolla`.`Compra` (
  `id_Compra` INT NOT NULL AUTO_INCREMENT,
  `Clients_id_Clients` INT NOT NULL,
  `Empleats_id_Empleat` INT NOT NULL,
  `id_Ulleres` INT NOT NULL,
  PRIMARY KEY (`id_Compra`),
  INDEX `fk_Compra_Clients1_idx` (`Clients_id_Clients` ASC) VISIBLE,
  INDEX `fk_Compra_Ulleres1_idx` (`id_Ulleres` ASC) VISIBLE,
  INDEX `fk_Compra_Empleats1_idx` (`Empleats_id_Empleat` ASC) VISIBLE,
  CONSTRAINT `fk_Compra_Clients1`
    FOREIGN KEY (`Clients_id_Clients`)
    REFERENCES `Cul d'Ampolla`.`Clients` (`id_Clients`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Compra_Empleats1`
    FOREIGN KEY (`Empleats_id_Empleat`)
    REFERENCES `Cul d'Ampolla`.`Empleats` (`id_Empleat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Compra_Ulleres1`
    FOREIGN KEY (`id_Ulleres`)
    REFERENCES `Cul d'Ampolla`.`Ulleres` (`id_Ulleres`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul d'Ampolla`.`Ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul d'Ampolla`.`Ulleres` (
  `id_Ulleres` INT NOT NULL AUTO_INCREMENT,
  `marca_Ulleres` VARCHAR(45) NOT NULL,
  `graduacioVidreD_Ulleres` DECIMAL NOT NULL,
  `graduacioVidreE_Ulleres` DECIMAL NOT NULL,
  `tipusMuntura_Ulleres` VARCHAR(45) NOT NULL,
  `color_de_la_muntura_Ulleres` VARCHAR(45) NOT NULL,
  `color_vidreD` VARCHAR(45) NOT NULL,
  `color_vidreE` VARCHAR(45) NOT NULL,
  `preu_Ulleres` DECIMAL NOT NULL,
  `col_Ulleres` VARCHAR(45) NOT NULL,
  `Proveidor_id_Proveidor` INT NOT NULL,
  `Compra_id_Compra` INT NOT NULL,
  `Empleats_id_Empleat` INT NOT NULL,
  INDEX `fk_Ulleres_Proveidor_idx` (`Proveidor_id_Proveidor` ASC) VISIBLE,
  INDEX `fk_Ulleres_Compra1_idx` (`Compra_id_Compra` ASC) VISIBLE,
  PRIMARY KEY (`id_Ulleres`),
  INDEX `fk_Ulleres_Empleats1_idx` (`Empleats_id_Empleat` ASC) VISIBLE,
  CONSTRAINT `fk_Ulleres_Proveidor`
    FOREIGN KEY (`Proveidor_id_Proveidor`)
    REFERENCES `Cul d'Ampolla`.`Proveidor` (`id_Proveidor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ulleres_Compra1`
    FOREIGN KEY (`Compra_id_Compra`)
    REFERENCES `Cul d'Ampolla`.`Compra` (`id_Compra`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ulleres_Empleats1`
    FOREIGN KEY (`Empleats_id_Empleat`)
    REFERENCES `Cul d'Ampolla`.`Empleats` (`id_Empleat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `cul d'ampolla` ;

-- -----------------------------------------------------
-- Table `cul d'ampolla`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul d'ampolla`.`clients` (
  `id_Clients` INT NOT NULL AUTO_INCREMENT,
  `nom_Client` VARCHAR(45) NOT NULL,
  `adreça_Client` VARCHAR(45) NULL DEFAULT NULL,
  `email_Client` VARCHAR(45) NULL DEFAULT NULL,
  `alta_Clients` DATETIME NULL DEFAULT NULL,
  `Amistad_id_Amistad` INT NULL DEFAULT NULL,
  `Amic_id_Amic` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_Clients`),
  UNIQUE INDEX `email_Client_UNIQUE` (`email_Client` ASC) VISIBLE,
  INDEX `fk_Clients_Amic1_idx` (`Amic_id_Amic` ASC) VISIBLE,
  CONSTRAINT `fk_Clients_Amic1`
    FOREIGN KEY (`Amic_id_Amic`)
    REFERENCES `cul d'ampolla`.`amic` (`id_Amic`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cul d'ampolla`.`amic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul d'ampolla`.`amic` (
  `id_Amic` INT NOT NULL AUTO_INCREMENT,
  `Clients_id_Clients` INT NOT NULL,
  PRIMARY KEY (`id_Amic`),
  INDEX `fk_Amic_Clients1_idx` (`Clients_id_Clients` ASC) VISIBLE,
  CONSTRAINT `fk_Amic_Clients1`
    FOREIGN KEY (`Clients_id_Clients`)
    REFERENCES `cul d'ampolla`.`clients` (`id_Clients`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cul d'ampolla`.`empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul d'ampolla`.`empleats` (
  `id_Empleat` INT NOT NULL AUTO_INCREMENT,
  `nom_Empleat` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Empleat`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cul d'ampolla`.`proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul d'ampolla`.`proveidor` (
  `id_Proveidor` INT NOT NULL AUTO_INCREMENT,
  `nom_Proveidor` VARCHAR(45) NOT NULL,
  `carrer_Proveidor` VARCHAR(45) NULL DEFAULT NULL,
  `numero_Proveidor` INT NULL DEFAULT NULL,
  `pis` INT NULL DEFAULT NULL,
  `porta_Proveidor` INT NULL DEFAULT NULL,
  `ciutat_Proveidor` VARCHAR(45) NOT NULL,
  `codi_postal_Proveidor` INT NULL DEFAULT NULL,
  `país_Proveidor` VARCHAR(45) NULL DEFAULT NULL,
  `telefon_Proveidor` INT UNSIGNED NULL DEFAULT NULL,
  `fax_Proveidor` INT UNSIGNED NULL DEFAULT NULL,
  `NIF_Proveidor` VARCHAR(9) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Proveidor`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cul d'ampolla`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul d'ampolla`.`ulleres` (
  `id_Ulleres` INT NOT NULL AUTO_INCREMENT,
  `marca_Ulleres` VARCHAR(45) NOT NULL,
  `graduacioVidreD_Ulleres` DECIMAL(10,0) NULL DEFAULT NULL,
  `graduacioVidreE_Ulleres` DECIMAL(10,0) NULL DEFAULT NULL,
  `tipusMuntura_Ulleres` VARCHAR(45) NULL DEFAULT NULL,
  `color_de_la_muntura_Ulleres` VARCHAR(45) NULL DEFAULT NULL,
  `color_vidreD` VARCHAR(45) NULL DEFAULT NULL,
  `color_vidreE` VARCHAR(45) NULL DEFAULT NULL,
  `preu_Ulleres` DECIMAL(10,0) NULL DEFAULT NULL,
  `col_Ulleres` VARCHAR(45) NULL DEFAULT NULL,
  `Proveidor_id_Proveidor` INT NULL DEFAULT NULL,
  `Compra_id_Compra` INT NULL DEFAULT NULL,
  `Empleats_id_Empleat` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_Ulleres`),
  INDEX `fk_Ulleres_Proveidor_idx` (`Proveidor_id_Proveidor` ASC) VISIBLE,
  INDEX `fk_Ulleres_Compra1_idx` (`Compra_id_Compra` ASC) VISIBLE,
  INDEX `fk_Ulleres_Empleats1_idx` (`Empleats_id_Empleat` ASC) VISIBLE,
  CONSTRAINT `fk_Ulleres_Compra1`
    FOREIGN KEY (`Compra_id_Compra`)
    REFERENCES `cul d'ampolla`.`compra` (`id_Compra`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ulleres_Empleats1`
    FOREIGN KEY (`Empleats_id_Empleat`)
    REFERENCES `cul d'ampolla`.`empleats` (`id_Empleat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ulleres_Proveidor`
    FOREIGN KEY (`Proveidor_id_Proveidor`)
    REFERENCES `cul d'ampolla`.`proveidor` (`id_Proveidor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cul d'ampolla`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul d'ampolla`.`compra` (
  `id_Compra` INT NOT NULL AUTO_INCREMENT,
  `Clients_id_Clients` INT NOT NULL,
  `Empleats_id_Empleat` INT NOT NULL,
  `id_Ulleres` INT NOT NULL,
  PRIMARY KEY (`id_Compra`),
  INDEX `fk_Compra_Clients1_idx` (`Clients_id_Clients` ASC) VISIBLE,
  INDEX `fk_Compra_Ulleres1_idx` (`id_Ulleres` ASC) VISIBLE,
  INDEX `fk_Compra_Empleats1_idx` (`Empleats_id_Empleat` ASC) VISIBLE,
  CONSTRAINT `fk_Compra_Clients1`
    FOREIGN KEY (`Clients_id_Clients`)
    REFERENCES `cul d'ampolla`.`clients` (`id_Clients`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Compra_Empleats1`
    FOREIGN KEY (`Empleats_id_Empleat`)
    REFERENCES `cul d'ampolla`.`empleats` (`id_Empleat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Compra_Ulleres1`
    FOREIGN KEY (`id_Ulleres`)
    REFERENCES `cul d'ampolla`.`ulleres` (`id_Ulleres`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;

USE `cul d'ampolla` ;

-- -----------------------------------------------------
-- Placeholder table for view `cul d'ampolla`.`mejor_empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul d'ampolla`.`mejor_empleado` (`idEmpleado` INT, `nom_Empleat` INT, `Ventas` INT);

-- -----------------------------------------------------
-- View `cul d'ampolla`.`mejor_empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cul d'ampolla`.`mejor_empleado`;
USE `cul d'ampolla`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cul d'ampolla`.`mejor_empleado` AS select `cul d'ampolla`.`compra`.`Empleats_id_Empleat` AS `idEmpleado`,`cul d'ampolla`.`empleats`.`nom_Empleat` AS `nom_Empleat`,count(`cul d'ampolla`.`compra`.`Empleats_id_Empleat`) AS `Ventas` from (`cul d'ampolla`.`compra` join `cul d'ampolla`.`empleats`) where (`cul d'ampolla`.`empleats`.`id_Empleat` = `cul d'ampolla`.`compra`.`Empleats_id_Empleat`) group by `cul d'ampolla`.`compra`.`Empleats_id_Empleat` limit 1;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
