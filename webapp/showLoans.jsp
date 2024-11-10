


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>TrustGuard Bank</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
        }

        .navbar {
            background-color: #333;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
            z-index: 1000;
        }

        .navbar a {
            color: #f2f2f2;
            padding: 14px 16px;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .navbar .logo {
            display: flex;
            align-items: center;
        }

        .navbar .logo img {
            height: 40px;
            margin-right: 10px;
        }

        .navbar .nav-links {
            display: flex;
        }

        .navbar .right {
            display: flex;
            align-items: center;
        }

        .navbar .menu {
            display: none;
            flex-direction: column;
            background-color: #333;
            position: absolute;
            top: 60px;
            right: 0;
            width: 200px;
            z-index: 1;
        }

        .navbar .menu a {
            padding: 10px 16px;
        }

        .navbar .menu-btn {
            background-color: #333;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .main-content {
            text-align: center;
            background: linear-gradient(to right, rgba(144, 238, 144, 0.5), rgba(173, 216, 230, 0.5), rgba(255, 255, 224, 0.5));
            color: darkgreen;
            padding: 100px 20px;
            display: flex;
            height:50vh;
            flex-direction: column;
            align-items: center;
        }

        .main-content h1 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .main-content form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .main-content input {
            padding: 10px;
            margin: 2px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 200px;
        }

        .main-content button {
            padding: 10px 20px;
            background-color: #00bfff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .main-content button:hover {
            background-color: #0086c3;
        }

        .info-section {
            display: flex;
            justify-content: space-around;
            padding: 50px 20px;
            background-color: #f9f9f9;
        }

        .info-box {
            width: 30%;
            padding: 20px;
            color: white;
            text-align: center;
            border-radius: 10px;
            transition: transform 0.3s;
        }

        .info-box:hover {
            transform: scale(1.05);
        }

        .info-box:nth-child(1) {
            background-color: #00c6ff;
        }

        .info-box:nth-child(2) {
            background-color: #00bfff;
        }

       .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 30px 0;
            width: 100%;
            
        }
        .footer p {
            margin: 0;
        }
        /* Responsive Styles */
        @media (max-width: 768px) {
            .navbar .nav-links {
                display: none;
            }

            .navbar .menu {
                display: flex;
            }

            .info-section {
                flex-direction: column;
                align-items: center;
            }

            .info-box {
                width: 80%;
                margin-bottom: 20px;
            }
        }
        #container
        {
        width:400px;
        height:200px;
        }
        span
        {
        float:left;
        }
        input
        {
        float:right;
        
        }
        #acc
        {
        width:100%;
        height:45%;
        }
        #pass
        {
        width:100%;
        height:45%;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <img alt="Bank Logo" src="https://via.placeholder.com/40" />
            <span>TrustGuard Bank</span>
        </div>
        <div class="nav-links">
            <a href="login.jsp">Home</a>
            <a href="DepositSchemeBefore.jsp">Deposit Schemes</a>
            <a href="loanSchemes.jsp">Loan Schemes</a>
            <a href="about.jsp">About</a>
            <a href="mailto:TGB@gmail.com">TGB@gmail.com</a>
        </div>
        <div class="right">
            <button class="menu-btn">
                <i class="fa fa-bars"></i>
            </button>
            <div class="menu">
                <a href="showProfile.jsp">Profile</a>
                <a href="update">Update</a>
                <a href="delete" method="post">Delete</a>
                <a href="showtransactions.jsp">Transactions</a>
            </div>
        </div>
    </div>
    <div class="main-content">
        <h1>Loans Details</h1>
        <hr>
        <form action="loans" method="get">
        <div id="container">
        <div id="acc">
            <label>
                <span>Account Number</span>
                <input required placeholder="Enter account number" type="number" name="accountnumber">
            </label>
            </div>
            <div id="pass">
            <label>
                <span>Password</span>
                <input required placeholder="Enter password" type="password" name="password">
            </label>
            </div>
            </div>
            <button type="submit">Submit</button>
        </form>
    </div>
    <div class="footer">
        <p>&copy; 2023 JSP Bank. All rights reserved.</p>
    </div>
    <script>
        document.querySelector('.menu-btn').addEventListener('click', function() {
            const menu = document.querySelector('.menu');
            menu.style.display = menu.style.display === 'flex' ? 'none' : 'flex';
        });
    </script>
</body>
</html>

