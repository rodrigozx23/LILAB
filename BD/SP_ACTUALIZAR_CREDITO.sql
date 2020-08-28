use bdtest;
DELIMITER // 
DROP PROCEDURE IF EXISTS SP_ACTUALIZAR_ESTADO_CREDITO //
CREATE PROCEDURE SP_ACTUALIZAR_ESTADO_CREDITO(
in PEI_ID_CREDITO int,
PEV_ESTADO varchar(45)
)
BEGIN	
	update credito set Estado = PEV_ESTADO where idCredito = PEI_ID_CREDITO;
END //
DELIMITER ;

  /* CALL SP_ACTUALIZAR_ESTADO_CREDITO(1,'123') */

