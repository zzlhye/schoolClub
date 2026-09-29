package com.mis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mis.domain.ClubVO;
import com.mis.persistence.ClubBoardDAO;
import com.mis.persistence.ClubDAO;
import com.mis.persistence.ClubFormDAO;
import com.mis.persistence.ClubMemberDAO;

@Service
public class ClubServiceImpl implements ClubService {
	
	@Inject
	private ClubDAO dao;
	
	@Inject
	private ClubFormDAO clubFormDao;
	
	@Inject 
	private ClubMemberDAO clubMemberDao;
	
	@Inject
	private ClubBoardDAO clubBoardDao;

	@Override
	public void create(ClubVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public ClubVO read(int clubNum) throws Exception {
		return dao.read(clubNum);
	}

	@Override
	public void update(ClubVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(int clubNum) throws Exception {
		
		// 가입 신청서 삭제
		clubFormDao.deleteClub(clubNum);
		
		// 동아리 회원 삭제
		clubMemberDao.deleteClub(clubNum);
		
		// 동아리 게시글 삭제
		clubBoardDao.deleteClub(clubNum);
		
		// 동아리 삭제
		dao.delete(clubNum);
	}

	@Override
	public void deleteMember(String studentId) throws Exception {
		dao.deleteMember(studentId);
	}

	@Override
	public List<ClubVO> mainClubList() throws Exception { 
		return dao.mainClubList();
	}

	@Override
	public List<ClubVO> clubList() throws Exception { 
		return dao.clubList();
	}

	@Override
	public List<ClubVO> myClubList(String studentId) throws Exception { 
		return dao.myClubList(studentId);
	}

	@Override
	public int countClub() throws Exception { 
		return dao.countClub();
	}


}
