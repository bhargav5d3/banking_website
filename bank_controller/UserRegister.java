package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao_layer.UserDao;
import dto_layer.User;
@WebServlet("/register")
public class UserRegister extends HttpServlet {
	
	private UserDao userDao=new UserDao();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String firstName=req.getParameter("fname");
		String lastName=req.getParameter("lname");
		String mobile=req.getParameter("mobile");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		String age=req.getParameter("age");
		try {
		    User user = userDao.findByEmailAndPassword(email, password);
		    if (user != null) {
		    	req.setAttribute("mesg"," Email is already registered..");
		        RequestDispatcher dispatcher = req.getRequestDispatcher("registration.jsp");
		        dispatcher.include(req, res);
		    } else {
		    	
		    	User userdata=new User(firstName, lastName, mobile, email, password, Integer.parseInt(age));
		    	userDao.saveUser(userdata);
		    	
		    	req.setAttribute("mesg", " Goto login Sucessfully registered.. ");
		        RequestDispatcher dispatcher = req.getRequestDispatcher("registration.jsp");
		        dispatcher.include(req, res);
		        
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		    req.setAttribute("mesg", "An error occurred. Please try again later.");
		    RequestDispatcher dispatcher = req.getRequestDispatcher("registration.jsp");
		    dispatcher.include(req, res);
		}
	}

}
