package com.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.admin.DAO.AdminProductDAO;
import com.controller.databaseConnection.db_connection;
import com.model.Products;


/**
 * Servlet implementation class AdminAddProducts
 */

@MultipartConfig
public class AdminUpdateProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public AdminProductDAO adminProductDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateProducts() {
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
		response.getWriter().append("Served at: Yppp").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		List<Products> productDescription= new ArrayList<>();
		
		String product_id= request.getParameter("updateBtn");
		
		String query = "Select * from products where product_id="+product_id;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection db= new db_connection();
	        Connection con = db.getConnect();
	        
	        PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
            	Products product= new Products();
            	
            	product.setProduct_id(Integer.parseInt(product_id));
            	product.setCat_id(rs.getInt("cat_id"));
            	product.setGender_id(rs.getInt("gender_id"));
            	product.setBrand_id(rs.getInt("brand_id"));
            	product.setProduct_name(rs.getString("product_name"));
            	product.setProduct_price(rs.getInt("product_price"));
            	product.setStock(rs.getInt("stock"));
            	product.setImg_path1(rs.getString("img_path1"));
            	product.setImg_path2(rs.getString("img_path2"));
            	product.setImg_path3(rs.getString("img_path3"));
            	product.setProduct_desc(rs.getString("product_desc"));
            	productDescription.add(product);
            	request.setAttribute("product_desc", productDescription);
            	request.getRequestDispatcher("Admin View/productUpdateForm.jsp").forward(request, response);
            }
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

		
	}

