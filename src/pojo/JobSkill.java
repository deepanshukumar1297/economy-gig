package pojo;

public class JobSkill {
	private String[] job_id;
	private String[] skills;
	@Override
	public String toString() {
		return "JobSkill [job_id=" + job_id + ", skills=" + skills + "]";
	}
	public String[] getJob_id() {
		return job_id;
	}
	public void setJob_id(String[] job_id) {
		this.job_id = job_id;
	}
	public String[] getSkills() {
		return skills;
	}
	public void setSkills(String[] skills) {
		this.skills = skills;
	}
	
}
