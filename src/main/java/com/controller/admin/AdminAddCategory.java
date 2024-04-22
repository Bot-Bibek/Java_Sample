package com.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.admin.DAO.BrandDAO;
import com.admin.DAO.CategoryDAO;
import com.model.Brand;
import com.model.Categories;

/**
 * Servlet implementation class AdminAddCategory
 */
public class AdminAddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public CategoryDAO categoryDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddCategory() {
        super();
        categoryDAO= new CategoryDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String cat_name= request.getParameter("cat-name");
		
		Categories category= new Categories();
		category.setCat_name(cat_name);
		
		boolean inserted= categoryDAO.addBrand(category);
		
		if (inserted=true) {
			System.out.println("Category Added Successfully");
			response.sendRedirect("Admin View/addCategory.jsp");
			
		}
		else if(inserted=false) {
			System.out.println("Brand Added Failed");
			response.sendRedirect("Admin View/addCategory.jsp");
		}
	}
}
