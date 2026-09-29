package com.mis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.NoticeFileVO;
import com.mis.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.mis.mapper.NoticeMapper";

	@Override
	public void create(NoticeVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public NoticeVO read(int noticeNum) throws Exception { 
		return session.selectOne(namespace + ".read", noticeNum);
	}

	@Override
	public void update(NoticeVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int noticeNum) throws Exception {
		session.delete(namespace + ".delete", noticeNum);
	}
	
	@Override
	public List<NoticeVO> mainNoticeList() throws Exception {
		return session.selectList(namespace + ".mainNoticeList");
	}

	@Override
	public List<NoticeVO> noticeList() throws Exception { 
		return session.selectList(namespace + ".noticeList");
	}

	@Override
	public void viewCount(int noticeNum) throws Exception {
		session.update(namespace + ".viewCount", noticeNum);
	}

	@Override
	public void insertFile(NoticeFileVO vo) throws Exception {
		session.insert(namespace + ".insertFile", vo);
	}

	@Override
	public void deleteFile(int noticeNum) throws Exception {
		session.delete(namespace + ".deleteFile", noticeNum);
	}

	
	@Override
	public void onlyFileDelete(int fileNum) throws Exception {
		 session.delete(namespace + ".onlyFileDelete", fileNum);
	}

	@Override
	public List<NoticeFileVO> fileList(int noticeNum) throws Exception { 
		return session.selectList(namespace + ".fileList", noticeNum);
	}


}
