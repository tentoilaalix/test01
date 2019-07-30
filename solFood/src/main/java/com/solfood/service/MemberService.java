package com.solfood.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.solfood.dto.MemberVO;
<<<<<<< HEAD
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
=======

public interface MemberService {
	// 로그인 
	public MemberVO login(MemberVO vo);									// login
    public MemberVO viewMember(MemberVO vo);							// 회원 로그인 정보
    public void logout(HttpSession session);							// 회원 로그아웃
	
	// 회원가입
    public List<MemberVO> selectMember() throws Exception;				// 회원 정보조회
	public void joinMember(MemberVO vo) throws Exception;				// 회원 가입
	public int check_id(String account_user) throws Exception;			// 아이디 체크
	public int check_email(String account_email) throws Exception;		// 이메일 체크
	public void updateMyAccount(MemberVO memberVo) throws Exception;	// 회원 정보수정
	public void deleteMyAccount(MemberVO memberVo) throws Exception; 	// 회원 탈퇴
>>>>>>> refs/remotes/origin/mergeWithDY
    
    
	
}



