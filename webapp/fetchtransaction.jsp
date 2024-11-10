<%@ page import="java.util.List"%>
<%@ page import="dto_layer.Transaction"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>Transaction Details</title>
    <link rel="stylesheet" href="path/to/your/bootstrap.css">
    <style>
table {
	width: 100%;
	border-collapse: collapse;
}
body{
background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);

}

th, td {
	padding: 8px;
	text-align: left;
	border: 1px solid black;
}
th{
background-color:powderblue;
}

.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 800px;
	margin-left: 200px;
	float: left;


}
</style>
</head>
<body>
    <div class="container">

         <h2>Transaction Details for Account No: ${sessionScope.accountNo}</h2>

        <%
        List<Transaction> transactions = (List<Transaction>) session.getAttribute("transactions");

        if (transactions != null && !transactions.isEmpty()) {
        %>
            <table>
                <thead>
                    <tr>
                        <th>Account</th>
                        <th>Amount</th>
                        <th>Transaction Date</th>
                        <th>Type</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    for (Transaction transaction : transactions) {
                        String type;
                        long account;

                        if (transaction.getSenderAccoNo() == (Long)session.getAttribute("accountNo")) {
                            type = "DEBIT";
                            account = transaction.getSenderAccoNo();
                        } else {
                            type = "CREDIT";
                            account = transaction.getReceiverAccoNo();
                        }
                    %>
                    <tr>
                        <td><%= account %></td>
                        <td><%= transaction.getAmount() %></td>
                        <td><%= transaction.getTransactionDate() %></td>
                        <td><%= type %></td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        <%
        } else {
        %>
            <h3>No transactions found for the specified account number.</h3>
        <%
        }
        %>
    </div>
</body>
</html>
