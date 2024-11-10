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
import dao_layer.UserDao;
import dto_layer.BankAccount;
import dto_layer.User;


@WebServlet("/login")
public class UserController extends HttpServlet {
	private UserDao userDao=new UserDao();
	
	private BankAccountDao accountDao=new BankAccountDao();
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		try {
		    User user = userDao.findByEmail(email);
		    BankAccount account=accountDao.findbyEmail(email);
		    if (user != null) {
		        String storedPswd = user.getPassword();
		        if (storedPswd.equals(password)) {
		        	
		        	req.getSession().setAttribute("user", user);
		        	req.getSession().setAttribute("account", account);
		        	
		        	req.setAttribute("user", user);
		            RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
		            dispatcher.forward(req, res);
		            
		            
		        } else {
		            req.setAttribute("mesg", "Wrong password...");
		            RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
		            dispatcher.include(req, res);
		        }
		    } else {
		        req.setAttribute("mesg", "Email is not registered..");
		        RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
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

