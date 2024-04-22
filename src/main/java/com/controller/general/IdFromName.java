package com.controller.general;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.controller.databaseConnection.db_connection;


public class IdFromName {
	
	public int getCat_id(String cat_name) {
		int cat_id=0;
		db_connection dc= new db_connection();
			
		String getCat_id="SELECT cat_id FROM categories WHERE cat_name ='"+cat_name+"'";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=dc.getConnect();
			PreparedStatement ps= con.prepareStatement(getCat_id);
				
				
			ResultSet rs=ps.executeQuery();
				
				
			while (rs.next()) {
				cat_id=Integer.parseInt(rs.getString("cat_id"));
				}
					
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cat_id;
			
	}
	
	public int getBrand_id(String brand_name) {
		int brand_id=0;
		db_connection dc= new db_connection();
			
		String getBrand_id="SELECT brand_id FROM brand WHERE brand_name ='"+brand_name+"'";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=dc.getConnect();
			PreparedStatement ps= con.prepareStatement(getBrand_id);
				
				
			ResultSet rs=ps.executeQuery();
				
				
			while (rs.next()) {
				brand_id=Integer.parseInt(rs.getString("brand_id"));
				}
					
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return brand_id;
			
	}
	
	public int getGender_id(String gender_name) {
		int gender_id=0;
		db_connection dc= new db_connection();
			
		String getGender_id="SELECT gender_id FROM gender WHERE gender_name ='"+gender_name+"'";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=dc.getConnect();
			PreparedStatement ps= con.prepareStatement(getGender_id);
				
				
			ResultSet rs=ps.executeQuery();
				
				
			while (rs.next()) {
				gender_id=Integer.parseInt(rs.getString("gender_id"));
				}
					
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  gender_id;
			
	}
		
}

