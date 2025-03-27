<<<<<<< HEAD
<!-- payment.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Travel Payment</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/payment-styles.css">
    </head>

    <body>
        <header>
            <h1>Travel Payment</h1>
            <nav>
                <a href="cart.html">Cart</a>
                <a href="#">Home</a>
                <a href="#">Destinations</a>
                <a href="#">Profile</a>
                <a href="#">Logout</a>
            </nav>
        </header>

        <main>
            <section class="payment-details">
                <h2>Payment Information</h2>
                <div class="price-summary">
                    <h3>Total Price: <span id="total-price">$0.00</span></h3> <!-- Total price display -->
                </div>
                <form>
                    <div class="payment-methods">
                        <label class="payment-option">
                            <input type="radio" name="payment-method" value="credit-card" checked>
                            <span class="payment-label">Credit Card</span>
                        </label>
                        <label class="payment-option">
                            <input type="radio" name="payment-method" value="paypal">
                            <span class="payment-label">PayPal</span>
                        </label>
                        <label class="payment-option">
                            <input type="radio" name="payment-method" value="bank-transfer">
                            <span class="payment-label">Bank Transfer</span>
                        </label>
                        <label class="payment-option">
                            <input type="radio" name="payment-method" value="google-pay">
                            <span class="payment-label">Google Pay</span>
                        </label>
                        <label class="payment-option">
                            <input type="radio" name="payment-method" value="apple-pay">
                            <span class="payment-label">Apple Pay</span>
                        </label>
                    </div>

                    <label for="card-name">Name on Card:</label>
                    <input type="text" id="card-name" required>

                    <label for="card-number">Card Number:</label>
                    <input type="text" id="card-number" required>

                    <label for="expiry-date">Expiry Date:</label>
                    <input type="text" id="expiry-date" placeholder="MM/YY" required>

                    <label for="cvv">CVV:</label>
                    <input type="text" id="cvv" required>

                    <div class="button-container">
                        <button type="submit" class="submit-btn">Pay Now</button>
                        <button class="return-btn" onclick="returnToCart()">Return to Cart</button>
                    </div>
                </form>
            </section>
        </main>
        <!-- payment.jsp -->
        <script>
            function returnToCart() {
                window.location.href = "cart";
            }
        </script>
        <footer>
            <p>&copy; 2023 Travel Agency. All rights reserved.</p>
        </footer>
    </body>

    </html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.servlet.tiasm.model.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Page</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/payment.css">
    <script>
        function confirmPayment() {
            document.getElementById('popup').style.display = 'block';
        }
        function closePopup() {
            document.getElementById('popup').style.display = 'none';
        }
        function processPayment() {
            alert('Payment Successful!');
            closePopup();
        }
    </script>
</head>
<body>
    <nav class="navbar">
        <img src="logo.png" alt="Logo" class="logo">
        <a href="index.jsp">Home</a>
        <a href="user.jsp">User</a>
    </nav>

    <div class="container">
        <h1>Payment Page</h1>
        <%
            HttpSession sessionObj = request.getSession(false);
            User user = null;
            if (sessionObj != null) {
                user = (User) sessionObj.getAttribute("user");
            }
        %>

        <%
            if (user == null) {
                response.sendRedirect("login"); // Chuyển hướng nếu chưa đăng nhập
                return; // Dừng xử lý tiếp theo để tránh lỗi
            }
        %>

        <h2>Service Information</h2>
        <p>Service Name: Premium Subscription</p>
        <p>Total Amount: $49.99</p>

        <h2>Select Payment Method</h2>
        <div class="payment-methods">
            <div class="method"><img src="card.png" alt="Credit Card"></div>
            <div class="method"><img src="paypal.png" alt="PayPal"></div>
            <div class="method"><img src="bank.png" alt="Bank Transfer"></div>
            <div class="method"><img src="applepay.png" alt="Apple Pay"></div>
            <div class="method"><img src="googlepay.png" alt="Google Pay"></div>
        </div>

        <button onclick="window.location.href='cart.jsp'">Back to Cart</button>
        <button onclick="confirmPayment()">Pay</button>
    </div>

    <div id="popup" class="popup">
        <p>Are you sure you want to proceed with the payment?</p>
        <button onclick="processPayment()">Yes</button>
        <button onclick="closePopup()">No</button>
    </div>
</body>
</html>
>>>>>>> b946e2b (payment)
