package com.users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class UserDAO {
	private static Connection conn = null;
	
	static {
		try {
			//1. JDBC 드라이버 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			
			//2. DB 연결
			conn = DriverManager.getConnection(
					"jdbc:mariadb://localhost:3306/",
					"BITUSER",
					"1004"
			);
			//3. SQL 실행 객체 준비
			//4. SQL 실행
			System.out.println("연결 성공");
			conn.setAutoCommit(false);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		System.out.println("연결 성공~~");
	}
}
