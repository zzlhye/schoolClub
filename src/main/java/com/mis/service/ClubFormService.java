package com.mis.service;

import java.util.List;

import com.mis.domain.ClubFormVO;
import com.mis.domain.ClubMemberVO;

public interface ClubFormService {

	public void create(ClubFormVO vo) throws Exception;

	public ClubFormVO read(int formNum) throws Exception;

	public ClubFormVO clubRead(ClubFormVO vo) throws Exception;

	public void delete(int formNum) throws Exception;

	public void deleteClub(int clubNum) throws Exception; // 동아리 삭제 시 신청 폼 삭제

	public void deleteClubMember(ClubMemberVO vo) throws Exception; // 동아리 회원 삭제 시 신청 폼 삭제

	public void deleteMember(String studentId) throws Exception; // 회원 삭제 시 신청 폼 삭제

	public List<ClubFormVO> clubFormList(int clubNum) throws Exception; // 해당 동아리의 신청 폼 목록

	public List<ClubFormVO> myFormList(String studentId) throws Exception; // 내 신청 폼 목록

	public void updateApprove(int formNum, ClubMemberVO vo) throws Exception; // 가입 승인

	public void updateReject(int formNum) throws Exception; // 가입 거절

}
