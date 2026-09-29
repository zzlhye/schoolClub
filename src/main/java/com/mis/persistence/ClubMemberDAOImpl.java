package com.mis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.ClubMemberVO;

@Repository
public class ClubMemberDAOImpl implements ClubMemberDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.mis.mapper.ClubMemberMapper";

	@Override
	public void create(ClubMemberVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public ClubMemberVO read(ClubMemberVO vo) throws Exception {
		return session.selectOne(namespace + ".read", vo);
	}

	@Override
	public ClubMemberVO clubRead(int clubNum) throws Exception { 
		return session.selectOne(namespace + ".clubRead", clubNum);
	}

	@Override
	public void delete(ClubMemberVO vo) throws Exception {	 
		 session.delete(namespace + ".delete", vo);
	}

	@Override
	public void deleteClub(int clubNum) throws Exception {
		session.delete(namespace + ".deleteClub", clubNum);
	}

	@Override
	public void deleteMember(String studentId) throws Exception { 
		session.delete(namespace + ".deleteMember", studentId);
	}

	@Override
	public List<ClubMemberVO> clubMemberList(int clubNum) throws Exception { 
		return session.selectList(namespace + ".clubMemberList", clubNum);
	}

	@Override
	public List<ClubMemberVO> memberClubList(String studentId) throws Exception {
		return session.selectList(namespace + ".memberClubList", studentId);
	}

	@Override
	public int countClubMember() throws Exception { 
		return session.selectOne(namespace + ".countClubMember");
	}


}
