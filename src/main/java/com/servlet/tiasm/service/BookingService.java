package com.servlet.tiasm.service;

import com.servlet.tiasm.model.*;
import com.servlet.tiasm.repository.BookingDAO;
import java.util.List;
import java.awt.*;
import java.math.BigDecimal;
import java.util.*;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.chart.renderer.category.StandardBarPainter;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import org.jfree.ui.TextAnchor;
public class BookingService implements IBookingService {

    private BookingDAO bookingDAO = new BookingDAO();

    public static ArrayList<Booking> booList = new ArrayList<>();

    @Override
    public void display() {
        List<Booking> bookings = bookingDAO.getAll();
        for (Booking booking : bookings) {
            System.out.println(booking);
        }
    }

    @Override
    public void add(Booking entity) {
        if (entity != null) {
            bookingDAO.insert(entity);
            System.out.println("Booking added successfully");
        } else {
            System.out.println("Invalid booking data");
        }
    }

    @Override
    public void update(Booking entity) {
        if (entity != null && entity.getBookingId() > 0) {
            bookingDAO.update(entity);
            System.out.println("Booking updated successfully");
        } else {
            System.out.println("Invalid booking data or booking ID");
        }
    }

    @Override
    public Booking findById(int id) {
        if (id > 0) {
            Booking booking = bookingDAO.getById(id);
            if (booking != null) {
                return booking;
            } else {
                System.out.println("Booking not found");
            }
        } else {
            System.out.println("Invalid booking ID");
        }
        return null;
    }

    @Override
    public void delete(Booking entity) {
        if (entity != null && entity.getBookingId() > 0) {
            bookingDAO.delete(entity.getBookingId());
            System.out.println("Booking deleted successfully");
        } else {
            System.out.println("Invalid booking data or booking ID");
        }
    }

    @Override
    public void save() {
        // This method can be used if needed to persist a specific booking, but usually, adding or updating is sufficient.
        System.out.println("Save method invoked, but no specific implementation.");
    }

    public BookingService() {
    }

    public static void searchCal(Booking entries, ArrayList<Booking> list) {
        for (Booking book : list) {
            if (entries.getBookingDate().getMonth() == book.getBookingDate().getMonth()) {
                BigDecimal total = book.getTotalPrice().add(entries.getTotalPrice());
                book.setTotalPrice(total);
                return;
            }
        }

        // Nếu không tìm thấy, thêm mới vào list
        list.add(new Booking(entries.getBookingDate(), entries.getTotalPrice()));
    }

    public DefaultCategoryDataset getDataBarChart() {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        Map<Integer, Integer> bookingCountByYear = new HashMap<>();

        for (Booking booking : booList) {
            int year = booking.getBookingDate().getYear();

            bookingCountByYear.put(year, bookingCountByYear.getOrDefault(year, 0) + 1);
        }
        for (Map.Entry<Integer, Integer> entry : bookingCountByYear.entrySet()) {
            dataset.addValue(entry.getValue(), "Booking Count", entry.getKey());
        }
        return dataset;
    }

    public static DefaultPieDataset getDataPieChart() {
        DefaultPieDataset dataset = new DefaultPieDataset();
        ArrayList<Booking> data = new ArrayList<>();

        for (Booking book : booList) {
            searchCal(book, data);
        }

        for (Booking book : data) {
            if(book.getBookingDate().getYear() == 2025){
                String monthLabel = "Tháng " + book.getBookingDate().getMonthValue();
                dataset.setValue(monthLabel, book.getTotalPrice());
            }

        }
        return dataset;
    }

    public static JFreeChart createPieChart(PieDataset dataset) {
        JFreeChart chart = ChartFactory.createPieChart(
                "DOANH THU THEO THÁNG NĂM 2025", dataset, true, true, false);

        PiePlot plot = (PiePlot) chart.getPlot();
        plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{0}: {1} USD"));
        return chart;
    }


