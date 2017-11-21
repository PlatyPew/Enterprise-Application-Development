package booking;

import java.sql.*;
import java.util.ArrayList;

public class BookingFlightSummaryDB {
	public static BookingFlightSummary showDetails(int bookingID) {
		BookingFlightSummary bookingSummary = new BookingFlightSummary();
		try {
			String query = "SELECT booking.bookingid,model, flightnumber, originap, destap, country, DATE_FORMAT(dtDepart,'%d/%m/%Y') AS Depart, DATE_FORMAT(dtArrive,'%d/%m/%Y') AS Arrive, flighttime, cabinClass, numPassengers, `name`, email, creditCard, bookerID, flightschedule.first,flightschedule.buss, flightschedule.econ FROM assignment.booking INNER JOIN flightschedule ON booking.flightID = flightschedule.flightid INNER JOIN airplanes ON flightschedule.flightid = airplanes.id INNER JOIN passengers ON booking.bookingid = passengers.bookingid WHERE booking.bookingid = ?;";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setInt(1,bookingID);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				BookingFlightSummary summary = new BookingFlightSummary();
				summary.setBOOKINGID(bookingID);
				summary.setMODEL(rs.getString("model"));
				summary.setFLIGHTNUMBER(rs.getString("flightnumber"));
				summary.setORIGINAP(rs.getString("originap"));
				summary.setDESTAP(rs.getString("destap"));
				summary.setCOUNTRY(rs.getString("country"));
				summary.setDEPART(rs.getString("Depart"));
				summary.setARRIVE(rs.getString("Arrive"));
				summary.setFLIGHTTIME(rs.getFloat("flighttime"));
				summary.setCABINCLASS(rs.getString("cabinClass"));
				summary.setNUMPASSENGERS(rs.getInt("numPassengers"));
				summary.setNAME(rs.getString("name"));
				summary.setEMAIL(rs.getString("email"));
				summary.setCREDITCARD(rs.getInt("creditCard"));
				summary.setBOOKERID(rs.getString("bookerID"));
				summary.setFIRST(rs.getFloat("first"));
				summary.setBUSS(rs.getFloat("buss"));
				summary.setECON(rs.getFloat("econ"));
				bookingSummary=summary;
			}
			conn.close();
		} catch(Exception e){
			System.out.println("error: "+e);
		}
		return bookingSummary;
	}
	
}
