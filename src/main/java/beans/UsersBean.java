package beans;

import java.util.Date;

public class UsersBean {
	private String name;
	private String cnic;
	private String email;
	private String password;
	private Date dob;
	private String fName;
	private String contact;
	private String gender;
	
	public UsersBean() {
		// TODO Auto-generated constructor stub
	}
	public UsersBean(String name, String cnic, String email, String password, Date dob, String fName, String contact,
			String gender) {
		super();
		this.name = name;
		this.cnic = cnic;
		this.email = email;
		this.password = password;
		this.dob = dob;
		this.fName = fName;
		this.contact = contact;
		this.gender = gender;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCnic() {
		return cnic;
	}
	public void setCnic(String cnic) {
		this.cnic = cnic;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
