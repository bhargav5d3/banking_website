package dao_layer;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.jdbc.Driver;
@WebServlet("/loans")
public class ShowLoans extends HttpServlet{
	
	
	public Connection createConnection() throws SQLException 
	{
		DriverManager.registerDriver(new Driver());
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankdetails", "root", "Bhargav@d3");
	
		return con;
	}
         @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        	String accountNumber=req.getParameter("accountnumber");
        	long SaccountNumber=Long.parseLong(accountNumber);
        	String password=req.getParameter("password");
        	
        	try {
				Connection con=createConnection();
				PreparedStatement preparedStatement=con.prepareStatement("SELECT * FROM loan WHERE accountnumber=? AND password=?");
				preparedStatement.setLong(1, SaccountNumber);
				preparedStatement.setString(2, password);
				System.out.println("connected");
				
				ResultSet set=preparedStatement.executeQuery();
				if(set.next())
				{
					req.setAttribute("accountnumber", set.getLong("accountnumber"));
					req.setAttribute("password", set.getString("password"));
					req.setAttribute("amount", set.getDouble("loanamount"));
					req.setAttribute("tenure", set.getLong("tenure"));
					req.setAttribute("type", set.getString("type"));
					req.setAttribute("intrest", set.getString("intrest"));
					System.out.println("matched");
					
					RequestDispatcher dispatcher=req.getRequestDispatcher("showLoansHistory.jsp");
					dispatcher.forward(req, resp);
					
				}
				else
				{
					System.out.println("not found");
					RequestDispatcher dispatcher=req.getRequestDispatcher("noLoans.jsp");
					dispatcher.include(req, resp);
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
}
