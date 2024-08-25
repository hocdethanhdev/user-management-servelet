<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.sp24.t4s2.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .container {
                max-width: 1000px;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            h1 {
                text-align: center;
                color: #333;
            }
            form {
                margin-bottom: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 8px;
                border: 1px solid #ddd;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            input[type="text"] {
                width: 70%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {

                padding: 8px 12px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            p.error-message {
                color: red;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>

            <form action="MainController" method="GET">
                <input type="submit" name="action" value="Create_User_Page">
            </form>

            <form action="MainController" method="GET">
                <input type="text" name="search" placeholder="Search">
                <input type="submit" name="action" value="Search">
            </form>

            <c:if test="${not empty requestScope.LIST_USER}">
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>User ID</th>
                            <th>Full Name</th>
                            <th>Role ID</th>
                            <th>Password</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                        <form action="MainController" method="POST">
                            <tr>
                                <td>${counter.count}</td>
                                <td><input type="text" name="userID" value="${user.userID}" readonly></td>
                                <td><input type="text" name="fullName" value="${user.fullName}"></td>
                                <td><input type="text" name="roleID" value="${user.roleID}"></td>
                                <td>${user.password}</td>
                                <td>
                                    <input type="hidden" name="search" value="${param.search}">
                                    <input type="hidden" name="userID" value="${user.userID}">
                                    <input type="submit" name="action" value="Delete">
                                </td>
                                <td>
                                    <input type="hidden" name="search" value="${param.search}">
                                    <input type="hidden" name="userID" value="${user.userID}">
                                    <input type="submit" name="action" value="Update">
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>

                </table>

            </c:if>

            <p class="error-message">${requestScope.ERROR}</p>
            <form action="MainController" method="POST">
                <input type="hidden" name="action" value="Logout"/>
                <input type="submit" value="Logout"/>
            </form>
        </div>
    </body>
</html>
