<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*" %> 

<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

</head>

<style>

html{
font-family: 'Roboto', sans-serif;
}

body{
	background-color: #485461;
	background-image: linear-gradient(315deg, #485461 0%, #28313b 74%);
	max-height:100%;
  	margin:0;
}

#hello{
	font-size: 80px;
	color: white;
	margin-top: 40%;
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

<%
Object thisUser = session.getAttribute("username");
Object thisid = session.getAttribute("userid");
Object name = session.getAttribute("firstname");


pageContext.setAttribute("user", name);

%>
<body>	
<div id = "box">
<div id="hello">Welcome, <%out.print(pageContext.findAttribute("user"));%></div>
</div>



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



</body>

</html>






