package com.mis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.BoardFileVO;
import com.mis.domain.ClubBoardVO;

@Repository
public class ClubBoardDAOImpl implements ClubBoardDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "com.mis.mapper.ClubBoardMapper";

	@Override
	public void create(ClubBoardVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public ClubBoardVO read(int boardNum) throws Exception {
		return session.selectOne(namespace + ".read", boardNum);
	}

	@Override
	public void update(ClubBoardVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int boardNum) throws Exception {
		session.delete(namespace + ".delete", boardNum);
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
	public void deleteMemberFile(String studentId) throws Exception {
		session.delete(namespace + ".deleteMemberFile", studentId);
	}

	@Override
	public List<ClubBoardVO> mainBoardList() throws Exception {
		return session.selectList(namespace + ".mainBoardList");
	}

	@Override
	public List<ClubBoardVO> boardList() throws Exception {
		return session.selectList(namespace + ".boardList");
	}

	@Override
	public void viewCount(int boardNum) throws Exception {
		session.update(namespace + ".viewCount", boardNum);
	}

	@Override
	public void insertFile(BoardFileVO vo) throws Exception {
		session.insert(namespace + ".insertFile", vo);
	}

	@Override
	public void deleteFile(int boardNum) throws Exception {
		session.delete(namespace + ".deleteFile", boardNum);
	}

	@Override
	public List<BoardFileVO> fileList(int boardNum) throws Exception {
		return session.selectList(namespace + ".fileList", boardNum);
	}

	@Override
	public void onlyFileDelete(int fileNum) throws Exception {
		session.delete(namespace + ".onlyFileDelete", fileNum);
	}

}
