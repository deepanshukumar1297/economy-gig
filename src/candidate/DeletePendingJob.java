package candidate;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DJobApplied;
import pojo.JobApplied;

@WebServlet("/DeletePendingJob")
public class DeletePendingJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DeletePendingJob() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int number=Integer.parseInt(request.getParameter("number"));
		int[] all_job= new int[number];
		String[] delete_status = new String[number];
		
		String[] local = new String[number];
		local=request.getParameterValues("job_id");
		for(int i=0;i<number;i++)all_job[i]=Integer.parseInt(local[i]);
		
		delete_status=request.getParameterValues("delete");
		
		ArrayList<Integer> apparent_delete_status =new ArrayList<Integer>();
		for(int i=0;i<number;i++)if(delete_status[i].equals("y"))apparent_delete_status.add(all_job[i]);
		int actual_number=apparent_delete_status.size();
		
		int[] actual_job_id =new int[actual_number];
		for(int i=0; i<actual_number;i++)actual_job_id[i]=apparent_delete_status.get(i);
		
		int candidate_id=(Integer)request.getSession().getAttribute("candidate_id");
		
		DJobApplied dJobApplied = new DJobApplied();
		JobApplied jobApplied = new JobApplied();
		jobApplied.setCandidate_id(candidate_id);
		jobApplied.setJob_id(actual_job_id);
		dJobApplied.delete(jobApplied);
		if(dJobApplied.exception==false) {
			request.getRequestDispatcher("pending.jsp").forward(request, response);
		}
		else response.sendRedirect("exception.jsp");
		
	}

}
