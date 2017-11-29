package ib.mobile.web;


import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ib.cmm.LoginVO;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.cmm.util.sim.service.PagingAjax;
import ib.company.service.CompanyVO;
import ib.company.service.impl.CompanyDAO;
import ib.login.service.StaffVO;
import ib.person.service.PersonVO;
import ib.person.service.impl.PersonDAO;
import ib.push.service.PushService;
import ib.schedule.service.LoginService;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.rte.fdl.idgnr.impl.Base64;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller(value="mainMController")
public class MainController {
	
	
	/** log */
    protected static final Log LOG = LogFactory.getLog(MainController.class);
   
    @Resource(name = "personDAO")
    private PersonDAO personDAO;   
    
    @Resource(name = "companyDAO")
    private CompanyDAO companyDAO;
    
	@Resource(name = "loginService2")
	private LoginService loginService;
	
	@Resource(name = "pushService")
	private PushService pushService;
	
	@Resource(name = "workService")
	private WorkService workService;
	
	
	/**
	 * 로그인 화면으로 들어간다
	
	 */
	@RequestMapping(value="/m/login.do")
	public String login( 
			@RequestParam Map<String,Object> map,HttpSession session,HttpServletResponse response,
			ModelMap model) throws Exception{
		
		String accessPage ="";
		if(map.get("accessPage") != null) accessPage = map.get("accessPage").toString();
		session.setAttribute("accessPage", accessPage);
		
		
		return "/m/login";
    }
	
	/**
	 * Main 화면으로 들어간다
	
	 */
	@RequestMapping(value="/m/main.do")
	public String main( 
			StaffVO staffVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		session.setAttribute("contactType", "APP");
		
		return "/m/main";
    }
	
	

