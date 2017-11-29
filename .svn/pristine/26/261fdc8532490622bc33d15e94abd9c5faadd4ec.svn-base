package ib.notice.web;

import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.notice.service.NoticeService;
import ib.notice.service.NoticeShVO;
import ib.notice.service.NoticeVO;
import ib.notice.service.impl.NoticeDAO;
import ib.work.service.WorkService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * <pre>
 * package  : ib.notice.web
 * filename : NoticeController.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2014. 4. 23.
 * @version : 1.0.0
 */
@Controller
public class NoticeController {
	
	@Resource(name="CmmUseService")
	private CmmUseService cmm;
	
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;
    
    @Resource(name = "noticeDAO")
    private NoticeDAO noticeDAO;
    
    @Resource(name="noticeService")
	private NoticeService noticeService;
    
    @Resource(name = "workService")
    private WorkService workService;    
    
	/** log */
    protected static final Log LOG = LogFactory.getLog(NoticeController.class);
    
    //20170814 ksm
    protected static final Calendar cal = Calendar.getInstance();
	
	/**
	 * 업무일지 공시 메자닌
	 * @MethodName : publicNoticeMezzaine
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectPublicNoticeMezzaine.do")
	public String publicNoticeMezzaine(HttpServletRequest request,
			NoticeVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		if("event".equals(vo.getTotal())) return "forward:/work/selectEventPublicNotice.do";
		
		String sortText = vo.getSorting();
		model.addAttribute("sorting", sortText);
		model.addAttribute("ttT", vo.getTotal());
		
		try{
			
			int sortBtn = 1;
			if(vo.getSorting()==null||"".equals(vo.getSorting())){		//디폴트 정렬값
				vo.setSorting("1");
			}else{
				sortBtn = Integer.parseInt(vo.getSorting());
			}
			
			//20170823 ksm
			String curYear = "";
			if(vo.getChoice_year()==null || "".equals(vo.getChoice_year())){	//검색년도
				cal.setTime(new Date(System.currentTimeMillis()));
				String date = new SimpleDateFormat("yyyyMM").format(cal.getTime());
				curYear = date.substring(0, 4);
				vo.setChoice_year(curYear);				
				model.addAttribute("choiceYear", curYear);				
			}else{
				model.addAttribute("choiceYear", vo.getChoice_year());				
			}
			
			if(vo.getCpnNm()!=null || !"".equals(vo.getCpnNm())){
				model.addAttribute("cpnNm", vo.getCpnNm());
			}
			
			//워런트 만기, 인수자id 20170830 ksm
			if(vo.getWrtYn()==null || "".equals(vo.getWrtYn())) vo.setWrtYn("Y");
			model.addAttribute("wrtCheckYn", vo.getWrtYn());				
			
			if(vo.getInvestorId()!=null || !"".equals(vo.getInvestorId())) 
				model.addAttribute("investorId", vo.getInvestorId());
			
			//방법(공모, 사모) 20170913 ksm
			if(vo.getWay() != null || !"".equals(vo.getWay()))
				model.addAttribute("way", vo.getWay());	
			
			//복수인수자접기 20170908 ksm
			//if(vo.getFoldYn()==null || "".equals(vo.getFoldYn())) model.addAttribute("foldCheckYn", "Y");
			//else model.addAttribute("foldCheckYn", vo.getFoldYn());	
			
			List<NoticeVO> result = noticeService.selectNoticeMezzaineList(vo);
			
			List<NoticeVO> cate = noticeService.selectNoticeMezzaineCategoryList(vo);
			
			model.addAttribute("NoticeList", result);			//공시리스트
			model.addAttribute("CategoryList", cate);
			
			model.addAttribute("sortBtn", -1 * sortBtn);		//화면으로 버튼 세팅을 위해 값전달.
			
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/NoticeMezzanine";
	}
	
	/**
	 * 행사공시
	 * @MethodName : eventPublicNoticeMezzaine
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 6. 10.
	 */
	@RequestMapping(value="/work/selectEventPublicNotice.do")
	public String eventPublicNoticeMezzaine(HttpServletRequest request,
			NoticeVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		if(!"event".equals(vo.getTotal())) return "forward:/work/selectPublicNoticeMezzaine.do";
		
		String sortText = vo.getSorting();
		model.addAttribute("sorting", sortText);
		model.addAttribute("ttT", "event");
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList("00022"));
		
