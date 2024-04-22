package com.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.tomcat.util.http.fileupload.FileUtils;

import com.controller.databaseConnection.db_connection;
import com.controller.general.EncryptionLogin;
import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;
import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;



/**
 * Servlet implementation class SignUP
 */

@WebServlet("/upload")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // Set the size threshold for storing data in memory
    maxFileSize = 1024 * 1024 * 10, // Set the maximum size of a file that can be uploaded
    maxRequestSize = 1024 * 1024 * 50 // Set the maximum size of a request (including file + form data)
)
public class SignUP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		Part file = request.getPart("user_image");
		
		String imageFileName = file.getSubmittedFileName(); //get the file name of the selected image
		
	
		String uploadpath = "/Users/mac/eclipse-workspace/eclipse-workspace-web/themesh/src/main/webapp/image_users/"+ imageFileName;/*
		path for uploading the image*/
	
		
		
		//code for uploading the image into the folder
		try {
		FileOutputStream fos = new FileOutputStream(uploadpath);
		InputStream fis = file.getInputStream();
		
		byte[]data = new byte[fis.available()];
		fis.read(data);
		fos.write(data);
		fos.close();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//connection to database
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection dc = new db_connection();
			EncryptionLogin el = new EncryptionLogin();
			Connection con = dc.getConnect();
		
			String user_name = request.getParameter("user_name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String password = request.getParameter("password");
			String address = request.getParameter("user_address");
			String gender = request.getParameter("gender");
			
			String query = "INSERT INTO `users`( `email`, `password`, `user_name`, `is_admin`, `image_user`, `gender`, `user_address`, `user_phone`) VALUES (?,?,?,?,?,?,?,?)";

			
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1,email);
			ps.setString(2,el.encrypt(password));
			ps.setString(3,user_name);
			ps.setInt(4,2);
			ps.setString(5,imageFileName);
			ps.setString(6, gender);
			ps.setString(7,address);
			
			
			ps.setString(8,phone);
			int count = ps.executeUpdate();
			
			if(count>0) {
				out.println("Value added successfully");
				response.sendRedirect("Users View/home.jsp");
			}else {
				out.println("Not executed");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}