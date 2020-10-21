-- MySQL Workbench Synchronization
-- Generated: 2020-10-21 11:20
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: user

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `supplychain`.`Order` 
DROP FOREIGN KEY `Product_ID`,
DROP FOREIGN KEY `Customer_ID`;

ALTER TABLE `supplychain`.`Order` 
DROP COLUMN `Customer_ID`,
ADD COLUMN `Customer_Customer_ID` INT(11) NOT NULL AFTER ` Product_ID`,
ADD INDEX `fk_Order_Customer1_idx` (`Customer_Customer_ID` ASC) VISIBLE,
DROP INDEX `Customer_ID_idx` ,
DROP INDEX `Customer_ID_UNIQUE` ;
;

ALTER TABLE `supplychain`.`Stock` 
DROP COLUMN `Supplier_ID`,
DROP COLUMN `Product_ID`,
ADD COLUMN `Product_Product_ID` INT(11) NOT NULL AFTER `Stock_ID`,
ADD COLUMN `Supplier_Supplier_ID` INT(11) NOT NULL AFTER `Product_Product_ID`,
ADD INDEX `fk_Stock_Product1_idx` (`Product_Product_ID` ASC) VISIBLE,
ADD INDEX `fk_Stock_Supplier1_idx` (`Supplier_Supplier_ID` ASC) VISIBLE,
DROP INDEX `Supplier_ID_idx` ,
DROP INDEX `Supplier_ID_UNIQUE` ,
DROP INDEX `Product_ID_UNIQUE` ;
;

ALTER TABLE `supplychain`.`Order` 
ADD CONSTRAINT `Product_ID`
  FOREIGN KEY (` Product_ID`)
  REFERENCES `supplychain`.`Product` (`Product_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Order_Customer1`
  FOREIGN KEY (`Customer_Customer_ID`)
  REFERENCES `supplychain`.`Customer` (`Customer_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `supplychain`.`Stock` 
ADD CONSTRAINT `fk_Stock_Product1`
  FOREIGN KEY (`Product_Product_ID`)
  REFERENCES `supplychain`.`Product` (`Product_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Stock_Supplier1`
  FOREIGN KEY (`Supplier_Supplier_ID`)
  REFERENCES `supplychain`.`Supplier` (`Supplier_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
