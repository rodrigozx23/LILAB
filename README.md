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
          - CreditoController.cs
          
      .Da(DataAccess)
          - CreditoDAO.cs
          - HistorialsbsDAO.cs     
          
      .Entidades 
          - Credito.cs
          - HistorialSBS.cs
          - Sentinel.bs
          
      .Service
          - CreditoService.bs
          
D)EndPoint.

   Ruta                                Typo       Param
   (/Credito/ActualizarEstadoCredito)  "POST"    { creditoID INT, accion string}<br>
   (/Credito/ListarCreditos )          "GET"     {}<br>
   (/Credito/ObtenerIndicadorSBS)      "GET"      { creditoID INT }<br>
   (/Credito/ObtenerIndicadorIA )      "GET"     { creditoID INT }<br>
          
E) Doc.
  Ubicacion :Raiz/carpetaDoc
    - Aprobar Creditos.png
    - bdtest_modelacion.png    
  
  Aqui se encuentra el modelado de la base de datos BDTEST, asi como un pequeño wireframe de como verse el APP.
  
  
  
