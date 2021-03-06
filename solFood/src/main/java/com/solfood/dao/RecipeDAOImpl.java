package com.solfood.dao;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.solfood.dto.TotalVO;

@Repository
public class RecipeDAOImpl implements RecipeDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace= "com.solfood.mapper.recipeMapper";
	
	//-----------------------------------------------------------------------
	//	select 
	//-----------------------------------------------------------------------
	@Override
	public List<TotalVO> selectRecipe(int recipe_id) throws Exception {
		return sqlSession.selectList(Namespace+".selectRecipe", recipe_id);
	}
	
	@Override
	public List<TotalVO> allRecipe() throws Exception {
		return sqlSession.selectList(Namespace+".allRecipe");
	}
	
}
