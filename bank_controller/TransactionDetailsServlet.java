package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao_layer.Transactiondao;
import dto_layer.Transaction;

@WebServlet("/transactionDetails")
public class TransactionDetailsServlet extends HttpServlet {
    
    private Transactiondao transactiondao = new Transactiondao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long accountNo = Long.parseLong(request.getParameter("accountno"));
        
        // Set accountNo in session
        request.getSession().setAttribute("accountNo", accountNo);
        System.out.println(accountNo);
        
        try {
            List<Transaction> transactions = transactiondao.getTransactionsByAccountNo(accountNo);
            request.getSession().setAttribute("transactions", transactions);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("fetchtransaction.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }


}

