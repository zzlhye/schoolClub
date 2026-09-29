package com.mis.domain;

import java.util.Date;

public class ClubMemberVO {

	private String studentId;
	private int clubNum;
	private Date regDate;
	private String name;
	private String major;
	private String email1;
	private String email2;
	private String phone;
	private String clubName;
	
	
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public int getClubNum() {
		return clubNum;
	}
	public void setClubNum(int clubNum) {
		this.clubNum = clubNum;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	@Override
	public String toString() {
		return "ClubMemberVO [studentId=" + studentId + ", clubNum=" + clubNum + ", regDate=" + regDate + ", name="
				+ name + ", major=" + major + ", email1=" + email1 + ", email2=" + email2 + ", phone=" + phone
				+ ", clubName=" + clubName + "]";
	}
	
	
	
}
