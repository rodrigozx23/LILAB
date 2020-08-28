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

select * from historial_deudas



