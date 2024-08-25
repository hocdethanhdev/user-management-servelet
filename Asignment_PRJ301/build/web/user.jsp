<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
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
            .user-info {
                width: 50%;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #fff;
            }
            .user-info p {
                margin-bottom: 10px;
            }
            a {
                margin-left: 45%;
                display: inline-block;
                margin-top: 20px;
                text-decoration: none;
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border-radius: 5px;
            }
            a:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <h1>User's information</h1>

        <div class="user-info">
            <p>User ID: ${sessionScope.LOGIN_USER.userID}</p>
            <p>Full name: ${sessionScope.LOGIN_USER.getFullName()}</p>
            <p>Role ID: ${sessionScope.LOGIN_USER.roleID}</p>
            <p>Password: ${sessionScope.LOGIN_USER.password}</p>
        </div>
        <a href="MainController?action=Shopping_Page">Shopping Page</a>
    </body>



</html>
