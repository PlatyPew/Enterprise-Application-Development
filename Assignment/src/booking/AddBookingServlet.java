package booking;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import passenger.*;
/**
 * Servlet implementation class AddBookingServlet
 */
@WebServlet("/AddBookingServlet")
public class AddBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int count1 = 0;
		int count2 = 0;
		
		int FLIGHTID = Integer.parseInt(request.getParameter("FID"));
		
		HttpSession session = request.getSession();
		String[] type1 = (String[])session.getAttribute("type1");
		String user=(String)session.getAttribute("userid");
		int card = Integer.parseInt((String)session.getAttribute("card"));
		
		String email = (String)session.getAttribute("email");

		int bookingID = AddBooking.addBooking(type1,user,card,email);

		
		String[] first=(String[]) session.getAttribute("firstname");
		String[] firsts=(String[]) session.getAttribute("lastname");
		
		for (int j = 0; j < first.length; j++) {
			AddBooking.addPassengers(bookingID,first[j],firsts[j]);
			count1++;
		}
		AddBooking.removeSeats(type1[0], type1[1], count1);
		BookingFlightSummary v = null;
		try{
		String[] type2 = (String[])session.getAttribute("type2");
		if (type2 != null) {
			int bookingID1 = AddBooking.addBooking(type2,user,card,email);
			System.out.println(bookingID1);
			for (int j = 0; j < first.length; j++) {
				AddBooking.addPassengers(bookingID1,first[j],firsts[j]);
				count2++;
			}
			v = BookingFlightSummaryDB.showDetails(bookingID1);
			AddBooking.removeSeats(type2[0], type2[1], count2);
			System.out.println(type2[1]);
		}
		}catch(Exception e){
			
		}
		session.setAttribute("bookingid",bookingID);
		System.out.println(bookingID);
		session.setAttribute("passenger", passengerDB.getPassenger(bookingID));
		System.out.println(FLIGHTID);
		session.setAttribute("flight", BookingDetailsDB.getFlight(FLIGHTID));
		ArrayList<BookingFlightSummary> summary = new ArrayList<BookingFlightSummary>();
		BookingFlightSummary h = BookingFlightSummaryDB.showDetails(bookingID);
		summary.add(h);
		if (v!=null){
			summary.add(v);
		}
		session.setAttribute("summary", summary);
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("booked.jsp");
        rd.forward(request, response);
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
