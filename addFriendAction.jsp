<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String friendID = request.getParameter("Id");
	
	System.out.println("Actually adding friend action");
	
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://:3306/?";
    String dbName = "sampledb";
    String userId = "john";
    String password = "pass1234";
	String userID = (String) session.getAttribute("userid");   

    try {
    Class.forName(driverName);
    } catch (ClassNotFoundException e) {
    e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    PreparedStatement ps = null;
    
    String username = null;
    
    
    try{ 
       	connection = (Connection) DriverManager.getConnection("jdbc:mysql://:3306/sampledb?" + "user=root&password=baltej123");
        statement=connection.createStatement();
        String sql ="SELECT * FROM users"; 
        resultSet = statement.executeQuery(sql);
        
        while(resultSet.next()){
        	if(resultSet.getString("userID").equals(friendID)){
    	
    		   username = resultSet.getString("username"); 
    		

        	}
        	
        }


        } catch (Exception e) {
        e.printStackTrace();
       }
    
    
    
    ps = connection.prepareStatement("INSERT INTO favoriteFriends(userID, friendID, username) values(?,?,?)");  
	
	ps.setString(1, userID);
	ps.setString(2, friendID);
	ps.setString(3, username);
	
	ps.executeUpdate();
    
          
    ps.close();
    connection.close();
    
    String redirectURL = "favfriends.jsp";
 	response.sendRedirect(redirectURL);
    
    %>

</body>
</html>












