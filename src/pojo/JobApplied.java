package pojo;

public class JobApplied {
	
	private int candidate_id;
	private int[] job_id;
	private int[] candidate_ids;
	private boolean approve;
	
	public boolean isApprove() {
		return approve;
	}
	public void setApprove(boolean approve) {
		this.approve = approve;
	}
	public int getCandidate_id() {
		return candidate_id;
	}
	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}
	public int[] getJob_id() {
		return job_id;
	}
	public void setJob_id(int[] actual_job_id) {
		this.job_id = actual_job_id;
	}
	public int[] getCandidate_ids() {
		return candidate_ids;
	}
	public void setCandidate_ids(int[] candidate_ids) {
		this.candidate_ids = candidate_ids;
	}
	
}
