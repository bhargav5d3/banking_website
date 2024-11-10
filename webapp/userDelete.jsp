<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
        .deletecontainer {
            display: flex;
            flex-direction: column;
            justify-content: center;
            
            width: 500px;
            margin-left:400px;
            float:left;
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


<body>
<div class="deletecontainer">
        <h1 class="form-heading">Delete User</h1>
        <form id="myForm " class="form" method="post" action="deleteUser">
            <div class="mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" value="${user.email}" readonly />
            </div>
            <div class="mb-3">
                <label for="password">password</label>
                <input type="password" class="form-control" id="password" placeholder="Enter password" />
                <p id="passwordErrMsg" class="error-message"></p>
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