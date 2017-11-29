package ib.mobile.web;

import ib.basic.web.MultiFileUpload;
import ib.cmm.ComCodeVO;
import ib.cmm.FileUpDbVO;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.service.CommonService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.login.service.StaffVO;
import ib.person.service.PersonVO;
import ib.push.service.PushService;
import ib.recommend.service.RecommendService;
import ib.recommend.service.RecommendVO;
import ib.reply.service.ReplyVO;
import ib.schedule.service.SpCmmVO;
import ib.schedule.service.impl.ScheduleVO;
import ib.stats.service.StatsService;
import ib.work.service.WorkMemoService;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;
import ib.work.web.WorkMemoController;

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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import egovframework.rte.fdl.property.EgovPropertyService;


@Controller
public class MbDealController {
	
	@Resource(name="CmmUseService")
	private CmmUseService cmm;
	
	@Resource(name="workService")
	private WorkService workService;
	
	@Resource(name="recommendService")
	private RecommendService recommendService;
	
	@Resource(name="statsService")
	private StatsService statsService;
	
    /** log */
    protected static final Log LOG = LogFactory.getLog(MbDealController.class);
   
    Calendar cal = Calendar.getInstance();
	
    //딜 리스트 페이지
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/deal/dealMain.do")
  	public String alarmListMainPop(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  	
  		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
  		
  		
  		return "/m/deal/dealMain";
  		
  	}
  	
