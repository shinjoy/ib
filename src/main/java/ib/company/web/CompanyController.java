package ib.company.web;

import ib.basic.service.CpnExcelVO;
import ib.basic.service.impl.CpnUploadExcelMapping;
import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.company.service.CompanyService;
import ib.company.service.CompanyVO;
import ib.company.service.impl.CompanyDAO;
import ib.crm.admin.service.AdminService;
import ib.crm.admin.service.impl.AdminDAO;
import ib.notice.service.NoticeService;
import ib.notice.service.NoticeVO;
import ib.notice.service.impl.NoticeDAO;
import ib.person.service.PersonVO;
import ib.person.service.impl.PersonDAO;
import ib.recommend.service.RecommendVO;
import ib.schedule.service.CusVO;
import ib.schedule.service.Utill;
import ib.work.service.WorkVO;
import ib.work.service.impl.WorkDAO;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
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
import org.springframework.web.servlet.ModelAndView;

import au.com.bytecode.opencsv.CSVReader;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller
public class CompanyController {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name = "personDAO")
    private PersonDAO personDAO; 
    
    @Resource(name = "adminDAO")
    private AdminDAO adminDAO;
    
    @Resource(name = "adminService")
    private AdminService adminService;
    
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;

    @Resource(name = "companyDAO")
    private CompanyDAO companyDAO;   
    
    @Resource(name = "noticeService")
    private NoticeService noticeService;   
    
    @Resource(name = "noticeDAO")
    private NoticeDAO noticeDAO;   
    
    @Resource(name = "workDAO")
    private WorkDAO workDAO;
    
    
    @Resource(name = "companyService")
    protected CompanyService companyService;
    
    
	/** log */
    protected static final Log LOG = LogFactory.getLog(CompanyController.class);

    
	/**
	 * 회사 검색 초기 화면
	 * @MethodName : index
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/company/index.do")
	public String index(@ModelAttribute("companyVO") CompanyVO companyVO, 
			WorkVO workVO,
			HttpSession session,
			ModelMap model){

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		List<WorkVO> cpnNet = null;
		try {
			cpnNet = companyDAO.selectCpnNetList(workVO);
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("cpnNetList", cpnNet);
		
    	return "company/CompanyMain";
    }
	
	
	/**
	 * 회사 상세
	 *
	 * @MethodName : main
	 * @param companyVO
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/company/main.do")
	public String main(@ModelAttribute("companyVO") CompanyVO companyVO, 
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		model.addAttribute("popUp", companyVO.getPopUp());

		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(workVO.ccdCateCd));
		model.addAttribute("cmmCdOfferList", cmm.CommonCdList(workVO.ccdOffCd));
		model.addAttribute("cmmCd1stSlctList", cmm.CommonCdList("00015"));
		model.addAttribute("cmmCdProgressCdList", cmm.CommonCdList("00003"));
		model.addAttribute("cmmCdResultList", cmm.CommonCdList("00010"));
//		model.addAttribute("cmmCdDealList", cmm.CommonCdList("00011"));
		
//		System.out.println("===========/index.do : basic/Main==============");
		
		List<CompanyVO> result = null;
		List<CompanyVO> note = null;
		List<CompanyVO> net = null;
		List<CompanyVO> cpnCst = null;
//		List<WorkVO> offer = null;
		List<WorkVO> offer2 = null;
		List<WorkVO> employee = null;
		List<WorkVO> contact2 = null;
		try{
			if(companyVO.getsNb()==null||companyVO.getsNb().equals("")){
				if(companyVO.getCpnId()!=null&!companyVO.getCpnId().equals("")){
					result = companyDAO.selectMainCompanyList2(companyVO);
				}
			}
			else
				result = companyDAO.selectMainCompanyList(companyVO);
			
			//if(Integer.parseInt((String)map.get("resultList"))==0) return "company/CompanyMain";

			companyVO.setCstSnb(result.get(0).getCeoId());
			companyVO.setsNb(result.get(0).getsNb());
			workVO.setCpnId(result.get(0).getCpnId());

			note = companyDAO.selectNoteList2(companyVO);
//			offer = workDAO.selectOfferCpnList(workVO);
			employee = companyDAO.selectEmployeeList(workVO);
			offer2 = workDAO.selectOfferCpnList2(workVO);
			model.addAttribute("offerInfoList", workDAO.selectofferInfoInCpnCst(workVO));
			contact2 = workDAO.selectOffercontactPoint(workVO);
			cpnCst = companyDAO.selectCpnCstInfoList(companyVO);
			
			if(companyVO.getCstSnb()!=null && !companyVO.getCstSnb().equals(""))
				net = companyDAO.selectNetPointList(companyVO);
			
			NoticeVO nvo = new NoticeVO();
			nvo.setCpnId(workVO.getCpnId());
			model.addAttribute("NoticeList", noticeService.selectNoticeMezzaine(nvo));
			
			PersonVO pvo = new PersonVO();
			pvo.setsNb(companyVO.getCstSnb());
			model.addAttribute("meetList", personDAO.selectAttendMeetingList(pvo));
			
			@SuppressWarnings({ "unchecked", "rawtypes" })
			Map<String,Object> cmmnMap = new HashMap();
			cmmnMap.put("cpnSnb",companyVO.getsNb());
			model.addAttribute("investmentList", companyDAO.selectInvestmentList(cmmnMap));
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		//System.out.print("4444444444444444444"+result.get(0).getCeoId().toString());
		
		model.addAttribute("companyList", result);
		model.addAttribute("noteList", note);
		model.addAttribute("netList", net);
//		model.addAttribute("offerList", map.get("offerList"));
		model.addAttribute("employeeList", employee);
		model.addAttribute("offerList2", offer2);
//		model.addAttribute("contactList", map.get("contactList"));
		model.addAttribute("contactList2", contact2);
		model.addAttribute("cstList", cpnCst);
		
    	return "company/CompanyMain";
    }
	

	/**
	 * 회사 왼쪽메뉴
	 *
	 * @MethodName : selectLeft
	 * @param companyVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/company/selectLeft.do")
	public String selectLeft(@ModelAttribute("companyVO") CompanyVO companyVO,
			HttpServletRequest request,
			HttpSession session,
			ModelMap model) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		int totCnt = 0;
		List<CompanyVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		//System.out.println("===========/searchName:"+companyVO.getCpnNm()+"==============");
		model.addAttribute("searchName", companyVO.getCpnNm());
		
        PaginationInfo paginationInfo = new PaginationInfo();
        
        paginationInfo.setCurrentPageNo(companyVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(12);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(4);//페이징 리스트의 사이즈

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

        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        model.addAttribute("message", MessageSource.getMessage("success.common.select"));
        
		return "company/Left";
	}
	
	
	/**
	 *
	 * @MethodName : searchName
	 * @param companyVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/company/searchName.do")
	public String searchName(@ModelAttribute("companyVO") CompanyVO companyVO, 
			HttpSession session,
			ModelMap model) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		String searchName = companyVO.getCpnNm();
		LOG.info(loginUser.getId()+"^_^"+searchName);
		

		int totCnt = 0;
		List<CompanyVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		model.addAttribute("searchName", searchName);

		int pasingListSize = 4;
        /*if(9<companyVO.getPageIndex()){
        	pasingListSize = 5;
        	if(96<companyVO.getPageIndex()) pasingListSize = 3;
        }*/
		
        PaginationInfo paginationInfo = new PaginationInfo();
        
        paginationInfo.setCurrentPageNo(companyVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(12);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(pasingListSize);//페이징 리스트의 사이즈

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
		
        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        model.addAttribute("message", MessageSource.getMessage("success.common.select"));
		
		//System.out.println("===========/searchName:"+companyVO.getCpnNm()+"==============");
		
		return "company/Left";
    }
	/**
	 * ajax 실시간 검색
	 * @MethodName : ajaxSearchName
	 * @param companyVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 2. 6.
	 */
	@RequestMapping(value="/company/ajaxSearchName.do")
	public String ajaxSearchName(@ModelAttribute("companyVO") CompanyVO companyVO, 
			HttpSession session,
			ModelMap model) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		String searchName = companyVO.getCpnNm();
		LOG.info(loginUser.getId()+"^_^"+searchName);
		
		
		int totCnt = 0;
		List<CompanyVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		model.addAttribute("searchName", searchName);
		
		int pasingListSize = 4;
		/*if(9<companyVO.getPageIndex()){
        	pasingListSize = 5;
        	if(96<companyVO.getPageIndex()) pasingListSize = 3;
        }*/
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(companyVO.getPageIndex());//현재 페이지 번호
		paginationInfo.setRecordCountPerPage(12);//한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(pasingListSize);//페이징 리스트의 사이즈
		
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
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		model.addAttribute("message", MessageSource.getMessage("success.common.select"));
		
		//System.out.println("===========/searchName:"+companyVO.getCpnNm()+"==============");
		
		return "includeJSP/CpnLeft";
	}
	
	/**
	 * 회사 등록화면
	 * @MethodName : rgstCpn
	 * @param companyVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/company/rgstCpn.do")
	public String rgstCpn(@ModelAttribute("companyVO") CompanyVO companyVO,
							HttpSession session,
							ModelMap model,
							@RequestParam Map<String,String> map){
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		List<Map> result = null;
		try{
			result = companyDAO.selectMaxCpnIds(map);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		model.addAttribute("maxSeq", result.get(0).get("seq"));
		model.addAttribute("maxASeq", result.get(0).get("aSeq"));
		
		model.addAttribute("cpnNm", companyVO.getSearchCpnNm());
		
		return "company/RegistCPN";
	}
	

	/**
	 * 회사 등록하기
	 * @MethodName : insertCpn
	 * @param companyVO
	 * @param session
	 * @param loginVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/company/insertCpn.do")
	public String insertCpn(@ModelAttribute("companyVO") CompanyVO companyVO,
			HttpSession session,
			LoginVO loginVO,
			ModelMap model){
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		companyVO.setRgId(loginUser.getId());
		LOG.info(loginUser.getId());
		
		int cnt = 0;
		try{
			cnt = companyDAO.insertCompany(companyVO);
			
			LOG.debug(loginUser.getId()+"^_^companyDAO.insertCompany");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);

		return "company/RegistCPN";
	}
	
	
	/**
	 * 회사 등록하기 ajax
	 * @MethodName : insertCpn
	 * @param companyVO
	 * @param session
	 * @param loginVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/company/insertCpnAjax.do")
	public void insertCpnAjax(@ModelAttribute("companyVO") CompanyVO companyVO,
			HttpSession session,
			HttpServletResponse response,
			LoginVO loginVO,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return ;		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		companyVO.setRgId(loginUser.getId());
		LOG.info(loginUser.getId());
		
		int cpnId = 0;
		try{
			cpnId = companyDAO.insertCompany(companyVO);
			
			LOG.debug(loginUser.getId()+"^_^companyDAO.insertCompany");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		HashMap map = new HashMap();
		map.put("cpnId", cpnId);

		AjaxResponse.responseAjaxObject(response, map);	//결과전송
	}
	

	/**
	 *
	 * @MethodName : updateCpn
	 * @param companyVO
	 * @param session
	 * @param loginVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/company/updateCpn.do")
	public String updateCpn(@ModelAttribute("companyVO") CompanyVO companyVO,
			HttpSession session,
			LoginVO loginVO,
			ModelMap model){
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		companyVO.setRgId(loginUser.getId());
		LOG.info(loginUser.getId());
		
		int cnt = 0;
		try{
			cnt = companyDAO.updateCompany(companyVO);
			LOG.debug(loginUser.getId()+"^_^companyDAO.updateCompany^_^"+companyVO.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("updateCnt", cnt);
		
		return "company/CompanyMain";
	}

	/**
	 * 회사/인물 페이지 회사 needs 수정
	 * @MethodName : modifyOfferInfo
	 * @param request
	 * @param wVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/company/modifyOfferInfo.do")
	public String modifyOfferInfo(HttpServletRequest request,
			WorkVO wVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		wVO.setRgId(loginUser.getId());
		
		workDAO.updateOfferInfo(wVO);
		LOG.debug(loginUser.getId()+"^_^workDAO.updateOfferInfo^_^"+wVO.getsNb());
		model.addAttribute("result", 0);
		
		return "basic/result";
	}
	
	/**
	 * 회사 일괄 업로드 엑셀
	 * @MethodName : popUpCst
	 * @param request
	 * @param personVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/company/popUpExcel.do")
	public String popUpCst(HttpServletRequest request,
			PersonVO personVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		return "company/ExcelRegistCPN";
	}
	
	
	/**
	 * 회사 일괄 업로드 CSV 파일 ... 20160719
	 * @MethodName : popUpCst
	 * @param request
	 * @param personVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/company/uploadCompanyByCsv.do")
	public String uploadCompanyByCsv(HttpServletRequest request,
			PersonVO personVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		return "company/uploadCompanyByCsv";
	}
	
	/**
	 * 시가등록 및 회사(상장)
	 * @MethodName : 
	 * @param request
	 * @param personVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/company/uploadStockCompany.do")
	public String uploadStockCompany(HttpServletRequest request,
			@RequestParam Map<String,Object>map,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		model.addAllAttributes(map);
		
		return "company/uploadStockCompany";
	}
	
	

	// 주식 시가 일괄 등록 완료
	@SuppressWarnings({ "resource", "rawtypes", "unchecked" })
	@RequestMapping(value = "/company/stockPriceAddEnd.do")
	public String StockPriceAddEnd(
			HttpSession session, HttpServletRequest req, ModelMap model,CusVO vo) throws Exception {
		
		try{
		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
	
		final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;
		final Map<String, MultipartFile> files = multiRequest.getFileMap();

		String newFilePath = "F:\\SynergyCus\\DATA\\CSV\\StockPriceAdd\\"+ Utill.Today("Year") + Utill.Today("Month") + "";
		newFilePath = Utill.getAlternativePath(newFilePath);
		vo.setFilePath(newFilePath);
		
		File FileDir = new File(vo.getFilePath());
		if(!FileDir.exists() || FileDir.isFile()) FileDir.mkdirs();

		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;

		String fileNm = "";
		
		while(itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			if(!"".equals(file.getOriginalFilename())) {
				vo.setFileUpNm(Utill.UpFileReName(file, file.getOriginalFilename(), vo.getFilePath())); // 파일명 변경
				fileNm = vo.getFilePath() + "/" + vo.getFileUpNm();
				file.transferTo(new File(fileNm));		//vo.getFilePath() + "/" + vo.getFileUpNm())); // 파일 카피
			}
		}

		FileInputStream is = new FileInputStream(fileNm);			//vo.getFilePath() + "\\" + vo.getFileUpNm());
		InputStreamReader isr = new InputStreamReader(is, "EUC-KR");

		CSVReader reader = new CSVReader(isr);
		List myEntries = reader.readAll();
				
		reader.close();
		isr.close();
		is.close();
		
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> Catelist = new ArrayList<Map<String, Object>>();
		String PriceDate = "";
		
		for(int i = 9; i < myEntries.size(); i++) {
			String[] arr = (String[]) myEntries.get(i);
			String Data = "";
			CusVO TmpVO = new CusVO();
			
			for(int m = 0; m < arr.length; m++) {
				Data = arr[m].toString().trim();
				if(i > 12) {
					if(m == 0) TmpVO.setComCd(Data);				// 회사코드
					else if(m == 1) TmpVO.setComNm(Data);			// 회사명
				}
			}
			Map<String, Object> CateTemp = new HashMap<String, Object>();
			
			if(i > 12) {
				if(!TmpVO.getComCd().equals("")) {
					CateTemp.put("ComCd", TmpVO.getComCd());
					CateTemp.put("ComNm", TmpVO.getComNm());
					CateTemp.put("RegPerSabun", loginUser.getSabun());
					Catelist.add(CateTemp);
				}
			}
			
			
			CateTemp = null;
			TmpVO = null;
			
		}
		if(Catelist.size() > 0) adminDAO.AutoCateAddEnd(Catelist);
		
		vo.setSubCateCd("2");
		List<Map<String, Object>> PriceAddList = adminDAO.GetPriceAddList(vo);
		model.addAttribute("PriceAddList", PriceAddList);
		
		for(int i = 9; i < myEntries.size(); i++) {
			String[] arr = (String[]) myEntries.get(i);
			String Data = "";
			CusVO TmpVO = new CusVO();

			for(int m = 0; m < arr.length; m++) {
				Data = arr[m].toString().trim();
				if(i == 9 && m == 2) PriceDate = Data.substring(0, 4) + "-" + Data.substring(4, 6) + "-" + Data.substring(6, 8);	// 날짜
				if(i > 12) {
					if(m == 0) TmpVO.setCateCd(Data);				// 회사코드
					else if(m == 2) TmpVO.setUnitPrice(Data);		// 시가
					else if(m == 3) TmpVO.setPublicStock(Data);	// 상장주식수
					else if(m == 4) TmpVO.setStockValue(Data);	// 시가총액
					else if(m == 5) TmpVO.setOwnStock(Data);		// 자기주식수
					else if(m == 6) TmpVO.setFaceValue(Data);		// 액면가
					TmpVO.setPriceDate(PriceDate);
				}
			}
			
			Map<String, Object> paramTemp = new HashMap<String, Object>();
			
			if(i > 12) {
				for(int cnt = 0; cnt < PriceAddList.size(); cnt++) {
					if(PriceAddList.get(cnt).get("catecd").toString().equals(TmpVO.getCateCd())) {
						paramTemp.put("CateCd", TmpVO.getCateCd());
						paramTemp.put("PriceSeq", PriceAddList.get(cnt).get("priceseq").toString());
						paramTemp.put("PriceDate", TmpVO.getPriceDate());
						
						paramTemp.put("UnitPrice", TmpVO.getUnitPrice().equals("") ? "0" : TmpVO.getUnitPrice());
						paramTemp.put("PublicStock", TmpVO.getPublicStock().equals("") ? "0" : TmpVO.getPublicStock());
						paramTemp.put("StockValue", TmpVO.getStockValue().equals("") ? "0" : TmpVO.getStockValue());
						paramTemp.put("OwnStock", TmpVO.getOwnStock().equals("") ? "0" : TmpVO.getOwnStock());
						paramTemp.put("FaceValue", TmpVO.getFaceValue().equals("") ? "0" : TmpVO.getFaceValue());
						
						paramTemp.put("RegPerSabun", loginUser.getSabun());
	
						if(!TmpVO.getPriceDate().equals(PriceAddList.get(cnt).get("pricedate").toString())) {		// 등록일과 마지막 등록일이 다르면 무조건 등록
							list.add(paramTemp);
						}
						else if(!TmpVO.getUnitPrice().equals(PriceAddList.get(cnt).get("unitprice").toString())) {	// 등록일과 마지막 등록일이 같고, 입력하는 금액과 마지막 금액이 다르면 업데이트
							paramTemp.put("PriceSeq", PriceAddList.get(cnt).get("lastpriceseq").toString());
							list.add(paramTemp);
						}
						PriceAddList.remove(cnt);
					}
				}
			}
			
			
			paramTemp = null;
			TmpVO = null;
			
		}//for
		
		if(list.size() > 0) adminService.PriceAddEnd(list);
		
		
		req.setAttribute("uploadType", "stock");
		
		return "forward:/company/uploadStockCompany.do";
		
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	
	// 회사 기본정보 일괄 등록 완료
	@SuppressWarnings({ "resource", "rawtypes" })
	@RequestMapping(value = "/company/companyInfoAddEnd.do")
	public String CompanyInfoAddEnd(HttpServletRequest req, CusVO vo, ModelMap model,HttpSession session) throws Exception {
		
		try{		
		
			LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
			
			final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;
			final Map<String, MultipartFile> files = multiRequest.getFileMap();
	
			String newFilePath = "F:\\SynergyCus\\DATA\\CSV\\CompanyInfoAdd\\"+ Utill.Today("Year");
			newFilePath = Utill.getAlternativePath(newFilePath);
			vo.setFilePath(newFilePath);		
	
			File FileDir = new File(vo.getFilePath());
			if(!FileDir.exists() || FileDir.isFile()) FileDir.mkdirs();
	
			Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
			MultipartFile file;
	
			while(itr.hasNext()) {
				Entry<String, MultipartFile> entry = itr.next();
				file = entry.getValue();
				if(!"".equals(file.getOriginalFilename())) {
					vo.setFileUpNm(Utill.UpFileReName(file, file.getOriginalFilename(), vo.getFilePath())); // 파일명 변경
					file.transferTo(new File(vo.getFilePath() + "/" + vo.getFileUpNm())); // 파일 카피
				}
			}
	
			FileInputStream is = new FileInputStream(vo.getFilePath() + "\\" + vo.getFileUpNm());
			InputStreamReader isr = new InputStreamReader(is, "EUC-KR");
	
			CSVReader reader = new CSVReader(isr);
			List myEntries = reader.readAll();
	
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			
			for(int i = 13; i < myEntries.size(); i++) {		//index 13 곧, 14번째 줄부터 등록해준다.
				String[] arr = (String[]) myEntries.get(i);
				String Data = "";
				
				CusVO TmpVO = new CusVO();
				Map<String, Object> paramTemp = new HashMap<String, Object>();
				
				for(int k = 0; k < arr.length; k++) {
					Data = arr[k].toString().trim();
					//if(i > 12) {
						if(k == 0) TmpVO.setComCd(Data);						// 회사코드
						else if(k == 1) TmpVO.setComNm(Data);					// 회사명
						else if(k == 2) TmpVO.setAccountMonth(Data);			// 결산월
						else if(k == 3) TmpVO.setMarketType(Data);				// 시장구분
						else if(k == 4) TmpVO.setAddr(Data);					// 주소
						else if(k == 5) TmpVO.setTel(Data.replace(")", "-"));	// 전화번호
						else if(k == 6) TmpVO.setIRTel(Data);					// IR담당자
						else if(k == 7) TmpVO.setCEO(Data);						// 대표이사
						
						else if(k == 8) TmpVO.setBusiType(Data);				// WICS업종명(소)
						else if(k == 9) TmpVO.setMaxHolder(Data);				// 최대주주명
						else if(k == 10) TmpVO.setMaxHaveStockRate(Data);		// 최대주주보유보통주지분율
						else if(k == 11) TmpVO.setFoundDate(Data);				// 설립일
						else if(k == 12) TmpVO.setPublicDate(Data);				// 상장일
						else if(k == 13) TmpVO.setEmpCnt(Data);					// 종업원수
					//}
				}
				//if(i > 12) {
					paramTemp.put("ComCd", TmpVO.getComCd());																		// 회사코드
					paramTemp.put("ComNm", TmpVO.getComNm());																		// 회사명
					paramTemp.put("AccountMonth", TmpVO.getAccountMonth());															// 결산월
					paramTemp.put("MarketType", TmpVO.getMarketType().equals("") ? null : TmpVO.getMarketType());					// 시장구분
					paramTemp.put("Addr", TmpVO.getAddr().equals("") ? null : TmpVO.getAddr());										// 주소
					paramTemp.put("Tel", TmpVO.getTel().equals("") ? null : TmpVO.getTel());										// 전화번호
					paramTemp.put("IRTel", TmpVO.getIRTel().equals("") ? null : TmpVO.getIRTel());									// IR담당자
					paramTemp.put("CEO", TmpVO.getCEO().equals("") ? null : TmpVO.getCEO());										// 대표이사
					paramTemp.put("BusiType", TmpVO.getBusiType().equals("") ? null : TmpVO.getBusiType());							// WICS업종명(소)
					paramTemp.put("MaxHolder", TmpVO.getMaxHolder().equals("") ? null : TmpVO.getMaxHolder());						// 최대주주명
					paramTemp.put("MaxHaveStockRate", TmpVO.getMaxHaveStockRate().equals("") ? null : TmpVO.getMaxHaveStockRate());	// 최대주주보유보통주지분율
					paramTemp.put("FoundDate", TmpVO.getFoundDate().equals("") ? null : TmpVO.getFoundDate());						// 설립일
					paramTemp.put("PublicDate", TmpVO.getPublicDate().equals("") ? null : TmpVO.getPublicDate());					// 상장일
					paramTemp.put("EmpCnt", TmpVO.getEmpCnt().equals("") ? null : TmpVO.getEmpCnt());								// 종업원수
					paramTemp.put("RegPerSabun", loginUser.getSabun());
					list.add(paramTemp);
				//}
			}
			
			for(int a = 0; a < list.size(); a++) {
				System.out.println(a+"=="+list.get(a));
			}
			System.out.println("list.size()=="+list.size());
			
			if(list.size() > 0) adminDAO.CompanyInfoAddEnd(list);
			return "forward:/company/uploadStockCompany.do";
		
		}catch(Exception e){
			LOG.error("회사등록 에러", e);
			e.printStackTrace();
			throw e;
		}

	}
	
	
	
	
	
	/**
	 * 회사 일괄 업로드 엑셀 - 회사등록하기
	 * @MethodName : ExcelProcess
	 * @param request
	 * @param response
	 * @param personVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 *
	 
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/company/ExcelProcess000.do")
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
	    		
	    		if(run(filename,fNewname1.getPath(),"cpn")) model.addAttribute("upload", 1);
		    }
	    }catch(Exception e){
	    	LOG.error(e);
	    	e.printStackTrace();
	    }
		//System.out.println("ExcelProcess : read excel file ::" + filename);
		
		return "company/ExcelRegistCPN";
	}*/
	
	/**
	 * 회사 일괄 업로드 엑셀 - 회사등록하기
	 * @MethodName : uploadExel
	 * @param request
	 * @param response
	 * @param rcmdVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/company/ExcelProcess.do")
	public String uploadExel( 
			HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("rcmdVO") RecommendVO rcmdVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			// 정보 받기
			MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
			String staff = (String)multi.getParameter("staff");
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
//	                	if(run(originalfileName,fNewname1.getPath(),"cpn")) model.addAttribute("upload", 1);
		                if(runss(originalfileName,fNewname1.getPath(),staff)) model.addAttribute("upload", 1);
	                }
	            }
	        }			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
			throw e;
		}
		return "company/ExcelRegistCPN";
	}
	
		
	/**
	 * 회사 일괄 업로드 - CSV
	 * @MethodName : uploadExel
	 * @param request
	 * @param response
	 * @param rcmdVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/company/uploadCompanyProcess.do")
	public void uploadCompanyProcess( 
			HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("rcmdVO") RecommendVO rcmdVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return;	// "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		response.setCharacterEncoding("EUC-KR");
		PrintWriter out = response.getWriter();
		
		try{
			// 정보 받기
			MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
			String staff = (String)multi.getParameter("staff");		//cpn
			// 파일업로드 시키기
			//String folderPath = "c:\\temp"; // 파일이 저장될 경로
			
			String folderPath = "F:\\IBsystem_CSV\\Company\\" + Utill.Today("Year");		// 파일이 저장될 경로
			
		    File f = new File(folderPath);
		    f.mkdirs();//파일 저장될 폴더 생성
		    
			// 넘어온 파일을 리스트에 담아서
			List<MultipartFile> files = multi.getFiles("fileUrl");
			if (files.size() == 1 && files.get(0).getOriginalFilename().equals("")) {
	             
	        } else {
	            for (int i = 0; i < files.size(); i++) {
	                String originalfileName = files.get(i).getOriginalFilename();
	                if("".equals(originalfileName) || originalfileName==null){
	                	continue;
	                }
	                
	                
                	//String newFileName = "" + (System.currentTimeMillis() + 1);		//새이름
                	String newFileName = Utill.UpFileReName(files.get(0), originalfileName, folderPath);		//새이름
                	String savePath = folderPath + "/" + newFileName; 					//저장 될 파일 경로/이름
                	
                	files.get(i).transferTo(new File(savePath)); // 파일 저장
                	File fNewname1 = new File(savePath);
	                //if(runss(originalfileName, fNewname1.getPath(), staff)) model.addAttribute("upload", 1);
                	
                	
                	//----------------------------------- 등록 :S -----------------------------------
                	Map result = companyService.uploadCompanyProcess(loginUser, fNewname1);
                	
                	
                	model.put("upload", result.get("upload"));			//업로드 success
	    		
                	
                	
                	if("0".equals(result.get("upload").toString()))
                		out.print(result.get("failMsg").toString());
                		//model.put("failMsg", result.get("failMsg").toString());
                	//model.put("upload", result.get("upload"));			//업로드 fail
                	else	
                		out.print("SUCCESS!!");
                	
                	
	            }
	        }
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
			
			model.put("upload", 0);			//업로드 fail
        	model.put("failMsg", e.getMessage());
        	
        	throw e;
		}
		
		
		//return "company/uploadCompanyByCsv";
	}
	
	
	/***********************************/
	
	/**
	 * EXCEL 의 IMPORT 할 데이터 내용 console 로 출력
	 * @param row
	 * @return
	 * @throws Exception
	 */
	public boolean processRow(Row row) throws Exception {
		Cell cell = null;
		for (int i = 0; i < row.getLastCellNum(); i++) {
			cell = row.getCell((short) i);
			
			if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
				System.out.print(row.getCell((short) i));
			} else if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
				System.out.print(row.getCell((short) i));
			}
			
			System.out.print("\t");
		}
		//System.out.println();
		return true;
	}

	
	/**
	 * 2014년 현재 주석처리됨////
	 * 실질적으로 IMPORT 하는 메소드
	 * @param fileName 불러읽어들일 파일이름
	 */
	protected static String fileName = "";
	protected int sheetNo = 0;
	public boolean run(String realFileName, String fileUrl, String stuff) {
		FileInputStream myxls = null;
		File fileName = new File(fileUrl);
		CpnExcelVO vo = new CpnExcelVO();
//		List<PersonVO> result = null;
//		PersonVO prsn = new PersonVO();
		
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
				vo = (CpnExcelVO) xcel.mappingColumn(row, stuff);
				@SuppressWarnings("unused")
				int cnt = 0;
				if("cpn".equals(stuff))	{
					cnt = companyDAO.insertNupdateCompanyExel(vo); //INSERT DUPLICATED UPDATE
//					LOG.debug("^_^companyDAO.insertNupdateCompanyExel");
					
				}else if("exp".equals(stuff))	{
					WorkVO wvo = new WorkVO();
					wvo.setCpnId(vo.getCpnId());
					List<WorkVO> rslt = workDAO.selectCompanyOpinion(wvo);
					
					StringBuilder sb = new StringBuilder(vo.getText());
					if(!rslt.isEmpty() && rslt.get(0).getOpinion()!= null){
						sb.append("&#10;");
						sb.append(rslt.get(0).getOpinion());
					}
					vo.setOpinion(sb.toString());
					vo.setTmpNum1(stuff);
					vo.setPbr("ab3");
					//System.out.println("===========\n"+vo.getCpnId()+"\n"+vo.getOpinion()+"\n============");
					cnt = workDAO.updateCompanyOpinion(vo);
				}
/*					
					else if("cst".equals(stuff)){
						if(vo.getEmail().equals(null))vo.setEmail("-");
						if(vo.getPhn1().equals(null))vo.setPhn1("-");
						cnt = personDAO.excelInsertCustomer(vo);//customer 입력
						result = personDAO.selectMaxSnb(prsn);//입력된 customer snb 추출
						vo.setCstSnb(result.get(0).getsNb());
						cnt = personDAO.excelInsertNote(vo);//노트(비고)입력
					}
*/				
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
	 * 실질적으로 IMPORT 하는 메소드
	 * 2014년 현재 엑셀 업로드 프로세스 
	 * // 증시, 회사
	 * @MethodName : runss
	 * @param realFileName
	 * @param fileUrl
	 * @param what
	 * @return
	 */
	public boolean runss(String realFileName, String fileUrl, String what) {
		FileInputStream myxls = null;
		File fileName = new File(fileUrl);
		Object vo = null;
		
		boolean rtn = false;
		
		try {
			myxls = new FileInputStream(fileName);
			Workbook wb = null;
			
			if("xlsx".equals(FilenameUtils.getExtension(realFileName))){
				wb = new XSSFWorkbook(myxls);
			} else {
				wb = new HSSFWorkbook(myxls);
			}
			Sheet sheet = wb.getSheetAt(sheetNo);
			
			CpnUploadExcelMapping xcel = new CpnUploadExcelMapping();
			
			int rowNo = 0;
			Row row = null;
			
			//타이틀 순서 받아 맵핑
			row = sheet.getRow(rowNo);
			int[] pos = xcel.titleMapping(what,row);
			System.out.println("-------pos------"+what);
			for(int i=0;i<pos.length;i++){
				System.out.print(pos[i]+" ");
			}
			System.out.println("\n------total column:"+pos.length+"---------");
			
			while (rowNo++ < sheet.getLastRowNum()) {
				row = sheet.getRow(rowNo);
				//vo = (NoticeVO) xcel.mappingColumn(row, "notice");
				int cnt = 0;
				if("notice".equals(what)){
					vo = xcel.fillNoticeVO(pos,row);
					cnt = noticeDAO.insertNotice((NoticeVO)vo);
//					LOG.debug("^_^noticeDAO.insertNotice");
					//System.out.println("-------notice vo------"+vo+"---------------");
				}
				else if("cpn".equals(what)){
					vo = xcel.fillCpnVO(pos,row);
					cnt = companyDAO.insertNupdateCompanyExel((CpnExcelVO)vo);
//					LOG.debug("^_^companyDAO.insertNupdateCompanyExel");
					//System.out.println("-------cpn vo------"+vo+"---------------");
				}
				
			}
			rtn = true;
			//changeOfferCpnId();
		} catch (Exception e) {
			System.out.println("---엑셀파일 다음라인에서 에러----"+what+"------"+vo+"---------------");
			LOG.error(e);
			throw new RuntimeException(e);
		} finally {
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
	
//	/**
//	 * 
//	 * @MethodName : changeOfferCpnId
//	 * @throws Exception
//	 * @author : user
//	 * @since : 2014. 3. 3.
//	 */
//	public void changeOfferCpnId() throws Exception{
//		try{
//			//List로 select cpn_id, a_cpn_id from ib_company where a_cpn_id is not null and a_cpn_id !='' and a_cpn_id != cpn_id
//			List<WorkVO> newCpnId = companyDAO.selectCpnIdNewNold();
//			
//			//contents 하나씩 돌면서 ib_offer.cpn_id = a_cpn_id 하기
//			int  curList=0
//				,total = newCpnId.size();
//			if(total<1) return;
//			
//			WorkVO ofVo = new WorkVO();
//			
//			while(curList < total){
//				ofVo.setCpnId(newCpnId.get(curList).getCpnId());
//				ofVo.setaCpnId(newCpnId.get(curList++).getaCpnId());
//				//update
//				workDAO.updateOfferCpnId(ofVo);
//			}
//			
//			//update ib_company set cpn_id = a_cpn_id where a_cpn_id is not null and a_cpn_id !='' and cpn_id != a_cpn_id 하기
//			companyDAO.updateCompanyCpnId();
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//	}
	
	/***********************************/
	
	/**
	 * 회사/인물 담당자 지정/수정
	 * @MethodName : saveIncharge
	 * @param companyVO
	 * @param session
	 * @param loginVO
	 * @param model
	 * @return
	 * @author : user
	 * @since : 2015. 3. 3.
	 */
	@RequestMapping(value="/company/saveIncharge.do")
	public String saveIncharge(@ModelAttribute("companyVO") CompanyVO vo,
			HttpSession session,
			LoginVO loginVO,
			ModelMap model){
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		vo.setRgId(loginUser.getId());
		LOG.info(loginUser.getId());
		
		int cnt = 0;
		try{
			if("".equals(vo.getsNb()) | vo.getsNb() == null){
				cnt = companyDAO.insertIncharge(vo);
				LOG.debug(loginUser.getId()+"^_^companyDAO.insertIncharge");
				
			}else{
				cnt = companyDAO.updateIncharge(vo);
				LOG.debug(loginUser.getId()+"^_^companyDAO.updateIncharge");
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);

		return "company/RegistCPN";
	}
		
	/**
	 * 창투사/투자자문사 기투자 입력/조회
	 * @MethodName : saveInvestment
	 * @param cmmnMap
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 6. 2.
	 */
	@RequestMapping(value="/company/selectInvestment.do")
	public ModelAndView selectInvestment(@RequestParam Map<String,Object> cmmnMap) throws Exception{
		
		ModelAndView mv = new ModelAndView("ajaxPopDiv/investment");
		
		mv.addObject("cmmCdCategoryList", cmm.CommonCdList("00005"));
		
		if(isNullOrEmpty(cmmnMap.get("sNb"))) return mv;
		
		try{
			List<Map<String,Object>> result = companyDAO.selectInvestmentList(cmmnMap);
			mv.addObject("investMentList", result);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		return mv;
	}
	
	public boolean isNullOrEmpty(Object element){
		boolean status = false;
		
		if(element==null) status = true;
		else if("".equals(element)) status = true;
		
		return status;
	}
	
	/**
	 * 회사 > 기투자 내용 입력
	 * @MethodName : insertInvestment
	 * @param cmmnMap
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 6. 3.
	 */
	@RequestMapping(value="/company/insertInvestment.do")
	public ModelAndView insertInvestment(@RequestParam Map<String,Object> cmmnMap) throws Exception{
		ModelAndView mv = new ModelAndView("basic/result");
		mv.addObject("result", switchUpdateInsert(cmmnMap));
		
		return mv;
	}
	
	public int switchUpdateInsert(Map<String,Object> cmmnMap){
		int cnt = 0;
		try{
			if(isNullOrEmpty(cmmnMap.get("sNb")))
				cnt = companyDAO.insertInvestmentList(cmmnMap);
			else
				cnt = companyDAO.updateInvestmentList(cmmnMap);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return cnt;
	}
	/**
	 * 회사 > 기투자내역 삭제
	 * @MethodName : deleteInvestment
	 * @param cmmnMap
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 6. 3.
	 */
	@RequestMapping(value="/company/deleteInvestment.do")
	public ModelAndView deleteInvestment(@RequestParam Map<String,Object> cmmnMap) throws Exception{
		ModelAndView mv = new ModelAndView("basic/result");
		
		int cnt = companyDAO.deleteInvestmentList(cmmnMap);
		mv.addObject("result", cnt);
		
		return mv;
	}
	
	//공시 메자닌 팝업 20170915 ksm
	@RequestMapping(value="/company/modifyMezzaninePopup.do")
	public String modifyMezzaninePopup(HttpSession session,
							ModelMap model,
							@RequestParam Map<String,String> map) throws Exception {
	
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
	
		Map mezzanineInfo = noticeService.getNoticeMezzanineInfo(map);
		
		model.addAttribute("noticeInfo", mezzanineInfo);
		
		return "company/modifyMezzaninePopup";
	}
}