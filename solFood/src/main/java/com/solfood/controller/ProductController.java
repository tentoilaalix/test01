package com.solfood.controller;
import java.io.File;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.solfood.dto.PageMaker;
import com.solfood.dto.PageMaker2;
import com.solfood.dto.ProductVO;
import com.solfood.dto.SearchCriteria;
import com.solfood.dto.SearchVO;
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
	public String productInfo(Model model, int product_id) throws Exception {
		List<TotalVO> productList = productService.selectProduct(product_id);
		model.addAttribute("productList", productList);
		
		return "product/productInfo";
	}
	//테스트=-==================================================================
	// 검색기능 추가 테스트 //검색할때 필요한 페이지
	
	//====================================================================
	
	
	
	@RequestMapping(value = "/productSearch", method = {RequestMethod.POST, RequestMethod.GET})
	public String productSearch(@RequestParam("keyword_p") String keyword_p, SearchVO searchvo, Locale locale, Model model, HttpServletRequest request) throws Exception{
		
		String keyword_p1= request.getParameter("keyword_p");
		searchvo.setSearch_keyword(keyword_p1);//
		
		List<ProductVO> productList= productService.showAll(keyword_p);
		model.addAttribute("productList", productList);
		System.out.println(keyword_p);
		
		
		
		productService.searchInsert(searchvo);//
		
		return "/product/productSearch";
	}
	


}







