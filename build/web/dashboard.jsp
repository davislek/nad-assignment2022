<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@page import="java.sql.*,java.util.*" %>
<%@ page import="java.sql.*"%>

<%!Integer y[]={};%>
<%!String x[]={};%>
<%ArrayList<Integer> ylabel=new ArrayList<Integer>(Arrays.asList(y));%>
<%ArrayList<String> xlabel=new ArrayList<String>(Arrays.asList(x));%>
<%!ResultSet res;%>

<%!Integer pay[]={};%>
<%!String name[]={};%>
<%ArrayList<Integer> paylabel=new ArrayList<Integer>(Arrays.asList(pay));%>
<%ArrayList<String> namelabel=new ArrayList<String>(Arrays.asList(name));%>
<%!ResultSet rest;%>

<%!Integer a[]={};%>
<%!String b[]={};%>
<%ArrayList<Integer> alabel=new ArrayList<Integer>(Arrays.asList(a));%>
<%ArrayList<String> blabel=new ArrayList<String>(Arrays.asList(b));%>
<%!ResultSet rose;%>


<!DOCTYPE html>
<html>
    <head>
        <title>Online Shopping System</title>
        <!-- Importing all ui libs -->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <script src="js/simpleCart.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <script src="js/jquery.easing.min.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    </head>
    <body>
        <%
            //Checking whether admin in session or not
            if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
        %>
        <jsp:include page="adminHeader.jsp"></jsp:include>
            <div class="content-wrapper">
                <div class="container">
                    <div class="row pad-botm">
                        <div class="col-md-12">
                            <h4 class="header-line">ADMIN DASHBOARD</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-4 col-xs-6">
                            <div class="alert alert-info back-widget-set text-center">
                                <i class="fa fa-history fa-5x"></i>
                            <%
                                //Count product query
                                ResultSet totalProduct = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblproduct");
                                totalProduct.next();
                                int allProducts = totalProduct.getInt(1);
                            %>
                            <h3>
                                <%=allProducts%>
                            </h3>
                            Total Products
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="alert alert-success back-widget-set text-center">
                            <i class="fa fa-users fa-5x"></i>
                            <%
                                //Count customer query
                                ResultSet totalCustomer = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcustomer");
                                totalCustomer.next();
                                int allCustomer = totalCustomer.getInt(1);
                            %>
                            <h3><%=allCustomer%></h3>
                            Total Customers
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="alert alert-warning back-widget-set text-center">
                            <i class="fa fa-recycle fa-5x"></i>
                            <%
                                //Count orders query
                                ResultSet totalOrders = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblorders");
                                totalOrders.next();
                                int allOrders = totalOrders.getInt(1);
                            %>
                            <h3><%=allOrders%></h3>
                            Total Orders
                        </div>
                            
                    </div>
                            
                        <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="alert alert-warning back-widget-set text-center">
                            <i class="fa fa-users fa-5x"></i>
                            <%
                                //Count orders query
                                ResultSet totalStaff = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblstaff");
                                totalStaff.next();
                                int allStaff = totalStaff.getInt(1);
                            %>
                            <h3><%=allStaff%></h3>
                            Total Staff
                        </div>
                        </div>
                            
                            
                        <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="alert alert-warning back-widget-set text-center">
                            <i class="fa fa-users fa-5x"></i>
                            <%
                                //Count orders query
                                ResultSet longTerm = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblstaff where product_line='long_term'");
                                longTerm.next();
                                int numLong = longTerm.getInt(1);
                            %>
                            <h3><%=numLong%></h3>
                            Total Staff_longterm
                        </div>
                        </div>
                            
                            
                            
                            <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="alert alert-warning back-widget-set text-center">
                            <i class="fa fa-users fa-5x"></i>
                            <%
                                //Count orders query
                                ResultSet midTerm = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblstaff where product_line='mid_term'");
                                midTerm.next();
                                int numMid = midTerm.getInt(1);
                            %>
                            <h3><%=numMid%></h3>
                            Total Staff_midterm
                        </div>
                            </div>
                            
                            
                         <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="alert alert-warning back-widget-set text-center">
                            <i class="fa fa-users fa-5x"></i>
                            <%
                                //Count orders query
                                ResultSet shortTermProducts = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblproduct where product_category='short_term'");
                                shortTermProducts.next();
                                int numShortProducts = shortTermProducts.getInt(1);
                            %>
                            <h3><%=numShortProducts%></h3>
                            Total Short term Products
                        </div>
                            
                    </div>
                            
                            <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="alert alert-warning back-widget-set text-center">
                            <i class="fa fa-users fa-5x"></i>
                            <%
                                //Count orders query
                                ResultSet longTermProducts = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblproduct where product_category='long_term'");
                                longTermProducts.next();
                                int numLongTermProducts = longTermProducts.getInt(1);
                            %>
                            <h3><%=numLongTermProducts%></h3>
                            Total Long term Products
                        </div>
                            
                    </div>
                            
                            <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="alert alert-warning back-widget-set text-center">
                            <i class="fa fa-users fa-5x"></i>
                            <%
                                //Count orders query
                                ResultSet midTermProducts = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblproduct where product_category='mid_term'");
                                midTermProducts.next();
                                int numMidProducts = midTermProducts.getInt(1);
                            %>
                            <h3><%=numMidProducts%></h3>
                            Total Staff_midterm Products
                        </div>
                            
                    </div>
                            
                </div>
            </div>
        </div>
                            
        <jsp:include   page="chart.jsp"></jsp:include>                 
                            
                    
        
            <script src="assets/js/jquery-1.10.2.js"></script>
            <script src="assets/js/bootstrap.js"></script>
            <script src="assets/js/custom.js"></script>
            <script src="assets/js/chart.min.js"></script>
        <%
            } else {
                response.sendRedirect("admin-login.jsp");
            }
        %>
    </body>
</html>