<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
 
<%
    
        String id = request.getParameter("id");
        String pline = "short_term";
       
        
        
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/syntax_group","root","");
        pst = con.prepareStatement("update tblstaff set product_line = ? where id = ?");
        pst.setString(1, pline);
        pst.setString(2, id);
        pst.executeUpdate();
        response.sendRedirect("admin-view-staff.jsp");
        
        %>
        
        
 
