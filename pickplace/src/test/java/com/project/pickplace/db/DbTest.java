package com.project.pickplace.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbTest {

	public static void main(String[] args) {
		try {
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", 
										  "pickplace", "pickplace");
			System.out.println(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
