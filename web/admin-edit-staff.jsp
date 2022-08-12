<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Online Shopping System</title>
        <!-- Importing all ui libs -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
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
                            <h4 class="header-line">Edit Staff Details </h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-info">
                                <div class="panel-heading">Edit Staff Details</div>
                            <%
                                //Getting input from the admin
                                int id = Integer.parseInt(request.getParameter("id"));
                                //Querying to database
                                ResultSet updateResult = DatabaseConnection.getResultFromSqlQuery("select * from tblstaff where id='" + id + "' ");
                                while (updateResult.next()) {
                            %>
                            <div class="panel-body">
                                <form role="form" action="admin-edit-staff-process.jsp"
                                      method="post">
                                    <div class="form-group">
                                        <label>Product Id</label> <input class="form-control" type="text" name="id" value="<%=updateResult.getString("id")%>" readonly />
                                    </div>
                                    <div class="form-group">
                                        <label>Address</label> <input class="form-control" type="text" name="address" value="<%=updateResult.getString("address")%>" />
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label> <input class="form-control" type="text" name="email" value="<%=updateResult.getString("email")%>" />
                                    </div>
                                    <div class="form-group">
                                        <label>Gender</label> <input class="form-control" type="text" style="min-height: 100px;" name="gender" value="<%=updateResult.getString("gender")%>" />
                                    </div>
                                    <div class="form-group">
                                        <label>Staff Name</label> <input class="form-control" type="text" name="sName" value="<%=updateResult.getString("name")%>" />
                                    </div>
                                     <div class="form-group">
                                        <label>Phone</label> <input class="form-control" type="text" name="phone" value="<%=updateResult.getString("phone")%>" />
                                    </div>
                                    <div class="form-group">
                                        <label>Product Line Category</label> <select class="form-control" name="productLine">
                                            <option>long_term</option>
                                            <option>mid_term</option>
                                            <option>short_term</option>
                                        </select>
                                    </div>

                                    <button type="submit" class="btn btn-success">Update Staff Details</button>
                                </form>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
            <script src="assets/js/jquery-1.10.2.js"></script>
            <script src="assets/js/bootstrap.js"></script>
            <script src="assets/js/custom.js"></script>
        <%
            } else {
                response.sendRedirect("admin-edit-staff.jsp");
            }
        %>
    </body>
</html>