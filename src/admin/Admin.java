package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DSkill;
import pojo.Skill;

@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Admin() {super();}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String skills=request.getParameter("skills");
		
		Skill skill = new Skill();
		skill.setSkills(skills);
		
		
		DSkill dSkill = new DSkill();
		boolean insert = dSkill.insert();
		
		if(insert==true)response.getWriter().write("1");
		else response.getWriter().write("0");
		
	}

}
