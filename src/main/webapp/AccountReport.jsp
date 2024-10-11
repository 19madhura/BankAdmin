<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Report</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</head>
<body style="margin-top:40px">
<div class="container">

<%
if(session.getAttribute("userid")!=null)
{
%>
 <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
              <a class="navbar-brand" href="#"><h1 style="color:grey"> Account Report: </h1></a>
               <a class="nav-link " href=""><%
String id=String.valueOf(session.getAttribute("userid"));
%>
<b>Manager id: </b><%=id%></a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
            
              <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left:150px">
                <form class="d-flex" role="search" action="SearchAccount.jsp" method=post>
                  <input class="form-control me-2" type="search" name="accno" placeholder="Account No." aria-label="Search ">
                  <button class="btn btn-outline-primary" type="submit">Search</button>
                </form>
              </div>
            </div>
          </nav>
          <br>

<table class="table table-bordered table-hover">
<tr>
<th>Account No</th>
<th>Name</th>
<th>type</th>
<th>Balance</th>
</tr>

<%
Connection con;
Statement st;
ResultSet rs;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://bwo3i3mcawqzqgcic8me-mysql.services.clever-cloud.com:3306/bwo3i3mcawqzqgcic8me?user=usd0e32pvbyxjjyk&password=vQ1rZ5D4xiF5qRYSWM7t");
    st=con.createStatement();
    rs=st.executeQuery("select * from accounts");
    
    while(rs.next())
    {
    	%>
    	<tr>
    	<td><%= rs.getInt("accno") %></td>
    	<td><%= rs.getString("accnm") %></td>
    	<td><%= rs.getString("acctype") %></td>
    	<td><%=rs.getFloat("balance") %></td>
    	</tr>
    	<% 
    }
}
catch(Exception e)
{
	System.out.println(e);
}

%>
<%  }
else
   %> <h5 class="display-7" style="color:red">invalid Session...</h5> <% 
    	
   %>
</table>
</div>
</body>
</html>