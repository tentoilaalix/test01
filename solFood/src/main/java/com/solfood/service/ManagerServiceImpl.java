package com.solfood.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.solfood.dao.ManagerDAO;
import com.solfood.dto.BoardVO;
import com.solfood.dto.BuyVO;
import com.solfood.dto.MemberVO;
import com.solfood.dto.ProductVO;
import com.solfood.utils.Criteria;
 
@Service
public class ManagerServiceImpl implements ManagerService {
   
	@Inject
    private ManagerDAO dao;
    
    //-------------------------------------------------------
    //	product
    //-------------------------------------------------------
	/* 상품 조회 */
	@Override
	public List<ProductVO> selectProduct() throws Exception {
		 return dao.selectProduct();
	}
	
	/* 상품정보 업데이트 */
	@Override
	public void updateProduct(ProductVO vo) throws Exception {
		dao.updateProduct(vo);
	}
	/* 상품정보 삭제 */
	@Override
	public void deleteProduct(ProductVO vo) throws Exception{
		dao.deleteProduct(vo);
	}
	/* 상품등록 */
	@Override
	public void insertProduct(ProductVO vo) throws Exception {
		dao.insertProduct(vo);
	}
	
	
	
	//-------------------------------------------------------
    //	ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴ
    //-------------------------------------------------------
    

	@Override
	public List<BuyVO> selectBuy() throws Exception {
		 return dao.selectBuy();
	}

	@Override
	public List<BoardVO> selectBoard() throws Exception {
		 return dao.selectBoard();
	}
	
	//-------------------------------------------------------
    //	account
    //-------------------------------------------------------
	/* 회원조회 */
    @Override
    public List<MemberVO> selectMember() throws Exception {
        return dao.selectMember();
    }
	/* 회원정보 상세조회 */
	@Override
	public MemberVO memberDetail(String account_user) throws Exception {
		return dao.memberDetail(account_user);
	}
	/* 회원정보 수정 */
	@Override
	public void updateMember(MemberVO vo) throws Exception {
		dao.updateMember(vo);		
	}
	/* 회원정보 삭제 */
	@Override
	public void deleteMember(MemberVO vo) throws Exception {
		dao.deleteMember(vo);
	}
	
	

	/* 상품정보 상세조회 */
	@Override
	public ProductVO productDetail(int product_id) throws Exception {
		return dao.productDetail(product_id);
	}

	@Override
	public List<ProductVO> pageProduct(Criteria cri) throws Exception {
		return dao.pageProduct(cri);
	}
	@Override
	public int countProduct() throws Exception {
		return dao.countProduct();
	}

	@Override
	public List<MemberVO> pageAccount(Criteria cri) throws Exception {
		return dao.pageAccount(cri);
	}

	@Override
	public int countAccount() throws Exception {
		return dao.countAccount();
	}

	@Override
	public List<MemberVO> pageAccountGrade(Criteria cri) throws Exception {
		return dao.pageAccountGrade(cri);
	}

}




