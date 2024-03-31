package com.users;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserVO {
	private String userId;
	private String userName;
	private String password;
	private String address;
	private String phoneNumber;
	private String gender;
}
