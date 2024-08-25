<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.sp24.t4s2.user.UserDTO"%>
<%@page import="sample.sp24.t4s2.shopping.Weapon"%>
<%@page import="sample.sp24.t4s2.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Order</title>
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
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            th, td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
            }
            form {
                display: inline;
            }
            .checkout-form {
                text-align: center;
            }
            .checkout-form input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-right: 10px;
            }
            .checkout-form input[type="submit"]:hover {
                background-color: #45a049;
            }
            .checkout-form input[type="hidden"] {
                display: none;
            }
            .message {
                margin-top: 20px;
                margin-bottom: 40px;
                text-align: center;
                color: green;
            }
            .add-more-link {
                text-align: center;
                margin-bottom: 20px;
            }
            .add-more-link a {
                padding-top: 200px;
                text-decoration: none;
                background-color: #008CBA;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
            }
            .add-more-link a:hover {
                background-color: #005f6b;
            }

            .error {
                margin-top: 20px;
                margin-bottom: 40px;
                text-align: center;
                color: red;
            }
        </style>
    </head>
    <body>
        <h1>Your selected Weapons!</h1>

       

        <c:set var="total" value="0"></c:set>

        <c:if test="${sessionScope.CART != null}">
            <c:if test="${sessionScope.CART.getCart().size() > 0}">
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Edit</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="weapon" varStatus="counter" items="${sessionScope.CART.getCart().values()}">
                            <c:set var="total" value="${total + weapon.getPrice() * weapon.getQuantity()}"></c:set>
                            <form action="MainController" method="POST">
                                <tr>
                                    <td>${counter.count}</td>
                                <td><input type="text" name="id" value="${weapon.getId()}" readonly=""></td>
                                <td>${weapon.getName()}</td>
                                <td>${weapon.getPrice()}</td>
                                <td><input type="number" name="quantity" value="${weapon.getQuantity()}" required="" min="1"></td>
                                <td>${weapon.getPrice() * weapon.getQuantity()}</td>
                                <td><input type="submit" name="action" value="Edit"></td>
                                <td><input type="submit" name="action" value="Remove"></td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
            <h2>Total: ${total}</h2>



        </c:if>
    </c:if>
    <div class="checkout-form">
        <form action="MainController">
            <input type="submit" name="action" value="Checkout">
            <input type="hidden" name="total" value="${total}">
            <input type="hidden" name="userID" value="${sessionScope.LOGIN_USER.getUserID()}">
        </form>
    </div>
    <div class="error">

        <c:if test="${requestScope.CART_MESSAGE.startsWith('Order')}">
            <div class="message">${requestScope.CART_MESSAGE}</div>
        </c:if>
        <c:if test="${!requestScope.CART_MESSAGE.startsWith('Order')}">
            <div class="error">${requestScope.CART_MESSAGE}</div>
        </c:if>
    </div>

    <div class="add-more-link">
        <a href="shopping.jsp">Add More Weapons</a>
    </div>

</body>
</html>



