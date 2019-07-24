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
  font-size: 35px;

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

table {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 60%;
}

table td, table th {
  border: 1px solid #ddd;
  padding: 8px;
}

table tr:nth-child(even){background-color: #eaeaea;}

table tr:hover {background-color: #ddd;}

table th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
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

<form action="" method="get">
        <input type="text" placeholder="Search jokes" class="form-control" name="searchtag">
        <br><br><br>
        <div id = "smalltext">Click the joke title to add to favorites. Click the review count to review joke.</div>
        
</form>

<%
String tags = request.getParameter("searchtag");
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
%>

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
try{ 
connection = (Connection) DriverManager.getConnection("jdbc:mysql://:3306/sampledb?" + "user=root&password=baltej123");
statement=connection.createStatement();
String sql ="SELECT * FROM jokes WHERE tags like'%"+tags+"%' "; 

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#ffffff">

<td><%=resultSet.getString("jokeID") %></td>
<td><a href=<%= "\"favoritejokes.jsp?Id=" + resultSet.getInt("jokeID") + "\"" %> ><%=resultSet.getString("title") %></a></td>
<td><%=resultSet.getString("author") %></td>
<td><%=resultSet.getString("des") %></td>
<td><%=resultSet.getString("jokeDate") %></td>
<td><%=resultSet.getString("tags") %></td>
<td><a href=<%= "\"review.jsp?Id=" + resultSet.getInt("jokeID") + "\"" %> ><%=resultSet.getString("reviewCount") %></a></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

</body>
</html>