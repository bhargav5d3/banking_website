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

@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {
    
    private UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
        	
            User user = userDao.findByEmail(email);
            
            if (user != null) {
             
                if (user.getPassword().equals(password)) {
                   
                    boolean deleteUser = userDao.deleteUserByEmail(email);
                    if (deleteUser) {
                   
                        RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
                        dispatcher.forward(req, res);
                    } else {
                        // Set an error message if deletion failed and redirect to userDelete.jsp
                        req.setAttribute("mesg", "Failed to delete user.");
                        RequestDispatcher dispatcher = req.getRequestDispatcher("userDelete.jsp");
                        dispatcher.forward(req, res);
                    }
                } else {
                    // Set an error message for incorrect password and redirect to userDelete.jsp
                    req.setAttribute("mesg", "Password incorrect.");
                    RequestDispatcher dispatcher = req.getRequestDispatcher("userDelete.jsp");
                    dispatcher.forward(req, res);
                }
            } else {
                // Set an error message if user not found and redirect to userDelete.jsp
            	
            	System.out.println(user);
                req.setAttribute("mesg", "User not found.");
                RequestDispatcher dispatcher = req.getRequestDispatcher("userDelete.jsp");
                dispatcher.forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("mesg", "An error occurred during the deletion process.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("userDelete.jsp");
            dispatcher.forward(req, res);
        }
    }
}
