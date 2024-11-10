<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Take Loan</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <div class="container">
        <h2>Take a Loan</h2>
        <form action="submitLoan" method="post">
            <div class="form-group">
                <label for="loanAmount">Loan Amount</label>
                <input type="number" class="form-control" id="loanAmount" name="loanAmount" required>
            </div>
            <div class="form-group">
                <label for="loanPurpose">Purpose of Loan</label>
                <input type="text" class="form-control" id="loanPurpose" name="loanPurpose" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit Loan Request</button>
        </form>
    </div>
</body>
</html>