<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

System.out.print("Listed below are the Users who never posted any excellent jokes:")

<table align="center" cellpadding="5" cellspacing="5">

<tr>

<tr bgcolor="#88b2f7">
<td><b>USER ID</b></td>
<td><b>JOKE TAG</b></td>

</tr>

<%
    
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://:3306/?";
    String dbName = "sampledb";
    String userId = "john";
    String password = "pass1234";
    
    

%>

</body>
</html>