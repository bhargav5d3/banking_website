<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upadate Form </title>
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
            margin-top:10px;
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
        <h1 class="form-heading">Update User Password</h1>
        <form method="post" action="passUpdate" id="myForm" class="form" onsubmit="return validateForm()">
            <div class="mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter the email" />
                <p id="emailErrMsg" class="error-message"></p>
            </div>
            <div class="mb-3">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" />
                <p id="passwordErrMsg" class="error-message"></p>
            </div>
            <div class="mb-3">
                <label for="conpassword">Confirm Password</label>
                <input type="password" class="form-control" id="conpassword" placeholder="Confirm password" />
                <p id="conpasswordErrMsg" class="error-message"></p>
            </div>
            <div class="mb-3">
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="login.jsp" class="btn btn-secondary">Go back</a>
            </div>

            <!-- Display server-side message if any -->
            <% String mesg = (String) request.getAttribute("msg");
               if (mesg != null) { %>
                <p style="color: red;"><%= mesg %></p>
            <% } %>
        </form>
    </div>
    <script>
        let passwordEl = document.getElementById("password");
        let passwordErrMsgEl = document.getElementById("passwordErrMsg");

        let emailEl = document.getElementById("email");
        let emailErrMsgEl = document.getElementById("emailErrMsg");

        let conpasswordEl=document.getElementById("conpassword");

        passwordEl.addEventListener("blur", function (event) {

            if (event.target.value === "") {
                passwordErrMsgEl.textContent = "Reqired*";
            }
            else {
                passwordErrMsgEl.textContent = "";
            }
        });
        emailEl.addEventListener("blur", function (event) {
            if (event.target.value === "") {
                emailErrMsgEl.textContent = "Reqired*";
            }
            else {
                emailErrMsgEl.textContent = "";
            }
        });
        conpasswordEl.addEventListener("input",function(event){
            let pass=passwordEl.value;
            if(event.target.value !==pass){
                conpasswordErrMsg.textContent="Not matched";
                conpasswordErrMsg.style.color="red";
            }
            else if(event.target.value===pass){
                conpasswordErrMsg.textContent="matched";
                conpasswordErrMsg.style.color="green";
            }
        });
        conpasswordEl.addEventListener("blur",function(){
            setTimeout(function(){
                conpasswordErrMsg.textContent="";
            },1000);
        });


    </script>
</body>
</html>