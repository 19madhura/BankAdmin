<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>cashier home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<script type="text/javascript">
function test()
{
no=document.frm.ano.value;
document.getElementById("info").innerHTML="Account Number : "+no;
}

function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

function makeGetRequest() {
    no=document.frm.ano.value;
    http.open('get', 'SearchAccount.jsp?accno=' + no);
    http.onreadystatechange = processResponse;
    http.send(null);
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('info').innerHTML = response;
    }
}

</script>

</head>
<body style="margin-top: 25px">
    <div class="container">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
              <a class="navbar-brand" href="#"><h2>Cashier's Home :</h2></a>
              <a class="nav-link " href=""><%
String id=String.valueOf(session.getAttribute("userid"));
%>
<b>User id: </b><%=id%></a>
              
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                 
                  <div class="collapse navbar-collapse" id="navbarSupportedContent" >
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item" style="margin-left:40px">
                    <a class="nav-link " href="Deposit.html"><h6>Deposit</h6></a>
                  </li>
                  <li class="nav-item" style="margin-left:20px">
                    <a class="nav-link" href="Withdraw.html"><h6>Withdraw</h6></a>
                  </li>
                  
                <form class="d-flex" role="search" action="CheckBalance.jsp" method=post style="margin-left:60px">
                  <input class="form-control me-2" type="number" name="accno" placeholder="Check Balance" aria-label="Search">
                  <button class="btn btn-outline-success" type="submit">Check</button>
                </form>
              </div>
            </div>
          </nav>
        
        <hr>

<form name="frm">
<table>
<tr>
<td>Account Number :</td>
<td><input type="number" name="ano" class="form-control">
<td><input type="button" value="Search"  onclick="makeGetRequest()" class="btn btn-info">
</tr>
</table>
</form>
<br>
<div id="info">
<img src="images/cashier2.png" width="350px" height="240px">
</div>

</body>
</html>