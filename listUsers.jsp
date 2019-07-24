<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
div.ex {
	text-align: right width:300px;
	padding: 10px;
	border: 5px solid #88b2f7;
	margin: 0px
}
</style>
<body>
<br><center><h1>User List</h1></center>
<center><h3>To add friends, click their username</h3></center>


<table align="center" cellpadding="5" cellspacing="5">
<tr>

</tr>
<tr bgcolor="#88b2f7">
<td><b>USERNAME</b></td>
<td><b>FIRST NAME</b></td>
<td><b>LAST NAME</b></td>

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
    String sql ="SELECT * FROM users "; 
    resultSet = statement.executeQuery(sql);
    
    while(resultSet.next()){
    	
		    %>
		    <tr bgcolor="#cbd8ed">
		
			<td><a href=<%= "\"addFriend.jsp?Id=" + resultSet.getInt("userID") + "\"" %> ><%=resultSet.getString("username") %></a></td>
		    <td><%=resultSet.getString("firstName") %></td>
		    <td><%=resultSet.getString("lastName") %></td>
		
		    </tr>

    <% 
    }

    } catch (Exception e) {
    e.printStackTrace();
    }
    %>
</table>

</body>
</html>









