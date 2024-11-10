package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao_layer.UserDao;
import dto_layer.User;
@WebServlet("/passUpdate")
public class ForgotpasswordUser extends HttpServlet {
	
	private UserDao userDao=new UserDao();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	   
	    String email = req.getParameter("email");
	    String password = req.getParameter("password");

	    try {
	        User user = userDao.findByEmail(email);

	        if (user != null) {
	            // Attempt to update the password
	            boolean isUpdated = userDao.updatePasswordByEmail(email, password);

	            if (isUpdated) {
	                // If password update is successful
	                req.setAttribute("msg", "Password updated successfully.");
	            } else {
	                req.setAttribute("msg", "Failed to update password.");
	            }
	        } else {
	            // User not found with provided email
	            req.setAttribute("msg", "Email is not registered.");
	        }

	        // Forward to the update page with the message
	        RequestDispatcher dispatcher = req.getRequestDispatcher("forgotPassword.jsp");
	        dispatcher.include(req, res);

	    } catch (Exception e) {

	        e.printStackTrace();
	        req.setAttribute("msg", "An error occurred while updating the password.");
	        RequestDispatcher dispatcher = req.getRequestDispatcher("forgotPassword.jsp");
	        dispatcher.include(req, res);
	    }
	}


}
