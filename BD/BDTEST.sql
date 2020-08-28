CREATE DATABASE BDTEST;
USE BDTEST;

CREATE TABLE IF NOT EXISTS `Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Formulario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Formulario` (
  `idFormulario` INT NOT NULL AUTO_INCREMENT,
  `for_descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idFormulario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Roles` (
  `idRoles` INT NOT NULL AUTO_INCREMENT,
  `rol_descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idRoles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Accion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Accion` (
  `idAccion` INT NOT NULL AUTO_INCREMENT,
  `acc_descripcion` VARCHAR(200) NULL,
  PRIMARY KEY (`idAccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Form_Rol_Acc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Form_Rol_Acc` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `for_idFormulario` INT NOT NULL,
  `rol_idRoles` INT NOT NULL,
  `acc_idAccion` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Form_Opt_Rol_Formulario1_idx` (`for_idFormulario` ASC) VISIBLE,
  INDEX `fk_Form_Opt_Rol_Roles1_idx` (`rol_idRoles` ASC) VISIBLE,
  INDEX `fk_Form_Opt_Rol_Acc_Accion1_idx` (`acc_idAccion` ASC) VISIBLE,
  CONSTRAINT `fk_Form_Opt_Rol_Formulario1`
    FOREIGN KEY (`for_idFormulario`)
    REFERENCES `Formulario` (`idFormulario`),
  CONSTRAINT `fk_Form_Opt_Rol_Roles1`
    FOREIGN KEY (`rol_idRoles`)
    REFERENCES `Roles` (`idRoles`),
  CONSTRAINT `fk_Form_Opt_Rol_Acc_Accion1`
    FOREIGN KEY (`acc_idAccion`)
    REFERENCES `Accion` (`idAccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Boton`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Boton` (
  `idBoton` INT NOT NULL AUTO_INCREMENT,
  `bot_descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idBoton`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Acc_Bot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Acc_Bot` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Accion_idAccion` INT NOT NULL,
  `Boton_idBoton` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Acc_Bot_Accion_idx` (`Accion_idAccion` ASC) VISIBLE,
  INDEX `fk_Acc_Bot_Boton1_idx` (`Boton_idBoton` ASC) VISIBLE,
  CONSTRAINT `fk_Acc_Bot_Accion`
    FOREIGN KEY (`Accion_idAccion`)
    REFERENCES `Accion` (`idAccion`),
  CONSTRAINT `fk_Acc_Bot_Boton1`
    FOREIGN KEY (`Boton_idBoton`)
    REFERENCES `Boton` (`idBoton`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clientes` (
  `IdCliente` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`IdCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Historial_Deudas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Historial_Deudas` (
  `idHistorial_Deudas` INT NOT NULL AUTO_INCREMENT,
  `Total` DOUBLE(10,2) NULL,
  `IdCliente` INT NOT NULL,
   `Fecha_Credito` DATETIME NOT NULL,
  `Fecha_Pago` DATETIME NULL,
  PRIMARY KEY (`idHistorial_Deudas`, `IdCliente`),
  INDEX `fk_HistorialDeudas_Clientes1_idx` (`IdCliente` ASC) VISIBLE,
  CONSTRAINT `fk_HistorialDeudas_Clientes1`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `Clientes` (`IdCliente`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Form_Rol_Acc_Usu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Form_Rol_Acc_Usu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_Form_Rol_Acc` INT NOT NULL,
  `usu_idUsuarios` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Form_Rol_Acc_Usu_Form_Rol_Acc1_idx` (`id_Form_Rol_Acc` ASC) VISIBLE,
  INDEX `fk_Form_Rol_Acc_Usu_Usuarios1_idx` (`usu_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_Form_Rol_Acc_Usu_Form_Rol_Acc1`
    FOREIGN KEY (`id_Form_Rol_Acc`)
    REFERENCES `Form_Rol_Acc` (`id`),
  CONSTRAINT `fk_Form_Rol_Acc_Usu_Usuarios1`
    FOREIGN KEY (`usu_idUsuarios`)
    REFERENCES `Usuarios` (`idUsuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Credito` (
  `idCredito` INT NOT NULL AUTO_INCREMENT,
  `IdCliente` INT NOT NULL,
  `Total` DOUBLE(10,2) NULL,
  `Solicitado` INT NULL,
  `Estado` VARCHAR(45) NULL,
  PRIMARY KEY (`idCredito`, `IdCliente`),
  INDEX `fk_Credito_Clientes1_idx` (`IdCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Credito_Clientes1`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `Clientes` (`IdCliente`))
ENGINE = InnoDB




