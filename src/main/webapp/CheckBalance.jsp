<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Balance</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body style="margin-top:40px">
<div class="container">
<h1 class="display-8">Balance Check</h1>
<hr>
 <%
 Connection con;
 PreparedStatement pst;
 ResultSet rs;
 int accno;
        try{
          accno=Integer.parseInt(request.getParameter("accno"));
        	Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://bwo3i3mcawqzqgcic8me-mysql.services.clever-cloud.com:3306/bwo3i3mcawqzqgcic8me?user=usd0e32pvbyxjjyk&password=vQ1rZ5D4xiF5qRYSWM7t");
			pst=con.prepareStatement("select accnm,balance from accounts where accno=?");
			
			pst.setInt(1,accno);
			rs=pst.executeQuery();
			
			if(rs.next())
			{
				%>
				<table class="table table-bordered border-secondary table-hover">
                    <tr>
                        <td>Name:</td>
                        <td><%= rs.getString("accnm") %></td>
                    </tr>
                   <tr>
                        <td>Balance:</td>
                        <td><b><%= rs.getString("balance") %></b></td>
                    </tr>
                </table>
				<%
			}
			else
				out.println("Account Doesnot exist");
        }
        catch(Exception e)
        {
        	
        }
        %>
        <br>
        <a href="Cashier.jsp">Home</a>
    </div>
</body>
</html>