	/**
	 * 
	 * @MethodName : doLogin
	 * @param doLogin
	 * @param session
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="m/doLogin.do")
	public void doLogin(LoginVO loginVO,
								StaffVO staffVO,
								HttpSession session,
								HttpServletRequest request,
								HttpServletResponse response,
								ModelMap model,
								@RequestParam Map<String,Object> map) throws Exception {
	
			LoginVO loginUser =  new LoginVO();
			int chk = 0;
			
			
			if(!"sideLogin".equals(staffVO.getFlag())){
				
				//비밀번호 암호화
				String encrypted = staffVO.getUsrPw();
				
				
				try{
				    MessageDigest md = MessageDigest.getInstance("SHA-1");
				    md.update(new String(encrypted).getBytes("UTF-8"));
				   		
				    byte[] digested = md.digest();
				    encrypted = new String(Base64.encode(digested));
				   
				}
				catch (Exception e){
				    encrypted = new String(encrypted);
				}
				
				staffVO.setUsrPw(encrypted);	
				
			}
			
			chk = personDAO.checkStaffCnt(staffVO);
			
			AjaxResponse.responseAjaxSave(response, chk);
			
			
	}
	
	

	/**
	 * 
	 * @MethodName : getUserInfo
	 * @param getUserInfo
	 * @param session
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/m/getUserInfo.do")
	public void getUserInfo(LoginVO loginVO,
								StaffVO staffVO,
								HttpSession session,
								HttpServletRequest request,
								HttpServletResponse response,
								ModelMap model,
								@RequestParam Map<String,Object> map) throws Exception {
	
			LoginVO loginUser =  new LoginVO();
			int chk = 0;
			List<StaffVO> result = null;
			Map resultMap = new HashMap();
			
			if(!"sideLogin".equals(staffVO.getFlag())){
				
				//비밀번호 암호화
				String encrypted = staffVO.getUsrPw();
				
				
				try{
				    MessageDigest md = MessageDigest.getInstance("SHA-1");
				    md.update(new String(encrypted).getBytes("UTF-8"));
				   		
				    byte[] digested = md.digest();
				    encrypted = new String(Base64.encode(digested));
				   
				}
				catch (Exception e){
				    encrypted = new String(encrypted);
				}
				
				staffVO.setUsrPw(encrypted);	
				
			}
			
			result = personDAO.checkStaff(staffVO);
			
			if(result.size() != 0){
				resultMap.put("loginId", result.get(0).getUsrId());
				
			}
				
			//session set
			
			loginUser.setId(result.get(0).getUsrId());
	        loginUser.setName(result.get(0).getUsrNm());
	        loginUser.setIp(staffVO.getIp());
	        loginUser.setPermission(result.get(0).getPermission());
	        loginUser.setSabun(result.get(0).getSabun());				//세션에 사번 추가 20150706
	        loginUser.setStaffSnb(result.get(0).getStaffSnb());			//세션에 staffId(s_nb) 추가 20160307
	        loginUser.setCusId(result.get(0).getCusId());				//세션에 cus_id 추가 20160307
	        loginUser.setAnalMaster(result.get(0).getAnalMaster());		//세션에 analMaster 추가 20160502		분석의견 등록 특수 권한자 'Y'  (오늘 아닌 다른날도 등록 가능자..공통코드'00023')
	        loginUser.setInfoLevel(result.get(0).getInfoLevel());		//정보공개등급
	        loginUser.setMnaLevel(result.get(0).getMnaLevel());			//정보공개등급(M&A)
	        loginUser.setPhn1(result.get(0).getPhn1());					//휴대폰
	        loginUser.setReviewLevel(result.get(0).getReviewLevel());	//투심레벨
	        loginUser.setEmail(result.get(0).getEmail());				//email
	        loginUser.setDeptNm(result.get(0).getDeptNm()); 			//부서 추가 20160617 
	        loginUser.setDeptId(result.get(0).getDeptId()); 			//부서 id 추가 20160805
	        loginUser.setDeptMngr(result.get(0).getDeptMngr()); 		//부서장 사번 추가 20160805
	        loginUser.setHqId(result.get(0).getHqId());
	        loginUser.setDivision(result.get(0).getDivision());         //회사 코드 추가 20160705
	        loginUser.setHqName(result.get(0).getHqName());				//회사 명 추가 20160705 ex>시너지파트너스,시너지 아이비투자. 
	        loginUser.setPosition(result.get(0).getPosition());         //직급 추가 20160705
	        loginUser.setCarWorkYn(result.get(0).getCarWorkYn());		//차량 사용여부 추가 20160714
	        loginUser.setMezzL(result.get(0).getMezzL());				//메자닌상장 권한여부 20160802
	        loginUser.setMezzN(result.get(0).getMezzN());				//메자닌비상장 권한여부 20160802
	        loginUser.setPreStaff(result.get(0).getPreStaff());			//정사원 직전 상태 여부 20161206
	        loginUser.setEmailId(result.get(0).getEmailId());			//메일플러그 로그인 ID        
	        loginUser.setEmailPasswd(result.get(0).getEmailPasswd());	//메일플러그 패스워드
	        
	        loginUser.setDealSms(result.get(0).getDealSms());			//SMS수신여부
	        loginUser.setNoReadAllYn("N");								//읽지 않은글 전체보기 여부... 기본 'N'(접힌상태)
	        loginUser.setPreStaffCd(result.get(0).getPreStaffCd());		//직원직전 코드
	        loginUser.setSrtCd(result.get(0).getSrtCd());				//IB_STAFF.SRT_CD
	        
	        
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
	        Calendar c1 = Calendar.getInstance();
	        
	        loginUser.setLoginDt(sdf.format(c1.getTime()));				//로그인시간 정보

	        
	        if(loginUser != null){
	        	session.setAttribute("userLoginInfo", loginUser);		//로그인 세션 정보 'userLoginInfo'
	        }
	        
	        //---------------------------------- 인사이드 관련 세션 정보 'loginVO' :S --------------------------------------
	        if(loginUser != null){
	        	map.put("PerId", loginUser.getId());	        
	        	ib.schedule.service.LoginVO loginVo = loginService.LoginEnd(map);
	        	loginVo.setRegPerSabun(loginVo.getPerSabun());				
	        	session.setAttribute("loginVO", loginVo);
	        }
	        //---------------------------------- 인사이드 관련 세션 정보 'loginVO' :E --------------------------------------

	        
	        //uuid device type device token update
	        
	        System.out.println(map.get("deviceType"));
	        
	        if(loginUser != null){
	        	map.put("userId", result.get(0).getStaffSnb());
	        	pushService.updateUserProfileToPushInfo(map);
	        }
	        
			AjaxResponse.responseAjaxObject(response, resultMap);
			
			
	}
	
	//메인 카운트 
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "m/mainCount.do")
   	public void mainCount(
   			HttpServletRequest req,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map
   			) throws Exception {
   		
   		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
   		Map resultMap = workService.getMainDealNCommentCount(map);
   		String accessPage = session.getAttribute("accessPage").toString();
   		resultMap.put("accessPage", accessPage);
   		session.setAttribute("accessPage", "");
		AjaxResponse.responseAjaxObject(response, resultMap);
   		
   	}
	
	/**
	 * Logout 로그아웃
	
	 */
	@RequestMapping(value="/m/logout.do")
	public String logout( 
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model) throws Exception{
	
		session.setAttribute("userLoginInfo", null);
		/*Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			String name=cookies[i].getName(); 
			if(name.equals("synergyloginId")){
				
				cookies[i].setMaxAge(0);
				cookies[i].setPath("/"); 
				response.addCookie(cookies[i]);
			}
		}*/
		
		return "redirect:/m/login.do?accessPage=out";
    }
	