    public JFreeChart createBarChart(CategoryDataset dataset) {

        JFreeChart chart = ChartFactory.createBarChart(
                "Sô lượng booking theo từng năm", "Năm", "Sô lượng booking", dataset);
        CategoryPlot plot = chart.getCategoryPlot();
        BarRenderer renderer = (BarRenderer) plot.getRenderer();

        // Customizing the item label generator to include "USD"
        renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator() {
            @Override
            public String generateLabel(CategoryDataset dataset, int row, int column) {
                // Add "USD" to the value displayed on the bar
                String label = super.generateLabel(dataset, row, column);
                return label + " lượt";
            }
        });

        renderer.setItemLabelsVisible(true);

        // Position the labels and customize their appearance
        renderer.setBaseItemLabelFont(new java.awt.Font("Arial", java.awt.Font.PLAIN, 12));
        renderer.setBaseItemLabelPaint(Color.BLACK);
        renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.BOTTOM_CENTER));

        // Customizing color and width of the bars
        renderer.setSeriesPaint(0, Color.BLUE);
        renderer.setBarPainter(new StandardBarPainter());

        return chart;
    }

    // Hàm tìm kiếm và tính toán
    public static void searchCalRes(BookingEntry bk, BigDecimal total, Map<String, BigDecimal> restaurant) {
        String travelName = bk.getService().getTravelName();

        // Nếu dịch vụ là Restaurant, cộng giá trị
        if (bk.getService() instanceof Restaurant) {
            restaurant.put(travelName, restaurant.getOrDefault(travelName, BigDecimal.ZERO).add(total));
        }
    }

    // Hàm lấy dữ liệu cho Line Chart
    public static DefaultCategoryDataset getDataResLineChart() {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        Map<String, BigDecimal> restaurant = new HashMap<>();  // Dùng Map thay vì ArrayList

        for (Booking book : booList) {
            if (book.getEntries() != null) {  // Kiểm tra nếu entries không phải null
                for (BookingEntry bk : book.getEntries()) {
                    if (bk.getService() instanceof Restaurant) {
                        searchCalRes(bk, book.getTotalPrice(), restaurant);
                    }
                }
            }
        }

        // Thêm dữ liệu vào dataset từ Map restaurant
        for (Map.Entry<String, BigDecimal> entry : restaurant.entrySet()) {
            dataset.addValue(entry.getValue(), "Doanh thu", entry.getKey());
        }

        return dataset;
    }

    // Tạo biểu đồ Line Chart
    public static JFreeChart createResLineChart(DefaultCategoryDataset dataset) {
        JFreeChart chart = ChartFactory.createLineChart(
                "Doanh thu tổng quan tại các Nhà hàng",       // Tiêu đề
                "Nhà Hàng",              // Nhãn trục X
                "Số tiền (USD)",         // Nhãn trục Y
                dataset,                 // Dữ liệu (dataset)
                PlotOrientation.VERTICAL,  // Hướng biểu đồ (theo chiều dọc)
                true,                    // Hiển thị chú thích
                true,                    // Hiển thị tooltips
                false                    // Không hiển thị URL
        );

        // Lấy đối tượng CategoryPlot
        CategoryPlot plot = (CategoryPlot) chart.getPlot();

        // Lấy renderer để thay đổi độ dày đường
        LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot.getRenderer();

        // Thiết lập độ dày đường (ví dụ: 3px)
        renderer.setSeriesStroke(0, new BasicStroke(3.0f));  // Series 0, độ dày 3px

        return chart;
    }

    public static void searchCalDes(BookingEntry bk, BigDecimal total, Map<String, BigDecimal> destination) {
        String travelName = bk.getService().getTravelName();

        // Nếu dịch vụ là Restaurant, cộng giá trị
        if (bk.getService() instanceof Destination) {
            destination.put(travelName, destination.getOrDefault(travelName, BigDecimal.ZERO).add(total));
        }
    }

    // Hàm lấy dữ liệu cho Line Chart
    public static DefaultCategoryDataset getDataDesLineChart() {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        Map<String, BigDecimal> destination = new HashMap<>();  // Dùng Map thay vì ArrayList

        for (Booking book : booList) {
            if (book.getEntries() != null) {  // Kiểm tra nếu entries không phải null
                for (BookingEntry bk : book.getEntries()) {
                    if (bk.getService() instanceof Destination) {
                        searchCalDes(bk, book.getTotalPrice(), destination);
                    }
                }
            }
        }

        // Thêm dữ liệu vào dataset từ Map restaurant
        for (Map.Entry<String, BigDecimal> entry : destination.entrySet()) {
            dataset.addValue(entry.getValue(), "Doanh thu", entry.getKey());
        }

        return dataset;
    }

    // Tạo biểu đồ Line Chart
    public static JFreeChart createDesLineChart(DefaultCategoryDataset dataset) {
        JFreeChart chart = ChartFactory.createLineChart(
                "Doanh thu du lịch tổng quan tại các địa điểm",       // Tiêu đề
                "Địa điểm du lịch",              // Nhãn trục X
                "Số tiền (USD)",         // Nhãn trục Y
                dataset,                 // Dữ liệu (dataset)
                PlotOrientation.VERTICAL,  // Hướng biểu đồ (theo chiều dọc)
                true,                    // Hiển thị chú thích
                true,                    // Hiển thị tooltips
                false                    // Không hiển thị URL
        );

        // Lấy đối tượng CategoryPlot
        CategoryPlot plot = (CategoryPlot) chart.getPlot();

        // Lấy renderer để thay đổi độ dày đường
        LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot.getRenderer();

        // Thiết lập độ dày đường (ví dụ: 3px)
        renderer.setSeriesStroke(0, new BasicStroke(3.0f));  // Series 0, độ dày 3px

        return chart;
    }


    public static void searchCalHot(BookingEntry bk, BigDecimal total, Map<String, BigDecimal> hotel) {
        String travelName = bk.getService().getTravelName();

        // Nếu dịch vụ là Restaurant, cộng giá trị
        if (bk.getService() instanceof Hotel) {
            hotel.put(travelName, hotel.getOrDefault(travelName, BigDecimal.ZERO).add(total));
        }
    }

    // Hàm lấy dữ liệu cho Line Chart
    public static DefaultCategoryDataset getDataHotLineChart() {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        Map<String, BigDecimal> hotel = new HashMap<>();  // Dùng Map thay vì ArrayList

        for (Booking book : booList) {
            if (book.getEntries() != null) {  // Kiểm tra nếu entries không phải null
                for (BookingEntry bk : book.getEntries()) {
                    if (bk.getService() instanceof Hotel) {
                        searchCalHot(bk, book.getTotalPrice(), hotel);
                    }
                }
            }
        }

        // Thêm dữ liệu vào dataset từ Map restaurant
        for (Map.Entry<String, BigDecimal> entry : hotel.entrySet()) {
            dataset.addValue(entry.getValue(), "Doanh thu", entry.getKey());
        }

        return dataset;
    }

    // Tạo biểu đồ Line Chart
    public static JFreeChart createHotLineChart(DefaultCategoryDataset dataset) {
        JFreeChart chart = ChartFactory.createLineChart(
                "Doanh thu tổng quang của các Khách sạn",       // Tiêu đề
                "Khách sạn",              // Nhãn trục X
                "Số tiền (USD)",         // Nhãn trục Y
                dataset,                 // Dữ liệu (dataset)
                PlotOrientation.VERTICAL,  // Hướng biểu đồ (theo chiều dọc)
                true,                    // Hiển thị chú thích
                true,                    // Hiển thị tooltips
                false                    // Không hiển thị URL
        );

        // Lấy đối tượng CategoryPlot
        CategoryPlot plot = (CategoryPlot) chart.getPlot();

        // Lấy renderer để thay đổi độ dày đường
        LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot.getRenderer();

        // Thiết lập độ dày đường (ví dụ: 3px)
        renderer.setSeriesStroke(0, new BasicStroke(3.0f));  // Series 0, độ dày 3px

        return chart;
    }
}