		try{
			
			int sortBtn = 1;
			if(vo.getSorting()==null||"".equals(vo.getSorting())){		//디폴트 정렬값
				vo.setSorting("1");
			}else{
				sortBtn = Integer.parseInt(vo.getSorting());
			}
			
			
			
			List<NoticeVO> result = noticeDAO.selectEventNoticeList(vo);
			List<NoticeVO> cate = noticeDAO.selectNoticeMezzaineCategoryList(vo);
			
			model.addAttribute("NoticeList", result);
			model.addAttribute("CategoryList", cate);
			
						
			model.addAttribute("sortBtn", -1 * sortBtn);		//화면으로 버튼 세팅을 위해 값전달.
						
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/EventNotice";
	}
	
	public String replaceOrderbyParam(String text){

		text=text.replace("1","way DESC");
		text=text.replace("2","categoryCd ASC");
		text=text.replace("3","cpnNm aSC");
		text=text.replace("4","wrtDueDt ASC");
		text=text.replace("5","curPrice DESC");
		return text;
	}
	/**
	 * 업무일지 공시 메자닌 엑셀다운
	 * @MethodName : excelPublicNoticeMezzaine
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/excelPublicNoticeMezzaine.do")
	public String excelPublicNoticeMezzaine(HttpServletRequest request,
			NoticeVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			vo.setSorting("1");
			
			//vo.setTmpNum1("excel");
			//List<NoticeVO> result = noticeDAO.selectNoticeMezzaineList(vo);
			List<NoticeVO> result = noticeService.selectNoticeMezzaineList(vo);
			model.addAttribute("NoticeList", result);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/ExcelDownloadNoticeMezzanine";
	}	
	/**
	 * 업무일지 공시 증자
	 * @MethodName : publicNoticeIncCap
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectPublicNoticeIncCap.do")
	public String publicNoticeIncCap(NoticeVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			
			int sortBtn = 1;
			if(vo.getSorting()==null||"".equals(vo.getSorting())){		//디폴트 정렬값
				vo.setSorting("1");
			}else{				
				sortBtn = Integer.parseInt(vo.getSorting());
			}
			
			//년도별보기 추가 20170905 ksm
			String curYear = "";
			if(vo.getChoice_year()==null || "".equals(vo.getChoice_year())){	//검색년도
				cal.setTime(new Date(System.currentTimeMillis()));
				String date = new SimpleDateFormat("yyyyMM").format(cal.getTime());
				curYear = date.substring(0, 4);
				vo.setChoice_year(curYear);				
				model.addAttribute("choiceYear", curYear);				
			}else{
				if("total".equals(vo.getChoice_year())){ 
					vo.setChoice_year("");
					curYear = "total";
					model.addAttribute("total", curYear);									
				}else{
					model.addAttribute("choiceYear", vo.getChoice_year());									
				}
			}
			
			//회사명 추가 20170905 ksm
			if(vo.getCpnNm()!=null || !"".equals(vo.getCpnNm())){
				model.addAttribute("cpnNm", vo.getCpnNm());
			}
			
			//List<NoticeVO> result = noticeDAO.selectNoticeIncCapList(vo);
			List<NoticeVO> result = noticeService.selectNoticeIncCapList(vo);
			model.addAttribute("NoticeList", result);
			model.addAttribute("sortBtn", -1 * sortBtn);		//화면으로 버튼 세팅을 위해 값전달.
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/NoticeIncCap";
	}
	
	/**
	 * 업무일지 공시 주주변경
	 * @MethodName : publicNoticeStockHolder
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectPublicNoticeSh.do")
	public String publicNoticeShareHolder(NoticeVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			
			int sortBtn = 1;
			if(vo.getSorting()==null||"".equals(vo.getSorting())){		//디폴트 정렬값
				vo.setSorting("1");
			}else{				
				sortBtn = Integer.parseInt(vo.getSorting());
			}
			
			List<NoticeShVO> result = noticeDAO.selectNoticeShList(vo);
			model.addAttribute("NoticeShList", result);
			
			//model.addAttribute("sortBtn", -1 * sortBtn);		//화면으로 버튼 세팅을 위해 값전달.
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/NoticeSh";
	}
			
	/**
	 * 업무일지 공시 증자 엑셀다운
	 * @MethodName : publicNoticeIncCapExcel
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/excelPublicNoticeIncCap.do")
	public String publicNoticeIncCapExcel(NoticeVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			
			vo.setSorting("1");
			
			
			vo.setTmpNum1("excel");
			List<NoticeVO> result = noticeDAO.selectNoticeIncCapList(vo);
			model.addAttribute("NoticeList", result);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/ExcelDownloadNoticeIncCap";
	}
	
	/**
	 * 업무일지 공시 증자 엑셀다운
	 * @MethodName : publicNoticeIncCapExcel
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/excelPublicNoticeShCap.do")
	public String publicNoticeSh(NoticeVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			
			vo.setSorting("1");			
			
			vo.setTmpNum1("excel");
			List<NoticeVO> result = noticeDAO.selectNoticeIncCapList(vo);
			model.addAttribute("NoticeList", result);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/ExcelDownloadNoticeSh";
	}
	
	/**
	 * 공시(증자) 입력
	 * @MethodName : insertPublicNoticeInCap
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/insertPublicNoticeInCap.do")
	public String insertPublicNoticeInCap(NoticeVO vo,
			HttpSession session,
			ModelMap model) throws Exception{	
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			int cnt = noticeService.insertPublicNoticeInCap(vo);			
			model.addAttribute("save", cnt);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/NoticeIncCap";
	}
	
	/**
	 * 공시 증자 수정
	 * @MethodName : modifyPublicNoticeIncCap
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyPublicNoticeIncCap.do")
	public String modifyPublicNoticeIncCap(NoticeVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			//int cnt = noticeDAO.modifyPublicNoticeIncCap(vo);
			int cnt = noticeService.modifyPublicNoticeIncCap(vo);
			model.addAttribute("save", cnt);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/NoticeIncCap";
	}
	
	/**
	 * 공시(증자) 삭제
	 * @MethodName : deletePublicNoticeIncCap
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 2. 27.
	 */
	@RequestMapping(value="/work/deletePublicNoticeIncCap.do")
	public String deletePublicNoticeIncCap(NoticeVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			int cnt = noticeService.deletePublicNoticeIncCap(vo);
			model.addAttribute("save", cnt);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/NoticeMezzanine";
	}
	
