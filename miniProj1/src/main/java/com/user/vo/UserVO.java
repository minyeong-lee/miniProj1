package com.user.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserVO {
	private String userid;
	private String username;
	private String userpassword;
	private String address;
	private String phoneNum;
	private String gender;
	
	private String userpassword2;
	private String err;
	//실행 명령 필드 
	private String action;

	//검색키
	private String searchKey;
	
	//uuid
	private String useruuid;
	
	//자동로그인 여부 
	private String autologin;
	

	public UserVO(String userid, String username, String userpassword, String address, String phoneNum, String gender) {
		this(userid, username, userpassword, address, phoneNum, gender, "", "", "", "", "", "");
	}
	
	
	public boolean isEmptySearchKey() {
		return searchKey == null || searchKey.length() == 0; 
	}
	
	public boolean isEqualPassword(UserVO userVO) {
		return userVO != null && userpassword.equals(userVO.getUserpassword());
	}
	
}
