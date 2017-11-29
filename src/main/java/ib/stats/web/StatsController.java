package ib.stats.web;

import ib.basic.web.UtilReplaceTag;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.login.service.StaffVO;
import ib.reply.service.ReplyVO;
import ib.stats.service.StatsVO;
import ib.stats.service.impl.StatsDAO;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;
import ib.work.service.impl.WorkDAO;
import ib.cmm.util.sim.service.AjaxResponse;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mysql.jdbc.StringUtils;

/**
 * <pre>
 * package  : ib.stats.web
 * filename : StatsController.java
 * </pre>
 *
 * @author  : ChanWoo Lee
 * @since   : 2012. 10. 12.
 * @version : 1.0.0
 */
@Controller
public class StatsController {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;

    @Resource(name = "statsDAO")
    private StatsDAO statsDAO;

    @Resource(name = "workDAO")
    private WorkDAO workDAO;
    
    @Resource(name = "workService")
    private WorkService workService;
    
    
    
	/** log */
    protected static final Log LOG = LogFactory.getLog(StatsController.class);

	protected static Calendar cal = Calendar.getInstance();

	/**
	 * 통계 Main 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return Main Page
	 * @exception Exception
	 */
	@RequestMapping(value="/stats/index.do")
	public String statsindex( StatsVO statsVO,
								WorkVO workVO,
								HttpSession session,
								ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		List<StatsVO> result = null;

		if(statsVO.getChoice_year().equals("") && statsVO.getChoice_month().equals("")){

			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );

			statsVO.setChoice_year(date.substring(0, 4));
			statsVO.setChoice_month(date.substring(4, 6));
			workVO.setChoice_year(date.substring(0, 4));
			workVO.setChoice_month(date.substring(4, 6));

			if(Integer.parseInt(date.substring(4, 6)) < 7){
				statsVO.setTotal("high");
			}else{
				statsVO.setTotal("low");
			}

		}else{
			workVO.setChoice_year(statsVO.getChoice_year());
			//workVO.setChoice_month(statsVO.getChoice_month());
		}

		if(statsVO.getChoice_month().length()==1){
			statsVO.setChoice_month("0"+statsVO.getChoice_month());
			workVO.setChoice_month(statsVO.getChoice_month());
		}
		
		/*if(statsVO.getTotal().equals("high")) {//상반기
			statsVO.setChoice_monthS("01");
			workVO.setChoice_monthS("01");
			statsVO.setChoice_month("06");
			workVO.setChoice_month("06");
		}else if(statsVO.getTotal().equals("low")) {//하반기
			statsVO.setChoice_monthS("07");
			workVO.setChoice_monthS("07");
			statsVO.setChoice_month("12");
			workVO.setChoice_month("12");
		}*/
		
		statsVO.setChoice_monthS("01");
		workVO.setChoice_monthS("01");
		statsVO.setChoice_month("12");
		workVO.setChoice_month("12");

		String year = statsVO.getChoice_year();
		String month = statsVO.getChoice_month();

