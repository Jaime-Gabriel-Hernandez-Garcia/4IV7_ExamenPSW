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
                    int id = Integer.parseInt(request.getParameter("idborrar"));
                    
                    String q = "delete from mproducto where id_pro = " + id;
                    
                    set = con.createStatement();
                    int borrar = set.executeUpdate(q);
                    
                    %>
            <h1>Registro Borrado con Exito</h1>        
                    <%
                    set.close();
                
                }catch(SQLException ed){
                    System.out.println("Error al borrar el registro de la tabla");
                    System.out.println(ed.getMessage());
                    %>
            <h1>Registro No Borrado con Exito, error en el recurso, solo juguito again</h1>        
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