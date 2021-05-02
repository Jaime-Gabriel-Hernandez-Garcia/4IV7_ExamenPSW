<%-- 
    Document   : borrar
    Created on : 30/04/2021, 04:48:21 PM
    Author     : demon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar Registro</title>
    </head>
    <body>
        
        <% 
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            String url, userName, password, driver;
            url = "jdbc:mysql://localhost/Productos";
            userName = "root";
            password = "22mayo2004";
            driver = "com.mysql.jdbc.Driver";
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                try{
                    String nombre2, sabor2, estado2, q;
                    int cantidad2, precio2;
                    
                    nombre2 = request.getParameter("nombreNuevo");
                    cantidad2 = Integer.parseInt(request.getParameter("cantidadNueva"));
                    sabor2 = request.getParameter("saborNuevo");
                    estado2 = request.getParameter("estadoNuevo");
                    precio2 = Integer.parseInt(request.getParameter("precioNuevo"));
                    
                    int id = Integer.parseInt(request.getParameter("idAct"));

                    q = "update mproducto set nom_pro = '" + nombre2 + 
                        "', can_pro = '" + cantidad2 + 
                        "', est_pro = '" + estado2 + 
                        "',sab_pro = '" + sabor2 + 
                        "', pre_pro = ' " + precio2 + 
                        "', where id_pro = " + id ;
                    
                    set = con.createStatement();
                    int Actualizar = set.executeUpdate(q);
                    
                    %>
            <h1>Registro Actualizado con Exito</h1>        
                    <%
                    set.close();
                
                }catch(SQLException ed){
                    System.out.println("Error al borrar el registro de la tabla");
                    System.out.println(ed.getMessage());
                    %>
            <h1>Registro No Actualizado con Exito, error en el recurso, solo juguito again</h1>        
                    <%
                        
                }
                con.close();
                
            
            }catch(Exception e){
                System.out.println("Error al conectar con la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                %>
        <h1>Sitio en Construcción</h1>            
                    <%
            
            }
            %>
        
        <br>
                    <a href="index.html" >Regresar al Menú Principal</a>
                    <br>
                    <a href="consultarProductos.jsp" >Consulta de Tabla General de Usuarios</a> 
        
    </body>
</html>