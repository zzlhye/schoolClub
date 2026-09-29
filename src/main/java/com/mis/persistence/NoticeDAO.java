package com.mis.persistence;

import java.util.List;

import com.mis.domain.NoticeFileVO;
import com.mis.domain.NoticeVO;

public interface NoticeDAO {

	public void create(NoticeVO vo) throws Exception;

	public NoticeVO read(int noticeNum) throws Exception;

	public void update(NoticeVO vo) throws Exception;

	public void delete(int noticeNum) throws Exception;

	public List<NoticeVO> mainNoticeList() throws Exception; // 메인화면 5개 목록
	
	public List<NoticeVO> noticeList() throws Exception;

	public void viewCount(int noticeNum) throws Exception; // 조회 수

	public void insertFile(NoticeFileVO vo) throws Exception; // 파일 등록

	public void deleteFile(int noticeNum) throws Exception; // 파일 삭제
	
	public void onlyFileDelete(int fileNum) throws Exception; // 파일만 삭제

	public List<NoticeFileVO> fileList(int noticeNum) throws Exception; // 파일 목록

}