	/**
	 * 공시(메자닌) 입력
	 * @MethodName : insertPublicNoticeMezzanine
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/insertPublicNoticeMezzanine.do")
	public String insertPublicNoticeMezzanine(NoticeVO vo,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, Object> map) throws Exception{	//map 추가 20170804 ksm
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			int cnt = noticeService.insertPublicNoticeMezzanine(vo, map);			
			model.addAttribute("save", cnt);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/NoticeIncCap";
	}
	
	
	/**
	 * 공시(최대주주변경) 입력
	 * @MethodName : insertPublicNoticeSh
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/insertPublicNoticeSh.do")
	public void insertPublicNoticeSh(NoticeVO vo,
			HttpServletRequest request,
			HttpServletResponse response, 
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String,String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			int cnt = noticeDAO.insertNoticeSh(map);
			if( cnt > 0 ) 
			model.addAttribute("save", cnt);
			
			AjaxResponse.responseAjaxObject(response, "OK");			//결과전송
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}	
	}
	
	/**
	 * 공시(최대주주변경) 입력
	 * @MethodName : insertPublicNoticeSh
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/noticeShPopup.do")
	public String noticeShPopup(NoticeVO vo,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String,String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		LOG.info(loginUser.getId());
		
		String mode = map.get("mode").toString();
		String sNb = map.get("sNb").toString();
		System.out.println("sNb : " + sNb);
		if( mode.equals("edit") ){
			NoticeShVO result = noticeDAO.selectNoticeSh(map);
			model.addAttribute("NOTICE", result); 
		}
		
		model.addAttribute("mode", mode);
		
		return "work/deal/noticeShPopup";
	}
	
	
	/**
	 * 공시 메자닌 수정
	 * @MethodName : modifyPublicNoticeSh
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyPublicNoticeSh.do")
	public void modifyPublicNoticeSh(NoticeVO vo,
			HttpServletRequest request,
			HttpServletResponse response, 
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String,String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			int cnt = noticeDAO.modifyNoticeSh(map);
			model.addAttribute("save", cnt);
			
			AjaxResponse.responseAjaxObject(response, "OK");			//결과전송
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 공시 메자닌 수정
	 * @MethodName : modifyPublicNoticeMezzaine
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyPublicNoticeMezzanine.do")
	public String modifyPublicNoticeMezzaine(NoticeVO vo,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, Object> map) throws Exception{	//map 추가 20180808 ksm 
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			int cnt = noticeService.modifyPublicNoticeMezzanine(vo, map);
			//int cnt = noticeDAO.modifyPublicNoticeMezzanine(vo);
			model.addAttribute("save", cnt);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/NoticeMezzanine";
	}
	
	/**
	 * 공시 메자닌 삭제
	 * @MethodName : deletePublicNoticeMezzanine
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 2. 27.
	 */
	@RequestMapping(value="/work/deletePublicNoticeMezzanine.do")
	public String deletePublicNoticeMezzanine(NoticeVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			int cnt = noticeService.deletePublicNoticeMezzanine(vo);
			model.addAttribute("save", cnt);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/NoticeMezzanine";
	}

