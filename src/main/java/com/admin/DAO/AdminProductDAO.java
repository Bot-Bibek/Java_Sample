package com.admin.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.controller.databaseConnection.db_connection;
import com.model.Products;


public class AdminProductDAO {
	
	public List<com.model.Products> getAllProducts(){
		List<Products> productList= new ArrayList<>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection db= new db_connection();
	        Connection con = db.getConnect();
	        
	        String query = "Select product_id,product_name, product_price,stock,img_path1 from products";
	        PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
            	Products product= new Products();
            	product.setProduct_id(rs.getInt("product_id"));
            	product.setProduct_name(rs.getString("product_name"));
            	product.setProduct_price(rs.getInt("product_price"));
            	product.setStock(rs.getInt("stock"));
            	product.setImg_path1(rs.getString("img_path1"));
            	
            	productList.add(product);
            }
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return productList;
	}
	
	
	public List<Products> getSearchProducts(String search){
		List<Products> productList= new ArrayList<>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection db= new db_connection();
	        Connection con = db.getConnect();
	        
	        String query= "SELECT product_id,product_name,product_price,stock,img_path1 FROM products JOIN brand ON products.brand_id = brand.brand_id JOIN categories ON products.cat_id = categories.cat_id WHERE products.product_name Like '%"+search+"%' OR brand.brand_name Like '%"+search+"%'  OR categories.cat_name Like '%"+search+"%'";
	        PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
            	Products product= new Products();
            	product.setProduct_id(rs.getInt("product_id"));
            	product.setProduct_name(rs.getString("product_name"));
            	product.setProduct_price(rs.getInt("product_price"));
            	product.setStock(rs.getInt("stock"));
            	product.setImg_path1(rs.getString("img_path1"));
            	
            	productList.add(product);
            }
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return productList;
	}
	
	
	public boolean addProduct(Products product) {
		boolean inserted= false;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection db= new db_connection();
	        Connection con = db.getConnect();
	        
	        String query= "INSERT INTO `products` (`cat_id`, `brand_id`, `gender_id`, `product_name`, `product_price`, `img_path1`, `img_path2`, `img_path3`, `stock`, `product_desc`) VALUES (?,?,?,?,?,?,?,?,?,?)";
	        PreparedStatement ps = con.prepareStatement(query);
	        
	        ps.setInt(1, product.getCat_id());
	        ps.setInt(2, product.getBrand_id());
	        ps.setInt(3, product.getGender_id());
	        ps.setString(4, product.getProduct_name());
	        ps.setDouble(5,product.getProduct_price());
	        ps.setString(6, product.getImg_path1());
	        ps.setString(7, product.getImg_path2());
	        ps.setString(8, product.getImg_path3());
	        ps.setInt(9,product.getStock());
	        ps.setString(10,product.getProduct_desc());
	        
	        
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
