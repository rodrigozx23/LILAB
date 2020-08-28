USE BDTEST;

INSERT INTO `bdtest`.`clientes`
(`Nombre`)VALUES( 'ana');

INSERT INTO `bdtest`.`clientes`
(`Nombre`)VALUES( 'beatriz');

INSERT INTO `bdtest`.`clientes`
(`Nombre`)VALUES( 'carlos');

INSERT INTO `bdtest`.`clientes`
(`Nombre`)VALUES( 'dennis');

INSERT INTO `bdtest`.`clientes`
(`Nombre`)VALUES( 'elie');

INSERT INTO `bdtest`.`clientes`
(`Nombre`)VALUES( 'francisco');

INSERT INTO `bdtest`.`usuarios`
(`Nombre`)VALUES('MARIA');

INSERT INTO `bdtest`.`usuarios`
(`Nombre`)VALUES('Rodrigo');

INSERT INTO `bdtest`.`usuarios`
(`Nombre`)VALUES('Pedro');


INSERT INTO `bdtest`.`historial_deudas`
(`Total`,`IdCliente`,`Fecha_Credito`,`Fecha_Pago`)VALUES
(100000,(select IdCliente from  `bdtest`.`clientes` where `Nombre` = 'dennis'),now(),now());

INSERT INTO `bdtest`.`historial_deudas`
(`Total`,`IdCliente`,`Fecha_Credito`,`Fecha_Pago`)VALUES
(200000,(select IdCliente from  `bdtest`.`clientes` where `Nombre` = 'dennis'),now(),null);

INSERT INTO `bdtest`.`historial_deudas`
(`Total`,`IdCliente`,`Fecha_Credito`,`Fecha_Pago`)VALUES
(30000,(select IdCliente from  `bdtest`.`clientes` where `Nombre` = 'francisco'),now(),null);

INSERT INTO `bdtest`.`credito`
(`IdCliente`,`Total`,`Solicitado`,`Estado`)
VALUES((select IdCliente from  `bdtest`.`clientes` where `Nombre` = 'dennis'),100000,1,'PROAPROBAR');

INSERT INTO `bdtest`.`credito`
(`IdCliente`,`Total`,`Solicitado`,`Estado`)
VALUES((select IdCliente from  `bdtest`.`clientes` where `Nombre` = 'carlos'),350000,1,'PROAPROBAR');

INSERT INTO `bdtest`.`credito`
(`IdCliente`,`Total`,`Solicitado`,`Estado`)
VALUES((select IdCliente from  `bdtest`.`clientes` where `Nombre` = 'ana'),50000,1,'PROAPROBAR');

INSERT INTO `bdtest`.`roles`
(`rol_descripcion`)VALUES('líder del área de créditos y cobranzas');

INSERT INTO `bdtest`.`formulario`
(`for_descripcion`)VALUES('Credito');

INSERT INTO `bdtest`.`accion`
(`acc_descripcion`)VALUES( 'Aprobar Creditos' );

INSERT INTO `bdtest`.`boton`
(`bot_descripcion`)VALUES('btn_aprobrar');

INSERT INTO `bdtest`.`boton`
(`bot_descripcion`)VALUES('btn_denegar');

INSERT INTO `bdtest`.`acc_bot`
(`Accion_idAccion`,`Boton_idBoton`)
VALUES(
(select idAccion from  `bdtest`.`accion` where `acc_descripcion` = 'Aprobar Creditos'),
(select idBoton from  `bdtest`.`boton` where `bot_descripcion` = 'btn_aprobrar')
);

INSERT INTO `bdtest`.`acc_bot`
(`Accion_idAccion`,`Boton_idBoton`)VALUES(
(select idAccion from  `bdtest`.`accion` where `acc_descripcion` = 'Aprobar Creditos'),
(select idBoton from  `bdtest`.`boton` where `bot_descripcion` = 'btn_denegar')
);

INSERT INTO `bdtest`.`form_rol_acc`
(`for_idFormulario`,`rol_idRoles`,`acc_idAccion`)
VALUES
(
(select idFormulario from  `bdtest`.`formulario` where `for_descripcion` = 'Credito'),
(select idRoles from  `bdtest`.`roles` where `rol_descripcion` = 'líder del área de créditos y cobranzas'),
(select idAccion from  `bdtest`.`accion` where `acc_descripcion` = 'Aprobar Creditos')
);

INSERT INTO `bdtest`.`form_rol_acc_usu`
(`id_Form_Rol_Acc`,`usu_idUsuarios`)
VALUES
(1,(select min(idUsuarios) from  `bdtest`.`usuarios` where `Nombre` = 'MARIA'));








