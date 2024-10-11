<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Account</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</head>
<body style="margin-top:40px">
<div class="container">
<h1 class="display-8">Open New Account</h1>
<hr>
<form action="OpenAccount" method="post">
<table>
<tr>
<td>Account Number</td>
<td><input type="number" name="accno" value="0" required autocomplete="off" class="form-control"></td>
</tr>

<tr>
<td>Name</td>
<td><input type="text" name="accnm" required autocomplete="off" class="form-control"></td>
</tr>

<tr>
<td>Type</td>
<td>
<select name="acctype" class="form-control">
                 <option value="saving">Saving</option>
				 <option value="fixed">Fixed</option>
				 <option value="current">Current</option>
				 <option value="ppf">PPF</option>
				</select>
</td>
</tr>

<tr>
<td>Balance</td>
<td><input type="number" name="balance" required autocomplete="off" class="form-control" ></td>
</tr>

<tr>
<td><input type="submit" value="Submit" class="btn btn-primary"></td>
</tr>
</table>
</form>
</div>
</body>
</html>