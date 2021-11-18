package login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.SendEmail;


@WebServlet("/Mails")
public class Mails extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Mails() {super(); }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String email=request.getParameter("email");
				
		if(email.equals("admin@admin.com")) {
			response.sendRedirect("admin.jsp");
		}
		else {
			SendEmail sendEmail = new SendEmail();
			String message = sendEmail.sendEmail(email);
			
			if(sendEmail.exception==false) {
				HttpSession session = request.getSession();
				session.setAttribute("verification_code", message);
				session.setAttribute("email", email);
				
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("verification.jsp");
				requestDispatcher.forward(request, response);
			}
			else response.sendRedirect("exception.jsp");
			
		}
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
