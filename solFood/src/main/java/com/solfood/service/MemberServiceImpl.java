package com.solfood.service;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import com.solfood.dao.MemberDAO;
import com.solfood.dto.MemberVO;
import com.solfood.dto.ProductVO;
 
@Service
public class MemberServiceImpl implements MemberService {
 
    @Inject
    private MemberDAO dao;
    
	/* 회원조회 */
    @Override
    public List<MemberVO> selectMember() throws Exception {
        return dao.selectMember();
    }

	/* 회원가입 */
	@Override
	public void joinMember(MemberVO vo) throws Exception {
		dao.joinMember(vo);
	}

	/* 로그인 */
	// 로그인
		@Override
		public MemberVO login(MemberVO vo) {
			return dao.login(vo);
		}
	
    // 회원 로그인 정보
    @Override
    public MemberVO viewMember(MemberVO vo) {
        return dao.viewMember(vo);
    }
    
    // 회원 로그아웃
    @Override
    public void logout(HttpSession session) {
        // 세션 변수 개별 삭제
        // session.removeAttribute("userId");
        // 세션 정보를 초기화 시킴
        session.invalidate();
    }

	
	@Override
	public void updateMyAccount(MemberVO memberVo) throws Exception {
		dao.updateMyAccount(memberVo);		
	}
	@Override
	public void deleteMyAccount(MemberVO memberVo) throws Exception {
		dao.deleteMyAccount(memberVo);
	}

	
	
}




