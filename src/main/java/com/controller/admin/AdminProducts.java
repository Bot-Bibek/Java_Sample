package com.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.admin.DAO.AdminProductDAO;
import com.model.Products;

/**
 * Servlet implementation class AdminProducts
 */
public class AdminProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminProductDAO adminProductDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProducts() {
        super();
        adminProductDAO= new AdminProductDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Products> productsList= adminProductDAO.getAllProducts();
		String search=request.getParameter("search");
		
		if (search!=null){
			productsList= adminProductDAO.getSearchProducts(search);
		}
		request.setAttribute("products", productsList);
		request.getRequestDispatcher("Admin View/viewProductsAdmin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
