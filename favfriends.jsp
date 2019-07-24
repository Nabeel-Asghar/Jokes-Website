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
<br><center><h1>Friends List</h1></center>

<table align="center" cellpadding="5" cellspacing="5">
<tr>

</tr>
<tr bgcolor="#88b2f7">
<td><b>USER ID</b></td>
<td><b>USERNAME</b></td>

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
    String sql ="SELECT * FROM favoriteFriends "; 
    resultSet = statement.executeQuery(sql);
    

    while(resultSet.next()){
    	if(resultSet.getString("userID").equals(thisid)){
		    %>
		    <tr bgcolor="#cbd8ed">
		
		    <td><%=resultSet.getString("friendID") %></td>
		    <td><%=resultSet.getString("username") %></td>
		
		    </tr>

    <% }
    	else
    		continue;
    }

    } catch (Exception e) {
    e.printStackTrace();
    }
    %>
</table>


<center><h3><a href = "listUsers.jsp">Add Friends</a></h3></center>
<center><h3><a href = "removefriend.jsp">Remove Friends</a></h3></center>

</body>
</html>









