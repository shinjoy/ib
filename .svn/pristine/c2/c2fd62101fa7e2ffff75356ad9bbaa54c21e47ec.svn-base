package ib.person.web;

import ib.basic.service.CpnExcelVO;
import ib.basic.service.impl.CpnUploadExcelMapping;
import ib.basic.web.Util;
import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.company.service.CompanyVO;
import ib.company.service.impl.CompanyDAO;
import ib.login.service.StaffVO;
import ib.network.service.impl.NetworkDAO;
import ib.person.service.PersonMgmtService;
import ib.person.service.PersonVO;
import ib.person.service.impl.PersonDAO;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;
import ib.work.service.impl.WorkDAO;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * <pre>
 * package  : ib.person.web
 * filename : PersonController.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 8. 10.
 * @version : 
 */
@Controller
public class PersonController {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
    
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;

    @Resource(name = "personDAO")
    private PersonDAO personDAO;   
    
    @Resource(name = "companyDAO")
    private CompanyDAO companyDAO;   
    
    @Resource(name = "networkDAO")
    private NetworkDAO networkDAO;   
    
    @Resource(name = "workDAO")
    private WorkDAO workDAO;   
    
    @Resource(name = "workService")
    private WorkService workService;
    
    @Resource(name = "personMgmtService")
    private PersonMgmtService personMgmtService;
    
    
    /** log */
    protected static final Log LOG = LogFactory.getLog(PersonController.class);
	
	protected static Calendar cal = Calendar.getInstance();

	/**
	 * Main 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return Main Page
	 * @exception Exception
	 */
	@RequestMapping(value="/person/index.do")
	public String index(@ModelAttribute("personVO") PersonVO personVO,
			CompanyVO companyVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		List<PersonVO> netList = personDAO.selectNetPointLatest(personVO);
		model.addAttribute("netList", netList);

		return "person/PersonMain";
    }

	/**
	 * 인물 선택하여 보여지는 내용화면
	 *
	 * @MethodName : main
	 * @param personVO
	 * @param companyVO
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/main.do")
	public String main(@ModelAttribute("personVO") PersonVO personVO,
			CompanyVO companyVO,
			WorkVO workVO,
			HttpSession session,
			HttpServletRequest req,
			ModelMap model,
			@RequestParam Map<String,String> map) throws Exception{
		
		
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());	
		
		model.addAttribute("popUp", personVO.getPopUp());
		
		model.addAttribute("cmmCdProgressCdList", cmm.CommonCdList(workVO.ccdPrgressCd));
		model.addAttribute("cmmCdNet", cmm.CommonCdList("00013"));

        int firstRecordIndex = 0
        	,pageSize = 7;
        
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(firstRecordIndex);//현재 페이지 번호
        paginationInfo.setPageSize(pageSize);//페이징 리스트의 사이즈
        
        companyVO.setFirstIndex(firstRecordIndex);
        companyVO.setRecordCountPerPage(5);//한 페이지에 게시되는 게시물 건수
        workVO.setFirstIndex(firstRecordIndex);
        workVO.setRecordCountPerPage(10);//한 페이지에 게시되는 게시물 건수
        personVO.setFirstIndex(firstRecordIndex);
        personVO.setRecordCountPerPage(10);//한 페이지에 게시되는 게시물 건수

		List<PersonVO> 
				result = null;
		List<CompanyVO> 
				synergyStaff = null;
		try{
		if(personVO.getsNb()==null|personVO.getsNb().equals("")){
			result = personDAO.selectMainPersonList2(personVO);
		}else{
			result = personDAO.selectMainPersonList(personVO);
		}
		if(result.size()<1) {
			model.addAttribute("netList", personDAO.selectNetPointLatest(personVO));
			return "person/PersonMain";
		}
		
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		
		companyVO.setCstSnb(result.get(0).getsNb());
		personVO.setCstSnb(result.get(0).getsNb());
		workVO.setCstId(result.get(0).getsNb());
		
		try{
			List<WorkVO> staffList = workDAO.selectStaffOfferList(workVO);
			model.addAttribute("staffOfferList",staffList);//시너지 직원들의 정보정리 이력
			if(staffList.isEmpty()) 
				model.addAttribute("offerList",workDAO.selectOfferCpnList(workVO));//인물의 시너지와의 이력
			
			model.addAttribute("noteList", companyDAO.selectNoteList2(companyVO));
			
			if(companyVO.getCstSnb()!=null && !companyVO.getCstSnb().equals("")){
				model.addAttribute("netList", companyDAO.selectNetPointList(companyVO));
				
				companyVO.setNetYN("N");
				model.addAttribute("cstDealInfo", personDAO.selectCstDealInfoList(companyVO));
				
				companyVO.setNetYN("Y");
				model.addAttribute("cpnNet", personDAO.selectCstDealInfoList(companyVO));
				
				synergyStaff = personDAO.selectResponseStaffList(companyVO);
				model.addAttribute("bookList", personDAO.selectStockFirmBookmarkList(personVO));
				model.addAttribute("introList", personDAO.selectIntroducerList(personVO));
				
				paginationInfo.setRecordCountPerPage(companyVO.getRecordCountPerPage());
				paginationInfo.setTotalRecordCount(companyDAO.selectNetPointListCnt(companyVO)); //전체 게시물 건 수
				model.addAttribute("paginationInfo", paginationInfo);
				//인물소개
				PaginationInfo paginationInfoIn = new PaginationInfo();
				paginationInfoIn.setCurrentPageNo(firstRecordIndex);//현재 페이지 번호
				paginationInfoIn.setPageSize(pageSize);//페이징 리스트의 사이즈
				paginationInfoIn.setRecordCountPerPage(personVO.getRecordCountPerPage());
				paginationInfoIn.setTotalRecordCount(personDAO.selectIntroducerListCnt(personVO)); //전체 게시물 건 수
				model.addAttribute("paginationInfoIn", paginationInfoIn);
				//시너지와의이력
				PaginationInfo paginationInfoOf = new PaginationInfo();
				paginationInfoOf.setCurrentPageNo(firstRecordIndex);//현재 페이지 번호
				paginationInfoOf.setPageSize(pageSize);//페이징 리스트의 사이즈
				paginationInfoOf.setRecordCountPerPage(workVO.getRecordCountPerPage());
				paginationInfoOf.setTotalRecordCount(workDAO.selectStaffOfferListCnt(workVO)); //전체 게시물 건 수
				model.addAttribute("paginationInfoOf", paginationInfoOf);
				
				personVO.setsNb(personVO.getCstSnb());
				model.addAttribute("meetList", personDAO.selectAttendMeetingList(personVO));
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		model.addAttribute("cstList", result);
		
		String staffNm = "";
		if(!synergyStaff.isEmpty()) staffNm = synergyStaff.get(0).getRgNm();
		model.addAttribute("synergyStaff", staffNm);
	
		model.addAttribute("popupYn", map.get("popupYn"));
		
		if("bondIbPart".equals(req.getParameter("part")))
			return "person/PersonMainPart";		//담당자별 증권사IB 정보 화면에서 보여줄 간단한 정보화면
		else
			return "person/PersonMain";			//기존 전체화면
    }
	
	/**
	 * 시너지와 이력 팝업	20150714
	 *
	 * @MethodName : main
	 * @param personVO
	 * @param companyVO
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/PersonHistoryPop.do")
	public String personHistoryPop(@ModelAttribute("personVO") PersonVO personVO,
			CompanyVO companyVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());	
		
		model.addAttribute("popUp", personVO.getPopUp());
		
		model.addAttribute("cmmCdProgressCdList", cmm.CommonCdList(workVO.ccdPrgressCd));
		model.addAttribute("cmmCdNet", cmm.CommonCdList("00013"));

        int firstRecordIndex = 0;

        workVO.setFirstIndex(firstRecordIndex);
        workVO.setRecordCountPerPage(1000000);//한 페이지에 게시되는 게시물 건수
        
		List<PersonVO> result = personDAO.selectMainPersonList(personVO);

		workVO.setCstId(result.get(0).getsNb());
		
		try{
			List<WorkVO> staffList = workDAO.selectStaffOfferList(workVO);
			model.addAttribute("staffOfferList",staffList);//시너지 직원들의 정보정리 이력
			if(staffList.isEmpty()) 
				model.addAttribute("offerList",workDAO.selectOfferCpnList(workVO));//인물의 시너지와의 이력

		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		model.addAttribute("cst", result.get(0));

		return "person/PersonHistoryPop";
    }
	
	/**
	 * 인물 왼쪽 메뉴
	 *
	 * @MethodName : selectLeft
	 * @param personVO
	 * @param commandMap
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/selectLeft.do")
	public String selectLeft(
			@ModelAttribute("personVO") PersonVO personVO, 
			HttpSession session,
			ModelMap model) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		int totCnt = 0;
		List<PersonVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
        model.addAttribute("searchName", personVO.getCstNm());
        model.addAttribute("sortTitle", personVO.getSort_t());
      
        int recordCountPerPage = 12;
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(personVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(recordCountPerPage);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(4);//페이징 리스트의 사이즈

        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		personVO.setFirstIndex(firstRecordIndex);
		personVO.setRecordCountPerPage(recordCountPerPage);

		try{
			result = personDAO.selectPersonList(personVO);
			totCnt = personDAO.selectPersonListCnt(personVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		map.put("resultList", result);
		
		paginationInfo.setTotalRecordCount(totCnt); //전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		
        model.addAttribute("cstList", map.get("resultList"));
        model.addAttribute("message", MessageSource.getMessage("success.common.select"));
        
		return "person/Left";
	}
	/**
	 *
	 * @MethodName : searchName
	 * @param personVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/searchName.do")
	public String searchName(@ModelAttribute("personVO") PersonVO personVO, 
			HttpSession session,
			ModelMap model) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId()+"^_^"+personVO.getCstNm());
		int totCnt = 0;
		List<PersonVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
        PaginationInfo paginationInfo = new PaginationInfo();
        model.addAttribute("searchName", personVO.getCstNm());
        model.addAttribute("sortTitle", personVO.getSort_t());
      
		int pasingListSize = 4;
        /*if(9<personVO.getPageIndex()){
        	pasingListSize = 6;
        	if(96<personVO.getPageIndex()) pasingListSize = 4;
        }*/
        