		try{
			result = statsDAO.selectPrivateResult(statsVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		model.addAttribute("statsList", result);
		model.addAttribute("choice_year", year);
		model.addAttribute("choice_month", month);

		model.addAttribute("showAll", statsVO.getShowAll());
		
    	return "stats/StatsMain";
    }
	
	
	/**
	 * 정보정리 div 팝업
	 * @MethodName : selectPrivateOffer
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/statsPrivateOffer.do")
	public String selectPrivateOffer(
			StatsVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		String id = loginUser.getId();

		//2016-05-03
		model.addAttribute("infoLevelList", Arrays.toString(((List<String>)workService.getInfoLevelList()).toArray()));		//정보등급 리스트
		
		//2016-04-22		
		model.addAttribute("DaYF", workVO.getDayF());
		
		model.addAttribute("DaY", workVO.getDay());
		model.addAttribute("pageName", workVO.getTmpNum2());
		model.addAttribute("cmmCdTabList", cmm.CommonCdList(workVO.ccdTabCd,id));
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(workVO.ccdCateCd,id));
		model.addAttribute("cmmCdKeyPointList", cmm.CommonCdList(workVO.ccdKeyPoint));
		model.addAttribute("cmmCdOfferList", cmm.CommonCdList(workVO.ccdOffCd));
		model.addAttribute("cmmCd1stSlctList", cmm.CommonCdList("00015",id));
		model.addAttribute("cmmCdResultList", cmm.CommonCdList("00010"));
		model.addAttribute("cmmCdDealList", cmm.CommonCdList(workVO.ccdMidOffCd));
		model.addAttribute("cmmCdTypeList", cmm.CommonCdList("00017"));
		model.addAttribute("cmmCdanalysisCpnList", cmm.CommonCdList("00020"));

		List<WorkVO> result = null;
		//int middleCd = Integer.parseInt(workVO.getMiddleOfferCd());

		// Calendar cal = Calendar.getInstance();
		cal.setTime( new Date(System.currentTimeMillis()) );
		String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
		if(!("off".equals(workVO.getTmpNum1()))&(workVO.getChoice_year().equals("") || workVO.getChoice_year() == null)){//회사에서 시너지와의 이력 출력위해 off조건 추가

			workVO.setChoice_year(date.substring(0, 4));
			workVO.setChoice_month(date.substring(4, 6));

		}
		if(workVO.getTotal().equals("") || workVO.getTotal() == null){
			if(Integer.parseInt(date.substring(4, 6)) < 7){
				workVO.setTotal("high");
			}else{
				workVO.setTotal("low");
			}
			//System.out.println(date);
		}
		/*
		if(workVO.getTotal().equals("high")) {//상반기
			workVO.setChoice_monthS("01");
			workVO.setChoice_month("06");
		}
		else if(workVO.getTotal().equals("low")) {//하반기
			workVO.setChoice_monthS("07");
			workVO.setChoice_month("12");
		}
		*/
		if(!"off".equals(workVO.getTmpNum1())){//회사에서 시너지와의 이력 출력위해
			workVO.setChoice_monthS("01");
			workVO.setChoice_month("12");
		}else{
			if(workVO.getsNb()!=null&&!"".equals(workVO.getsNb())) workVO.setTmpNum1("on");
		}
		
		try{
			if(workVO.getSort_t().length()>0 & workVO.getSort_t().length()<3){
				result = statsDAO.selectPrivateOfferKeyPoint(workVO);
				
			}else if("100".equals(workVO.getSort_t())){
				result = statsDAO.selectRecommendOpinion(workVO);
				
			}else{
				
				if("joint".equals(workVO.getSort_t())){
					workVO.setSort_joint("joint");

				}else if("nonjoint".equals(workVO.getSort_t())){
					workVO.setSort_joint("nonjoint");
				}
				if("on".equals(workVO.getTmpNum1())) {
					workVO.setChoice_month(null);
					if("".equals(workVO.getsNb())){
						return "ajaxPopDiv/b_data";
					}
				}
				result = statsDAO.selectPrivateOffer(workVO);
				model.addAttribute("statsList", result);
				model.addAttribute("offerInfoList", statsDAO.selectOfferInfo(workVO));
			}
		}catch (Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		/*
		if(!(middleCd>10 & middleCd<20)) return "ajaxPopDiv/b_data"; //일임, 재매각이 아니면 return

		// 발행규모 더하기

		int sumPrice = 0;

		for(int i = 0;i<result.size();i++){

			if(result.get(i)!=null){
				String price = result.get(i).getPrice();
				String arr[] = price.split("억");
				//if(arr[0].indexOf("~")<0) arr = result.get(i).getPrice().split("~");
				sumPrice += Integer.parseInt(arr[0]);
			}
		}
		System.out.println(sumPrice);

		model.addAttribute("sumPrice", sumPrice);
		*/
		return "ajaxPopDiv/b_data";
	}

	/**
	 * 통계 세부 div 팝업
	 * @MethodName : selectPrivateOffer
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value="/stats/statsPrivateOffer4Stats.do")
	public String selectPrivateOffer4Stats(
			StatsVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());

		
		//2016-05-03
		model.addAttribute("infoLevelList", Arrays.toString(((List<String>)workService.getInfoLevelList()).toArray()));		//정보등급 리스트
		
		
		model.addAttribute("DaY", workVO.getDay());
		model.addAttribute("pageName", workVO.getTmpNum2());
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(workVO.ccdCateCd));
		model.addAttribute("cmmCdOfferList", cmm.CommonCdList(workVO.ccdOffCd));
		model.addAttribute("cmmCd1stSlctList", cmm.CommonCdList("00015"));
		model.addAttribute("cmmCdResultList", cmm.CommonCdList("00010"));
		model.addAttribute("cmmCdDealList", cmm.CommonCdList(workVO.ccdMidOffCd));

		List<WorkVO> result = null;
		//int middleCd = Integer.parseInt(workVO.getMiddleOfferCd());

		cal.setTime( new Date(System.currentTimeMillis()) );
		String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
		if(!("off".equals(workVO.getTmpNum1()))&(workVO.getChoice_year().equals("") || workVO.getChoice_year() == null)){//회사에서 시너지와의 이력 출력위해 off조건 추가

			workVO.setChoice_year(date.substring(0, 4));
			workVO.setChoice_month(date.substring(4, 6));

		}
		if(workVO.getTotal().equals("") || workVO.getTotal() == null){
			if(Integer.parseInt(date.substring(4, 6)) < 7){
				workVO.setTotal("high");
			}else{
				workVO.setTotal("low");
			}
		}
		if(!"off".equals(workVO.getTmpNum1())){//회사에서 시너지와의 이력 출력위해
			workVO.setChoice_monthS("01");
			workVO.setChoice_month("12");
		}else{
			if(workVO.getsNb()!=null&&!"".equals(workVO.getsNb()))
				workVO.setTmpNum1("on");
		}
		try{
			if(workVO.getSort_t().length()>0 && workVO.getSort_t().length()<3){
				result = statsDAO.selectPrivateOfferKeyPoint(workVO);
				List<WorkVO> ofif = new ArrayList<WorkVO>();
				int leng = result.size();
				for(int i=0;i<leng;i++){
					workVO.setsNb(result.get(i).getsNb());
					@SuppressWarnings("unchecked")
					List<WorkVO> rst = (List<WorkVO>) statsDAO.selectOfferInfo(workVO);
					int lengOfif = rst.size();
					for(int j=0;j<lengOfif;j++){
						ofif.add(rst.get(j));
					}
				}
				model.addAttribute("offerInfoList", ofif);

			}else if("100".equals(workVO.getSort_t())){
				result = statsDAO.selectRecommendOpinion(workVO);

			}else if("200".equals(workVO.getSort_t())){
				workVO.setOfferCd("00013");
				result = statsDAO.selectRecommendOpinion(workVO);

			}else{
				if("joint".equals(workVO.getSort_t())){
					workVO.setSort_joint("joint");

				}else if("nonjoint".equals(workVO.getSort_t())){
					workVO.setSort_joint("nonjoint");
				}
				if("on".equals(workVO.getTmpNum1())) {
					workVO.setChoice_month(null);

					if("".equals(workVO.getsNb())){
						return "ajaxPopDiv/b_data";
					}
				}
				result = statsDAO.selectPrivateOffer4Stats(workVO);
			}
		}catch (Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("statsList", result);

		return "ajaxPopDiv/b_data";
	}

	
	/**
	 * 통계 세부 div 팝업 ( 개인 팝업에서 )
	 * @MethodName : selectPrivateOffer
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value="/stats/statsPrivateStatsDtl.do")
	public String statsPrivateStatsDtl(
			StatsVO workVO,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String,String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		
		//2016-05-03
		model.addAttribute("infoLevelList", Arrays.toString(((List<String>)workService.getInfoLevelList()).toArray()));		//정보등급 리스트
		
		
		model.addAttribute("DaY", workVO.getDay());
		model.addAttribute("pageName", workVO.getTmpNum2());
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(workVO.ccdCateCd));
		model.addAttribute("cmmCdOfferList", cmm.CommonCdList(workVO.ccdOffCd));
		model.addAttribute("cmmCd1stSlctList", cmm.CommonCdList("00015"));
		model.addAttribute("cmmCdResultList", cmm.CommonCdList("00010"));
		model.addAttribute("cmmCdDealList", cmm.CommonCdList(workVO.ccdMidOffCd));
				

		List<WorkVO> result = null;
		
		cal.setTime( new Date(System.currentTimeMillis()) );
		String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
		
		if(!("off".equals(workVO.getTmpNum1()))&(workVO.getChoice_year().equals("") || workVO.getChoice_year() == null)){//회사에서 시너지와의 이력 출력위해 off조건 추가

			workVO.setChoice_year(date.substring(0, 4));
			workVO.setChoice_month(date.substring(4, 6));
			
			map.put("choice_year", date.substring(0, 4));
			map.put("choice_month", date.substring(4, 6));
		}
		/*if(workVO.getTotal().equals("") || workVO.getTotal() == null){
			if(Integer.parseInt(date.substring(4, 6)) < 7){
				workVO.setTotal("high");
			}else{
				workVO.setTotal("low");
			}
		}*/
		if(!"off".equals(workVO.getTmpNum1())){//회사에서 시너지와의 이력 출력위해
			workVO.setChoice_monthS("01");
			workVO.setChoice_month("12");
			
			map.put("choice_monthS", "01");
			map.put("choice_month", "12");
			
		}else{
			if(workVO.getsNb()!=null&&!"".equals(workVO.getsNb()))
				workVO.setTmpNum1("on");
		}
		
		try{
			if(workVO.getSort_t().length()>0 && workVO.getSort_t().length()<3){	//sort_t 가 한,두자리
				result = statsDAO.selectPrivateOfferKeyPoint(workVO);
				List<WorkVO> ofif = new ArrayList<WorkVO>();
				int leng = result.size();
				for(int i=0;i<leng;i++){
					workVO.setsNb(result.get(i).getsNb());
					@SuppressWarnings("unchecked")
					List<WorkVO> rst = (List<WorkVO>) statsDAO.selectOfferInfo(workVO);
					int lengOfif = rst.size();
					for(int j=0;j<lengOfif;j++){
						ofif.add(rst.get(j));
					}
				}
				model.addAttribute("offerInfoList", ofif);

			}else if("100".equals(workVO.getSort_t())){							//sort_t : "100"
				result = statsDAO.selectRecommendOpinion(workVO);

			}else if("200".equals(workVO.getSort_t())){							//sort_t : "200"
				workVO.setOfferCd("00013");
				result = statsDAO.selectRecommendOpinion(workVO);

			}else{
				if("joint".equals(workVO.getSort_t())){
					workVO.setSort_joint("joint");

				}else if("nonjoint".equals(workVO.getSort_t())){
					workVO.setSort_joint("nonjoint");
				}
				
				if("on".equals(workVO.getTmpNum1())) {
					workVO.setChoice_month(null);

					if("".equals(workVO.getsNb())){
						return "ajaxPopDiv/b_data";
					}
				}
				
				//result = statsDAO.selectPrivateOffer4Stats(workVO);
				result = statsDAO.statsPrivateStatsDtl(map);
			}
		}catch (Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		model.addAttribute("statsList", result);

		return "ajaxPopDiv/b_data";
	}
	
	
	/**
	 * 통계 중개 세부 팝업
	 * @MethodName : mediateInfo
	 * @param rcmdVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 2. 5.
	 */
	@RequestMapping(value="/stats/mediateInfo.do")
	public String mediateInfo( ReplyVO vo,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String,String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		String rtn = "ajaxPopDiv/replyDisposal";
		
		try{
			
			StaffVO staffVO = new StaffVO();
			model.addAttribute("userList", cmm.UserList(staffVO));
			model.addAttribute("offerSNB", vo.getsNb());
			model.addAttribute("supportList", workDAO.selectSupporterList(vo));
			
			if("stats".equals(map.get("tmpNum2"))){		//개인 통계 팝업
				
				model.addAttribute("disposalList", workDAO.mediateInfo(map));
				model.addAttribute("close", "stats");
				model.addAttribute("mainNm", map.get("tmpNum1"));

				rtn = "ajaxPopDiv/statsDisposal";
				
			}else{
				model.addAttribute("disposalList", workDAO.selectDisposalList(vo));
				
			}
			
		}catch (Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		return rtn;
	}
	

	/**
	 *
	 * @MethodName : statsNetwork
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/statsNetwork.do")
	public String statsNetwork(
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());


		List<WorkVO> result = null;
		//int middleCd = Integer.parseInt(workVO.getMiddleOfferCd());

		// Calendar cal = Calendar.getInstance();
		cal.setTime( new Date(System.currentTimeMillis()) );
		String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
		if(workVO.getChoice_year().equals("") || workVO.getChoice_year() == null){

			workVO.setChoice_year(date.substring(0, 4));
			workVO.setChoice_month(date.substring(4, 6));

		}
		if(workVO.getTotal().equals("") || workVO.getTotal() == null){
			if(Integer.parseInt(date.substring(4, 6)) < 7){
				workVO.setTotal("high");
			}else{
				workVO.setTotal("low");
			}
			//System.out.println(date);
		}
		/*
		if(workVO.getTotal().equals("high")) {//상반기
			workVO.setChoice_monthS("01");
			workVO.setChoice_month("06");
		}
		else if(workVO.getTotal().equals("low")) {//하반기
			workVO.setChoice_monthS("07");
			workVO.setChoice_month("12");
		}
		*/
		workVO.setChoice_monthS("01");
		workVO.setChoice_month("12");

		try{
			if("introducer".equals(workVO.getTmpNum1()))
				result = statsDAO.selectIntroducer(workVO);
			else
				result = statsDAO.selectNetwork(workVO);
		}catch (Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("statsList", result);
		return "stats/netData";
	}
	
	
	/**
	 *
	 * @MethodName : statsNetwork
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/eisSummary.do")
	public String statsChart(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());

		
		System.out.println("===========stats/eisSummary.do : stats/eisSummary==============");
		
		return "stats/eisSummary";
	}
	
	/**
	 * 투자총규모
	 * @MethodName : doLoadInvestAmountSummary
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/doLoadInvestAmountSummary.do")
	public void doLoadInvestAmountSummary(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return ;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");

		LOG.info(loginUser.getId());
		 
		List<Map> result = null;
		// 통계 정보 가져오기				 
		// 조건 설정
		try{
			result = statsDAO.selectInvestAmount(map);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		HashMap<String, Object> resultMap= new HashMap<String, Object>();
					
		resultMap.put("result", result);
		
		System.out.println("===========stats/doLoadInvestAmountSummary.do : stats/doLoadInvestAmountSummary==============");
		
		AjaxResponse.responseAjaxObject(response, resultMap);	//결과전송
	}
	
	
	
	/**
	 *
	 * @MethodName : eisInvestResult
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/eisInvestResult.do")
	public String eisInvestResult(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		System.out.println("===========stats/eisMediation.do : stats/eisMediation==============");
		
		return "stats/eisInvestResult";
	}
	
	
	
	
	/**
	 * 투자성과(회수내역)
	 * @MethodName : doLoadInvestAmountSummary
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/doLoadInvestResult.do")
	public void doLoadInvestResult(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return ;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");

		// 투자 성과(회수내역) 조회하기
		Map dataMap = new HashMap<String,Object>();
		
		try{
			
		List resultList = statsDAO.selectInvestResult(map);

		Double totalInvestMoney = (double) 0;		// 총 투자금액
		Double synergyIncome = (double) 0;			// 시너지 수익
		Double totalRealInvestMoney = (double) 0;	// 
		Double totalRealIncomeMoney = (double) 0;
		Double totalIBInvestMoney = (double) 0;		// IB 총 투자금액
		Double totalReturnPer = (double) 0;			// 상승율
		Double totalReturnRate = (double) 0;		// 수익율
		Double totalYearReturnRate = (double) 0;			// 연수익율
		Double totalYearReturnAmount = (double) 0;		// 연수익금액
		for(int idx = 0; idx < resultList.size(); idx++){
			
			Map tMap = (Map)resultList.get(idx);
			
			Double returnRate = (double) 0, insusummoney = (double) 0;
			
			// 투자금액
			
			if( !StringUtils.isNullOrEmpty(tMap.get("insusummoney").toString() ) )
				insusummoney = Double.valueOf(tMap.get("insusummoney").toString());			
			
			returnRate = Double.valueOf(tMap.get("returnrate").toString());
			
			// 실 투자금 합계
			
			totalRealInvestMoney += Double.valueOf(tMap.get("summoney1").toString()) 
					+ Double.valueOf(tMap.get("summoney2").toString());							
			
			// 수익 합계
			totalRealIncomeMoney += Double.valueOf(tMap.get("realinvestamount").toString()) 
					+ Double.valueOf(tMap.get("realreturnamount").toString());							
			
			// 상승률 합계
			totalReturnPer += Double.valueOf(tMap.get("returnper").toString());
			
			// 수익률 합계
			totalReturnRate += Double.valueOf(tMap.get("returnrate").toString());
			
			if( !StringUtils.isNullOrEmpty(tMap.get("investAmount").toString() ) )
				totalIBInvestMoney += Double.valueOf(tMap.get("investAmount").toString());
			
			// 투자금액 합계
			totalInvestMoney += Double.valueOf(insusummoney);
			
			// 시너지수익 합계
			synergyIncome += Double.valueOf(insusummoney)*Double.valueOf(returnRate)/100*0.15;
			
			// 연수익율 합계
			// 산식 : 365/(회수일-발행일)*수익율
			totalYearReturnRate += Double.valueOf(tMap.get("yearreturnrate").toString()); 
			
			// 연수익금액
			totalYearReturnAmount += Double.valueOf(tMap.get("yearrealreturnamount").toString());
		}
		
		dataMap.put("investResult", resultList);
		dataMap.put("totalInvestMoney", totalInvestMoney);
		dataMap.put("totalSynergyIncome", synergyIncome);
		
		dataMap.put("totalRealInvestMoney", totalRealInvestMoney);
		dataMap.put("totalRealIncomeMoney", totalRealIncomeMoney);
		dataMap.put("totalIBInvestMoney", totalIBInvestMoney);
		
		dataMap.put("totalReturnPer", totalReturnPer/resultList.size());
		dataMap.put("totalReturnRate", totalReturnRate/resultList.size());
		
		dataMap.put("totalYearReturnRate", totalYearReturnRate/resultList.size());
		dataMap.put("totalYearReturnAmount", totalYearReturnAmount);
		
		}
		catch(Exception ex){			
		System.out.println("## Error : " + ex.getMessage());
		System.out.println("## Error : " + ex.getStackTrace());			
		}

		System.out.println("===========stats/doLoadInvestResult.do : stats/doLoadInvestResult==============");
		
		AjaxResponse.responseAjaxObject(response, dataMap );			//결과전송
	}
	
	/**
	 * 투자총규모 - 메쟈닌 & 비메쟈닌 구분
	 * @MethodName : doLoadTotalInvestAmountSummary
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/doLoadTotalInvestAmountSummary.do")
	public void doLoadTotalInvestAmountSummary(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return ;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");

		LOG.info(loginUser.getId());
		 
		List<Map> result = null;
		// 통계 정보 가져오기				 
		// 조건 설정
		try{
			result = statsDAO.selectTotalInvestAmount(map);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		HashMap<String, Object> resultMap= new HashMap<String, Object>();
		HashMap<String, String> totalMap= new HashMap<String, String>();
					
		resultMap.put("result", result);
		
		Double totalInvest = 0.0, selfInvest = 0.0, sellPrice = 0.0, margin = 0.0;
		int count = 0;
		String type = "";
		ArrayList totalList = new ArrayList();
		
		HashMap<String, Object> tempMap = new HashMap<String, Object>();		
		tempMap.put("TOTAL_INVEST", totalInvest.toString());
		tempMap.put("SELF_INVEST", selfInvest.toString());
		tempMap.put("SELL_PRICE", sellPrice.toString());
		tempMap.put("MARGIN", margin.toString());
		tempMap.put("COUNT", String.valueOf(count));
		
		
		resultMap.put("mezza", tempMap);			
		resultMap.put("xmezza", tempMap);
				
		for(Map m : result){
			type = m.get("TYPE").toString();
			totalInvest += Double.parseDouble(m.get("TOTAL_INVEST").toString());
			selfInvest += Double.parseDouble(m.get("SELF_INVEST").toString());
			sellPrice += Double.parseDouble(m.get("SELL_PRICE").toString());
			margin += Double.parseDouble(m.get("MARGIN").toString());
			count += Double.parseDouble(m.get("COUNT").toString());
			
			resultMap.remove(type.toLowerCase());
			resultMap.put(type.toLowerCase(), m);
		}
		
		totalMap.put("TOTAL_INVEST", String.format("%.1f", totalInvest));
		totalMap.put("SELF_INVEST", String.format("%.1f", selfInvest));
		totalMap.put("SELL_PRICE", String.format("%.1f", sellPrice));
		totalMap.put("MARGIN", String.format("%.1f", margin));
		totalMap.put("COUNT", String.valueOf(count));
		
		resultMap.put("total", totalMap);
		
		System.out.println("===========stats/doLoadTotalInvestAmountSummary.do : stats/doLoadTotalInvestAmountSummary==============");
		
		AjaxResponse.responseAjaxObject(response, resultMap);	//결과전송
	}
	
	
	
	/**
	 *
	 * @MethodName : DealSummary
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/doLoadDealSummary.do")
	public void doLoadDealSummary(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return ;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		List<Map> result = null;
		// 통계 정보 가져오기				 
		// 조건 설정
		try{
			result = statsDAO.selectDealCount(map);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		HashMap<String, Object> resultMap= new HashMap<String, Object>();
		
		HashMap<String, String> dataMap= new HashMap<String, String>();
		ArrayList tickList = new ArrayList();		
		ArrayList dataList = new ArrayList();
		ArrayList chartDataList = new ArrayList();
		
		
		// TICKS 추출 - 가로바	
		// 달력 월 정보
			
		// LABEL 추출 - 세로바
		// 팀명 정보
		/*for(Map m : result){
			String label = m.get("LABEL").toString();
			if( !labelList.contains(label) ){
				labelList.add(label);
			}
		}*/
		
		// 차트 데이타 && TICK 구성
		// 00000 : 소싱, 00001 : 대기, 00002 : 매칭, 00003 : 미팅, 00006 : 성사, 10000 : 폐기
		String [] keyList = new String[]{"미팅", "소싱", "투자", "중개"};
				
		// DATA 추출
		Double sourceCount = 0.0;
		Double meetingCount = 0.0;
		
		for(Map m : result){
			String type = m.get("TYPE").toString();
			String value = m.get("COUNT").toString();			
			
			dataMap.put(type, value);
			
			if (type.equals("미팅")){				
				dataList.add(value);
				meetingCount = Double.parseDouble(value);
			}
			else{
				Double chartValue = 0.0;
				if( type.equals("소싱")) {
					sourceCount = Double.parseDouble(value);
					chartValue = sourceCount/meetingCount*100.0;
				}
				else{				
					Double dVal = Double.parseDouble(value)/sourceCount*100.0;
					chartValue = Double.parseDouble(String.format("%.1f", dVal));
				}
				
				//tickList.add(type);
				dataList.add(value);
				chartDataList.add(chartValue);			
			}
		}
		
		for(String keyVal : keyList){
			if( !dataMap.containsKey(keyVal) ) {
				dataMap.put(keyVal, "0");
				chartDataList.add(0.0);
			}
			if (keyVal.equals("미팅")) continue;
			
			tickList.add(keyVal);
		}
				
		Double dTemp = sourceCount/meetingCount*100;
		resultMap.put("sourcingRate", String.format("%.1f",dTemp));
		resultMap.put("rate", String.format("%.1f",dTemp));
		
		resultMap.put("tickList", tickList);
		resultMap.put("dataList", dataList);
		resultMap.put("dataMap", dataMap);
		resultMap.put("chartDataList", chartDataList);
		System.out.println("===========stats/doLoadDealSummary.do : stats/LoadDealSummary==============");
		
		AjaxResponse.responseAjaxObject(response, resultMap);	//결과전송
	}
	
	
	
	/**
	 *
	 * @MethodName : doLoadMnaSummary
	 * @param 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/doLoadMnaSummary.do")
	public void doLoadMnaSummary(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
				
		if(session.getAttribute("userLoginInfo")==null) return ;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");		
		LOG.info(loginUser.getId());
		 
		List<Map> result = null;
		// 통계 정보 가져오기				 
		// 조건 설정
		try{			
			result = statsDAO.selectMnaSummary(map);			
		}catch(Exception e){			
			LOG.error(e);
			e.printStackTrace();
		}
		
		HashMap<String, Object> resultMap= new HashMap<String, Object>();
		
		HashMap<String, String> dataMap= new HashMap<String, String>();
		HashMap<String, String> tempMap= new HashMap<String, String>();
		ArrayList tickList = new ArrayList();
		ArrayList chartDataList = new ArrayList();
		
		// 차트 데이타 && TICK 구성
		String [] keyList = new String[]{"소싱", "대기", "매칭", "성사", "폐기"};
		HashMap<String, String> keyMap = new HashMap<String, String>();  
		keyMap.put("00000", "소싱");
		keyMap.put("00001", "대기");
		keyMap.put("00002", "매칭");		
		keyMap.put("00006", "성사");
		keyMap.put("10000", "폐기");
				
		// DATA 추출		
		for(Map m : result){
			if( keyMap.containsKey(m.get("CODE").toString()) ){
				String type = keyMap.get(m.get("CODE").toString()).toString();
				String value = m.get("COUNT").toString();			
			
				tempMap.put(type, value);
				tickList.add(type);
			}
		}		
		
		Double sourcingCnt = 0.0;
		if( tempMap.containsKey("소싱") ){
			sourcingCnt = Double.parseDouble(tempMap.get("소싱")); 
		}
		Double chartValue = 0.0;
		
		for(String val : keyList){		
				
			if( tempMap.containsKey(val) ) {				
				chartValue = Double.parseDouble(tempMap.get(val))/sourcingCnt*100.0;				
				chartDataList.add(Double.parseDouble(String.format("%.1f", chartValue)));
				dataMap.put(val, tempMap.get(val));
			}
			else {				
				chartDataList.add(0.0);
				dataMap.put(val, "0");
			}
			
			if( !tickList.contains(val) ){
				tickList.add(val);
			}
		}
				
		// M&A 성사율
		double successVal = dataMap.containsKey("매칭") ? Double.parseDouble(dataMap.get("매칭")) : 0.0;
		double sourcingVal = dataMap.containsKey("소싱") ? Double.parseDouble(dataMap.get("소싱")) : 0.0;
		
		Double mnaRate = successVal/sourcingVal*100.0;
		
		//resultMap.put("dataList", dataList);
		resultMap.put("mnaRate", String.format("%.1f",mnaRate));		
		resultMap.put("tickList", tickList);			
		resultMap.put("dataMap", dataMap);		
		resultMap.put("chartDataList", chartDataList);		
		System.out.println("===========stats/doLoadMnaSummary.do : stats/LoadMnaSummary==============");
				
		AjaxResponse.responseAjaxObject(response, resultMap);	//결과전송
	}
	
	
	
	/**
	 * 전체 Deal - 진행상황
	 * @MethodName : doLoadDealProgress
	 * @param 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/doLoadDealProgress.do")
	public void doLoadDealProgress(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return ;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");

		LOG.info(loginUser.getId());
		 
		List<Map> result = null;
		// 통계 정보 가져오기				 
		// 조건 설정
		try{
			result = statsDAO.selectDealProgress(map);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		HashMap<String, Object> resultMap= new HashMap<String, Object>();
		
		HashMap<String, String> dataMap= new HashMap<String, String>();
		ArrayList tickList = new ArrayList();		
		
		// 차트 데이타 && TICK 구성
		HashMap<String, String> keyMap = new HashMap<String, String>();
		keyMap.put("00001", "진행중");
		keyMap.put("00002", "보류");
		keyMap.put("00003", "투자");
		keyMap.put("10000", "DROP");
		keyMap.put("10001", "타사투자");
		keyMap.put("10002", "발행취소");
				
		// DATA 추출
		int totalCnt = 0;
		for(Map m : result){
			String type = keyMap.get(m.get("CODE").toString()).toString();
			String value = m.get("COUNT").toString();			
			
			dataMap.put(type, value);
			tickList.add(type);
			
			totalCnt += Integer.parseInt(value);
		}
		
		// dataMap 정렬
		Map<String, String> sortedMap = sortByValues(dataMap); 
	      
	    Set set2 = sortedMap.entrySet();
	    Iterator iterator2 = set2.iterator();
	    while(iterator2.hasNext()) {
	    	Map.Entry me2 = (Map.Entry)iterator2.next();	           
	    }
			      
			      
		resultMap.put("tickList", tickList);
		resultMap.put("dataMap", sortedMap);
		resultMap.put("totalCount", totalCnt);
		
		System.out.println("===========stats/doLoadDealProgress.do : stats/LoadDealProgress==============");
				
		AjaxResponse.responseAjaxObject(response, resultMap);	//결과전송
	}
	
	
	/**
	 * 전체 Deal - 유형별
	 * @MethodName : doLoadDealCategory
	 * @param 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/doLoadDealCategory.do")
	public void doLoadDealCategory(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return ;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");

		LOG.info(loginUser.getId());
				
		List<Map> result = null;
		// 통계 정보 가져오기				 
		// 조건 설정
		try{
			result = statsDAO.selectDealCategory(map);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		HashMap<String, Object> resultMap= new HashMap<String, Object>();
		
		HashMap<String, String> dataMap= new HashMap<String, String>();
		ArrayList tickList = new ArrayList();
		
		// 차트 데이타 && TICK 구성
		HashMap<String, String> keyMap = new HashMap<String, String>();
		/*keyMap.put("00001", "CB");
		keyMap.put("00002", "BW");
		keyMap.put("00003", "EB");
		keyMap.put("00004", "유증");
		keyMap.put("00005", "블록딜");
		keyMap.put("00006", "실권주");
		keyMap.put("00007", "워런트");
		keyMap.put("00012", "프리IPO");
		keyMap.put("00015", "RCPS");
		keyMap.put("00016", "벤처");*/
		
		//Deal 유형 코드
		List<Map> dealTypeList = statsDAO.selectDealType();
		for(Map p : dealTypeList){
			keyMap.put(p.get("cd").toString(), p.get("nm").toString());
		}
		
		// DATA 추출
		
		int totalCnt = 0;
		for(Map m : result){
			String type = keyMap.get(m.get("CODE").toString()).toString();
			String value = m.get("COUNT").toString();			
			
			dataMap.put(type, value);
			tickList.add(type);
			
			totalCnt += Integer.parseInt(value);
		}
		
		// dataMap 정렬
		Map<String, String> sortedMap = sortByValues(dataMap); 
	      
	      Set set2 = sortedMap.entrySet();
	      Iterator iterator2 = set2.iterator();
	      while(iterator2.hasNext()) {
	           Map.Entry me2 = (Map.Entry)iterator2.next();	           
	      }
	      
		resultMap.put("tickList", tickList);
		resultMap.put("dataMap", sortedMap);
		resultMap.put("totalCount", totalCnt);
		
		
		System.out.println("===========stats/doLoadDealCategory.do : stats/LoadDealCategory==============");
				
		AjaxResponse.responseAjaxObject(response, resultMap);	//결과전송
	}
	
	
	
