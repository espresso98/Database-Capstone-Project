-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customer` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(45) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerID_fk_idx` (`CustomerID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItem` (
  `MenuItemID` INT NOT NULL,
  `Cusine` VARCHAR(45) NULL,
  `Course` VARCHAR(45) NULL,
  `Starter` VARCHAR(45) NULL,
  `Drink` VARCHAR(45) NULL,
  `Dessert` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Price` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NULL,
  `MenuItemID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fk_Menu_MenuItem1_idx` (`MenuItemID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `StaffID` INT NOT NULL,
  `FullName` VARCHAR(45) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `RoleID` INT NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DeliveryStatus` (
  `DeliveryStatusID` INT NOT NULL,
  `DeliveryDate` DATETIME NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`DeliveryStatusID`),
  INDEX `StaffID_fk_idx` (`StaffID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `DeliveryStatusID` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `MenuID_fk_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_Orders_DeliveryStatus1_idx` (`DeliveryStatusID` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
