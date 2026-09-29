package com.mis.service;

import java.util.List;

import com.mis.domain.MemberVO;
import com.mis.dto.LoginDTO;

public interface MemberService {
	
	public int idCheck(String studentId) throws Exception;
	
	public MemberVO login(LoginDTO dto) throws Exception;

	public void create(MemberVO vo) throws Exception;

	public MemberVO read(String studentId) throws Exception;

	public void update(MemberVO vo) throws Exception;

	public void delete(String studentId) throws Exception;

	public List<MemberVO> memberList() throws Exception;

}
