package com.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.admin.DAO.AdminProductDAO;
import com.admin.DAO.BrandDAO;
import com.model.Brand;
import com.model.Products;

/**
 * Servlet implementation class AdminBrands
 */
public class AdminBrands extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BrandDAO brandDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBrands() {
        super();
        brandDAO= new BrandDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		List<Brand> brandList= brandDAO.getAllBrands();
		String search=request.getParameter("search");
		
		if (search!=null){
			brandList= brandDAO.getSearchBrands(search);
		}
		request.setAttribute("brands", brandList);
		request.getRequestDispatcher("Admin View/editBrands.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
