<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
</head>
<style>

html{
font-family: 'Roboto', sans-serif;
}

form {
	width:500px;
	margin: 0 auto; 
	font-size: 20px;
	padding: 10px;	
	border-radius: 16px;
	height: 250px;
}

input[type=text], input[type=password] {
  width: 85%;
  padding: 6px 5px;
  margin: 8px 0;
  display: inline-block;
  border: none;
  border-bottom: 1px solid white;
  font-size: 25px;
  background-color:transparent;
  color: white;
}

#text{
	font-size:50px;
	color: white;
	line-height: 150%;
}

#smalltext{
	font-size: 20px;
	color:white;
}



input[type=submit] {
  background-color: white;
  color: black;
  padding: 14px 20px;
  margin: 8px;
  margin-left: 3px;
  border: none;
  cursor: pointer;
  width: 85%;
  border-radius: 16px;
  font-size: 25px;

}

input[type=submit]:hover {
  background-color: #d6d6d6;
}

.login{
  margin: 0;
  position: absolute;
  top: 35%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}


body{
	
	height:100%;
  	width:100%;
  	margin:0;
	background-color: #485461;
	background-image: linear-gradient(315deg, #485461 0%, #28313b 74%);
}


</style>

<body>
<div class = "login">
    <form action="insert" method="POST">
        <input type="text" name="user" placeholder="Username">
        <input type="password" name="pass" placeholder="Password" id="pass" onchange='check();' />
        <input type="password" name="confirm_pass" placeholder="Confirm Password" id="confirm_pass" onchange='check();' />
        
        <script language='javascript' type='text/javascript'>
        	
        	var check = function(){
        		
        		var pass1 = document.getElementById("pass");
        		var pass2 = document.getElementById("confirm_pass");
        		
        		if(pass1.value==pass2.value){
        			return true;
        		}
        		
        		alert("Password not same in both fields");
        		return false;
        		
        	}
        	
        	function myFunction() {
        		  alert("If you are not redirected, your username or email may already be in the database.");
        		}
        
        </script>
        
        <input type="text" placeholder="First Name" name="first">
        <input type="text" placeholder="Last Name" name="last">
        <input type="text" placeholder="Email" name="mail">
        <input type="text" placeholder="Gender" name="gender">
        <input type="text" placeholder="Age" name="age">

    <input type="submit" value="Submit" onclick="myFunction()"/>
    </form>
</div>

    
</body>
</html>


















