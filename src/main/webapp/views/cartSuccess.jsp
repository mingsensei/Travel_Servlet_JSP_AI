<%@page import="java.util.List"%>
<%@ page import="com.servlet.tiasm.model.BookingEntry" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Success</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .success-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .success-title {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            color: #28a745;
        }
        .booking-details {
            margin-top: 20px;
        }
        .btn-back {
            display: block;
            margin-top: 20px;
            width: 100%;
        }
    </style>
</head>
<body>

<%
    // Check if checkout was successful
    Boolean cartSuccess = (Boolean) session.getAttribute("cartSuccess");
    if (cartSuccess != null && cartSuccess) {
        List<BookingEntry> bookingDetails = (List<BookingEntry>) session.getAttribute("bookingDetails");
%>
    <div class="success-container">
        <h2 class="success-title">Your booking was successful! 🎉</h2>
        <p>Your services have been booked successfully. Thank you for choosing us!</p>

        <div class="booking-details">
            <h4>Booking Details:</h4>
            <table class="table table-bordered">
                <thead>
                    <tr>
            
                        <th>Service Type</th>
                        <th>Booking Date</th>
                        <th>Price</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (BookingEntry booking : bookingDetails) {
                    %>
                    <tr>
                   
                        <td><%= booking.getServiceType() %></td>
                        <td><%= booking.getBookingTime() %></td>
                        <td><%= booking.getService().getPricePerPerson() %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <a href="<%= request.getContextPath() %>/home" class="btn btn-primary btn-back">Go Back to Home</a>
    </div>
<%
        // Reset the success flag and booking details after displaying the message
        session.removeAttribute("cartSuccess");
        session.removeAttribute("bookingDetails");
    } else {
%>
    <div class="success-container">
        <h2 class="text-center">Error: No booking found.</h2>
        <a href="<%= request.getContextPath() %>/cart" class="btn btn-warning btn-back">Go Back to Cart</a>
    </div>
<%
    }
%>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
