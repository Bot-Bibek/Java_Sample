package com.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.controller.databaseConnection.db_connection;
import com.controller.general.EncryptionLogin;
import com.controller.general.UpdateUserImage;


import com.model.Users;


/**
 * Servlet implementation class UpdateDetails
 */

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // Set the size threshold for storing data in memory
	    maxFileSize = 1024 * 1024 * 10, // Set the maximum size of a file that can be uploaded
	    maxRequestSize = 1024 * 1024 * 50 // Set the maximum size of a request (including file + form data)
	)
public class UpdateUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EncryptionLogin el = new EncryptionLogin();
		PrintWriter out = response.getWriter();
		HttpSession sess = request.getSession();
		Users user = (Users)sess.getAttribute("users"); //getting the value from the session using users module
		
		int u_id = user.getUser_id();
		String old_user_image = user.getImage_user();
		
		
		
		//to get the updated values from the textfields
		String user_name = request.getParameter("user_name");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String phone_no = request.getParameter("phone_no");
		
		//part to work with photos
		Part photo = request.getPart("user_image");
		String user_image = null;
		  if (photo != null && photo.getSize() > 0){
			  
			  user_image = photo.getSubmittedFileName();
			  System.out.println("user image submitted is : "+ user_image);
			     
		    } else {
		    	user_image = old_user_image;
		    	System.out.println("It is  null");
		    	System.out.println("user image is" + user_image);
		        
		    }
		
		
		
		
		
		
		//setting the new value into the session and the module users
		user.setUser_name(user_name);
		user.setGender(gender);
		user.setUser_address(address);
		user.setPassword(password);
		user.setUser_phone(phone_no);
		user.setImage_user(user_image);
		
		
		
		
		
		
		try {
			//connecting to the database
			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection dc = new db_connection();
			Connection con = dc.getConnect();
			String new_pass = el.encrypt(password);
			
			
			//updating the values that have been placed in the textfields

			String query = "UPDATE `users` SET password = ?, user_name = ?, image_user = ?, gender = ?, user_address = ?, user_phone = ? WHERE user_id = ?; ";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, el.encrypt(password));
			ps.setString(2, user_name);
			ps.setString(3, user_image);
			ps.setString(4, gender);
			ps.setString(5, address);
			ps.setString(6, phone_no);
			ps.setInt(7, u_id);
			
			int count = ps.executeUpdate();
			
			//to check if the values have been updated or not
			if(count>0) { //if the values is updated to database
				System.out.println("Updated sucessfully");
			
				String oldphotopath = "/Users/mac/eclipse-workspace/eclipse-workspace-web/themesh/src/main/webapp/image_users/"+ old_user_image;
				String path = "/Users/mac/eclipse-workspace/eclipse-workspace-web/themesh/src/main/webapp/image_users/"+ user.getImage_user();
				UpdateUserImage.deletePhoto(oldphotopath); //deleting the previous file
				
				
				if (UpdateUserImage.savePhoto(photo.getInputStream(), path)) { //saving the new file
					out.println("Profile updated");
					response.sendRedirect("Users View/Profile.jsp");
				}
				

				
			}else {
				out.println("Not executed");
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}