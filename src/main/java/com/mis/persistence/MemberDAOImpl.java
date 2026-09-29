package com.mis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.MemberVO;
import com.mis.dto.LoginDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.mis.mapper.MemberMapper";
	
	@Override
	public int idCheck(String studentId) throws Exception { 
		return session.selectOne(namespace + ".idCheck", studentId);
	}
	
	@Override
	public MemberVO login(LoginDTO dto) throws Exception { 
		return session.selectOne(namespace + ".login", dto);
	}

	@Override
	public void create(MemberVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public MemberVO read(String studentId) throws Exception {
		return session.selectOne(namespace + ".read", studentId);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		session.update(namespace + ".update", vo); 
		
	}

	@Override
	public void delete(String studentId) throws Exception {
		session.delete(namespace + ".delete", studentId);
	}

	@Override
	public List<MemberVO> memberList() throws Exception {
		return session.selectList(namespace + ".memberList");
	}


}
