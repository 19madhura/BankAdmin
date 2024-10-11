<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</head>
<body style="margin-top:30px">
<div class="container">

<h1>Bank Admin</h1>
<hr>
<br>
<form action="CheckAadmin" method="post">
<table>
<tr>
<td>User Id</td>
<td><input type="text" name="uid" required autocomplete="off" class="form control"></td>
</tr>

<tr>
<td>Password</td>
<td><input type="password" name="psw" required autocomplete="off" class="form control"></td>
</tr>

<tr>
<td><input type="submit" value="Submit" class="btn btn-primary"></td>
</tr>
</table>
</form>
<hr>
<center>
Developed By Madhura Deshpande
<br>
GlobalBank&copy;2024
</center>
</div>
</body>
</html>