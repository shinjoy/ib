package ib.schedule.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import egovframework.rte.fdl.property.EgovPropertyService;
import ib.meetingRoom.service.MeetingRoomService;
import ib.push.service.PushService;
import ib.push.service.PushVO;
import ib.schedule.service.SpCmmVO;
import ib.schedule.service.Utill;
import ib.schedule.service.LoginVO;
import ib.schedule.service.CusService;
import ib.schedule.service.CusVO;
import ib.schedule.service.FormDocService;
import ib.schedule.service.PersonMgmtService;
import ib.schedule.service.ScheduleService;
import ib.schedule.service.impl.PersonDAO;
import ib.schedule.service.impl.ScheduleVO;
import ib.cmm.service.CommonService;
import ib.cmm.util.fcc.service.StringUtil;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.google.service.GoogleCalendarService;

@Controller
public class ScheduleController {
	
	@Resource(name = "cusService")
	private CusService cusService;
	
	@Resource(name = "scheService")
	private ScheduleService scheService;
	
	@Resource(name = "formService")
	private FormDocService formService;
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@Resource(name = "personDAO2")
    private PersonDAO personDAO;   
	
	@Resource(name = "personMgmtService2")
    private PersonMgmtService personMgmtService;
	
	@Resource(name = "meetingRoomService")
    private MeetingRoomService meetingRoomService;	

	@Resource(name = "commonService")
	private CommonService commonService;
	
	// 구글캘린더 서비스
	@Resource(name = "googleCalendarService")
	private GoogleCalendarService googleCalendarService;

	@Resource(name = "pushService")
	private PushService pushService;
	
	
	
	protected static final Log LOG = LogFactory.getLog(ScheduleController.class);
	
	//왼쪽메뉴
	@RequestMapping(value="/schedule/selectLeft.do")
	public String inSideLeft( 
			HttpSession session,
			@RequestParam Map<String,Object>map,
			ModelMap model) throws Exception{
		model.addAttribute("type", map.get("type"));
		return "schedule/left";
	}

	
	// 달력 생성(프로시저 실행하는거땜시 잠시 보류)
	@RequestMapping(value = "/MakeCalendar.do")
	public String MakeCalendar() throws Exception {
		scheService.MakeCalendar();
		return "forward:/ScheduleCal.do";
	}
	
