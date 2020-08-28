use bdtest;
DELIMITER // 
DROP PROCEDURE IF EXISTS SP_LISTAR_CREDITOS //
CREATE PROCEDURE SP_LISTAR_CREDITOS()
BEGIN	
	SELECT 
		cre.idCredito,
		cre.IdCliente,
        cli.nombre,
		cre.Total,
		cre.Estado
    FROM credito cre 
    INNER JOIN clientes cli 
    on cre.IdCliente = cli.IdCliente;
END //
DELIMITER ;

  /* CALL SP_LISTAR_CREDITOS() */

