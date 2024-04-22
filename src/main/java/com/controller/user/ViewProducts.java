package com.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.controller.general.IdFromName;
import com.model.Products;
import com.user.DAO.UserProductsDAO;

/**
 * Servlet implementation class ViewProducts
 */
public class ViewProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserProductsDAO userProductDAO;
 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewProducts() {
        super();
        userProductDAO= new UserProductsDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		List<Products> productsList= null;
		HttpSession session = request.getSession();
		session.getAttribute("users");
		
		String productMen = request.getParameter("productMen");
		
		String productWomen = request.getParameter("productWomen");
		
		String productBySearch = request.getParameter("productName");
		
		String allProducts= request.getParameter("allProducts");
		
		String menProducts= request.getParameter("displayMen");
		String womenProducts= request.getParameter("displayWomen");
		String brandProducts= request.getParameter("product_brand");
		
		String productByFilter = request.getParameter("filter");
		
		IdFromName in = new IdFromName();
		
		if (productMen != null) {
			int cat_id = in.getCat_id(productMen);
			productsList= userProductDAO.getMenProducts(cat_id);
		}

		
		else if (productWomen != null) {
			int cat_id = in.getCat_id(productWomen);
			productsList= userProductDAO.getWomenProducts(cat_id);
		}
		
		
		else if (productBySearch != null) {
			productsList= userProductDAO.getSearchProducts(productBySearch);
		}
		else if(allProducts!=null) {
			productsList= userProductDAO.getAllProducts();
		}
		else if (menProducts!=null) {
			productsList= userProductDAO.getMenProducts();
		}
		else if (womenProducts!=null) {
			productsList= userProductDAO.getWomenProducts();
		}
		
		request.setAttribute("products", productsList);
		request.getAttribute("users");
		request.getRequestDispatcher("Users View/products.jsp").forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}