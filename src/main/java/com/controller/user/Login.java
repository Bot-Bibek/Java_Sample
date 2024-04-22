package com.controller.user;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.controller.databaseConnection.db_connection;
import com.controller.general.EncryptionLogin;
import com.model.Users;



/**
 * Servlet implementation class CheckLogin
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//values from the parameters 
		String mail = request.getParameter("email");
		String password = request.getParameter("pass");
		EncryptionLogin el = new EncryptionLogin();
		HttpSession session = request.getSession();
		
		
		
		response.setContentType("text/html"); // for displaying the message
		PrintWriter out = response.getWriter();		
		
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection dc = new db_connection();
			Connection con = dc.getConnect();
			
			String query = "select* from users where email = ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, mail);
			ResultSet rs = ps.executeQuery();
			
			
			if(rs.next()) { //at first checking the email
				String stored_pass = rs.getString("password");
				String decrypted_pass = el.decrypt(stored_pass);
				
				
				
				if (password.equals(decrypted_pass)) { //checking if the password in the database matches 
					
					//reading the values of the user and setting it to the model
					Users user = new Users();
					user.setUser_id(rs.getInt("user_id"));
					user.setUser_name(rs.getString("user_name"));
					user.setEmail(rs.getString("email"));
					user.setIs_admin(rs.getInt("is_admin"));
					user.setGender(rs.getString("gender"));
					user.setUser_address(rs.getString("user_address"));
					user.setUser_phone(rs.getString("user_phone"));
					user.setImage_user(rs.getString("image_user"));
					
					user.setPassword(decrypted_pass);

					

					//setting the value of users in the session
					session.setAttribute("users", user);
					
					
					response.sendRedirect("Users View/home.jsp");
					
				//checking if the login is from the admin
				}else if(password.equals(stored_pass) && rs.getInt("is_Admin") == 1) { 
						response.sendRedirect("Admin View/index.jsp");
					
				}else {
					session.setAttribute("error", "error");
					out.println("Username or Password incorrect");
					response.sendRedirect("Users View/Login.jsp");
					
				}
			}else {
				session.setAttribute("error", "error");
				response.sendRedirect("Users View/Login.jsp");
			}
			
			
		//handling the exceptions
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}

}