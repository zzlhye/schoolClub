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

import com.mis.domain.ClubFormVO;
import com.mis.domain.ClubMemberVO;
import com.mis.domain.ClubVO;
import com.mis.domain.MemberVO;
import com.mis.service.ClubFormService;
import com.mis.service.ClubMemberService;
import com.mis.service.ClubService;
import com.mis.service.MemberService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Inject
	private MemberService memberService;

	@Inject
	private ClubService clubService;

	@Inject
	private ClubMemberService clubMemberService;

	@Inject
	private ClubFormService formService;

	// 내 정보 조회
	@GetMapping("/read")
	public String mypageRead(HttpSession session, Model model) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		if (member == null) {
			return "redirect:/member/login";
		}

		model.addAttribute("member", member);

		return "/mypage/read";
	}

	// 내 정보 수정 페이지
	@GetMapping("/update")
	public String mypageUpdate(HttpSession session, @RequestParam("studentId") String studentId, Model model)
			throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		if (member == null) {
			return "redirect:/member/login";
		}

		model.addAttribute("member", memberService.read(studentId));

		return "/mypage/update";
	}

	// 내 정보 수정 처리
	@PostMapping("/update")
	public String mypageUpdatePOST(HttpSession session, MemberVO vo) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		if (member == null) {
			return "redirect:/member/login";
		}

		memberService.update(vo);

		// 회원 정보 수정 후 로그아웃
		session.invalidate();

		return "redirect:/member/login";
	}

	// 내가 개설한 동아리 목록
	@GetMapping("/clubList")
	public String myClubList(HttpSession session, Model model) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		if (member == null) {
			return "redirect:/member/login";
		}

		List<ClubVO> clubList = clubService.myClubList(member.getStudentId());

		model.addAttribute("myClubList", clubList);

		return "/mypage/clubList";
	}

	// 내가 개설한 동아리 상세
	@GetMapping("/clubRead")
	public void myClubRead(@RequestParam("clubNum") int clubNum, Model model) throws Exception {

		// 동아리 정보
		model.addAttribute("club", clubService.read(clubNum));

		// 동아리 회원 목록
		model.addAttribute("clubMemberList", clubMemberService.clubMemberList(clubNum));

		// 동아리 신청 현황
		model.addAttribute("clubFormList", formService.clubFormList(clubNum));
	}

	// 내가 참여 중인 동아리 및 신청 내역
	@GetMapping("/joinClub")
	public String myJoinClub(HttpSession session, Model model) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		if (member == null) {
			return "redirect:/member/login";
		}

		// 내가 가입한 동아리 목록
		List<ClubMemberVO> myJoinClubList = clubMemberService.memberClubList(member.getStudentId());

		model.addAttribute("myJoinClubList", myJoinClubList);

		// 동아리 신청 내역
		List<ClubFormVO> myClubFormList = formService.myFormList(member.getStudentId());

		model.addAttribute("myClubFormList", myClubFormList);

		return "/mypage/joinClub";
	}

}