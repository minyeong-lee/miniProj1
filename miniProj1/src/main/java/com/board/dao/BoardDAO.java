package com.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.board.vo.BoardVO;

public class BoardDAO {
	private static Connection conn = null;
	private static PreparedStatement boardListPstmt = null;
	private static PreparedStatement boardListPstmt2 = null;
	private static PreparedStatement boardReadPstmt = null;
	private static PreparedStatement boardDeletePstmt = null;
	private static PreparedStatement boardClearPstmt = null;
	private static PreparedStatement boardUpdatePstmt = null;
	private static PreparedStatement boardInsertPstmt = null;
	
	
	static {
		try {
			//1. JDBC 드라이버 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			
			//2. DB 연결
			conn = DriverManager.getConnection(
					"jdbc:mariadb://localhost:3306/miniproj-db",
					"BITUSER",
					"1004"
			);
			//3. SQL 실행 객체 준비
			//4. SQL 실행
			System.out.println("연결 성공");
			conn.setAutoCommit(false);
			
			boardListPstmt = conn.prepareStatement("select * from tb_boards");
			boardListPstmt2 = conn.prepareStatement("select * from tb_boards where btitle like ?");
			boardReadPstmt = conn.prepareStatement("select * from tb_boards where bno=?");
			boardDeletePstmt = conn.prepareStatement("delete from tb_boards where bno=?");
			boardClearPstmt = conn.prepareStatement("delete from tb_boards");
			boardUpdatePstmt = conn.prepareStatement("update tb_boards set btitle=?, bcontent=? where bno=?");
			boardInsertPstmt = conn.prepareStatement("insert into tb_boards (btitle, bcontent, user_id) values(?, ?, ?)");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<BoardVO> list(BoardVO board) {
		List<BoardVO> list = new ArrayList<>();
		try {
			ResultSet rs = null;
			String searchKey = board.getSearchKey();
			if (searchKey != null && searchKey.length() != 0) {
				boardListPstmt2.setString(1, "%" + searchKey + "%");
				rs = boardListPstmt2.executeQuery();
			} else {
				rs = boardListPstmt.executeQuery();
			}
			
			while (rs.next()) {
				board = new BoardVO(rs.getInt("bno")
						, rs.getString("btitle")
						, rs.getString("bcontent")
						, rs.getString("user_id")
						, rs.getString("created_at"));
				list.add(board);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public BoardVO read(BoardVO board) {
		try {
			boardReadPstmt.setInt(1, board.getBno());
			ResultSet rs = boardReadPstmt.executeQuery();
			if (rs.next()) {
				board = new BoardVO(rs.getInt("bno")
						, rs.getString("btitle")
						, rs.getString("bcontent")
						, rs.getString("user_id")
						, rs.getString("created_at"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public int delete(BoardVO board) {
		int updated = 0;
		
		try {
			boardDeletePstmt.setInt(1, board.getBno());
			updated = boardDeletePstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updated;
	}
	
	public int clear() {
		int updated = 0;
		try {
			updated = boardClearPstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updated;
	}
	
	public int update(BoardVO board) {
		int updated = 0;
		try {
			boardUpdatePstmt.setString(1, board.getBtitle());
			boardUpdatePstmt.setString(2, board.getBcontent());
			boardUpdatePstmt.setInt(3, board.getBno());
			updated = boardUpdatePstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updated;
	}

	public int insert(BoardVO board) {
		int updated = 0;
		try {
			boardInsertPstmt.setString(1, board.getBtitle());
			boardInsertPstmt.setString(2, board.getBcontent());
			boardInsertPstmt.setString(3, board.getUserId());
			updated = boardInsertPstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updated;
	}
	
}
