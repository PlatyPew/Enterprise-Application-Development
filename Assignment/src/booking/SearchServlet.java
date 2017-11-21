package booking;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String classs="";
		String fid="";
		int FID=0;
		try{
		classs=request.getParameter("class");
		}catch(Exception e){}
		try{
		fid=request.getParameter("flightid");
		FID=Integer.parseInt(fid);
		
		}catch(Exception e){}
		ArrayList<booking> book=null;
		System.out.println(FID+" "+classs);
		if(FID!=0 && !classs.equals("")){
			book=BookingDetailsDB.search("SELECT * FROM booking WHERE cabinClass=? AND flightID=?;",classs,FID);
		}else if(FID!=0){
			book=BookingDetailsDB.search("SELECT * FROM booking WHERE (cabinClass=? AND '1' = '0') OR flightID=?;",classs,FID);
		}else if(!classs.equals("")){
			book=BookingDetailsDB.search("SELECT * FROM booking WHERE cabinClass=? OR (flightID=? AND '1' = '0');",classs,FID);
		}
		request.setAttribute("detail",book);
		RequestDispatcher rd=request.getRequestDispatcher("bookingreport.jsp");  
		rd.forward(request, response);
	}

}
