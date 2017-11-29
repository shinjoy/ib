package ib.recommend.web;

import ib.basic.web.MultiFileUpload;
import ib.cmm.FileUpDbVO;
import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.login.service.StaffVO;
import ib.push.service.PushService;
import ib.push.service.PushVO;
import ib.recommend.service.RecommendService;
import ib.recommend.service.RecommendVO;
import ib.recommend.service.impl.RecommendDAO;
import ib.reply.service.ReplyVO;
import ib.stats.service.impl.StatsDAO;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;
import ib.work.service.impl.WorkDAO;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * <pre>
 * package  : ib.recommend.web
 * filename : RecommendController.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2013. 3. 20.
 * @version : 1.0.0
 */
@Controller
public class RecommendController {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;
        
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;
    
    @Resource(name = "recommendDAO")
    private RecommendDAO recommendDAO;  
    
    @Resource(name = "workService")
    private WorkService workService;
    
    @Resource(name = "workDAO")
    private WorkDAO workDAO;
    
    @Resource(name = "statsDAO")
    private StatsDAO statsDAO;
    
    @Resource(name = "recommendService")
    private RecommendService recommendService;
    
    @Resource(name = "pushService")
	private PushService pushService;
    
    
      
	/** log */
    protected static final Log LOG = LogFactory.getLog(RecommendController.class);
	
	protected static Calendar cal = Calendar.getInstance();

	/**
	 * main 화면
	 * @MethodName : index
	 * @param rcmdVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/recommend/index.do")
	public String index( RecommendVO rcmdVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		model.addAttribute("ttT", rcmdVO.getTotal());
		//List<WorkVO> recommend = null;
		List<RecommendVO> recommend = null;
//		List<RecommendVO> opinion = null;
		
	/** 년도별로 소팅 **/
		if(rcmdVO.getChoice_year().equals("") && rcmdVO.getChoice_month().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyy").format( cal.getTime() );
			
			rcmdVO.setChoice_year(date);
		}//System.out.println("---------choice_year---\n"+rcmdVO.getChoice_year());
		String year = rcmdVO.getChoice_year();
		model.addAttribute("choice_year", year);
		
		rcmdVO.setChoice_monthS("01");
		rcmdVO.setChoice_month("12");
	/** 년도별로 소팅 **/
		
		rcmdVO.setOfferCd("00013");
		
		try{
			recommend = recommendDAO.selectIBlist(rcmdVO);
//			opinion = recommendDAO.selectOpinionList(rcmdVO);
		}catch (Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
	/*	StaffVO staffVO = new StaffVO();
		model.addAttribute("userList", cmm.UserList(staffVO));*/
		
		model.addAttribute("recommendList", recommend);
//		model.addAttribute("opinionList", opinion);
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(rcmdVO.ccdCateCd));
		
