package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.vo.MemberVO;

/**
 * 회원 관리(CRUD)를 위한 Persistense Layer 
 * 
 *
 */

 
public interface MemberDAO {
	public int insertMember(MemberVO member);
	public List<MemberVO> selectMemebrList();
	public MemberVO selectMemberDetail(String mem_id);
	
	/**
	 * 식별자(PK)로 레코드 조회 
	 * @param mem_id
	 * @return 존재하지 않을 경우 null 반환 
	 */
	public MemberVO selectMemberById(String mem_id); 
	
	
	public int updateMember(MemberVO member);
	public int deleteMember(String mem_id); //업데이트로 delete 항목에 
}
