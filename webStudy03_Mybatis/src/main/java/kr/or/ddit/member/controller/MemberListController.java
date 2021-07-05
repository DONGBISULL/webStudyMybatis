package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/member/memberList.do")
public class MemberListController extends HttpServlet{
	//member service와의 의존관계
	MemberService service = MemberServiceImpl.getInstance();
	
	@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 //멤버리스트 라는 이름의 속성으로 회원 목록 공유 
	
		List<MemberVO> memList = service.retrieveMemberList();
		
		//req.setAttribute("memList", memList);
		req.setAttribute("memList", memList);
		
		
		String dest ="/WEB-INF/views/member/memberList.jsp";
		req.getRequestDispatcher(dest).forward(req, resp);
	
	
}


 
}
