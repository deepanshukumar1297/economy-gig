package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DInfo;
import pojo.Info;
@WebServlet("/Accounts")
public class Accounts extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Accounts() { super();}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String contact_number=request.getParameter("contact_number");
		String aadhar_card=request.getParameter("aadhar_card");
		String choose=request.getParameter("choose");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		
		Info info = new Info();
		info.setAadhar_card(aadhar_card);
		info.setContact_number(contact_number);
		info.setEmail_id(email);
		info.setName(name);
		//System.out.println(info);
		
		DInfo dInfo = new DInfo();
		dInfo.insert(info);
		
		if(dInfo.exception==false) {
			if(choose.equals("employer"))request.getRequestDispatcher("employer.jsp").forward(request, response);
			if(choose.equals("candidate")) request.getRequestDispatcher("candidate.jsp").forward(request, response);
		}
		else response.sendRedirect("exception.jsp");
	}

}
