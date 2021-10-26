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

/**
 * Servlet implementation class Verification
 */
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
//		System.out.println(code_entered_by_user+"user");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		String verification_code = (String)session.getAttribute("verification_code");
//		System.out.println(verification_code+"system");
//		System.out.println(email);
		
		RequestDispatcher requestDispatcher;
		DInfo daoInfo = new DInfo();
		
		if(code_entered_by_user.equals(verification_code)) {			
			//old user
			if(daoInfo.getVerification(email)==true) {
				System.out.println("profile");
				requestDispatcher=request.getRequestDispatcher("profile.jsp"); 
				requestDispatcher.forward(request, response);
			}
			//new user
			else {
				System.out.println("new account");
				requestDispatcher=request.getRequestDispatcher("new_account.jsp"); 
				requestDispatcher.forward(request, response);		
			}
		}
		//wrong verification code given by user
		else response.getWriter().write("0");
		
	}

}
