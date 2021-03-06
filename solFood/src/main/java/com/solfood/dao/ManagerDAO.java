package com.solfood.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.solfood.dto.BoardVO;
import com.solfood.dto.BuyVO;
import com.solfood.dto.MemberVO;
import com.solfood.dto.ProductVO;
import com.solfood.dto.TotalVO;
import com.solfood.utils.Criteria;
 
@Repository
public interface ManagerDAO {   
	
	public List<BuyVO> selectBuy() throws Exception;
	public List<BoardVO> selectBoard() throws Exception;
	
	
	/* 회원관리 */
	public List<MemberVO> selectMember() throws Exception;						//회원정보 조회
	public List<MemberVO> pageAccount(Criteria cri) throws Exception;			//회원페이지
	public int countAccount() throws Exception;									//회원페이지 : 카운트
	
	public MemberVO memberDetail(String account_user) throws Exception;			//회원정보 상세페이지
	public void updateMember(MemberVO vo) throws Exception;						//회원정보 수정
	public void deleteMember(MemberVO vo) throws Exception;						//회원정보 삭제
																				//회원등록 => MemberController
	
	/* 상품관리 */
	public List<ProductVO> selectProduct() throws Exception;					//상품조회
	public List<ProductVO> pageProduct(Criteria cri) throws Exception;			//상품페이지
	public int countProduct() throws Exception;									//상품페이지 : 카운트
	
	public ProductVO productDetail(int product_id) throws Exception;			//상품정보 상세페이지
	public void updateProduct(ProductVO vo) throws Exception;					//상품정보 수정
	public void deleteProduct(ProductVO vo) throws Exception;					//상품정보 삭제
	public void insertProduct(ProductVO vo) throws Exception;					//상품등록
	
	/* 레시피 관리 */
	public List<TotalVO> selectRecipe() throws Exception;						// 레시피 조회
	
	public TotalVO selectRecipeDetail(int recipe_id) throws Exception;			// 특정 레시피 조회 	
	public void insertRecipe(TotalVO vo) throws Exception;						// 레시피 등록 
	public void updateRecipe(TotalVO vo) throws Exception;						// 레시피 수정
	public void deleteRecipe(int recipe_id) throws Exception;					// 레시피 삭제

}
