
-- Author: Gustavo Costa, Camily de Bem, Laura Costa, Paulo Eduardo Pereira Carvalho, Pedro Henrique Cabral

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `restaurante` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `restaurante`.`Pessoa` (
  `CPF` VARCHAR(11) NOT NULL,
  `Nome` VARCHAR(90) NOT NULL,
  `Cidade` VARCHAR(30) NOT NULL,
  `Estado` VARCHAR(2) NOT NULL,
  `Rua` VARCHAR(60) NOT NULL,
  `CEP` VARCHAR(8) NULL DEFAULT NULL,
  `Numero` VARCHAR(4) NOT NULL,
  `Bairro` VARCHAR(40) NOT NULL,
  `Complemento` VARCHAR(15) NULL DEFAULT 'N/A', -- uso do default para o complemento de uma pessoa.
  PRIMARY KEY (`CPF`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `restaurante`.`Funcionario` (
  `Salario` DECIMAL(6,2) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_Pessoa`
    FOREIGN KEY (`CPF`)
    REFERENCES `restaurante`.`Pessoa` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `restaurante`.`Cozinheiro` (
  `Especialidade` VARCHAR(20) NULL DEFAULT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Cozinheiro_Funcionario1`
    FOREIGN KEY (`CPF`)
    REFERENCES `restaurante`.`Funcionario` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `restaurante`.`Garcom` (
  
  `CPF` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Garcom_Funcionario1`
    FOREIGN KEY (`CPF`)
    REFERENCES `restaurante`.`Funcionario` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `restaurante`.`ItemDoMenu` (
  `idItem` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(25) NOT NULL,
  `Peso` INT(11) NOT NULL,
  `Valor` DECIMAL(3,2) NOT NULL,
  `Tipo` VARCHAR(20) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idItem`),
  UNIQUE INDEX `idItem_UNIQUE` (`idItem` ASC) VISIBLE,
  INDEX `fk_ItemDoMenu_Cozinheiro1_idx` (`CPF` ASC) VISIBLE,
  CONSTRAINT `fk_ItemDoMenu_Cozinheiro1`
    FOREIGN KEY (`CPF`)
    REFERENCES `restaurante`.`Cozinheiro` (`CPF`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `restaurante`.`Mesa` (
  `NumMesa` INT(11) NOT NULL AUTO_INCREMENT,
  `Capacidade` INT(11) NOT NULL,
  `Estado` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`NumMesa`),
  UNIQUE INDEX `NumMesa_UNIQUE` (`NumMesa` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `restaurante`.`Pedido` (
  `idPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `Valor` DECIMAL(5,2) NOT NULL,
  `DataHora` DATETIME NOT NULL,
  `NumMesa` INT(11) NOT NULL,
  `idItem` INT(11) NOT NULL,
  `CPF_Cliente` VARCHAR(11) NOT NULL,
  `CPF_Garcom` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  UNIQUE INDEX `idPedido_UNIQUE` (`idPedido` ASC) VISIBLE,
  INDEX `fk_Pedido_Mesa1_idx` (`NumMesa` ASC) VISIBLE,
  INDEX `fk_Pedido_ItemDoMenu1_idx` (`idItem` ASC) VISIBLE,
  INDEX `fk_Pedido_Pessoa1_idx` (`CPF_Cliente` ASC) VISIBLE,
  INDEX `fk_Pedido_Funcionario1_idx` (`CPF_Garcom` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Mesa1`
    FOREIGN KEY (`NumMesa`)
    REFERENCES `restaurante`.`Mesa` (`NumMesa`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_ItemDoMenu1`
    FOREIGN KEY (`idItem`)
    REFERENCES `restaurante`.`ItemDoMenu` (`idItem`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Pessoa1`
    FOREIGN KEY (`CPF_Cliente`)
    REFERENCES `restaurante`.`Pessoa` (`CPF`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Funcionario1`
    FOREIGN KEY (`CPF_Garcom`)
    REFERENCES `restaurante`.`Funcionario` (`CPF`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `restaurante`.`Pagamento` (
  `MetodoPagamento` VARCHAR(15) NOT NULL,
  `idPedido` INT(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pagamento_Pedido1_idx` (`idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_Pagamento_Pedido1`
    FOREIGN KEY (`idPedido`)
    REFERENCES `restaurante`.`Pedido` (`idPedido`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `restaurante`.`Telefone` (
  `CPF` VARCHAR(11) NOT NULL,
  `Telefone` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`CPF`),
  CONSTRAINT `fk_Telefone_Pessoa1`
    FOREIGN KEY (`CPF`)
    REFERENCES `restaurante`.`Pessoa` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
