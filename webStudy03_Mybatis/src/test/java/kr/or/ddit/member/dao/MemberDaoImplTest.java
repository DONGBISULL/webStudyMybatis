package kr.or.ddit.member.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.vo.MemberVO;

public class MemberDaoImplTest {
	MemberDaoImpl dao ;
	@Before
	public void setUp() throws Exception {
		dao = MemberDaoImpl.getInstance();
	}

	@Test
	public void testSelectMemberById() {
	MemberVO member =  dao.selectMemberById("a001");
	System.out.println(member);
	assertNotNull(member);
	}
	/*
	@Test
	public void testInsertMember() {
		fail("Not yet implemented");
	}
*/
	@Test
	public void testSelectMemebrList() {
		List<MemberVO> list =  dao.selectMemebrList();
		//System.out.println(list);
		assertNotNull(list);
	}

@Test
	public void testSelectMemberDetail() {
		 MemberVO vo = dao.selectMemberDetail("a001");
		 assertNotNull(vo);
		 //System.out.println("details : " + vo);
	}
		
	@Test
	public void testDeleteMember() {
		 int rowcnt = dao.deleteMember("a001");
		 assertEquals(1, rowcnt);
	}


//	@Test
//	public void testUpdateMember() {
//		/*MemberVO vo = MemberVO.builder().memId("1234").memPass("asd").memName("룰루랄라").memBir("2021-01-01").memZip("wqer")
//					 .memAdd1("sdafsf").memAdd2("qweqwe12").memMail("Sadf").build();
//	*/
//		MemberVO member =	dao.selectMemberDetail("a001");
//		member.setMemName("김은대");
//		int rowcnt = dao.updateMember(member);
//		assertEquals(1, rowcnt);
//	
//	}
	/*

*/
}
