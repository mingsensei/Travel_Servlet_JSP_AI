<%@ page import="java.util.*, com.servlet.tiasm.model.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    HttpSession sessionUser = request.getSession(false);
    User user = (sessionUser != null) ? (User) sessionUser.getAttribute("user") : null;

    if (user == null) {
        response.sendRedirect("/login");
        return;
    }

    List<BookingEntry> cart = (sessionUser != null) ? (List<BookingEntry>) sessionUser.getAttribute("cart") : new ArrayList<>();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .cart-container {
            max-width: 800px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .cart-title {
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .cart-table th, .cart-table td {
            text-align: center;
            vertical-align: middle;
        }
        .cart-total {
            text-align: right;
            font-size: 18px;
            font-weight: bold;
        }
        .btn-remove {
            color: red;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="cart-container">
    <h2 class="cart-title">🛒 Your Cart</h2>

    <% if (cart != null && !cart.isEmpty()) { %>
        <table class="table table-bordered cart-table">
            <thead class="table-dark">
                <tr>
                    <th>Service Type</th>
                    <th>Service Name</th>
                    <th>Booking Time</th>
                    <th>Check-out</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (BookingEntry entry : cart) { 
                        BaseModel service = entry.getService();
                %>
                <tr>
                    <td><%= service.getClass().getSimpleName() %></td>
                    <td><%= service.getTravelName() %></td>
                    <td>
                        <% if (service instanceof Hotel) { %>
                            <%= entry.getBookingStartDate() %>
                        <% } else { %>
                            <%= entry.getBookingTime() %>
                        <% } %>
                    </td>
                    <td>
                        <% if (service instanceof Hotel) { %>
                            <%= entry.getBookingEndDate() %>
                        <% } else { %>
                            N/A
                        <% } %>
                    </td>
                    <td>
                        <form action="<%= request.getContextPath() %>/cart" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="serviceId" value="<%= service.getTravelId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <div class="cart-total">
            Total Items: <%= cart.size() %>
        </div>

        <form action="<%= request.getContextPath() %>/cart" method="post">
            <input type="hidden" name="action" value="checkout">
            <button type="submit" class="btn btn-success w-100 mt-3">Proceed to Checkout</button>
        </form>

    <% } else { %>
        <div class="alert alert-warning text-center">Your cart is empty.</div>
    <% } %>

    <div class="text-center mt-3">
        <a href="<%= request.getContextPath() %>/home" class="btn btn-primary">Continue Shopping</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
