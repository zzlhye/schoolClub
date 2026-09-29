package com.mis.service;

import java.util.List;

import com.mis.domain.ClubMemberVO;

public interface ClubMemberService {

	public ClubMemberVO read(ClubMemberVO vo) throws Exception;
	
	public ClubMemberVO clubRead(int clubNum) throws Exception;
	 
	public void delete(ClubMemberVO vo) throws Exception;

	public void deleteClub(int clubNum) throws Exception; // 동아리 삭제 시 동아리 회원 삭제

	public void deleteMember(String studentId) throws Exception; // 회원 삭제 시 동아리 회원 삭제

	public List<ClubMemberVO> clubMemberList(int clubNum) throws Exception; // 해당 동아리 회원 목록

	public List<ClubMemberVO> memberClubList(String studentId) throws Exception; // 내가 가입한 동아리 목록
	
	public int countClubMember() throws Exception;

}
