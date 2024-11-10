 package dao_layer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.jdbc.Driver;

import dto_layer.BankAccount;
import dto_layer.User;




public class BankAccountDao {
	
	public Connection createConnection() throws SQLException {
        DriverManager.registerDriver(new Driver()); // Load and register MySQL driver
        String url = "jdbc:mysql://localhost:3306/bankdetails?createDatabaseIfNotExist=true";
        String user = "root";
        String pass = "Bhargav@d3";
        return DriverManager.getConnection(url, user, pass);
    }
	
	//save the account;
	public int saveBank(BankAccount bank) throws SQLException {
        String insertSQL = "INSERT INTO bankaccount (email,accountno,phoneno,type,address,adharnumber,balance) VALUES (?,?, ?, ?, ?, ?,?)";
        
        try (Connection con = createConnection();
             PreparedStatement ps = con.prepareStatement(insertSQL)) {
            ps.setString(1, bank.getEmail());
            ps.setLong(2, bank.getAccountNo());
            ps.setString(3, bank.getPhoneNo());
            ps.setString(4, bank.getType());
            ps.setString(5, bank.getAddress());
            ps.setString(6, bank.getAdharNo());
            ps.setDouble(7, bank.getBalance());
            
            // Execute the insert statement and return the result
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();  // Log any SQL exceptions
            return 0;
        }
    }
	
	 // Find customer by email
	// Check if an account number exists
	public boolean findByAccountNo(String accountNo) throws SQLException {
	    String query = "SELECT * FROM bankaccount WHERE accountno = ?";
	    try (Connection con = createConnection(); 
	         PreparedStatement ps = con.prepareStatement(query)) {
	        
	        ps.setString(1, accountNo);  // Set account number parameter
	        try (ResultSet rs = ps.executeQuery()) {
	            // If a result is returned, the account exists
	            return rs.next();
	        }
	    }
	}
	
	public BankAccount findbyaccountNo(String accountNo) throws SQLException {
		String query = "SELECT * FROM bankaccount WHERE accountno = ?";
		try (Connection con = createConnection();
			PreparedStatement ps = con.prepareStatement(query)) {

			ps.setString(1, accountNo); // Set account number parameter
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				return new BankAccount(
						
						
						rs.getString("email"),
						rs.getLong("accountNo"),
						rs.getString("phoneno"),
						rs.getString("type"),
						rs.getString("address"),
						rs.getString("adharnumber"),
						rs.getDouble("balance")
						
						);
			}
			return null;

		}
	}
		
		//find user by email
		public BankAccount findbyEmail(String email) throws SQLException {
			String query = "SELECT * FROM bankaccount WHERE email = ?";
			try (Connection con = createConnection();
				PreparedStatement ps = con.prepareStatement(query)) {

				ps.setString(1, email); // Set account number parameter
				ResultSet rs = ps.executeQuery();
				
				if(rs.next()) {
					return new BankAccount(
							
							
							rs.getString("email"),
							rs.getLong("accountNo"),
							rs.getString("phoneno"),
							rs.getString("type"),
							rs.getString("address"),
							rs.getString("adharnumber"),
							rs.getDouble("balance")
							
							);
				}
				return null;

			}
		}
		public int updateAccount(BankAccount bank) throws SQLException {
		    String updateSQL = "UPDATE bankaccount SET balance = ? WHERE accountno = ?";
		    try (Connection con = createConnection();
		         PreparedStatement ps = con.prepareStatement(updateSQL)) {
		        ps.setDouble(1, bank.getBalance());
		        ps.setLong(2, bank.getAccountNo());
		        return ps.executeUpdate();
		    }
		}

		
			

}
