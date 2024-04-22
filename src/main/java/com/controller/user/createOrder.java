package com.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.controller.databaseConnection.db_connection;

import com.model.*;


public class createOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection dc = new db_connection();
			Connection con = dc.getConnect();
			
			//extracting values from user and totalcart sessions
			HttpSession session = request.getSession();
			Users user = (Users) session.getAttribute("users");
			session.getAttribute("cartTotal");
			
			
			if(session.getAttribute("cartTotal") == null) {
				out.println("The price is null");
			}else {
				out.println("The total price of the cart is" + session.getAttribute("cartTotal"));
			}
			
			//setting the value of the totalprice from the session into a variable
			Double totalPrice = (Double)session.getAttribute("cartTotal");
			
			
			int user_id = user.getUser_id();
			Date date =  new java.sql.Date(System.currentTimeMillis());
			
			
			//inserting the values of orders into the orders table
			String query = "INSERT INTO `orders`(`user_id`, `order_date`, `total_amount`) VALUES (?,?,?);";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,user_id);
			ps.setDate(2, date);
			ps.setDouble(3, totalPrice);
			int row = ps.executeUpdate();	
			
			if(row >0) {
				response.sendRedirect("Order_id");
				
			}else {
				out.println("Order is not created ");
			}

		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}