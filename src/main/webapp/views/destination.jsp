<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.servlet.tiasm.model.Destination" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Destination List</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">
</head>

<body>
<h2>List of Destinations</h2>


<table>
    <tr>
        <th>Name</th>
        <th>Entry Fee</th>
        <th>Services</th>
        <th>Opening Hours</th>
        <th>Closing Hours</th>
        <th>Location</th>
    </tr>
    <%
        List<Destination> destinations = (List<Destination>) request.getAttribute("destinations");
        if (destinations != null) {
            for (Destination destination : destinations) {
    %>
    <tr>
        <td><%= destination.getTravelName() %></td>
        <td><%= destination.getTourEntryFee() %></td>
        <td><%= String.join(", ", destination.getTourServicesAvailable()) %></td>
        <td><%= destination.getTourOpeningHours() %></td>
        <td><%= destination.getTourClosingHours() %></td>
        <td><%= destination.getTravelLocation() %></td>

    </tr>
    <%
        }
    } else {
    %>
    <tr><td colspan="7">No destinations found</td></tr>
    <% } %>
</table>
</body>
</html>
