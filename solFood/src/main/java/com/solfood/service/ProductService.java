package com.solfood.service;
import java.util.List;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

public interface ProductService {
	public List<TotalVO> selectProduct_all() throws Exception;
	public List<TotalVO> selectProduct(int product_id) throws Exception;	
	public List<TotalVO> selectProduct_count() throws Exception;
	public int selectProduct_count_individually(int product_id) throws Exception;
	public List<TotalVO> selectProduct_category1(String product_category1) throws Exception;
	public List<TotalVO> selectProduct_category2(String product_category2) throws Exception;
	public List<TotalVO> selectHeart() throws Exception; 
	public List<TotalVO> selectEvent(int product_event) throws Exception;
	
	public void updateProduct_count_minus(TotalVO vo) throws Exception;
	public void insertHeart (TotalVO vo) throws Exception;
	public void deleteHeart(TotalVO vo) throws Exception;
}
