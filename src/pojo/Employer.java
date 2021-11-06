package pojo;

import java.sql.Date;

public class Employer {
	private String job_title;
	private Date date_from;
	private Date date_to;
	private int wages_daily;
	private int wages_monthly;
	private String payment_method;
	private String job_discription;
	private int job_id;
	private String email;
	
	@Override
	public String toString() {
		return "Employer [ job_title=" + job_title + ", date_from=" + date_from + ", date_to="
				+ date_to + ", wages_daily=" + wages_daily + ", wages_monthly=" + wages_monthly + ", payment_method="
				+ payment_method + ", job_discription=" + job_discription + "]";
	}
	
	
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getJob_id() {
		return job_id;
	}

	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}

	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	public Date getDate_from() {
		return date_from;
	}
	public void setDate_from(Date date_from) {
		this.date_from = date_from;
	}
	public Date getDate_to() {
		return date_to;
	}
	public void setDate_to(Date date_to) {
		this.date_to = date_to;
	}
	public int getWages_daily() {
		return wages_daily;
	}
	public void setWages_daily(int wages_daily) {
		this.wages_daily = wages_daily;
	}
	public int getWages_monthly() {
		return wages_monthly;
	}
	public void setWages_monthly(int wages_monthly) {
		this.wages_monthly = wages_monthly;
	}
	public String getPayment_method() {
		return payment_method;
	}
	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
	public String getJob_discription() {
		return job_discription;
	}
	public void setJob_discription(String job_discription) {
		this.job_discription = job_discription;
	}
	
}
