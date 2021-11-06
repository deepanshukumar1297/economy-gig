package login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DInfo;


@WebServlet("/Verification")
public class Verification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verification() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String code_entered_by_user=request.getParameter("code");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		String verification_code = (String)session.getAttribute("verification_code");
		
		RequestDispatcher requestDispatcher;
		DInfo daoInfo = new DInfo();
		
		if(code_entered_by_user.equals(verification_code)) {	
			int verification = daoInfo.getVerification(email);
			if(daoInfo.exception==false) {
				//old user
				if(verification==1) {
					requestDispatcher=request.getRequestDispatcher("profile.jsp"); 
					requestDispatcher.forward(request, response);
				}
				//new user
				else {
					requestDispatcher=request.getRequestDispatcher("new_account.jsp"); 
					requestDispatcher.forward(request, response);		
				}
			}
			//exception occured in database
			else response.sendRedirect("exception.html");
		}
		//wrong verification code given by user
		else response.getWriter().write("0");
		
	}

}
