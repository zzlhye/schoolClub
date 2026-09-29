package com.mis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mis.domain.MemberVO;
import com.mis.dto.LoginDTO;
import com.mis.persistence.ClubBoardDAO;
import com.mis.persistence.ClubDAO;
import com.mis.persistence.ClubFormDAO;
import com.mis.persistence.ClubMemberDAO;
import com.mis.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	@Inject
	private ClubFormDAO clubFormDao;

	@Inject
	private ClubMemberDAO clubMemberDao;

	@Inject
	private ClubBoardDAO clubBoardDao;

	@Inject
	private ClubDAO clubDao;

	@Override
	public int idCheck(String studentId) throws Exception {
		return dao.idCheck(studentId);
	}

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void create(MemberVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public MemberVO read(String studentId) throws Exception {
		return dao.read(studentId);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		dao.update(vo);
	}
	
	@Transactional
	@Override
	public void delete(String studentId) throws Exception {

		// 신청폼 삭제
		clubFormDao.deleteMember(studentId);

		// 동아리 회원 삭제
		clubMemberDao.deleteMember(studentId);
		
		// 회원이 작성한 게시글의 첨부파일 삭제
		clubBoardDao.deleteMemberFile(studentId);

		// 회원이 작성한 게시글 삭제
		clubBoardDao.deleteMember(studentId);

		// 동아리 삭제
		clubDao.deleteMember(studentId);

		// 회원 삭제
		dao.delete(studentId);
	}

	@Override
	public List<MemberVO> memberList() throws Exception {
		return dao.memberList();
	}

}
