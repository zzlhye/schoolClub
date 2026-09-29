package com.mis.domain;

import java.util.Date;

public class MemberVO {
	
	private String studentId;
	private String pwd;
	private String major;
	private String name;
	private String email1;
	private String email2;
	private String phone;
	private int authority; // 1.사용자  3.관리자
	private Date regDate;
	
	
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "MemberVO [studentId=" + studentId + ", pwd=" + pwd + ", major=" + major + ", name=" + name + ", email1="
				+ email1 + ", email2=" + email2 + ", phone=" + phone + ", authority=" + authority + ", regDate="
				+ regDate + "]";
	}
	
	
}
