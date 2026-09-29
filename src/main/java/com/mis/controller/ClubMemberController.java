package com.mis.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mis.domain.ClubMemberVO;
import com.mis.service.ClubMemberService;

@Controller
@RequestMapping("/clubMember")
public class ClubMemberController {

	@Inject
	private ClubMemberService clubMemberService;

	// 조회
	@GetMapping("/read")
	public void read(ClubMemberVO vo, Model model) throws Exception {

		model.addAttribute("clubMember", clubMemberService.read(vo));
	}

	// 삭제
	@PostMapping("/delete")
	public String delete(ClubMemberVO vo) throws Exception {

		clubMemberService.delete(vo);

		return "redirect:/mypage/clubRead?clubNum=" + vo.getClubNum();
	}
}