<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Revenue of each business type</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/PieChart.css">
    <script>
        let currentImageIndex = 0;
        const images = [
            "<%= request.getContextPath() %>/images/linechart1.png",
            "<%= request.getContextPath() %>/images/linechart2.png",
            "<%= request.getContextPath() %>/images/linechart3.png"
        ];

        function changeImage(direction) {
            currentImageIndex += direction;

            if (currentImageIndex < 0) {
                currentImageIndex = images.length - 1; // Loop back to the last image
            } else if (currentImageIndex >= images.length) {
                currentImageIndex = 0; // Loop back to the first image
            }

            document.getElementById("image-display").src = images[currentImageIndex];
        }
    </script>
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
        <h1>Revenue of each business type</h1>
    </header>

    <!-- Chart Section -->
    <section id="chart-section" class="chart-section">
        <div class="chart-container">
            <c:if test="${not empty chartImage}">
                <img id="image-display" src="data:image/png;base64,${chartImage}" alt="Line Chart" class="chart-image"/>
            </c:if>
        </div>

        <!-- Arrow Buttons to Navigate Between Images -->
        <button class="arrow left" onclick="window.location.href='<%= request.getContextPath() %>/chart?action=4'">&#8592;</button>
        <button class="arrow right" onclick="window.location.href='<%= request.getContextPath() %>/chart?action=5'">&#8594;</button>


        <!-- Comment Section Below the Chart -->
        <div class="chart-comment">
            <h3>Chart Comments</h3>
            <p>This line chart illustrates the booking trends over the past months. The chart provides insights into how bookings have increased or decreased, helping to identify patterns.</p>
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
