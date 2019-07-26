package com.solfood.service;
import java.util.List;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

public interface RecentService {
	public List<TotalVO> selectRecent(int recent_num) throws Exception;	
	
	public void insertRecent(int recent_num) throws Exception;
	
}
