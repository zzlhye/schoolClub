package com.mis.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mis.domain.ClubBoardVO;
import com.mis.domain.MemberVO;
import com.mis.service.ClubBoardService;
import com.mis.service.ClubService;

@Controller
@RequestMapping("/clubBoard")
public class ClubBoardController {

	@Inject
	private ClubBoardService boardService;

	@Inject
	private ClubService clubService;

	// 등록 페이지
	@GetMapping("/write")
	public String register(HttpSession session) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		// 로그인 안 한 상태면 로그인 페이지로 이동
		if (member == null) {
			return "redirect:/member/login";
		}

		return "/clubBoard/write";
	}

	// 등록 처리
	@PostMapping("/write")
	public String registerPOST(HttpSession session, ClubBoardVO vo) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		// 로그인 안 한 상태면 로그인 페이지로 이동
		if (member == null) {
			return "redirect:/member/login";
		}

		boardService.create(vo);

		return "redirect:/clubBoard/list";
	}

	// 등록 - 동아리 선택 목록
	@GetMapping("/clubList")
	public void clubList(Model model) throws Exception {

		model.addAttribute("clubList", clubService.clubList());
	}

	// 목록
	@GetMapping("/list")
	public void list(Model model) throws Exception {

		model.addAttribute("boardList", boardService.boardList());
	}

	// 조회
	@GetMapping("/read")
	public void read(@RequestParam("boardNum") int boardNum, Model model) throws Exception {

		// 게시글
		model.addAttribute("board", boardService.read(boardNum));

		// 첨부파일
		model.addAttribute("files", boardService.fileList(boardNum));
	}

	// 수정 페이지
	@GetMapping("/update")
	public void update(@RequestParam("boardNum") int boardNum, Model model) throws Exception {

		model.addAttribute("board", boardService.read(boardNum));

		// 첨부파일
		model.addAttribute("files", boardService.fileList(boardNum));
	}

	// 수정 처리
	@PostMapping("/update")
	public String updatePOST(ClubBoardVO vo) throws Exception {

		boardService.update(vo);

		return "redirect:/clubBoard/read?boardNum=" + vo.getBoardNum();
	}

	// 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam("boardNum") int boardNum) throws Exception {

		boardService.delete(boardNum);

		return "redirect:/clubBoard/list";
	}

	// 첨부파일 삭제
	@PostMapping("/onlyFileDelete")
	public String deleteFile(@RequestParam("fileNum") int fileNum, @RequestParam("boardNum") int boardNum)
			throws Exception {

		boardService.onlyFileDelete(fileNum);

		return "redirect:/clubBoard/update?boardNum=" + boardNum;
	}
}