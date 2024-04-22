package com.controller.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.controller.databaseConnection.db_connection;
import com.model.Carts;

public class DisplayCartItems {
	db_connection dc = new db_connection();
	Connection con = dc.getConnect();
	
	public  ArrayList<Carts> getCartProducts(ArrayList<Carts> cartList){ //method to fetch all the products in the cart
		ArrayList<Carts> cartProducts = new ArrayList<Carts>();
		
		try {
			if(cartList.size() > 0) {
				
				for(Carts each:cartList) {
					String query = "select * from products where product_id = ?";
					PreparedStatement ps = con.prepareStatement(query);
					ps.setInt(1,each.getProduct_id());
					ResultSet rs = ps.executeQuery();
					
					
					while(rs.next()) {
						//setting the values to the cart models of each product in the cart
						Carts cart = new Carts();
						cart.setProduct_id(rs.getInt("product_id"));
						cart.setProduct_name(rs.getString("product_name"));
						cart.setProduct_price(rs.getDouble("product_price"));
						cart.setProduct_desc(rs.getString("product_desc"));
						cart.setImg_path1(rs.getString("img_path1"));
						
						 //multiplies the quantity from the cart and price of each product
						cart.setTotalPrice(rs.getDouble("product_price") * each.getQuantity());
						cart.setQuantity(each.getQuantity());
						//adding the cart object in the cartProducts arraylist
						
						cartProducts.add(cart);
						
		
				}
			}

			}
																																						
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return cartProducts;
		
		
	}
	
	//new method to get the total price of the cart
	
	public double cartTotalPrice(ArrayList<Carts> cartList){
		
		double sum = 0;
		try {
			if(cartList.size() > 0) {
				for(Carts item:cartList) {
					String query = "select product_price from products where product_id = ?";
					PreparedStatement ps = con.prepareStatement(query);
					ps.setInt(1,item.getProduct_id());
					ResultSet rs = ps.executeQuery();
					
					while(rs.next()){
						sum += rs.getDouble("product_price") * item.getQuantity();
					}
				}
			}
			
					
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return sum;
		}
	}
