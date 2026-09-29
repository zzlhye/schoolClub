package com.mis.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mis.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {

	@Inject
	private MemberService memberService;

	// 회원 목록
	@GetMapping("/memberList")
	public void list(Model model) throws Exception {

		model.addAttribute("memberList", memberService.memberList());
	}

	// 회원 조회
	@GetMapping("/memberRead")
	public void read(@RequestParam("studentId") String studentId, Model model) throws Exception {

		model.addAttribute("member", memberService.read(studentId));
	}

	// 회원 삭제
	@PostMapping("/memberDelete")
	public String delete(@RequestParam("studentId") String studentId) throws Exception {

		memberService.delete(studentId);

		return "redirect:/admin/memberList";
	}
}