	/**
	 * 행사공시 입력
	 * @MethodName : insertEventPublicNotice
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 6. 11.
	 */
	@RequestMapping(value="/work/insertEventPublicNotice.do")
	public String insertEventPublicNotice(NoticeVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			int cnt = noticeDAO.insertEventPublicNotice(vo);
			model.addAttribute("save", cnt);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/EventNotice";
	}
	
	/**
	 * 행사공시 수정
	 * @MethodName : modifyEventPublicNotice
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 6. 11.
	 */
	@RequestMapping(value="/work/modifyEventPublicNotice.do")
	public String modifyEventPublicNotice(NoticeVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			int cnt = noticeDAO.modifyEventPublicNotice(vo);
			model.addAttribute("save", cnt);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/EventNotice";
	}
	
	/**
	 * 행사공시 삭제
	 * @MethodName : deleteEventPublicNotice
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 6. 11.
	 */
	@RequestMapping(value="/work/deleteEventPublicNotice.do")
	public String deleteEventPublicNotice(NoticeVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			int cnt = noticeDAO.deleteEventPublicNotice(vo);
			model.addAttribute("save", cnt);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/deal/EventNotice";
	}
	
	//메자닌 발행 현황 20170814 ksm
	@RequestMapping(value="/work/mezzanineStatus.do")
	public String mezzanineStatus(HttpServletRequest request,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo") == null) return "basic/Content";
		
		try{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("way", "1");
			List<Map> priceList = noticeService.selectMezzaninePriceList(map);
			
			map.remove("way");
			map.put("way", "2");
			List<Map> privatePriceList = noticeService.selectMezzaninePriceList(map);
			
			for(int i=0; i<priceList.size();i++){
				priceList.get(i).put("privatePrice", privatePriceList.get(i).get("publicPrice"));
			}
			
			map.remove("way");
			map.put("way", "1");
			List<Map> countList = noticeService.selectMezzanineCountList(map);
			
			map.remove("way");
			map.put("way", "2");
			List<Map> privateCountList = noticeService.selectMezzanineCountList(map);
			
			for(int i=0; i<priceList.size();i++){
				countList.get(i).put("privateCount", privateCountList.get(i).get("publicCount"));
			}
			
			model.addAttribute("mezzaninePriceList", priceList);
			model.addAttribute("mezzanineCountList", countList);
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		
		return "work/deal/mezzanineStatus";
	}
	
	//메자닌현황 금액건 그래프 20170911 ksm
	@RequestMapping(value="/work/doLoadMezzaninePriceSummary.do")
	public void doLoadMezzaninePriceSummary(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, Object> map) throws Exception{
	
		if(session.getAttribute("userLoginInfo") == null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		List<Map> result = null;
		
		try{
			Map<String, Object> param =  new HashMap<String, Object>();
			param.put("way", "1");
			result = noticeService.selectMezzaninePriceList(param);
			
			param.remove("way");
			param.put("way", "2");
			List<Map> otherResult = noticeService.selectMezzaninePriceList(param);
			
			for(int i=0; i<result.size();i++){
				result.get(i).put("privatePrice", otherResult.get(i).get("publicPrice"));
			}
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		ArrayList tickList = new ArrayList();
		ArrayList chartDataList = new ArrayList();
		ArrayList otherChartDataList = new ArrayList();
		
		for(Map m : result){
			String year = m.get("year").toString();
			String publicCount = m.get("publicPrice").toString();
			String publicPrice = String.valueOf(Math.round((Double.parseDouble(publicCount)) / 10));
			
			String privateCount = m.get("privatePrice").toString();
			String privatePrice = String.valueOf(Math.round((Double.parseDouble(privateCount)) / 10));

			tickList.add(year);
			chartDataList.add(Integer.parseInt(publicPrice));
			otherChartDataList.add(Integer.parseInt(privatePrice));
		}
		
		
		resultMap.put("tickList", tickList);
		resultMap.put("chartDataList", chartDataList);
		resultMap.put("otherChartDataList", otherChartDataList);

		AjaxResponse.responseAjaxObject(response, resultMap);
	}
	
	//메자닌현황 건수 그래프 20170911 ksm
	@RequestMapping(value="/work/doLoadMezzanineCountSummary.do")
	public void doLoadMezzanineCountSummary(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, Object> map) throws Exception{
	
		if(session.getAttribute("userLoginInfo") == null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		List<Map> result = null;
		
		try{
			Map<String, Object> param =  new HashMap<String, Object>();
			param.put("way", "1");
			result = noticeService.selectMezzanineCountList(param);
			
			param.remove("way");
			param.put("way", "2");
			List<Map> otherResult = noticeService.selectMezzanineCountList(param);
			
			for(int i=0; i<result.size();i++){
				result.get(i).put("privateCount", otherResult.get(i).get("publicCount"));
			}
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		ArrayList tickList = new ArrayList();
		ArrayList chartDataList = new ArrayList();
		ArrayList otherChartDataList = new ArrayList();
		
		for(Map m : result){
			String year = m.get("year").toString();
			String publicCount = m.get("publicCount").toString();
			
			String privateCount = m.get("privateCount").toString();

			tickList.add(year);
			chartDataList.add(Integer.parseInt(publicCount));
			otherChartDataList.add(Integer.parseInt(privateCount));
		}
		
		
		resultMap.put("tickList", tickList);
		resultMap.put("chartDataList", chartDataList);
		resultMap.put("otherChartDataList", otherChartDataList);

		AjaxResponse.responseAjaxObject(response, resultMap);
	}
	
	//경쟁사현황 Page 20170821 ksm
	@RequestMapping(value="/work/investorStatus.do")
	public String investorStatus(){
		return "work/deal/investorStatus";
	}
	
	//경쟁사현황 20170816 ksm
	@RequestMapping(value="/work/getInvestorStatus.do")
	public void getInvestorStatus(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, Object> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo") == null) return;		
		
		try{
			String curYear = "";
			if(map.get("choiceYear") != null){
				if("".equals(map.get("choiceYear"))){
					cal.setTime(new Date(System.currentTimeMillis()));
					String date = new SimpleDateFormat("yyyyMM").format(cal.getTime());
					curYear = date.substring(0, 4);
				}else {
					curYear = map.get("choiceYear").toString();
					if("total".equals(curYear)){ 
						curYear = "";
					}
				}			
			}
			
			Map<String, Object> param = new HashMap<String, Object>();
			if(map.get("sorting") != null){
				param.put("sorting", map.get("sorting").toString());
			}
			
			param.put("choiceYear", curYear);
			List<Map> investorList = noticeService.selectInvestorList(param);
			
			AjaxResponse.responseAjaxSelect(response, investorList);
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
}