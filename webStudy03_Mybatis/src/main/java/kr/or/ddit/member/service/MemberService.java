package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.commons.UserNotFoundException;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.vo.MemberVO;

/**
 * 회원관리(CRUD) Business Logic Layer
 *
 */
public interface MemberService {
	/**
	 * 
	 * @param member
	 * @return PKDUPLICATED , OK  , FAIL
	 */
	public ServiceResult createMemberVO(MemberVO member);
	
	public List<MemberVO>retrieveMemberList();
	/**
	 * 
	 * @param mem_id
	 * @return 존재하지 않는 경우 {@link UserNotFoundException}
	 */
	public MemberVO retrieveMember(String mem_id);
	
	/**
	 * 
	 * @param vo
	 * @return 존재하지 않는 경우 ,{@link UserNotFoundException}
	 * 	INVALIDPASSWORD ,OK , FAIL
	 */
	public ServiceResult modifyMember(MemberVO vo);
	/**
	 * 
	 * @param vo
	 * @return 존재하지 않는 경우 ,{@link UserNotFoundException}
	 * 	INVALIDPASSWORD ,OK , FAIL
	 */
	public ServiceResult removeMember(MemberVO vo);
}
