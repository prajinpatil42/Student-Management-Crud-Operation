package com.coder.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static Connection conn=null;
	
	public static Connection getConn() {
		
		
		try {        
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db","root","9860949212");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return conn;
	}
	
	
	

}
