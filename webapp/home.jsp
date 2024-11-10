<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto_layer.BankAccount"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<style type="text/css">
    .nav-bg-color {
       background-image: linear-gradient(-225deg, #7DE2FC 0%, #B9B6E5 100%);
    }
    .tablecontainer {
        display: none;
    }
    .form-heading {
        font-family: "Roboto";
        font-size: 36px;
        padding-top: 40px;
        padding-bottom: 20px;
    }
    
    .form {
        border: 1px solid black;
        padding: 20px;
    }
    .dropdown select {
            -moz-appearance: none;
            -webkit-appearance: none;
        }
        .dropdown select::-ms-expand {
            display: none;
        }
         .dropdown:hover .dropdown-menu {
            display: block;
        }
        .dropdown-toggle::after {
            display: none; 
        }
    .design-bg-container {
    background-size: cover;
    height: 100vh;
}
.banner-signup-button {
    background-color: #FFDDA9;
    color: black;
    height: 50px;
    width: 160px;
    border-radius: 30px;
    border-width: 0px;
    padding: 5px;
    margin: 10px;
    font-family: "Roboto";
    font-size: 16px;
    font-weight: bold;
}
    table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid black;
}
#btn1{
float: right;
margin-right: 40px;
margin-top:20px;
margin-bottom: 30px;
}
.btn{
border-radius: 5px;

 
}
.dropdown-toggle{
margin-top: 9px;
}
.banner-description {
    color: black;
    font-family: "Robot";
    font-size: 19px;
    font-weight: bold;
    padding: 15px;
    margin: 20px;
    margin-left: 40px;
    margin-right: 40px;
}
.form-container{
    display: flex;
    height: 100vh;
    justify-content: center;
    align-items: center;
    border:1px solid black;
    background: linear-gradient(#87ceeb,#ffc5c5);
}
.left-container{
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 20px;

}
.left-container h2{
    font-weight: 700px;
    color: #a363aa;
    font-size: 40px;margin-bottom: 5px;

}
body{
background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);


}
.left-container hr{
    border: none;
    width: 120px;
    background-color: #a363aa;
    height: 5px;
    border-radius: 10px;
}
.contact-inputs,textarea{
    width: 400px;
    height: 50px;
    border-radius: 50px;
    border: 0px;
    outline: none;
    padding-left: 25px;
    color: #666;
    font-weight: 600;
}
.left-container textarea{
    height: 140px;
    border-radius: 20px;
    padding: 10px;
}
.left-container button{
    border: 0px;
    outline: none;
    background: linear-gradient(270deg, #ff994f,#fabd86 );
    font-size: 16px;
    padding: 15px 30px;
    cursor: pointer;
    border-radius: 10px;
}
.contact-inputs:focus, textarea:focus{
    border: 2px solid #ff994f;
}
.left-container button:hover{
    filter: brightness(120%);
    font-weight: 800;
}
.image{
display: flex;

}
img{
width: 50px;
margin-right:5px;
padding-right: 5px;
}
.btn-sm{
width: 100px;
}




</style>
<body>

<nav class="navbar navbar-expand-lg navbar-light nav-bg-color ">
    <div class="container">
        <a class="navbar-brand" href="#">
           <div class="image">
        
            <img alt="" src="images/bankpng.png">
            
            <h1> JSP Bank</h1>
            </div>
        </a>
        <button class="navbar-toggler bg-white" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav ml-auto">
                <a class="nav-link active" id="navItem2" href="createAcc.jsp"><button class="btn btn-outline-primary">Create account</button></a>
                <a class="nav-link" id="navItem3" href="tranferAccount.jsp"><button class="btn btn-outline-primary">Payment</button></a>
                <li class="nav-item mx-0 mx-lg-1">
                    <div class="dropdown">
                        <button class="btn btn-outline-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Bank</button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <a class="dropdown-item" href="#"><button type="button" class="btn btn-outline-primary btn-sm" id="balance">Balance</button></a>
                            <form action="transactionDetails" method="post" id="transactionForm">
                                <input type="hidden" name="accountno" value="${account.accountNo}"/>
                                <a class="dropdown-item" ><button type="submit" class="btn btn-outline-primary btn-sm">Transactions</button></a>
                            </form>
                        </div>
                    </div>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
   				 <div class="dropdown">
       			 <button class="btn btn-outline-primary dropdown-toggle" type="button" id="loanDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <a href="showLoans.jsp">Loan</a></button>
			    </div>
				</li>
                <a class="nav-link" id="navItem6" href="#contact"><button class="btn btn-outline-primary">Contact Us</button></a>
                <li class="nav-item mx-0 mx-lg-1">
                    <div class="dropdown">
                        <button class="btn btn-outline-primary dropdown-toggle" type="button" id="profileDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${user.firstName}</button>
                        <div class="dropdown-menu" aria-labelledby="profileDropdown">
                            <a class="dropdown-item btn btn-light" href="userUpdate.jsp"><button type="button" class="btn btn-outline-primary btn-sm">Update</button></a>
                            <a class="dropdown-item btn btn-light" href="userDelete.jsp"><button type="button" class="btn btn-outline-primary btn-sm">Delete</button></a>
                            <a class="dropdown-item" href="#"><button type="button" id="btn2" class="btn btn-outline-primary btn-sm">Account Info</button></a>
                            
                            <a class="dropdown-item btn btn-light" href="login.jsp"><button type="button" class="btn btn-outline-primary btn-sm">Log Out</button></a>
                        </div>
                    </div>
                </li>
            </div>
        </div>
    </div>
</nav>

  
  <div class="container">
<div class="tablecontainer" id="cont">
<button id="btn1" class="btn btn-info">Back</button>
    <h3>Welcome ${user.firstName}</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Mobile</th>
                <th>Email</th>
                <th>Age</th>
                <th>accountNo</th>
                <th>Balance</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.mobile}</td>
                <td>${user.email}</td>
                <td>${user.age}</td>
                <td>${account.accountNo}</td>
                <td>${account.balance}</td>
            </tr>
        </tbody>
    </table>
