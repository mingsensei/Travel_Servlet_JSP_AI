package com.servlet.tiasm.controller;

import com.servlet.tiasm.service.BookingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;

@WebServlet("/chart")
public class ChartServlet extends HttpServlet {
    private final BookingService bookingService = new BookingService();
    private static final String PieChart = "/views/PieChart.jsp";
    private static final String BarChart = "/views/BarChart.jsp";
    private static final String LineChart = "/views/LineChart.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String chart = PieChart;  // Default page
        JFreeChart chartInGeneral = null;

        // Set default dataset for Pie chart
        DefaultPieDataset dataset = BookingService.getDataPieChart();
        chartInGeneral = BookingService.createPieChart(dataset);

        // Check if the action parameter is provided and update chart accordingly
        if (action != null) {
            switch (action) {
                case "1":
                    chart = PieChart;
                    dataset = BookingService.getDataPieChart();  // Re-fetch Pie chart data
                    chartInGeneral = BookingService.createPieChart(dataset);
                    break;
                case "2":
                    chart = BarChart;
                    DefaultCategoryDataset barDataset = bookingService.getDataBarChart();
                    chartInGeneral = bookingService.createBarChart(barDataset);
                    break;
                case "3":
                    chart = LineChart;
                    DefaultCategoryDataset lineResDataset = BookingService.getDataResLineChart();
                    chartInGeneral = BookingService.createResLineChart(lineResDataset);
                    break;
                case "4":
                    chart = LineChart;
                    DefaultCategoryDataset lineDesDataset = BookingService.getDataDesLineChart();
                    chartInGeneral = BookingService.createDesLineChart(lineDesDataset);
                    break;
                case "5":
                    chart = LineChart;
                    DefaultCategoryDataset lineHotDataset = BookingService.getDataHotLineChart();
                    chartInGeneral = BookingService.createHotLineChart(lineHotDataset);
                    break;
                default:
                    chart = PieChart;  // Default to Pie chart if no action matches
                    break;
            }
        }

        // Convert chart to PNG byte array
        ByteArrayOutputStream chartOut = new ByteArrayOutputStream();
        try {
            if (chartInGeneral != null) {
                ChartUtilities.writeChartAsPNG(chartOut, chartInGeneral, 800, 600);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Convert byte array to Base64 string
        byte[] chartImage = chartOut.toByteArray();
        String base64Chart = Base64.getEncoder().encodeToString(chartImage);

        // Set the chart image as an attribute in the request
        request.setAttribute("chartImage", base64Chart);

        // Forward request to appropriate JSP based on the chart type
        request.getRequestDispatcher(chart).forward(request, response);
    }
}





