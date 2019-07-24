package com.solfood.dao;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Repository
public interface ProductDAO {
	//-------------------------------------------------------------
	//	SELECT 
	//-------------------------------------------------------------
		// 상품 모두 보기
		public List<TotalVO> selectProduct_all() throws Exception;
	
		// product_id 별로 cart의 상품 목록 보기
		public List<TotalVO> selectProduct(int product_id) throws Exception;	
		
		// 상품 재고 개수 모두 보기 
		public List<TotalVO> selectProduct_count() throws Exception;
		
		// 특정 상품 재고 개수 보기 
		public int selectProduct_count_individually(int product_id) throws Exception;
		
		// 카테고리별로 상품 보기
		public List<TotalVO> selectProduct_category1(String product_category1) throws Exception;
		public List<TotalVO> selectProduct_category2(String product_category2) throws Exception;
		
		// heart에 있는 목록 보기 
		public List<TotalVO> selectHeart() throws Exception;
	//-------------------------------------------------------------
	//	UPDATE 
	//-------------------------------------------------------------
		// buy로 상품 넘어가면, product 테이블에서 그만큼 숫자 빼주기 (재고 관리)
		public void updateProduct_count_minus(TotalVO vo) throws Exception;
	
	//-------------------------------------------------------------
	//	INSERT 
	//-------------------------------------------------------------
		// heart 누르면 heart 테이블로 상품 들어가게 해주기 
		public void insertHeart (int product_id) throws Exception;
		
	//-------------------------------------------------------------
	//	INSERT 
	//-------------------------------------------------------------
		public void deleteHeart(int product_id) throws Exception;
}
