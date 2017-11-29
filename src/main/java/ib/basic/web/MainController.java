package ib.basic.web;

import ib.alarm.service.AlarmService;
import ib.board.service.BoardService;
import ib.card.service.CardService;
import ib.cmm.ComCodeVO;
import ib.cmm.FileUpDbVO;
import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.service.CommonService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.cmm.util.sim.service.ClntInfo;
import ib.login.service.StaffVO;
import ib.person.service.PersonVO;
import ib.person.service.impl.PersonDAO;
import ib.schedule.service.FormDocService;
import ib.schedule.service.FormDocVO;
import ib.schedule.service.LoginService;
import ib.schedule.service.Utill;
import ib.selfImprovement.service.SelfImprovementVO;
import ib.selfImprovement.service.impl.SelfImprovementDAO;
import ib.work.service.WorkMemoService;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;
import ib.work.service.impl.WorkDAO;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.fdl.idgnr.impl.Base64;









import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

@Controller
public class MainController {
	
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;

    @Resource(name = "personDAO")
    private PersonDAO personDAO;   
    
    @Resource(name = "workDAO")
    private WorkDAO workDAO;
    
    @Resource(name = "workService")
    private WorkService workService;    
    
    @Resource(name = "selfImprovementDAO")
    private SelfImprovementDAO selfDAO;  
    
	@Resource(name="CmmUseService")
	private CmmUseService cmm;
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@Resource(name = "loginService2")
	private LoginService loginService;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@Resource(name = "formService")
	private FormDocService formService;
	
	@Resource(name="alarmService")
	private AlarmService alarmService;

	@Resource(name="cardService")
	private CardService cardService; 
	
	@Resource(name = "workMemoService")
    private WorkMemoService workMemoService;    
	
	/** log */
    protected static final Log LOG = LogFactory.getLog(MainController.class);

    
    
	/**
	 * Main 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return Main Page
	 * @exception Exception
	 */
	@RequestMapping(value="/index.do")
	public String index(ModelMap model,
			HttpSession session,
			HttpServletRequest request) throws Exception{
	try{
		String targetUrl = "basic/MainLogin";

		if(session.getAttribute("userLoginInfo")!=null){
			LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
			LOG.info(loginUser.getId());
			model.addAttribute("cmmCdMainMenuList", cmm.CommonCdList(loginUser.ccdMainMenu,loginUser.getId()));
			
			model.addAttribute("reqNoReadCnt", cmm.selectSystemReqNoReadCnt(loginUser.getSabun()));
			
			int permission = Integer.parseInt(loginUser.getPermission());
			if( permission == -2000 ) // 외부 1, 당분간 적용되지 않게 -2000 으로 적용
				targetUrl = "basic/MainSis";				
			else
				targetUrl = "basic/Main";
		}

    	return targetUrl;
	}catch(Exception e){
		e.printStackTrace();
		throw e;
	}
    }
	
	
	/**
	 * Main - Left
	 * @param
	 * @return Left Page
	 * @exception Exception
	 */
	@RequestMapping(value="/basic/selectLeft.do")
	public String selectWork(
            ModelMap model) throws Exception{
		
    	return "basic/Left";
    }
	


