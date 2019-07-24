<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  margin: 8px 0;
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
  top: 50%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}

body{
	background-color: #485461;
	background-image: linear-gradient(315deg, #485461 0%, #28313b 74%);
	height:100%;
  	width:100%;
  	margin:0;
}


</style>
<body>
<br>
<div class = "login">
    <form action="result.jsp" method="POST">
        <center><input type="text" name="user" placeholder="Username"> <br>
        
		<input type="password" name="pass" placeholder="Password"/> <br>
		<br>
        <center><input type="submit" value="Login" /></center>
        
        <br>
        </center>
        
        <center><div id ="smalltext">Don't have an account? <a href="register.jsp" style="color:white;">Register here</a></center></div>
        <br>
        <br>
    </form>

    
  
</body>
</html>












