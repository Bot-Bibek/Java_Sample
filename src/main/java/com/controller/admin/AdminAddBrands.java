package com.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.admin.DAO.AdminProductDAO;
import com.admin.DAO.BrandDAO;
import com.controller.general.insertImage;
import com.model.Brand;
import com.model.Products;

/**
 * Servlet implementation class AdminAddBrands
 */

@MultipartConfig
public class AdminAddBrands extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public BrandDAO brandDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddBrands() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		

		insertImage ig= new insertImage();
		
		
		response.getWriter().append("Served at: ").append(request.getParameter("brand-name"));
		
		
		String brand_name= request.getParameter("brand-name");
		String imageName=ig.insertImageAdmin(request.getPart("brand_logo"));
		System.out.println(imageName);
		
		Brand brand= new Brand();
		brand.setBrand_name(brand_name);
		brand.setBrand_image(imageName);
		
		boolean inserted= brandDAO.addBrand(brand);
		
		if (inserted=true) {
			System.out.println("Brand Added Successfully");
			response.sendRedirect("AdminBrands");
			
		}
		else if(inserted=false) {
			System.out.println("Brand Added Failed");
		}
	}

}
