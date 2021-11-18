package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DCandidate;
import dao.DEmployer;
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
				
		DInfo daoInfo = new DInfo();
		
		if(code_entered_by_user.equals(verification_code)) {	
			int verification = daoInfo.getVerification(email);
			if(daoInfo.exception==false) {
				//old user
				if(verification==1) {
					DCandidate dCandidate = new DCandidate();
					DEmployer dEmployer = new DEmployer();
					//if old user is candidate
					if(dCandidate.ping(email)==true && dCandidate.exception==false)request.getRequestDispatcher("candidateProfile.jsp").forward(request, response);
					
					//if old user is employer
					else if(dEmployer.ping(email)==true && dEmployer.exception==false)request.getRequestDispatcher("employerProfile.jsp").forward(request, response);
					
					//if neither employer nor candidate but not completed the new account process and registered in info then delete the info and ask for info again.
					else if(dEmployer.ping(email)==false && dCandidate.ping(email)==false) {
						daoInfo.deleteAccount(email);
						request.getRequestDispatcher("new_account.jsp").forward(request, response);
					}
					
					//exception in database
					else response.sendRedirect("exception.jsp");
				}
				//new user
				else request.getRequestDispatcher("new_account.jsp").forward(request, response);
			}
			//exception occured in database
			else response.sendRedirect("exception.jsp");
		}
		//wrong verification code given by user
		else response.getWriter().write("0");
		
	}

}
