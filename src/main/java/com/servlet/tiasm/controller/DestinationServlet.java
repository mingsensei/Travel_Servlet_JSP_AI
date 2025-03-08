package com.servlet.tiasm.controller;

import com.servlet.tiasm.repository.DestinationDAO;
import com.servlet.tiasm.repository.HotelDAO;
import com.servlet.tiasm.model.Destination;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/destination")
public class DestinationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DestinationDAO destinationDAO;

    @Override
    public void init() throws ServletException {
        destinationDAO = new DestinationDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Destination> destinations = destinationDAO.getAll();
        request.setAttribute("destinations", destinations);
        request.getRequestDispatcher("/views/destination.jsp").forward(request, response);
    }
}
