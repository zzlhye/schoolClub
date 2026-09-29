package com.mis.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mis.domain.MemberVO;
import com.mis.dto.LoginDTO;
import com.mis.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService memberService;

	// 로그인 페이지
	@GetMapping("/login")
	public void loginGET() throws Exception {
	}

	// 로그인 처리
	@PostMapping("/loginPost")
	public String loginPost(LoginDTO dto, HttpSession session, RedirectAttributes rttr) throws Exception {

		MemberVO member = memberService.login(dto);

		// 로그인 실패 시
		if (member == null) {
			rttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return "redirect:/member/login";
		}

		// 로그인 성공 시 세션에 회원 정보 저장
		session.setAttribute("loginUser", member);

		return "redirect:/";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

	// 회원가입 페이지
	@GetMapping("/join")
	public void memberJoinGET() throws Exception {
	}

	// 회원가입 처리
	@PostMapping("/join")
	public String memberJoinPOST(MemberVO vo) throws Exception {

		memberService.create(vo);

		return "redirect:/member/login";
	}

	// 아이디 중복체크
	@ResponseBody
	@PostMapping("/idcheck")
	public int idcheck(@RequestParam("studentId") String studentId) throws Exception {

		int result = memberService.idCheck(studentId);

		return result;
	}
}