package passenger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import member.member;

public class passengerDB {
	public static ArrayList<passenger> getPassenger(int id){
		ArrayList<passenger> hi=new ArrayList<passenger>();
		try{
					
					String query="select * from passengers where bookingid=?";
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
					PreparedStatement stmt =  conn.prepareStatement(query);
					stmt.setInt(1,id);
					ResultSet rs = stmt.executeQuery();  
					while (rs.next()) {
						hi.add(new passenger(rs.getInt("passengerid"),rs.getInt("bookingid"),rs.getString("name")));
					}
				}catch(Exception e){
					System.out.println(e);
				}
				return hi;
	}

}
