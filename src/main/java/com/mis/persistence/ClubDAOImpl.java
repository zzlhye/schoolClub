package com.mis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.ClubVO;

@Repository
public class ClubDAOImpl implements ClubDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.mis.mapper.ClubMapper";

	@Override
	public void create(ClubVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public ClubVO read(int clubNum) throws Exception {
		return session.selectOne(namespace + ".read", clubNum);
	}

	@Override
	public void update(ClubVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int clubNum) throws Exception {
		session.delete(namespace + ".delete", clubNum);
	}

	@Override
	public void deleteMember(String studentId) throws Exception {
		session.delete(namespace + ".deleteMember", studentId);
	}
	
	@Override
	public List<ClubVO> mainClubList() throws Exception {
		return session.selectList(namespace + ".mainClubList");
	}

	@Override
	public List<ClubVO> clubList() throws Exception {
		return session.selectList(namespace + ".clubList");
	}

	@Override
	public List<ClubVO> myClubList(String studentId) throws Exception {
		return session.selectList(namespace + ".myClubList", studentId);
	}

	@Override
	public int countClub() throws Exception { 
		return session.selectOne(namespace + ".countClub");
	}


}
