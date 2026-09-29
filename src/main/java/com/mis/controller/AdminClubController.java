package com.mis.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mis.domain.ClubVO;
import com.mis.service.ClubService;
import com.mis.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminClubController {

	@Inject
	private ClubService clubService;

	@Inject
	private MemberService memberService;

	// 동아리 조회
	@GetMapping("/clubRead")
	public void read(@RequestParam("clubNum") int clubNum, Model model) throws Exception {

		model.addAttribute("club", clubService.read(clubNum));
	}

	// 동아리 수정 페이지
	@GetMapping("/clubUpdate")
	public void update(@RequestParam("clubNum") int clubNum, Model model) throws Exception {

		model.addAttribute("club", clubService.read(clubNum));
	}

	// 동아리 수정 처리
	@PostMapping("/clubUpdate")
	public String updatePost(ClubVO vo) throws Exception {

		clubService.update(vo);

		return "redirect:/club/list";
	}

	// 동아리 회장 수정 시 회원 선택
	@GetMapping("/memberCheck")
	public void memberCheck(Model model) throws Exception {

		model.addAttribute("memberList", memberService.memberList());
	}

	// 동아리 삭제
	@PostMapping("/clubDelete")
	public String delete(@RequestParam("clubNum") int clubNum) throws Exception {

		clubService.delete(clubNum);

		return "redirect:/club/list";
	}
}