package com.solfood.service;
import java.util.List;
import com.solfood.dto.TotalVO;

public interface RecipeService {
	public List<TotalVO> selectRecipe(int recipe_id) throws Exception;
	public List<TotalVO> allRecipe() throws Exception;
}
