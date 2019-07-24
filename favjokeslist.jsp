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
<title>Favorite jokes</title>
</head>
<body>

<br><center><h1>Your Favorite Jokes</h1></center>
<center><h3>To remove a joke, click the ID.</h3></center>

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

    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://:3306/?";
    String dbName = "sampledb";
    String userId = "john";
    String password = "pass1234";
	Object thisid = (String) session.getAttribute("userid");   

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
    String sql ="SELECT * FROM jokes WHERE jokeID in (SELECT jokeID FROM favoriteJokes WHERE userID ='"+thisid+"' )"; 
    resultSet = statement.executeQuery(sql);

    while(resultSet.next()){
		    %>
			<tr bgcolor="#cbd8ed">
			
			<td><a href=<%= "\"removejoke.jsp?Id=" + resultSet.getString("jokeID") + "\"" %> ><%=resultSet.getString("jokeID") %></a></td>
			<td><%=resultSet.getString("title") %></td>
			<td><%=resultSet.getString("author") %></td>
			<td><%=resultSet.getString("des") %></td>
			<td><%=resultSet.getString("jokeDate") %></td>
			<td><%=resultSet.getString("tags") %></td>
			<td><%=resultSet.getString("reviewCount") %></td>
			
			</tr>

    <% }

    } catch (Exception e) {
    e.printStackTrace();
    }
    %>
</table>

</body>
</html>