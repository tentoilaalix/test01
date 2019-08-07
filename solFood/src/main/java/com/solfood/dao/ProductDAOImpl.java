package com.solfood.dao;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.solfood.dto.BoardVO;
import com.solfood.dto.CartVO;
import com.solfood.dto.CommentVO;
import com.solfood.dto.SearchCriteria;
import com.solfood.dto.SearchVO;
import com.solfood.dto.TotalVO;
import com.solfood.dto.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace= "com.solfood.mapper.productMapper";
	
	//-----------------------------------------------------------------------
	//	select 
	//-----------------------------------------------------------------------
	@Override
	public List<TotalVO> selectProduct(int product_id) throws Exception {
		return sqlSession.selectList(Namespace+".selectProduct", product_id);
	}

	@Override
	public List<TotalVO> selectProduct_count() throws Exception {
		return sqlSession.selectList(Namespace+".selectProduct_count");
	}

	@Override
	public int selectProduct_count_individually(int product_id) throws Exception {
		return sqlSession.selectOne(Namespace+".selectProduct_count_individually", product_id);
	}
	
	@Override
	public List<TotalVO> selectProduct_category1(String product_category1) throws Exception {
		return sqlSession.selectList(Namespace+".selectProduct_category1", product_category1);
	}
	
	@Override
	public List<TotalVO> selectProduct_category2(String product_category2) throws Exception {
		return sqlSession.selectList(Namespace+".selectProduct_category2", product_category2);
	}
	
	//-----------------------------------------------------------------------
	//	update 
	//-----------------------------------------------------------------------
	@Override
	public void updateProduct_count_minus(TotalVO vo) throws Exception {
		sqlSession.update(Namespace+".updateProduct_count_minus", vo);
	}
	
//======== 검색기능============================================


	//검색
	@Override
	public List<ProductVO> showAll(String keyword_p) throws Exception {
		return sqlSession.selectList(Namespace + ".listSearch3", keyword_p);
	}
	   // 검색어 저장
		@Override
	    public int searchInsert(SearchVO searchvo) throws Exception{
			return sqlSession.insert(Namespace + ".searchInsert", searchvo);
		}
}
