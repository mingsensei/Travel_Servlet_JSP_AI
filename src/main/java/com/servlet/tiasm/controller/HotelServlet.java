package com.servlet.tiasm.controller;



import com.servlet.tiasm.repository.HotelDAO;
import com.servlet.tiasm.model.Hotel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/hotels")  // URL mapping for this servlet
public class HotelServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HotelDAO hotelDAO;

    @Override
    public void init() {
        hotelDAO = new HotelDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Hotel> hotelList = hotelDAO.getAll(); // Get all hotels
        request.setAttribute("hotels", hotelList); // Pass data to JSP
        request.getRequestDispatcher("/views/hotels.jsp").forward(request, response);
    }
}

