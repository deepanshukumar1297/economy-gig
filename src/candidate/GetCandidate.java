package candidate;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.DCandidate;
import pojo.Address;
import pojo.Candidate;

@WebServlet("/GetCandidate")
@MultipartConfig
public class GetCandidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GetCandidate() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	String path = null;
		String picture=null;		
		
		String city =request.getParameter("city");
		String state = request.getParameter("state");
		String village = request.getParameter("village");
		String self_discription = request.getParameter("self_discription");
		Part image = request.getPart("image");
		if(image!=null) {
			path=image.getSubmittedFileName();
			picture = request.getSession().getServletContext().getRealPath("/")+"images_candidates"+File.separator+path;
		}		
		
		//System.out.println(picture);
		//D:\eclipse projects\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\economy-gig\images_candidates\Screenshot (1).png
		
		HttpSession session = request.getSession();
		String email=(String)session.getAttribute("email");
		
		Candidate candidate = new Candidate();
		Address address = new Address();
		
		address.setCity(city);
		address.setState(state);
		address.setVillage(village);
		candidate.setEmail(email);
		address.setEmail(email);
		if(image!=null)candidate.setPicture(picture);
		candidate.setSelf_discription(self_discription);
		
		DCandidate dCandidate = new DCandidate();
		
		dCandidate.insert(candidate);
		if(dCandidate.exception==false) {
			int candidateId = dCandidate.candidateId(email);
			if(dCandidate.exception==false && candidateId!=0) {
				session.setAttribute("candidate_id", candidateId);
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("candidateSkill.jsp"); 
				requestDispatcher.forward(request, response);	
			}
			else response.sendRedirect("exception.jsp");
		}
		else response.sendRedirect("exception.jsp");

		
		
	}

}
