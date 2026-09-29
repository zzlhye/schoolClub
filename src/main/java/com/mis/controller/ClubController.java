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
import com.mis.service.ClubMemberService;
import com.mis.service.ClubService;

@Controller
@RequestMapping("/club")
public class ClubController {

	@Inject
	private ClubService clubService;

	@Inject
	private ClubFormService formService;

	@Inject
	private ClubMemberService clubMemberService;

	// 등록 페이지
	@GetMapping("/register")
	public String register(HttpSession session) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		// 로그인하지 않은 경우 로그인 페이지로 이동
		if (member == null) {
			return "redirect:/member/login";
		}

		return "/club/register";
	}

	// 등록 처리
	@PostMapping("/register")
	public String registerPOST(HttpSession session, ClubVO vo) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		// 로그인하지 않은 경우 로그인 페이지로 이동
		if (member == null) {
			return "redirect:/member/login";
		}

		clubService.create(vo);

		return "redirect:/club/list";
	}

	// 목록
	@GetMapping("/list")
	public void list(Model model) throws Exception {

		model.addAttribute("clubList", clubService.clubList());
	}

	// 조회
	@GetMapping("/read")
	public void read(@RequestParam("clubNum") int clubNum, HttpSession session, Model model) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		// 동아리 정보 조회
		model.addAttribute("club", clubService.read(clubNum));

		// 로그인한 경우 신청 및 가입 정보 조회
		if (member != null) {

			ClubFormVO form = new ClubFormVO();
			form.setClubNum(clubNum);
			form.setStudentId(member.getStudentId());

			model.addAttribute("clubForm", formService.clubRead(form));

			ClubMemberVO clubMember = new ClubMemberVO();
			clubMember.setClubNum(clubNum);
			clubMember.setStudentId(member.getStudentId());

			model.addAttribute("clubMember", clubMemberService.read(clubMember));
		}
	}

	// 수정 페이지
	@GetMapping("/update")
	public void update(@RequestParam("clubNum") int clubNum, Model model) throws Exception {

		model.addAttribute("club", clubService.read(clubNum));
	}

	// 수정 처리
	@PostMapping("/update")
	public String updatePOST(ClubVO vo) throws Exception {

		clubService.update(vo);

		return "redirect:/club/read?clubNum=" + vo.getClubNum();
	}

	// 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam("clubNum") int clubNum) throws Exception {

		clubService.delete(clubNum);

		return "redirect:/club/list";
	}
}