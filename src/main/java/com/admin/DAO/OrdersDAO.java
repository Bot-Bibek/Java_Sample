package com.admin.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.controller.databaseConnection.db_connection;
import com.model.Orders;
public class OrdersDAO {
	
	public List<Orders> getAllOrders(){
		List<Orders> orderList= new ArrayList<>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection db= new db_connection();
	        Connection con = db.getConnect();
	        
	        String query = "Select * from orders";
	        PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
            	Orders order= new Orders();
            	order.setOrder_id(rs.getInt("order_id"));
            	order.setUser_id(rs.getInt("user_id"));
            	order.setOrder_date(rs.getDate("order_date"));
            	order.setTotal_amount(rs.getInt("total_amount"));
            	
            	orderList.add(order);
            }
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return orderList;
	}
	
	
	public List<Orders> getSearchOrders(String search){
		List<Orders> orderList= new ArrayList<>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			db_connection db= new db_connection();
	        Connection con = db.getConnect();
	        
	        String query="SELECT * FROM orders JOIN users ON users.user_id = orders.user_id WHERE users.user_name Like '%"+search+"%'";
	        PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
            	Orders order= new Orders();
            	order.setOrder_id(rs.getInt("order_id"));
            	order.setUser_id(rs.getInt("user_id"));
            	order.setOrder_date(rs.getDate("order_date"));
            	order.setTotal_amount(rs.getInt("total_amount"));
            	
            	orderList.add(order);
            }
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return orderList;
	}
	

}
