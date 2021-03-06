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
	/* 매니저 메인 url로 가려다가 막혀서 나오는 페이지 */
	//========================================================================================================
	@RequestMapping("/managerMainFailPage.do")
	public String managerMainFailPage() {
		return "/manager/managerMainFailPage";
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
	
	//글 목록 + 페이징
    @RequestMapping(value="account/account_page.do", method = RequestMethod.GET)
    public void pageAccount(Criteria cri, Model model) throws Exception{
    	
    	List<MemberVO> page = service.pageAccount(cri);
    	model.addAttribute("page", page);
    	
    	PageMaker pageMaker = new PageMaker();
    	pageMaker.setCri(cri);
    	pageMaker.setTotalCount(service.countAccount());
    	model.addAttribute("pageMaker", pageMaker);
    	
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
		return "redirect:account_page.do";
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
	
	
	
	
	
	
	
	//-----------------------------------------------------------------------------------------------
	//상품관리
	//-----------------------------------------------------------------------------------------------
	
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
	
	
	
	/* 상품 상세조회 */
	@RequestMapping(value = "product/productUpdate.do", method = RequestMethod.GET)
	public void getDetailProduct(@RequestParam("product_id") int product_id, Model model) throws Exception{
		ProductVO productUpdate = null;
		productUpdate = service.productDetail(product_id);
		
		model.addAttribute("productUpdate", productUpdate);
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
    	
    	//원본 파일 경로 + 파일명 저장
    	System.out.println("###"+imgUploadPath);
    	System.out.println("###"+fileName);
    	System.out.println("###"+uploadPath);
		/*
		 * System.out.println(uploadPath + "imgUpload" + ymdPath + File.separator +
		 * fileName);
		 */
    	
    	//img 파일경로 + 파일명 저장
    	productVo.setProduct_image(File.separator + "productImg" + File.separator + fileName);
		//썸네일 파일경로 + 파일명 저장
    	//productVo.setProduct_thumb("s" + File.separator + "s_"+ fileName);
    	
		service.insertProduct(productVo);		
		
		return "redirect:product_page.do";
	}
	
	//상품수정
	@RequestMapping(value = "product/productUpdate.do", method = RequestMethod.POST)
	public String productUpdate(ProductVO productVo, MultipartFile file, HttpServletRequest req) throws Exception{
		logger.info("###modify product");
		
		// 새로운 파일이 등록되었는지 확인
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			
			/* 기존 이미지파일을 삭제 */	
			// 썸네일 업로드 주소 불러오기
			String imgUploadPaths = uploadPath + File.separator + "productImg" + File.separator + "s";
			
			//썸네일 삭제
			new File(imgUploadPaths + File.separator + File.separator + "s_"+ req.getParameter("product_image").substring(12)).delete();
			//이미지 원본 삭제
			new File(uploadPath + File.separator + req.getParameter("product_image")).delete();
			
			
			/* 새로 첨부한 파일을 등록 */ 	//String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			//업로드 경로 설정
			String imgUploadPath = uploadPath + File.separator + "productImg";
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());
			

	    	productVo.setProduct_image(File.separator + "productImg" + File.separator + fileName);
	    	
		} else {  // 새로운 파일이 등록되지 않았다면 기존 이미지를 그대로 사용
			productVo.setProduct_image(req.getParameter("product_image"));
			System.out.println("###2"+uploadPath);
			System.out.println("###2"+req.getParameter("product_image"));
		}
		
		service.updateProduct(productVo);
		
		return "redirect:product_page.do";
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
		
		return "redirect:product_page.do";
		
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
	@RequestMapping(value="recipe/recipe_register.do", method = RequestMethod.GET)
	public void recipe_register() throws Exception{
		
	}
	@RequestMapping(value="recipe/recipe_register.do", method = RequestMethod.POST)
	public String recipe_registerPro(TotalVO vo, MultipartFile file) throws Exception{
		String imgUploadPath = uploadPath + File.separator + "productImg";
    	String fileName = null;
		    	
    	if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
    		fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes()); 
		} else {
			fileName = File.separator + "noImage" + File.separator + "noImage.png";
		}
		vo.setRecipe_image(File.separator + "productImg" + File.separator + fileName);
		
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
	public String recipeUpdatePro(TotalVO vo, HttpServletRequest request, MultipartFile file, int recipe_id) throws Exception{
		
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
