package com.mis.domain;

import java.util.Date;

public class NoticeFileVO {

	private int fileNum;
	private String title;
	private Date regDate;
	private int noticeNum;
	private String files;
	
	
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getFiles() {
		return files;
	}
	public void setFiles(String files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "NoticeFileVO [fileNum=" + fileNum + ", title=" + title + ", regDate=" + regDate + ", noticeNum="
				+ noticeNum + ", files=" + files + "]";
	} 
}
