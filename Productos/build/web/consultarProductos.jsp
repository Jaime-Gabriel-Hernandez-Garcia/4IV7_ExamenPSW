<%-- 
    Document   : consultar
    Created on : 30/04/2021, 04:33:19 PM
    Author     : demon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Cuentas</title>
    </head>
    <body>
        <h1>Tabla de Productos General</h1>
        <br>
        <table border="2" width="80%" style="position:  relative; margin-left: 8rem; margin-right: 8rem;">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                    <th>Sabor</th>
                    <th>Estado</th>
                    <th>Editar</th>
                </tr>
            </thead>
            <tbody> 
                
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
                           String q = "select * from mproducto";
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                            
                %>
                <tr>
                    <td> <%=rs.getInt("id_pro")%> </td>
                    <td> <%=rs.getString("nom_pro")%> </td>
                    <td> <%=rs.getString("can_pro")%> </td>
                    <td> <%=rs.getString("sab_pro")%> </td>
                    <td> <%=rs.getString("est_pro")%> </td>
                    
                </tr>


                <%
                                
                                
                                
                            }
                            rs.close();
                            set.close();
                            
                        
                        }catch(SQLException ed){
                            System.out.println("Error al consultar la tabla");
                            System.out.println(ed.getMessage());
                            %>
            </tbody>
            <h1>Recurso no disponible solo juguito contigo UwU</h1>
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
                
            </tbody>
        </table>
                    <br>
                    <a href="index.html" >Regresar al Menú Principal</a>
                    <br>
                    <a href="registrar.jsp" >Registrar nuevo Usuario</a>     
    </body>
</html>