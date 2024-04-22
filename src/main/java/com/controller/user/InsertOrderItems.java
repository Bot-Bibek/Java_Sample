package com.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.controller.databaseConnection.db_connection;
import com.model.*;



public class InsertOrderItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			PrintWriter out = response.getWriter();
			HttpSession session = request.getSession();
			ArrayList<Carts>  cartProducts = (ArrayList<Carts>) session.getAttribute("addcarts");
			ArrayList<Carts> orderItems = null;
			
			Orders order = (Orders) session.getAttribute("orders");
			session.getAttribute("users");
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection dc = new db_connection();
			Connection con = dc.getConnect();
			
			for(Carts each:cartProducts) {
				
				String query = "INSERT INTO order_items(order_id, product_id, quantity, price, date) VALUES (?,?,?,?,?);";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setInt(1,order.getOrder_id());
				ps.setInt(2, each.getProduct_id());
				ps.setInt(3, each.getQuantity());
				ps.setDouble(4, each.getQuantity()* each.getProduct_price());
				ps.setDate(5, order.getOrder_date());
				int updated = ps.executeUpdate();
				
				if(updated >0) {
					session.removeAttribute("addcarts");
					response.sendRedirect("Users View/Orders.jsp");
				}else {
					out.print("The order_items is not saved in the database");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}