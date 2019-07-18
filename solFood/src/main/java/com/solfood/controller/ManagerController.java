package com.solfood.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.solfood.dto.MemberVO;
import com.solfood.dto.BuyVO;
import com.solfood.dto.LikeVO;
import com.solfood.dto.ProductVO;
import com.solfood.dto.TotalVO;
import com.solfood.service.ManagerService;
import com.solfood.utils.Criteria;
import com.solfood.utils.PageMaker;
import com.solfood.utils.UploadFileUtils;

@Controller
@RequestMapping("/manager/")
public class ManagerController {

	//로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	@Inject
	private ManagerService service;
	
	
	//========================================================================================================
	/* 매니저 메인 페이지 이동 */
	//========================================================================================================
	@RequestMapping("/managerMain.do")
	public String managerMain() {
		return "/manager/managerMain";
	}
	
	//========================================================================================================
	//회원
	//========================================================================================================
	/* 회원관리 페이지 이동 */
	@RequestMapping(value = "account/account_list.do", method = RequestMethod.GET)
    public String accountList(Locale locale, Model model) throws Exception{

        List<MemberVO> memberList = service.selectMember();
        model.addAttribute("memberList", memberList);

        return "/manager/account/account_list";
    }
	
	/* 회원정보 상세조회 */
	@RequestMapping(value = "account/accountUpdate.do", method = RequestMethod.GET) 
	public void getDetailAccount(@RequestParam("account_user") String account_user, Model model) throws Exception{ 
		MemberVO accountUpdate = null;
		accountUpdate = service.memberDetail(account_user);
		
		model.addAttribute("accountUpdate", accountUpdate);
	}
	
	/* 회원정보 수정 */
	@RequestMapping(value="account/accountUpdate.do", method=RequestMethod.POST)
	public String getModify(MemberVO vo) throws Exception{
		service.updateMember(vo);
		
		//목록으로 리다이렉트
		return "redirect:account_list.do";
		//return "redirect:accountUpdate.do" + accountUpdate;
	}
	
	/* 회원정보 삭제 */
	@RequestMapping(value="account/accountDelete.do")
	public String delAccount(MemberVO vo) throws Exception{
		service.deleteMember(vo);
		
		return "redirect:account_list.do";
	}

	//========================================================================================================

	/* 구매관리 페이지 이동 */
	@RequestMapping("buy/buy_list.do")
	public String buy_list() {
		return "/manager/buy/buy_list";
	}
	//상품조회
	@RequestMapping(value = "buy/buy_list.do", method = RequestMethod.GET)
	public String buyList(Locale locale, Model model) throws Exception{
		
		List<BuyVO> buyList= service.selectBuy();
		model.addAttribute("buyList", buyList);
		
		return "/manager/buy/buy_list";
	}
	

	
	//===========================================================================
	//상품관리
	//===========================================================================
	
	//상품조회
	@RequestMapping(value = "product/product_list.do", method = RequestMethod.GET)
	public String productList(Locale locale, Model model) throws Exception{
		
		List<ProductVO> productList= service.selectProduct();
		model.addAttribute("productList", productList);
		
		return "/manager/product/product_list";
	}