        paginationInfo.setCurrentPageNo(personVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(12);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(pasingListSize);//페이징 리스트의 사이즈

        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
		personVO.setFirstIndex(firstRecordIndex);
		personVO.setRecordCountPerPage(recordCountPerPage);
		
		try{
			result = personDAO.selectPersonList(personVO);
			totCnt = personDAO.selectPersonListCnt(personVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		map.put("resultList", result);
		model.addAttribute("cstList", map.get("resultList"));
		
		paginationInfo.setTotalRecordCount(totCnt); //전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		
        model.addAttribute("message", MessageSource.getMessage("success.common.select"));
		
		//System.out.println("===========/searchName:"+personVO.getCstNm()+"==============");
		
		return "person/Left";
    }
	/**
	 * ajax 인물검색
	 * @MethodName : ajaxSearchName
	 * @param personVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 2. 6.
	 */
	@RequestMapping(value="/person/ajaxSearchName.do")
	public String ajaxSearchName(@ModelAttribute("personVO") PersonVO personVO, 
			HttpSession session,
			ModelMap model) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId()+"^_^"+personVO.getCstNm());
		int totCnt = 0;
		List<PersonVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
        PaginationInfo paginationInfo = new PaginationInfo();
        model.addAttribute("searchName", personVO.getCstNm());
        model.addAttribute("sortTitle", personVO.getSort_t());
      
		int pasingListSize = 4;
        /*if(9<personVO.getPageIndex()){
        	pasingListSize = 6;
        	if(96<personVO.getPageIndex()) pasingListSize = 4;
        }*/
        
        paginationInfo.setCurrentPageNo(personVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(12);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(pasingListSize);//페이징 리스트의 사이즈

        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
		personVO.setFirstIndex(firstRecordIndex);
		personVO.setRecordCountPerPage(recordCountPerPage);
		
		try{
			result = personDAO.selectPersonList(personVO);
			totCnt = personDAO.selectPersonListCnt(personVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		map.put("resultList", result);
		model.addAttribute("cstList", map.get("resultList"));
		
		paginationInfo.setTotalRecordCount(totCnt); //전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		
        model.addAttribute("message", MessageSource.getMessage("success.common.select"));
		
		//System.out.println("===========/searchName:"+personVO.getCstNm()+"==============");
		
		return "includeJSP/CstLeft";
    }
	/**
	 * 인물 > 인물네트워크 > 페이징
	 * @MethodName : ajaxNetP
	 * @param companyVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/ajaxNetP.do")
	public String ajaxNetP(
			@ModelAttribute("companyVO") CompanyVO companyVO, 
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(companyVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(5);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(7);//페이징 리스트의 사이즈

        companyVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        companyVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        paginationInfo.setTotalRecordCount(companyDAO.selectNetPointListCnt(companyVO)); //전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("netList", companyDAO.selectNetPointList(companyVO));
		
		return "person/ajaxImport/NetP";
	}
	/**
	 * 인물 > 시너지와의 이력 > 페이징
	 * @MethodName : ajaxOffer
	 * @param companyVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/ajaxOfferP.do")
	public String ajaxOffer(
			@ModelAttribute("workVO") WorkVO workVO, 
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(workVO.getPageIndex());//현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10);//한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(7);//페이징 리스트의 사이즈
		
		workVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		workVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		paginationInfo.setTotalRecordCount(workDAO.selectStaffOfferListCnt(workVO)); //전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("staffOfferList", workDAO.selectStaffOfferList(workVO));
		
		return "person/ajaxImport/OfferList";
	}
	/**
	 * 인물 > 인물소개 > 페이징
	 * @MethodName : ajaxIntroduce
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/ajaxIntroduceP.do")
	public String ajaxIntroduce(
			@ModelAttribute("personVO") PersonVO personVO, 
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(personVO.getPageIndex());//현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10);//한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(7);//페이징 리스트의 사이즈
		
		personVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		personVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		paginationInfo.setTotalRecordCount(personDAO.selectIntroducerListCnt(personVO)); //전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("introList", personDAO.selectIntroducerList(personVO));
		
		return "person/ajaxImport/IntroduceList";
	}

	/**
	 * 사람 등록화면
	 * @MethodName : rgstCst
	 * @param companyVO
	 * @param workVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/person/rgstCst.do")
	public String rgstCst(@ModelAttribute("personVO") PersonVO personVO, 
			WorkVO workVO,
			HttpSession session,
			ModelMap model,
			HttpServletRequest request){
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		LOG.info(loginUser.getId()+"^_^"+personVO.getSearchCstNm());
		//System.out.println("===========등록할 이름:"+personVO.getSearchCstNm()+"==============");
		model.addAttribute("cstNm", personVO.getSearchCstNm());
		model.addAttribute("fromMain", request.getParameter("fromMain"));
		return "person/RegistCST";
	}
	
	/**
	 * 사람 등록하기
	 * @MethodName : insertCst
	 * @param personVO
	 * @param workVO
	 * @param loginVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/person/insertCst.do")
	public String insertCst(@ModelAttribute("personVO") PersonVO personVO,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";	
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		personVO.setRgId(loginUser.getId());
		personVO.setStaffSnb(loginUser.getStaffSnb());					//staff id (sequence)
		
		int cnt = 0;		
		if(!"".equals(personVO.getUsrCusId())){			
			cnt = personMgmtService.insertCustomer(personVO);			//담당자등록 및 네트워크 등록을 위한 서비스추가후 연결
		}else{
			cnt = personDAO.insertCustomer(personVO);
		}
		
		
		//CEO 등록							//---- > 안쓰이므로 프로세스 제거 20160321
		//cnt = companyDAO.updateCEO();
		//model.addAttribute("saveCnt", cnt);

		return "person/RegistCST";
	}
	
	
	/**
	 * ajax 사람 등록하기
	 * @MethodName : insertCst
	 * @param personVO
	 * @param workVO
	 * @param loginVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/person/AjaxInsertCst.do")
	public String ajaxInsertCst(@ModelAttribute("personVO") PersonVO personVO,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model){
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginVO.getId());
		
		List<PersonVO> result = null;
		model.addAttribute("nm", personVO.getCstNm());
		
		int cnt = 0;
		try{
			cnt = personDAO.insertCustomer(personVO);
			LOG.debug(loginUser.getId()+"^_^personDAO.insertCustomer");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		try{
			result = personDAO.selectMaxSnb(personVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
	
		model.addAttribute("num", result.get(0).getsNb());
		model.addAttribute("saveCnt", cnt);
		
		return "person/CheckId";
	}
	
	
	/**
	 * 네트워크 추가 위해서 사람 선택 팝업
	 * @MethodName : popUpCst
	 * @param request
	 * @param personVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/popUpCst.do")
	public String popUpCst(HttpServletRequest request,
			PersonVO personVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LOG.info(personVO.getRgId());
		model.addAttribute("searchName", personVO.getCstNm());
		model.addAttribute("TempName", personVO.getTMname());
		model.addAttribute("TempSnb", personVO.getTMsnb());
		model.addAttribute("sortTitle", personVO.getSort_t());
		model.addAttribute("MDf", personVO.getModalFlag());
		model.addAttribute("MDn", personVO.getModalNum());

		int totCnt = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		List<PersonVO> result = null;
        PaginationInfo paginationInfo = new PaginationInfo();
        LOG.info(personVO.getRgId()+"^_^"+personVO.getCpnNm());
        
        paginationInfo.setCurrentPageNo(personVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(15);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(5);//페이징 리스트의 사이즈

        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
		personVO.setFirstIndex(firstRecordIndex);
		personVO.setRecordCountPerPage(recordCountPerPage);

		try{
			result = personDAO.selectPersonList(personVO);
			totCnt = personDAO.selectPersonListCnt(personVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		map.put("resultList", result);
		model.addAttribute("cstList", map.get("resultList"));
		
		
		paginationInfo.setTotalRecordCount(totCnt); //전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "person/PopUpCst";
	}
	/**
	 * 팝업 - 딜이력 추가 위해서 회사선택
	 * @MethodName : popUpCpn
	 * @param request
	 * @param personVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/popUpCpn.do")
	public String popUpCpn(HttpServletRequest request,
			PersonVO personVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		model.addAttribute("TempName", personVO.getTMname());
		model.addAttribute("TempSnb", personVO.getTMsnb());
		model.addAttribute("TempNet", personVO.getNetYN());
		model.addAttribute("MDf", personVO.getModalFlag());
		model.addAttribute("MDn", personVO.getModalNum());
		
		int totCnt = 0;
		CompanyVO companyVO = new CompanyVO();
		Map<String, Object> map = new HashMap<String, Object>();
		List<CompanyVO> result = null;
		PaginationInfo paginationInfo = new PaginationInfo();
		model.addAttribute("searchName", personVO.getCpnNm());
		LOG.info(loginUser.getId()+"^_^"+personVO.getCpnNm());
		
		companyVO.setCpnNm(personVO.getCpnNm());
		companyVO.setsNb(personVO.getsNb());
		
		paginationInfo.setCurrentPageNo(personVO.getPageIndex());//현재 페이지 번호
		paginationInfo.setRecordCountPerPage(15);//한 페이지에 게시되는 게시물 건수
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
		model.addAttribute("companyList", map.get("resultList"));
		
		
		paginationInfo.setTotalRecordCount(totCnt); //전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "person/PopUpCpn";
	}
	/**
	 * 인물 페이지 네트워크 추가하기
	 * @MethodName : insertNetworkCst
	 * @param request
	 * @param personVO
	 * @param loginVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/person/insertNetwork.do")
	public String insertNetworkCst(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			PersonVO personVO,
			ModelMap model){
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		personVO.setRgId(loginUser.getId());
		LOG.info(loginUser.getId());
		
		int cnt = 0;
		try{
			cnt = personDAO.insertNetworkCst(personVO);
			LOG.debug(loginUser.getId()+"^_^personDAO.insertNetworkCst");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);

		return "person/RegistCST";
	}
	/**
	 * 인물 페이지 딜경력 추가
	 * @MethodName : insertCstDealInfo
	 * @param request
	 * @param session
	 * @param loginVO
	 * @param personVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/person/insertCstDealInfo.do")
	public String insertCstDealInfo(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			PersonVO personVO,
			ModelMap model){
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		personVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		try{
			cnt = personDAO.insertCstDealInfo(personVO);
			LOG.debug(loginUser.getId()+"^_^personDAO.insertCstDealInfo");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		
		return "person/RegistCST";
	}
	
	/**
	 * 이력/정보 내용추가하기
	 * @MethodName : insertNote
	 * @param request
	 * @param personVO
	 * @param loginVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/person/insertNote.do")
	public String insertNote(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			PersonVO personVO,
			ModelMap model){
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		personVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		try{
			cnt = personDAO.insertNote(personVO);
			LOG.debug(loginUser.getId()+"^_^personDAO.insertNote");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		
		return "person/RegistCST";
	}
	/**
	 * 고객 정보 수정 화면
	 * @MethodName : modifyCst
	 * @param request
	 * @param personVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/person/modifyCst.do")
	public String modifyCst(HttpServletRequest request,
			PersonVO personVO,
			HttpSession session,
			ModelMap model){
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());

		List<PersonVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		model.addAttribute("choose_popMain", "modifyCstPopUp");

		try{
			result = personDAO.selectMainPersonList(personVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		map.put("resultList", result);
		model.addAttribute("cstList", map.get("resultList"));
		
		return "person/ModifyCST";
	}
	/**
	 * 고객정보 수정하기
	 * @MethodName : updateCst
	 * @param personVO
	 * @param workVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/person/updateCst.do")
	public String updateCst(@ModelAttribute("personVO") PersonVO personVO,
			HttpSession session,
			LoginVO loginVO,
			ModelMap model){
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		personVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		try{
			cnt = personDAO.updateCustomer(personVO);
			LOG.debug(loginUser.getId()+"^_^personDAO.updateCustomer^_^"+personVO.getsNb());
			cnt = companyDAO.updateCEO();
			LOG.debug(loginUser.getId()+"^_^companyDAO.updateCEO");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		model.addAttribute("updateCnt", cnt);
		
		return "person/ModifyCST";
	}
	
	/**
	 * 핸드폰번호 노출/비노출 감추기
	 * @MethodName : updateCstPhn
	 * @param personVO
	 * @param session
	 * @param loginVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/person/updateCstPhn.do")
	public String updateCstPhn(@ModelAttribute("personVO") PersonVO personVO,
			HttpSession session,
			LoginVO loginVO,
			ModelMap model){
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<19) return "basic/Content";
		LOG.info(loginUser.getId());
		personVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		try{
			cnt = personDAO.updateCstPhn(personVO);
			LOG.debug(loginUser.getId()+"^_^personDAO.updateCstPhn^_^"+personVO.getsNb());
			cnt = companyDAO.updateCEO();
			LOG.debug(loginUser.getId()+"^_^companyDAO.updateCEO");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		model.addAttribute("updateCnt", cnt);
		
		return "person/ModifyCST";
	}

	/**
	 * 사람 등록화면
	 * @MethodName : rgstCst
	 * @param companyVO
	 * @param workVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/person/popRgstCst.do")
	public String popRgstCst(@ModelAttribute("personVO") PersonVO personVO, 
			WorkVO workVO,
			HttpSession session,
			ModelMap model){
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		//System.out.println("===========등록할 이름:"+personVO.getSearchCstNm()+"==============");
		LOG.info(loginUser.getId()+"^_^"+personVO.getSearchCstNm());
		model.addAttribute("cstNm", personVO.getSearchCstNm());
		model.addAttribute("page", "popUpReg");
		return "person/RegistCST";
	}
	

	
	/**
	 * 회사 일괄 업로드 엑셀
	 * @MethodName : popUpExelCst
	 * @param request
	 * @param personVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/popUpExcel.do")
	public String popUpExelCst(HttpServletRequest request,
			PersonVO personVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());

		return "person/ExcelRegistCST";
	}
	
	
	
	/**
	 * 일괄 업로드 엑셀 
	 * @MethodName : ExcelProcess
	 * @param request
	 * @param response
	 * @param personVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/person/ExcelProcess000.do")
	public String ExcelProcess(HttpServletRequest request,
			HttpServletResponse response,
			PersonVO personVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

	    int postMaxSize = 10 * 1024 * 1024;
	    //String folderPath = request.getRealPath("/upload/"); // 파일이 저장될 경로
	    String folderPath = "c:\\temp"; // 파일이 저장될 경로
	    String encoding = "UTF-8";
	    String filename = null;
	 
	    try{
		    MultipartRequest multi = new MultipartRequest(request, folderPath,
		            postMaxSize, encoding, new DefaultFileRenamePolicy());
	
		    
			// 업로드한 파일들을 Enumeration 타입으로 반환
			// Enumeration형은 데이터를 뽑아올때 유용한 인터페이스 Enumeration객체는 java.util 팩키지에 정의 되어있으므로
			// java.util.Enumeration을 import 시켜야 한다.
	    	Enumeration files = multi.getFileNames();
		    String file = (String)files.nextElement();
		    
		    filename = multi.getFilesystemName(file);
		    //System.out.println("path:" + folderPath);
		    
		    String newName1 = null;
//		    CpnUploadExcelMapping xcel = new CpnUploadExcelMapping();
		    
		    if(filename!=null){
	    		File fUpload = new File(folderPath + "/" + filename);//파일경로/파일명
	    		long fileSize = fUpload.length();//파일사이즈
	    		newName1 = "" + (System.currentTimeMillis() + 1);//새이름
	    		File fNewname1 = new File(folderPath+"/" + newName1);
	    		fUpload.renameTo(fNewname1);
	    		
	    		if(run(filename,fNewname1.getPath(),"cst")) model.addAttribute("upload", 1);
		    }
	    }catch(Exception e){
	    	LOG.error(e);
	    	e.printStackTrace();
	    	model.addAttribute("error", e);
	    }
		//System.out.println("ExcelProcess : read excel file ::" + filename);
		
		return "person/ExcelRegistCST";
	}*/
	
	/**
	 * 인물 엑셀일괄 업로드
	 * @MethodName : ExcelProcess
	 * @param request
	 * @param response
	 * @param pvo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/person/ExcelProcess.do")
	public String personExcelProcess(
			HttpServletRequest request,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());	
		
		try{
			// 정보 받기
			MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
			// 파일업로드 시키기
			String folderPath = "c:\\temp"; // 파일이 저장될 경로
			
		    File f = new File(folderPath);
		    f.mkdirs();//파일 저장될 폴더 생성
			// 넘어온 파일을 리스트로 저장
			List<MultipartFile> files = multi.getFiles("fileUrl");
			if (files.size() == 1 && files.get(0).getOriginalFilename().equals("")) {
				 
			} else {
				for (int i = 0; i < files.size(); i++) {
					String originalfileName = files.get(i).getOriginalFilename();
					if("".equals(originalfileName) || originalfileName==null){
						continue;
					}
					
					if(originalfileName!=null){
						String newFileName = "" + (System.currentTimeMillis() + 1);//새이름
						String savePath = folderPath+"/" + newFileName; //저장 될 파일 경로/이름
						
						files.get(i).transferTo(new File(savePath)); // 파일 저장
						File fNewname1 = new File(folderPath+"/" + newFileName);
						if(run(originalfileName,fNewname1.getPath(),"cst")) model.addAttribute("upload", 1);
					}
				}
			}			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
			model.addAttribute("error", e);
		}
		return "person/ExcelRegistCST";
	}
	
	/**
	 * 실질적으로 IMPORT 하는 메소드
	 * @param fileName 불러읽어들일 파일이름
	 */
	protected static String fileName = "";
	protected int sheetNo = 0;
	public boolean run(String realFileName, String fileUrl, String stuff)  throws Exception{
		FileInputStream myxls = null;
		File fileName = new File(fileUrl);
		List<PersonVO> result = null;
		PersonVO prsn = new PersonVO();
		boolean rtn = false;
		
		try {
			//System.out.println("Process start : read excel file " + FilenameUtils.getExtension(realFileName));
			myxls = new FileInputStream(fileName);
			Workbook wb = null;
			
			if("xlsx".equals(FilenameUtils.getExtension(realFileName))){
				wb = new XSSFWorkbook(myxls);
			} else {
//				POIFSFileSystem fileSystem = new POIFSFileSystem(myxls);
				wb = new HSSFWorkbook(myxls);
			}
			Sheet sheet = wb.getSheetAt(sheetNo);
			
			CpnUploadExcelMapping xcel = new CpnUploadExcelMapping();
			
			int rowNo = 0;
			Row row = null;
			//System.out.println("row num : "+sheet.getLastRowNum());
			while (rowNo++ < sheet.getLastRowNum()) {
				row = sheet.getRow(rowNo);
				CpnExcelVO vo = (CpnExcelVO) xcel.mappingColumn(row, stuff);
				//System.out.println("========"+vo.getCpnNm()+"========");
				//dao
				@SuppressWarnings("unused")
				int cnt = 0;
				
				if("cst".equals(stuff)){
					//인물이름과 회사이름으로 중복된 사람을 찾는다.
					if(personDAO.selectSearchDuplicateB4excelInsert(vo)>0) continue;
					
					if(vo.getEmail()==null||vo.getEmail().equals(""))vo.setEmail("-");
					if(vo.getPhn1()==null||vo.getPhn1().equals(""))vo.setPhn1("-");
					if(vo.getPhn2()==null||vo.getPhn2().equals(""))vo.setPhn2("-");
					if(vo.getNote()==null||vo.getNote().equals(""))vo.setNote("");
					// Calendar cal = Calendar.getInstance();
					cal.setTime( new Date(System.currentTimeMillis()) );
					String date = new SimpleDateFormat("yyyyMMdd").format( cal.getTime() );
					if(vo.getRgDt()==null||vo.getRgDt().equals(""))vo.setRgDt(date);
					cnt = personDAO.excelInsertCustomer(vo);//customer 입력
					LOG.debug("^_^personDAO.excelInsertCustomer");
					result = personDAO.selectMaxSnb(prsn);//입력된 customer snb 추출
					vo.setCstSnb(result.get(0).getsNb());
					if(vo.getNote().length() < 90) vo.setTitle(vo.getNote());
					else{
						String[] string;
						String[] sentance = {"소개","친구","방문","미팅","탐방","동기","포럼","담당","bw","/","\\n"};
						
						for(int i=0;i<sentance.length;i++){
							if(vo.getNote().matches(".*"+sentance[i]+".*")){
								string = vo.getNote().split(sentance[i]);
								if(i>sentance.length-3)vo.setTitle(string[0]);// sentance 배열의 / 와 \n 일 경우
								else vo.setTitle(string[0]+sentance[i]);
							}
							if(i == sentance.length-1){
								vo.setTitle(vo.getNote().substring(0,10)+"..");
							}
						}
						
						/*if(vo.getNote().matches(".*\\n.*")){
							string = vo.getNote().split("\\n");
							vo.setTitle(string[0]);
						}else if(vo.getNote().matches(".*소개.*")){
							string = vo.getNote().split("소개");
							vo.setTitle(string[0]+"소개");
						}else if(vo.getNote().matches(".*친구.*")){
							string = vo.getNote().split("친구");
							vo.setTitle(string[0]+"친구");
						}else if(vo.getNote().matches(".*방문.*")){
							string = vo.getNote().split("방문");
							vo.setTitle(string[0]+"방문");
						}else if(vo.getNote().matches(".*미팅.*")){
							string = vo.getNote().split("미팅");
							vo.setTitle(string[0]+"미팅");
						}else if(vo.getNote().matches(".*탐방.*")){
							string = vo.getNote().split("탐방");
							vo.setTitle(string[0]+"탐방");
						}else if(vo.getNote().matches(".*동기.*")){
							string = vo.getNote().split("동기");
							vo.setTitle(string[0]+"동기");
						}else if(vo.getNote().matches(".*포럼.*")){
							string = vo.getNote().split("포럼");
							vo.setTitle(string[0]+"포럼");
						}else if(vo.getNote().matches(".*담당.*")){
							string = vo.getNote().split("담당");
							vo.setTitle(string[0]+"담당");
						}else if(vo.getNote().matches(".*bw.*")){
							string = vo.getNote().split("bw");
							vo.setTitle(string[0]+"bw");
						}else{
							vo.setTitle(vo.getNote().substring(0,10)+"..");
						}*/
					}
					if(!vo.getNote().equals("") && vo.getNote()!=null){
						cnt = personDAO.excelInsertNote(vo);//노트(비고)입력
						LOG.debug("^_^personDAO.excelInsertNote");
					}
				}
				
//				if (!processRow(row)) break;

			}
			//System.out.println("Process succeed : commit");
			rtn = true;
		} catch (Exception e) {
			LOG.error(e);
			//System.out.println("Process error  : rollback");
			throw new RuntimeException(e);
		} finally {
			//System.out.println("Process end : close");
			if (myxls != null) {
				try {
					myxls.close();
				} catch (Exception e) {
					LOG.error(e);
				}
			}
		}
		return rtn;
	}
	
	/**
	 * @throws Exception *********************************/
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/person/test.do")
	public String test(
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			PersonVO personVO,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

//		CpnUploadExcelMapping xcel = new CpnUploadExcelMapping();
//		xcel.saveExcel(personVO);
/***********************************************************/
		PersonVO per = new PersonVO();
		
		//Excel Write
		HSSFWorkbook workbook = new HSSFWorkbook();

		HSSFSheet sheet = workbook.createSheet("Sheet1");

		//Font 설정.
		HSSFFont font = workbook.createFont();
		font.setFontName(HSSFFont.FONT_ARIAL);

		//제목의 스타일 지정
		CellStyle titlestyle = workbook.createCellStyle();
		titlestyle.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
		titlestyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
		titlestyle.setAlignment(CellStyle.ALIGN_CENTER);
		titlestyle.setFont(font);

		//Row 생성
		HSSFRow row = sheet.createRow((short)0);
		//Cell 생성
		Cell cell1 = row.createCell((short)0 );
		cell1.setCellValue("회사");
		cell1.setCellStyle(titlestyle);
		
		Cell cell2 = row.createCell((short)1 );
		cell2.setCellValue("이름");
		cell2.setCellStyle(titlestyle);

		Cell cell3 = row.createCell((short)2);
		cell3.setCellValue("소속");
		cell3.setCellStyle(titlestyle);

		Cell cell4 = row.createCell((short)3);
		cell4.setCellValue("email");
		cell4.setCellStyle(titlestyle);
		
		Cell cell5 = row.createCell((short)4);
		cell5.setCellValue("핸드폰");
		cell5.setCellStyle(titlestyle);


		//내용 스타일 지정
		CellStyle style = workbook.createCellStyle();
		style.setFont(font);

		//내용중 가운데 정렬 추가
		CellStyle styleCenter = workbook.createCellStyle();
		styleCenter.setAlignment(CellStyle.ALIGN_CENTER);
		styleCenter.setFont(font);

		List<PersonVO> result = null;
		
		try{
			result = personDAO.selectExcelDown(per);
			//System.out.println("selectExcelDown succeed : download");
		} catch (Exception e) {
			LOG.error(e);
			//System.out.println("selectExcelDown error  : rollback\n");
			e.printStackTrace();
			return "redirect:/person/selectLeft.do";
		}
	
		for (int i=0; i<result.size();i++){
		    row = sheet.createRow((short)(i+1));
		   
		    cell1 = row.createCell((short)0 );
		    cell1.setCellValue(result.get(i).getCpnNm());
		    cell1.setCellStyle(styleCenter);
		    
		    cell2 = row.createCell((short)1);
		    cell2.setCellValue(result.get(i).getCstNm());
		    cell2.setCellStyle(style);
		    
		    cell3 = row.createCell((short)2);
		    cell3.setCellValue(result.get(i).getPosition());
		    cell3.setCellStyle(style);
		    
		    cell4 = row.createCell((short)3);
		    cell4.setCellValue(result.get(i).getEmail());
		    cell4.setCellStyle(style);
		    
		    cell5 = row.createCell((short)4);
		    cell5.setCellValue(result.get(i).getPhn1());
		    cell5.setCellStyle(style);
		
	    }

		// 실제 저장될 파일 이름
		String realName = "personInfo.xls";

		// 실제로 저장될 파일 풀 경로
		File file = new File("c:\\temp" +"/", realName);

		//엑셀 파일을 만듬
		FileOutputStream fileOutput = new FileOutputStream(file);

		workbook.write(fileOutput);
//		fileOutput.close();

		//System.out.println("=================");
		//System.out.println("Excel File 생성 OK");
		//System.out.println("=================");
		
/***********************************************************/
		//System.out.println("파일명 : " + file.toString());
		// ③ MIMETYPE 설정하기
		String mimeType = request.getSession().getServletContext().getMimeType(file.toString());
		if(mimeType == null)
		{
			response.setContentType("application/octet-stream");
		}
		// ④ 다운로드용 파일명을 설정
		String downName = null;
		if(request.getHeader("user-agent").indexOf("MSIE") == -1)
		{
			downName = new String(realName.getBytes("UTF-8"), "8859_1");
		}
		else
		{
			downName = new String(realName.getBytes("EUC-KR"), "8859_1");
		}
		// ⑤ 무조건 다운로드하도록 설정
		response.setHeader("Content-Disposition","attachment;filename=\"" + downName + "\";");
		// ⑥ 요청된 파일을 읽어서 클라이언트쪽으로 저장한다.
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		byte b [] = new byte[1024];
		int data = 0;
		while((data=(fileInputStream.read(b, 0, b.length))) != -1)
		{
			servletOutputStream.write(b, 0, data);
		}
		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();		
		
/***********************************************************/
		
		model.addAttribute("saveCnt", "1");
		return "person/Left";
	}
	
	
	/**
	 * 증권사 IB 관리
	 * @MethodName : stockFirmManageMain
	 * @param personVO
	 * @param companyVO
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stockFirmManage/main.do")
	public String stockFirmManageMain(@ModelAttribute("personVO") PersonVO personVO,
			CompanyVO companyVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());

		List<CompanyVO> result = null;
		companyVO.setRecordCountPerPage(0);
		companyVO.setCpnNm("증권");
		
		try{
			result = companyDAO.selectDefaultCompanyList(companyVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("companyList", result);

		return "stockFirmManage/stockFirmManageMain";
    }
	/**
	 * 증권사 ib 관리 > 시너지 직원별 페이지
	 * @MethodName : selectStaffNstockIB
	 * @param personVO
	 * @param companyVO
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stockFirmManage/selectStaffNstockIB.do")
	public String selectStaffNstockIB(@ModelAttribute("personVO") PersonVO personVO,
			CompanyVO companyVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		StaffVO staffVO = new StaffVO();
		staffVO.setSrtCd("00050");
		List<StaffVO> result = workDAO.selectStaffList4ib(staffVO);
		model.addAttribute("userList", result);
		
		return "stockFirmManage/stockFirmManageStaff";
	}
	
	/**
	 * 증권사 ib 관리 > 시너지 직원별 페이지 (NEW)
	 * @MethodName : selectStaffNstockIB
	 * @param personVO
	 * @param companyVO
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stockFirmManage/selectStaffNstockIBNew.do")
	public String selectStaffNstockIBNew(@ModelAttribute("personVO") PersonVO personVO,
			CompanyVO companyVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		StaffVO staffVO = new StaffVO();
		staffVO.setSrtCd("00050");
		List<StaffVO> result = workDAO.selectStaffList4ib(staffVO);
		model.addAttribute("userList", result);
		
		return "stockFirmManage/stockFirmManageStaffNew";
	}
	
	
	/**
	 * 담당자 지정 등록 ajax
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 2. 19.
	 */
	@RequestMapping(value = "/stockFirmManage/doSaveCstManager.do")
	public void doSaveCstManager(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		/*
		cstList : cstSnbList,	//고객 id list (sequence list)
		usrId	: usrId			//담당자 id (로긴id)
		*/
		
		List list = null;
		String[] cstIdArry = map.get("cstList").toString().split(",");
		list = new ArrayList<String>(Arrays.asList(cstIdArry));
		
		list.remove(0);		//첫번째는 값이 없으므로 제거
		
		map.put("cstArrayList", list);
		map.put("userSeq", loginUser.getStaffSnb());
		map.put("cusId", loginUser.getCusId());
		
		int upCnt = 0;
		
		upCnt = personDAO.doSaveCstManager(map);
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
	
	/**
	 *
	 * @MethodName : selectIBajax
	 * @param personVO
	 * @param companyVO
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stockFirmManage/selectStockFirmIB.do")
	public String selectIBajax(@ModelAttribute("personVO") PersonVO personVO,
			CompanyVO companyVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		List<PersonVO> result = null;
		personVO.setRecordCountPerPage(0);
		personVO.setSort_t("1");
		
		try{
			result = personDAO.selectPersonList(personVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("companyList", result);
		
		
		return "stockFirmManage/ajaxStock";
	}
	
	/**
	 *
	 * @MethodName : selectselectStockFirmIBofStaffajax
	 * @param personVO
	 * @param companyVO
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stockFirmManage/selectStockFirmIBofStaff.do")
	public String selectselectStockFirmIBofStaffajax(@ModelAttribute("personVO") PersonVO personVO,
			CompanyVO companyVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		//System.out.println("----------error----------\n---stockFirmManage/selectStockFirmIB.do---\n---error----\n"+personVO.getCstNm());
		personVO.setTMname(personVO.getCstNm());
		List<PersonVO> result = null;
		
		// Calendar cal = Calendar.getInstance();
		cal.setTime( new Date(System.currentTimeMillis()) );
		String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
		
		personVO.setChoice_year(date.substring(0, 4));
		
		try{
			result = personDAO.selectStockFirmIBsList(personVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("cstList", result);
		
		
		return "stockFirmManage/ajaxStockFirmIBs";
	}
	
	/**
	 * 직원별 담당 증권사IB 인물 목록
	 *
	 * @MethodName : selectStockFirmIBofStaffNew
	 * @param personVO
	 * @param companyVO
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stockFirmManage/selectStockFirmIBofStaffNew.do")
	public String selectStockFirmIBofStaffNew(@ModelAttribute("personVO") PersonVO personVO,
			CompanyVO companyVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");

		LOG.info(loginUser.getId());
		
		//cal.setTime( new Date(System.currentTimeMillis()) );
		//String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
		//personVO.setChoice_year(date.substring(0, 4));
		
		List<Map> result = null;
		
		personVO.setTMname(personVO.getCstNm());
		
		try{
			if("notyet".equals(personVO.getCstNm()))
				result = personDAO.selectStockFirmIBsListNewNotyet(personVO);
			else if(!"".equals(personVO.getCstNm()))
				result = personDAO.selectStockFirmIBsListNew(personVO);
			
		}catch(Exception e){			
			e.printStackTrace();
			throw e;
		}
		
		model.addAttribute("cstList", result);
		
		model.addAttribute("sortCol", personVO.getSortCol());		//정렬 컬럼
		model.addAttribute("sortAD", personVO.getSortAD());			//정렬 방향
		
		return "stockFirmManage/ajaxStockFirmIBsNew";
	}
	
	
	/**
	 * star bookmark
	 * @MethodName : insertStockFirmIBstar
	 * @param personVO
	 * @param companyVO
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stockFirmManage/insertStockFirmIBstar.do")
	public String insertStockFirmIBstar(@ModelAttribute("personVO") PersonVO personVO,
			CompanyVO companyVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		personVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		
		try{
			if(null==personVO.getStarSnb() | personVO.getStarSnb().length()==0){
				cnt = personDAO.insertStockFirmIBstar(personVO);
				LOG.debug(loginUser.getId()+"^_^personDAO.insertStockFirmIBstar");
			} else {
				personDAO.updateStockFirmIBstar(personVO);
				LOG.debug(loginUser.getId()+"^_^personDAO.updateStockFirmIBstar^_^"+personVO.getsNb());
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("cnt", cnt);
		
		
		return "stockFirmManage/ajaxStockFirmIBs";
	}
	
	
	/**
	 *
	 * @MethodName : selectStockFirmManageLeft
	 * @param personVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stockFirmManage/selectLeft.do")
	public String selectStockFirmManageLeft(
			@ModelAttribute("personVO") PersonVO personVO, 
			HttpSession session,
			ModelMap model) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());

		StaffVO staffVO = new StaffVO();
		staffVO.setSrtCd("00050");
		List<StaffVO> result = workDAO.selectStaffList4ib(staffVO);
		model.addAttribute("userList", result);
		
		return "stockFirmManage/stockFirmManageLeft";
	}
	
	
	/**
	 * 인물 이력/정보, 네트워크, 딜경력 삭제
	 * @MethodName : deleteNetwork
	 * @param personVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/deleteNetwork.do")
	public String deleteNetwork(
			@ModelAttribute("personVO") PersonVO personVO, 
			HttpSession session,
			ModelMap model) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		int cnt = 0;
		try{
			cnt = personDAO.deletePersonNetInfo(personVO);
			LOG.debug(loginUser.getId()+"^_^personDAO.deletePersonNetInfo");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		return "stockFirmManage/stockFirmManageLeft";
	}
	
	/**
	 *
	 * @MethodName : modifyNetwork
	 * @param personVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/modifyNetwork.do")
	public String modifyNetwork(
			@ModelAttribute("personVO") PersonVO personVO, 
			HttpSession session,
			ModelMap model) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		personVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		try{
			cnt = personDAO.modifyPersonNetInfo(personVO);
			LOG.debug(loginUser.getId()+"^_^personDAO.modifyPersonNetInfo^_^"+personVO.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		return "stockFirmManage/stockFirmManageLeft";
	}
	
	
	
	/**
	 * 친밀도 수정
	 * @MethodName : saveLvCd
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/saveLvCd.do")
	public String saveLvCd(
			@ModelAttribute("personVO") PersonVO vo, 
			HttpSession session,
			ModelMap model) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());
		
		try{
			personDAO.saveNetPoionLvCD(vo);
			LOG.debug(loginUser.getId()+"^_^personDAO.saveNetPoionLvCD^_^"+vo.getsNb());
			
			//인물네트워크 && 친밀도3이상
			if("NP".equals(vo.getFlag()) && Integer.parseInt(vo.getLvCd())>2){
				//두명 중에 최소한 한명이 직원이다.
				model.addAttribute("result",networkDAO.selectStaffInNetworkCnt(vo));
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		return "basic/result";
	}
	

	/**
	 * 인물 -> 참여모임 페이지
	 * @MethodName : selectMeeTingList
	 * @param personVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/meeTing.do")
	public String selectAttendMeeTingList(
			@ModelAttribute("personVO") PersonVO vo, 
			HttpSession session,
			ModelMap model) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		try{
			model.addAttribute("meetList", personDAO.selectAttendMeetingList(vo));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "person/ajaxImport/Meeting";
	}
	
	/**
	 * 인물 -> 참여모임 -> 모임리스트 페이지 
	 * @MethodName : selectMeeTingsList
	 * @param personVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/meeTingList.do")
	public String selectMeeTingsList(
			@ModelAttribute("personVO") PersonVO vo, 
			HttpSession session,
			ModelMap model) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		try{
			vo.setFirstIndex(0);
			model.addAttribute("meetList", personDAO.selectMeetingList(vo));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "person/ajaxImport/MeetingList";
	}
	/**
	 * 새로운 모임추가
	 * @MethodName : insertMeeTing
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/insertMeeting.do")
	public String insertMeeTing(
			@ModelAttribute("personVO") PersonVO vo, 
			HttpSession session,
			ModelMap model) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());
		
		try{
			personDAO.insertMeeting(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "person/ajaxImport/MeetingList";
	}
	
	/**
	 * 인물 -> 모임 : 처리 (insert/update/delete)
	 * @MethodName : processMeeTingList
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/person/processMeeTing.do")
	public String processAttendMeeTingList(
			@ModelAttribute("personVO") PersonVO vo, 
			HttpSession session,
			ModelMap model) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());
		
		int listLeng = vo.getArrMeetSnb().length
				,listDel = 0;
		
		if(vo.getArrDelYn() != null) listDel = vo.getArrDelYn().length;
		
		try{
			for(int i=0; i<listLeng; i++){
				
				if(Util.init_array(vo.getArrSnb(), 		i, vo, 1000, "N"))		vo.setsNb(vo.getRtnVal());
				if(Util.init_array(vo.getArrMeetSnb(), 	i, vo, 1000, "N"))		vo.setMeetSnb(vo.getRtnVal());
				if(Util.init_array(vo.getArrDelYn(), 	i, vo, listDel, "N"))		vo.setDelYn(vo.getRtnVal());
				else vo.setDelYn("");
				if(Util.init_array(vo.getArrComment(), 	i, vo, 1000, ""))	vo.setNote(vo.getRtnVal());
				
				if("on".equals(vo.getDelYn())){
					vo.setDelYn("Y");
					//삭제
					personDAO.updateAttendMeet(vo);
					continue;
				}vo.setDelYn("N");
				if("N".equals(vo.getMeetSnb())){
					continue;
				}
				if("N".equals(vo.getsNb())){
					//insert
					//중복확인
					if(personDAO.selectAttendMeetingListCnt(vo)>0){
						model.addAttribute("duplic", 1);
						continue;
					}
					personDAO.insertAttendMeet(vo);
				}else{
					//update
					personDAO.updateAttendMeet(vo);
//					System.out.println("update - "+vo.getsNb()+"::"+vo.getMeetSnb()+"::"+vo.getDelYn()+"::"+vo.getNote());
				}
					
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		model.addAttribute("saveCnt", 1);
		
		return "person/ajaxImport/Meeting";
	}
	
	
	
	/**
	 * 담당자 등록(인물등록시 담당자 확정 ... status == 'Y')
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 3. 18.
	 */
	@RequestMapping(value = "/person/doSaveCstManagerDirect.do")
	public void doSaveCstManagerDirect(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		/*
		cstList : cstSnbList,	//고객 id list (sequence list)
		usrId	: usrId			//담당자 id (로긴id)
		*/
		
		List list = null;
		String[] cstIdArry = map.get("cstList").toString().split(",");
		list = new ArrayList<String>(Arrays.asList(cstIdArry));
		
		list.remove(0);		//첫번째는 값이 없으므로 제거
		
		map.put("cstArrayList", list);
		map.put("userSeq", loginUser.getStaffSnb());
		map.put("cusId", loginUser.getCusId());
		
		int upCnt = 0;
		
		upCnt = personDAO.doSaveCstManagerDirect(map);
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
}