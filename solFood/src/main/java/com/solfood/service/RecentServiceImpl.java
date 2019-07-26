package com.solfood.service;
import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.solfood.dao.BuyDAO;
import com.solfood.dao.CartDAO;
import com.solfood.dao.RecentDAO;
import com.solfood.dto.CartVO;
import com.solfood.dto.TotalVO;

@Service
public class RecentServiceImpl implements RecentService{
	@Inject
	private RecentDAO dao;

	//------------------------------------------------------------------
	//	select
	//------------------------------------------------------------------
	@Override
	public List<TotalVO> selectRecent(int recent_num) throws Exception {
		return dao.selectRecent(recent_num);
	}


	//------------------------------------------------------------------
	//	insert
	//------------------------------------------------------------------
	@Override
	public void insertRecent(int recent_num) throws Exception {
		dao.insertRecent(recent_num);
	}

	//------------------------------------------------------------------
	//	delete
	//------------------------------------------------------------------
	

	//------------------------------------------------------------------
	//	update
	//------------------------------------------------------------------
	
	
}