	/**
	 * 직접 투자 건수별 - 유형분석
	 * @MethodName : selectSelfInvestCase
	 * @param 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/doLoadSelfInvestCase.do")
	public void doLoadSelfInvestCase(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return ;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");

		LOG.info(loginUser.getId());
		 
		List<Map> result = null;
		// 통계 정보 가져오기				 
		// 조건 설정
		try{
			result = statsDAO.selectSelfInvestCase(map);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		HashMap<String, Object> resultMap= new HashMap<String, Object>();
		
		HashMap<String, String> dataMap= new HashMap<String, String>();
		ArrayList tickList = new ArrayList();
		
		// 차트 데이타 && TICK 구성
		String [] keyList = new String[]{"CB", "BW", "EB", "유증", "블록딜", "실권주", "워런트", "RCPS"};
		
		// DATA 추출
		int totalCnt = 0;
		for(Map m : result){
			
			String type = m.get("CODE").toString();
			String value = m.get("COUNT").toString();			
			
			dataMap.put(type, value);	
			tickList.add(type);
			
			totalCnt += Integer.parseInt(value);
		}
		
		for(String key : keyList){
			if( !dataMap.containsKey(key) ){
				dataMap.put(key, "0");
				tickList.add(key);
			}
		}
		
		// dataMap 정렬
		Map<String, String> sortedMap = sortByValues(dataMap); 
		  
		Set set2 = sortedMap.entrySet();
		Iterator iterator2 = set2.iterator();
		while(iterator2.hasNext()) {
			Map.Entry me2 = (Map.Entry)iterator2.next();
		}
			      
		resultMap.put("tickList", tickList);
		resultMap.put("dataMap", sortedMap);
		resultMap.put("totalCount", totalCnt);
		
		System.out.println("===========stats/doLoadSelfInvestCase.do : stats/doLoadSelfInvestCase==============");
				
		AjaxResponse.responseAjaxObject(response, resultMap);	//결과전송
	}
	
	
	
	/**
	 * 직접 투자 금액별 - 유형분석
	 * @MethodName : doLoadSelfInvestAmount
	 * @param 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/doLoadSelfInvestAmount.do")
	public void doLoadSelfInvestAmount(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return ;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");

		LOG.info(loginUser.getId());
		 
		List<Map> result = null;
		// 통계 정보 가져오기				 
		// 조건 설정
		try{
			result = statsDAO.selectSelfInvestAmount(map);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		

		HashMap<String, Object> resultMap= new HashMap<String, Object>();
		
		HashMap<String, String> dataMap= new HashMap<String, String>();
		ArrayList tickList = new ArrayList();
		
		// 차트 데이타 && TICK 구성
		String [] keyList = new String[]{"CB", "BW", "EB", "유증", "블록딜", "실권주", "워런트", "RCPS"};
		
		// DATA 추출
		
		int totalCnt = 0;
		for(Map m : result){
			
			String type = m.get("CODE").toString();
			String value = m.get("AMOUNT").toString();			
			
			dataMap.put(type, value);
			tickList.add(type);
			
			totalCnt += Integer.parseInt(value);
		}
		
		for(String key : keyList){
			if( !dataMap.containsKey(key) ){
				dataMap.put(key, "0");
				tickList.add(key);
			}
		}
		
		// dataMap 정렬
		Map<String, String> sortedMap = sortByValues(dataMap); 
		  
		Set set2 = sortedMap.entrySet();
		Iterator iterator2 = set2.iterator();
		while(iterator2.hasNext()) {
			Map.Entry me2 = (Map.Entry)iterator2.next();
		}
		
		resultMap.put("tickList", tickList);
		resultMap.put("dataMap", sortedMap);	
		resultMap.put("totalCount", totalCnt);		
		
		System.out.println("===========stats/doLoadSelfInvestAmount.do : stats/doLoadSelfInvestAmount==============");
				
		AjaxResponse.responseAjaxObject(response, resultMap);	//결과전송
	}
	
	
	/**
	 * 3년 동기대비 실적비교
	 * @MethodName : doLoadSelfInvestAmount
	 * @param 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/doLoadRecordCompare.do")
	public void doLoadRecordCompare(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return ;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");

		LOG.info(loginUser.getId());
		 
		List<Map> result = null;
		// 통계 정보 가져오기				 
		// 조건 설정
		try{
			result = statsDAO.selectRecordCompare(map);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		int nMon = Integer.parseInt(map.get("month"));
		int nYear = Integer.parseInt(map.get("year"));
		
		HashMap<String, Object> resultMap= new HashMap<String, Object>();
		
		HashMap<String, String> dataMap= new HashMap<String, String>();
		
		HashMap<String, Map> amountMap= new HashMap<String, Map>();
		HashMap<String, Map> countMap= new HashMap<String, Map>();
		HashMap<String, Object> totalCountMap= new HashMap<String, Object>();
		HashMap<String, Object> totalAmountMap= new HashMap<String, Object>();
		
		
		ArrayList tickList = new ArrayList();
		ArrayList yearList = new ArrayList();
		
		for( int yyyy = nYear - 2; yyyy <= nYear; yyyy++ ){
			
			HashMap<String, String> tAmountMap = new HashMap<String, String>();
			HashMap<String, String> tCountMap = new HashMap<String, String>();
			
			Double totalAmount = 0.0;
			int totalCount = 0;
			for(int mm = 1; mm <= nMon; mm++ ){
				
				boolean bFound = false;
				 
				for (int i = 0; i < result.size(); i++) {
					Map tMap = result.get(i);
					//YEAR, MON, AMOUNT, COUNT
					LOG.debug(tMap);
					if( tMap.get("YEAR").toString().equals(String.valueOf(yyyy))
						&& tMap.get("MON").toString().equals(String.valueOf(mm))){
						
						LOG.debug("## YEAR FOUND : " + tMap.get("YEAR"));
						LOG.debug("## MON FOUND : " + tMap.get("MON"));
						tAmountMap.put(String.valueOf(mm) + "월", tMap.get("AMOUNT").toString());
						tCountMap.put(String.valueOf(mm) + "월", tMap.get("COUNT").toString());
						
						totalCount += Integer.parseInt(tMap.get("COUNT").toString());
						totalAmount += Double.parseDouble(tMap.get("AMOUNT").toString());
						
						bFound = true;
						break;
					}
				}
				
				if( bFound == false ){
					tAmountMap.put(String.valueOf(mm)+ "월", "0");
					tCountMap.put(String.valueOf(mm)+ "월", "0");
				}
				if( !tickList.contains(String.valueOf(mm) + "월") )
					tickList.add(String.valueOf(mm) + "월");
			}
			
			countMap.put(String.valueOf(yyyy), tCountMap);
			amountMap.put(String.valueOf(yyyy), tAmountMap);
			
			yearList.add(String.valueOf(yyyy));
			
			LOG.debug("## " + String.valueOf(yyyy) + " : " + totalCount);
			LOG.debug("## " + String.valueOf(yyyy) + " : " + totalAmount);
									
			String strTotalAmount = String.format("%.1f", totalAmount);

			totalCountMap.put(String.valueOf(yyyy), totalCount);
			totalAmountMap.put(String.valueOf(yyyy), strTotalAmount);	
		}
		
		resultMap.put("countMap", countMap);
		resultMap.put("amountMap", amountMap);
		resultMap.put("totalCountMap", totalCountMap);
		resultMap.put("totalAmountMap", totalAmountMap);
		resultMap.put("tickList", tickList);
		resultMap.put("yearList", yearList);
		
		
		
		System.out.println("===========stats/doLoadRecordCompare.do : stats/doLoadRecordCompare==============");
				
		AjaxResponse.responseAjaxObject(response, resultMap);	//결과전송
	}
	
	
	/*************************************************차트그리기 끝***********************************************************/
	
