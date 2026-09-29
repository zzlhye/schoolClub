package com.mis.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mis.domain.ClubBoardVO;
import com.mis.domain.ClubVO;
import com.mis.domain.NoticeVO;
import com.mis.service.ClubBoardService;
import com.mis.service.ClubMemberService;
import com.mis.service.ClubService;
import com.mis.service.NoticeService;

@Controller
public class HomeController {

	@Inject
	private NoticeService noticeService;

	@Inject
	private ClubService clubService;

	@Inject
	private ClubBoardService boardService;

	@Inject
	private ClubMemberService clubMemberService;

	@GetMapping("/")
	public String home(Model model) throws Exception {

		// 동아리 수
		model.addAttribute("countClub", clubService.countClub());

		// 동아리 회원 수
		model.addAttribute("countClubMember", clubMemberService.countClubMember());

		// 최근 공지사항 5개
		List<NoticeVO> mainNoticeList = noticeService.mainNoticeList();
		model.addAttribute("mainNoticeList", mainNoticeList);

		// 동아리 목록 5개
		List<ClubVO> mainClubList = clubService.mainClubList();
		model.addAttribute("mainClubList", mainClubList);

		// 동아리 게시판 목록 5개
		List<ClubBoardVO> mainBoardList = boardService.mainBoardList();
		model.addAttribute("mainBoardList", mainBoardList);

		return "main";
	}
}