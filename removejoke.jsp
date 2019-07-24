<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
div.ex {
	text-align: right width:300px;
	padding: 10px;
	border: 5px solid #88b2f7;
	margin: 0px
}
</style>
<body>
<%

    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://:3306/?";
    String dbName = "sampledb";
    String userId = "john";
    String password = "pass1234";
	Object userid = (String) session.getAttribute("userid");   
	String jokeid = request.getParameter("Id");
	
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
    String sql ="DELETE FROM favoriteJokes WHERE userID ='"+userid+"' and jokeID='"+jokeid+"'"; 
    int i=statement.executeUpdate(sql);
    
    } catch (Exception e) {
    e.printStackTrace();
    }
    
    String redirectURL = "favjokeslist.jsp";
 	response.sendRedirect(redirectURL);
    
    %>

</body>
</html>