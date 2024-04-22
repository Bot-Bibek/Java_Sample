package com.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.admin.DAO.AdminProductDAO;
import com.admin.DAO.OrdersDAO;
import com.model.Orders;
import com.model.Products;

/**
 * Servlet implementation class AdminOrders
 */
public class AdminOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrdersDAO ordersDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrders() {
        super();
        ordersDAO= new OrdersDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Orders> ordersList= ordersDAO.getAllOrders();
		String search=request.getParameter("search");
		
		if (search!=null){
			ordersList= ordersDAO.getSearchOrders(search);
		}
		request.setAttribute("orders", ordersList);
		request.getRequestDispatcher("Admin View/ordersList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}
}
