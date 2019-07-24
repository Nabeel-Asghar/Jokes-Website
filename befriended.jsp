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

<h3>Check which users have mutual friends.</h3>

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

try{ 

connection = (Connection) DriverManager.getConnection("jdbc:mysql://:3306/sampledb?" + "user=root&password=baltej123");
statement=connection.createStatement();
String sql = "SELECT * FROM users";
resultSet = statement.executeQuery(sql);
%>
<form>

<h3>USER 1: </h3>
<select name="user1" id="user1">

<%
while(resultSet.next()){
%>

 <option value="<%=resultSet.getString("username")%>"><%=resultSet.getString("username")%></option>

<% 
}
%>
</select>

<h3>USER 2: </h3>
<select name="user2" id="user2">
<%

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

 <option value="<%=resultSet.getString("username")%>"><%=resultSet.getString("username")%></option> 

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

</select>
<input type="submit" value="Submit" />
</form>

<br>
<table align="center" cellpadding="5" cellspacing="5">
<tr>

</tr>
<tr bgcolor="#88b2f7">
<td><b>USERNAME</b></td>
<td><b>FIRST NAME</b></td>
<td><b>LAST NAME</b></td>
</tr>

<%
String user1 = request.getParameter("user1");
String user2 = request.getParameter("user2");

String sql = "SELECT * from users where userID in(SELECT userID FROM favoritefriends WHERE friendID=(SELECT userID from users where username='%"+user1+"%') or friendID=(SELECT userID from users where username='%"+user1+"%') GROUP by userID having COUNT(*)=2)";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){
%>
<tr bgcolor="#cbd8ed">

<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("firstname") %></td>
<td><%=resultSet.getString("lastname") %></td>

</tr>

<%} 
%>

</table>

</body>
</html>