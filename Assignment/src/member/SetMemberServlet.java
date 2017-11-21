package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SetMemberServlet
 */
@WebServlet("/SetMemberServlet")
public class SetMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String usr=request.getParameter("usr");
		String pwd=request.getParameter("pwd");
		String pwd1=request.getParameter("pwd1");
		String email=request.getParameter("email");
		String thing1=request.getParameter("thing1");
		String at="mem";
		System.out.println("0");
		try{
		if(request.getParameter("at")==null||request.getParameter("at").equals(""))
			at="mem";
		else
			at=request.getParameter("at");
		}catch(Exception e){
			
		}
		boolean h=false;
		if (pwd.equals(pwd1)){
			h=memberDB.addmember(email,at,pwd,usr,thing1);
			
		}
		response.sendRedirect("signup1.jsp?tru="+h);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
