package com.solfood.controller;
import java.io.File;
<<<<<<< HEAD
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.solfood.dto.TotalVO;
import com.solfood.service.CartService;
import com.solfood.service.ProductService;
import com.solfood.service.RecentService;

@Controller
@RequestMapping("/product/")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService productService;	
	@Inject
	private RecentService recentService;
	//============================================================
	//	selectProduct--> 상품 정보 불러오기// SELECT * FROM PRODUCT WHERE PRODUCT_ID= ?
	//============================================================
	@RequestMapping(value = "/productList.do")
	public String selectProduct(Model model, int product_id) throws Exception{		
		List<TotalVO> productList= productService.selectProduct(product_id);						
		model.addAttribute("productList", productList);
				
		return "product/productList";
	}
	
	@RequestMapping(value = "/products1.do")
	public String selectProduct_category1(Model model, String product_category1) throws Exception{		
		List<TotalVO> products= productService.selectProduct_category1(product_category1);						
		model.addAttribute("products", products);
				
		return "product/products";
	}
	
	@RequestMapping(value = "/products2.do")
	public String selectProduct_category2(Model model, String product_category2) throws Exception{		
		List<TotalVO> products= productService.selectProduct_category2(product_category2);						
		model.addAttribute("products", products);
				
		return "product/products";
	}
	
	@RequestMapping("/productInfo.do")
	public String productInfo(Model model, int product_id, String account_user) throws Exception {
		// 상품 정보 추출
		List<TotalVO> productList = productService.selectProduct(product_id);
		model.addAttribute("productList", productList);
		
		// 상품을 누르는 순간 recent table에 들어가게
		TotalVO vo= new TotalVO();
		vo.setAccount_user(account_user);
		vo.setProduct_id(product_id);
		
		// 삭제하기
		System.out.println("====================== insertrecent");
		
		recentService.insertRecent(vo);
		
		return "product/productInfo";
	}

	
=======
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.solfood.dto.TotalVO;
import com.solfood.service.CartService;
import com.solfood.service.ProductService;

@Controller
@RequestMapping("/product/")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService productService;	
	
	//============================================================
	//	PRODUCT 
	//============================================================
	@RequestMapping(value="/productListAll.do")
	public List<TotalVO> selectProduct_all(Model model) throws Exception{
		List<TotalVO> allList= productService.selectProduct_all();
		model.addAttribute("allList", allList);
		
		return allList;
	}
	
	@RequestMapping(value = "/productList.do")
	public String selectProduct(Model model, int product_id) throws Exception{		
		List<TotalVO> productList= productService.selectProduct(product_id);						
		model.addAttribute("productList", productList);
				
		return "product/productList";
	}
	
	// product category1 
	@RequestMapping(value = "/products1.do")
	public String selectProduct_category1(Model model, String product_category1) throws Exception{		
		List<TotalVO> products= productService.selectProduct_category1(product_category1);						
		model.addAttribute("products", products);
				
		return "product/products";
	}
	@ResponseBody
	@RequestMapping(value = "/products1_2.do", method= {RequestMethod.GET, RequestMethod.POST})
	public List<TotalVO> selectProduct_category1(String product_category1) throws Exception{		
		System.out.println("======================== products1_2 "+ product_category1);
		
		List<TotalVO> productList= productService.selectProduct_category1(product_category1);						
				
		return productList;
	}
	

	// product_category2
	@RequestMapping(value = "/products2.do")
	public String selectProduct_category2(Model model, String product_category2) throws Exception{		
		List<TotalVO> products= productService.selectProduct_category2(product_category2);						
		model.addAttribute("products", products);
				
		return "product/products";
	}
	
	@RequestMapping("/productInfo.do")
	public String productInfo(Model model, int product_id) throws Exception {
		List<TotalVO> productList = productService.selectProduct(product_id);
		model.addAttribute("productList", productList);
		
		return "product/productInfo";
	}

	
	
	//============================================================
	//	EVENT 
	//============================================================
	// 이벤트 
	@RequestMapping(value="/eventMain.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String eventMain() {
		return "event/eventMain";
	}
	@RequestMapping(value="/event.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String event(int product_event, Model model) throws Exception{
		model.addAttribute("product_event", product_event);
		
		// 해당 이벤트 id의 상품 목록 추출
		List<TotalVO> eventList= productService.selectEvent(product_event);
		model.addAttribute("eventList", eventList);
		
		return "event/event";
	}
}







