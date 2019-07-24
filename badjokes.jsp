<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>



<h3>Search for users who posted some damn bad jokes</h3>
<h4>Damn bad = less than three excellent reviews</h4>

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://:3306/?";
String dbName = "sampledb";
String userId = "john";
String password = "pass1234";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<table align="center" cellpadding="5" cellspacing="5">
<tr>

</tr>
<tr bgcolor="#88b2f7">
<td><b>USERNAME</b></td>
</tr>
<%
try{ 

connection = (Connection) DriverManager.getConnection("jdbc:mysql://:3306/sampledb?" + "user=root&password=baltej123");
statement=connection.createStatement();
String sql ="SELECT distinct author from jokes where jokeID not in(SELECT jokeID FROM reviews WHERE score = 'Excellent' GROUP BY jokeID HAVING COUNT(*) >=3)";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#cbd8ed">

<td><%=resultSet.getString("author") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

</body>
</html>