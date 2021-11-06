package pojo;

public class Address {
	private String email;
	private String state;
	private String city;
	private String village;
	
	@Override
	public String toString() {
		return "Address [email=" + email + ", state=" + state + ", city=" + city + ", village=" + village + "]";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getVillage() {
		return village;
	}

	public void setVillage(String village) {
		this.village = village;
	}
	
}
