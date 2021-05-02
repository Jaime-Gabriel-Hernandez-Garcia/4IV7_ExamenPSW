<%-- 
    Document   : registrarProducto
    Created on : 1/05/2021, 05:00:30 PM
    Author     : ACER01
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de el helado</title>
    </head>
    <body>
        <h1>Registro Producto</h1>
        <% 
            //aqui va codigo java
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost/Productos";
            userName = "root";
            password = "22mayo2004";
            driver = "com.mysql.jdbc.Driver";
            //voy a lanzar una vista para cuando hace la insercion, cuando 
            //hay error en la lectura de la tabla
            //hay error por parte de bd
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                
                try{
                    String nombre, sabor, estado,q;
                    int cantidad, precio;
                    nombre = request.getParameter("nombre");
                    cantidad = Integer.parseInt(request.getParameter("cantidad"));
                    sabor = request.getParameter("sabor");
                    estado = request.getParameter("estado");
                    precio = Integer.parseInt(request.getParameter("precio"));
                    
                    set = con.createStatement();
                    
                    q = "insert into mproducto(nom_pro, can_pro, sab_pro, est_pro, pre_pro)"
                            + "values ('"+nombre+"', '"+cantidad+"', '"+sabor+"', '"+estado+"', '"+precio+"' )";
                    
                    int registro = set.executeUpdate(q);
                    
                    %>
        <h1>Registro Exitoso</h1>   
        <%
                    set.close();
                
                }catch(SQLException ed){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(ed.getMessage());
                    %>
        <h1>Registro No Exitoso, error en la lectura de la tabla</h1>            
                    <%
                
                }
                con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            %>
        <h1>Sitio en Construcción</h1>            
                    <%
            }
            %>
    </body>
</html>
