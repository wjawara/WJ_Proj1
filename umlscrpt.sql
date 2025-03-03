-- MySQL Script generated by MySQL Workbench
-- Sun Mar  2 18:08:49 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Classroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Classroom` (
  `ClassroomID` INT NOT NULL,
  `RoomNumber` INT NOT NULL,
  `Capacity` INT NOT NULL,
  `AgeGroup` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ClassroomID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Child`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Child` (
  `ChildID` INT NOT NULL AUTO_INCREMENT,
  `FName` VARCHAR(45) NOT NULL,
  `LName` VARCHAR(45) NOT NULL,
  `DOB` DATE NOT NULL,
  `Gender` VARCHAR(45) NOT NULL,
  `EnrollmentDate` DATE NOT NULL,
  `Allergies` VARCHAR(45) NOT NULL,
  `MedicalCond` VARCHAR(45) NOT NULL,
  `Gender` VARCHAR(45) NOT NULL,
  `ClassroomID` INT NOT NULL,
  PRIMARY KEY (`ChildID`),
  CONSTRAINT `ClassroomID`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Classroom` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Parent/Guardian`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Parent/Guardian` (
  `PGiD` INT NOT NULL,
  `FName` VARCHAR(45) NOT NULL,
  `LName` VARCHAR(45) NOT NULL,
  `Number` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Relationship` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PGiD`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EmergencyContact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EmergencyContact` (
  `ECiD` INT NOT NULL,
  `FName` VARCHAR(45) NOT NULL,
  `LName` VARCHAR(45) NOT NULL,
  `Number` VARCHAR(45) NOT NULL,
  `Relationship` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ECiD`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff` (
  `StaffiD` INT NOT NULL,
  `FName` VARCHAR(45) NOT NULL,
  `LName` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Number` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `WorkSchedule` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`StaffiD`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Billing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Billing` (
  `BillingID` INT NOT NULL,
  `BillingDate` DATE NOT NULL,
  `AmountDue` INT NOT NULL,
  `PaymentStatus` VARCHAR(45) NOT NULL,
  `ParentID` INT NOT NULL,
  `ChildID` INT NOT NULL,
  PRIMARY KEY (`BillingID`),
  INDEX `ParentID_idx` (`ParentID` ASC) VISIBLE,
  INDEX `ChildID_idx` (`ChildID` ASC) VISIBLE,
  CONSTRAINT `ParentID`
    FOREIGN KEY (`ParentID`)
    REFERENCES `mydb`.`Parent/Guardian` (`PGiD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ChildID`
    FOREIGN KEY (`ChildID`)
    REFERENCES `mydb`.`Child` (`ChildID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ImmnunizationRecords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ImmnunizationRecords` (
  `ImmunizationiD` INT NOT NULL,
  `Vaccine` VARCHAR(45) NOT NULL,
  `DateAdministered` DATE NOT NULL,
  `NextDueDate` DATE NOT NULL,
  `ChildID` INT NOT NULL,
  PRIMARY KEY (`ImmunizationiD`),
  INDEX `ChildId_idx` (`ChildID` ASC) VISIBLE,
  CONSTRAINT `ChildId`
    FOREIGN KEY (`ChildID`)
    REFERENCES `mydb`.`Child` (`ChildID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
