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

import com.controller.databaseConnection.db_connection;

import com.model.*;


public class Order_id extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		//to read the orders table and set the value of getters and setters in the model and also the session
		try(PrintWriter out = response.getWriter();) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection dc = new db_connection();
			Connection con = dc.getConnect();
			HttpSession session = request.getSession();
			
			Users user = (Users) session.getAttribute("users");
			
			int user_id = user.getUser_id();
			
			String checkquery = "Select * from orders where user_id = ?";
			PreparedStatement pst = con.prepareStatement(checkquery);
			pst.setInt(1,user_id);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				Orders order = new Orders();
				order.setOrder_id(rs.getInt("order_id"));
				order.setOrder_date(rs.getDate("order_date"));
				order.setUser_id(user_id);
				order.setTotal_amount(0.00);
				
				session.setAttribute("orders", order);
				response.sendRedirect("InsertOrderItems");
				
					
			}else {
				out.print("There is some error");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}