	// 일정관리를 위한 전년,전월,후년,후월 구하기
	@RequestMapping(value = "/GetCalData.do")
	public SpCmmVO GetCalData(SpCmmVO spCmmVO) throws Exception {
		Calendar calendar = Calendar.getInstance();

		spCmmVO.setNowYear(calendar.get(Calendar.YEAR));
		spCmmVO.setNowMonth(calendar.get(Calendar.MONTH) + 1);
		spCmmVO.setNowDay(calendar.get(Calendar.DAY_OF_MONTH));
			
		// 선택한 일자 대입
		if(!spCmmVO.getSelDate().equals("")) {
			spCmmVO.setSelYear(Integer.parseInt(spCmmVO.getSelDate().split("-")[0]));
			spCmmVO.setSelMonth(Integer.parseInt(spCmmVO.getSelDate().split("-")[1]));
			spCmmVO.setSelDay(Integer.parseInt(spCmmVO.getSelDate().split("-")[2]));
		}

		// 오늘날짜 대입
		if(spCmmVO.getSelYear() == 0) spCmmVO.setSelYear(spCmmVO.getNowYear());
		if(spCmmVO.getSelMonth() == 0) spCmmVO.setSelMonth(spCmmVO.getNowMonth());
		if(spCmmVO.getSelDay() == 0) spCmmVO.setSelDay(spCmmVO.getNowDay());

		// 전월 이동을 구하기
		spCmmVO.setPreYear(spCmmVO.getSelYear());
		spCmmVO.setPreMonth(spCmmVO.getSelMonth() - 1);
		if(spCmmVO.getPreMonth() < 1) {
			spCmmVO.setPreYear(spCmmVO.getSelYear() - 1);
			spCmmVO.setPreMonth(12);
		}

		// 다음달 이동 구하기
		spCmmVO.setNextYear(spCmmVO.getSelYear());
		spCmmVO.setNextMonth(spCmmVO.getSelMonth() + 1);
		if(spCmmVO.getNextMonth() > 12) {
			spCmmVO.setNextYear(spCmmVO.getSelYear() + 1);
			spCmmVO.setNextMonth(1);
		}

		calendar.set(spCmmVO.getSelYear(), spCmmVO.getSelMonth() - 1, 1);
		spCmmVO.setEndDay(calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		spCmmVO.setStartPosition(calendar.get(Calendar.DAY_OF_WEEK));
		
		// 마지막날 위치 구하기
		int EndPostion = (spCmmVO.getEndDay() - (7 - (spCmmVO.getStartPosition() - 1))) % 7;
		if(EndPostion == 0) spCmmVO.setEndPosition(7);
		else spCmmVO.setEndPosition(EndPostion);
		return spCmmVO;
	}
	
	// 일정 알람리스트 불러오기(문자 알람)
	@SuppressWarnings("unused")
	@RequestMapping(value = "/ScheduleSMSList.do")
	public String ScheduleSMSList(HttpServletRequest req, ScheduleVO vo, ModelMap model) throws Exception {
		model.addAttribute("AlarmList", scheService.GetScheduleSMSList(vo));
		model.addAttribute("vo", vo);
		model.addAttribute("SMSSeq", cusService.GetSMSSeq());
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		return "schedule/ScheduleSMSList";
	}
	
	// 일정 알람 문자 전송 완료
	@RequestMapping(value = "/ScheduleSMSSendEnd.do")
	public void SMSSendEnd(HttpServletRequest req, CusVO vo, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
		beanValidator.validate(vo, bindingResult);
		
		int SendCnt = Integer.parseInt(req.getParameter("SendCnt")) + 1;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		for(int oOo = 1; oOo < SendCnt; oOo++) {
			Map<String, Object> paramTemp = new HashMap<String, Object>();
			paramTemp.put("SMSTitle", req.getParameter("SMSTitle"));
			paramTemp.put("SMSType", req.getParameter("SMSType"));
			paramTemp.put("SMSToNum", req.getParameter("ReceiveNum" + oOo));
			paramTemp.put("SMSFromNum", "02-586-5981");
			paramTemp.put("SMSContent", req.getParameter("SMSContent" + oOo));
			paramTemp.put("SMSReserTime", req.getParameter("SMSReserTime"));
			paramTemp.put("SMSFlag", req.getParameter("SMSFlag"));
			list.add(paramTemp);
		}
		if(list.size() > 0) cusService.SMSSendEnd(list);
		status.setComplete();
	}
	
	
	// 참가자 쿼리 생성
	@RequestMapping(value = "/EntryQuerySet.do")
	public String EntryQuerySet(LoginVO loginVO, ScheduleVO vo) throws Exception {
		String query = "", perSabun = "";
		if(vo.getSearchPerSabun().equals(",")) vo.setSearchPerSabun("");
		if(vo.getSearchPerSabun().split(" ").length != 1) {
			query += "(";
			String[] sabunList = vo.getSearchPerSabun().split(" ");
			for(int i = 0; i < sabunList.length; i++) {	/** 타인일정 잡아주고서 타인에게만 보여주기위해 수정 **/
				perSabun = sabunList[i];
				if(i>0) query += " OR ";
				query += "((SchePublicFlag = 'N' AND RegPerSabun = '"+perSabun+"') OR Entry LIKE ('%"+perSabun+"%'))";
			}
			query += ")";
		}
		else if(!vo.getSearchPerSabun().equals("")) query += "((SchePublicFlag = 'N' AND RegPerSabun = '"+vo.getSearchPerSabun()+"') OR Entry LIKE ('%"+vo.getSearchPerSabun()+"%'))";
		else query += "RegPerSabun = '"+vo.getSearchPerSabun()+"'";
		return query;
	}
	
	// 일정 알람리스트
	@RequestMapping(value = "/ScheduleAlarmList.do")
	public String ScheduleAlarmList(@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, HttpServletRequest req, ScheduleVO vo, ModelMap model) throws Exception {
		LoginVO loginVO = (LoginVO) req.getSession().getAttribute("loginVO");
		vo.setPerSabun(loginVO.getRegPerSabun());
		
		if(vo.getScheType().equals("") || vo.getEventType().equals("Add")) vo.setScheType("AllType");
		model.addAttribute("AlarmList", scheService.GetScheduleAlarmList(vo));
		model.addAttribute("vo", vo);
		return "schedule/ScheduleAlarmList";
	}
	
	// More리스트 보기
	@RequestMapping(value = "/ScheduleMoreList.do")
	public String ScheduleMoreList(@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, HttpServletRequest req, ScheduleVO vo, ModelMap model) throws Exception {
		LoginVO loginVO = (LoginVO) req.getSession().getAttribute("loginVO");
		vo.setPerSabun(loginVO.getRegPerSabun());
		
		if(vo.getScheType().equals("") || vo.getEventType().equals("Add")) vo.setScheType("AllType");
		vo.setScheSYear(Integer.toString(spCmmVO.getSelYear()));
		vo.setScheSMonth(Integer.toString(spCmmVO.getSelMonth()));
		
		vo.setSearchQuery(EntryQuerySet(loginVO, vo));
		if(vo.getSearchPerSabun().equals(loginVO.getPerSabun())) vo.setScheGubun("Alone");
		else vo.setScheGubun("All");
		if(vo.getScheGubun().equals("All") && vo.getSearchPerSabun().split(" ").length == 1) vo.setPerSabun(vo.getSearchPerSabun());
		else vo.setPerSabun(loginVO.getRegPerSabun());
			
		model.addAttribute("AlarmList", scheService.GetScheduleList(vo));
		model.addAttribute("vo", vo);
		return "schedule/ScheduleMoreList";
	}
	
	// 일정 달력보기
	@RequestMapping(value = "/ScheduleCal.do")
	public String Schedule(@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, HttpServletRequest req, ScheduleVO vo, Model model, HttpSession session) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		ib.cmm.LoginVO loginUser = (ib.cmm.LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
	
		if("".equals(vo.getSearchPerSabun())){
			vo.setSearchPerSabun(loginUser.getSabun());
		}
		
		//---------- 일정검색대상 사용자 사번 리스트 :S ------------
		String query = "";
		String[] sabunList = vo.getSearchPerSabun().split(" ");
		for(int i = 0; i < sabunList.length; i++) {			
			if(i>0) query += ",";
			query += "'" + sabunList[i] + "'";
		}
		vo.setSearchSabunList(query);
		//---------- 일정검색대상 사용자 사번 리스트 :E ------------
				

		//------- inside origin start
		spCmmVO = GetCalData(spCmmVO);
		model.addAttribute("dateVO", spCmmVO);
		model.addAttribute("NextMonthEnd", 7 - spCmmVO.getEndPosition() + 7);
		
		LoginVO loginVO = (LoginVO) req.getSession().getAttribute("loginVO");
		vo.setSearchQuery(EntryQuerySet(loginVO, vo));
		if(vo.getSearchPerSabun().equals(loginVO.getPerSabun())) vo.setScheGubun("Alone");
		else vo.setScheGubun("All");
		
		if(vo.getScheGubun().equals("All") && vo.getSearchPerSabun().split(" ").length == 1) vo.setPerSabun(vo.getSearchPerSabun());
		else vo.setPerSabun(loginVO.getRegPerSabun());
		
		vo.setScheSDate("");
		vo.setScheSYear(Integer.toString(spCmmVO.getSelYear()));
		vo.setScheSMonth(Integer.toString(spCmmVO.getSelMonth()));
		if(vo.getScheType().equals("") || vo.getEventType().equals("Add") || "Y".equals(req.getParameter("regTime"))) 
			vo.setScheType("AllType");
		//System.out.println("*************************** 컨트롤러 scheService.GetScheduleList(vo): "+scheService.GetScheduleList(vo));
		model.addAttribute("ScheList", scheService.GetScheduleList(vo));  // 일정 리스트 받아오기
		
		ScheduleVO NextVO = new ScheduleVO();
		NextVO.setSearchQuery(vo.getSearchQuery());
		NextVO.setScheGubun(vo.getScheGubun());
		NextVO.setPerSabun(vo.getPerSabun());NextVO.setScheSYear(Integer.toString(spCmmVO.getSelYear()));
		NextVO.setScheSMonth(Integer.toString(spCmmVO.getSelMonth() + 1));
		NextVO.setScheType(vo.getScheType());
		NextVO.setSearchSabunList(query);
		//System.out.println("*************************** 컨트롤러 scheService.GetScheduleList(NextVO): "+scheService.GetScheduleList(NextVO));
		model.addAttribute("NextScheList", scheService.GetScheduleList(NextVO));  // 일정 리스트 받아오기
		
		vo.setCMD("ERP");
		model.addAttribute("MaxYear", scheService.GetCalNextYear());
		model.addAttribute("vo", vo);
		model.addAttribute("googlelinkflag", req.getAttribute("googlelinkflag"));
		model.addAttribute("message", spCmmVO.getInfoMessage());
		System.out.println("====="+vo.getSearchQuery()+"====");
		
		return "schedule/ScheduleCal";
	}
	
	// 일정 리스트로 보기
	@RequestMapping(value = "/ScheduleList.do")
	public String ScheduleList(@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, HttpServletRequest req, ScheduleVO vo, Model model) throws Exception {
		spCmmVO = GetCalData(spCmmVO);
		model.addAttribute("dateVO", spCmmVO);
		LoginVO loginVO = (LoginVO) req.getSession().getAttribute("loginVO");
		
		vo.setSearchQuery(EntryQuerySet(loginVO, vo));
		if(vo.getSearchPerSabun().equals(loginVO.getPerSabun())) vo.setScheGubun("Alone");
		else vo.setScheGubun("All");
		
		if(vo.getScheGubun().equals("All") && vo.getSearchPerSabun().split(" ").length == 1) vo.setPerSabun(vo.getSearchPerSabun());
		else vo.setPerSabun(loginVO.getRegPerSabun());
		
		vo.setScheSYear(Integer.toString(spCmmVO.getSelYear()));
		vo.setScheSMonth(Integer.toString(spCmmVO.getSelMonth()));
		
		if(vo.getScheType().equals("")) vo.setScheType("AllType");
		model.addAttribute("ScheList", scheService.GetScheduleList(vo));
		model.addAttribute("Calendar", scheService.GetCalendar(vo));
		
		vo.setCMD("ERP");
		model.addAttribute("MaxYear", scheService.GetCalNextYear());
		model.addAttribute("vo", vo);
		model.addAttribute("message", spCmmVO.getInfoMessage());
		
		
		return "schedule/ScheduleList";
	}
	
	
	// 선택시간 차량 사용여부 받아오기
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/CarListChk.do")
	public String CarListChk(ScheduleVO vo, HttpServletRequest req, Model model) throws Exception {
		
		LoginVO loginVO = (LoginVO) req.getSession().getAttribute("loginVO");		
		vo.setPerSabun(loginVO.getPerSabun());						//사용자 회사 사용가능 차량만 불러온다
				
		List<Map<String, Object>> datalist = scheService.GetCarList(vo);  // 선택시간 차량 리스트 조회
		JSONObject jsonObject = new JSONObject();
		JSONArray cell = new JSONArray();
		
		for(int i = 0; i < datalist.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("scheseq", datalist.get(i).get("scheseq").toString());
			obj.put("caruseflag", datalist.get(i).get("caruseflag").toString());
			obj.put("carnum", datalist.get(i).get("carnum").toString());
			obj.put("pernm", datalist.get(i).get("pernm").toString());
			obj.put("stime", datalist.get(i).get("stime").toString());
			obj.put("etime", datalist.get(i).get("etime").toString());
			obj.put("managerNm", datalist.get(i).get("managerNm").toString());
			obj.put("cpn", datalist.get(i).get("cpn").toString());
			cell.add(obj);
		}
		jsonObject.put("rows", cell);
		model.addAttribute("result", jsonObject.get("rows"));
		
		return "schedule/result";
		
	}
	
	
	// 선택일자 차량 사용 리스트
	@RequestMapping(value = "/CarUseList.do")
	public String CarUseList(@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, ScheduleVO vo, Model model) throws Exception {
		model.addAttribute("CarUseList", scheService.GetCarUseList(vo));
		model.addAttribute("vo", vo);
		return "schedule/CarUseList";
	}
	
	/**
	 * 일정 등록 페이지 
	 * 
	 * @Method Name : ScheduleProc
	 * @descripton : 
	 * @date : 2017. 9. 7.
	 * @author : synergy
	 * @param : 
	 */
	@RequestMapping(value = "/ScheduleProc.do")
	public String ScheduleProc(@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, HttpServletRequest req, ScheduleVO vo, Model model) throws Exception {
		
		LoginVO loginVO = (LoginVO) req.getSession().getAttribute("loginVO");
		
		vo.setAlone(req.getParameter("alone"));
		
		ScheduleVO scheVO = new ScheduleVO();
		if(vo.getEventType().equals("Edit")) {   	// 상세보기 -> 수정
			scheVO = scheService.GetScheInfo(vo);   // 선택 일정 정보 받아오기
			model.addAttribute("ScheduleEntryList", scheService.GetScheduleEntryList(vo));  // 선택 일정 참가자 리스트 받아오기
		} else { 
			scheVO.setScheSeq(scheService.GetScheSeq());
		}
		
		Map p = new HashMap();
		p.put("divEnable", "Y");
		model.addAttribute("EmpList", formService.GetPerList(p));
		vo.setPerSabun(loginVO.getPerSabun());						//사용자 회사 사용가능 차량만 불러온다
		model.addAttribute("CarList", scheService.GetCarList(vo));  // 선택한 일자로 차량 조회 (시작날짜)
		
		String reqURL = req.getRequestURL().toString().replace("ScheduleProc", "ScView");	// 게시물 URL 정보
		model.addAttribute("reqURL", reqURL);					 // 게시물 URL 정보
		model.addAttribute("SMSSeq", cusService.GetSMSSeq());
		model.addAttribute("scheVO", scheVO);					 // 선택한 일정 정보
		model.addAttribute("vo", vo);
		
		HashMap map = new HashMap();
		map.put("scheduleId", scheVO.getScheSeq());
		
		List<Map> list = meetingRoomService.getMeetingRoomRsvList(map);   //회의실 예약 내역
		 
		Map objMap = new HashMap();
		
		if(list.size() == 0) objMap = null;
		else objMap = list.get(0);
		
		model.addAttribute("meetingRoom", objMap);
		model.addAttribute("meetingRoomChk", list.size());
		
		
		// 차량사용여부 조회 추가
		selectCarList( req,  vo, model);
		
		return "schedule/ScheduleProc";  // 일정등록 화면 오픈
	}
	
	//유저 리스트 가져오는 부분.
	@RequestMapping(value = "/getScheduleEntryList.do")
	public void GetScheduleEntryList( HttpServletRequest req,
			HttpServletResponse response,
			ScheduleVO vo, Model model,
			@RequestParam Map map) throws Exception {
		
		if(map.containsKey("eventType") && map.get("eventType").equals("Edit")){ //수정화면에서 참가자로 등록된 리스트 
			AjaxResponse.responseAjaxSelect(response, scheService.GetScheduleEntryList(vo));
			
		}else{ //그외 선택된 유저리스트 (팝업, 등록화면) 
			String selectUser = (String)map.get("searchPerSabun");
			if(!selectUser.equals("")){
				Map seachmap = new HashMap();
				seachmap.put("sabun", selectUser);
				AjaxResponse.responseAjaxSelect(response, formService.GetPerList(seachmap));
			}
		}
		
	}
	
	
	// 일정 등록 (신규)
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/ScheduleAddEnd.do")
	public String ScheduleAddEnd(
			HttpServletRequest req,
			HttpSession session,
			ScheduleVO vo, 
			BindingResult bindingResult, 
			Model model, 
			SessionStatus status
			) throws Exception {
		System.out.println("************** ScheduleController.java ScheduleAddEnd 일정등록 시작 **********************");
		
		ib.cmm.LoginVO loginUser = (ib.cmm.LoginVO)session.getAttribute("userLoginInfo");
		
		beanValidator.validate(vo, bindingResult);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("vo", vo);
			model.addAttribute("message", "등록 실패 하였습니다.");
			return "schedule/ScheduleProc";
		}
		
		if(vo.getScheGubun().equals("All")) 
			vo.setSchePublicFlag("Y");   // 공개여부 
		
	/*	if(vo.getParentPage().equals("mobile")) {
			vo.setScheTitle(Utill.KoreanEncoding(vo.getScheTitle()));
			vo.setScheArea(Utill.KoreanEncoding(vo.getScheArea()));
			vo.setScheCon(Utill.KoreanEncoding(vo.getScheCon()));
		}*/
		
		LoginVO loginVO = (LoginVO)req.getSession().getAttribute("loginVO");
	
		if(vo.getSchePeriodFlag().equals("Y")) 
			vo.setScheRepetFlag("None");    // 반복여부
		
		// 신규 그룹코드 추가
		vo.setGrpCd(Long.toString(System.currentTimeMillis()) + vo.getPerSabun());
		
		if(!vo.getScheRepetFlag().equals("None")) {	// 반복일정이면..
			vo.setScheGrpCd(Long.toString(System.currentTimeMillis()));  // 시간 + persabun
			System.out.println("before: "+Long.toString(System.currentTimeMillis()));
			List list = ScheduleAddProc(vo);  // 반복일정 등록 프로세스(list에 param data put)
			if(list.size() > 0){
				scheService.ScheduleAllAddEnd(req, vo, list);   // 일괄등록
			}
		} else if(vo.getSchePeriodFlag().equals("Y")) { 		// 기간일정인 경우 
			vo.setScheGrpCd("Period");
			List list = PeriodScheduleAddProc(vo);				// 기간일정 등록 프로세스
			if(list.size() > 0)
				scheService.ScheduleAllAddEnd(req, vo, list);   // 일괄등록
		} else { // 종일 일정인 경우 
			String seq = scheService.ScheduleAddEnd(req, vo);
			
			
			//------- 푸쉬 세팅 :S -----------
			try{				
				int EmpCnt = Integer.parseInt(req.getParameter("EmpCnt")) + 1;
				
				List <String> entrySabunList = new ArrayList();
	
				for(int i = 1; i < EmpCnt; i++) {
					if(!(req.getParameter("EntrySabunAry" + i)).equals("")  && (req.getParameter("EntryDelFlagAry" + i)).equals("N")){
						entrySabunList.add(req.getParameter("EntrySabunAry" + i));
					}
				}
						
				//푸쉬 추가 로직 (신규일때만)
				if(entrySabunList.size()>0){
					
					Map map = new HashMap();
					String commentReal = vo.getScheTitle();
					map.put("pushType",		PushVO.ptSchedule);
					map.put("sabunList",	entrySabunList.toString().replace("[", "").replace("]", "").replace(", ", ","));
					map.put("sendMeYn",		"Y");
					map.put("pushTypeId",	seq);
					map.put("content",		"[일정등록]"
											+ loginUser.getName() + " "
											+ vo.getScheSDate().replaceAll("-", ".") + " "
											+ (commentReal.length()>40? commentReal.substring(0,40) : commentReal));
					map.put("rgUserId", 	loginUser.getStaffSnb());
					pushService.insertPushLogSearchSabunList(map);
				}
				
			}catch(Exception e){
			}
			//------- 푸쉬 세팅 :E -----------
		}
		
		// 구글 일정 등록 : result 값으로 다음프로세스 처리
		try{
			boolean resultGoogle = googleCalendarService.InsertSchedule(vo, loginVO);		
			req.setAttribute("googlelinkflag", resultGoogle);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		status.setComplete();
		if(vo.getParentPage().equals("mobile")){
			String fullDate=vo.getScheSDate();
			String selYear=fullDate.substring(0,4);
			String selMonth=fullDate.substring(5,7);
			
			if(vo.getBeforePage().equals("calendar")){
				return "redirect:/MbScheduleCal.do?SearchPerSabun="+vo.getRegPerSabun()+"&regTime=Y&ScheSDate="+fullDate+"&SelYear="+selYear+"&SelMonth="+selMonth;
			}else{//list 에서.
				return "redirect:/MbTodaySchedule.do?SearchPerSabun="+vo.getRegPerSabun()+"&regTime=Y&ScheSDate="+fullDate;
			}
		}
		
		else if(vo.getParentPage().equals("Cal")) 
			return "forward:/ScheduleCal.do?SearchPerSabun="+vo.getPerSabun()+"&regTime=Y";
		else if(vo.getParentPage().equals("card"))
			return "redirect:/card/cardIndex.do";
		else 
			return "forward:/ScheduleList.do?SearchPerSabun="+vo.getPerSabun()+"";
	}
	
	// 기간일정 등록 프로세스
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/PeriodScheduleAddProc.do")
	public List PeriodScheduleAddProc(ScheduleVO vo) throws Exception {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		Date SDate = formatter.parse(vo.getScheSDate());
		Calendar Scalendar = Calendar.getInstance();
		Scalendar.setTime(SDate);
		
		Date EDate = formatter.parse(vo.getScheEDate());
		Calendar Ecalendar = Calendar.getInstance();
		Ecalendar.setTime(EDate);
		
		long Diff = EDate.getTime() - SDate.getTime();
		long DiffDay = Diff / ( 24 * 60 * 60 * 1000);
		
		for(int i = 0; i <= DiffDay; i++) {
			Map<String, Object> paramTemp = new HashMap<String, Object>();
			System.out.println(i+"==="+Utill.DateCalcu(vo.getScheSDate(), "day", i));
		
			String seq = scheService.GetScheSeq();
			int ScheSeq = Integer.parseInt(seq) + i;
			
			paramTemp.put("ScheSeq", ScheSeq);
			paramTemp.put("ScheGrpCd", vo.getScheGrpCd());
			paramTemp.put("ScheGubun", vo.getScheGubun());
			paramTemp.put("ScheType", vo.getScheType());
			paramTemp.put("ScheSYear", Utill.DateCalcu(vo.getScheSDate(), "day", i).split("-")[0]);
			paramTemp.put("ScheSMonth", Utill.DateCalcu(vo.getScheSDate(), "day", i).split("-")[1]);
			paramTemp.put("ScheSDay", Utill.DateCalcu(vo.getScheSDate(), "day", i).split("-")[2]);
			paramTemp.put("ScheSDate", vo.getScheSDate());
			paramTemp.put("ScheSTimeAMPM", vo.getScheSTimeAMPM());
			paramTemp.put("ScheSTime", vo.getScheSTime());
			paramTemp.put("ScheEYear", vo.getScheEDate().split("-")[0]);
			paramTemp.put("ScheEMonth", vo.getScheEDate().split("-")[1]);
			paramTemp.put("ScheEDay", vo.getScheEDate().split("-")[2]);
			paramTemp.put("ScheEDate", vo.getScheEDate());
			paramTemp.put("ScheETimeAMPM", vo.getScheETimeAMPM());
			paramTemp.put("ScheETime", vo.getScheETime());
			paramTemp.put("ScheAllTime", vo.getScheAllTime());
			paramTemp.put("ScheTitle", vo.getScheTitle());
			paramTemp.put("ScheCon", vo.getScheCon());
			paramTemp.put("ScheArea", vo.getScheArea());
			paramTemp.put("ScheRepetFlag", vo.getScheRepetFlag());
			paramTemp.put("ScheAlarmFlag", vo.getScheAlarmFlag());
			paramTemp.put("ScheAlarmHow", vo.getScheAlarmHow());
			paramTemp.put("ScheImportant", vo.getScheImportant());
			paramTemp.put("CarUseFlag", vo.getCarUseFlag());
			paramTemp.put("CarNum", vo.getCarNum());
			paramTemp.put("SchePublicFlag", vo.getSchePublicFlag());
			paramTemp.put("SchePeriodFlag", "Y");
			paramTemp.put("ContactLoc", vo.getContactLoc());
			paramTemp.put("PerSabun", vo.getPerSabun());
			System.out.println(vo.getCarUseFlag()+"===="+vo.getCarNum());
			
			paramTemp.put("tmpCpnId", vo.getTmpCpnId());
			paramTemp.put("tmpCstId", vo.getTmpCstId());
			
			paramTemp.put("grpCd", vo.getGrpCd());
			
			list.add(paramTemp);
		}
		return list;
	}
	
	// 반복일정 등록 프로세스
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/ScheduleAddProc.do")
	public List ScheduleAddProc(ScheduleVO vo) throws Exception {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		String SYy = "", SMm = "", SDd = "", EYy = "", EMm = "", EDd = "";
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		Date SDate = formatter.parse(vo.getScheSDate());
		Calendar Scalendar = Calendar.getInstance();
		Scalendar.setTime(SDate);
		
		Date EDate = formatter.parse(vo.getScheEDate());
		Calendar Ecalendar = Calendar.getInstance();
		Ecalendar.setTime(EDate);
		
		// 반복일정은 년반복, 분기반복 5년, 월반복 3년 // 나머지는 1년 을 기준으로 한다.
		int len = 0;
		if(vo.getScheRepetFlag().equals("Date")) len = 365;
		else if(vo.getScheRepetFlag().equals("Week")) len = 52;
		else if(vo.getScheRepetFlag().equals("Month")) len = 36;
		else if(vo.getScheRepetFlag().equals("Quarter")) len = 20;
		else len = 5;

		for(int oOo = 0; oOo < len; oOo++) {
			Map<String, Object> paramTemp = new HashMap<String, Object>();
			
			Scalendar.setTime(SDate);
			if(vo.getScheRepetFlag().equals("Date")) Scalendar.add(Calendar.DAY_OF_YEAR, oOo);
			else if(vo.getScheRepetFlag().equals("Week")) Scalendar.add(Calendar.WEEK_OF_YEAR, oOo);
			else if(vo.getScheRepetFlag().equals("Month")) Scalendar.add(Calendar.MONTH, oOo);
			else if(vo.getScheRepetFlag().equals("Quarter")) Scalendar.add(Calendar.MONTH, oOo*3);
			else Scalendar.add(Calendar.YEAR, oOo);
			SYy = Integer.toString(Scalendar.get(Calendar.YEAR));
			SMm = Integer.toString(Scalendar.get(Calendar.MONTH) + 1);
			SDd = Integer.toString(Scalendar.get(Calendar.DAY_OF_MONTH));
			if(SMm.length() == 1) SMm = "0" + SMm;
			if(SDd.length() == 1) SDd = "0" + SDd;
			
			Ecalendar.setTime(EDate);
			if(vo.getScheRepetFlag().equals("Date")) Ecalendar.add(Calendar.DAY_OF_YEAR, oOo);
			else if(vo.getScheRepetFlag().equals("Week")) Ecalendar.add(Calendar.WEEK_OF_YEAR, oOo);
			else if(vo.getScheRepetFlag().equals("Month")) Ecalendar.add(Calendar.MONTH, oOo);
			else if(vo.getScheRepetFlag().equals("Quarter")) Ecalendar.add(Calendar.MONTH, oOo*3);
			else Ecalendar.add(Calendar.YEAR, oOo);
			EYy = Integer.toString(Ecalendar.get(Calendar.YEAR));
			EMm = Integer.toString(Ecalendar.get(Calendar.MONTH) + 1);
			EDd = Integer.toString(Ecalendar.get(Calendar.DAY_OF_MONTH));
			if(EMm.length() == 1) EMm = "0" + EMm;
			if(EDd.length() == 1) EDd = "0" + EDd;
			
			int ScheSeq = Integer.parseInt(scheService.GetScheSeq()) + oOo;
			paramTemp.put("ScheSeq", ScheSeq);
			paramTemp.put("ScheGrpCd", vo.getScheGrpCd());
			paramTemp.put("ScheGubun", vo.getScheGubun());
			paramTemp.put("ScheType", vo.getScheType());
			paramTemp.put("ScheSYear", SYy);
			paramTemp.put("ScheSMonth", SMm);
			paramTemp.put("ScheSDay", SDd);
			paramTemp.put("ScheSDate", SYy + "-" + SMm + "-" + SDd);
			paramTemp.put("ScheSTimeAMPM", vo.getScheSTimeAMPM());
			paramTemp.put("ScheSTime", vo.getScheSTime());
			paramTemp.put("ScheEYear", EYy);
			paramTemp.put("ScheEMonth", EMm);
			paramTemp.put("ScheEDay", EDd);
			paramTemp.put("ScheEDate", EYy + "-" + EMm + "-" + EDd);
			paramTemp.put("ScheETimeAMPM", vo.getScheETimeAMPM());
			paramTemp.put("ScheETime", vo.getScheETime());
			paramTemp.put("ScheAllTime", vo.getScheAllTime());
			paramTemp.put("ScheTitle", vo.getScheTitle());
			paramTemp.put("ScheCon", vo.getScheCon());
			paramTemp.put("ScheArea", vo.getScheArea());
			paramTemp.put("ScheRepetFlag", vo.getScheRepetFlag());
			paramTemp.put("ScheAlarmFlag", vo.getScheAlarmFlag());
			paramTemp.put("ScheAlarmHow", vo.getScheAlarmHow());
			paramTemp.put("ScheImportant", vo.getScheImportant());
			paramTemp.put("SchePublicFlag", vo.getSchePublicFlag());
			paramTemp.put("SchePeriodFlag", vo.getSchePeriodFlag());
			paramTemp.put("CarUseFlag", vo.getCarUseFlag());
			paramTemp.put("CarNum", vo.getCarNum());
			paramTemp.put("ContactLoc", vo.getContactLoc());
			paramTemp.put("PerSabun", vo.getPerSabun());
			
			paramTemp.put("tmpCpnId", vo.getTmpCpnId());
			paramTemp.put("tmpCstId", vo.getTmpCstId());
			
			paramTemp.put("grpCd", vo.getGrpCd());   // 그룹코드 
			
			list.add(paramTemp);
		}
		return list;
	}
	
	// 반복 일정 수정/삭제 플래그 페이지
	@RequestMapping(value = "/ScheduleProcFlag.do")
	public String ScheduleProcFlag(ScheduleVO vo, Model model) throws Exception {
		model.addAttribute("vo", vo);
		return "schedule/ScheduleProcFlag";
	}
	
	// 반복 일정 데이터 받기
	@RequestMapping(value = "/GetRepetScheduleData.do")
	public ScheduleVO GetRepetScheduleData(ScheduleVO vo, Map<String, Object> map) throws Exception {
		
		ScheduleVO DataVO = new ScheduleVO();
		DataVO.setScheSeq(map.get("scheseq").toString());
		DataVO.setScheGrpCd(map.get("schegrpcd").toString());
		DataVO.setPerSabun(map.get("persabun").toString());
		DataVO.setScheGubun(map.get("schegubun").toString());
		
//		DataVO.setScheType(map.get("schetype").toString());
//		DataVO.setScheSYear(map.get("schesyear").toString());
//		DataVO.setScheSMonth(map.get("schesmonth").toString());
//		DataVO.setScheSDay(map.get("schesday").toString());
//		DataVO.setScheSDate(map.get("schesdate").toString());
//		DataVO.setScheSTimeAMPM(map.get("schestimeampm").toString());
//		DataVO.setScheSTime(map.get("schestime").toString());
//		DataVO.setScheEYear(map.get("scheeyear").toString());
//		DataVO.setScheEMonth(map.get("scheemonth").toString());
//		DataVO.setScheEDay(map.get("scheeday").toString());
//		DataVO.setScheEDate(map.get("scheedate").toString());
//		DataVO.setScheETimeAMPM(map.get("scheetimeampm").toString());
//		DataVO.setScheETime(map.get("scheetime").toString());
//		DataVO.setScheAllTime(map.get("schealltime").toString());
//		DataVO.setSchePeriodFlag(map.get("scheperiodflag").toString());
		
		DataVO.setScheType(vo.getScheType());
		DataVO.setScheSYear(vo.getScheSYear());
		DataVO.setScheSMonth(vo.getScheSMonth());
		DataVO.setScheSDay(vo.getScheSDay());
		DataVO.setScheSDate(vo.getScheSDate());
		DataVO.setScheSTimeAMPM(vo.getScheSTimeAMPM());
		DataVO.setScheSTime(vo.getScheSTime());
		DataVO.setScheEYear(vo.getScheEYear());
		DataVO.setScheEMonth(vo.getScheEMonth());
		DataVO.setScheEDay(vo.getScheEDay());
		DataVO.setScheEDate(vo.getScheEDate());
		DataVO.setScheETimeAMPM(vo.getScheETimeAMPM());
		DataVO.setScheETime(vo.getScheETime());
		DataVO.setScheAllTime(vo.getScheAllTime());
		DataVO.setSchePeriodFlag(vo.getSchePeriodFlag());
		
		
		DataVO.setScheTitle(vo.getScheTitle());
		DataVO.setScheArea(vo.getScheArea());
		DataVO.setScheCon(vo.getScheCon());
		DataVO.setScheRepetFlag(vo.getScheRepetFlag());
		DataVO.setScheAlarmFlag(vo.getScheAlarmFlag());
		DataVO.setScheAlarmHow(vo.getScheAlarmHow());
		DataVO.setScheImportant(vo.getScheImportant());
		DataVO.setSchePublicFlag(vo.getSchePublicFlag());
		DataVO.setProcFlag(vo.getProcFlag());
		DataVO.setPerSabun(vo.getPerSabun());
		DataVO.setCarUseFlag(vo.getCarUseFlag());
		DataVO.setCarNum(vo.getCarNum());
		
		DataVO.setTmpCpnId(vo.getTmpCpnId());
		DataVO.setTmpCstId(vo.getTmpCstId());
		
		DataVO.setGrpCd(map.get("grpCd").toString());  // 그룹코드 추가
		
		return DataVO;
	}
	
	/**
	 * @Method     : 
	 * @descripton : 일정 수정
	 * @date       : 2017. 9. 11.
	 * @author     : synergy
	 * @param      : HttpServletRequest req
	 * @param      : ScheduleVO vo
	 * @param      : BindingResult bindingResult
	 * @param      : Model model
	 * @param      : SessionStatus status
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/ScheduleEditEnd.do")
	public String ScheduleEditEnd(HttpServletRequest req, ScheduleVO vo, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
		
		beanValidator.validate(vo, bindingResult);
		System.out.println(vo.getProcFlag());
		req.setCharacterEncoding("UTF-8");
		if(bindingResult.hasErrors()) {
			model.addAttribute("vo", vo);
			model.addAttribute("message", "수정 실패 하였습니다.");
			return "schedule/ScheduleProc";
		}
		
		LoginVO loginVO = (LoginVO) req.getSession().getAttribute("loginVO");
		
	/*	if(vo.getParentPage().equals("mobile")) {
			vo.setScheTitle(Utill.KoreanEncoding(vo.getScheTitle()));
			vo.setScheArea(Utill.KoreanEncoding(vo.getScheArea()));
			vo.setScheCon(Utill.KoreanEncoding(vo.getScheCon()));
		}*/
		
		
		
		
		/*System.out.println(" ######### vo.getScheRepetFlag(): "+vo.getScheRepetFlag());
		System.out.println(" ######### vo.getScheSDay(): "+vo.getScheSDay());
		System.out.println(" ######### vo.getScheEDay(): "+vo.getScheEDay());
		// 3. 조건 별  		
		if(vo.getScheRepetFlag().equals("None") && vo.getScheSDay().equals(vo.getScheEDay()) ){  // 반복아니고 당일 일정인 경우 update
			System.out.println(" ######### 당일 수정 update");
			scheService.scheduleUpdate(vo);			
		}else{*/
		
		if(!StringUtil.isEmpty(vo.getScheGrpCd()) || vo.getSchePeriodFlag().equals("Y")){		//하루짜리 일정이 아니면
			// 1. 선택한 일정의 그룹을 전체 삭제처리 (DelFlag = Y)
			scheService.ScheduleDelEnd(vo);
			
			// 2. 신규 그룹코드 생성 (시간 + 사번)
			vo.setGrpCd(Long.toString(System.currentTimeMillis()) + vo.getPerSabun());  // grpCd insert
		}
		
		if(!vo.getScheRepetFlag().equals("None")) {	// 반복일정이면..
				vo.setScheGrpCd(Long.toString(System.currentTimeMillis()));  
				List list = ScheduleAddProc(vo);  // 반복일정 등록 프로세스(list에 param data put)
				if(list.size() > 0){
					scheService.ScheduleAllAddEnd(req, vo, list);
				}
		} else if(vo.getSchePeriodFlag().equals("Y")) { 		// 기간일정인 경우 
				vo.setScheGrpCd("Period");
				List list = PeriodScheduleAddProc(vo);				// 기간일정 등록 프로세스
				if(list.size() > 0)
					scheService.ScheduleAllAddEnd(req, vo, list);   // 일괄등록
		} else { 												// 하루 일정인 경우 
				//scheService.ScheduleAddEnd(req, vo);
			scheService.ScheduleEditEnd(req, vo);
		}
		//}
		
		// 일정 수정을 위한 로직 수정 2017.09.12
		/*
		if(!vo.getScheGrpCd().equals("")) {	// 기간일정수정
			if(!vo.getProcFlag().equals("alone")) {
				List<Map<String, Object>> RepetScheduleList = scheService.GetRepetScheduleList(vo);
				
				for(int i = 0; i < RepetScheduleList.size(); i++){
					
					ScheduleVO obj = new ScheduleVO();
					obj = GetRepetScheduleData(vo, RepetScheduleList.get(i));
					
					obj.setScheSYear(Utill.DateCalcu(obj.getScheSDate(), "day", i).split("-")[0]);
					obj.setScheSMonth(Utill.DateCalcu(obj.getScheSDate(), "day", i).split("-")[1]);
					obj.setScheSDay(Utill.DateCalcu(obj.getScheSDate(), "day", i).split("-")[2]);
					
				    scheService.ScheduleEditEnd(req, obj);  
				}
			} else {
				scheService.ScheduleEditEnd(req, vo);
			}
		} else { // 일 -> 기간 수정, 일->일의 시간수정
			if(vo.getSchePeriodFlag().equals("Y")) {  // 일->일의 시간수정
				vo.setScheRepetFlag("None");
			}
			if(!vo.getScheRepetFlag().equals("None")) {
				scheService.ScheduleDelEnd(vo);			// 일정 삭제 완료
				vo.setScheGrpCd(Long.toString(System.currentTimeMillis()));
				List list = ScheduleAddProc(vo);		// 반복일정 등록 프로세스
				if(list.size() > 0) {
					scheService.ScheduleAllAddEnd(req, vo, list);  // 일정 일괄 등록
				}
			}else if(vo.getSchePeriodFlag().equals("Y")) { // 기간일정이면
				scheService.ScheduleDelEnd(vo);			// 일정 삭제 완료
				vo.setScheGrpCd("Period");
				List list = PeriodScheduleAddProc(vo);	// 기간일정 등록 프로세스
				if(list.size() > 0) {
					scheService.ScheduleAllAddEnd(req, vo, list);  // 일정 일괄 등록 완료
				}
			}else {  // getSchePeriodFlag = Y
				scheService.ScheduleEditEnd(req, vo);	// 일정 수정 완료
			}
		}*/
		
		// 구글 일정 수정
		try{				
			boolean resultGoogle = googleCalendarService.UpdateSchedule(vo, loginVO);
			req.setAttribute("googlelinkflag", resultGoogle);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		status.setComplete();
		model.addAttribute("vo", vo);
		if(vo.getParentPage().equals("mobile")) {
			///1안 수정완료 후 원래있던 페이지로 돌아가기
		/*	String fullDate=vo.getScheSDate();
			String selYear=fullDate.substring(0,4);
			String selMonth=fullDate.substring(5,7);
			
			if(vo.getBeforePage().equals("calendar")){
				return "redirect:/MbScheduleCal.do?SearchPerSabun="+vo.getRegPerSabun()+"&regTime=Y&ScheSDate="+fullDate+"&SelYear="+selYear+"&SelMonth="+selMonth;
			}else{//list 에서.
				return "redirect:/MbTodaySchedule.do?SearchPerSabun="+vo.getRegPerSabun()+"&regTime=Y&ScheSDate="+fullDate;
			}*/
			//2안 수정완료했으니 완료됬는지 보고싶지않을까, 그럼 view 페이지로
			return "forward:/MbScheduleView.do?ScheSeq="+vo.getScheSeq()+"&SearchPersabun="+vo.getSearchPerSabun();
			
		}else{ 
			return "forward:/ScheduleCal.do?SearchPerSabun="+vo.getPerSabun()+"&regTime=Y";
		}
	}
	


	// 일정 삭제 
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ScheduleDelEnd.do")
	public String ScheduleDelEnd(HttpServletRequest req, @ModelAttribute("spCmmVO") SpCmmVO spCmmVO, ScheduleVO vo, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
		beanValidator.validate(vo, bindingResult);

		if(bindingResult.hasErrors()) {
			model.addAttribute("vo", vo);
			model.addAttribute("message", "삭제 실패 하였습니다.");
			return "schedule/ScheduleView";
		}
		
		LoginVO loginVO = (LoginVO) req.getSession().getAttribute("loginVO");
		
		if(!vo.getScheGrpCd().equals("") && !vo.getProcFlag().equals("alone")) {
			List<Map<String, Object>> RepetScheduleList = scheService.GetRepetScheduleList(vo);  // 선택된 일정 
			for(int i = 0; i < RepetScheduleList.size(); i++) {
				 scheService.ScheduleDelEnd(GetRepetScheduleData(vo, RepetScheduleList.get(i)));
			}
		}
		else scheService.ScheduleDelEnd(vo);
		
		// 구글캘린더 연동일정 삭제
		try{				
			boolean resultGoogle = googleCalendarService.DeleteSchedule(vo, loginVO);
			req.setAttribute("googlelinkflag", resultGoogle);
		}catch(Exception e){
			e.printStackTrace();
		}
				
		status.setComplete();
		if(vo.getParentPage().equals("mobile")){ ///모바일 화면 이벤트
			//view 에서 삭제
			if(vo.getBeforePage().equals("calendar")){
				return "forward:/MbScheduleCal.do?SearchPerSabun="+vo.getPerSabun()+"&regTime=Y";
			}else{//list 에서 삭제.
				return "forward:/MbTodaySchedule.do?SearchPerSabun="+vo.getPerSabun()+"&regTime=Y";
			}
		}
		else {
			if(!vo.getEventType().equals("Pop")) {
				if(vo.getParentPage().equals("Cal")) return "forward:/ScheduleCal.do?SearchPerSabun="+vo.getPerSabun()+"";
				else return "forward:/ScheduleList.do?SearchPerSabun="+vo.getPerSabun()+"";
			}
			else return "forward:/ClosePage.do";
		}
	}
	
	// 선택 일정 상세보기 조회
	@RequestMapping(value = "/ScheduleView.do")
	public String ScheduleView(@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, ScheduleVO vo, Model model) throws Exception {
		
		ScheduleVO scheVO = scheService.GetScheInfo(vo);
		model.addAttribute("scheVO", scheVO);
		
		if(!vo.getScheType().equals("IB")) {
			model.addAttribute("ScheduleEntryList", scheService.GetScheduleEntryList(vo));
		}
		model.addAttribute("vo", vo);
		
		
		//--회의실 내역
		HashMap map = new HashMap();
		map.put("scheduleId", vo.getScheSeq());
		
		List<Map> list = meetingRoomService.getMeetingRoomRsvList(map);
		
		model.addAttribute("meetingRoom", list);
		
		
		model.addAttribute("message", spCmmVO.getInfoMessage());
		return "schedule/ScheduleView";
	}
	
	// 선택 일정 완료 처리
	@RequestMapping(value = "/ScheduleChkEnd.do")
	public String ScheduleChkEnd(ScheduleVO vo, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
		beanValidator.validate(vo, bindingResult);

		if(bindingResult.hasErrors()) {
			model.addAttribute("vo", vo);
			model.addAttribute("message", "완료 실패 하였습니다.");
			return "schedule/ScheduleView";
		}
		scheService.ScheduleChkEnd(vo);
		status.setComplete();
		return "forward:/ScheduleView.do";
	}
	
	
	
	/**
	 * @Method     : selectCarList
	 * @descripton : 일정조회 시(ScheduleProc) 선택시간 차량 사용여부 조회를 위한 메소드 (CarListChk)
	 * @date       : 2017. 9. 12.
	 * @author     : synergy
	 * @param      : 
	 * @param      : 
	 */
	public void selectCarList(HttpServletRequest req, ScheduleVO vo, Model model) throws Exception {
		LoginVO loginVO = (LoginVO) req.getSession().getAttribute("loginVO");		
		vo.setPerSabun(loginVO.getPerSabun());						//사용자 회사 사용가능 차량만 불러온다
		List<Map<String, Object>> datalist = scheService.GetCarList(vo);  // 선택시간 차량 리스트 조회
		
		
		/*List<Map<String, Object>> carList = scheService.getCarUseYnList(vo);  // 선택시간 차량 리스트 조회
		System.out.println(" ################## selectCarList 사용되고있는 차량 조회 carList: "+carList);*/
		
		
		JSONObject jsonObject = new JSONObject();
		JSONArray cell = new JSONArray();
		
		for(int i = 0; i < datalist.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("scheseq", datalist.get(i).get("scheseq").toString());
			obj.put("caruseflag", datalist.get(i).get("caruseflag").toString());
			obj.put("carnum", datalist.get(i).get("carnum").toString());
			obj.put("pernm", datalist.get(i).get("pernm").toString());
			obj.put("stime", datalist.get(i).get("stime").toString());
			obj.put("etime", datalist.get(i).get("etime").toString());
			obj.put("managerNm", datalist.get(i).get("managerNm").toString());
			obj.put("cpn", datalist.get(i).get("cpn").toString());
			cell.add(obj);
		}
		jsonObject.put("rows", cell);
		model.addAttribute("result", jsonObject.get("rows"));
		System.out.println("################## result rows: "+jsonObject.get("rows"));
	}
	
	
	
	
	
	
	
//	/**
//	 * 회사 찾기 팝업
//	 * @MethodName : popUpCpn
//	 * @param request
//	 * @param workVO
//	 * @param companyVO
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping(value="/work/popUpCpn.do")
//	public String popUpCpn(HttpServletRequest request,
//			HttpSession session,
//			WorkVO workVO,
//			CompanyVO companyVO,
//			ModelMap model) throws Exception{
//
////		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
////		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
////        LOG.info(loginUser.getId()+"^_^"+workVO.getCpnNm());
//		
//		int totCnt = 0;
//		List<CompanyVO> result = null;
//		Map<String, Object> map = new HashMap<String, Object>();
//        PaginationInfo paginationInfo = new PaginationInfo();
//        model.addAttribute("searchName", workVO.getCpnNm());
//        model.addAttribute("MDf", workVO.getModalFlag());
//        model.addAttribute("MDn", workVO.getModalNum());
//
//        //System.out.println(companyVO.getPageIndex());
//
//        paginationInfo.setCurrentPageNo(companyVO.getPageIndex());//현재 페이지 번호
//        paginationInfo.setRecordCountPerPage(15);//한 페이지에 게시되는 게시물 건수
//        paginationInfo.setPageSize(5);//페이징 리스트의 사이즈
//
//        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
//		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
//		companyVO.setFirstIndex(firstRecordIndex);
//		companyVO.setRecordCountPerPage(recordCountPerPage);
//
//		try{
//			result = companyDAO.selectCompanyList(companyVO);
//			totCnt = companyDAO.selectCompanyListCnt(companyVO);
//		}catch(Exception e){
//			LOG.error(e);
//			e.printStackTrace();
//		}
//		map.put("resultList", result);
//		model.addAttribute("companyList", map.get("resultList"));
//
//        paginationInfo.setTotalRecordCount(totCnt);
//        model.addAttribute("paginationInfo", paginationInfo);
//
//		//return "work/popUp/PopUpCpn";
//        return "sp/erp/ib/PopUpCpn";
//	}
//	
//	/**
//	 * 팝업 실시간 회사검색
//	 * @MethodName : ajaxPopUpCpnSearchName
//	 * @param request
//	 * @param workVO
//	 * @param companyVO
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 * @author : user
//	 * @since : 2015. 2. 9.
//	 */
//	@RequestMapping(value="/work/ajaxPopUpCpnSearchName.do")
//	public String ajaxPopUpCpnSearchName(HttpServletRequest request,
//			HttpSession session,
//			WorkVO workVO,
//			CompanyVO companyVO,
//			ModelMap model) throws Exception{
//
//		//if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
//		//LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//        //LOG.info(loginUser.getId()+"^_^"+workVO.getCpnNm());
//		
//		int totCnt = 0;
//		List<CompanyVO> result = null;
//		Map<String, Object> map = new HashMap<String, Object>();
//        PaginationInfo paginationInfo = new PaginationInfo();
//        model.addAttribute("searchName", workVO.getCpnNm());
//        model.addAttribute("MDf", workVO.getModalFlag());
//        model.addAttribute("MDn", workVO.getModalNum());
//
//        //System.out.println(companyVO.getPageIndex());
//
//        paginationInfo.setCurrentPageNo(companyVO.getPageIndex());//현재 페이지 번호
//        paginationInfo.setRecordCountPerPage(15);//한 페이지에 게시되는 게시물 건수
//        paginationInfo.setPageSize(5);//페이징 리스트의 사이즈
//
//        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
//		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
//		companyVO.setFirstIndex(firstRecordIndex);
//		companyVO.setRecordCountPerPage(recordCountPerPage);
//
//		try{
//			result = companyDAO.selectCompanyList(companyVO);
//			totCnt = companyDAO.selectCompanyListCnt(companyVO);
//		}catch(Exception e){
//			LOG.error(e);
//			e.printStackTrace();
//		}
//		map.put("resultList", result);
//		model.addAttribute("companyList", map.get("resultList"));
//
//        paginationInfo.setTotalRecordCount(totCnt);
//        model.addAttribute("paginationInfo", paginationInfo);
//
//		return "sp/erp/ib/includeJSP/PopUpCpn";
//		
//	}
//	
//	/**
//	 * 회사 등록화면
//	 * @MethodName : rgstCpn
//	 * @param companyVO
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/work/popRgstCpn.do")
//	public String rgstCpn(@ModelAttribute("companyVO") CompanyVO companyVO,
//			HttpSession session,
//			ModelMap model){
//
//		//if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
//		//LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		//LOG.info(loginUser.getId());
//		
//		LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
//		
//
//		//System.out.println("===========등록할 회사이름:"+companyVO.getSearchCpnNm()+"==============");
//		List<CompanyVO> result = null;
//		try{
//			result = companyDAO.selectMaxCpnId(companyVO);
//		}catch(Exception e){
//			LOG.error(e);
//			e.printStackTrace();
//		}
//		model.addAttribute("maxCpnId", result.get(0).getCpnId());
//		model.addAttribute("cpnNm", companyVO.getSearchCpnNm());
//		model.addAttribute("MDf", companyVO.getModalFlag());
//		model.addAttribute("MDn", companyVO.getModalNum());
//		//LOG.info(loginUser.getId()+"^_^"+companyVO.getSearchCpnNm());
//
//		return "sp/erp/ib/RegistCPN";
//	}
//	
//	/**
//	 * 회사 등록하기
//	 * @MethodName : insertCpn
//	 * @param companyVO
//	 * @param session
//	 * @param loginVO
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/company/insertCpn.do")
//	public String insertCpn(@ModelAttribute("companyVO") CompanyVO companyVO,
//			HttpSession session,
//			LoginVO loginVO,
//			ModelMap model){
//		
//		//if(session.getAttribute("userLoginInfo")==null) return "basic/Content";		
//		//LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		LoginVO loginUser = (LoginVO) session.getAttribute("loginVO");
//		companyVO.setRgId(loginUser.getPerId());
//		//LOG.info(loginUser.getId());
//		
//		int cnt = 0;
//		try{
//			cnt = companyDAO.insertCompany(companyVO);
//			//LOG.debug(loginUser.getId()+"^_^companyDAO.insertCompany");
//		}catch(Exception e){
//			LOG.error(e);
//			e.printStackTrace();
//		}
//		model.addAttribute("saveCnt", cnt);
//
//		return "sp/erp/ib/RegistCPN";
//	}
//	
//	
//	
//	/**
//	 * 사람 찾기 팝업
//	 * @MethodName : popUpCst
//	 * @param request
//	 * @param workVO
//	 * @param personVO
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping(value="/work/popUpCst.do")
//	public String popUpCst(HttpServletRequest request,
//			HttpSession session,
//			WorkVO workVO,
//			PersonVO personVO,
//			ModelMap model) throws Exception{
//
////		업무일지 기입시 회사 선택한 후 사람선택시 해당 회사 사람만 소팅하기 위한 부분
////		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
////		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
////        LOG.info(loginUser.getId()+"^_^"+workVO.getCstNm());
//
//		int totCnt = 0;
//		List<PersonVO> result = null;
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//        PaginationInfo paginationInfo = new PaginationInfo();
//        model.addAttribute("searchName", workVO.getCstNm());
//        model.addAttribute("MDf", workVO.getModalFlag());
//        model.addAttribute("MDn", workVO.getModalNum());
//        model.addAttribute("sortTitle", workVO.getSort_t());
//
//
//        paginationInfo.setCurrentPageNo(personVO.getPageIndex());//현재 페이지 번호
//        paginationInfo.setRecordCountPerPage(15);//한 페이지에 게시되는 게시물 건수
//        paginationInfo.setPageSize(5);//페이징 리스트의 사이즈
//
//        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
//		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
//		personVO.setFirstIndex(firstRecordIndex);
//		personVO.setRecordCountPerPage(recordCountPerPage);
//
//		if(personVO.getCpnNm() != null && personVO.getCpnNm().length() != 0) model.addAttribute("YN", "Y");
//
//
//		try{
//			result = personDAO.selectPersonList(personVO);
//			totCnt = personDAO.selectPersonListCnt(personVO);
//		}catch(Exception e){
//			LOG.error(e);
//			e.printStackTrace();
//		}
//		map.put("resultList", result);
//		model.addAttribute("cstList", map.get("resultList"));
//
//		paginationInfo.setTotalRecordCount(totCnt); //전체 게시물 건 수
//		model.addAttribute("paginationInfo", paginationInfo);
//
//		return "sp/erp/ib/PopUpCst";
//	}
//	
//	/**
//	 * 팝업 실시간 인물검색
//	 * @MethodName : ajaxPopUpCstSearchName
//	 * @param request
//	 * @param workVO
//	 * @param personVO
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 * @author : user
//	 * @since : 2015. 2. 9.
//	 */
//	@RequestMapping(value="/work/ajaxPopUpCstSearchName.do")
//	public String ajaxPopUpCstSearchName(HttpServletRequest request,
//			HttpSession session,
//			WorkVO workVO,
//			PersonVO personVO,
//			ModelMap model) throws Exception{
//
////		업무일지 기입시 회사 선택한 후 사람선택시 해당 회사 사람만 소팅하기 위한 부분
//		//if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
//		//LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//        //LOG.info(loginUser.getId()+"^_^"+workVO.getCstNm());
//		
//		int totCnt = 0;
//		List<PersonVO> result = null;
//		Map<String, Object> map = new HashMap<String, Object>();
//        PaginationInfo paginationInfo = new PaginationInfo();
//		
//        model.addAttribute("searchName", workVO.getCstNm());
//        model.addAttribute("MDf", workVO.getModalFlag());
//        model.addAttribute("MDn", workVO.getModalNum());
//        model.addAttribute("sortTitle", workVO.getSort_t());
//
//
//        paginationInfo.setCurrentPageNo(personVO.getPageIndex());//현재 페이지 번호
//        paginationInfo.setRecordCountPerPage(15);//한 페이지에 게시되는 게시물 건수
//        paginationInfo.setPageSize(5);//페이징 리스트의 사이즈
//
//        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
//		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
//		personVO.setFirstIndex(firstRecordIndex);
//		personVO.setRecordCountPerPage(recordCountPerPage);
//
//		if(personVO.getCpnNm() != null && personVO.getCpnNm().length() != 0) model.addAttribute("YN", "Y");
//
//		
//		result = personDAO.selectPersonList(personVO);
//		totCnt = personDAO.selectPersonListCnt(personVO);
//	
//		map.put("resultList", result);
//		model.addAttribute("cstList", map.get("resultList"));
//
//		paginationInfo.setTotalRecordCount(totCnt); //전체 게시물 건 수
//		model.addAttribute("paginationInfo", paginationInfo);
//
//		return "sp/erp/ib/includeJSP/PopUpCst";		
//	}
//	
//	
//	/**
//	 * 사람 등록화면
//	 * @MethodName : rgstCst
//	 * @param companyVO
//	 * @param personVO
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/work/popRgstCst.do")
//	public String popRgstCst(@ModelAttribute("personVO") PersonVO personVO,
//			HttpSession session,
//			ModelMap model){
//
//		//if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
//		//LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		//LOG.info(loginUser.getId());
//		//System.out.println("===========등록할 이름:"+personVO.getSearchCstNm()+"==============");
//		model.addAttribute("cstNm", personVO.getSearchCstNm());
//		model.addAttribute("MDf", personVO.getModalFlag());
//		model.addAttribute("MDn", personVO.getModalNum());
//		//LOG.info(loginUser.getId()+"^_^"+personVO.getSearchCstNm());
//		
//		return "sp/erp/ib/RegistCST";
//	}
//	
//	/**
//	 * 사람 등록하기
//	 * @MethodName : insertCst
//	 * @param personVO
//	 * @param workVO
//	 * @param loginVO
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/person/insertCst.do")
//	public String insertCst(@ModelAttribute("personVO") PersonVO personVO,
//			HttpSession session,
//			LoginVO loginVO,
//			WorkVO workVO,
//			ModelMap model) throws Exception{
//try{		
//		//if(session.getAttribute("userLoginInfo")==null) return "basic/Content";	
//		LoginVO loginUser = (LoginVO) session.getAttribute("loginVO");
//		//LOG.info(loginUser.getId());
//		personVO.setRgId(loginUser.getPerId());		
//		personVO.setStaffSnb(loginUser.getStaffSnb());
//		
//		
//		int cnt = 0;		
//		if(!"".equals(personVO.getUsrCusId())){			
//			cnt = personMgmtService.insertCustomer(personVO);			//담당자등록 및 네트워크 등록을 위한 서비스추가후 연결
//		}else{
//			cnt = personDAO.insertCustomer(personVO);
//		}
//		
//		model.addAttribute("saveCnt", cnt);
//
//		return "sp/erp/ib/RegistCST";
//		
//}catch(Exception e){
//	e.printStackTrace();
//	throw e;
//}
//	}
//	
//	/**
//	 * 고객 정보 수정 화면
//	 * @MethodName : modifyCst
//	 * @param request
//	 * @param personVO
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/person/modifyCst.do")
//	public String modifyCst(HttpServletRequest request,
//			PersonVO personVO,
//			HttpSession session,
//			ModelMap model){
//		
//		//if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
//		//LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
////		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
//		//LOG.info(loginUser.getId());
//
//		List<PersonVO> result = null;
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		model.addAttribute("choose_popMain", "modifyCstPopUp");
//
//		try{
//			result = personDAO.selectMainPersonList(personVO);
//		}catch(Exception e){
//			LOG.error(e);
//			e.printStackTrace();
//		}
//		map.put("resultList", result);
//		model.addAttribute("cstList", map.get("resultList"));
//		
//		return "sp/erp/ib/ModifyCST";
//	}
//	/**
//	 * 고객정보 수정하기
//	 * @MethodName : updateCst
//	 * @param personVO
//	 * @param workVO
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/person/updateCst.do")
//	public String updateCst(@ModelAttribute("personVO") PersonVO personVO,
//			HttpSession session,
//			LoginVO loginVO,
//			ModelMap model){
//		
//		//if(session.getAttribute("userLoginInfo")==null) return "basic/Content";		
//		LoginVO loginUser = (LoginVO) session.getAttribute("loginVO");
////		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
//		//LOG.info(loginUser.getId());
//		personVO.setRgId(loginUser.getPerId());
//		
//		int cnt = 0;
//		try{
//			cnt = personDAO.updateCustomer(personVO);
//			//LOG.debug(loginUser.getId()+"^_^personDAO.updateCustomer^_^"+personVO.getsNb());
//			cnt = companyDAO.updateCEO();
//			//LOG.debug(loginUser.getId()+"^_^companyDAO.updateCEO");
//		}catch(Exception e){
//			LOG.error(e);
//			e.printStackTrace();
//		}
//
//		model.addAttribute("updateCnt", cnt);
//		
//		return "sp/erp/ib/ModifyCST";
//	}
//	
//	
//	/**
//	 * 고객이름 찾기(신규등록을 위해 없는 이름) ajax
//	 *
//	 * @param		: 
//	 * @return		: 
//	 * @exception	: 
//	 * @author		: oys
//	 * @date		: 2016. 2. 23.
//	 */
//	@RequestMapping(value = "/person/getCustomerName.do")
//	public void getCustomerName(HttpServletRequest request,
//			HttpServletResponse response, ModelMap model,
//			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
//
//		LoginVO loginUser = (LoginVO) session.getAttribute("loginVO");
//
//		
//		Map cstM = null;
//		
//		String cstNm = map.get("cstNm").toString();
//		int idx = 0;
//		
//		for(int i=0; i<30; i++){
//			if(i>0){
//				//cstNm = cstNm + i;	//뒤에 숫자를 붙여서  1,2,...
//				map.put("cstNm", cstNm + i);					//다시 찾아볼 이름을 세팅
//			}
//				
//			cstM = personMgmtService.getCustomerByName(map);	//이름으로 찾아본다.
//			
//			if(cstM==null){		//없을때는
//				idx = i;
//				break;			//등록할 수 있는 이름이므로 빠져나간다.
//			}
//		}
//		
//		Map obj = new HashMap<String,String>();
//		obj.put("cstNm", cstNm + idx);				//등록할 수 있는 이름
//		obj.put("isExist", (idx>0?"Y":"N"));		//요청한 이름이 있는지 ... 'Y' 있어서 등록할 수 있는 이름을 찾아서 반환해준 케이스
//		
//		//AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
//		AjaxResponse.responseAjaxObject(response, obj);			//결과전송
//
//	}
	
}