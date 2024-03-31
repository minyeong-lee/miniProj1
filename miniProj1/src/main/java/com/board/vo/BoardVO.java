package com.board.vo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	private int bno;
	private String btitle;
	private String bcontent;
	private String userId;
	private String createdAt;
	
	//실행 명령 필드
	private String action;
	
	//검색키
	private String searchKey;
	

	public BoardVO(int bno, String btitle, String bcontent, String userId, String createdAt) {
		this(bno, btitle, bcontent, userId, createdAt, "", "");
	}
	
	public BoardVO(String btitle, String bcontent, String userId) {
		this(0, btitle, bcontent, userId, "", "", "");
	}

	public BoardVO(int bno, String btitle, String bcontent) {
		this(bno, btitle, bcontent, "", "", "", "");
	}
	
}
