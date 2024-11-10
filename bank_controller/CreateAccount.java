package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao_layer.BankAccountDao;
import dto_layer.BankAccount;
import dto_layer.User;


@WebServlet("/account")
public class CreateAccount extends HttpServlet {
	
	private BankAccountDao accountDao=new BankAccountDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email=req.getParameter("email");
		String accountNo=req.getParameter("accountNo");
		String phoneNo=req.getParameter("phoneNo");
		String accType=req.getParameter("accountType");
		String address=req.getParameter("address");
		String adharNo=req.getParameter("adharNo");
		String balance=req.getParameter("balance");
		
		try {
		    boolean bankAcc=accountDao.findByAccountNo(accountNo);
		    if (bankAcc) {
		    	req.setAttribute("mesg", "Account number already Exist...");
	            RequestDispatcher dispatcher = req.getRequestDispatcher("createAcc.jsp");
	            dispatcher.include(req, res);
		       
		    } else {
		    	BankAccount bank=new BankAccount(email, Long.parseLong(accountNo), phoneNo, accType, address, adharNo, Double.parseDouble(balance));
		    	accountDao.saveBank(bank);
		    	
		        req.setAttribute("mesg","Succesfully Account registered..");
		        RequestDispatcher dispatcher = req.getRequestDispatcher("createAcc.jsp");
		        dispatcher.include(req, res);
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		    req.setAttribute("mesg", "An error occurred. Please try again later.");
		    RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
		    dispatcher.include(req, res);
		}
		
		
		
		
	}

}
