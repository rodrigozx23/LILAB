LILAB Saludos Cordiales.

Este proyecto se desarrollo con las tecnologias Asp.Core, Mysql.

A) Backup-
Ubicacion : /BD. 
 
Debemos ejecutar los scripts en el siguiente orden:
  1)Primero ejecutar el script BDTEST.sql.
  2)luego ejecutar el script Data.sql.
  3)para finalizar con los stores procedures 
      SP_ACTUALIZAR_CREDITO.sql.
      SP_LISTADO_SBS.sql. 
      SP_LISTAR_CREDITOS.sql.
  
B) App-
Ubicacion : /DEV. 

Abrir la solucion, ir al archivo "appsettings.json" este se encuentra en la raiz de APP y darle editar para cambiar la cadena de conexion.
  
                                                  "ConnectionStrings": {
                                                        "Default": "server=?;user=?;database=?]"
                                                  }    
                                                                      * Dejar el key con la descripcion "Default" *
  
c) Arquitectura-
 
 test    
      .Controller      
        -CreditoController 
            Ruta, Typo, Param
                - /Credito/ActualizarEstadoCredito , "POST" , { creditoID INT, accion string}
                - /Credito/ListarCreditos , "GET", {}
                - /Credito/ObtenerIndicadorSBS , "GET", { creditoID INT }
                - /Credito/ObtenerIndicadorIA , "GET", { creditoID INT }
      .Da(DataAccess)
          - CreditoDAO
          - HistorialsbsDAO     
          
      .Entidades 
          - Credito
          - HistorialSBS
          - Sentinel
          
      .Service
          - CreditoService
          
D) Doc.
  Ubicacion :Raiz/carpetaDoc
    - Aprobar Creditos.png
    - bdtest_modelacion.png    
  
  Aqui se encuentra el modelado de la base de datos BDTEST, asi como un pequeño wireframe de como verse el APP.
  
  
  
