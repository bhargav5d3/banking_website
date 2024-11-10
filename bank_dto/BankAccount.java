package dto_layer;

public class BankAccount {
	
	private long accountNo;
	private String email,phoneNo,type,address,adharNo;
	private double balance;
	
	//ArgsConstructer;
	public BankAccount(String email,long accountNo, String phoneNo, String type, String address, String adharNo, double balance) {
		super();
		this.email=email;
		this.accountNo = accountNo;
		this.phoneNo = phoneNo;
		this.type = type;
		this.address = address;
		this.adharNo = adharNo;
		this.balance = balance;
	}
	
	//NoArgsConstructer
	public BankAccount() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//Setters and getters ;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public long getAccountNo() {
		return accountNo;
	}
	
	public void setAccountNo(long accountNo) {
		this.accountNo = accountNo;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAdharNo() {
		return adharNo;
	}
	public void setAdharNo(String adharNo) {
		this.adharNo = adharNo;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "BankAccount [accountNo=" + accountNo + ", email=" + email + ", phoneNo=" + phoneNo
				+ ", type=" + type + ", address=" + address + ", adharNo=" + adharNo + ", balance=" + balance + "]";
	}
	
	

	
	
	
	
	

}
