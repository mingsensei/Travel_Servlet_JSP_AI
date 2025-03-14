<!-- cart.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Travel Cart</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/cart-styles.css">
    </head>

    <body>
        <header>
            <h1>Travel Cart</h1>
            <nav>
                <a href="#">Home</a>
                <a href="#">Destinations</a>
                <a href="#">Profile</a>
                <a href="#">Logout</a>
            </nav>
        </header>

        <main>
            <section class="cart-items">
                <h2>Your Selected Travel Packages</h2>
                <div class="cart-item" data-price="799.99">
                    <img src="travel-image1.jpg" alt="Travel Package Image">
                    <div class="course-details">
                        <div class="item-info">
                            <span class="item-id">ID: 001</span>
                            <span class="item-name">Travel Package: Bali Getaway</span>
                            <span class="item-booking-time">Booking Time: 2023-10-01</span>
                            <span class="item-price">Price: $799.99</span>
                        </div>
                        <button class="remove-btn" onclick="removeItem(this)">Remove</button>
                    </div>
                </div>
                <div class="cart-item" data-price="1299.99">
                    <img src="travel-image2.jpg" alt="Travel Package Image">
                    <div class="course-details">
                        <div class="item-info">
                            <span class="item-id">ID: 002</span>
                            <span class="item-name">Travel Package: Paris Adventure</span>
                            <span class="item-booking-time">Booking Time: 2023-10-05</span>
                            <span class="item-price">Price: $1,299.99</span>
                        </div>
                        <button class="remove-btn" onclick="removeItem(this)">Remove</button>
                    </div>
                </div>
                <!-- Add more cart items as needed -->
            </section>

            <section class="cart-summary">
                <h2>Cart Summary</h2>
                <p>Total: <span id="total-price">$2,099.98</span></p>
                <button class="checkout-btn" onclick="goToPaymentPage()">Proceed to Checkout</button>
            </section>
        </main>

        <!-- cart.jsp -->
        <script>
            function goToPaymentPage() {
                window.location.href = "payment";
            }
        </script>

        <footer>
            <p>&copy; 2023 Travel Agency. All rights reserved.</p>
        </footer>
    </body>

    </html>