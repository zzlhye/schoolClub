package com.mis.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mis.domain.ClubFormVO;
import com.mis.domain.ClubMemberVO;
import com.mis.domain.ClubVO;
import com.mis.domain.MemberVO;
import com.mis.service.ClubFormService;
import com.mis.service.ClubService;

@Controller
@RequestMapping("/clubForm")
public class ClubFormController {

	@Inject
	private ClubFormService formService;

	@Inject
	private ClubService clubService;

	// 가입 신청 페이지
	@GetMapping("/formWrite")
	public String register(@RequestParam("clubNum") int clubNum, Model model, HttpSession session) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		// 로그인 안 한 상태면 로그인 페이지로 이동
		if (member == null) {
			return "redirect:/member/login";
		}

		model.addAttribute("clubNum", clubNum);

		return "/clubForm/formWrite";
	}

	// 가입 신청 처리
	@PostMapping("/formWrite")
	public String registerPOST(HttpSession session, ClubFormVO vo) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		// 로그인 안 한 상태면 로그인 페이지로 이동
		if (member == null) {
			return "redirect:/member/login";
		}

		formService.create(vo);

		return "redirect:/club/read?clubNum=" + vo.getClubNum();
	}

	// 가입 신청 조회
	@GetMapping("/formRead")
	public String read(HttpSession session, @RequestParam("formNum") int formNum, Model model) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		// 로그인 안 한 상태면 로그인 페이지로 이동
		if (member == null) {
			return "redirect:/member/login";
		}

		// 신청 폼 정보
		ClubFormVO form = formService.read(formNum);
		model.addAttribute("form", form);

		// 신청 폼의 clubNum으로 동아리 정보 조회
		ClubVO club = clubService.read(form.getClubNum());
		model.addAttribute("club", club);

		return "/clubForm/formRead";
	}

	// 가입 승인
	@PostMapping("/approve")
	public String approve(@RequestParam("formNum") int formNum, ClubMemberVO vo) throws Exception {

		formService.updateApprove(formNum, vo);

		return "redirect:/mypage/clubRead?clubNum=" + vo.getClubNum();
	}

	// 가입 거절
	@PostMapping("/reject")
	public String reject(@RequestParam("formNum") int formNum, ClubFormVO vo) throws Exception {

		formService.updateReject(formNum);

		return "redirect:/mypage/clubRead?clubNum=" + vo.getClubNum();
	}
}