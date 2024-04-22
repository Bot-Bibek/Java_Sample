package com.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.controller.databaseConnection.db_connection;

import com.model.*;



public class AddCartItems extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String product_id = request.getParameter("product_id");
		int Id = Integer.parseInt(product_id);
		

		try(PrintWriter out = response.getWriter()) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection dc = new db_connection();
			Connection con = dc.getConnect();
			
			//read the products from the database
			String query = "Select * from products where product_id = ?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, Id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				ArrayList<Carts> cartList = new ArrayList<>();

				//making object of the model Carts
				Carts cart = new Carts();
				cart.setProduct_id(Id);
				cart.setQuantity(1);
				cart.setProduct_price(rs.getDouble("product_price"));
			
				//defining the session 
				HttpSession session = request.getSession();
				ArrayList<Carts> cartListSession = (ArrayList<Carts>) session.getAttribute("addcarts");
				
				//adding the cart objects in the cartList arraylist if the cartSession is null
				if(cartListSession == null) {
					cartList.add(cart);
					session.setAttribute("addcarts", cartList);
					out.println("Session created and added to the list");
					response.sendRedirect("Users View/home.jsp");
				}else {
					cartList = cartListSession;
					boolean exist = false;
					
					for(Carts c:cartListSession) {
						if(c.getProduct_id() == Integer.valueOf(Id)) { //if the product already exists
							exist = true;
							out.println("Product already exists");
							
							out.println("<h3>Product already exists in Cart</h3>");
							out.println("<a href = 'Users View/Carts.jsp'>Go to Cart</a>");
													
						}

					}
					//if the product is added redirect it to profile.jsp
					if(!exist) {
						cartList.add(cart);
						out.println("Product is added");
						response.sendRedirect("Users View/home.jsp");
						
					}
				}

			}else {
				System.out.println("The product is not found");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}