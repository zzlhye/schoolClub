package com.mis.service;

import java.util.List;

import com.mis.domain.ClubVO;

public interface ClubService {

	public void create(ClubVO vo) throws Exception;

	public ClubVO read(int clubNum) throws Exception;

	public void update(ClubVO vo) throws Exception;

	public void delete(int clubNum) throws Exception;

	public void deleteMember(String studentId) throws Exception; // 회원 삭제 시 동아리 삭제

	public List<ClubVO> mainClubList() throws Exception;
	
	public List<ClubVO> clubList() throws Exception;

	public List<ClubVO> myClubList(String studentId) throws Exception; // 내 동아리 목록
	
	public int countClub() throws Exception;

}
