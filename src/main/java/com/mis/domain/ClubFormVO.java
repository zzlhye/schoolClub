package com.mis.domain;

import java.util.Date;

public class ClubFormVO {
	
	private int formNum;
	private String formTitle;
	private String formContent;
	private int status; // 1.승인대기  2.승인완료  3.승인거절 
	private Date regDate;
	private String studentId;
	private String name;
	private String major;
	private String email1;
	private String email2;
	private String phone;
	private int clubNum;
	private String clubName;
	
	
	public int getFormNum() {
		return formNum;
	}
	public void setFormNum(int formNum) {
		this.formNum = formNum;
	}
	public String getFormTitle() {
		return formTitle;
	}
	public void setFormTitle(String formTitle) {
		this.formTitle = formTitle;
	}
	public String getFormContent() {
		return formContent;
	}
	public void setFormContent(String formContent) {
		this.formContent = formContent;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	@Override
	public String toString() {
		return "ClubFormVO [formNum=" + formNum + ", formTitle=" + formTitle + ", formContent=" + formContent
				+ ", status=" + status + ", regDate=" + regDate + ", studentId=" + studentId + ", name=" + name
				+ ", major=" + major + ", email1=" + email1 + ", email2=" + email2 + ", phone=" + phone + ", clubNum="
				+ clubNum + ", clubName=" + clubName + "]";
	}
	
	
	
}
