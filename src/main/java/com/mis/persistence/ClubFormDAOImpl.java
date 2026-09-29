package com.mis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.ClubFormVO;
import com.mis.domain.ClubMemberVO;

@Repository
public class ClubFormDAOImpl implements ClubFormDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.mis.mapper.ClubFormMapper";

	@Override
	public void create(ClubFormVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public ClubFormVO read(int formNum) throws Exception { 
		return session.selectOne(namespace + ".read", formNum);
	}

	
	@Override
	public ClubFormVO clubRead(ClubFormVO vo) throws Exception { 
		return session.selectOne(namespace + ".clubRead", vo);
	}
	
	@Override
	public void delete(int formNum) throws Exception {
		session.delete(namespace + ".delete", formNum);
	}

	@Override
	public void deleteClub(int clubNum) throws Exception {
		session.delete(namespace + ".deleteClub", clubNum);
	}

	@Override
	public void deleteClubMember(ClubMemberVO vo) throws Exception {
		 session.delete(namespace + ".deleteClubMember", vo);
	}

	@Override
	public void deleteMember(String studentId) throws Exception {
		session.delete(namespace + ".deleteMember", studentId);
	}

	@Override
	public List<ClubFormVO> clubFormList(int clubNum) throws Exception {
		return session.selectList(namespace + ".clubFormList", clubNum);
	}

	@Override
	public List<ClubFormVO> myFormList(String studentId) throws Exception { 
		return session.selectList(namespace + ".myFormList", studentId);
	}

	@Override
	public void updateApprove(int formNum) throws Exception {
		session.update(namespace + ".updateApprove", formNum);
	}

	@Override
	public void updateReject(int formNum) throws Exception {
		session.update(namespace + ".updateReject", formNum);
	}

}
