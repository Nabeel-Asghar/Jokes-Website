import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;



public class Jokes {
    protected int jokeid;
    protected String title;
    protected String desc;
    protected String tags;
    protected float jokedate;
    protected String reviewcount;
 
    public Jokes() {
    }
 
    public Jokes(int jokeid) {
        this.jokeid = jokeid;
    }
 
    public Jokes(int jokeid, String title, String desc, String tags) {
        this(title, desc, tags);
        this.jokeid = jokeid;
    }
     
    public Jokes(String title, String desc, String tags) {
        this.title = title;
        this.desc = desc;
        this.tags = tags;
    }
 
    public int getId() {
        return jokeid;
    }
 
    public void setId(int jokeid) {
        this.jokeid = jokeid;
    }
 
    public String getSubject() {
        return title;
    }
 
    public void setSubject(String title) {
        this.title = title;
    }
 
    public String getDescription() {
        return desc;
    }
 
    public void setDescription(String desc) {
        this.desc = desc;
    }
 
    public String getTags() {
        return tags;
    }
 
    public void setTags(String tags) {
        this.tags = tags;
    }
    
    public float getJokeDate() {
        return jokedate;
    }
 
    public void setJokeDate(float jokedate) {
        this.jokedate = jokedate;
    }

}

