<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Total Revenue for 2025.</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/PieChart.css">
</head>
<body>
<div class="container">
    <!-- Navigation Bar -->
    <nav class="navbar">
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Destination</a></li>
            <li><a href="#">Restaurant</a></li>
            <li><a href="#">Hotel</a></li>
            <li><a href="#">User</a></li>
            <li><a href="#">Booking</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">Chart</a></li>
        </ul>
    </nav>

    <!-- Header -->
    <header class="header">
        <h1>Total Revenue for 2025</h1>
    </header>

    <!-- Chart Section -->
    <section id="chart-section" class="chart-section">
        <div class="chart-container">
            <%-- Check if the chart image is available --%>
            <c:if test="${not empty chartImage}">
                <img src="data:image/png;base64,${chartImage}" alt="Pie Chart" class="chart-image"/>
            </c:if>
        </div>

        <!-- Comment Section Below the Chart -->
        <div class="chart-comment">
            <h3>Chart Comments</h3>
            <p>This pie chart illustrates the revenue for the first three months of the year 2025.
                The chart clearly shows that January (represented by the red section) had the highest revenue,
                with a total of 150 USD, making it the dominant month in terms of sales.
                February, marked by the green section, had a revenue of 120 USD, which,
                while significantly lower than January, still represents a substantial amount. Finally, March,
                depicted in the blue section, recorded the lowest revenue, totaling 105 USD. Overall,
                the chart highlights a noticeable difference in revenue across the three months,
                with January leading by a considerable margin, followed by February, and then March,
                which had the smallest share of revenue. This visual comparison effectively shows the variation in
                earnings across the first quarter of 2025.</p>
        </div>
    </section>

    <!-- Sections for Links -->
    <section id="section1" class="section">
        <h2><a href="<%= request.getContextPath() %>/chart?action=1">The Pie Chart</a></h2>
        <p>This pie chart illustrates the revenue distribution of all business
            establishments in 2025. It provides a clear breakdown of the total revenue,
            showing the contribution of each business sector. The chart helps to understand the relative
            performance of each sector within the overall business landscape.</p>
    </section>

    <section id="section2" class="section">
        <h2><a href="<%= request.getContextPath() %>/chart?action=2">The Bar Chart</a></h2>
        <p>This bar chart illustrates the number of bookings across different years.
            It allows for a straightforward comparison of booking trends over time, highlighting
            increases or decreases in the number of bookings each year. The chart provides valuable
            insights into how bookings have changed year over year.</p>
    </section>

    <section id="section3" class="section">
        <h2><a href="<%= request.getContextPath() %>/chart?action=3">The line chart</a></h2>
        <p>These line charts show the revenue of hotels, restaurants, and destinations over time.
            Each chart provides insights into the revenue performance of different locations, allowing
            for easy comparison. The charts help visualize trends and fluctuations in revenue across various
            categories.</p>
    </section>

</div>
</body>
</html>
