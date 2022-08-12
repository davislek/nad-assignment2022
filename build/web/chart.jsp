<%-- 
    Document   : newjsp
    Created on : Aug 5, 2022, 6:02:02 AM
    Author     : Angella
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%@ page import="com.connection.*"%>
<%Integer y[]={};%>
<%String x[]={};%>
<%ArrayList<Integer> ylabel=new ArrayList<Integer>(Arrays.asList(y));%>
<%ArrayList<String> xlabel=new ArrayList<String>(Arrays.asList(x));%>
<%ResultSet res;%>

<%Integer pay[]={};%>
<%String name[]={};%>
<%ArrayList<Integer> paylabel=new ArrayList<Integer>(Arrays.asList(pay));%>
<%ArrayList<String> namelabel=new ArrayList<String>(Arrays.asList(name));%>
<%ResultSet rest;%>

<%Integer a[]={};%>
<%String b[]={};%>
<%ArrayList<Integer> alabel=new ArrayList<Integer>(Arrays.asList(a));%>
<%ArrayList<String> blabel=new ArrayList<String>(Arrays.asList(b));%>
<%ResultSet rs;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/grid.css"/>
    </head>
    <body>
        <h1>GRAPHS FOR TRACKING CUSTOMER BASE</h1>
        
            <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    Connection conn = DatabaseConnection.getConnection();
                    Statement st = conn.createStatement();
                    
                    //BAR CHART
                    res=st.executeQuery("select * from tbltotalsales");
                    while(res.next()){
                        xlabel.add("'"+res.getString("product_line")+"'");
                        ylabel.add(res.getInt("total_sales"));
                    }
                    
                    //PIE CHART
                    rest=st.executeQuery("select * from tbltotalstaff");
                    while(rest.next()){
                        namelabel.add("'"+rest.getString("product_line")+"'");
                        paylabel.add(rest.getInt("total_staff"));
                    }
                   
                    //LINE GRAPH
                    rs=st.executeQuery("select * from tblgender");
                    while(rs.next()){
                        blabel.add("'"+rs.getString("product_line")+"'");
                        alabel.add(rs.getInt("total_female"));
                    }
                    
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } catch(ClassNotFoundException e) {
                e.printStackTrace();
            }
        %>
        <div>
        <div class="main">
        <div class="charts">
           
            <div class="chart">
                <div>
            <canvas id="line"></canvas>
                </div>
            </div>
          
            <div class="chart">
                <div>
            <canvas id="r2"></canvas>
                </div>
            </div>
            
            <div class="chart">
                <div>
            <canvas id="r3"></canvas>
                </div>
            </div>
        </div>
        </div>
        <script src="assets/js/chart.min.js"></script>
        <script>
    
var ctx = document.getElementById("line").getContext("2d");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <%out.println(xlabel);%>,
        datasets: [{
            label: 'Bar Graph',
            data: <%out.println(ylabel);%>,
            backgroundColor: [
                'rgba(0,255,0)'

            ],
            borderColor: 'rgb(41, 155, 99)',
            borderWidth: 1
        }
        
    ]
    },
    options: {
        responsive: true,
        scales:{
        y:{
            title:{
                display:true,
                text:"SALES"
            }
        },
        x:{
            title:{
                display:true,
                text:"PRODUCT LINE NAME"
            }
        }
        }
    }
});


        </script>
        <script>
  var ctx2 = document.getElementById('r2').getContext('2d');
var myChart2 = new Chart(ctx2, {
    type: 'pie',
    data: {
        labels: <%out.println(namelabel);%>,
            datasets: [{
            label: 'Pie Chart',
            data: <%out.println(paylabel);%>,
            backgroundColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderWidth: 1
        }]

    },
    options: {
        responsive: true,
        indexAxis: 'y',
        "maintainAspectRatio": false
    }
});
</script>
<script>
    
var ctx3 = document.getElementById("r3").getContext("2d");
var myChart3 = new Chart(ctx3, {
    type: 'line',
    data: {
        labels: <%out.println(blabel);%>,
        datasets: [{
            label: 'Line Graph',
            data: <%out.println(alabel);%>,
            backgroundColor: [
                'rgba(0,255,0)'

            ],
            borderColor: 'rgb(41, 155, 99)',
            borderWidth: 1
        }
        
    ]
    },
    options: {
        responsive: true,
        scales:{
        y:{
            title:{
                display:true,
                text:"GENDER"
            }
        },
        x:{
            title:{
                display:true,
                text:"PRODUCT LINE NAME"
            }
        }
        }
    }
});


        </script>
    </body>
</html>

