package com.user.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.user.vo.UserVO;


public class UserDAO {
    // 1. 회원가입 목록 만들기
    // 2. 삭제 구현
    // 3. 수정 구현
    // 4. 상세보기 구현
    // 5. 전체삭제 구현
    // 6. 등록 구현
    private static Connection conn = null;
    private static PreparedStatement userListPstmt = null;
    private static PreparedStatement userListPstmt2 = null;
    private static PreparedStatement userInsertPstmt = null;
    private static PreparedStatement userDeletePstmt = null;
    private static PreparedStatement userDetailPstmt = null;
    private static PreparedStatement userFormUUIDPstmt = null;//uuid를 이용하여 사용자 정보를 얻는다
    private static PreparedStatement userUpdateUUIDPstmt = null;//userid 이용하여 uuid를 변경한다 

    private static PreparedStatement userUpdatePstmt = null;
    private static PreparedStatement userDeleteAllPstmt = null;

    private static PreparedStatement userValidationIdPstmt = null;
    private static PreparedStatement userValidationPasswordPstmt = null;

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

            userListPstmt = conn.prepareStatement("select * from tb_users");
            userListPstmt2 = conn.prepareStatement("select * from tb_users where username like ?");
            userInsertPstmt = conn.prepareStatement("insert into tb_users (user_id, username, password, address, phone_number, gender) values (?, ?, ?, ?, ?, ?)");
            userDetailPstmt = conn.prepareStatement("select * from tb_users where user_id=?");
            
            userFormUUIDPstmt = conn.prepareStatement("select * from tb_users where useruuid=?");
            userUpdateUUIDPstmt = conn.prepareStatement("update tb_users set useruuid=? where user_id=?");

            userValidationIdPstmt = conn.prepareStatement("select user_id from tb_users where user_id=?  ");
            userValidationPasswordPstmt  = conn.prepareStatement("select password from tb_users whrere password=? ");
            //delete 가 되지 않았던 이유: ? 개수에 맞춰서 setString() 을 해주어야 한다.
            userDeletePstmt = conn.prepareStatement("delete from tb_users where user_id=?");
            userDeleteAllPstmt = conn.prepareStatement("delete from tb_users");
            userUpdatePstmt = conn.prepareStatement("update tb_users set username=?, password=?, address=?, phone_number=?, gender=? where user_id=?");
            
            
            // 5. 결과 처리
            // 6. 연결 해제
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public List<UserVO> list(UserVO user) {
        List<UserVO> list = new ArrayList<>();
        try {
        	ResultSet rs = null;
        	if (user != null && !user.isEmptySearchKey()) {
        		//검색 키워드 설정 
        		userListPstmt2.setString(1, user.getSearchKey());
        		rs = userListPstmt2.executeQuery();
        	} else {
                rs = userListPstmt.executeQuery();
        	}
            while (rs.next()) {
                UserVO users = new UserVO(rs.getString("user_id")
                        , rs.getString("username")
                        , rs.getString("password")
                        , rs.getString("address")
                        , rs.getString("phone_number")
                		, rs.getString("gender"));
                list.add(users);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public int insert(UserVO users){
        int updated = 0;
        try{
            userInsertPstmt.setString(1, users.getUserid());
            userInsertPstmt.setString(2, users.getUsername());
            userInsertPstmt.setString(3, users.getUserpassword());
            userInsertPstmt.setString(4, users.getAddress());
            userInsertPstmt.setString(5, users.getPhoneNum());
            userInsertPstmt.setString(6, users.getGender());
            updated = userInsertPstmt.executeUpdate();
            conn.commit();
        }catch (Exception e){
            e.printStackTrace();
        }
        return updated;
    }
    public UserVO read(UserVO user) {

        UserVO users = null;
        try {
            userDetailPstmt.setString(1, user.getUserid());

            ResultSet rs = userDetailPstmt.executeQuery();
            if (rs.next()) {
                users = new UserVO(rs.getString("user_id")
                        , rs.getString("username")
                        , rs.getString("password")
                        , rs.getString("address")
                        , rs.getString("phone_number")
                		, rs.getString("gender"));
            }
            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public int update(UserVO users) {
        int updated = 0;
        try {
            userInsertPstmt.setString(1, users.getUsername());
            userInsertPstmt.setString(2, users.getUserpassword());
            userInsertPstmt.setString(3, users.getAddress());
            userInsertPstmt.setString(4, users.getPhoneNum());
            userInsertPstmt.setString(5, users.getGender());
            userInsertPstmt.setString(6, users.getUserid());
            updated = userUpdatePstmt.executeUpdate();
            conn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return updated;

    }

    public int delete(UserVO user) {
        int updated = 0;

        try {
            userDeletePstmt.setString(1, user.getUserid());
            updated = userDeletePstmt.executeUpdate();
            conn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return updated;
    }

    public int clear() {
        int updated = 0;
        try {
            updated = userDeleteAllPstmt.executeUpdate();
            conn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return updated;
    }

    public boolean validationId(String userid){
        boolean result = false;
        try {
            userValidationIdPstmt.setString(1, userid);
            ResultSet rs = userValidationIdPstmt.executeQuery();
            if (rs.next()) {
                result = true;
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
    }
        return result;
    }

    public boolean  validationPassword(String userpassword){
        boolean result = false;
        try {
            userValidationPasswordPstmt.setString(1, userpassword);
            ResultSet rs = userValidationPasswordPstmt.executeQuery();
            if (rs.next()) {
                result = true;
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public int updateUUID(UserVO users) {
        int updated = 0;
        try {
            userUpdateUUIDPstmt.setString(1, users.getUseruuid());
            userUpdateUUIDPstmt.setString(2, users.getUserid());
            updated = userUpdateUUIDPstmt.executeUpdate();
            conn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return updated;

    }   
    
    public UserVO getUserVOFromUUID(UserVO user) {

        UserVO users = null;
        try {
            userFormUUIDPstmt.setString(1, user.getUseruuid());

            ResultSet rs = userFormUUIDPstmt.executeQuery();
            if (rs.next()) {
                users = UserVO.builder()
                		.userid(rs.getString("userid"))
                		.username(rs.getString("username"))
                		.userpassword(rs.getString("userpassword"))
                		.address(rs.getString("address"))
                		.phoneNum(rs.getString("phoneNum"))
                		.gender(rs.getString("gender"))
                		.useruuid(rs.getString("useruuid"))
                		.build();
            }
            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
   
}