</div>
</div>

<div class="design-bg-container d-flex flex-column justify-content-center" >
        <div id="banner">
            <div class=" text-center p-2 m-3">
                <h1 class="banner-heading"> The Most Happiness a good bank account.</h1>
                <p class="banner-description">Do not save what is left after spending, but spend what is left after saving.The price of anything is the amount of life you exchange for it. who buys what he does not need, steals from himself Never spend your money before you have it.  </p>
                <a href="createAcc.jsp"><button class="banner-signup-button p-2"> create account</button></a>
            </div>
        </div>
    </div>
    <div class="form-container" id="contact">
    <form action="https://api.web3forms.com/submit" method="POST" class="left-container">
      <input type="hidden" name="access_key" value="229a052a-d407-447a-acde-a3a56b836c85" />
      <div class="left-container-title">
        <h2>Contact Us</h2>
        <hr />
      </div>
      <input class="contact-inputs" type="text" name="name" placeholder="Enter the name" />
      <input class="contact-inputs" type="email" name="email" placeholder="Enter your email" />
      <textarea class="contact-inputs-message" name="message" placeholder="Enter your message" id="">
        </textarea>
      <button type="submit">Submit</button>
    </form>
    <div class="right-container">
      
    </div>
  </div>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@observablehq/inspector@5/dist/inspector.css" />
  <script type="module">
    import {
      Runtime,
      Inspector,
    } from "https://cdn.jsdelivr.net/npm/@observablehq/runtime@5/dist/runtime.js";
    import define from "https://api.observablehq.com/@d3/disjoint-force-directed-graph/2.js?v=4";
    new Runtime().module(define, (name) => {
      if (name === "chart")
        return new Inspector(
          document.querySelector("#observablehq-chart-cda97660")
        );
    });
  </script>

<script type="text/javascript">


const showBtn = document.getElementById("btn2");
const hideBtn = document.getElementById("btn1");
const contEl = document.getElementById("cont");
const bannerEl=document.getElementById("banner");
const balanceEl=document.getElementById("balance");

showBtn.addEventListener("click", function() {
    contEl.style.display = "block";
    bannerEl.style.display="none";
    showBtn.style.display = "none";
    hideBtn.style.display = "inline-block";
});


hideBtn.addEventListener("click", function() {
    contEl.style.display = "none";
    showBtn.style.display = "inline-block";
    bannerEl.style.display="inline-block";
    hideBtn.style.display = "none";
});
balanceEl.addEventListener("click", function() {
    window.alert(`Balance: ${account.balance} Rs`);
});

</script>

</body>
</html>
