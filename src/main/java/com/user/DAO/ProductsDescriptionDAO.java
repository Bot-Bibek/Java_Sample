package com.user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.controller.databaseConnection.db_connection;
import com.model.Products;

public class ProductsDescriptionDAO {
	
	public List<Products> getProductDescription(int product_id){
		
		List<Products> productDesc= new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection db= new db_connection();
	        Connection con = db.getConnect();
	        
	        String query = "Select * from products where product_id="+product_id;
	        PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
            	Products product= new Products();
            	
            	product.setProduct_id(rs.getInt("product_id"));
            	product.setCat_id(rs.getInt("cat_id"));
            	product.setBrand_id(rs.getInt("brand_id"));
            	product.setGender_id(rs.getInt("gender_id"));
            	product.setProduct_name(rs.getString("product_name"));
            	product.setProduct_price(rs.getInt("product_price"));
            	product.setStock(rs.getInt("stock"));
            	product.setProduct_desc(rs.getString("product_desc"));
            	product.setImg_path1(rs.getString("img_path1"));
            	product.setImg_path2(rs.getString("img_path2"));
            	product.setImg_path3(rs.getString("img_path3"));
            	
            	
            	
            	productDesc.add(product);
            }
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return productDesc;
	}

}
