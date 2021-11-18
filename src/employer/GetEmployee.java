package employer;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DEmployer;
import dao.DJobSkill;
import pojo.Employer;
import pojo.JobSkill;

/**
 * Servlet implementation class GetEmployee
 */
@WebServlet("/GetEmployee")
public class GetEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GetEmployee() { super();}
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String email=(String)session.getAttribute("email");
		
		String job_title =request.getParameter("job_title");
		String job_discription= request.getParameter("job_discription");
		String payment_method=request.getParameter("payment_method");
		
		int wages_daily=Integer.parseInt(request.getParameter("wages_daily"));
		int wages_monthly=Integer.parseInt(request.getParameter("wages_monthly"));

		Date date_from = Date.valueOf(request.getParameter("date_from"));
		Date date_to = Date.valueOf(request.getParameter("date_to"));
		
		Employer employer = new Employer();
		
		employer.setDate_from(date_from);
		employer.setDate_to(date_to);
		employer.setJob_discription(job_discription);
		employer.setJob_title(job_title);
		employer.setPayment_method(payment_method);
		employer.setWages_daily(wages_daily);
		employer.setWages_monthly(wages_monthly);
		employer.setEmail(email);
				
		//--------------------------------------------------
		System.out.println(request.getParameter("number")+" get employee");
		int number=Integer.parseInt(request.getParameter("number"));
		
		String[] all_skill= new String[number];
		String[] skill_status = new String[number];

		all_skill=request.getParameterValues("skills");
		skill_status=request.getParameterValues("skill_status");
		
		ArrayList<String> apparent_actual_skills =new ArrayList<String>();
		for(int i=0;i<number;i++)if(skill_status[i].equals("y"))apparent_actual_skills.add(all_skill[i]);
		int actual_number=apparent_actual_skills.size();
		
		String[] actual_skills= new String[actual_number];
		for(int i=0;i<actual_number;i++)actual_skills[i] = apparent_actual_skills.get(i);
						
		JobSkill skill = new JobSkill();
		skill.setSkills(actual_skills);
				
		DEmployer dEmployer = new DEmployer();
		DJobSkill djobSkill = new DJobSkill();


		int jobId = dEmployer.insert(employer);
		if(dEmployer.exception==false) {
			if(dEmployer.exception==false && jobId!=0) {
				djobSkill.insert(skill, actual_number, jobId);
				if(djobSkill.exception==false) {
					RequestDispatcher requestDispatcher=request.getRequestDispatcher("employerProfile.jsp"); 
					requestDispatcher.forward(request, response);
				}
				else response.sendRedirect("exception.jsp");
			}
			else response.sendRedirect("exception.jsp");
		}
		else response.sendRedirect("exception.jsp");	
	}

}
