package com.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.admin.DAO.AdminProductDAO;
import com.model.Products;


/**
 * Servlet implementation class AdminAddProducts
 */

@MultipartConfig
public class AdminAddProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public AdminProductDAO adminProductDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddProducts() {
        super();
        adminProductDAO= new AdminProductDAO();
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
		
		com.controller.general.IdFromName in= new com.controller.general.IdFromName();
		com.controller.general.insertImage ig= new com.controller.general.insertImage();
		
		
		response.getWriter().append("Served at: ").append(request.getParameter("product-category"));
		
		
		String cat_name= request.getParameter("product-category");
		String brand_name= request.getParameter("product-brand");
		String gender_name= request.getParameter("product-gender");
		
		String productName=  request.getParameter("product-name");
		int productPrice= Integer.parseInt(request.getParameter("product-price"));
		int stock= Integer.parseInt(request.getParameter("product-stock"));
		int cat_id= in.getCat_id(cat_name);
		int brand_id= in.getBrand_id(brand_name);
		int gender_id= in.getGender_id(gender_name);
		String productDesc= request.getParameter("product-description");
		String imageName1= ig.insertImageAdmin(request.getPart("product-image1"));
		String imageName2= ig.insertImageAdmin(request.getPart("product-image2"));
		String imageName3= ig.insertImageAdmin(request.getPart("product-image3"));
		
		
		Products product= new Products();
		product.setCat_id(cat_id);
		product.setBrand_id(brand_id);
		product.setGender_id(gender_id);
		product.setProduct_name(productName);
		product.setStock(stock);
		product.setProduct_price(productPrice);
		product.setImg_path1(imageName1);
		product.setImg_path2(imageName2);
		product.setImg_path3(imageName3);
		product.setProduct_desc(productDesc);
		
		boolean inserted= adminProductDAO.addProduct(product);
		
		if (inserted=true) {
			System.out.println("Product Added Successfully");
			response.sendRedirect("AdminProducts");
		}
		else if(inserted=false) {
			System.out.println("Product Added Failed");
		}
	}
		
	}

