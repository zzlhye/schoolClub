package com.mis.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

public class ClubBoardVO {

	private int boardNum;
	private String title;
	private String content;
	private Date regDate;
	private int viewCount;
	private String studentId;
	private String name;
	private int clubNum;
	private String clubName;
	private String[] files;
	private ArrayList<BoardFileVO> fileList; // 상세보기 file 여러 개 가져오기
	private int commentNum; // 댓글 번호
	
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getClubNum() {
		return clubNum;
	}
	public void setClubNum(int clubNum) {
		this.clubNum = clubNum;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public ArrayList<BoardFileVO> getFileList() {
		return fileList;
	}
	public void setFileList(ArrayList<BoardFileVO> fileList) {
		this.fileList = fileList;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	@Override
	public String toString() {
		return "ClubBoardVO [boardNum=" + boardNum + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", viewCount=" + viewCount + ", studentId=" + studentId + ", name=" + name + ", clubNum="
				+ clubNum + ", clubName=" + clubName + ", files=" + Arrays.toString(files) + ", fileList=" + fileList
				+ ", commentNum=" + commentNum + "]";
	}
	
}