	/************************************************* EIS Mediation 시작 ***********************************************************/
	
	/**
	 *
	 * @MethodName : eisMediation
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/eisMediation.do")
	public String eisMediation(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		System.out.println("===========stats/eisMediation.do : stats/eisMediation==============");
		
		return "stats/eisMediation";
	}
	
	
	/**
	 * 중개회사 순위
	 * @MethodName : doLoadSelfInvestAmount
	 * @param 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/doLoadMediCorp.do")
	public void doLoadMediCorp(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return ;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");

		LOG.info(loginUser.getId());
		 
		List<Map> result = null;
		
		// 통계 정보 가져오기				 
		// 조건 설정
		try{
			result = statsDAO.selectMediCorp(map);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}		
		
		ArrayList resultList = new ArrayList();
		ArrayList tickList = new ArrayList();
		
		HashMap<String, Object> resultMap= new HashMap<String, Object>();
		HashMap<String, String> dataMap= new HashMap<String, String>();
		
		int totalCount = 0;
		int idx = 0;
		for(Map m : result){
			if( idx >= 20 ){
				totalCount += Integer.parseInt(m.get("P_COUNT").toString());
				continue;
			}
			
			String type = m.get("COMPANY").toString();
			String value = m.get("I_COUNT").toString();			
			totalCount += Integer.parseInt(m.get("P_COUNT").toString());
			dataMap.put(type, value);
						
			resultList.add(m);
			tickList.add(type);	
			idx++;
		}		
		
		
		// dataMap 정렬
		 Map<String, String> sortedMap = sortByValues(dataMap); 
	      
	      Set set2 = sortedMap.entrySet();
	      Iterator iterator2 = set2.iterator();
	      while(iterator2.hasNext()) {
	           Map.Entry me2 = (Map.Entry)iterator2.next();	           
	      }
		       
        
        
		resultMap.put("resultList", resultList);
		resultMap.put("tickList", tickList);
		resultMap.put("dataMap", sortedMap);
		resultMap.put("totalCount", totalCount);
		//resultMap.put("countMap", countMap);
		//resultMap.put("amountMap", amountMap);
		//resultMap.put("totalCountMap", totalCountMap);
		//resultMap.put("totalAmountMap", totalAmountMap);
		//sultMap.put("tickList", tickList);
		
		
		System.out.println("===========stats/doLoadMediCorp.do : stats/doLoadMediCorp==============");
				
		AjaxResponse.responseAjaxObject(response, resultMap);	//결과전송
	}
		
	
	/**
	 * 중개인 순위
	 * @MethodName : doLoadSelfInvestAmount
	 * @param 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/doLoadBroker.do")
	public void doLoadBroker(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return ;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");

		LOG.info(loginUser.getId());
		 
		List<Map> result = null;
		
		// 통계 정보 가져오기				 
		// 조건 설정
		try{
			result = statsDAO.selectBroker(map);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}		
		
		ArrayList resultList = new ArrayList();
		ArrayList tickList = new ArrayList();
		
		HashMap<String, Object> resultMap= new HashMap<String, Object>();
		HashMap<String, String> dataMap= new HashMap<String, String>();
		
		int idx = 0;
		int totalCount = 0;
		for(Map m : result){
			if( idx >= 20 ){
				totalCount += Integer.parseInt(m.get("P_COUNT").toString());
				continue;
			}
			
			String type = m.get("AGENT").toString();
			String value = m.get("I_COUNT").toString();			
			totalCount += Integer.parseInt(m.get("P_COUNT").toString());
			
			dataMap.put(type, value);	
			resultList.add(m);
			tickList.add(type);	
			idx++;
		}		
		
		// dataMap 정렬
		
		Map<String, String> sortedMap = sortByValues(dataMap); 
	      
	    Set set2 = sortedMap.entrySet();
	    Iterator iterator2 = set2.iterator();
	    while(iterator2.hasNext()) {
	    	Map.Entry me2 = (Map.Entry)iterator2.next();	           
	    }
	    
		        
		resultMap.put("resultList", resultList);
		resultMap.put("tickList", tickList);
		resultMap.put("dataMap", sortedMap);
		resultMap.put("totalCount", totalCount);
		//resultMap.put("countMap", countMap);
		//resultMap.put("amountMap", amountMap);
		//resultMap.put("totalCountMap", totalCountMap);
		//resultMap.put("totalAmountMap", totalAmountMap);
		//sultMap.put("tickList", tickList);
		
		
		System.out.println("===========stats/doLoadBroker.do : stats/doLoadBroker==============");
				
		AjaxResponse.responseAjaxObject(response, resultMap);	//결과전송
	}
	/************************************************* EIS Mediation 끝 ***********************************************************/
	
