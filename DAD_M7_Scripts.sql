-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dad_m7schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dad_m7schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dad_m7schema` DEFAULT CHARACTER SET utf8 ;
USE `dad_m7schema` ;

-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_categories` (
  `CategoriesID` INT(11) NOT NULL AUTO_INCREMENT,
  `Brand` VARCHAR(255) NULL DEFAULT NULL,
  `Product-information` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`CategoriesID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_sub-categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_sub-categories` (
  `Sub-categoriesID` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Sub-categoriesID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_categories_has_dad_tb_sub-categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_categories_has_dad_tb_sub-categories` (
  `DAD_TB_categories_CategoriesID` INT(11) NOT NULL,
  `DAD_TB_Sub-categories_Sub-categoriesID` INT(11) NOT NULL,
  PRIMARY KEY (`DAD_TB_categories_CategoriesID`, `DAD_TB_Sub-categories_Sub-categoriesID`),
  INDEX `fk_DAD_TB_categories_has_DAD_TB_Sub-categories_DAD_TB_Sub-c_idx` (`DAD_TB_Sub-categories_Sub-categoriesID` ASC),
  INDEX `fk_DAD_TB_categories_has_DAD_TB_Sub-categories_DAD_TB_categ_idx` (`DAD_TB_categories_CategoriesID` ASC),
  CONSTRAINT `fk_DAD_TB_categories_has_DAD_TB_Sub-categories_DAD_TB_Sub-cat1`
    FOREIGN KEY (`DAD_TB_Sub-categories_Sub-categoriesID`)
    REFERENCES `dad_m7schema`.`dad_tb_sub-categories` (`Sub-categoriesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DAD_TB_categories_has_DAD_TB_Sub-categories_DAD_TB_categor1`
    FOREIGN KEY (`DAD_TB_categories_CategoriesID`)
    REFERENCES `dad_m7schema`.`dad_tb_categories` (`CategoriesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_customer` (
  `CustomerID` INT(11) NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(255) NULL DEFAULT NULL,
  `Last_Name` VARCHAR(255) NULL DEFAULT NULL,
  `Phone` VARCHAR(100) NULL DEFAULT NULL,
  `Email` VARCHAR(255) NULL DEFAULT NULL,
  `Address` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_payment` (
  `PaymentID` INT(11) NOT NULL AUTO_INCREMENT,
  `Payment-type` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`PaymentID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_customer_has_dad_tb_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_customer_has_dad_tb_payment` (
  `DAD_TB_customer_CustomerID` INT(11) NOT NULL,
  `DAD_TB_payment_PaymentID` INT(11) NOT NULL,
  PRIMARY KEY (`DAD_TB_customer_CustomerID`, `DAD_TB_payment_PaymentID`),
  INDEX `fk_DAD_TB_customer_has_DAD_TB_payment_DAD_TB_payment1_idx` (`DAD_TB_payment_PaymentID` ASC),
  INDEX `fk_DAD_TB_customer_has_DAD_TB_payment_DAD_TB_customer1_idx` (`DAD_TB_customer_CustomerID` ASC),
  CONSTRAINT `fk_DAD_TB_customer_has_DAD_TB_payment_DAD_TB_customer1`
    FOREIGN KEY (`DAD_TB_customer_CustomerID`)
    REFERENCES `dad_m7schema`.`dad_tb_customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DAD_TB_customer_has_DAD_TB_payment_DAD_TB_payment1`
    FOREIGN KEY (`DAD_TB_payment_PaymentID`)
    REFERENCES `dad_m7schema`.`dad_tb_payment` (`PaymentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_shipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_shipment` (
  `ShipmentID` INT(11) NOT NULL AUTO_INCREMENT,
  `Address` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ShipmentID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_order` (
  `OrderID` INT(11) NOT NULL AUTO_INCREMENT,
  `OrderDate` VARCHAR(255) NULL DEFAULT NULL,
  `OrderName` VARCHAR(255) NULL DEFAULT NULL,
  `Address` VARCHAR(255) NULL DEFAULT NULL,
  `ShipmentID` INT(11) NOT NULL,
  `CustomerID` INT(11) NOT NULL,
  `PaymentID` INT(11) NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_DAD_TB_order_DAD_TB_shipment1_idx` (`ShipmentID` ASC),
  INDEX `fk_DAD_TB_order_DAD_TB_customer1_idx` (`CustomerID` ASC),
  INDEX `fk_DAD_TB_order_DAD_TB_payment1_idx` (`PaymentID` ASC),
  CONSTRAINT `fk_DAD_TB_order_DAD_TB_customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `dad_m7schema`.`dad_tb_customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DAD_TB_order_DAD_TB_payment1`
    FOREIGN KEY (`PaymentID`)
    REFERENCES `dad_m7schema`.`dad_tb_payment` (`PaymentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DAD_TB_order_DAD_TB_shipment1`
    FOREIGN KEY (`ShipmentID`)
    REFERENCES `dad_m7schema`.`dad_tb_shipment` (`ShipmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_manufacturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_manufacturer` (
  `ManufacturerID` INT(11) NOT NULL AUTO_INCREMENT,
  `ProductID` INT(11) NOT NULL,
  PRIMARY KEY (`ManufacturerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_products` (
  `ProductID` INT(11) NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(255) NULL DEFAULT NULL,
  `Description` VARCHAR(255) NULL DEFAULT NULL,
  `Price` VARCHAR(255) NULL DEFAULT NULL,
  `Brand` VARCHAR(255) NULL DEFAULT NULL,
  `ManufacturerID` INT(11) NOT NULL,
  PRIMARY KEY (`ProductID`),
  INDEX `fk_DAD_TB_products_DAD_TB_manufacturer1_idx` (`ManufacturerID` ASC),
  CONSTRAINT `fk_DAD_TB_products_DAD_TB_manufacturer1`
    FOREIGN KEY (`ManufacturerID`)
    REFERENCES `dad_m7schema`.`dad_tb_manufacturer` (`ManufacturerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_invoice` (
  `InvoiceNo` INT(11) NOT NULL,
  `InvoiceDate` VARCHAR(255) NULL DEFAULT NULL,
  `Currency` VARCHAR(255) NULL DEFAULT NULL,
  `Weight` VARCHAR(255) NULL DEFAULT NULL,
  `Quantity` VARCHAR(255) NULL DEFAULT NULL,
  `Invoice_status` VARCHAR(255) NULL DEFAULT NULL,
  `ShipmentID` INT(11) NOT NULL,
  `OrderID` INT(11) NOT NULL,
  `PaymentID` INT(11) NOT NULL,
  `CustomerID` INT(11) NOT NULL,
  `ProductID` INT(11) NOT NULL,
  PRIMARY KEY (`InvoiceNo`),
  INDEX `ProductID_idx` (`ProductID` ASC),
  INDEX `ShipmentID_idx` (`ShipmentID` ASC),
  INDEX `OrderID_idx` (`OrderID` ASC),
  INDEX `PaymentID_idx` (`PaymentID` ASC),
  INDEX `CustomerID_idx` (`CustomerID` ASC),
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `dad_m7schema`.`dad_tb_customer` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `dad_m7schema`.`dad_tb_order` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `PaymentID`
    FOREIGN KEY (`PaymentID`)
    REFERENCES `dad_m7schema`.`dad_tb_payment` (`PaymentID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ProductID`
    FOREIGN KEY (`ProductID`)
    REFERENCES `dad_m7schema`.`dad_tb_products` (`ProductID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ShipmentID`
    FOREIGN KEY (`ShipmentID`)
    REFERENCES `dad_m7schema`.`dad_tb_shipment` (`ShipmentID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_products_has_dad_tb_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_products_has_dad_tb_categories` (
  `DAD_TB_products_ProductID` INT(11) NOT NULL,
  `DAD_TB_categories_CategoriesID` INT(11) NOT NULL,
  PRIMARY KEY (`DAD_TB_products_ProductID`, `DAD_TB_categories_CategoriesID`),
  INDEX `fk_DAD_TB_products_has_DAD_TB_categories_DAD_TB_categories1_idx` (`DAD_TB_categories_CategoriesID` ASC),
  INDEX `fk_DAD_TB_products_has_DAD_TB_categories_DAD_TB_products1_idx` (`DAD_TB_products_ProductID` ASC),
  CONSTRAINT `fk_DAD_TB_products_has_DAD_TB_categories_DAD_TB_categories1`
    FOREIGN KEY (`DAD_TB_categories_CategoriesID`)
    REFERENCES `dad_m7schema`.`dad_tb_categories` (`CategoriesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DAD_TB_products_has_DAD_TB_categories_DAD_TB_products1`
    FOREIGN KEY (`DAD_TB_products_ProductID`)
    REFERENCES `dad_m7schema`.`dad_tb_products` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_products_has_dad_tb_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_products_has_dad_tb_customer` (
  `dad_tb_products_ProductID` INT(11) NOT NULL,
  `dad_tb_customer_CustomerID` INT(11) NOT NULL,
  PRIMARY KEY (`dad_tb_products_ProductID`, `dad_tb_customer_CustomerID`),
  INDEX `fk_dad_tb_products_has_dad_tb_customer_dad_tb_customer1_idx` (`dad_tb_customer_CustomerID` ASC),
  INDEX `fk_dad_tb_products_has_dad_tb_customer_dad_tb_products1_idx` (`dad_tb_products_ProductID` ASC),
  CONSTRAINT `fk_dad_tb_products_has_dad_tb_customer_dad_tb_customer1`
    FOREIGN KEY (`dad_tb_customer_CustomerID`)
    REFERENCES `dad_m7schema`.`dad_tb_customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dad_tb_products_has_dad_tb_customer_dad_tb_products1`
    FOREIGN KEY (`dad_tb_products_ProductID`)
    REFERENCES `dad_m7schema`.`dad_tb_products` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_products_has_dad_tb_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_products_has_dad_tb_order` (
  `DAD_TB_products_ProductID` INT(11) NOT NULL,
  `DAD_TB_order_OrderID` INT(11) NOT NULL,
  PRIMARY KEY (`DAD_TB_products_ProductID`, `DAD_TB_order_OrderID`),
  INDEX `fk_DAD_TB_products_has_DAD_TB_order_DAD_TB_order1_idx` (`DAD_TB_order_OrderID` ASC),
  INDEX `fk_DAD_TB_products_has_DAD_TB_order_DAD_TB_products1_idx` (`DAD_TB_products_ProductID` ASC),
  CONSTRAINT `fk_DAD_TB_products_has_DAD_TB_order_DAD_TB_order1`
    FOREIGN KEY (`DAD_TB_order_OrderID`)
    REFERENCES `dad_m7schema`.`dad_tb_order` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DAD_TB_products_has_DAD_TB_order_DAD_TB_products1`
    FOREIGN KEY (`DAD_TB_products_ProductID`)
    REFERENCES `dad_m7schema`.`dad_tb_products` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dad_m7schema`.`dad_tb_products_has_dad_tb_sub-categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dad_m7schema`.`dad_tb_products_has_dad_tb_sub-categories` (
  `DAD_TB_products_ProductID` INT(11) NOT NULL,
  `DAD_TB_Sub-categories_Sub-categoriesID` INT(11) NOT NULL,
  PRIMARY KEY (`DAD_TB_products_ProductID`, `DAD_TB_Sub-categories_Sub-categoriesID`),
  INDEX `fk_DAD_TB_products_has_DAD_TB_Sub-categories_DAD_TB_Sub-cat_idx` (`DAD_TB_Sub-categories_Sub-categoriesID` ASC),
  INDEX `fk_DAD_TB_products_has_DAD_TB_Sub-categories_DAD_TB_product_idx` (`DAD_TB_products_ProductID` ASC),
  CONSTRAINT `fk_DAD_TB_products_has_DAD_TB_Sub-categories_DAD_TB_Sub-categ1`
    FOREIGN KEY (`DAD_TB_Sub-categories_Sub-categoriesID`)
    REFERENCES `dad_m7schema`.`dad_tb_sub-categories` (`Sub-categoriesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DAD_TB_products_has_DAD_TB_Sub-categories_DAD_TB_products1`
    FOREIGN KEY (`DAD_TB_products_ProductID`)
    REFERENCES `dad_m7schema`.`dad_tb_products` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
