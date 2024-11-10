package dao_layer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.DriverPropertyInfo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.sql.Timestamp;
import java.util.*;
import java.util.logging.Logger;

import com.mysql.cj.jdbc.Driver;

import dto_layer.Transaction;



public class Transactiondao {
	
	public Connection createConnection() throws SQLException {
	  
		DriverManager.registerDriver(new Driver());
	    String url = "jdbc:mysql://localhost:3306/bankdetails?createDatabaseIfNotExist=true";
	    String user = "root";
	    String pass = "Bhargav@d3";
	    return DriverManager.getConnection(url, user, pass);
	}

	public int saveTransaction(long senderAccountNo, long receiverAccountNo, double amount, 
	                           String senderType, String receiverType, String transactionDate) throws SQLException {
	    String insertSQL = "INSERT INTO transactions (senderaccountno, receiveraccountno, amount, sendertype, receivertype, transactiondate) VALUES (?, ?, ?, ?, ?, ?)";
	    
	    try (Connection con = createConnection();
	         PreparedStatement ps = con.prepareStatement(insertSQL)) {
	        
	        ps.setLong(1, senderAccountNo);
	        ps.setLong(2, receiverAccountNo);
	        ps.setDouble(3, amount);
	        ps.setString(4, senderType);
	        ps.setString(5, receiverType);
	        ps.setTimestamp(6, Timestamp.valueOf(transactionDate));
	        
	        int result = ps.executeUpdate(); // Number of rows affected
	        System.out.println("Transaction save result: " + result);
	        return result;
	    } catch (SQLException e) {
	        System.err.println("Failed to insert transaction. Error: " + e.getMessage());
	        e.printStackTrace();
	        return 0;
	    }
	}

	public List<Transaction> getTransactionsByAccountNo(long accountNo) throws SQLException {
	    List<Transaction> transactionList = new ArrayList<>();
	    String query = "SELECT * FROM transactions WHERE senderaccountno = ? OR receiveraccountno = ? ORDER BY transactiondate";
	    
	    System.out.println("Executing query for account number: " + accountNo);

	    try (Connection con = createConnection();
	         PreparedStatement ps = con.prepareStatement(query)) {
	        
	        ps.setLong(1, accountNo);
	        ps.setLong(2, accountNo);
	        
	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                Transaction transaction = new Transaction();
	                transaction.setSenderAccoNo(rs.getLong("senderaccountno"));
	                transaction.setReceiverAccoNo(rs.getLong("receiveraccountno"));
	                transaction.setAmount(rs.getDouble("amount"));
	                transaction.setSenderType(rs.getString("sendertype"));
	                transaction.setReceverType(rs.getString("receivertype"));
	                transaction.setTransactionDate(rs.getTimestamp("transactiondate").toLocalDateTime());

	                transactionList.add(transaction);
	            }
	        }
	    }
	    
	    System.out.println("Number of transactions retrieved: " + transactionList.size());
	    return transactionList;
	}

	}


	

	
	


