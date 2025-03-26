<%@ page import="java.util.*, com.servlet.tiasm.model.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionUser = request.getSession(false);
    String userEmail = (sessionUser != null) ? (String) sessionUser.getAttribute("userEmail") : null;

    if (userEmail == null) {
        response.sendRedirect("/login"); // N?u ch?a ??ng nh?p, chuy?n h??ng v? login
        return;
    }

    List<BookingEntry> cart = (List<BookingEntry>) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
</head>
<body>
    <h2>Your Cart</h2>

    <table border="1">
        <tr>
            <th>Service Type</th>
            <th>Service Name</th>
            <th>Check-in/Booking Time</th>
            <th>Check-out</th>
        </tr>
        <% if (cart != null && !cart.isEmpty()) {
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
        </tr>
        <% }} else { %>
        <tr><td colspan="4">Your cart is empty.</td></tr>
        <% } %>
    </table>

    <form action="bookingServlet" method="post">
        <button type="submit">Booking</button>
    </form>
</body>
</html>
