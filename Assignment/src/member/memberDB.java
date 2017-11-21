package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class memberDB {
	public static boolean addmember(String email,String role,String pwd,String user,String pic){
		String query="INSERT INTO member (usr, pwd, role,email,image) VALUES (?, ?,?,?,?);";
		System.out.println("1");
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
			PreparedStatement stmt =  conn.prepareStatement(query);
			stmt.setString(1,user);
			stmt.setString(2,pwd);
			stmt.setString(3,role);
			stmt.setString(4,email);
			stmt.setString(5,pic);
			stmt.executeUpdate();
			stmt.close();
			conn.close();
			
			
		}catch(Exception e){
			System.out.println("error: "+e);
			return false;
		}
		return true;
		}
	public static member getmember(String name){
		member hi=null;
try{
			
			String query="select * from member where usr=?";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
			PreparedStatement stmt =  conn.prepareStatement(query);
			stmt.setString(1,name);
			ResultSet rs = stmt.executeQuery();  
			while (rs.next()) {
				System.out.println("1");
				hi=new member(rs.getString("email"),rs.getString("role"),rs.getString("pwd"),rs.getString("usr"),rs.getString("image"));
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return hi;
	}

	}


