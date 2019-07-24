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


.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding-left: 25px;
  text-decoration: none;
  font-size: 30px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

#box {
    height: 600px;
    width: 600px;
    position: fixed;
    top: 50%;
    left: 50%;
    margin-top: -300px;
    margin-left: -300px;
}


</style>

<body>

<div id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	<a href = "List.jsp">Homepage</a><br>
	<a href = "jokes.jsp" >Add a new joke</a><br>
	<a href ="search.jsp" >Search Jokes</a><br>
	<a href ="favfriends.jsp" >Favorite Friends</a><br>
	<a href ="favjokeslist.jsp" >Favorite Jokes</a><br>
	<a href ="samedayjokes.jsp" >Query 2</a><br>
	<a href ="goodreviews.jsp" >Query 3</a><br>
	<a href ="mostjokessince.jsp" >Query 4</a><br>
	<a href ="befriended.jsp" >Query 5</a><br>
	<a href ="badjokes.jsp" >Query 6</a><br>
	<a href ="generousreviewers.jsp" >Query 7</a><br>
	<a href ="harshcritics.jsp" >Query 8</a><br>
	<a href ="mediocrity.jsp" >Query 9</a><br>
</div>

<span style="font-size:30px;cursor:pointer;color:white;padding: 9px;" onclick="openNav()">&#9776; </span>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "300px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>

	<div class = "login">
    <form action="insertJoke" method="POST">
        
        <input type="text" placeholder = "Subject" name="subject" size="75">
        <input type="text" placeholder = "Tags" name="tags" size="75">
        <br>
        <br>
        <input type="text" placeholder = "Description" name="description">
        
     

    <input type="submit" value="Submit" />
    </form>
    </div>
    
</body>
</html>