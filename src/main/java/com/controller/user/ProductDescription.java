package com.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.model.Products;
import com.user.DAO.ProductsDescriptionDAO;
import com.user.DAO.UserProductsDAO;

/**
 * Servlet implementation class ProductDescription
 */
public class ProductDescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductsDescriptionDAO productDescriptionDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDescription() {
        super();
        productDescriptionDAO= new ProductsDescriptionDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String product_id= request.getParameter("product_id");
		List<Products> productDesc=(List<Products>) productDescriptionDAO.getProductDescription(Integer.parseInt(product_id));
		
		request.setAttribute("productsDesc", productDesc);
		request.getRequestDispatcher("Users View/productDescription.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}