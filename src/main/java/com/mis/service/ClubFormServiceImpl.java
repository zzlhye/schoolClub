package com.mis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mis.domain.ClubFormVO;
import com.mis.domain.ClubMemberVO;
import com.mis.persistence.ClubFormDAO;
import com.mis.persistence.ClubMemberDAO;

@Service
public class ClubFormServiceImpl implements ClubFormService {
	
	@Inject
	private ClubFormDAO dao;
	
	@Inject
	private ClubMemberDAO clubMemberDao;

	@Override
	public void create(ClubFormVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public ClubFormVO read(int formNum) throws Exception { 
		return dao.read(formNum);
	}

	@Override
	public ClubFormVO clubRead(ClubFormVO vo) throws Exception { 
		return dao.clubRead(vo);
	}

	@Override
	public void delete(int formNum) throws Exception {
		dao.delete(formNum);
	}

	@Override
	public void deleteClub(int clubNum) throws Exception {
		dao.deleteClub(clubNum);
	}

	@Override
	public void deleteClubMember(ClubMemberVO vo) throws Exception {
		dao.deleteClubMember(vo);
	}

	@Override
	public void deleteMember(String studentId) throws Exception {
		dao.deleteMember(studentId);
	}

	@Override
	public List<ClubFormVO> clubFormList(int clubNum) throws Exception { 
		return dao.clubFormList(clubNum);
	}

	@Override
	public List<ClubFormVO> myFormList(String studentId) throws Exception { 
		return dao.myFormList(studentId);
	}

	@Override
	public void updateApprove(int formNum, ClubMemberVO vo) throws Exception {
		
		dao.updateApprove(formNum); // 승인상태변경
		clubMemberDao.create(vo); // 회원테이블에 추가
	}

	@Override
	public void updateReject(int formNum) throws Exception {
		dao.updateReject(formNum);
	}


}
