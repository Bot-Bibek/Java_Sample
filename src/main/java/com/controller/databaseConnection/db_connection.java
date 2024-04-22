package com.controller.databaseConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class db_connection {
	public Connection getConnect() {
		Connection conn= null;
		
		try {
			conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_credentials.getDbname(),db_credentials.getUser(),db_credentials.getPassword());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

}
