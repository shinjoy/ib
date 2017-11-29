package ib.mobile.web;

import ib.cmm.LoginVO;
import ib.cmm.service.CommonService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.meetingRoom.service.MeetingRoomService;
import ib.push.service.PushService;
import ib.push.service.PushVO;
import ib.schedule.service.CusService;
import ib.schedule.service.FormDocService;
import ib.schedule.service.ScheduleService;
import ib.schedule.service.SpCmmVO;
import ib.schedule.service.Utill;
import ib.schedule.service.impl.ScheduleVO;
import ib.schedule.web.ScheduleController;
import ib.work.service.WorkDiaryService;
import ib.work.service.WorkMemoService;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.security.util.TextUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import egovframework.rte.fdl.property.EgovPropertyService;


@Controller
public class MbScheduleController {
	
	@Resource(name = "cusService")
	private CusService cusService;
	
	@Resource(name = "scheService")
	private ScheduleService scheService;
	
	@Resource(name = "formService")
	private FormDocService formService;
	
	@Resource(name = "meetingRoomService")
    private MeetingRoomService meetingRoomService;	
	
    @Resource(name = "workDiaryService")
    WorkDiaryService workDiaryService;
    
    @Resource(name = "workMemoService")
    WorkMemoService workMemoService;

	@Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@Resource(name = "pushService")
	private PushService pushService;
	
	
	private PushVO pushVO = new PushVO();
	
	ScheduleController ScheduleCon = new ScheduleController();

	
	//일정 리스트 
	@RequestMapping(value = "/MbScheduleList.do")
	public String MbScheduleList(
			HttpServletRequest req,HttpSession session, 
			ScheduleVO vo, Model model) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
		
		vo.setEventType("mobile");
		model.addAttribute("vo", vo);
		
