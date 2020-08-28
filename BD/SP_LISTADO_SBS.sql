use bdtest;
DELIMITER // 
DROP PROCEDURE IF EXISTS SP_LISTADO_SBS //
CREATE PROCEDURE SP_LISTADO_SBS(
in PEI_ID_CLIENTE int
)
BEGIN	

	select 
		h.idHistorial_Deudas,
		h.Total,	
		h.Fecha_Credito,
		h.Fecha_Pago,
        c.IdCliente,
        c.Nombre
	from historial_deudas h
    inner join clientes c on h.IdCliente = c.IdCliente
	where c.IdCliente = PEI_ID_CLIENTE;
    
END //
DELIMITER ;

  /* CALL SP_LISTADO_SBS (9) */

 

