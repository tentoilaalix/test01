package com.solfood.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.solfood.dto.MemberVO;
import com.solfood.dto.TotalVO;
import com.solfood.service.MemberService;
import com.solfood.service.RecentService;
 
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
    
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    @Inject
    private MemberService memberService; 
    @Inject
    private RecentService recentService;
    
    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) throws Exception{
 
        logger.info("home");
        
        List<MemberVO> memberList = memberService.selectMember();
        
        model.addAttribute("memberList", memberList);
 
        return "home";
    }
    
	@RequestMapping("/chat")
	public String chat() {
		return "module/chat";
	}
	
	//회사소개
	@RequestMapping("/intro.do")
	public String intro() {
		return "company/intro";
	}
	//이용약관
	@RequestMapping("/accessTerms.do")
	public String accessTerms() {
		return "company/accessTerms";
	}
	//개인정보처리방침
	@RequestMapping("/personalInfo.do")
	public String personalInfo() {
		return "company/personalInfo";
	}
	//이용안내
	@RequestMapping("/guide.do")
	public String guide() {
		return "company/guide";
	}
	
	
	//최근본상품
	@RequestMapping(value= "/recentList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String recentList() throws Exception {
		return "recentView/recentList";
	}
	
	@ResponseBody
	@RequestMapping(value= "/recentList2.do", method= {RequestMethod.GET, RequestMethod.POST})
	public List<TotalVO> recentList2(String account_user) throws Exception {		
		// 삭제하기
		System.out.println("============================ recentList2");

		List<TotalVO> recentList= recentService.selectRecent(account_user);
		
		return recentList;
	}
	

}
