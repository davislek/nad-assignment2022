<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
    //Getting all the inputs from the admin
    int id = Integer.parseInt(request.getParameter("id"));
    String staffname = request.getParameter("sName");
    String gender = request.getParameter("gender");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String pline = request.getParameter("productLine");
    
    
    //Querying to the database
    int updateStaff = DatabaseConnection.insertUpdateFromSqlQuery("update tblstaff set address='" + address + "',email='" +email + "',gender='" + gender + "',name='" + staffname + "',phone='" + phone + "' where id='" + id + "'");
    if (updateStaff > 0) {
        response.sendRedirect("admin-view-staff.jsp");
    } else {
        response.sendRedirect("admin-view-staff.jsp");
    }
%>