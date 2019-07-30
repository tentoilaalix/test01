package com.solfood.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

<<<<<<< HEAD
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.solfood.dto.MemberVO;
 
@Repository
public interface MemberDAO {   
	
	
	
	 public MemberVO login(MemberVO vo);								// 로그인
	 public MemberVO viewMember(MemberVO vo);							// 회원 로그인 정보
	 public void logout(HttpSession session);							// 회원 로그아웃
	 
 	 public void joinMember(MemberVO vo) throws Exception;				//회원가입
	 public List<MemberVO> selectMember() throws Exception;				//회원정보 조회
	 public void updateMyAccount(MemberVO memberVo) throws Exception;	//회원정보 수정
	 public void deleteMyAccount(MemberVO memberVo) throws Exception;	//회원탈퇴
	 
	 /* 아이디 중복 검사 */
	 /*
	  * public int check_id(String account_user) throws Exception{ return
	  * sqlsession.selectOne("member.check_id", account_user); }
	  */
	 
	 /* 이메일 중복 검사 */
=======
import org.springframework.stereotype.Repository;

import com.solfood.dto.MemberVO;
 
@Repository
public interface MemberDAO {   
	// 로그인
	 public MemberVO login(MemberVO vo);								// 로그인
	 public MemberVO viewMember(MemberVO vo);							// 회원 로그인 정보
	 public void logout(HttpSession session);							// 회원 로그아웃
	 
	 // 회원가입
 	 public void joinMember(MemberVO vo) throws Exception;				//회원가입
 	 public int check_id(String account_user) throws Exception;			//아이디 중복 체크
 	 public int check_email(String account_email) throws Exception;		//이메일 중복 체크
	 public List<MemberVO> selectMember() throws Exception;				//회원정보 조회
	 public void updateMyAccount(MemberVO memberVo) throws Exception;	//회원정보 수정
	 public void deleteMyAccount(MemberVO memberVo) throws Exception;	//회원탈퇴
>>>>>>> refs/remotes/origin/mergeWithDY
	 
		

}
    



