<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

//This is the profile page for the user

input[type=submit] {
  background-color: #88b2f7;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 25%;
}

div.ex {
	text-align: right width:300px;
	padding: 10px;
	border: 5px solid #88b2f7;
	margin: 0px
}
</style>
<body>


<%
	String friend = request.getParameter("Id");
	
	System.out.println("You are adding the friend:");
	System.out.println(friend);
	
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
    ResultSet resultSet2 = null;
    
    try{ 
   	connection = (Connection) DriverManager.getConnection("jdbc:mysql://:3306/sampledb?" + "user=root&password=baltej123");
    statement=connection.createStatement();
    String sql ="SELECT * FROM users"; 
    resultSet = statement.executeQuery(sql);
    String username = null;
    
    while(resultSet.next()){
    	if(resultSet.getString("userID").equals(friend)){
		    %>
		    <h2><center>
		    <%=resultSet.getString("firstname") %>
		    <%=resultSet.getString("lastname")  %>
		    </center></h2>
			<h2><center>
		    <%=resultSet.getString("username") %>
		    <% username=resultSet.getString("username");%>
		    </center></h2>
			
			
    <% 
    
    	break;}
    	
    }
       
    %>
    
    <center><a href=<%= "\"addFriendAction.jsp?Id=" + resultSet.getString("userID") + "\"" %> >Add Friend</a></center>

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
    
    sql ="SELECT * FROM jokes"; 
    resultSet2 = statement.executeQuery(sql);
    
    while(resultSet2.next()){
    	if(resultSet2.getString("author").equals(username)){
    		
    		%>
    		<tr bgcolor="#cbd8ed">

    		<td><%=resultSet2.getString("jokeID") %></td>
    		<td><%=resultSet2.getString("title") %></td>
    		<td><%=resultSet2.getString("author") %></td>
    		<td><%=resultSet2.getString("des") %></td>
    		<td><%=resultSet2.getString("jokeDate") %></td>
    		<td><%=resultSet2.getString("tags") %></td>
    		<td><%=resultSet2.getString("reviewCount") %></td>

    		</tr>

    		<% 
    		
    	}
    }


    } catch (Exception e) {
    e.printStackTrace();
    }
    %>
    
    
    

    
</body>
</html>