  	//딜 탭 리스트
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "m/deal/getDealTabList.do")
   	public void getDealTabList(
   			HttpServletRequest req,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map, WorkVO workVO
   			) throws Exception {
   		
   		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
   		List list = cmm.CommonCdList(workVO.getMenuCd(), loginUser.getId());
   		
   		AjaxResponse.responseAjaxSelect(response, list);
   		
   	}
  	
  	//딜 리스트
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "m/deal/getDealList.do")
   	public void getDealList(
   			HttpServletRequest req,
   			HttpServletResponse response,HttpSession session,
   			WorkVO workVO
   			) throws Exception  {
   		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		workVO.setRgId(loginUser.getId());
		String tab = workVO.getSorting();
		String search = workVO.getSearch();
		
		Map resultMap = new HashMap();
		
		workVO.setChoice_monthS("01");
		workVO.setChoice_month("12");
		
		if("00001".equals(tab)){ 			//메자닌_상장
			workVO.setSorting("00001");
			workVO.setListed("Y");
		}else if("00002".equals(tab)){		//딜 제안중
			workVO.setMiddleOfferCd("00004");
			workVO.setSorting("null");
		}else if("00004".equals(tab)){		//메자닌_비상장
			workVO.setSorting("00001");
			workVO.setListed("N");
		}else if("00005".equals(tab)){		//PRE-IPO
			workVO.setSorting("00012");	
		}else if("00006".equals(tab)){		//벤처
			workVO.setSorting("00016");
		}else if("00007".equals(tab)){		//M&A
			workVO.setSorting("00008");
			
		}else if("00008".equals(tab)){		//스팩
			workVO.setSorting("00013");
		}else if("00000".equals(tab)){		//전체
			
		}else if("00009".equals(tab)){		//바이오/헬스케어
			workVO.setSorting("00017");
		}else{ //그 이외에
			workVO.setSorting(tab);
		}
	
		if("statsPrivateList".equals(workVO.getTmpNum2()) ) workVO.setTmpNum2("");

		//division 정보 포함 전달
		workVO.setDivision(loginUser.getDivision());
		
		if(!workVO.getSelectUser().equals("")){
			String [] userArr = workVO.getSelectUser().split(",");
			workVO.setSearchUserArr(userArr);
		}
		
		resultMap.put("dealList", workService.selectOfferAllDealListForMobile(workVO));
		resultMap.put("todayDeal", workService.getTodayDeal(new HashMap()));
		
		AjaxResponse.responseAjaxObject(response, resultMap);
   	}
   	
    //딜 검색 상세 옵션
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/deal/openDetailDealSetPop.do")
  	public String openDetailDelSetPop(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  	
  		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
  		
  		model.addAllAttributes(map);
  		
  		return "/m/deal/detailDealSetPop";
  		
  	}
  	
    //딜 상세 팝업
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/commonPop/dealViewPop_openLayer.do")
  	public String openDealDetailPop(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  	
  		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
  		
  		model.addAllAttributes(map);
  		
  		return "/m/deal/dealViewPop";
  		
  	}
  	
    //딜 상세 데이터
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/deal/getDealDetail.do")
  	public void getDealDetail(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, RecommendVO recommendVO
  			) throws Exception {
  		
  		Map resultMap = new HashMap();
  		
  		List list = recommendService.selectRecommendInfo(recommendVO);
  		
  		//-------- 딜정보 회사기본정보 추가 201504001 :S ---------
  		
  		for(int i=0; i<list.size();i++){
  			RecommendVO info = (RecommendVO) list.get(i);
  			String sizeT = info.getCategoryBusiness() + info.getMajorProduct() + info.getCeo() + info.getStockValue() + "" + info.getUnitPrice();
			
			if(sizeT.length() > 43 && (info.getCategoryBusiness() + info.getMajorProduct() + info.getCeo()).length() > 30){
				info.setMajorProductFull(info.getMajorProduct());					
				int tmp = 28 - (info.getCategoryBusiness() + info.getCeo()).length();
				info.setMajorProduct(info.getMajorProduct().substring(0, (tmp<0?0:tmp)) + "...");		//full
			}
  		}
  		
		//-------- 딜정보 회사기본정보 추가 201504001 :E ---------
  		
  		resultMap.put("list",list);
  		
  		List mnaMatchList = new ArrayList();
  		
  		//mna 매칭 회사 
  		if("00008".equals(((RecommendVO)list.get(0)).getCategoryCd())){	//M&A
  			
  			mnaMatchList = workService.selectMnaMatchCpnList(recommendVO);
  		}
  		resultMap.put("cdCategoryList", cmm.CommonCdList(recommendVO.ccdCateCd));
  		resultMap.put("mnaMatchList", mnaMatchList);
  		
  		AjaxResponse.responseAjaxObject(response, resultMap);
  	}
  	
    //딜 의견
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/deal/getDealComment.do")
  	public void getDealComment(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, RecommendVO recommendVO) throws Exception {
  		
  		Map resultMap = new HashMap();
  		
  		/** 년도별로 소팅 **/
		if(recommendVO.getChoice_year().equals("") && recommendVO.getChoice_monthS().equals("")){
			
			
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyy").format( cal.getTime() );
			recommendVO.setChoice_year(date);
			recommendVO.setChoice_monthS("01");
		}
		try{
		recommendVO.setChoice_month("12");
		/** 년도별로 소팅 **/
		recommendVO.setOfferCd("00013");
		
		String cpnid = recommendVO.getCpnId();
		recommendVO.setCpnId((cpnid==null || "".equals(cpnid)) ? "0" : cpnid);
		
		//의견
		recommendVO.setCategoryCd("00001");
		List<RecommendVO> opinion = recommendService.selectOpinionList(recommendVO);
		resultMap.put("opinionList",opinion);
		
		//분석
		recommendVO.setOfferCd("00004");
		List<WorkVO> analysis = statsService.selectPrivateOffer(recommendVO);
		resultMap.put("analysisList",analysis);
		
		//제안서
		recommendVO.setOfferCd("00005");
		List<WorkVO> proposal = statsService.selectPrivateOffer(recommendVO);
		resultMap.put("proposalList",proposal);
		
		//ir
		recommendVO.setOfferCd("00002");
		List<WorkVO> ir = statsService.selectPrivateOffer(recommendVO);
		resultMap.put("irList",ir);
		
		//탐방
		recommendVO.setOfferCd("00003");
		List<WorkVO> visit = statsService.selectPrivateOffer(recommendVO);
		resultMap.put("visitList",visit);
		
		//-------- 추천종목 딜 정보(IB_OFFER.RECOMMEND_SNB) 있으면 가져오기 ...(딜제안중 딜일때) :S --------- 
		/*List<RecommendVO> rcmdDealInfo = recommendDAO.selectRcmdDealInfo(rcmdVO);
		model.addAttribute("rcmdDealInfo", rcmdDealInfo);*/
		//-------- 추천종목 딜 정보(IB_OFFER.RECOMMEND_SNB) 있으면 가져오기 ...(딜제안중 딜일때) :E ---------
		
		//매각정보 일단 주석 처리 
		//ReplyVO rvo = new ReplyVO();
		//rvo.setsNb(recommendVO.getsNb());
		//model.addAttribute("disposalList", workDAO.selectDisposalList(rvo));	//딜 매각
		//model.addAttribute("supportList", workDAO.selectSupporterList(rvo));	//딜 공동진행
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
  		
		AjaxResponse.responseAjaxObject(response, resultMap);
  	}
  	
  	
    //딜 분석자 팝업 
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/deal/openDealAnalPop.do")
  	public String openDealAnalPop(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map) throws Exception {
  		
  	
  		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
  		
  		model.addAllAttributes(map);
  		
  		return "/m/deal/dealAnalPop";
  		
  	}
  	
  	//딜 코멘트 등록(IR,제안서,분석)
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "m/deal/saveIrAnalpro.do")
   	public void saveIrAnalpro(
   			HttpServletRequest req,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map, WorkVO workVO) throws Exception {
   		
   	
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		int saveCnt =0;
		
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
		
			workVO.setRgId(loginUser.getId());
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMMdd").format( cal.getTime() );
			workVO.setRgNm(loginUser.getName());
			workVO.setMiddleOfferCd("00000");
			workVO.setInfoProvider("0");
			workVO.setSupporter("0");
			workVO.setRcmdSnb("0");
			workVO.setTmDt(date);
			
			map.put("rgId", loginUser.getId());
			saveCnt = workService.saveDeal(workVO,map);
		}
		
		
   		AjaxResponse.responseAjaxSave(response, saveCnt);
   		
   	}
   	
	//딜 코멘트 등록(단순의견)
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "m/deal/saveDealComment.do")
   	public void saveDealComment(
   			HttpServletRequest req,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map, RecommendVO recommendVO) throws Exception {
   		
   	
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		int saveCnt =0;
		
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
			recommendVO.setRgNm(loginUser.getName());
			recommendVO.setRgId(loginUser.getId());
			map.put("rgId", loginUser.getId());
			map.put("rgUserId", loginUser.getStaffSnb());
			
			saveCnt = recommendService.saveDealComment(recommendVO, map);
		}
		
		
		
   		AjaxResponse.responseAjaxSave(response, saveCnt);
   		
   	}
   	
   	//딜 코멘트 삭제(단순의견)
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "m/deal/deleteDealComment.do")
   	public void deleteDealComment(
   			HttpServletRequest req,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map, RecommendVO recommendVO) throws Exception {
   		
   	
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		int saveCnt =0;
		
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
			recommendVO.setRgId(loginUser.getId());
			map.put("rgId", loginUser.getId());
			
			if(!(recommendVO.getsNb()).equals("") && recommendVO.getsNb() !=null) recommendService.deleteDealComment(recommendVO);
			saveCnt =1;
		}
		
   		AjaxResponse.responseAjaxSave(response, saveCnt);
   		
   	}
   	
    //딜 투자심의 팝업 
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/deal/openDealOpinion.do")
  	public String openDealOpinion(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map) throws Exception {
  		
  	
  		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
  		
  		model.addAllAttributes(map);
  		
  		return "/m/deal/dealOpinionPop";
  		
  	}
  	
    //딜 투자의견 수정
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/deal/doEditDealInvest.do")
  	public void doEditDealInvest(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session, WorkVO workVO,
  			ModelMap model, @RequestParam Map<String,Object>map) throws Exception {
  		
  	
  		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
  		int saveCnt =0;
		
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
			workVO.setRgId(loginUser.getId());
			workVO.setName(loginUser.getName());
			workVO.setRgNm(loginUser.getName());
		
			map.put("rgId", loginUser.getId());
			map.put("rgUserId", loginUser.getStaffSnb());
			saveCnt = workService.doEditDealInvest(workVO,map);
			
		}
		
		AjaxResponse.responseAjaxSave(response, saveCnt);
  	}
  	
    //딜 등록 팝업
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/deal/dealProcPop_openLayer.do")
  	public String dealProcPop(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map) throws Exception {
  		
  	
  		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
  		
  		model.addAllAttributes(map);
  		
  		return "/m/deal/dealProcPop";
  		
  	}
  	
 	//딜 공통코드
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "m/deal/getDealCodeInfo.do")
   	public void getDealCodeInfo(
   			HttpServletRequest req,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map, WorkVO workVO) throws Exception {
   		
   		
   		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
   		
   		Map resultMap = new HashMap();
   		
   		List dealMiddleOfferList = cmm.CommonCdList(workVO.ccdMidOffCd);						//00011 중개 제안중
   		List dealSubOfferList = cmm.CommonCdList(workVO.ccdOffCd, loginUser.getId());	//받은제안, 제안 
   		List dealTypeList = cmm.CommonCdList(workVO.ccdCateCd, loginUser.getId());		//상장 CB
   		List companyTypeCdList = cmm.CommonCdList("00017");								//회사 업종
   		
   		resultMap.put("dealMiddleOfferList",dealMiddleOfferList);
   		resultMap.put("dealSubOfferList",dealSubOfferList);
   		resultMap.put("dealTypeList",dealTypeList);
   		resultMap.put("companyTypeCdList",companyTypeCdList);
   		
   		
   		AjaxResponse.responseAjaxObject(response, resultMap);
   		
   	}
   	
    //딜 추천인 팝업
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/deal/dealRecommendPersonPop.do")
  	public String dealRecommendPersonPop(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map) throws Exception {
  		
  	
  		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
  		
  		model.addAllAttributes(map);
  		
  		return "/m/deal/dealRecommendPersonPop";
  		
  	}
  	
    //딜 추천인 리스트 
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/deal/getRecommendList.do")
  	public void getRecommendList(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,WorkVO workVO,
  			ModelMap model, @RequestParam Map<String,Object>map) throws Exception {
  		
  		List result = workService.selectRecommendOne(workVO);
  	
  		AjaxResponse.responseAjaxSelect(response, result);
  	}
  	
  	//딜 등록
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/deal/doDealSave.do")
  	public void doDealSave(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,WorkVO workVO,
  			ModelMap model, @RequestParam Map<String,Object>map) throws Exception {
  		
  		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
  		int saveCnt =0;
		
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
			
			workVO.setRgId(loginUser.getId());
			workVO.setRgNm(loginUser.getName());
			map.put("rgId",loginUser.getId());
			map.put("rgUserId", loginUser.getStaffSnb());
			
			if("".equals(workVO.getMiddleOfferCd())||workVO.getMiddleOfferCd()==null)workVO.setMiddleOfferCd("00000");
			if("".equals(workVO.getInfoProvider())||workVO.getInfoProvider()==null)workVO.setInfoProvider("0");
			if("".equals(workVO.getSupporter())||workVO.getSupporter()==null)workVO.setSupporter("0");
			if("".equals(workVO.getRcmdSnb())||workVO.getRcmdSnb()==null)workVO.setRcmdSnb("0");
			if("".equals(workVO.getCstId())||workVO.getCstId()==null)workVO.setCstId("0");
			if("".equals(workVO.getSupporterRatio())||workVO.getSupporterRatio()==null)workVO.setSupporterRatio("0");
			
			int cnt = 0, cntCus = 0;
			if(!"00011".equals(workVO.getMiddleOfferCd())){
				workVO.setEntrust(null);
			}
				
			saveCnt = workService.saveDeal(workVO,map);
		}

		
  		AjaxResponse.responseAjaxSave(response, saveCnt);
  	}
  	
  	//딜 삭제
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/deal/dealDelete.do")
  	public void dealDelete(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,WorkVO workVO,
  			ModelMap model, @RequestParam Map<String,Object>map) throws Exception {
  		

		
  		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
  		int saveCnt =0;
		
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
			
			workVO.setRgId(loginUser.getId());
			map.put("rgId",loginUser.getId());
			
			saveCnt = workService.deleteDeal(workVO,map);
		}

		
  		AjaxResponse.responseAjaxSave(response, saveCnt);
  	}
  	
    //딜 안내
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/deal/openDealGuidePop.do")
  	public String openDealGuide(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  	
  		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
  		
  		
  		return "/m/deal/dealGuidePop";
  		
  	}
  	

 
}