package com.mis.dto;

public class LoginDTO {

	private String studentId;
	private String pwd;

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

	@Override
	public String toString() {
		return "LoginDTO [studentId=" + studentId + ", pwd=" + pwd + "]";
	}

}
