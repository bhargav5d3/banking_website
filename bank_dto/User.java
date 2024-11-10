package dto_layer;

public class User {
	
	private String firstName,lastName,mobile,email,password;
	private int age;
	
	
	public User(String firstName, String lastName,String mobile, String email, String password, int age) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.age = age;
		this.mobile=mobile;
	}

	public User() {
		super();
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}


	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", lastName=" + lastName +  ", mobile=" + mobile +", email=" + email + ", password=" + password
				+ ", age=" + age + "]";
	}
	
	
	
	

}
