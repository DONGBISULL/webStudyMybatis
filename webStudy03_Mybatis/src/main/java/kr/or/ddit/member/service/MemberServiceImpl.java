package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.commons.UserNotFoundException;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.vo.MemberVO;


public class MemberServiceImpl implements MemberService {

	private static MemberServiceImpl self ;
	private MemberDAO dao  =MemberDaoImpl.getInstance();
	
	 
	
	private MemberServiceImpl() {
		super();
	
	}


	public static MemberServiceImpl getInstance() {
		if(self==null) {
			self = new MemberServiceImpl();
		}
		return self;
	}
	
	
	@Override
	public ServiceResult createMemberVO(MemberVO member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> retrieveMemberList() {
		List<MemberVO> memList = dao.selectMemebrList();
		return memList;
	}

 
	@Override
	public ServiceResult modifyMember(MemberVO vo) {
		// TODO Auto-generated method stub
		MemberVO savedMember = 	retrieveMember(vo.getMemId());
		String savedPass = savedMember.getMemPass();
		String inputPass = vo.getMemPass();
		ServiceResult result = null;
		if(savedPass.equals(inputPass)) {
			
			int rowcnt  = dao.updateMember(vo);
			if(rowcnt>0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAIL;
			}
		}else {
			result = ServiceResult.INVALIDPASSWORD;
		}
		return  result;
	}

	@Override
	public ServiceResult removeMember(MemberVO vo) {
		MemberVO savedMember = retrieveMember(vo.getMemId());
		String savedPass = savedMember.getMemPass();
		String inputPass = vo.getMemPass();
		ServiceResult result = null;
		if(savedPass.equals(inputPass)) {
			int cnt = dao.deleteMember(vo.getMemId());
			System.out.println("dao");
			if(cnt> 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAIL;
			}
			
		}else {
			result = ServiceResult.INVALIDPASSWORD;
		}
		
		
		
		return result;
	}


	@Override
	public MemberVO retrieveMember(String mem_id) {
			MemberVO vo = dao.selectMemberDetail(mem_id);
		 
			if(vo==null) {
				throw new UserNotFoundException(String.format("%s 회원이 존재하지 않습니다", mem_id));
			}
			
			
				return vo;
			
			
		
	}


 
}