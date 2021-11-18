package candidate;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DCandidateSkill;
import pojo.CandidateSkill;

/**
 * Servlet implementation class SetCandidateSkill
 */
@WebServlet("/SetCandidateSkill")
public class SetCandidateSkill extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SetCandidateSkill() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int number=Integer.parseInt(request.getParameter("number"));
		String[] all_skill= new String[number];
		String[] skill_status = new String[number];

		all_skill=request.getParameterValues("skills");
		skill_status=request.getParameterValues("skill_status");
		
		ArrayList<String> apparent_actual_skills =new ArrayList<String>();
		for(int i=0;i<number;i++)if(skill_status[i].equals("y"))apparent_actual_skills.add(all_skill[i]);
		int actual_number=apparent_actual_skills.size();
		String[] actual_skills = new String[actual_number];
		for(int i=0;i<actual_number;i++)actual_skills[i] = apparent_actual_skills.get(i);

		HttpSession session = request.getSession();
		Object candidate_id = session.getAttribute("candidate_id");
		int candidateId=(Integer)candidate_id;
		
		DCandidateSkill dCandidateSkill = new DCandidateSkill();
		CandidateSkill skill = new CandidateSkill();
		skill.setCandidate_id(candidateId);
		skill.setSkills(actual_skills);

		
		
		dCandidateSkill.insert(skill, actual_number);
		if(dCandidateSkill.exception==false) {
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("candidateSkill.jsp"); 
			requestDispatcher.forward(request, response);	
		}
		else response.sendRedirect("exception.jsp");
	}

}
