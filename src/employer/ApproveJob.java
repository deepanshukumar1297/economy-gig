package employer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DJobApplied;
import pojo.JobApplied;

@WebServlet("/ApproveJob")
public class ApproveJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ApproveJob() {
        super();}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int number=Integer.parseInt(request.getParameter("number"));
		String[] job_id=new String[number];
		String[] approve= new String[number];
		String[] candidate_id=new String[number];
		
		job_id=request.getParameterValues("job_id");
		approve=request.getParameterValues("approve");
		candidate_id=request.getParameterValues("candidate_id");
		
		ArrayList<String> apparent_job_ids =new ArrayList<String>();
		ArrayList<String> apparent_candidate_ids =new ArrayList<String>();
		
		for(int i=0;i<number;i++)if(approve[i].equals("y")) {
			apparent_job_ids.add(job_id[i]);
			apparent_candidate_ids.add(candidate_id[i]);
		}
		
		int actual_number=apparent_candidate_ids.size();
		int[] actual_job_ids=new int[actual_number];
		int[] actual_candidate_ids=new int[actual_number];
		
		for(int i=0;i<actual_number;i++) {
			actual_candidate_ids[i]=Integer.parseInt(apparent_candidate_ids.get(i));
			actual_job_ids[i]=Integer.parseInt(apparent_job_ids.get(i));
		}
		
		
		JobApplied jobApplied = new JobApplied();
		jobApplied.setCandidate_ids(actual_candidate_ids);
		jobApplied.setJob_id(actual_job_ids);
		jobApplied.setApprove(true);
		
		DJobApplied dJobApplied = new DJobApplied();
		dJobApplied.changeApproveStatus(jobApplied);
		
		if(dJobApplied.exception==false) {
			request.getRequestDispatcher("employerProfile.jsp").forward(request, response);
		}
		else response.sendRedirect("exception.jsp"); 
		
		

	}

}