		return "m/schedule/MbScheduleList";
	}
	
	//일정 달력
	@RequestMapping(value = "/MbScheduleCal.do")
	public String scheduleCal(
			HttpServletRequest req,HttpSession session, 
			ScheduleVO vo, Model model) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
		
		vo.setEventType("mobile");
		model.addAttribute("vo", vo);
		
		return "m/schedule/MbScheduleCal";
	}
	
	// 달력 데이터 그리기
	@RequestMapping(value = "m/schedule/calendarDate.do")
	public void calendarDate(
			@ModelAttribute("spCmmVO") SpCmmVO spCmmVO,
			HttpServletRequest req,
			HttpServletResponse response,
			ScheduleVO vo, 
			Model model, HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		Map resultMap = new HashMap();
		
		int cnt =0;
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		if(loginUser == null){
			
			cnt=-8;
			
		}else{
			resultMap.put("type", "schedule");
			
			map.put("selectYM", vo.getScheSYear()+"-"+vo.getScheSMonth());	//'2017-06'
			map.put("calYear", vo.getScheSYear());		//2017
			map.put("mm", vo.getScheSMonth());			//06
			map.put("calMonth", spCmmVO.getSelMonth());	//6
			
			//------- inside origin start
			
			spCmmVO = ScheduleCon.GetCalData(spCmmVO);
			resultMap.put("nextMonthEnd", 7 - spCmmVO.getEndPosition() + 7);
	
			vo.setScheGubun("");
			vo.setPerSabun(loginUser.getSabun());
			vo.setSearchPerSabun(loginUser.getSabun());
			vo.setScheSDate("");
			vo.setScheSYear(Integer.toString(spCmmVO.getSelYear()));
			vo.setScheSMonth(Integer.toString(spCmmVO.getSelMonth()));
			
			
			map.put("type", "holiday");
			
		
			List holidayList = scheService.getCalendarList(map);
			resultMap.put("holidayList", holidayList);
			
			if(spCmmVO.getSelMonth() == 12) {
				vo.setScheSYear(Integer.toString(spCmmVO.getSelYear() + 1));
				vo.setScheSMonth(Integer.toString(1));
			}else{
				vo.setScheSMonth(Integer.toString(spCmmVO.getSelMonth() + 1));
			}
	
			map.put("gapBeforeMonth", spCmmVO.getStartPosition());					//전달 갯수
			map.put("endDay", spCmmVO.getEndDay());									//이달의 마지막 날
			
			map.put("sabun", loginUser.getSabun());
			
			
			if( map.get("openPage").equals("list") ){	//목록형
				
				vo.setOnlySche("Y");
				//업무 메모 일정 리스트 
				
				List <Map> dataList = new ArrayList();
				
				if(map.get("tabType").equals("WorkDiary"))	dataList = workDiaryService.getWorkListByNoPaging(map);
				if(map.get("tabType").equals("Schedule"))	dataList = scheService.scheduleListByMobile(spCmmVO,vo);
				if(map.get("tabType").equals("Memo"))		dataList = workMemoService.getMemoListForMobile(map);
				
				resultMap.put("dataList", dataList);
				
			}else{
				//업무 + 메모 + 일정 갯수 
				List <Map> workCountList = scheService.workCountList(map);
				resultMap.put("dataList", workCountList);
			}
			
			cnt =1;
			
		}	
			
			
		resultMap.put("dateVO", spCmmVO);
		resultMap.put("vo", map);
		resultMap.put("cnt", cnt);
		
		AjaxResponse.responseAjaxMap(response, resultMap);

		
	}
	
	//전체 리스트 가져오기
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "m/schedule/getAllScheduleList.do")
	public void getAllScheduleList(@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, HttpServletRequest req,
			@RequestParam Map<String,Object>map,
			HttpServletResponse response,HttpSession session,
			ScheduleVO vo, ModelMap model) throws Exception {
		
		Map resultMap = new HashMap();
	
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		vo.setSearchPerSabun(loginUser.getSabun());
		
		List<Map>scheduleList =scheService.scheduleListByMobile(spCmmVO,vo);	//스케쥴
		
		map.put("sabun", loginUser.getSabun());
		map.put("selectDate", vo.getScheSDate());
		List<Map>workDiaryList =workDiaryService.getWorkListByNoPaging(map);
		
		List<Map>memoList =workMemoService.getMemoListForMobile(map);
		
		System.out.println(scheduleList.size());
		resultMap.put("scheduleList", scheduleList);
		resultMap.put("workDiaryList", workDiaryList);
		resultMap.put("memoList", memoList);
		
		AjaxResponse.responseAjaxObject(response, resultMap);
		
	}
	
	//일정 리스트 가져오기
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "m/schedule/getScheduleList.do")
	public void getScheduleList(@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, HttpServletRequest req,
			HttpServletResponse response,HttpSession session,
			ScheduleVO vo, ModelMap model) throws Exception {
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		vo.setSearchPerSabun(loginUser.getSabun());
		
		List<Map>list =scheService.scheduleListByMobile(spCmmVO,vo);
		
		AjaxResponse.responseAjaxSelect(response, list);
		
	}

	
	// 처음화면. 
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/getScheduleList.do")
	public void getScheduleList(
			@ModelAttribute("spCmmVO") SpCmmVO spCmmVO,HttpServletResponse response,
			HttpServletRequest req,HttpSession session, ScheduleVO vo, Model model) throws Exception {
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		String searchSDate="";
		if(vo.getSearchSDate()!=""){
			searchSDate =vo.getSearchSDate();
		}
		if( vo.getSearchPerSabun().equals("")) vo.setScheGubun("Alone");
		//alone 로그인한 사람의 사번이 아닐경우 세팅.
		if(!vo.getScheGubun().equals("All")&&loginUser.getSabun() != vo.getSearchPerSabun()){
			vo.setScheGubun("All");
		}
		String Query = "";
		if(vo.getScheGubun().equals("All")) {
		
			Query += "(";
			String selectUser = vo.getSearchPerSabun();
			String [] userArr =selectUser.split(",");
			for(int i = 0; i < userArr.length; i++) {
				if(i == 0) Query += "(RegPerSabun = '"+userArr[i]+"' OR Entry LIKE ('%"+userArr[i]+"%'))";
				else Query += " OR (RegPerSabun = '"+userArr[i]+"' OR Entry LIKE ('%"+userArr[i]+"%'))";
			}
			Query += ")";
		}
		else Query += "((SchePublicFlag = 'N' AND RegPerSabun = '"+vo.getSearchPerSabun()+"') OR Entry LIKE ('%"+vo.getSearchPerSabun()+"%'))";
		
	
		vo.setSearchQuery(Query);
		vo.setEventType("mobile");
		vo.setScheSDate(searchSDate);
		vo.setScheSYear(searchSDate.substring(0,4));
		vo.setScheSMonth(Integer.toString(Integer.parseInt(searchSDate.substring(5,7))));
		if(vo.getScheType().equals("") || "Y".equals(req.getParameter("regTime"))) vo.setScheType("AllType");	// 분류지정
		
		List TodayList =scheService.GetScheduleList(vo);
		AjaxResponse.responseAjaxSelect(response, TodayList);
		
	}
	
	// 선택일정 상세보기
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/m/schedule/scheduleViewPop_openLayer.do")
	public String MbScheduleView(
			@RequestParam Map map,HttpSession session,
			@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, ScheduleVO vo, Model model) throws Exception {
	
		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
		
		model.addAttribute("vo", vo);
		model.addAttribute("message", spCmmVO.getInfoMessage());
		return "m/schedule/MbScheduleView";
	}
	
	// 선택일정 상세보기
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/m/schedule/getScheduleData.do")
	public void getScheduleData(
			@RequestParam Map map,HttpServletResponse response,
			@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, ScheduleVO vo, Model model) throws Exception {
		
		try{
			Map resultMap = new HashMap();
		
		
		ScheduleVO scheVO = scheService.GetScheInfo(vo);
		resultMap.put("scheVO", scheVO);
		
	
		List ScheduleEntryList = scheService.GetScheduleEntryList(vo);
		resultMap.put("scheduleEntryList", ScheduleEntryList);
		resultMap.put("scheduleEntryCnt", ScheduleEntryList.size());
		
		//--회의실 내역
		HashMap mMap = new HashMap();
		mMap.put("scheduleId", vo.getScheSeq());
		
		List<Map> list = meetingRoomService.getMeetingRoomRsvList(mMap);
		
		resultMap.put("meetingRoom", list);
		AjaxResponse.responseAjaxObject(response, resultMap);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
	}
	
	
	// 일정 등록 페이지
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/m/schedule/scheduleProcPop_openLayer.do")
	public String MbScheduleProc(@ModelAttribute("spCmmVO") SpCmmVO spCmmVO,HttpSession session, ScheduleVO vo, Model model) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
		
		spCmmVO = ScheduleCon.GetCalData(spCmmVO);
		model.addAttribute("dateVO", spCmmVO);
		
		
		if(!vo.getScheSeq().equals("")) {	//수정시 데이터
			ScheduleVO scheVO = scheService.GetScheInfo(vo);
			model.addAttribute("scheVO", scheVO);
			
			List ScheduleEntryList = scheService.GetScheduleEntryList(vo);
			model.addAttribute("ScheduleEntryList", ScheduleEntryList);
			model.addAttribute("ScheduleEntryCnt", ScheduleEntryList.size());
		}
		
		List EmpList = formService.GetPerList();
		HashMap map = new HashMap();
		map.put("scheduleId", vo.getScheSeq());
		
		List<Map> list = meetingRoomService.getMeetingRoomRsvList(map);
		
		Map objMap = new HashMap();
		
		if(list.size() == 0) objMap = null;
		else objMap=list.get(0);
		
		model.addAttribute("meetingRoom", objMap);
		model.addAttribute("meetingRoomChk", list.size());
		model.addAttribute("CarList", scheService.GetCarList(vo));
		model.addAttribute("vo", vo);
		
		return "m/schedule/MbScheduleProc";
	}
	
	// 선택시간 차량 사용여부 받아오기
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "m/schedule/enableCarList.do")
	public void enableCarList(ScheduleVO vo, 
			HttpServletRequest req,
			HttpServletResponse response,
			HttpSession session,
			Model model) throws Exception {
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		vo.setPerSabun(loginUser.getSabun());						//사용자 회사 사용가능 차량만 불러온다
				
		List datalist = scheService.GetCarList(vo);
		
		
	
		AjaxResponse.responseAjaxSelect(response, datalist);
		
	}
	
	
	// 일정 등록 완료
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "m/schedule/scheduleAddEnd.do")
	public void ScheduleAddEnd(HttpServletRequest req, HttpServletResponse response,HttpSession session,
			ScheduleVO vo, BindingResult bindingResult, Model model, SessionStatus status
			) throws Exception {
		
		beanValidator.validate(vo, bindingResult);
		
		int saveCnt =0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
			
			vo.setRegPerSabun(loginUser.getSabun());
			vo.setPerSabun(loginUser.getSabun());						//사용자 회사 사용가능 차량만 불러온다
			
			//사용 가능 차량을 예약했는지 판별
			boolean chkEnableCar = true;
			
			if(vo.getCarUseFlag().equals("Y")){
				List datalist = scheService.GetCarList(vo);
				if(datalist.size() > 0) chkEnableCar = false;
			}
			
			
			if(chkEnableCar){
			
				// 신규 그룹코드 추가
				vo.setGrpCd(Long.toString(System.currentTimeMillis()) + loginUser.getSabun());
				
				if(vo.getScheGubun().equals("All")) vo.setSchePublicFlag("Y");
		
				if(vo.getSchePeriodFlag().equals("Y")) vo.setScheRepetFlag("None");
				
				if(!vo.getScheRepetFlag().equals("None")) {	// 반복일정이면..
					//vo.setScheGrpCd(Long.toString(System.currentTimeMillis()));
					//List list = ScheduleCon.ScheduleAddProc(vo);	//오류일것33333333333333333333333333333333333333333333333333333
					//if(list.size() > 0) scheService.ScheduleAllAddEnd(req, vo, list);
				}else if(vo.getSchePeriodFlag().equals("Y")) { // 기간일정이면
					vo.setScheGrpCd("Period");
					List list = scheService.scheListForPeriod(vo);
					if(list.size() > 0) scheService.ScheduleAllAddEnd(req, vo, list);
				}else{
					
					String seq =scheService.ScheduleAddEnd(req, vo);
					
					//--푸쉬 세팅
					int EmpCnt = Integer.parseInt(req.getParameter("EmpCnt")) + 1;
					
					List <String> entrySabunList = new ArrayList();

					for(int i = 1; i < EmpCnt; i++) {
						if(!(req.getParameter("EntrySabunAry" + i)).equals("")  && (req.getParameter("EntryDelFlagAry" + i)).equals("N")){
							entrySabunList.add(req.getParameter("EntrySabunAry" + i));
						}
					}
					
					

					
					try{
						//푸쉬 추가 로직 (신규일때만)
						if(entrySabunList.size()>0){
							
							Map map = new HashMap();
							String commentReal = vo.getScheTitle();
							map.put("pushType", pushVO.ptSchedule);
							map.put("sabunList", entrySabunList.toString().replace("[", "").replace("]", "").replace(", ", ","));
							map.put("sendMeYn", "Y");
							map.put("pushTypeId", seq);
							map.put("content", "[일정등록]"+loginUser.getName()+" "+vo.getScheSDate().replaceAll("-", ".")+" "+ ( commentReal.length() >40 ? commentReal.substring(0,40) : commentReal));
							map.put("rgUserId", loginUser.getStaffSnb());
							pushService.insertPushLogSearchSabunList(map);
						}
						
					}catch(Exception e){
						
						
					}
					
				}
				
				saveCnt =1;
				
			}else saveCnt = -5;		//이미 등록된 차량 
		}
		
		AjaxResponse.responseAjaxSave(response, saveCnt);
		
		
	}
	
	// 일정 수정 완료
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "m/schedule/scheduleEditEnd.do")
	public void mobileToScheduleEditEnd(
			HttpServletRequest req, HttpServletResponse response,HttpSession session,
			ScheduleVO vo, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
		beanValidator.validate(vo, bindingResult);
	
		req.setCharacterEncoding("UTF-8");
		
		int saveCnt =0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
			
			//사용 가능 차량을 예약했는지 판별
			boolean chkEnableCar = true;
			
			if(vo.getCarUseFlag().equals("Y")){
				
				List datalist = scheService.GetCarList(vo);
				if(datalist.size() > 0) chkEnableCar = false;
			}
			
			
			if(chkEnableCar){
	
				if(!vo.getScheGrpCd().equals("")) {	// 기간 & 반복 일정수정 (모바일 반복일정 수정 불가 - 기간만 가능)
				
					if(vo.getSchePeriodFlag().equals("Y")) { // 기간일정이면
						
						scheService.schduleEditPeriodMobileService(req,vo);
					}
					
				}else {
					scheService.ScheduleEditEnd(req, vo);
				}
				
				saveCnt =1;
				
			}else saveCnt = -5;		//이미 등록된 차량 
		}
		
		AjaxResponse.responseAjaxSave(response, saveCnt);
	}
	
	// 일정 삭제 완료
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "m/schedule/scheduleDelete.do")
	public void scheduleDelEnd(
			HttpServletRequest req, HttpServletResponse response,HttpSession session,
			ScheduleVO vo, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
			
		beanValidator.validate(vo, bindingResult);

		int saveCnt =0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
		
			/*if(!vo.getScheGrpCd().equals("") && !vo.getProcFlag().equals("alone")) {	//기간 반복일정 삭제
				
				scheService.schduleDelPeriodMobileService(vo);
				
			}
			else scheService.ScheduleDelEnd(vo);*/
			
			scheService.ScheduleDelEnd(vo);
			
			saveCnt =1;
		}
		
		AjaxResponse.responseAjaxSave(response, saveCnt);
		
	}

	
	
	// 선택 일정 완료 처리
	@RequestMapping(value = "/m/changeScheduleProcess.do")
	public void changeScheduleProcess(
			ScheduleVO vo, BindingResult bindingResult,HttpSession session, 
			HttpServletResponse response,
			Model model, SessionStatus status) throws Exception {
		
		int saveCnt =0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
			scheService.ScheduleChkEnd(vo);
			saveCnt =1;
		}
		
		AjaxResponse.responseAjaxSave(response, saveCnt);
	}
	
	
	
	
}