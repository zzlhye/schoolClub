package com.mis.persistence;

import java.util.List;

import com.mis.domain.BoardFileVO;
import com.mis.domain.ClubBoardVO;

public interface ClubBoardDAO {

	public void create(ClubBoardVO vo) throws Exception;

	public ClubBoardVO read(int boardNum) throws Exception;

	public void update(ClubBoardVO vo) throws Exception;

	public void delete(int boardNum) throws Exception;

	public void deleteClub(int clubNum) throws Exception; // 동아리 삭제 시 글 삭제

	public void deleteMember(String studentId) throws Exception; // 회원 삭제 시 글 삭제

	public void deleteMemberFile(String studentId) throws Exception; // 회원이 작성한 게시글의 첨부파일 삭제

	public List<ClubBoardVO> mainBoardList() throws Exception; // 메인화면 5개 목록

	public List<ClubBoardVO> boardList() throws Exception;

	public void viewCount(int boardNum) throws Exception; // 조회 수

	public void insertFile(BoardFileVO vo) throws Exception; // 파일 등록

	public void deleteFile(int boardNum) throws Exception; // 파일 삭제

	public void onlyFileDelete(int fileNum) throws Exception; // 파일만 삭제

	public List<BoardFileVO> fileList(int boardNum) throws Exception; // 해당 글의 파일

}
