package booking;

import java.sql.*;

public class AddBooking {
	public static int addBooking(String[] values, String user, int card, String email) {
		int bookingID = 0;
		try {
			String query = "INSERT INTO booking (flightID, cabinClass, numPassengers, bookerID, creditCard, email) VALUES (?, ?, ?, ?, ?, ?);";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
			PreparedStatement stmt = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1,values[0]);
			stmt.setString(2,values[1]);
			stmt.setString(3,values[2]);
			stmt.setString(4,user);
			stmt.setInt(5,card);
			stmt.setString(6, email);
			int id = stmt.executeUpdate();
			
			
			ResultSet rs = stmt.getGeneratedKeys();
			if (rs.next()) {
				bookingID = rs.getInt(1);
			}
			
			conn.close();
			
			
			
		} catch(Exception e){
			System.out.println("error: "+e);
		}
		return bookingID;
		
	}
	
	public static void addPassengers(int bookingid, String firstname, String lastname) {
		try {
			String query = "INSERT INTO `assignment`.`passengers` (`bookingid`, `name`) VALUES (?, ?);";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setInt(1,bookingid);
			stmt.setString(2,firstname + " " + lastname);
			stmt.executeUpdate();
			conn.close();
		} catch(Exception e){
			System.out.println("error: "+e);
		}
	}
	
	public static void removeSeats(String flightID, String cabinClass, int seats) {
		String query = "";
		if (cabinClass.equals("first")) {
			query = "UPDATE flightschedule SET firsts = firsts - ?, availseats = availseats - ? WHERE flightid = ?;";
		} else if (cabinClass.equals("bus")) {
			query = "UPDATE flightschedule SET busss = busss - ?, availseats = availseats - ? WHERE flightid = ?;";
		} else if (cabinClass.equals("econ")) {
			query = "UPDATE flightschedule SET econs = econs - ?, availseats = availseats - ? WHERE flightid = ?;";
		}
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setInt(1, seats);
			stmt.setInt(2, seats);
			stmt.setString(3, flightID);
			stmt.executeUpdate();
			conn.close();
		} catch(Exception e){
			System.out.println("error: "+e);
		}
	}
}
