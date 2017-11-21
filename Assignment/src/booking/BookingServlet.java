package booking;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String OAP = request.getParameter("originAp");
		String DAP = request.getParameter("destAp");
		String FT = request.getParameter("flighttype");
		String DT = request.getParameter("Depart").replace("T"," ");
		String RN = request.getParameter("return").replace("T"," ");
		String TP = request.getParameter("type");
		String Pax = request.getParameter("Pax");
		DT=DT+"%";
		RN=RN+"%";
		int pax=0;
		try {
			pax =Integer.parseInt(Pax);
		} catch(Exception e) {
			
		}
		if (FT.equals("return")) {
			request.setAttribute("return",BookingDetailsDB.getBD(DAP,OAP,RN,pax,TP,pax));
		}
		ArrayList<FlightSchedule> FS = BookingDetailsDB.getBD(OAP,DAP,DT,pax,TP,pax);
		request.setAttribute("detail",FS);
		request.setAttribute("OAP",OAP);
		request.setAttribute("DAP",DAP);
		RequestDispatcher rd=request.getRequestDispatcher("displaydetails.jsp");
		
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
