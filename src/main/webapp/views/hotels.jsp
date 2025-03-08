<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.servlet.tiasm.model.Hotel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hotel List</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">
</head>

<body>
<h2>List of Hotels</h2>
<table>
    <tr>
        <th>Hotel Name</th>
        <th>Available Rooms</th>
        <th>Free Services</th>
        <th>Check-In</th>
        <th>Check-Out</th>
        <th>Description</th>
    </tr>
    <%
        List<Hotel> hotels = (List<Hotel>) request.getAttribute("hotels");
        if (hotels != null) {
            for (Hotel hotel : hotels) {
    %>
    <tr>
        <td><%= hotel.getTravelName() %></td>
        <td><%= hotel.getHotelAvailableRooms() %></td>
        <td><%= String.join(", ", hotel.getHotelService()) %></td>
        <td><%= hotel.getHotelCheckInTime() %></td>
        <td><%= hotel.getHotelCheckOutTime() %></td>
        <td><%= hotel.getTravelDescription() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr><td colspan="5">No hotels found</td></tr>
    <% } %>
</table>
</body>
</html>
