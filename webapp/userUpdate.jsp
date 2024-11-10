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
            border: 0.5px solid black;
            padding: 20px;
            padding-bottom: 50px;
            border-radius: 10px;
            background-image: linear-gradient(-225deg, #E3FDF5 0%, #FFE6FA 100%);
           
        }
        .form {
            border: 1px solid black;
            padding: 20px;
            border-radius:10px;
            background-image: linear-gradient(-225deg, #FFFEFF 0%, #D7FFFE 100%);
           
            
        }
        .error-message {
            color: #dc3545;
            font-family: "Roboto";
            font-size: 14px;
        }
        
        body{
        background-color: #E4E4E1;
        background-image: radial-gradient(at top center, rgba(255,255,255,0.03) 0%, rgba(0,0,0,0.03) 100%), linear-gradient(to top, rgba(255,255,255,0.1) 0%, rgba(143,152,157,0.60) 100%);
 	    background-blend-mode: normal, multiply;
        
        }
    </style>
</head>
<body>
<div class="container">
        <h1 class="form-heading">Update User</h1>
        <form id="myForm " class="form">
			<div class="row g-3">
				<div class="col">
				    <label for="fname">FirstName</label>
					<input type="text" class="form-control" name="fname" value="${user.firstName}" placeholder="First name" aria-label="First name">
				</div>
				<div class="col">
				    <label for="lname">LastName</label>
					<input type="text" class="form-control" value="${user.lastName }" name="lname" placeholder="Last name"
						aria-label="Last name">
				</div>
			</div>
			<div class="mb-3">
                <label for="mobile">Mobile</label>
                <input type="number" class="form-control" id="mobile" value="${user.mobile }" name="mobile" placeholder="Enter the mobile" />
                <p id="emailErrMsg" class="error-message"></p>
            </div>
			<div class="mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" value="${user.email}" placeholder="Enter the email" />
                <p id="emailErrMsg" class="error-message"></p>
            </div>
            <div class="mb-3">
                <label for="password">password</label>
                <input type="password" class="form-control" id="password" value="${user.password}" placeholder="Enter password" />
                <p id="passwordErrMsg" class="error-message"></p>
            </div>
            <div class="mb-3">
                <label for="pass">conform password</label>
                <input type="password" class="form-control" id="conpassword" placeholder="conform password"/>
                <p id="conpasswordErrMsg" ></p>
            </div>
            <div class="mb-3">
                <label for="age">Age</label>
                <input type="number" class="form-control" id="age" name="age" value="${user.age}" placeholder="Enter age"/>
                <p id="ageErrMsg" ></p>
            </div>

            <button class="btn btn-primary">Submit</button>
            
            <%String mesg=(String)request.getAttribute("mesg");
			        if(mesg!=null){%>
				    <%--out.print(mesg); --%>
				   <p style="color: red;"><%=mesg %></p>	
			        <% }%>
        </form>
    </div>
    <script>
        let passwordEl = document.getElementById("password");
        let passwordErrMsgEl = document.getElementById("passwordErrMsg");

        let emailEl = document.getElementById("email");
        let emailErrMsgEl = document.getElementById("emailErrMsg");

        let conpasswordEl=document.getElementById("conpassword");
        
        let ageEl=document.getElementById("age");
        let ageErrMsgEl=document.getElementById("ageErrMsg");

        passwordEl.addEventListener("blur", function (event) {

            if (event.target.value === "") {
                passwordErrMsgEl.textContent = "Required*";
            }
            else {
                passwordErrMsgEl.textContent = "";
            }
        });
        emailEl.addEventListener("blur", function (event) {
            if (event.target.value === "") {
                emailErrMsgEl.textContent = "Required*";
            }
            else {
                emailErrMsgEl.textContent = "";
            }
        });
        conpasswordEl.addEventListener("input",function(event){
            let pass=passwordEl.value;
            if(event.target.value !==pass){
                conpasswordErrMsg.textContent="Not correct";
                conpasswordErrMsg.style.color="red";
            }
            else if(event.target.value===pass){
                conpasswordErrMsg.textContent="Correct";
                conpasswordErrMsg.style.color="green";
            }
        });
        conpasswordEl.addEventListener("blur",function(){
            setTimeout(function(){
                conpasswordErrMsg.textContent="";
            },1000);
        });
        
        ageEl.addEventListener("input",function(){
        	let age=ageEl.value;
        	if(age<18){
        		ageErrMsg.textContent="Not Eligibility";
                ageErrMsg.style.color="red";
        		
        	}
        	else{
        		ageErrMsg.textContent="";
        		
        	}
        })


    </script>

</body>
</html>