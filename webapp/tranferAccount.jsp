<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <style>
        .form-heading {
            font-family: "Roboto";
            font-size: 36px;
            padding-top: 40px;
            padding-bottom: 20px;
        }
        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            width: 500px;
            border: 2px solid black;
            padding: 20px;
            padding-bottom: 50px;
            border-radius: 10px;
        }
        .form {
            border: 1px solid black;
            padding: 20px;
        }
        .error-message {
            color: #dc3545;
            font-family: "Roboto";
            font-size: 14px;
        }
    </style>

</head>
<body>
<div class="container">
        <h1 class="form-heading">Transaction </h1>
        <form id="myForm " class="form" method="post" action="transtion">
            <div class="mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="${account.email}" readonly/>
                <p id="emailErrMsg" class="error-message"></p>
            </div>
            <div class="mb-3">
                <label for="senderAcc">SenderAccNo</label>
                <input type="number" class="form-control" id="senderAcc" name="senderAcc" placeholder="Enter senderAccNo " />
                <p id="passwordErrMsg" class="error-message"></p>
            </div>
            <div class="mb-3">
                <label for="Phone">PhoneNo</label>
                <input type="number" class="form-control" id="Phone" name="phone" placeholder="Enter phoneNo"/>
                <p id="conpasswordErrMsg" ></p>
            </div>
            <div class="mb-3">
                <label for="amount">amount</label>
                <input type="number" class="form-control" id="Phone" name="amount" placeholder="Enter amount"/>
                <p id="conpasswordErrMsg" ></p>
            </div>
            <button class="btn btn-primary">Submit</button>
            <%String mesg=(String)request.getAttribute("mesg");
			         if(mesg!=null){%>
				     <%--out.print(mesg); --%>
				     <p style="color: red;"><%=mesg %></p>	
			       <% }%>
        </form>
    </div>


</body>
</html>