package com.mis.service;

import java.util.List;

import com.mis.domain.BoardFileVO;
import com.mis.domain.ClubBoardVO;

public interface ClubBoardService {

	public void create(ClubBoardVO vo) throws Exception;

	public ClubBoardVO read(int boardNum) throws Exception;

	public void update(ClubBoardVO vo) throws Exception;

	public void delete(int boardNum) throws Exception;

	public void deleteClub(int clubNum) throws Exception; // 동아리 삭제 시 글 삭제

	public void deleteMember(String studentId) throws Exception; // 회원 삭제 시 글 삭제

	public List<ClubBoardVO> mainBoardList() throws Exception;

	public List<ClubBoardVO> boardList() throws Exception;

	public void onlyFileDelete(int fileNum) throws Exception;

	public List<BoardFileVO> fileList(int boardNum) throws Exception; // 해당 글의 파일

}