	/************************************************* EIS DurationRecord 시작 ***********************************************************/
	
	/**
	 *
	 * @MethodName : eisDurationRecord
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/eisPeriodRecord.do")
	public String eisPeriodRecord(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());

		
		System.out.println("===========stats/eisPeriodRecord.do : stats/eisPeriodRecord==============");
		
		return "stats/eisPeriodRecord";
	}
	
	/************************************************* EIS DurationRecord 끝 ***********************************************************/
	
/************************************************* EIS MemberRecord 시작 ***********************************************************/
	
	/**
	 *
	 * @MethodName : eisMemberRecord
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/eisMemberRecord.do")
	public String eisMemberRecord(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String, String> map) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());

		
		System.out.println("===========stats/eisMemberRecord.do : stats/eisMemberRecord==============");
		
		return "stats/eisMemberRecord";
	}
	
	/************************************************* EIS DurationRecord 끝 ***********************************************************/
	
	
	private static HashMap sortByValues(HashMap map) { 
	       List list = new LinkedList(map.entrySet());
	       // Defined Custom Comparator here
	       Collections.sort(list, new Comparator() {
	            public int compare(Object o2, Object o1) {
	               return ((Comparable) ((Map.Entry) (o1)).getValue())
	                  .compareTo(((Map.Entry) (o2)).getValue());
	            }
	       });

	       // Here I am copying the sorted list in HashMap
	       // using LinkedHashMap to preserve the insertion order
	       HashMap sortedHashMap = new LinkedHashMap();
	       for (Iterator it = list.iterator(); it.hasNext();) {
	              Map.Entry entry = (Map.Entry) it.next();
	              sortedHashMap.put(entry.getKey(), entry.getValue());
	       } 
	       return sortedHashMap;
	  }
	
