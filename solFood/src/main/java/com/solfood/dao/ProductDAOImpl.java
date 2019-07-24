package com.solfood.dao;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace= "com.solfood.mapper.productMapper";
	
	//-----------------------------------------------------------------------
	//	select 
	//-----------------------------------------------------------------------
	@Override
	public List<TotalVO> selectProduct_all() throws Exception {
		return sqlSession.selectList(Namespace+".selectProduct_all");
	}
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
	
	// heart 누르면 heart 테이블로 들어가게 하기 
	@Override
	public void insertHeart(int product_id) throws Exception {
		sqlSession.insert(Namespace+".insertHeart", product_id);
	}

	
}
