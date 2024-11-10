package dao_layer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import com.mysql.cj.jdbc.Driver;

import dto_layer.User;


public class UserDao {
	public Connection createConnection() throws SQLException {
        DriverManager.registerDriver(new Driver()); // Load and register MySQL driver
        String url = "jdbc:mysql://localhost:3306/bankdetails?createDatabaseIfNotExist=true";
        String user = "root";
        String pass = "Bhargav@d3";
        return DriverManager.getConnection(url, user, pass);
    }

	 
	 public int saveUser(User user) throws SQLException {
	        String insertSQL = "INSERT INTO user (firstname, lastname, mobilenumber, email, password,age) VALUES (?, ?, ?, ?, ?,?)";
	        
	        try (Connection con = createConnection();
	             PreparedStatement ps = con.prepareStatement(insertSQL)) {
	            ps.setString(1, user.getFirstName());
	            ps.setString(2, user.getLastName());
	            ps.setString(3, user.getMobile());
	            ps.setString(4, user.getEmail());
	            ps.setString(5, user.getPassword());
	            ps.setInt(6, user.getAge());
	            
	            // Execute the insert statement and return the result
	            return ps.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();  // Log any SQL exceptions
	            return 0;
	        }
	    }
	    
	 // Find customer by email
	 public User findByEmail(String email) throws SQLException {
		    String query = "SELECT * FROM user WHERE email = ?";
		    try (Connection con = createConnection(); 
		         PreparedStatement ps = con.prepareStatement(query)) {
		        
		        ps.setString(1, email);  // Set email parameter
		        try (ResultSet rs = ps.executeQuery()) {
		            if (rs.next()) {
		                return new User(
		                        rs.getString("firstname"),
		                        rs.getString("lastname"),
		                        rs.getString("mobilenumber"),
		                        rs.getString("email"),
		                        rs.getString("password"),
		                        rs.getInt("age")
		                );
		            }
		        }
		    }
		    return null;  // Return null if no user is found
		}

	    // Find User by email and password (login)
	    public User findByEmailAndPassword(String email, String password) throws SQLException {
	        Connection con = createConnection();
	        PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE email = ? AND password = ?");
	        ps.setString(1, email);
	        ps.setString(2, password);
	        ResultSet rs = ps.executeQuery();
	        
	        if (rs.next()) {
	        	 return new User(
		                  
		                    rs.getString("firstname"),
		                    rs.getString("lastname"),
		                    rs.getString("mobilenumber"),
		                    rs.getString("email"),
		                    rs.getString("password"),
		                    rs.getInt("age")
		            );
	        }
	        return null; // Return null if login fails
	    }
	    
	    //upadate user password;
	    
	    public boolean updatePasswordByEmail(String email, String newPassword) throws SQLException {
	        Connection con = createConnection();
	        PreparedStatement ps = null;
	        boolean updated = false;

	        try {
	            // Prepare the SQL update statement
	            ps = con.prepareStatement("UPDATE user SET password = ? WHERE email = ?");
	            ps.setString(1, newPassword); // Set the new password
	            ps.setString(2, email); // Set the email
	            
	            // Execute the update
	            int rowsAffected = ps.executeUpdate();
	            
	            // Check if any rows were updated
	            if (rowsAffected > 0) {
	                updated = true;
	            }
	        } finally {
	            // Close the resources
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        }

	        return updated;
	    }
	    //deleting the user
	    public boolean deleteUserByEmail(String email) {
	        String sql = "DELETE FROM user WHERE email = ?";
	        try (Connection con = createConnection();
	             PreparedStatement ps = con.prepareStatement(sql)) {
	            
	            ps.setString(1, email);
	            
	            int rowsDeleted = ps.executeUpdate();
	            return rowsDeleted > 0;  // Returns true if at least one row was deleted
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	    

}
