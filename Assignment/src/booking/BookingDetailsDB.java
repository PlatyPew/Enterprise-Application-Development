package booking;

import java.sql.*;
import java.util.ArrayList;

public class BookingDetailsDB {
	public static ArrayList<FlightSchedule> getBD(String oap,String dap,String ddt,int availseats,String RT,int unop) {
	String query="";
	ArrayList<FlightSchedule> FS=new ArrayList<FlightSchedule>();

	if (RT.equals("first")){
		query = "SELECT *  FROM flightschedule WHERE originap=? and destap=? and dtdepart like ? and firsts>=?;";
	}if (RT.equals("bus")){
		query = "SELECT *  FROM flightschedule WHERE originap=? and destap=? and dtdepart like ? and buss>=?;";
	}if (RT.equals("econ")){
		query = "SELECT *  FROM flightschedule WHERE originap=? and destap=? and dtdepart like ? and econs>=?;";
		
	}
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
		PreparedStatement stmt =  conn.prepareStatement(query);
		stmt.setString(1,oap);
		stmt.setString(2,dap);
		stmt.setString(3,ddt);
		stmt.setInt(4,availseats);
		ResultSet rs = stmt.executeQuery();  
		while (rs.next()) {
			FlightSchedule F = new FlightSchedule();
			F.setTYPE(RT);
			F.setPID(rs.getInt("planeid"));
			F.setOAP(rs.getString("originap"));
			F.setDAP(rs.getString("destap"));
			F.setCOUNT(rs.getString("country"));
			F.setECON(rs.getFloat("econ"));
			F.setBUS(rs.getFloat("buss"));
			F.setFID(rs.getInt("flightid"));
			F.setFIR(rs.getFloat("first"));
			F.setDOD(rs.getString("dtdepart"));
			F.setDOA(rs.getString("dtarrive"));
			F.setFT(rs.getFloat("flighttime"));
			F.setNOP(rs.getInt("availseats"));
			F.setFNOP(rs.getInt("firsts"));
			F.setBNOP(rs.getInt("busss"));
			F.setENOP(rs.getInt("econs"));
			F.setUNOP(unop);
			F.setNULL(true);
			FS.add(F);
		
		}
		conn.close();
		
		
	}catch(Exception e){
		System.out.println("error: "+e);
	}
	return FS;
	}
	public static FlightSchedule getFlight(int id){
		FlightSchedule i=null;
		try{
			String query="select * from flightschedule where flightid=?";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
			PreparedStatement stmt =  conn.prepareStatement(query);
			stmt.setInt(1,id);
			ResultSet rs = stmt.executeQuery();  
			while (rs.next()) {
				i= new FlightSchedule();
				i.setPID(rs.getInt("planeid"));
				i.setOAP(rs.getString("originap"));
				i.setDAP(rs.getString("destap"));
				i.setCOUNT(rs.getString("country"));
				i.setECON(rs.getFloat("econ"));
				i.setBUS(rs.getFloat("buss"));
				i.setFID(rs.getInt("flightid"));
				i.setFIR(rs.getFloat("first"));
				i.setDOD(rs.getString("dtdepart"));
				i.setDOA(rs.getString("dtarrive"));
				i.setFT(rs.getFloat("flighttime"));
				i.setUNOP(rs.getInt("availseats"));
				i.setFNOP(rs.getInt("firsts"));
				i.setBNOP(rs.getInt("busss"));
				i.setENOP(rs.getInt("econs"));
				}
			System.out.println("BookingDetailDB");
		}catch(Exception e){
			System.out.println(e);
		}
		return i;
		
	}
	public static ArrayList<booking> getBooking(){
		ArrayList<booking> reviews = new ArrayList<booking>();

		try{
			String query="select * from booking";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
			PreparedStatement stmt =  conn.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();  
			while (rs.next()) {
				reviews.add(new booking(rs.getString("cabinClass"),rs.getInt("bookingID"),rs.getInt("flightID"),rs.getInt("numPassengers"),rs.getString("bookerID"),rs.getInt("creditCard"),rs.getString("email")));
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return reviews;
	}
	public static ArrayList<booking> search(String query,String i,int o){
		ArrayList<booking> reviews = new ArrayList<booking>();

		
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
			PreparedStatement stmt =  conn.prepareStatement(query);
			stmt.setString(1,i);
			stmt.setInt(2,o);
			
			ResultSet rs = stmt.executeQuery();  
			while (rs.next()) {
				reviews.add(new booking(rs.getString("cabinClass"),rs.getInt("bookingID"),rs.getInt("flightID"),rs.getInt("numPassengers"),rs.getString("bookerID"),rs.getInt("creditCard"),rs.getString("email")));
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return reviews;
	}
	
}
