package review;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

import booking.FlightSchedule;


public class reviewDB  {
	public static boolean setreview(String name,String revi,String img) {
		String query="INSERT INTO reviews (username, review, date,image) VALUES (?, ?,now(),?);";
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
			PreparedStatement stmt =  conn.prepareStatement(query);
			stmt.setString(1,name);
			stmt.setString(2,revi);
			stmt.setString(3,img);
			stmt.executeUpdate();
			stmt.close();
			conn.close();
			
			
		}catch(Exception e){
			System.out.println("error: "+e);
			return false;
		}
		return true;
		}
	public static ArrayList<review> getreview() {
		 ArrayList<review> reviews = new ArrayList<review>();
		String query="select username , review , date ,image from reviews ;";
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
			PreparedStatement stmt =  conn.prepareStatement(query);
			int i=0;
			ResultSet rs=stmt.executeQuery();
			while (rs.next()) {
				reviews.add(new review(rs.getString("username"),rs.getString("review"),rs.getString("date"),rs.getString("image")));
				System.out.println(rs.getString("username")+rs.getString("review")+rs.getString("date"));
			}
			stmt.close();
			conn.close();
			
			
		}catch(Exception e){
			System.out.println("error:   "+e);
			
		}
		return reviews;
		
		}
		
	}


