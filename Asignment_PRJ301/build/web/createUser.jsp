<%-- 
    Document   : createuser
    Created on : Feb 23, 2024, 11:33:39 AM
    Author     : ADMIN
--%>

<%@page import="sample.sp24.t4s2.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Create User</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">    

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #f9f9f9;
            }
            h1 {
                text-align: center;
            }
            form {
                max-width: 400px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            label {
                display: block;
                margin-bottom: 10px;
            }
            input[type="text"],
            input[type="password"],
            select {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }
            .btn-container {
                text-align: center;
            }
            input[type="submit"],
            input[type="reset"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-right: 10px;
            }
            input[type="submit"]:hover,
            input[type="reset"]:hover {
                background-color: #45a049;
            }
            .cancel-btn {
                text-align: center;
                margin-top: 20px;
            }
            .error {
                padding-bottom: 16px;
                color: red;
            }
        </style>
    </head>
    <body>
        <h1>Create user. Input user information</h1>

        <form action="MainController" method="POST">
            <label for="userID">UserID</label> 
            <input type="text" name="userID" required> 
            <p class="error">${requestScope.USER_ERROR.userIDError}</p>

            <label for="fullName">Full Name</label>
            <input type="text" name="fullName" required> 
            <p class="error">${requestScope.USER_ERROR.fullNameError}</p>

            <label for="roleID">Role ID</label>
            <select name="roleID">
                <option value="AD">AD</option>
                <option value="US">US</option>
                <option value="OTHER">OTHER</option>
            </select>

            <label for="password">Password</label>
            <input type="password" name="password" required> 
            <p class="error">${requestScope.USER_ERROR.passwordError}</p>

            <label for="confirm">Confirm Password</label>
            <input type="password" name="confirm" required>

            <div class="btn-container">
                <input type="submit" name="action" value="Create">
                <input type="reset" value="Reset">
            </div>

            <p class="error">${requestScope.USER_ERROR.error}</p>
        </form>

        <div class="cancel-btn">
            <form action="admin.jsp">
                <input type="submit" value="Cancel">
            </form>
        </div>
    </body>
</html>