    	return "recommend/RecommendMain";
    }

	/**
	 * 의견 페이지 조회
	 * @MethodName : comment
	 * @param rcmdVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/recommend/comment.do")
	public String comment( RecommendVO rcmdVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		if(rcmdVO.getsNb()==null | "".equals(rcmdVO.getsNb())) return "ajaxPopDiv/Reply";
		
		/** 년도별로 소팅 **/
		if(rcmdVO.getChoice_year().equals("") && rcmdVO.getChoice_monthS().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyy").format( cal.getTime() );
			rcmdVO.setChoice_year(date);
			rcmdVO.setChoice_monthS("01");
		}
		
		rcmdVO.setChoice_month("12");
		/** 년도별로 소팅 **/
		
		rcmdVO.setOfferCd("00013");
		model.addAttribute("offerSNB", rcmdVO.getsNb());
		model.addAttribute("choice_year", rcmdVO.getChoice_year());
		model.addAttribute("choice_monthS", rcmdVO.getChoice_monthS());
		
		
		model.addAttribute("tmDt", rcmdVO.getTmDt());
		
		try{
			List<RecommendVO> recommend = recommendDAO.selectRecommendInfo(rcmdVO);
			model.addAttribute("d_day", D_day(recommend.get(0)));
			
			String cpnid = recommend.get(0).getCpnId();
			rcmdVO.setCpnId((cpnid==null||"".equals(cpnid))?"0":cpnid);
			
			rcmdVO.setCategoryCd("00001");
			List<RecommendVO> opinion = recommendDAO.selectOpinionList(rcmdVO);
			
			rcmdVO.setOfferCd("00004");
			List<WorkVO> analysis = statsDAO.selectPrivateOffer(rcmdVO);
			
			rcmdVO.setOfferCd("00005");
			List<WorkVO> proposal = statsDAO.selectPrivateOffer(rcmdVO);
			
			rcmdVO.setOfferCd("00002");
			List<WorkVO> ir = statsDAO.selectPrivateOffer(rcmdVO);
			
			rcmdVO.setOfferCd("00003");
			List<WorkVO> visit = statsDAO.selectPrivateOffer(rcmdVO);
			
			ReplyVO rvo = new ReplyVO();
			rvo.setsNb(rcmdVO.getsNb());
			model.addAttribute("disposalList", workDAO.selectDisposalList(rvo));
			model.addAttribute("supportList", workDAO.selectSupporterList(rvo));
			
			
			//-------- 딜정보 회사기본정보 추가 201504001 :S ---------
			for(RecommendVO info : recommend){
				String sizeT = info.getCategoryBusiness() + info.getMajorProduct() + info.getCeo() + info.getStockValue() + "" + info.getUnitPrice();
				LOG.debug("################## zzz length : " + sizeT.length());
				if(sizeT.length() > 43 && (info.getCategoryBusiness() + info.getMajorProduct() + info.getCeo()).length() > 30){
					info.setMajorProductFull(info.getMajorProduct());					
					int tmp = 28 - (info.getCategoryBusiness() + info.getCeo()).length();
					info.setMajorProduct(info.getMajorProduct().substring(0, (tmp<0?0:tmp)) + "...");		//full
				}
			}
			//-------- 딜정보 회사기본정보 추가 201504001 :E ---------
			
			//-------- 추천종목 딜 정보(IB_OFFER.RECOMMEND_SNB) 있으면 가져오기 ...(딜제안중 딜일때) :S --------- 
			List<RecommendVO> rcmdDealInfo = recommendDAO.selectRcmdDealInfo(rcmdVO);
			model.addAttribute("rcmdDealInfo", rcmdDealInfo);
			//-------- 추천종목 딜 정보(IB_OFFER.RECOMMEND_SNB) 있으면 가져오기 ...(딜제안중 딜일때) :E ---------
			
			Map map = new HashMap();
			map.put("offerId", rcmdVO.getOfferSnb());
			
			model.addAttribute("recommendInfo", recommend);
			model.addAttribute("opinionList", opinion);
			model.addAttribute("analysisList", analysis);
			model.addAttribute("proposalList", proposal);
			model.addAttribute("irList", ir);
			model.addAttribute("visitList", visit);
			
			if("00008".equals(recommend.get(0).getCategoryCd())){	//M&A
				model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00016"));
				model.addAttribute("mnaMatchList", workDAO.selectMnaMatchCpnList(rcmdVO));
			}else
				model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00004"));
		}catch (Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(rcmdVO.ccdCateCd));
		
		return "ajaxPopDiv/Reply";
	}
	
	/**
	 * 딜팝업 - 분석자 지정 (20170331) - sjy
	
	 */
	@RequestMapping(value="/recommend/saveAnalyUser.do")
	public void saveAnalyUser( @RequestParam Map<String, Object>map,
			HttpSession session,HttpServletResponse response,
			ModelMap model) throws Exception{
		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		map.put("rgId", loginUser.getStaffSnb());
		int sNb = recommendService.saveAnalyUser(map);
		
		
		
		//------- 푸쉬 세팅 :S -----------
		try{
			
			//푸시
			Map pushMap = new HashMap();
			
			pushMap.put("pushType",		PushVO.ptDealAnal);
			pushMap.put("pushTypeId",	sNb);
			pushMap.put("userId",		map.get("userId").toString());
			pushMap.put("content",		"[분석자지정]"+map.get("cpnNm").toString()+" (by "+loginUser.getName() + ")");
			pushMap.put("rgUserId",		loginUser.getStaffSnb());
			
			if(!map.get("userId").toString().equals("")) pushService.insertPushLogSearchSabunList(pushMap);
			
			LOG.debug("##########################KKK#######################:::" + pushMap);
			
		}catch(Exception e){				
		}
		//------- 푸쉬 세팅 :E -----------
		
		
		
		//메모전송
		WorkVO memoVo = new WorkVO();
		String date = new SimpleDateFormat("yyyyMMdd").format( cal.getTime() );
		StringBuffer strB = new StringBuffer();
		strB.append("분석자로 지정 되었습니다. \n [").append(map.get("cpnNm")+" - "+ map.get("cdNm") ).append("] 딜 메뉴에서 확인바람.");
		
		memoVo.setTmDt(date);
		memoVo.setMemoSndName(map.get("analyUserName").toString());
		memoVo.setComment(strB.toString());
		memoVo.setSttsCd("00001");
		memoVo.setPriv("N");
		memoVo.setMainSnb("0");
		workDAO.insertMemo(memoVo);
	
		AjaxResponse.responseAjaxSave(response, sNb);		//결과전송
	}
	
	/**
	 * 딜팝업 - 분석자 지정 된 사람 리스트  (20170331) - sjy
	
	 */
	@RequestMapping(value="/recommend/getAnalyUserList.do")
	public void getAnalyUserList( 
			@RequestParam Map<String, Object>map,
			HttpSession session,HttpServletResponse response,
			ModelMap model) throws Exception{
		
		List<Map> analyUserList = recommendService.getAnalyUserList(map);
		
		AjaxResponse.responseAjaxSelect(response, analyUserList);
	}
	

	/**
	 * 딜팝업 - 분석자 삭제 (20170331) - sjy delete Flag Y 처리
	
	 */
	@RequestMapping(value="/recommend/deleteAnalyUser.do")
	public void deleteAnalyUser( @RequestParam Map<String, Object>map,
			HttpSession session,HttpServletResponse response,
			ModelMap model) throws Exception{
		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		map.put("rgId", loginUser.getStaffSnb());
		recommendService.deleteAnalyUser(map);
		
		//메모전송
		WorkVO memoVo = new WorkVO();
		String date = new SimpleDateFormat("yyyyMMdd").format( cal.getTime() );
		StringBuffer strB = new StringBuffer();
		strB.append("분석자에서 취소되었습니다. [").append(map.get("cpnNm")+" - "+ map.get("cdNm") ).append("] ");
		
		memoVo.setTmDt(date);
		memoVo.setMemoSndName(map.get("analyUserName").toString());
		memoVo.setComment(strB.toString());
		memoVo.setSttsCd("00001");
		memoVo.setPriv("N");
		memoVo.setMainSnb("0");
		workDAO.insertMemo(memoVo);
		
		AjaxResponse.responseAjaxSave(response, 1);		//결과전송
	}
	
	
	
	
	
	
	
	/**
	 * D day 계산 
	 * @MethodName : D_day
	 * @param vo
	 * @return
	 */
	public String D_day(WorkVO vo){
		if( vo.getDueDt()==null || vo.getDueDt().equals("") ) return null;
		
		System.out.println("\n-----------\n"+vo.getDueDt()+"\n-------------\n");
		
		java.util.Calendar caldar = java.util.Calendar.getInstance(); //일단 Calendar 객체
		long now_day = caldar.getTimeInMillis();
		
		int due_year = Integer.parseInt( vo.getDueDt().substring(0,4) );
		int due_mon = Integer.parseInt( vo.getDueDt().substring(5,7) );
		int due_date = Integer.parseInt( vo.getDueDt().substring(8,10) );
		caldar.set(due_year, due_mon-1, due_date);
		long event_day = caldar.getTimeInMillis();
		
		long d_day = (event_day - now_day)/(60*60*24*1000);
		
		return Long.toString(d_day);
	}
	
	/**
	 * 결과, 딜제안자, 진행사항 수정
	 * @MethodName : updateResult
	 * @param rcmdVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/recommend/updateResult.do")
	public String updateResult( RecommendVO rcmdVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		rcmdVO.setRgId(loginUser.getId());
		
		int cnt = 0, memoCnt = 0;
		if("N".equals(rcmdVO.getSubMemo())){
			rcmdVO.setMainSnb("0");
		}
		try{
			cnt = recommendDAO.updateResult(rcmdVO);
			LOG.debug(loginUser.getId()+"^_^recommendDAO.updateResult^_^"+rcmdVO.getsNb());
			
			if(!("".equals(rcmdVO.getRcmdProposer()) | rcmdVO.getRcmdProposer()==null)) {
				
				// Calendar cal = Calendar.getInstance();
				cal.setTime( new Date(System.currentTimeMillis()) );
				String date = new SimpleDateFormat("yyyyMMdd").format( cal.getTime() );
				
				rcmdVO.setTmDt(date);
				rcmdVO.setMemoSndName(rcmdVO.getRcmdProposer());
				rcmdVO.setComment("[딜제안자로 지정] 종목:"+rcmdVO.getCpnNm()+" - 추천메뉴에서 확인바람.");
				rcmdVO.setSttsCd("00001");
				rcmdVO.setPriv("N");
				rcmdVO.setRgId("gjh");
				memoCnt = workDAO.insertMemo(rcmdVO);
				LOG.debug(loginUser.getId()+"^_^workDAO.insertMemo");
				
//				System.out.println("\n-------------------\n"+rcmdVO.getTmDt()+"\n-------------------\n"+rcmdVO.getComment()+"\n-------------------\n");
				
				rcmdVO.setMemoSndName("구자형");
				rcmdVO.setComment("<추천>"+rcmdVO.getCpnNm()+" 딜제안자로 "+rcmdVO.getRcmdProposer()+" 지정 - 추천메뉴에서 확인.");
				rcmdVO.setSttsCd("");
				
				memoCnt = workDAO.insertMemo(rcmdVO);
				LOG.debug(loginUser.getId()+"^_^workDAO.insertMemo");
			}
		}catch (Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
    	return "recommend/RecommendMain";
    }
	
	/**
	 * 의견 입력,삭제			(... 수정 은 하단 recommend/saveOpinion2.do 에서)
	 * @MethodName : saveOpinion
	 * @param rcmdVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/recommend/saveOpinion.do")
	public String saveOpinion( 
			HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("rcmdVO") RecommendVO rcmdVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		rcmdVO.setRgId(loginUser.getId());		//로그인 사용자
		String rtnPath = "";
		
		try{
			if("".equals(rcmdVO.getsNb()) | rcmdVO.getsNb()==null){
				//System.out.println("\n:::::::: insert :::::::\n");

				// 정보 받기
				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				
				String cateCd = (String) multipartRequest.getParameter("categoryCd");
				rtnPath = "redirect:/recommend/comment.do?sNb="+(String) multipartRequest.getParameter("tmpNum1");
				if ("00002".equals(cateCd)) rtnPath = "redirect:/personnel/management/index.do?usrId="+(String) multipartRequest.getParameter("usrId");
				rcmdVO.setOfferSnb( (String) multipartRequest.getParameter("offerSnb"));
				rcmdVO.setComment( (String) multipartRequest.getParameter("comment"));
				rcmdVO.setCategoryCd( cateCd );
				
				//코멘트 입력	(딜 의견)
				recommendDAO.insertRecommendOpinion(rcmdVO);
				
				
				//------- 푸쉬 세팅 :S -----------
				try{
					
					String comment = rcmdVO.getComment();
					if(comment.length() > 100) comment = comment.substring(0, 100);
					
					//딜 코멘트 등록	
					Map pushMap = new HashMap();
					
					pushMap.put("pushType", 	PushVO.ptDealComment);
					pushMap.put("pushTypeId", 	rcmdVO.getsNb());
					pushMap.put("usrId", 		rcmdVO.getUsrId());
					pushMap.put("content", 		"[신규 코멘트]"+rcmdVO.getCpnNm()
												+"(" + loginUser.getName()
												+":"+comment+")");
					pushMap.put("rgUserId", 	loginUser.getStaffSnb());
					
					LOG.debug("#############################" + pushMap.get("content"));					
					LOG.debug("#############################" + pushMap);
					
					if(!rcmdVO.getUsrId().equals("")) pushService.insertPushLogSearchSabunList(pushMap);
					
				}catch(Exception e){
				}
				//------- 푸쉬 세팅 :E -----------
				
				
								
				//maxSnb 구하기 
				//List<RecommendVO> rslt = recommendDAO.selectMaxOpinionSnb(rcmdVO);
				
				// 파일업로드 시키기
				//MultiFileUpload mUpload = new MultiFileUpload();
				FileUpDbVO fileVo = new FileUpDbVO();
				//fileVo.setOfferSnb(rslt.get(0).getsNb());
				fileVo.setOfferSnb(rcmdVO.getsNb());
				fileVo.setReportYN("N");
				fileVo.setFileCategory("00002");		//00000:정보정리, 00001: staff사진, 00002: 댓글 첨부파일, 00003: 인사관리->이력서파일
				fileVo.setRgId(loginUser.getId());
				
				MultiFileUpload mUpload = new MultiFileUpload();
				mUpload.fileUpload(multipartRequest, fileVo, request, workDAO);
				
			}else{
				rtnPath = "redirect:/recommend/comment.do?sNb="+ rcmdVO.getTmpNum1();
				if ("00002".equals(rcmdVO.getCategoryCd())) rtnPath = "redirect:/personnel/management/index.do?usrId="+rcmdVO.getUsrId();
				if("".equals(rcmdVO.getOfferSnb()) | rcmdVO.getOfferSnb()==null){
					//System.out.println("\n:::::::: delete :::::::\n");
					recommendDAO.deleteRecommendOpinion(rcmdVO);
					LOG.debug(loginUser.getId()+"^_^recommendDAO.deleteRecommendOpinion");
				}else{
					///////////////////////////////////////// 이 수정 부분은 하단 recommend/saveOpinion2.do 에서 처리로 바뀜 2016-06-01 !!!!!!
					//System.out.println("\n:::::::: update :::::::\n");
					recommendDAO.updatecomment(rcmdVO);
					LOG.debug(loginUser.getId()+"^_^recommendDAO.updatecomment^_^"+rcmdVO.getsNb());
				}
			}
		}catch (Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return rtnPath;
	}
	
	
	/**
	 * 의견 수정
	 * @MethodName : saveOpinion
	 * @param rcmdVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/recommend/saveOpinion2.do")
	public String saveOpinion2( 
			HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("rcmdVO") RecommendVO rcmdVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		rcmdVO.setRgId(loginUser.getId());
		String rtnPath = "";
		try{
			
			rtnPath = "redirect:/recommend/comment.do?sNb="+ rcmdVO.getTmpNum1();
			if ("00002".equals(rcmdVO.getCategoryCd())) rtnPath = "redirect:/personnel/management/index.do?usrId="+rcmdVO.getUsrId();
			
				
			// 정보 받기
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			
			String cateCd = (String) multipartRequest.getParameter("categoryCd");
			rtnPath = "redirect:/recommend/comment.do?sNb="+(String) multipartRequest.getParameter("tmpNum1");
			if ("00002".equals(cateCd)) rtnPath = "redirect:/personnel/management/index.do?usrId="+(String) multipartRequest.getParameter("usrId");
			rcmdVO.setOfferSnb( (String) multipartRequest.getParameter("offerSnb"));
			rcmdVO.setComment( (String) multipartRequest.getParameter("comment"));
			rcmdVO.setCategoryCd( cateCd );
			
			// 파일업로드 시키기
			//MultiFileUpload mUpload = new MultiFileUpload();
			FileUpDbVO fileVo = new FileUpDbVO();
//					fileVo.setOfferSnb(rslt.get(0).getsNb());
			fileVo.setOfferSnb(rcmdVO.getsNb());
			fileVo.setReportYN("N");
			fileVo.setFileCategory("00002"); //00000:정보정리, 00001: staff사진 ,  00002: 댓글 첨부파일, 00003: 인사관리->이력서파일
			fileVo.setRgId(loginUser.getId());
			
			MultiFileUpload mUpload = new MultiFileUpload();
			mUpload.fileUpload(multipartRequest, fileVo, request, workDAO);
			
			
			
			
			recommendDAO.updatecomment(rcmdVO);
				
				
		}catch (Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return rtnPath;
	}
	
	
	/**
	 * 딜 등록 팝업(추천종목 > 딜제안중)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 05. 23.
	 */
	@RequestMapping(value = "/recommend/regDealPopup.do")
	public String regCstPopup(HttpServletRequest request, HttpServletResponse response, ModelMap model,
								HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		model.addAllAttributes(map);	//받은 파라미터 화면으로 그대로 전달.
		
		return "recommend/regDealPopup";
	}

	
	/**
	 * 추천종목 >> 제안중 딜 등록 ajax
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 24.
	 */
	@RequestMapping(value = "/recommend/regPropDeal.do")
	public void regPropDeal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;	
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		int upCnt = 0;
		map.put("usrId", loginUser.getId());
		upCnt = recommendService.regPropDeal(map);			//추천종목 으로 제안중딜을 등록, 파일도 카피해서 등록, 기존 추천종목 상태 '딜제안'으로 변경 
		
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
}