	/**
	 * 
	 * @MethodName : loginProcess
	 * @param loginVO
	 * @param session
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/loginProcess.do")
	public void loginProcess(LoginVO loginVO,
								StaffVO staffVO,
								HttpSession session,
								HttpServletRequest request,
								HttpServletResponse response,
								ModelMap model,
								@RequestParam Map<String,Object> map) throws Exception {
	
		try { 
			LoginVO loginUser =  new LoginVO();
			List<StaffVO> result = null;
			int cntId = 0;
			int cntIdPass = 0;
			
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
	
			try{
				result = personDAO.checkStaff(staffVO);
				
				LOG.debug(loginUser.getId()+"^_^personDAO.checkStaff");
				cntId = personDAO.selectCheckIdCnt(staffVO);
				LOG.debug(loginUser.getId()+"^_^personDAO.selectCheckIdCnt");
				cntIdPass = personDAO.checkStaffCnt(staffVO);
				LOG.debug(loginUser.getId()+"^_^personDAO.checkStaffCnt");
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
			model.addAttribute("idCnt", cntId);
			model.addAttribute("passCnt", cntIdPass);
			
			
			if(cntIdPass==0) {
				LOG.error("login error: " + staffVO.getUsrId());
				return;
			}
			
	        loginUser.setId(result.get(0).getUsrId());
	        loginUser.setName(result.get(0).getUsrNm());
	        loginUser.setIp(staffVO.getIp());
	        loginUser.setPermission(result.get(0).getPermission());
	        loginUser.setSabun(result.get(0).getSabun());	//세션에 사번 추가 20150706
	        loginUser.setStaffSnb(result.get(0).getStaffSnb());	//세션에 staffId(s_nb) 추가 20160307
	        loginUser.setCusId(result.get(0).getCusId());		//세션에 cus_id 추가 20160307
	        loginUser.setAnalMaster(result.get(0).getAnalMaster());		//세션에 analMaster 추가 20160502		분석의견 등록 특수 권한자 'Y'  (오늘 아닌 다른날도 등록 가능자..공통코드'00023')
	        loginUser.setInfoLevel(result.get(0).getInfoLevel());		//정보공개등급
	        loginUser.setMnaLevel(result.get(0).getMnaLevel());			//정보공개등급(M&A)
	        loginUser.setPhn1(result.get(0).getPhn1());					//휴대폰
	        loginUser.setReviewLevel(result.get(0).getReviewLevel());	//투심레벨
	        loginUser.setEmail(result.get(0).getEmail());				//email
	        loginUser.setDeptNm(result.get(0).getDeptNm()); 			//부서 추가 20160617 
	        loginUser.setDeptId(result.get(0).getDeptId()); 			//부서 id 추가 20160805
	        loginUser.setDeptMngr(result.get(0).getDeptMngr()); 		//부서장 사번 추가 20160805
	        
	        loginUser.setDivision(result.get(0).getDivision());         //division 코드 추가 20160705
	        loginUser.setHqId(result.get(0).getHqId());					//회사 hq_id 추가 20170905
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
	        
	        
	        Map obj = new HashMap();
	        obj.put("sabun", loginUser.getSabun());
	        
	        
	        if("sideLogin".equals(staffVO.getFlag())){		//인사이드 > IBsystem 버튼으로 로긴&팝업
	        	
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("/index.do");
	        	dispatcher.forward(request, response);
	        	
	        }else{		//기본로긴
	        
	        	AjaxResponse.responseAjaxObject(response, obj);		//"SUCCESS" 전달
	        }
	        
	        
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
    /**
     * 로그아웃
     * @MethodName : logout
     * @param session
     * @return
     */
    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
        session.setAttribute("userLoginInfo", null);
        return "basic/Content";
    }
    
	/**
	 * Main - Content
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return Content Page
	 * @exception Exception
	 */
	@RequestMapping(value="/basic/selectContent.do")
	public String selectContent(ModelMap model){
//		System.out.println("===========selectContent==============");
		return "basic/Content";
	}
	
	
	/**
	 * 메인 화면
	 * @MethodName : selectMainLogo
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/basic/mainLogo.do")
	public String selectMainLogo(ModelMap model, HttpSession session) throws Exception{
	
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		WorkVO wVO = new WorkVO();
		WorkVO w1VO = new WorkVO();
		WorkVO w3VO = new WorkVO();
		PersonVO pVO = new PersonVO();
		SelfImprovementVO w2VO = new SelfImprovementVO();
		
		wVO.setName(loginUser.getName());
		wVO.setRgId(loginUser.getId());
		w1VO.setRgId(loginUser.getId());
		w2VO.setTmpId(loginUser.getId());
		w2VO.setRgId(loginUser.getId());
		w3VO.setRgId(loginUser.getId());
		pVO.setRgId(loginUser.getId());
		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMMdd").format( cal.getTime() );
			String year = date.substring(0,4)
					,mon = date.substring(4,6)
					,day = date.substring(6,8);
			int monInt = Integer.parseInt(mon);
			String monS = Integer.toString(monInt>2?monInt-1:(12-(2-monInt)) );		//monInt-2 >> monInt-1	2016-04-26
			monS = monS.length()<2?"0"+monS:monS;

			//wVO.setSelectInfo("main");
			model.addAttribute("memoList", workDAO.selectComment(wVO));						//업무보고
			//wVO.setMajor("Y");
			//model.addAttribute("majorMemoList",workDAO.selectComment(wVO));
			w1VO.setChoice_monthS(monS);
			w1VO.setChoice_dayS( "01" );
			w1VO.setChoice_year(year);
			w1VO.setChoice_month(mon);
			w1VO.setChoice_day(day);
			if(Integer.parseInt(mon)<3)
				w1VO.setChoice_yearS(Integer.toString(Integer.parseInt(year)-1));
			else w1VO.setChoice_yearS(year);
			w1VO.setSelectInfo("main");
			model.addAttribute("replyList",workDAO.selectOpinion(w1VO));					//코멘트
			
			if(Integer.parseInt(loginUser.getPermission())>0){
				//List<SelfImprovementVO> resultReader = selfDAO.selectReaderListMain(w2VO);
				//model.addAttribute("readerList",resultReader);
				
								
				//List<SelfImprovementVO> resultIdea = selfDAO.selectIdeaCheckList(w2VO);
				//model.addAttribute("IdeaCheckList",resultIdea);
				
				pVO.setSelectInfo("main");
				pVO.setChoice_monthS(monS);
				pVO.setChoice_dayS( "01" );
				pVO.setChoice_year(year);
				pVO.setChoice_month(mon);
				pVO.setChoice_day(day);
				if(Integer.parseInt(mon)<3)
					pVO.setChoice_yearS(Integer.toString(Integer.parseInt(year)-1));
				else pVO.setChoice_yearS(year);
				List<PersonVO> netList = personDAO.selectNetPointLatest(pVO);
				model.addAttribute("netList", netList);										//네트워크 / 경력
				
				model.addAttribute("keyPointList",workDAO.selectofferKeyPoint(w1VO));		//정보정리 > 핵심체크
			}
			
			
			w3VO.setChoice_monthS(monS);
			w3VO.setChoice_dayS( "01" );
			w3VO.setChoice_year(year);
			w3VO.setChoice_month(mon);
			w3VO.setChoice_day(day);
			if(Integer.parseInt(mon)<3)
				w3VO.setChoice_yearS(Integer.toString(Integer.parseInt(year)-1));
			else w3VO.setChoice_yearS(year);
			
			
			//--- 정보정리 
			
			w3VO.setSelectInfo("main1");
			List<WorkVO> result0 = workDAO.selectMainOfferList(w3VO);			
			model.addAttribute("offerList",result0);
			
			//-- CB / EB
			
			w3VO.setSelectInfo("main2");
			List<WorkVO> result1 = workDAO.selectMainOfferList(w3VO);
			model.addAttribute("offerList2",result1);
			
			
			//--프리IPO / 벤처
			
			w3VO.setSelectInfo("main4");
			List<WorkVO> result3 = workDAO.selectMainOfferList(w3VO);
			model.addAttribute("offerList4",result3);
			
			//--------------- 자회사 메인 화면에서 딜 부분 :S ---------------
			if(!"SYNERGY".equals(loginUser.getDivision())){
				w3VO.setSelectInfo("mainAll");
				List<WorkVO> resultA = workDAO.selectMainOfferList(w3VO);
				model.addAttribute("offerListAll",resultA);
			}
			//--------------- 자회사 메인 화면에서 딜 부분 :E ---------------
			
			
			//---------------------------- FIDES 메인화면 내 일정정보 :S ------------------------------
			/*ib.schedule.service.LoginVO loginVO = (ib.schedule.service.LoginVO)session.getAttribute("loginVO");
			
			model.addAttribute("ConfirmIngList", boardService.GetConfirmIngList(loginVO));			// 로그인자에게 온 결재 및 요청문서
			
			model.addAttribute("TodayScheduleList", loginService.GetTodayScheduleList(loginVO));	// 오늘 일정(사용자일정)
			model.addAttribute("HoliPerList", loginService.GetHoliPerList());						// 오늘 부재중 사원			
			 */
			//---------------------------- FIDES 메인화면 내 일정정보 :E ------------------------------
			
			
			//---------------------------- 알림 팝업 정보 확인 ----------------------------------------
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("staffSnb", loginUser.getStaffSnb());				//user id
			Map popupUserInfo = alarmService.selectPopUser(map);		//팝업 해당자 이면 있고 아니면 null
			
			//알립팝업 조건에 해당하는 사용자에게 팝업 보임
			if(popupUserInfo != null){
				String alarmIds = (String) popupUserInfo.get("alarmIds");
				String[] idsArray = alarmIds.split(",");
				List<String> popupInfoList = Arrays.asList(idsArray);
				model.addAttribute("popupInfoList", popupInfoList);
				model.addAttribute("popupShow","Y");
			}else{
				model.addAttribute("popupshow", "N");
			}
			//---------------------------- 알림 팝업 정보 확인 ----------------------------------------
			
			
			//---------------------------- 법인카드 사용내역 정보 ----------------------------------------
			
			//user id
			map.put("usrId", loginUser.getId());
			map.put("statusFlag", "N");
			map.put("usrIdArrCount", "1");			
			String [] usrArr = loginUser.getId().split(",");
			map.put("usrIdArr", usrArr);
			
			model.addAttribute("cardCorpUsedCount",
					cardService.selectCardCorpUsedList(map).get("resultVal").toString()); 
			
			//---------------------------- 법인카드 사용내역 정보 ----------------------------------------
			
			
			
			/////////////////////////////////////// 메인화면 딜 전체 :S ////////////////////////////////////
			WorkVO workVO = new WorkVO();
			
			List<ComCodeVO> cmvo = cmm.CommonCdList(workVO.ccdTabCd, loginUser.getId());
			//전체 탭을 위해 추가 ---
			ComCodeVO allv = new ComCodeVO();
			allv.setdTailCd("00000");		//전체
			allv.setCdNm("전체");			//전체
			cmvo.add(0, allv);
			model.addAttribute("cmmCdAllDealTabList", cmvo);		//탭 리스트
						
			
			workVO.setRgId(loginUser.getId());			
			workVO.setSorting("00001");		//메자닌_상장		... 기본 선택되는 탭	
			//workVO.setSorting("00000");		//전체 탭	... 기본 선택되는 탭	
			model.addAttribute("ttT", workVO.getTotal());
			model.addAttribute("searchName", "");
			model.addAttribute("selectUser", workVO.getSelectUser());

			//기본 선택되는 탭			
			model.addAttribute("TAB", workVO.getSorting());
			
			
			//메자닌 비상장도 볼 권한이 없는 사람은 기본화면이 프리IPO로 열리도록
			if("N".equals(loginUser.getMezzN())){
				workVO.setSorting("00012");				//프리IPO
				model.addAttribute("TAB", "00005");		//프리IPO
			}
			
			
			model.addAttribute("cmmCdMnaPgCdList", cmm.CommonCdList("00016"));		//전체 탭에서 M&A 진행사항 표기 위해 추가
			
			if(workVO.getChoice_year().equals("")){
				cal.setTime( new Date(System.currentTimeMillis()) );
				String date1 = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
				workVO.setChoice_year(date1.substring(0, 4));
			}
			model.addAttribute("choice_year", workVO.getChoice_year());

			workVO.setChoice_yearS( Integer.toString( Integer.parseInt(workVO.getChoice_year())-1) );
			workVO.setChoice_monthS("01");
			workVO.setChoice_month("12");
			if("statsPrivateList".equals(workVO.getTmpNum2()) ) workVO.setTmpNum2("");

			workVO.setToMain("Y");			//메인화면에서 보여지는 데이터 유형으로...날짜로 갯수제한
			
			model.addAttribute("offerList5", workDAO.selectOfferAllDealList(workVO));		//리스트 조회
			/////////////////////////////////////// 메인화면 딜 전체 :E ////////////////////////////////////
			
			
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		String targetUrl = "";
		int permission = Integer.parseInt(loginUser.getPermission());
		
		if( permission == -2000 ) // 외부 직원 권한 : 1 , 임시로 -2000 설정
			targetUrl = "basic/MainSisLogo";				
		else
			targetUrl = "basic/MainLogo";

		//자회사(FIDES 등) 메인화면
		if(!"SYNERGY".equals(loginUser.getDivision())){
			targetUrl = "basic/MainLogoFamily";
		}
		
		return targetUrl;
	}
	
	
	/**
	 * 딜 (small) - 메인 화면
	 * @MethodName : selectMainLogo
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	/*@RequestMapping(value="/basic/allDealMain.do")
	public String allDealMain(ModelMap model, HttpSession session) throws Exception{
	
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{			
			Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			
			
			/////////////////////////////////////// 메인화면 딜 전체 :S ////////////////////////////////////
			WorkVO workVO = new WorkVO();
			
			List<ComCodeVO> cmvo = cmm.CommonCdList(workVO.ccdTabCd, loginUser.getId());
			//전체 탭을 위해 추가 ---
			ComCodeVO allv = new ComCodeVO();
			allv.setdTailCd("00000");		//전체
			allv.setCdNm("전체");			//전체
			cmvo.add(0, allv);
			model.addAttribute("cmmCdTabList", cmvo);		//탭 리스트
						
			
			workVO.setRgId(loginUser.getId());			
			workVO.setSorting("00000");		//전체 탭
			model.addAttribute("ttT", workVO.getTotal());
			model.addAttribute("searchName", "");
			model.addAttribute("selectUser", workVO.getSelectUser());

			//전체 검색시에는 선택되는 탭이 없으므로 0으로 세팅.
			model.addAttribute("TAB", "0");
					
			model.addAttribute("cmmCdMnaPgCdList", cmm.CommonCdList("00016"));		//전체 탭에서 M&A 진행사항 표기 위해 추가
			
			if(workVO.getChoice_year().equals("")){
				cal.setTime( new Date(System.currentTimeMillis()) );
				String date1 = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
				workVO.setChoice_year(date1.substring(0, 4));
			}
			model.addAttribute("choice_year", workVO.getChoice_year());

			workVO.setChoice_yearS( Integer.toString( Integer.parseInt(workVO.getChoice_year())-1) );
			workVO.setChoice_monthS("01");
			workVO.setChoice_month("12");
			if("statsPrivateList".equals(workVO.getTmpNum2()) ) workVO.setTmpNum2("");

			workVO.setToMain("Y");			//메인화면에서 보여지는 데이터 유형으로...날짜로 갯수제한
			
			model.addAttribute("offerList5", workDAO.selectOfferAllDealList(workVO));		//리스트 조회
			/////////////////////////////////////// 메인화면 딜 전체 :E ////////////////////////////////////
			
			
		} catch (Exception e) {
			LOG.error("메인화면 딜 에러", e);
			e.printStackTrace();
		}
		
		return "basic/include/allDealMain_INC";
	}*/
	
	
	/**
	 * 메모 하나 선택
	 * @MethodName : privateMemo
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/main/privateMemo.do")
	public String privateMemo(ModelMap model
			,WorkVO wvo
			,HttpSession session) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			//참조인
			model.addAttribute("cmntStaffNm",workDAO.selectSameCommentStaffName(wvo));		//기존
			List<WorkVO> list = workDAO.selectSameCommentStaffNameEach(wvo);				//개별
			List<WorkVO> memberList = new ArrayList<WorkVO>();
			//String[] nameList = null;
			if(list.size()>0){	//참조인 존재
				//nameList = list.get(0).getCmntStaffs().split(",");
				for(int i=0; i<list.size(); i++){
					WorkVO member = new WorkVO();
					member.setMainSnb(list.get(i).getMainSnb());		//업무보고 mainSnb
					member.setName(list.get(i).getName());						//참조인명
					member.setsNb(list.get(i).getsNb());				//업무보고 sNb
					memberList.add(member);
				}
			}
			model.addAttribute("cmntStaffNmList", memberList);
			
			//업무보고(메모)
			model.addAttribute("memoList", workDAO.selectMemoList(wvo));
			
			/*if(wvo.getMainSnb().length()>0){
				//wvo.setRepSnb(wvo.getsNb());
				wvo.setsNb(wvo.getMainSnb());
			}*/
			//답글
			model.addAttribute("replyList", workDAO.selectReplyList(wvo));
			
			
			//로긴 사용자를 제외한 SMS 발송 대상
			wvo.setRgNm(loginUser.getName());
			//if(!wvo.getsNb().equals(wvo.getMainSnb())){		//mainSnb 가 없을때(내가최초로 쓴글)
			if("0".equals(wvo.getMainSnb().toString())){
				wvo.setMainSnb(wvo.getsNb());
			}
			model.addAttribute("staffNmForSms",workDAO.selectSameCommentStaffNameForSms(wvo));
			
			model.addAttribute("cdMemoTypeList", cmm.CommonCdList("00026", loginUser.getId()));		//메모유형 공통코드
			
			//넘어온 값 넘기기
			model.addAttribute("oriSNb", wvo.getsNb());		//넘어온 sNb 화면으로 그대로 전달
			model.addAttribute("oriMainSnb", wvo.getMainSnb());	//넘어온 mainSnb 화면으로 그대로 전달
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "ajaxPopDiv/ajaxMemo";
	}

	
	/**
	 * 직원에게 바로 메모보내기
	 * @MethodName : sendNewMemo
	 * @param model
	 * @param wvo
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/main/sendNewMemo.do")
	public String sendNewMemo(ModelMap model
			,WorkVO wvo
			,HttpSession session) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		return "ajaxPopDiv/MainNewMemo";
	
	}
	
	/**
	 * 메인화면 읽은 데이터 확인
	 * db에 insert되면 읽은 것으로 db에 없으면 안읽은 것으로..
	 * @MethodName : checkMainTable
	 * @param model
	 * @param wvo
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/main/checkMainTable.do")
	public String checkMainTable(ModelMap model
			,WorkVO wvo
			,HttpSession session) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			int cnt = workDAO.insertMainTableCheck(wvo);
			model.addAttribute("save",cnt);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "basic/Content";
		
	}
	
	

	/**
	 *
	 * @MethodName : selectMainLogo2
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login/mainLogo.do")
	public String selectMainLogo2(ModelMap model){
		return "basic/MainLogo";
	}
	/**
	 * 임직원 정보 수정 페이지
	 * @MethodName : viewModifyUsrInfo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login/modifyUsrInfo.do")
	public String viewModifyUsrInfo(ModelMap model
			,StaffVO staffVO
			,HttpSession session){
		
		List<StaffVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		staffVO.setUsrId(loginUser.getId());
		
		try{
			result = personDAO.selectStaff(staffVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		try {
			String decMsg = Util.decrypt(result.get(0).getEmailPasswd(), "thebestsecretkey");
			result.get(0).setEmailPasswd(
					decMsg);
			
			System.out.println("## Dec Msg : "  +decMsg);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		map.put("resultList", result);		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("PerSabun", loginUser.getSabun());
		return "login/ModifyUsrInfo";
	}	
	
	
	/**
	 * id 중복체크
	 * @MethodName : checkUsrId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login/checkUsrId.do")
	public String checkUsrId(StaffVO staffVO
			,ModelMap model){
		
		int cnt = 0;
		try{
			cnt = personDAO.selectCheckIdCnt(staffVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		if(cnt!=0) return "login/CheckId";

		return "login/ModifyUsrInfo";
	}
	/**
	 * 임직원 정보 수정 적용
	 * @MethodName : updateModifyUsrInfo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login/updateUsrInfo.do")
	public String updateModifyUsrInfo(ModelMap model,
			StaffVO staffVO,
			HttpSession session){
		
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
		
		System.out.println("## Email ID : " + staffVO.getEmailId());
		System.out.println("## Email Passwd : " + staffVO.getEmailPasswd());
		
		// 이메일 자동로그인 비밀번호 설정
		try {
			staffVO.setEmailPasswd(Util.encrypt(staffVO.getEmailPasswd(), "thebestsecretkey"));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		int cnt = 0;
		try{
			cnt = personDAO.updateStaffInfo(staffVO);
			LOG.debug(staffVO.getRgId()+"^_^personDAO.updateStaffInfo");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		String targetUrl = "";
		int permission = Integer.parseInt(loginUser.getPermission());
		if( permission == -2000 )
			targetUrl = "basic/MainSisLogo";				
		else
			targetUrl = "basic/MainLogo";

		System.out.println("## Target2 : " + targetUrl);
		
		return "basic/Main";
	}

	/**
	 * ajax: inside 시스템 쪽으로 통합로그인 하기위한 정보 가지고 오기 
	 * @MethodName : jumpInsideSystem
	 * @param model
	 * @param stVo
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/basic/InsideSysInfo.do")
	public String jumpInsideSystem(ModelMap model
			,StaffVO stVo
			,HttpSession session
			,FileUpDbVO vo) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		List<StaffVO> result = null;
		System.out.println("\n\naldkjfla;kjsdf;lkajsd;lfkja;lkdsfj\n\n");
		try{
			result = workDAO.selectInsideSystemInfo(stVo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("pw", result.get(0).getUsrPw());
		return "basic/insideSysInfo";
	}
	
	/**
	 * html5 다중멀티파일 업로드
	 * @MethodName : uploadFiles
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/basic/filesUpload.do")
	public String uploadFiles( 
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		String rtn = "";
		try{
			// 정보 받기
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultiFileUpload mUpload = new MultiFileUpload();
			FileUpDbVO fileVo = new FileUpDbVO();
			
			rtn = (String) multipartRequest.getParameter("rtn");
			fileVo.setOfferSnb( (String) multipartRequest.getParameter("offerSnb"));
			fileVo.setFileCategory( (String) multipartRequest.getParameter("categoryCd"));
			fileVo.setReportYN("N");
			fileVo.setRgId(loginUser.getId());
			
			// 파일업로드 시키기
			mUpload.fileUpload(multipartRequest, fileVo, request, workDAO);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "redirect:/"+rtn+".do";
	}
	/**
	 * 업무일지 메모에서 파일첨부 시
	 * @MethodName : uploadFiles4memo
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/basic/filesUpload4memo.do")
	public String uploadFiles4memo( 
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		String rtn = "";
		try{
			// 정보 받기
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultiFileUpload mUpload = new MultiFileUpload();
			FileUpDbVO fileVo = new FileUpDbVO();
			
			rtn = (String) multipartRequest.getParameter("rtn");
			String offersnb = "";
			String filecate = (String) multipartRequest.getParameter("categoryCd");
			fileVo.setFileCategory( filecate );
			fileVo.setReportYN("N");
			fileVo.setRgId(loginUser.getId());
			
			WorkVO vo = new WorkVO();
			vo.setRgId(loginUser.getId());
			// 4:메모에 첨부파일, 5:댓글에 첨부파일
			if( "00004".equals(filecate) ) offersnb = workDAO.selectMemo4insertFile(vo);
			else if( "00005".equals(filecate) ) offersnb = workDAO.selectReply4insertFile(vo);
			fileVo.setOfferSnb( offersnb );
			
			// 파일업로드 시키기
			mUpload.fileUpload(multipartRequest, fileVo, request, workDAO);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "redirect:/"+rtn+".do";
	}
	
	
	/**
	 * Main - Content
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return Content Page
	 * @exception Exception
	 */
	@RequestMapping(value="/basic/mailIndex.do")
	public String mailIndex(
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model){

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		String emailId = loginUser.getEmailId();
		String emailPasswd = loginUser.getEmailPasswd();
		
		// 비밀번호 복호화
		String decKey = "thebestsecretkey";
		
		try {
			emailPasswd = Util.decrypt(emailPasswd, decKey);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		String locationUrl = "";
		
		try{
			String url = "https://ma191.mailplug.co.kr/lw_api/auth_sso";
	
			// 자동로그인 시도
			URL urlObj = new URL(url);
	
			HttpURLConnection conn = (HttpURLConnection)urlObj.openConnection();
	
			conn.setRequestProperty("Content-Type",  "application/x-www-form-urlencoded");
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);
			conn.setDefaultUseCaches(false);
			
			String urlParameters = "cid=" + emailId + "&cpw=" + emailPasswd;
			urlParameters += "&pw_type=1&host_domain=synergynet.co.kr&cdomain=mail.synergynet.co.kr";
			
			OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
	
		    wr.write(urlParameters);
		    wr.flush();
		    wr.close();
		    
		    locationUrl = conn.getHeaderField("Location");
		    System.out.println("## Location : " + locationUrl);
		    
		    
		}
		catch(Exception ex){
			System.out.println("## LocalizedMessage : " + ex.getLocalizedMessage());
			System.out.println("## Message : " + ex.getMessage());
			System.out.println("## Cause : " + ex.getCause());
			locationUrl = "http://mail.synergynet.co.kr";
		}
		
		model.addAttribute("locationUrl", locationUrl);		
		
		return "mail/mailView";
	}
	
	
	
}