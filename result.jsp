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
</head>
<body>
    
    <%
    String user = request.getParameter("user");
    String pass = request.getParameter("pass");
    
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
    String sql ="SELECT * FROM users"; 
    resultSet = statement.executeQuery(sql);

    
    while(resultSet.next()){
    	
		if(user.equals(resultSet.getString("username")) && pass.equals(resultSet.getString("password"))){
			
			String userid = resultSet.getString("userID");
			String username = resultSet.getString("username");
			String firstname = resultSet.getString("firstname");

		    session.setAttribute("userid", userid);
		    session.setAttribute("username", username);
			session.setAttribute("firstname", firstname);
		    
			String redirectURL = "List.jsp";
	        response.sendRedirect(redirectURL);
	        return;
	       
		}
		else
			continue;
    		
    }

    } catch (Exception e) {
    e.printStackTrace();
    }
    
    
/*     if((user.equals("john")) && (pass.equals("pass1234"))){
    	
    	
    	 String redirectURL = "List.jsp";
         response.sendRedirect(redirectURL);
         
    } */
    if((user.equals("root")) && (pass.equals("baltej123"))){
   	 	String redirectURL = "List.jsp";
     	response.sendRedirect(redirectURL);
     	
     	
    }

    else{
    	System.out.println("WRONG!");
    	String redirectURL = "login.jsp";
     	response.sendRedirect(redirectURL);
     	
    } 
    %>
</body>
</html>
