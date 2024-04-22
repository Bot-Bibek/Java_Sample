package com.admin.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import com.controller.databaseConnection.db_connection;
import com.model.Categories;

public class CategoryDAO {
	
	public boolean addBrand(Categories category) {
		boolean inserted= false;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection db= new db_connection();
	        Connection con = db.getConnect();
	        
	        String query="INSERT INTO `categories` (`cat_name`) VALUES ('"+category.getCat_name()+"')";
	        PreparedStatement ps = con.prepareStatement(query);
	        int check=ps.executeUpdate();
	        
	        if (check>0) {
	        	inserted= true;
	        }
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return inserted;
	}

}
