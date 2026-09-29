package com.mis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mis.domain.ClubMemberVO;
import com.mis.persistence.ClubFormDAO;
import com.mis.persistence.ClubMemberDAO;

@Service
public class ClubMemberServiceImpl implements ClubMemberService {
	
	@Inject
	private ClubMemberDAO dao;
	
	@Inject
	private ClubFormDAO clubFormDao;


	@Override
	public ClubMemberVO read(ClubMemberVO vo) throws Exception { 
		return dao.read(vo);
	}

	@Override
	public ClubMemberVO clubRead(int clubNum) throws Exception { 
		return dao.clubRead(clubNum);
	}

	@Override
	public void delete(ClubMemberVO vo) throws Exception {
		
		// 신청폼 삭제
		clubFormDao.deleteClubMember(vo);
		
		// 동아리 회원 삭제
		dao.delete(vo);
	}

	@Override
	public void deleteClub(int clubNum) throws Exception {
		dao.deleteClub(clubNum);
	}

	@Override
	public void deleteMember(String studentId) throws Exception {
		dao.deleteMember(studentId);
	}

	@Override
	public List<ClubMemberVO> clubMemberList(int clubNum) throws Exception { 
		return dao.clubMemberList(clubNum);
	}

	@Override
	public List<ClubMemberVO> memberClubList(String studentId) throws Exception { 
		return dao.memberClubList(studentId);
	}

	@Override
	public int countClubMember() throws Exception {  
		return dao.countClubMember();
	}


}