	//글 목록 + 페이징
    @RequestMapping(value="product/product_page.do", method = RequestMethod.GET)
    public void pageProduct(Criteria cri, Model model) throws Exception{
    	
    	List<ProductVO> page = service.pageProduct(cri);
    	model.addAttribute("page", page);
    	
    	PageMaker pageMaker = new PageMaker();
    	pageMaker.setCri(cri);
    	pageMaker.setTotalCount(service.countProduct());
    	model.addAttribute("pageMaker", pageMaker);
    	
    }
	

	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	//상품등록
	@RequestMapping(value="product/product_register.do", method = RequestMethod.GET)
	public void getWrite() throws Exception{	
	
	}
	@RequestMapping(value="product/product_register.do", method = RequestMethod.POST)
	public String productRegister(ProductVO productVo, MultipartFile file) throws Exception{
		
		//업로드 경로 설정
		String imgUploadPath = uploadPath + File.separator + "productImg";
		//연월일 폴더 및 경로 설정 String imgUploadPath = uploadPath + File.separator + "imgUpload";
    	String fileName = null;
    	
    	//파일 인풋 박스에 첨부된 파일이 없다면, 첨부된 파일 이름이 없다면.
    	if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
    		fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes()); 
		} else {
			// 첨부된 파일이 없으면 미리 준비한 noImage.png 출력
			fileName = File.separator + "noImage" + File.separator + "noImage.png";
		}
    	
    	//img 파일경로 + 파일명 저장
    	productVo.setProduct_image(File.separator + "productImg" + File.separator + fileName);
    	
		service.insertProduct(productVo);		
		
		return "redirect:product_list.do";
	}
	
	//상품수정
	@RequestMapping(value="product/productUpdate.do")
	public String productUpdate(Model model, int product_id) throws Exception{
		ProductVO productDetail= service.productDetail(product_id);
		model.addAttribute("productDetail", productDetail);
		
		return "manager/product/productUpdate";
	}
	
	@RequestMapping(value = "product/productUpdatePro.do", method = RequestMethod.POST)
	public String productUpdatePro(ProductVO productVo, MultipartFile file, HttpServletRequest req, int product_id) throws Exception{				
		// 새로운 파일이 등록되었는지 확인
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			String imgUploadPaths = uploadPath + File.separator + "productImg" + File.separator + "s";					// 기존이미지 파일 삭제
			
			// 지금 product_image가 1 이렇게 되어있는게 많은데, 이런거는 substring(12)가 안먹고 오류나서 이렇게 했어요 by 영민
			if(req.getParameter("product_image").length()== 1) {
				new File(imgUploadPaths + File.separator + File.separator + "s_"+ req.getParameter("product_image")).delete();
			} else {
				new File(imgUploadPaths + File.separator + File.separator + "s_"+ req.getParameter("product_image").substring(12)).delete();	//썸네일 삭제
			}
			new File(uploadPath + File.separator + req.getParameter("product_image")).delete();												//이미지 원본 삭제
			
			
			/* 새로 첨부한 파일을 등록 */ 	//String ymdPath = UploadFileUtils.calcPath(imgUploadPath);// //업로드 경로 설정
			String imgUploadPath = uploadPath + File.separator + "productImg";
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());			

	    	productVo.setProduct_image(File.separator + "productImg" + File.separator + fileName);
	    	
	    // 새로운 파일이 등록되지 않았다면 기존 이미지를 그대로 사용
		} else {  
			productVo.setProduct_image(req.getParameter("product_image"));
		}
		
		productVo.setProduct_id(product_id);
		productVo.setProduct_name(req.getParameter("product_name"));
		productVo.setProduct_category1(req.getParameter("product_category1"));
		productVo.setProduct_category2(req.getParameter("product_category2"));
		productVo.setProduct_price(Integer.parseInt(req.getParameter("product_price")));
		productVo.setProduct_discountrate(Integer.parseInt(req.getParameter("product_discountrate")));
		productVo.setProduct_count(Integer.parseInt(req.getParameter("product_count")));
		productVo.setProduct_package(req.getParameter("product_package"));
		productVo.setProduct_ea(Integer.parseInt(req.getParameter("product_ea")));
		productVo.setProduct_content(req.getParameter("product_content"));
		productVo.setProduct_date(req.getParameter("product_date"));
		
		// 삭제하기
		System.out.println("==============================="+ productVo);
		
		
		service.updateProduct(productVo);
		
		return "redirect:product_list.do";
	}
	
	/*
	 * @RequestMapping("product/productUpdateForm") public String
	 * productUpdateForm(int product_id, Model model) throws Exception{ ProductVO
	 * productById= service.productDetail(product_id);
	 * model.addAttribute("productById", productById);
	 * 
	 * return "/manager/product/productUpdateForm"; }
	 * 
	 * @RequestMapping("product/productUpdatePro") public String
	 * productUpdatePro(ProductVO vo) throws Exception{ service.updateProduct(vo);
	 * 
	 * return "redirect:/product_list"; }
	 */
	
	/* 상품정보 삭제 */
	@RequestMapping(value="product/productDelete.do")
	public String delProduct(ProductVO vo) throws Exception{
		service.deleteProduct(vo);
		
		System.out.println(vo);
		
		return "redirect:product_list.do";
		
	}
	
	
	//===========================================================================
	// 레시피 관리
	//===========================================================================
	// 레시피 조회
	@RequestMapping(value="recipe/recipe_list.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String recipe_list(Model model) throws Exception{
		List<TotalVO> recipeList= service.selectRecipe();
		model.addAttribute("recipeList", recipeList);
		
		return "manager/recipe/recipe_list";
	}
	
	
	// 레시피 등록
	@RequestMapping(value="recipe/recipe_register.do")
	public String recipe_register() throws Exception{
		return "manager/recipe/recipe_register";
	}
	
	@RequestMapping(value="recipe/recipe_registerPro.do")
	public String recipe_registerPro(HttpServletRequest request, MultipartFile file) throws Exception{
		String imgUploadPath = uploadPath + File.separator + "productImg";
    	String fileName = null;
		    	
    	if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
    		fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes()); 
		} else {
			fileName = File.separator + "noImage" + File.separator + "noImage.png";
		}

		TotalVO vo= new TotalVO();
		vo.setRecipe_image(File.separator + "productImg" + File.separator + fileName);
		vo.setRecipe_content(request.getParameter("recipe_content"));
		vo.setRecipe_name(request.getParameter("recipe_name"));
		vo.setRecipe_keyword(request.getParameter("recipe_keyword"));
		
		service.insertRecipe(vo);
		
		return "redirect:/manager/recipe/recipe_list.do";
	}
	
	
	// 레시피 수정
	@RequestMapping(value="recipe/recipeUpdate.do")
	public String recipeUpdate(Model model, int recipe_id) throws Exception{
		TotalVO recipeDetail= service.selectRecipeDetail(recipe_id);
		model.addAttribute("recipeDetail", recipeDetail);
		
		return "manager/recipe/recipeUpdate";
	}
	
	@RequestMapping(value="recipe/recipeUpdatePro.do")
	public String recipeUpdatePro(HttpServletRequest request, MultipartFile file, int recipe_id) throws Exception{
		TotalVO vo= new TotalVO();
		vo.setRecipe_content(request.getParameter("recipe_content"));
		vo.setRecipe_name(request.getParameter("recipe_name"));
		vo.setRecipe_keyword(request.getParameter("recipe_keyword"));
		vo.setRecipe_id(recipe_id);
		
		
		// 새로운 파일이 등록되었는지 확인--> 삭제하고 새로운 거 등록하기
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			String imgUploadPaths = uploadPath + File.separator + "productImg" + File.separator + "s";
					
			new File(imgUploadPaths + File.separator + File.separator + "s_"+ request.getParameter("recipe_image").substring(12)).delete();
			new File(uploadPath + File.separator + request.getParameter("recipe_image")).delete();
					
			String imgUploadPath = uploadPath + File.separator + "productImg";
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());

	    	vo.setRecipe_image(File.separator + "productImg" + File.separator + fileName);
			    	
	    // 새로운 파일이 등록되지 않았다면 기존 이미지를 그대로 사용
		} else { 
			vo.setRecipe_image(request.getParameter("recipe_image"));
		}
	
		service.updateRecipe(vo);
		
		return "redirect:/manager/recipe/recipe_list.do";
	}
	
	
	// 레시피 삭제
	@RequestMapping(value="recipe/recipeDelete.do")
	public String recipeDelete(int recipe_id) throws Exception{
		service.deleteRecipe(recipe_id);
		
		return "redirect:/manager/recipe/recipe_list.do";
	}
}








