package com.controller.general;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.model.Carts;

/**
 * Servlet implementation class QuantityIncDec
 */

public class QuantityIncDec extends HttpServlet {
	private static final long serialVersionUID = 1L;



	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try(PrintWriter out = response.getWriter();){
			String action = request.getParameter("action"); //action from the cart page either increase or decrease
			int product_id = Integer.parseInt(request.getParameter("id"));
			HttpSession session = request.getSession();
			
			ArrayList<Carts> cartProducts = (ArrayList<Carts>) session.getAttribute("addcarts");
			
			if(action != null && product_id >= 1) {
				
				//when the quantity is increased
				if(action.equals("inc")) {
					for(Carts c:cartProducts) {
						if (c.getProduct_id() == product_id ) {
							int quantity = c.getQuantity();
							quantity++;
							c.setQuantity(quantity);
							response.sendRedirect("Users View/Carts.jsp");
			
							
						}
					}
					
				}
				
				//when the quantity is decreased
				if(action.equals("dec")) {
					for(Carts c:cartProducts){
						if(c.getProduct_id() == product_id) {
							int quantity = c.getQuantity();
							if(quantity <=1) {
								response.sendRedirect("Users View/Carts.jsp");
							}else {
								quantity--;
								c.setQuantity(quantity);
								response.sendRedirect("Users View/Carts.jsp");
							}
						}
						
					}
				}
			}else {
				response.sendRedirect("Users View/Carts.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hello");
		
	}

}