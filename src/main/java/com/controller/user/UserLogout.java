package com.controller.user;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Logout
 */
public class UserLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		PrintWriter out = response.getWriter();
		
		//this jsp file is to logout from all the session
		sess.removeAttribute("users");
		sess.removeAttribute("addcarts");
		sess.removeAttribute("cartTotal");
		
		if (sess.getAttribute("users")== null && sess.getAttribute("addcarts")== null) {
			out.println("Logged Out successfully");
			response.sendRedirect("Users View/home.jsp");
		}else {
			out.println("Session is active by : " + sess.getAttribute("users") );
			
			
		}

		}
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}