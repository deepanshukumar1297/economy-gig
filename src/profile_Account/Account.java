package profile_Account;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.DInfo;
import pojo.Info;


@WebServlet("/Account")
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Account() {
        super();
        // TODO Auto-generated constructor stub
    }
    RequestDispatcher requestDispatcher;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name=request.getParameter("name");
		String contact_number=request.getParameter("contact_number");
		String aadhar_card=request.getParameter("aadhar_card");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		Info info = new Info();
		info.setAadhar_card(aadhar_card);
		info.setContact_number(contact_number);
		info.setEmail_id(email);
		info.setName(name);
		
		DInfo dInfo = new DInfo();
		boolean insert = dInfo.insert(info);
		
		if(insert==true) {
			requestDispatcher = request.getRequestDispatcher("profile.jsp");
			requestDispatcher.forward(request, response);
		}
		else response.sendRedirect("exception.html");
	}
	

}
