package controller;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.Driver;
@WebServlet("/loan")
public class Loan  extends HttpServlet{
	
	public Connection createConnection() throws SQLException 
	{
		DriverManager.registerDriver(new Driver());
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankdetails","root","Bhargav@d3");
		PreparedStatement preparedStatement=con.prepareStatement("CREATE TABLE IF NOT EXISTS loan (accountnumber BIGINT  PRIMARY KEY,loanamount BIGINT,tenure INT, type VARCHAR(45),interest DOUBLE,password VARCHAR(45))");
		preparedStatement.execute();
		 return con;
	}
	
	
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	HttpSession session=req.getSession();
	Object email =  session.getAttribute("email");
	String accountNumber=req.getParameter("accountnumber");
	
	String loanamount=req.getParameter("amount");
	int Sloanamount=Integer.parseInt(loanamount);
	String typeOfLoan=req.getParameter("loan");
	
	String loanLenure=req.getParameter("tenure");
	int SloanLenure=Integer.parseInt(loanLenure);
	
	String intrest="0.8%";
	String password=req.getParameter("password");
	
	try {
		
		Connection con=createConnection();
		PreparedStatement preparedStatement=con.prepareStatement("INSERT INTO loan VALUES(?,?,?,?,?,?)");
		preparedStatement.setString(1, accountNumber);
		preparedStatement.setInt(2,Sloanamount);
		preparedStatement.setString(4,typeOfLoan);
		preparedStatement.setInt(3,SloanLenure );
		preparedStatement.setString(5, intrest);
		preparedStatement.setString(6, password);
		
		preparedStatement.execute();

RequestDispatcher dispatcher=req.getRequestDispatcher("loanSuccess.jsp");
dispatcher.forward(req, resp);
		con.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		RequestDispatcher dispatcher=req.getRequestDispatcher("login .jsp");
		dispatcher.include(req, resp);
	}
}
}
