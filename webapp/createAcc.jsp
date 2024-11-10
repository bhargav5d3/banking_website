<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto_layer.User" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .form-container{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .form{
            border: 2px solid black;
            padding: 50px;
            border-radius: 10px;
        }
    </style>
</head>


<body>
<div class="container mt-5">
        <h2 class="text-center mb-4">Bank Account Form</h2>
        <div class="form-container ">
        <form class="form" method="post" action="account">
        <%User user = (User) session.getAttribute("user");%>
        
        <div class="form-group row">
              <%--   <label for="email" class="col-sm-2 col-form-label">Email</label> --%>
                <div class="col-sm-10">
                    <input type="hidden" name="email" class="form-control" id="email" value="${user.email}" >
                </div>
            </div>
        
        
            <!-- Account Number -->
            <%Random ran=new Random(); %>
            <%long account=ran.nextLong(1000000000000l,9999999999999l); %>
            
            
            <div class="form-group row">
                <label for="accountNo" class="col-sm-2 col-form-label">Account No</label>
                <div class="col-sm-10">
                    <input type="text" name="accountNo" class="form-control" id="accountNo" value="<%=account %>" readonly>
                </div>
            </div>
            <!-- Phone Number -->
            <div class="form-group row">
                <label for="phoneNo" class="col-sm-2 col-form-label">Phone No</label>
                <div class="col-sm-10">
                    <input type="text" name="phoneNo" class="form-control" id="phoneNo" placeholder="Enter Phone No">
                </div>
            </div>
            <!-- Account Type -->
            <div class="form-group row">
                <label for="type" class="col-sm-2 col-form-label">Type</label>
                <div class="col-sm-10">
                    <select class="form-control" name="accountType" id="type">
                        <option value="Savings">Savings</option>
                        <option value="Current">Current</option>
                    </select>
                </div>
            </div>
            <!-- Address -->
            <div class="form-group row">
                <label for="address" class="col-sm-2 col-form-label">Address</label>
                <div class="col-sm-10">
                    <textarea class="form-control" name="address" id="address" rows="2" placeholder="Enter Address"></textarea>
                </div>
            </div>
            <!-- Aadhar Number -->
            <div class="form-group row">
                <label for="adharNo" class="col-sm-2 col-form-label">Aadhar No</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="adharNo" id="adharNo" placeholder="Enter Aadhar No">
                </div>
            </div>
           
            <!-- Balance -->
            <div class="form-group row">
                <label for="balance" class="col-sm-2 col-form-label">Balance</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="balance" id="balance" placeholder="Enter Balance">
                </div>
            </div>
            <!-- Submit Button -->
            <div class="form-group row">
                <div class="col-sm-10 offset-sm-2">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <a href="home.jsp" class="btn btn-secondary"><- Go back</a>
                </div>
            </div>
            <%String mesg=(String)request.getAttribute("mesg");
			     if(mesg!=null){%>
				<%--out.print(mesg); --%>
				<p style="color: red;"><%=mesg %></p>	
			   <% }%>
        </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>