<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="fname"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="fname" id="fname" placeholder="First Name" />
							</div>
							<div class="form-group">
								<label for="lname"><i class="zmdi zmdi-account material-icons-name"></i></i></label> <input
									type="text" name="lname" id="lname" placeholder="Last Name" />
							</div>
							
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="pass" placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" />
								
							</div>
							<div><p id="contai"></p> </div>
							
							<div class="form-group">
								<label for="age"><i class="zmdi zmdi-face"></i></label>
								<input type="number" name="age" id="age"
									placeholder="Enter your age" />
								<p id="ageErrMsg" ></p>
							</div>
							
							
							<div class="form-group">
								<label for="mobile"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="mobile" id="mobile"
									placeholder="Contact no" />
							
							</div>
							
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
							<%String mesg=(String)request.getAttribute("mesg");
			                        if(mesg!=null){%>
				                    <%--out.print(mesg); --%>
				                    <p style="color: red;"><%=mesg %></p>	
			                       <% }%>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signupImage.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript">
	let passEl = document.getElementById("pass");
	let re_passEl = document.getElementById("re_pass");
	let contaiEl = document.getElementById("contai");
	
	let ageEl=document.getElementById("age");
	let ageErrMsgEl=document.getElementById("ageErrMsg");
	

	re_passEl.addEventListener("input",function(){}
	    let value = passEl.value;
	    if (value !== re_passEl.value) {
	        contaiEl.textContent = "Not correct";
	        contaiEl.style.color = "red";
	    } else {
	        contaiEl.textContent = "Correct";
	        contaiEl.style.color = "green";
	    }
	});
	re_passEl.addEventListener("blur",function(){
	    setTimeout(function(){
	        contaiEl.textContent="";
	    },2000);
	});
	
	ageEl.addEventListener("blur",function(){
		let agevalue=ageEl.value;
		if(agevalue<17){
			ageErrMsg.textContent="Not Eligibility";
            ageErrMsg.style.color="red";
	
		}
	})

	
	</script>



</body>

</html>