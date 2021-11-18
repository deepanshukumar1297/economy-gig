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

import dao.DJobApplied;
import pojo.JobApplied;

@WebServlet("/ApplyCandidate")
public class ApplyCandidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ApplyCandidate() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int number=Integer.parseInt(request.getParameter("number"));
		int[] all_job= new int[number];
		String[] applied_for_job_status = new String[number];
		
		String[] local = new String[number];
		local=request.getParameterValues("job_id");
		for(int i=0;i<number;i++)all_job[i]=Integer.parseInt(local[i]);
		
		applied_for_job_status=request.getParameterValues("apply");
		
		ArrayList<Integer> apparent_actual_job_status =new ArrayList<Integer>();
		for(int i=0;i<number;i++)if(applied_for_job_status[i].equals("y"))apparent_actual_job_status.add(all_job[i]);
		int actual_number=apparent_actual_job_status.size();
		
		int[] actual_job_id =new int[actual_number];
		for(int i=0; i<actual_number;i++)actual_job_id[i]=apparent_actual_job_status.get(i);
		
		int candidateId=(Integer)request.getSession().getAttribute("candidate_id");
		
		DJobApplied dJobApplied = new DJobApplied();
		JobApplied jobApplied = new JobApplied();
		jobApplied.setCandidate_id(candidateId);
		jobApplied.setApprove(false);
		jobApplied.setJob_id(actual_job_id);
		
		dJobApplied.insert(jobApplied, actual_number);
		if(dJobApplied.exception==false) {
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("pending.jsp"); 
			requestDispatcher.forward(request, response);
		}
		else response.sendRedirect("exception.jsp");
		
	}

}
