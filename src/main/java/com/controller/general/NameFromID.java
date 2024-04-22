package com.controller.general;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class NameFromID {
	private com.controller.databaseConnection.db_connection db;
	private Connection con;
	private ResultSet rs;
	private PreparedStatement ps;
	
	public NameFromID(){
		this.db= new com.controller.databaseConnection.db_connection();
		this.con= this.db.getConnect();
	}
	
	public String getUserName(int user_id) {
		String userName= "";
		String query= "Select user_name from users Where user_id="+user_id;
		
		try {
			this.ps= con.prepareStatement(query);
			this.rs= this.ps.executeQuery();
			
			while(rs.next()) {
				userName=this.rs.getString("user_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userName;
		
	}
	
	public String getCatName(int cat_id) {
		String catName= "";
		String query= "Select cat_name from categories Where cat_id="+cat_id;
		
		try {
			this.ps= con.prepareStatement(query);
			this.rs= this.ps.executeQuery();
			
			while(rs.next()) {
				catName=this.rs.getString("cat_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return catName;
		
	}

	public String getGenderName(int gender_id) {
		String genderName= "";
		String query= "Select gender_name from gender Where gender_id="+gender_id;
		
		try {
			this.ps= con.prepareStatement(query);
			this.rs= this.ps.executeQuery();
			
			while(rs.next()) {
				genderName=this.rs.getString("gender_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return genderName;
		
	}

	public String getBrandName(int brand_id) {
		String brandName= "";
		String query= "Select brand_name from brand Where brand_id="+brand_id;
		
		try {
			this.ps= con.prepareStatement(query);
			this.rs= this.ps.executeQuery();
			
			while(rs.next()) {
				brandName=this.rs.getString("brand_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return brandName;
		
	}
}
