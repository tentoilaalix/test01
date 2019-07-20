package com.solfood.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.solfood.dto.MemberVO;
import com.solfood.dto.ProductVO;

public interface MemberService {
	
	/* 회원조회 */
    public List<MemberVO> selectMember() throws Exception;

	/* 회원가입 */
	public void joinMember(MemberVO vo) throws Exception;

	/* 로그인 */
	public MemberVO login(MemberVO vo);						// login
    public MemberVO viewMember(MemberVO vo);				// 회원 로그인 정보
    public void logout(HttpSession session);				// 회원 로그아웃

	public void updateMyAccount(MemberVO memberVo) throws Exception;	//회원 정보수정
	public void deleteMyAccount(MemberVO memberVo) throws Exception; 	//회원 탈퇴

	public int check_id(String account_user);

	public int check_email(String account_email);
    
    
	
}