	//////////////////////////////////////////모바일 추가구현.
	
	/**
	 * 사람 찾기
	 */
	@RequestMapping(value="/m/commonPop/personPop_openLayer.do")
	public String personPop(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			WorkVO workVO,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
		
		model.addAttribute("MDf", workVO.getModalFlag());
		
		return "/m/commonPop/personPop";
	}
	
	/**
	 * 회사 찾기 
	 */
	@RequestMapping(value="/m/commonPop/companyPop_openLayer.do")
	public String companyPop(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			WorkVO workVO,
			PersonVO personVO,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
		
		model.addAttribute("MDf", workVO.getModalFlag());
		 
		return "/m/commonPop/companyPop";
	}
	
	/**
	 * 사람 찾기 리스트 및 페이징 (모바일 ajax)
	 */
	@RequestMapping(value="/m/commonPop/personSearch.do")
	public void personSearch(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			WorkVO workVO,
			PersonVO personVO,
			ModelMap model) throws Exception{
		
		request.setCharacterEncoding("UTF-8");
		int totCnt = 0;
		List<PersonVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String,Object> resultmap = new HashMap<String, Object>();
        PaginationInfo paginationInfo = new PaginationInfo();
        resultmap.put("searchName", workVO.getCstNm());
        resultmap.put("MDf", workVO.getModalFlag());
        resultmap.put("MDn", workVO.getModalNum());
        resultmap.put("sortTitle", workVO.getSort_t());
        
       
        paginationInfo.setCurrentPageNo(personVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(8);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(5);//페이징 리스트의 사이즈

        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
		personVO.setFirstIndex(firstRecordIndex);
		personVO.setRecordCountPerPage(recordCountPerPage);

		if(personVO.getCpnNm() != null && personVO.getCpnNm().length() != 0)  resultmap.put("YN", "Y"); 


		try{
			result = personDAO.selectPersonList(personVO);
			totCnt = personDAO.selectPersonListCnt(personVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		map.put("resultList", result);
		String  paging = PagingAjax.getPaging(personVO.getPageIndex(), totCnt, paginationInfo.getRecordCountPerPage(),  paginationInfo.getPageSize(),"getPagingList","0","iP","");
		resultmap.put("paging",  paging); 
		resultmap.put("searchList",  map.get("resultList")); 
		
		AjaxResponse.responseAjaxMap(response, resultmap);
	}
	
	/**
	 * 회사 찾기 리스트 및 페이징 (모바일 ajax)
	 * @MethodName : popUpCpn
	 * @param request
	 * @param workVO
	 * @param companyVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/m/commonPop/companySearch.do")
	public void companySearch(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			WorkVO workVO,
			CompanyVO companyVO,
			ModelMap model) throws Exception{

		int totCnt = 0;
		List<CompanyVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String,Object> resultmap = new HashMap<String, Object>();
        PaginationInfo paginationInfo = new PaginationInfo();
        resultmap.put("searchName", workVO.getCpnNm());
        resultmap.put("MDf", workVO.getModalFlag());
        resultmap.put("MDn", workVO.getModalNum());

        //System.out.println(companyVO.getPageIndex());

        paginationInfo.setCurrentPageNo(companyVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(8);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(5);//페이징 리스트의 사이즈

        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
		companyVO.setFirstIndex(firstRecordIndex);
		companyVO.setRecordCountPerPage(recordCountPerPage);

		try{
			result = companyDAO.selectCompanyList(companyVO);
			totCnt = companyDAO.selectCompanyListCnt(companyVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		map.put("resultList", result);
		
        paginationInfo.setTotalRecordCount(totCnt);
        String  paging = PagingAjax.getPaging(companyVO.getPageIndex(), totCnt, paginationInfo.getRecordCountPerPage(),  paginationInfo.getPageSize(),"getPagingList","0","c","");
		resultmap.put("paging",  paging); 
		resultmap.put("searchList",  map.get("resultList")); 
		
		AjaxResponse.responseAjaxMap(response, resultmap);
	}


	/**
	 * 사람 등록화면(모바일)
	 * @MethodName : rgstCst
	 * @param companyVO
	 * @param personVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/m/commonPop/regPersonPop_openLayer.do")
	public String popRegistCst(@ModelAttribute("personVO") PersonVO personVO,
			HttpSession session,
			ModelMap model){

		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		PersonVO reultpersonVO = new PersonVO();
		try {
			if(!personVO.getsNb().equals("")){ //snb ""가 아니면 수정화면
				List<PersonVO>result=personDAO.selectMainPersonList(personVO);
				reultpersonVO = result.get(0);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(reultpersonVO.getsNb());
		model.addAttribute("cstNm", personVO.getSearchCstNm());
		model.addAttribute("MDf", personVO.getModalFlag());
		model.addAttribute("MDn", personVO.getModalNum());
		model.addAttribute("result",reultpersonVO);
		
		
		return "m/commonPop/regPersonPop";
	}

	/**
	 * 회사 등록화면(모바일)
	 * @MethodName : rgstCst
	 * @param companyVO
	 * @param personVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/m/commonPop/regCompanyPop_openLayer.do")
	public String popRegistCpnt(@ModelAttribute("companyVO") CompanyVO companyVO,
			@RequestParam Map<String,String> map,
			HttpSession session,
			ModelMap model){

		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		//System.out.println("===========등록할 회사이름:"+companyVO.getSearchCpnNm()+"==============");
		List<Map> result = null;
		try{
			//result = companyDAO.selectMaxCpnId(companyVO);
			result = companyDAO.selectMaxCpnIds(map);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		//model.addAttribute("maxCpnId", result.get(0).getCpnId());
		model.addAttribute("maxSeq", result.get(0).get("seq"));
		model.addAttribute("maxASeq", result.get(0).get("aSeq"));
		
	//	model.addAttribute("maxCpnId", result.get(0).getCpnId());
		model.addAttribute("cpnNm", companyVO.getSearchCpnNm());
		model.addAttribute("MDf", companyVO.getModalFlag());
		model.addAttribute("MDn", companyVO.getModalNum());
	
		return "m/commonPop/regCompanyPop";
	}
	
	//-- 사원선택 공통 
	
	
	// 사원선택 팝업창
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/m/commonPop/userSelectPop_openLayer.do")
	public String userSelectPop(
		@RequestParam Map<String, Object> map, Model model,HttpSession session) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
		
		model.addAllAttributes(map);
		
		return "m/commonPop/userSelectPop";
	}
	
	// 배포페이지
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/mobileInfo.do")
	public String mobileInfo(
		@RequestParam Map<String, Object> map, Model model,HttpSession session) throws Exception {
		
	
		return "m/mobileInfo";
	}
	
	// 배포페이지 문자 팝업 
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/sendSmsToMobile.do")
	public String sendSmsToMobile(
		@RequestParam Map<String, Object> map, Model model,HttpSession session) throws Exception {
		
	
		return "m/sendSmsPop";
	}
	
	// ios 메뉴얼
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/iosGuide.do")
	public String iosGuide(
		@RequestParam Map<String, Object> map, Model model,HttpSession session) throws Exception {
		
	
		return "m/iosGuide";
	}
	
	// and 메뉴얼
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/andGuide.do")
	public String andGuide(
		@RequestParam Map<String, Object> map, Model model,HttpSession session) throws Exception {
		
	
		return "m/andGuide";
	}
	
	// 동영상
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/mvGuide.do")
	public String mvGuide(
		@RequestParam Map<String, Object> map, Model model,HttpSession session) throws Exception {
		
	
		return "m/mvGuide";
	}
	
	  
}
