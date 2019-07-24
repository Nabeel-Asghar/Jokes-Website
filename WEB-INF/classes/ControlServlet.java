import java.io.IOException;

import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.time.LocalDate;

import java.text.DateFormat;  
import java.text.SimpleDateFormat;  
import java.util.Date;
import java.util.ArrayList;
import java.util.Calendar;  
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
/**
 * ControllerServlet.java
 * This servlet acts as a page controller for the application, handling all
 * requests from the user.
 * @author www.codejava.net
 */
public class ControlServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PeopleDAO peopleDAO;
 
    public void init() {
        peopleDAO = new PeopleDAO(); 
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        System.out.println(action);
        try {
            switch (action) {
            case "/new":
            	intializeDatabase(request, response);
                break;
            case "/insert":
            	insertPeople(request, response);
                break;
            case "/delete":
            	deletePeople(request, response);
                break;
            case "/edit":
                showEditForm(request, response);
                break;
            case "/update":
            	updatePeople(request, response);
                break;
            case "/insertJoke":
            	insertJoke(request, response);
            	break;
            case "/searchTag":
            	searchTags(request, response);
            	break;
            	
            case "/favfriendsadd":
            	favfriendsadd(request, response);
            	break;
            	
            case "/insertReview":
            	insertReview(request, response);
            	break;
            	
            default:          	
            	listPeople(request, response);           	
                break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
//Initialize button  
    private void intializeDatabase(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, SQLException, IOException{
    	
    	
    	String driverName = "com.mysql.jdbc.Driver";
    	String connectionUrl = "jdbc:mysql://:3306/?";
    	String dbName = "sampledb";
    	String userId = "john";
    	String password = "pass1234";
    	
    	Connection connection = null;
    	Statement statement = null;
    	ResultSet resultSet = null;
    	PreparedStatement ps = null;
    	
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    	}catch(ClassNotFoundException e) {
    		throw new SQLException(e);
    	}
    	

		connection = (Connection) DriverManager.getConnection("jdbc:mysql://:3306/sampledb?" + "user=root&password=baltej123");
		statement = connection.createStatement();		
		
		
		statement.executeUpdate("DROP TABLE IF EXISTS users");
		String users="CREATE TABLE users("
				+ "userid integer NOT NULL AUTO_INCREMENT,"
				+ "username varchar(50) NOT NULL," 
				+ "password varchar(50) NOT NULL," 
				+ "firstname varchar(50) NOT NULL," 
				+ "lastname varchar(50) NOT NULL,"
				+ "email varchar(50) NOT NULL,"
				+ "gender VARCHAR(10) NOT NULL,"
				+ "age integer NOT NULL,"
				+ "dailyJokeLimit integer default 0,"
				+ "dailyReviewLimit integer default 0,"
				+ "PRIMARY KEY (userid))";
		
		statement.executeUpdate(users);
		
		statement.executeUpdate("DROP TABLE IF EXISTS jokes");
		String jokes= "CREATE table jokes(" + 
				"jokeID integer NOT NULL AUTO_INCREMENT," + 
				"title VARCHAR(250) NOT NULL," +
				"author VARCHAR(50) NOT NULL," +
				"des VARCHAR(500) NOT NULL," + 
				"jokeDate VARCHAR(50) NOT NULL," + 
				"tags VARCHAR(100) NOT NULL," + 
				"reviewCount integer NOT NULL," + 
				"PRIMARY KEY (jokeID))";
		
		statement.executeUpdate(jokes);
		

		statement.executeUpdate("DROP TABLE IF EXISTS reviews");
		String reviews="CREATE table reviews(" + 
				"reviewID integer NOT NULL AUTO_INCREMENT," + 
				"reviewer VARCHAR(50) NOT NULL," +
				"score VARCHAR(25)," + 
				"date VARCHAR(50) NOT NULL," + 
				"remark VARCHAR(250)," +
				"jokeID integer NOT NULL," +
				"PRIMARY KEY(reviewID))"; 
		
		statement.executeUpdate(reviews);
		
		statement.executeUpdate("DROP TABLE IF EXISTS favoritefriends");
		String favoritefriends="CREATE table favoritefriends(" + 
				"userID integer NOT NULL," +
				"friendID integer NOT NULL," +
				"username varchar(50) NOT NULL," +
				"PRIMARY KEY(userID,friendID))"; 
		
		statement.executeUpdate(favoritefriends);
		
		statement.executeUpdate("DROP TABLE IF EXISTS favoriteJokes");
		String favoriteJokes="CREATE table favoriteJokes(" + 
				"userID integer NOT NULL," +
				"jokeID integer NOT NULL," +
				"PRIMARY KEY(userID,jokeID))"; 
		
		statement.executeUpdate(favoriteJokes);
	
		

		ps = connection.prepareStatement("INSERT INTO users(userid, username, password, firstname, lastname, email,gender,age,dailyJokeLimit, dailyReviewLimit) values(?,?,?,?,?,?,?,?,?,?)");  
		ps.setInt(1, 1);
		ps.setString(2, "john");
		ps.setString(3, "pass1234");
		ps.setString(4, "John");
		ps.setString(5, "Doe");
		ps.setString(6, "jdoe@example.com");
		ps.setString(7, "M");
		ps.setString(8, "29");
		ps.setString(9, "2");
		ps.setString(10, "0");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO users(userid, username, password, firstname, lastname, email,gender,age,dailyJokeLimit, dailyReviewLimit) values(?,?,?,?,?,?,?,?,?,?)");  
		ps.setInt(1, 2);
		ps.setString(2, "paul");
		ps.setString(3, "pass1234");
		ps.setString(4, "Paul");
		ps.setString(5, "Bunion");
		ps.setString(6, "nabeel@example.com");
		ps.setString(7, "M");
		ps.setString(8, "48");
		ps.setString(9, "1");
		ps.setString(10, "0");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO users(userid, username, password, firstname, lastname, email,gender,age,dailyJokeLimit, dailyReviewLimit) values(?,?,?,?,?,?,?,?,?,?)");  
		ps.setInt(1, 3);
		ps.setString(2, "lebron");
		ps.setString(3, "pass1234");
		ps.setString(4, "Lebron");
		ps.setString(5, "James");
		ps.setString(6, "lejames@example.com");
		ps.setString(7, "M");
		ps.setString(8, "34");
		ps.setString(9, "0");
		ps.setString(10, "0");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO users(userid, username, password, firstname, lastname, email,gender,age,dailyJokeLimit, dailyReviewLimit) values(?,?,?,?,?,?,?,?,?,?)");  
		ps.setInt(1, 4);
		ps.setString(2, "russ");
		ps.setString(3, "pass1234");
		ps.setString(4, "Russel");
		ps.setString(5, "Westbrook");
		ps.setString(6, "rwest@example.com");
		ps.setString(7, "M");
		ps.setString(8, "30");
		ps.setString(9, "0");
		ps.setString(10, "0");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO users(userid, username, password, firstname, lastname, email,gender,age,dailyJokeLimit, dailyReviewLimit) values(?,?,?,?,?,?,?,?,?,?)");  
		ps.setInt(1, 5);
		ps.setString(2, "skipper");
		ps.setString(3, "pass1234");
		ps.setString(4, "Skipper");
		ps.setString(5, "Penguin");
		ps.setString(6, "penguins@example.com");
		ps.setString(7, "M");
		ps.setString(8, "5");
		ps.setString(9, "2");
		ps.setString(10, "3");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO users(userid, username, password, firstname, lastname, email,gender,age,dailyJokeLimit, dailyReviewLimit) values(?,?,?,?,?,?,?,?,?,?)");  
		ps.setInt(1, 6);
		ps.setString(2, "djbolt");
		ps.setString(3, "pass1234");
		ps.setString(4, "Baltej");
		ps.setString(5, "Athwal");
		ps.setString(6, "djnoshow@example.com");
		ps.setString(7, "M");
		ps.setString(8, "20");
		ps.setString(9, "0");
		ps.setString(10, "0");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO users(userid, username, password, firstname, lastname, email,gender,age,dailyJokeLimit, dailyReviewLimit) values(?,?,?,?,?,?,?,?,?,?)");  
		ps.setInt(1, 7);
		ps.setString(2, "harsh");
		ps.setString(3, "pass1234");
		ps.setString(4, "Harsh");
		ps.setString(5, "Patel");
		ps.setString(6, "hkpatel2@example.com");
		ps.setString(7, "M");
		ps.setString(8, "21");
		ps.setString(9, "4");
		ps.setString(10, "4");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO users(userid, username, password, firstname, lastname, email,gender,age,dailyJokeLimit, dailyReviewLimit) values(?,?,?,?,?,?,?,?,?,?)");  
		ps.setInt(1, 8);
		ps.setString(2, "curry");
		ps.setString(3, "pass1234");
		ps.setString(4, "Steph");
		ps.setString(5, "Curry");
		ps.setString(6, "scurry@example.com");
		ps.setString(7, "M");
		ps.setString(8, "31");
		ps.setString(9, "0");
		ps.setString(10, "0");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO users(userid, username, password, firstname, lastname, email,gender,age,dailyJokeLimit, dailyReviewLimit) values(?,?,?,?,?,?,?,?,?,?)");  
		ps.setInt(1, 9);
		ps.setString(2, "apple");
		ps.setString(3, "pass1234");
		ps.setString(4, "Steve");
		ps.setString(5, "Jobs");
		ps.setString(6, "sjobs@example.com");
		ps.setString(7, "M");
		ps.setString(8, "0");
		ps.setString(9, "0");
		ps.setString(10, "0");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO users(userid, username, password, firstname, lastname, email,gender,age,dailyJokeLimit, dailyReviewLimit) values(?,?,?,?,?,?,?,?,?,?)");  
		ps.setInt(1, 10);
		ps.setString(2, "donald");
		ps.setString(3, "pass1234");
		ps.setString(4, "Donald");
		ps.setString(5, "Trump");
		ps.setString(6, "fakenews@example.com");
		ps.setString(7, "M");
		ps.setString(8, "72");
		ps.setString(9, "0");
		ps.setString(10, "0");
		
		ps.executeUpdate();
				

		
		
		//Jokes
		
		ps = connection.prepareStatement("INSERT INTO jokes(jokeid, title, author, des, jokedate, tags, reviewcount) values(?,?,?,?,?,?,?)");  
		ps.setInt(1, 1);
		ps.setString(2, "What did the penguin say?");
		ps.setString(3, "skipper");
		ps.setString(4, "Kowalski! Analysis!");
		ps.setString(5, "2018-01-5");
		ps.setString(6, "'penguins','madagascar'");
		ps.setString(7, "45");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO jokes(jokeid, title, author, des, jokedate, tags, reviewcount) values(?,?,?,?,?,?,?)");  
		ps.setInt(1, 2);
		ps.setString(2, "Fake news");
		ps.setString(3, "donald");
		ps.setString(4, "CNN?");
		ps.setString(5, "2018-02-02");
		ps.setString(6, "'fake','news'");
		ps.setString(7, "8");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO jokes(jokeid, title, author, des, jokedate, tags, reviewcount) values(?,?,?,?,?,?,?)");  
		ps.setInt(1, 3);
		ps.setString(2, "Lumberjack");
		ps.setString(3, "john");
		ps.setString(4, "Lumberjack nonsense");
		ps.setString(5, "2018-03-28");
		ps.setString(6, "'knock','knock'");
		ps.setString(7, "4");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO jokes(jokeid, title, author, des, jokedate, tags, reviewcount) values(?,?,?,?,?,?,?)");  
		ps.setInt(1, 4);
		ps.setString(2, "Who's curry's dad?");
		ps.setString(3, "john");
		ps.setString(4, "Lebron is");
		ps.setString(5, "2016-06-04");
		ps.setString(6, "'lebron','curry'");
		ps.setString(7, "36");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO jokes(jokeid, title, author, des, jokedate, tags, reviewcount) values(?,?,?,?,?,?,?)");  
		ps.setInt(1, 5);
		ps.setString(2, "Knock Knock");
		ps.setString(3, "john");
		ps.setString(4, "Who's there? You are!");
		ps.setString(5, "2017-12-12");
		ps.setString(6, "'knock','knock'");
		ps.setString(7, "18");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO jokes(jokeid, title, author, des, jokedate, tags, reviewcount) values(?,?,?,?,?,?,?)");  
		ps.setInt(1, 6);
		ps.setString(2, "What do they call someone who doesnt show?");
		ps.setString(3, "baltej");
		ps.setString(4, "DJ noShow");
		ps.setString(5, "2018-03-29");
		ps.setString(6, "'dj','noshow'");
		ps.setString(7, "100");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO jokes(jokeid, title, author, des, jokedate, tags, reviewcount) values(?,?,?,?,?,?,?)");  
		ps.setInt(1, 7);
		ps.setString(2, "Execution");
		ps.setString(3, "russ");
		ps.setString(4, "Barry tramel");
		ps.setString(5, "2018-07-12");
		ps.setString(6, "'russel'");
		ps.setString(7, "29");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO jokes(jokeid, title, author, des, jokedate, tags, reviewcount) values(?,?,?,?,?,?,?)");  
		ps.setInt(1, 8);
		ps.setString(2, "Knock Knock");
		ps.setString(3, "john");
		ps.setString(4, "Who's there? You are!");
		ps.setString(5, "2018-11-20");
		ps.setString(6, "'knock','knock'");
		ps.setString(7, "18");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO jokes(jokeid, title, author, des, jokedate, tags, reviewcount) values(?,?,?,?,?,?,?)");  
		ps.setInt(1, 9);
		ps.setString(2, "Who is the GOAT?");
		ps.setString(3, "lebron");
		ps.setString(4, "Sure aint paul pierce");
		ps.setString(5, "2013-04-12");
		ps.setString(6, "'knock','knock'");
		ps.setString(7, "18");
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO jokes(jokeid, title, author, des, jokedate, tags, reviewcount) values(?,?,?,?,?,?,?)");  
		ps.setInt(1, 10);
		ps.setString(2, "Knock Knock");
		ps.setString(3, "john");
		ps.setString(4, "Who's there? You are!");
		ps.setString(5, "2018-10-12");
		ps.setString(6, "'knock','knock'");
		ps.setString(7, "18");
		
		ps.executeUpdate();
		
		
		
		//Reviews
		ps = connection.prepareStatement("INSERT INTO reviews(reviewID, reviewer, score, date, remark, jokeID) values(?,?,?,?,?,?)");  
		ps.setInt(1, 1);
		ps.setString(2,"harsh");
		ps.setString(3, "Good");
		ps.setString(4, "2018-11-12");
		ps.setString(5, "This joke made me laugh!");
		ps.setInt(6, 1);
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO reviews(reviewID, reviewer, score, date, remark, jokeID) values(?,?,?,?,?,?)");  
		ps.setInt(1, 2);
		ps.setString(2,"curry");
		ps.setString(3, "Horrible");
		ps.setString(4, "2018-11-12");
		ps.setString(5, "This joke made me laugh!");
		ps.setInt(6, 2);
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO reviews(reviewID, reviewer, score, date, remark, jokeID) values(?,?,?,?,?,?)");  
		ps.setInt(1, 3);
		ps.setString(2,"harsh");
		ps.setString(3, "Good");
		ps.setString(4, "2018-11-12");
		ps.setString(5, "This joke made me laugh!");
		ps.setInt(6, 3);
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO reviews(reviewID, reviewer, score, date, remark, jokeID) values(?,?,?,?,?,?)");  
		ps.setInt(1, 4);
		ps.setString(2,"baltej");
		ps.setString(3, "Excellent");
		ps.setString(4, "2018-11-12");
		ps.setString(5, "This joke made me laugh!");
		ps.setInt(6, 1);
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO reviews(reviewID, reviewer, score, date, remark, jokeID) values(?,?,?,?,?,?)");  
		ps.setInt(1, 5);
		ps.setString(2,"lebron");
		ps.setString(3, "Excellent");
		ps.setString(4, "2018-11-12");
		ps.setString(5, "This joke made me laugh!");
		ps.setInt(6, 8);
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO reviews(reviewID, reviewer, score, date, remark, jokeID) values(?,?,?,?,?,?)");  
		ps.setInt(1, 6);
		ps.setString(2,"curry");
		ps.setString(3, "Excellent");
		ps.setString(4, "2018-11-12");
		ps.setString(5, "This joke made me laugh!");
		ps.setInt(6, 9);
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO reviews(reviewID, reviewer, score, date, remark, jokeID) values(?,?,?,?,?,?)");  
		ps.setInt(1, 7);
		ps.setString(2,"harsh");
		ps.setString(3, "Excellent");
		ps.setString(4, "2018-11-12");
		ps.setString(5, "This joke made me laugh!");
		ps.setInt(6, 1);
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO reviews(reviewID, reviewer, score, date, remark, jokeID) values(?,?,?,?,?,?)");  
		ps.setInt(1, 8);
		ps.setString(2,"harsh");
		ps.setString(3, "Excellent");
		ps.setString(4, "2018-11-12");
		ps.setString(5, "This joke made me laugh!");
		ps.setInt(6, 9);
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO reviews(reviewID, reviewer, score, date, remark, jokeID) values(?,?,?,?,?,?)");  
		ps.setInt(1, 9);
		ps.setString(2,"harsh");
		ps.setString(3, "Excellent");
		ps.setString(4, "2018-11-12");
		ps.setString(5, "This joke made me laugh!");
		ps.setInt(6, 9);
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO reviews(reviewID, reviewer, score, date, remark, jokeID) values(?,?,?,?,?,?)");  
		ps.setInt(1, 10);
		ps.setString(2,"curry");
		ps.setString(3, "Excellent");
		ps.setString(4, "2018-11-12");
		ps.setString(5, "This joke made me laugh!");
		ps.setInt(6, 1);
		
		ps.executeUpdate();
		
		
		
		
		//Friends list
		
		ps = connection.prepareStatement("INSERT INTO favoritefriends(userID, friendID, username) values(?,?,?)");  
		ps.setInt(1, 1);
		ps.setInt(2, 2);
		ps.setString(3, "paul");

		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO favoritefriends(userID, friendID, username) values(?,?,?)");  
		ps.setInt(1, 1);
		ps.setInt(2, 4);
		ps.setString(3, "russ");

		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO favoritefriends(userID, friendID, username) values(?,?,?)");  
		ps.setInt(1, 3);
		ps.setInt(2, 2);
		ps.setString(3, "paul");

		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO favoritefriends(userID, friendID, username) values(?,?,?)");  
		ps.setInt(1, 3);
		ps.setInt(2, 4);
		ps.setString(3, "russ");

		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO favoritefriends(userID, friendID, username) values(?,?,?)");  
		ps.setInt(1, 1);
		ps.setInt(2, 7);
		ps.setString(3, "harsh");

		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO favoritefriends(userID, friendID, username) values(?,?,?)");  
		ps.setInt(1, 8);
		ps.setInt(2, 4);
		ps.setString(3, "russ");
		
		ps = connection.prepareStatement("INSERT INTO favoritefriends(userID, friendID, username) values(?,?,?)");  
		ps.setInt(1, 8);
		ps.setInt(2, 10);
		ps.setString(3, "donald");
		
		ps = connection.prepareStatement("INSERT INTO favoritefriends(userID, friendID, username) values(?,?,?)");  
		ps.setInt(1, 8);
		ps.setInt(2, 6);
		ps.setString(3, "djbolt");

		ps.executeUpdate();
		
		
		//Favorite Jokes
		
		ps = connection.prepareStatement("INSERT INTO favoriteJokes(userid, jokeID) values(?,?)");  
		ps.setInt(1, 1);
		ps.setInt(2, 1);
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO favoriteJokes(userid, jokeID) values(?,?)");  
		ps.setInt(1, 1);
		ps.setInt(2, 2);
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO favoriteJokes(userid, jokeID) values(?,?)");  
		ps.setInt(1, 1);
		ps.setInt(2, 8);
		
		ps.executeUpdate();
		
		ps = connection.prepareStatement("INSERT INTO favoriteJokes(userid, jokeID) values(?,?)");  
		ps.setInt(1, 3);
		ps.setInt(2, 9);
		
		ps.executeUpdate();
		
		

		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
    	
	
    	
    	
    }
    
 
//Registration for new users  
    private void listPeople(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<People> listPeople = peopleDAO.listAllPeople();
        request.setAttribute("listPeople", listPeople);       
        RequestDispatcher dispatcher = request.getRequestDispatcher("PeopleList.jsp");       
        dispatcher.forward(request, response);
    }
 
    
    private void searchTags(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
    	
        String tags = request.getParameter("searchtag");
        System.out.println(tags);
    	
    	String driverName = "com.mysql.jdbc.Driver";
    	String connectionUrl = "jdbc:mysql://:3306/?";
    	String dbName = "sampledb";
    	String userId = "john";
    	String password = "pass1234";
    	
    	Connection connection = null;
    	Statement statement = null;
    	ResultSet resultSet = null;
    	PreparedStatement ps = null;
    	
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    	}catch(ClassNotFoundException e) {
    		throw new SQLException(e);
    	}
    	

		connection = (Connection) DriverManager.getConnection("jdbc:mysql://:3306/sampledb?" + "user=root&password=baltej123");
		statement = connection.createStatement();

		String sql = "SELECT * FROM jokes WHERE tags like'%"+tags+"%' ";  
		
		resultSet = statement.executeQuery(sql);
		
		while(resultSet.next()) {
			System.out.println(resultSet.getString("jokeID"));
			System.out.println(resultSet.getString("title"));
			System.out.println(resultSet.getString("des"));
			System.out.println(resultSet.getString("jokeDate"));
			System.out.println(resultSet.getString("tags"));
		}
		
		request.setAttribute("resultSet", resultSet);
		request.getRequestDispatcher("List.jsp").forward(request, response);
		
        statement.close();
        connection.close();
		
        
        
    }
    
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("PeopleForm.jsp");
        dispatcher.forward(request, response);
    }
 
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        People existingPeople = peopleDAO.getPeople(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("PeopleForm.jsp");
        request.setAttribute("people", existingPeople);
        dispatcher.forward(request, response);
 
    }
    
    private void insertReview(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	
    	String jokeID = request.getParameter("jokeID");
        String score = request.getParameter("score");
        String remark = request.getParameter("remarks");
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

        String date = simpleDateFormat.format(new Date());
        System.out.println(date);
        
        Connection connection = null;
    	Statement statement = null;
    	ResultSet resultSet = null;
    	PreparedStatement ps = null;
    	HttpSession session = request.getSession(true);    	
		String reviewer =  (String) session.getAttribute("username");
    	
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    	}catch(ClassNotFoundException e) {
    		throw new SQLException(e);
    	}

		connection = (Connection) DriverManager.getConnection("jdbc:mysql://:3306/sampledb?" + "user=root&password=baltej123");
		statement = connection.createStatement();	
        
		ps = connection.prepareStatement("INSERT INTO reviews(reviewer, score, date, remark, jokeID) values(?,?,?,?,?)");  
		ps.setString(1, reviewer);
		ps.setString(2, score);
		ps.setString(3, date);
		ps.setString(4, remark);
		ps.setString(5, jokeID);
		
		ps.executeUpdate(); 	
		
              
        ps.close();
        connection.close();
        
        String redirectURL = "List.jsp";
     	response.sendRedirect(redirectURL);
    }
 
    private void insertPeople(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String fname = request.getParameter("first");
        String lname = request.getParameter("last");
        String email = request.getParameter("mail");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        //(username, password, fname,lname,email,gender,age);
        
        Connection connection = null;
    	Statement statement = null;
    	ResultSet resultSet = null;
    	PreparedStatement ps = null;
    	
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    	}catch(ClassNotFoundException e) {
    		throw new SQLException(e);
    	}

		connection = (Connection) DriverManager.getConnection("jdbc:mysql://:3306/sampledb?" + "user=root&password=baltej123");
		statement = connection.createStatement();	
		
		String sql ="SELECT * FROM users"; 
	    resultSet = statement.executeQuery(sql);
	    
	    while(resultSet.next()){
	    	
	    	String redirectURL = "register.jsp";
	    	
			if(username.equals(resultSet.getString("username")) ){
				System.out.println("Username already chosen, try another one.");
		        response.sendRedirect(redirectURL);
		        return;
		
			}
			
			else if(email.equals(resultSet.getString("email")) ){
		        System.out.println("That email is already registered, try another one");
		        response.sendRedirect(redirectURL);
		        return;
		       
			}
			
			else
				continue;
	    		
	    }
	    
        
        ps = connection.prepareStatement("INSERT INTO users(username, password, firstname, lastname, email,gender,age) values(?,?,?,?,?,?,?)");  
		
		ps.setString(1, username);
		ps.setString(2, password);
		ps.setString(3, fname);
		ps.setString(4, lname);
		ps.setString(5, email);
		ps.setString(6, gender);
		ps.setString(7, age);
		
		ps.executeUpdate();
        
              
        ps.close();
        connection.close();
        
        String redirectURL = "login.jsp";
     	response.sendRedirect(redirectURL);
    }
    
    private void updatePeople(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        System.out.println(id);
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String status = request.getParameter("status");
        
        System.out.println(name);
        
        People people = new People(id,name, address, status);
        peopleDAO.update(people);
        response.sendRedirect("list");
    }
 
    private void deletePeople(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        //People people = new People(id);
        peopleDAO.delete(id);
        response.sendRedirect("list"); 
    }
    
    //favfriendsadd
    
    private void favfriendsadd(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        
        Connection connection = null;
    	Statement statement = null;
    	ResultSet resultSet = null;
    	PreparedStatement ps = null;
    	
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    	}catch(ClassNotFoundException e) {
    		throw new SQLException(e);
    	}

		connection = (Connection) DriverManager.getConnection("jdbc:mysql://:3306/sampledb?" + "user=root&password=baltej123");
		statement = connection.createStatement();	
        
        ps = connection.prepareStatement("INSERT INTO favfriendslist(firstname, lastname) values(?,?)");  
		
		ps.setString(1, firstname);
		ps.setString(2, lastname);
		
		ps.executeUpdate();
        
              
        ps.close();
        connection.close();
    }

    private void insertJoke(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
    	
        String title = request.getParameter("subject");
        String tags = request.getParameter("tags");
        String description = request.getParameter("description");
        
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

        String date = simpleDateFormat.format(new Date());

        int reviewCount = 0;
        
        Connection connection = null;
    	Statement statement = null;
    	ResultSet resultSet = null;
    	PreparedStatement ps = null;
    	HttpSession session = request.getSession(true);    	
		String author =  (String) session.getAttribute("username");
		
    	
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    	}catch(ClassNotFoundException e) {
    		throw new SQLException(e);
    	}

		connection = (Connection) DriverManager.getConnection("jdbc:mysql://:3306/sampledb?" + "user=root&password=baltej123");
		statement = connection.createStatement();	
        
        ps = connection.prepareStatement("INSERT INTO jokes(title,author,des,jokeDate,tags,reviewCount) values(?,?,?,?,?,?)");  
		
		ps.setString(1, title);
		ps.setString(2, author);
		ps.setString(3, description);
		ps.setString(4, date);
		ps.setString(5, tags);
		ps.setInt(6, reviewCount);
		
		ps.executeUpdate();
        
              
        ps.close();
        connection.close();
        
        String redirectURL = "List.jsp";
     	response.sendRedirect(redirectURL);
        
    }
}

















