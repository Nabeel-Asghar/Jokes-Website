<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Review</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>


<%//have to insert the joke with the input values that were inputed into the joke id that is equal to int id 
String ss = request.getParameter("Id");
int jokeID = Integer.parseInt(ss); 



%>

<h1>Review Page</h1>

<form action="insertReview" method="POST">
<h3>Score: </h3>

<select name="score" id="score">
  <option value="excellent">Excellent</option>
  <option value="good">Good</option>
  <option value="bad">Bad</option>
  <option value="horrible">Horrible</option>
</select>

<input type="hidden" name="jokeID" value="<%=jokeID%>" />

<h3>Remarks</h3>
<input type="text" name="remarks" style = "width:465px; height:50px">
<br><br>
<input type="submit" value="Submit" />
</form>



</body>
</html>


