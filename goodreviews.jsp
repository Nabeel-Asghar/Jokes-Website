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



<h3>Search for users who posted some damn good jokes</h3>

<form action="" method="get">
        Search:&nbsp;
        <input type="text" class="form-control" name="searchuser">
</form>

<%
String searchuser = request.getParameter("searchuser");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://:3306/?";
String dbName = "sampledb";
String userId = "john";
String password = "pass1234";
System.out.println(searchuser);

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
<td><b>JOKE ID</b></td>
<td><b>TITLE</b></td>
<td><b>AUTHOR</b></td>
<td><b>DESCRIPTION</b></td>
<td><b>JOKE DATE</b></td>
<td><b>TAGS</b></td>
<td><b>REVIEW COUNT</b></td>
</tr>
<%
try{ 
String bad = "Bad";
String horrible = "Horrible";

connection = (Connection) DriverManager.getConnection("jdbc:mysql://:3306/sampledb?" + "user=root&password=baltej123");
statement=connection.createStatement();
String sql ="Select * from jokes where jokeID in(Select jokeID from reviews where jokeID not in(Select jokeID from reviews where score='Bad' or score='Horrible'))"; 

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	if(resultSet.getString("author").equals(searchuser)){
%>
<tr bgcolor="#cbd8ed">

<td><%=resultSet.getString("jokeID") %></td>
<td><%=resultSet.getString("title") %></td>
<td><%=resultSet.getString("author") %></td>
<td><%=resultSet.getString("des") %></td>
<td><%=resultSet.getString("jokeDate") %></td>
<td><%=resultSet.getString("tags") %></td>
<td><%=resultSet.getString("reviewCount") %></td>

</tr>

<% }
	else
		continue;
}

} catch (Exception e) {
e.printStackTrace();
}
%>

</body>
</html>