package com.mis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mis.domain.BoardFileVO;
import com.mis.domain.ClubBoardVO;
import com.mis.persistence.ClubBoardDAO;

@Service
public class ClubBoardServiceImpl implements ClubBoardService {

	@Inject
	private ClubBoardDAO dao;

	@Override
	public void create(ClubBoardVO vo) throws Exception {

		// TextArea 줄바꿈 처리
		vo.setContent(vo.getContent().replaceAll("\\r?\\n", "<br>"));

		dao.create(vo);

		// 기본키 받아오기
		int boardNum = vo.getBoardNum();

		// 첨부파일 등록
		// 첨부파일 존재 여부 확인 (파일 업로드 했을 경우에만 실행, 업로드된 파일이 없다면 실행 안 함)
		if (vo.getFiles() != null) {

			// 다중 첨부파일 저장
			for (int i = 0; i < vo.getFiles().length; i++) {

				BoardFileVO fVo = new BoardFileVO();
				fVo.setBoardNum(boardNum); // 게시글 기본키
				fVo.setTitle(vo.getFiles()[i]); // 업로드된 첨부파일명

				dao.insertFile(fVo);
			}
		}
	}

	@Override
	public ClubBoardVO read(int boardNum) throws Exception {

		// 조회수 업데이트
		dao.viewCount(boardNum);

		// 게시글 조회
		return dao.read(boardNum);
	}

	@Override
	public void update(ClubBoardVO vo) throws Exception {

		// TextArea 줄바꿈 처리
		vo.setContent(vo.getContent().replaceAll("\\r?\\n", "<br>"));

		// 게시글 수정
		dao.update(vo);

		// 첨부파일 등록
		// 첨부파일 존재 여부 확인 (파일 업로드 했을 경우에만 실행, 업로드된 파일이 없다면 실행 안 함)
		if (vo.getFiles() != null) {

			// 다중 첨부파일 저장
			for (int i = 0; i < vo.getFiles().length; i++) {

				BoardFileVO fVo = new BoardFileVO();
				fVo.setBoardNum(vo.getBoardNum()); // 게시글 기본키
				fVo.setTitle(vo.getFiles()[i]); // 업로드된 첨부파일명

				dao.insertFile(fVo);
			}
		}
	}

	@Override
	public void delete(int boardNum) throws Exception {

		// 파일 삭제
		dao.deleteFile(boardNum);

		// 게시글 삭제
		dao.delete(boardNum);
	}

	@Override
	public void deleteClub(int clubNum) throws Exception {
		dao.deleteClub(clubNum);
	}

	@Override
	public void deleteMember(String studentId) throws Exception {
		dao.deleteMember(studentId);
	}

	@Override
	public List<ClubBoardVO> mainBoardList() throws Exception {
		return dao.mainBoardList();
	}

	@Override
	public List<ClubBoardVO> boardList() throws Exception {
		return dao.boardList();
	}

	@Override
	public List<BoardFileVO> fileList(int boardNum) throws Exception {
		return dao.fileList(boardNum);
	}

	@Override
	public void onlyFileDelete(int fileNum) throws Exception {
		dao.onlyFileDelete(fileNum);
	}

}