	/**
	 * 개인별 정보정리(딜/정보/인맥) 리스트
	 * @MethodName : selectPrivateList
	 * @param request
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/selectPrivateList.do")
	public String selectPrivateList(HttpServletRequest request,
			WorkVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());
		String rtn = "stats/sub/PrivateListDeal";
		String tab = vo.getTab();
		String search = vo.getSearch();
		model.addAttribute("name", vo.getTmpNum1());
		model.addAttribute("ttT", vo.getTotal());
		model.addAttribute("searchName", search);

		try{
			model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(vo.ccdCateCd));

			vo.setTotal("total");
			vo.setTmpNum2("statsPrivateList");
			model.addAttribute("tmpNum2", vo.getTmpNum2());

			if(search.length()!=0) model.addAttribute("TAB", "0");
			else model.addAttribute("TAB", tab);

			if(vo.getChoice_year().equals("")){
				cal.setTime( new Date(System.currentTimeMillis()) );
				String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
				vo.setChoice_year(date.substring(0, 4));
			}
			model.addAttribute("choice_year", vo.getChoice_year());

			vo.setChoice_yearS(vo.getChoice_year());
			vo.setChoice_monthS("01");
			vo.setChoice_dayS("01");
			vo.setChoice_month("12");
			vo.setChoice_day("31");
			if(tab.length()==0)tab = "0";
			switch(Integer.parseInt(tab)){
			case 0://딜
				vo.setSorting("0");
				model.addAttribute("offerList", workDAO.selectOfferAllDealList(vo));
				break;
			case 1://정보(핵심체크)
				rtn = "stats/sub/PrivateListKeyPoint";
				model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));
				model.addAttribute("financingList", workDAO.selectofferKeyPoint(vo));
				break;
			case 2://인맥
				rtn = "stats/sub/PrivateListNetwork";
				model.addAttribute("financingList", workDAO.selectHumanNet(vo));
				break;
			case 3://코멘트
				rtn = "stats/sub/PrivateListOpinion";
				model.addAttribute("offerList", workDAO.selectOpinionNdeal(vo));
				break;
			case 4://성과
				rtn = "stats/sub/PrivateListOutcome";
				model.addAttribute("outcomeList", workDAO.selectOutcomeList(vo));
				break;
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
			throw e;
		}

		return rtn;
	}
	
	
	/**
	 * 개인별 통계 팝업
	 * @MethodName : privateStatsPop
	 * @param
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/privateStatsPop.do")
	public String privateStatsPop(HttpServletRequest request,
			StatsVO statsVO,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String,Object> map) throws Exception{

try{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());


		Map result = null;

		if(map.get("choice_year").equals("") && map.get("choice_month").equals("")){
			
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );

			map.put("choice_year", date.substring(0, 4));
			
		}

		map.put("choice_monthS", "01");
		map.put("choice_month", "12");
		
		result = statsDAO.selectPrivateStats(map);
		

		model.addAttribute("stats", result);
		model.addAttribute("choice_year", map.get("choice_year"));
		model.addAttribute("choice_month", map.get("choice_month"));


    	return "stats/privateStatsPop";


}catch(Exception e){			
	e.printStackTrace();
	throw e;
}

	}
	
	
	/**
	 * 통계 전체 엑셀출력
	 * @MethodName : printExcel
	 * @param request
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stats/printExcel.do")
	public String printExcel(HttpServletRequest request,
			WorkVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		String str = vo.getTmpNum1();
		try{
			UtilReplaceTag rpTag = new UtilReplaceTag();
			model.addAttribute("excel_data", rpTag.ReplaceTag(str,"decode"));
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "stats/excel";
	}
	
	
	private void insertMap(ArrayList<ArrayList> dataMapList, int idx, int value){
		ArrayList tList = null;
		
		if( dataMapList.size() == idx + 1 ){
			tList = dataMapList.get(idx);
			tList.add(value);
			
		}
		else{
			tList = new ArrayList();
			tList.add(value);
			dataMapList.add(tList);
		}
	} 
}