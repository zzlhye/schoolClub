package com.mis.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mis.domain.MemberVO;
import com.mis.domain.NoticeVO;
import com.mis.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Inject
	private NoticeService noticeService;

	// 등록 페이지
	@GetMapping("/register")
	public String register(HttpSession session) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		// 로그인 안 한 상태면 로그인 페이지로 이동
		if (member == null) {
			return "redirect:/member/login";
		}

		return "/notice/register";
	}

	// 등록 처리
	@PostMapping("/register")
	public String registerPOST(HttpSession session, NoticeVO vo) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		// 로그인 안 한 상태면 로그인 페이지로 이동
		if (member == null) {
			return "redirect:/member/login";
		}

		noticeService.create(vo);

		return "redirect:/notice/list";
	}

	// 목록
	@GetMapping("/list")
	public void list(Model model) throws Exception {

		List<NoticeVO> noticeList = noticeService.noticeList();
		model.addAttribute("noticeList", noticeList);
	}

	// 조회
	@GetMapping("/read")
	public void read(@RequestParam("noticeNum") int noticeNum, Model model) throws Exception {

		// 게시글
		model.addAttribute("notice", noticeService.read(noticeNum));

		// 첨부파일
		model.addAttribute("files", noticeService.fileList(noticeNum));
	}

	// 수정 페이지
	@GetMapping("/update")
	public void update(@RequestParam("noticeNum") int noticeNum, Model model) throws Exception {

		model.addAttribute("notice", noticeService.read(noticeNum));

		// 첨부파일
		model.addAttribute("files", noticeService.fileList(noticeNum));
	}

	// 수정 처리
	@PostMapping("/update")
	public String updatePOST(NoticeVO vo) throws Exception {

		noticeService.update(vo);

		return "redirect:/notice/read?noticeNum=" + vo.getNoticeNum();
	}

	// 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam("noticeNum") int noticeNum) throws Exception {

		noticeService.delete(noticeNum);

		return "redirect:/notice/list";
	}

	// 첨부파일 삭제
	@PostMapping("/onlyFileDelete")
	public String deleteFile(@RequestParam("fileNum") int fileNum, @RequestParam("noticeNum") int noticeNum)
			throws Exception {

		noticeService.onlyFileDelete(fileNum);

		return "redirect:/notice/update?noticeNum=" + noticeNum;
	}
}