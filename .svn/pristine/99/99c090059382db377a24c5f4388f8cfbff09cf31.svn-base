package ib.schedule.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import ib.cmm.LoginVO;
import ib.cmm.util.fcc.service.StringUtil;
import ib.google.service.GoogleCalendarService;
import ib.google.service.impl.GoogleCalendarServiceImpl;
import ib.meetingRoom.service.impl.MeetingRoomDAO;
import ib.schedule.service.SpCmmVO;
import ib.schedule.service.Utill;
import ib.schedule.service.impl.CusDAO;
import ib.schedule.service.ScheduleService;
import ib.schedule.web.ScheduleController;

@Service("scheService")
public class ScheduleServiceImpl extends AbstractServiceImpl implements ScheduleService {
	
	@Resource(name = "scheDAO")
	private ScheduleDAO scheDAO;
	
	@Resource(name = "cusDAO")
	private CusDAO cusDAO;
	
	@Resource(name="meetingRoomDAO")
	MeetingRoomDAO meetingRoomDAO;
	
	// 등록된 달력 최대연도 불러오기
	public String GetCalNextYear() throws Exception {
		return scheDAO.GetCalNextYear();
	}
	
	// 달력 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCalendar(ScheduleVO vo) throws Exception {
		return scheDAO.GetCalendar(vo);
	}
	
	// 달력 생성
	public void MakeCalendar() throws Exception {
		SpCmmVO vo = new SpCmmVO();
		String NextYear = scheDAO.GetCalNextYear();
		vo.setSelYear(Integer.parseInt(NextYear));
		vo.setSearchSDate(NextYear+"-01-01");
		vo.setSearchEDate(NextYear+"-12-31");
		log.debug(vo.toString());
		scheDAO.MakeCalendar(vo);
	}
	
	// 선택시간 차량 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCarList(ScheduleVO vo) throws Exception {
		return scheDAO.GetCarList(vo);
	}
	
	// 선택일자 차량 사용 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCarUseList(ScheduleVO vo) throws Exception {
		return scheDAO.GetCarUseList(vo);
	}
	
	// 일정 SMS 알람 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetScheduleSMSList(ScheduleVO vo) throws Exception {
		return scheDAO.GetScheduleSMSList(vo);
	}
	
	// 일정 알람 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetScheduleAlarmList(ScheduleVO vo) throws Exception {
		return scheDAO.GetScheduleAlarmList(vo);
	}
	
	// 일정 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetScheduleList(ScheduleVO vo) throws Exception {
		return scheDAO.GetScheduleList(vo);
	}
	
	// 선택 일정 정보 받아오기
	public ScheduleVO GetScheInfo(ScheduleVO vo) throws Exception {
		return scheDAO.GetScheInfo(vo);
	}
	
	// 선택 일정 참가자 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetScheduleEntryList(ScheduleVO vo) throws Exception {
		return scheDAO.GetScheduleEntryList(vo);
	}
	
	// 선택 일정 완료 처리
	public void ScheduleChkEnd(ScheduleVO vo) throws Exception {
		scheDAO.ScheduleChkEnd(vo);
	}
	
	// 일정 등록을 위한 일정시퀀스 받아오기
	public String GetScheSeq() throws Exception {
		return scheDAO.GetScheSeq();
	}
	
	// 일정 일괄 등록 완료(기간일정, 반복일정)
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void ScheduleAllAddEnd(HttpServletRequest req, ScheduleVO vo, List list) throws Exception {
		log.debug(list.toString());
		
		//if(!vo.getScheRepetFlag().equals("None") && !vo.getScheSDay().equals(vo.getScheEDay()) ){
			scheDAO.ScheduleAllAddEnd(list);  // erp_schedule insert
		//}
		
		List<Map<String, Object>> ScheList = list;
		List<Map<String, Object>> EntryList = new ArrayList<Map<String, Object>>();
		
		if(vo.getScheGubun().equals("All")) {   // 			
			int EmpCnt = Integer.parseInt(req.getParameter("EmpCnt")) + 1;			
			List<Map<String, Object>> SMSList = new ArrayList<Map<String, Object>>();
			
			for(int i = 0; i < ScheList.size(); i++) {
				for(int m = 1; m < EmpCnt; m++) {
					Map<String, Object> EntryParam = new HashMap<String, Object>();
					
					EntryParam.put("ScheSeq", ScheList.get(i).get("ScheSeq"));
					EntryParam.put("PerSabun", req.getParameter("EntrySabunAry" + m));
					EntryParam.put("RegPerSabun", vo.getPerSabun());
					EntryParam.put("DelFlag", req.getParameter("EntryDelFlagAry" + m));
					
					EntryParam.put("tmpCpnId", vo.getTmpCpnId());
					EntryParam.put("tmpCstId", vo.getTmpCstId());
					
					if(req.getParameter("SMSSendFlag") != null && EntryParam.get("DelFlag").equals("N")) {	// 문자전송체크이면
						EntryParam.put("SMSTitle", "일정등록");
						EntryParam.put("SMSType", "3");
						EntryParam.put("SMSToNum", req.getParameter("EntryPhoneAry" + m));
						EntryParam.put("SMSFromNum", vo.getRegPerPhone());
						EntryParam.put("SMSContent", vo.getSMSContent());
						if(!EntryParam.get("SMSToNum").equals("")) SMSList.add(EntryParam);
					}
					
					// delflag가 N 인 경우만 add한다 
					if(!EntryParam.get("PerSabun").equals("") && "N".equals(req.getParameter("EntryDelFlagAry" + m)) ) 
						EntryList.add(EntryParam);
				}
			}
			//if(EntryList.size() > 0) scheDAO.ScheduleEntryProcEnd(EntryList);	// 일정 참가자 등록/수정 완료
			if(SMSList.size() > 0) cusDAO.SMSSendEnd(SMSList);					// 문자전송로그 등록 완료
			
		} else {  // 개인일정인경우
			//List<Map<String, Object>> ScheList = list;
			//List<Map<String, Object>> EntryList = new ArrayList<Map<String, Object>>();
			
			for(int i = 0; i < ScheList.size(); i++) {
				Map<String, Object> EntryParam = new HashMap<String, Object>();
				
				EntryParam.put("ScheSeq", ScheList.get(i).get("ScheSeq"));
				EntryParam.put("PerSabun", vo.getPerSabun());
				EntryParam.put("RegPerSabun", vo.getPerSabun());
				EntryParam.put("DelFlag", "N");
				
				EntryParam.put("tmpCpnId", vo.getTmpCpnId());
				EntryParam.put("tmpCstId", vo.getTmpCstId());
				
				if(!EntryParam.get("PerSabun").equals("")) 
					EntryList.add(EntryParam);
			}
		}
		
		
		
		//일정 참가자 등록
		if(EntryList.size() > 0) {
			scheDAO.ScheduleEntryProcEnd(EntryList);		// 일정 참가자 등록
		}
		
		//if(vo.getScheRepetFlag().equals("None") && vo.getSchePeriodFlag().equals("Y") && vo.getScheSDay().equals(vo.getScheEDay()) ){  // 반복아니고 당일 일정인 경우만 회의실 등록
		if(!StringUtil.isEmpty(vo.getScheGrpCd()) || vo.getSchePeriodFlag().equals("Y")){
			//회의실 예약 
			if(vo.getMeetingRoomUseFlag().equals("Y")){
				HashMap<String, Object>map = new HashMap();
				map.put("startDate", vo.getScheSDate());
				map.put("endDate", vo.getScheSDate());
				map.put("startTime", vo.getMeetStartTime());
				map.put("endTime", vo.getMeetEndTime());
				map.put("comment", vo.getScheTitle());
				map.put("meetingRoomId", vo.getMeetingRoomId());
				map.put("rsvId", vo.getRsvId());
				map.put("rsvUserId", vo.getPerSabun());
				map.put("userSeq", vo.getUserSeq());
				map.put("scheduleId",vo.getScheSeq());
				
				if(vo.getRsvId()!=0) meetingRoomDAO.updateRsvMeetingRoom(map);
				else  meetingRoomDAO.intsertRsvMeetingRoom(map);
			}else{
				if(vo.getRsvId()!=0){
					HashMap<String, Object>map = new HashMap();
					map.put("rsvId", vo.getRsvId());
					meetingRoomDAO.doDeleteRsvMeetingRoom(map);			// 회의실 예약 삭제
				}
			}
		}
		
		
	}
	
	/**
	 *  
	 * @Method Name : ScheduleAddEnd
	 * @descripton : 하루 일정 등록 (insert) 
	 * @date : 2017. 9. 11.
	 * @author : synergy
	 * @param : 
	 */
	public String ScheduleAddEnd(HttpServletRequest req, ScheduleVO vo) throws Exception {
		
		String seq = scheDAO.GetScheSeq();  
		vo.setScheSeq(seq);
		log.debug(vo.toString());
		
		scheDAO.ScheduleAddEnd(vo);  // insert
		
		
		if(vo.getScheGubun().equals("All")) {	// 개인일정이 아닌 경우
			int EmpCnt = Integer.parseInt(req.getParameter("EmpCnt")) + 1;
			List<Map<String, Object>> EntryList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> SMSList = new ArrayList<Map<String, Object>>();
			
			for(int oOo = 1; oOo < EmpCnt; oOo++) {
				Map<String, Object> EntryParam = new HashMap<String, Object>();
				
				EntryParam.put("ScheSeq", vo.getScheSeq());
				EntryParam.put("PerSabun", req.getParameter("EntrySabunAry" + oOo));
				EntryParam.put("RegPerSabun", vo.getPerSabun());
				EntryParam.put("DelFlag", req.getParameter("EntryDelFlagAry" + oOo));
				
				EntryParam.put("tmpCpnId", vo.getTmpCpnId());
				EntryParam.put("tmpCstId", vo.getTmpCstId());
				
				if(req.getParameter("SMSSendFlag") != null && EntryParam.get("DelFlag").equals("N")) {	// 문자전송체크이면
					EntryParam.put("SMSTitle", "일정등록");
					EntryParam.put("SMSType", "3");
					EntryParam.put("SMSToNum", req.getParameter("EntryPhoneAry" + oOo));
					EntryParam.put("SMSFromNum", "02-586-5981");
					EntryParam.put("SMSContent", vo.getSMSContent());
					if(!EntryParam.get("SMSToNum").equals("")) SMSList.add(EntryParam);
				}
//				if(!EntryParam.get("PerSabun").equals("")) EntryList.add(EntryParam);	기존방식.. 무조건 등록후 선별해서 출력 2015.01.14
				if(!EntryParam.get("PerSabun").equals("") && EntryParam.get("DelFlag").equals("N")) 
					EntryList.add(EntryParam);
			}
			
			//scheDAO.ScheduleEditEnd(vo);  // update
			
			if(EntryList.size() > 0) {
				scheDAO.ScheduleEntryDelEnd(vo);		// ERP_ScheduleEntry delete
				scheDAO.ScheduleEntryProcEnd(EntryList);	// 일정 참가자 일괄 등록/수정 insert
			}
			if(SMSList.size() > 0) 
				cusDAO.SMSSendEnd(SMSList);					// 문자전송로그 등록 완료
			
			for(int a = 0; a< SMSList.size(); a++) {
				System.out.println(SMSList.get(a));
			}
			
		}else{
			//scheDAO.ScheduleEditEnd(vo);  // update
			scheDAO.ScheduleEntryDelEnd(vo);		// ERP_ScheduleEntry delete
			scheDAO.ScheduleEntryAddEnd(vo);  // 참가자 
		}
		
		
		
		
		//회의실 예약 
		if(vo.getMeetingRoomUseFlag().equals("Y")){
			HashMap<String, Object>map = new HashMap();
			map.put("startDate", vo.getScheSDate());
			map.put("endDate", vo.getScheSDate());
			map.put("startTime", vo.getMeetStartTime());
			map.put("endTime", vo.getMeetEndTime());
			map.put("comment", vo.getScheTitle());
			map.put("meetingRoomId", vo.getMeetingRoomId());
			map.put("rsvId", vo.getRsvId());
			map.put("rsvUserId", vo.getPerSabun());
			map.put("userSeq", vo.getUserSeq());
			map.put("scheduleId",vo.getScheSeq());
			
			if(vo.getRsvId()!=0) meetingRoomDAO.updateRsvMeetingRoom(map);
			else  meetingRoomDAO.intsertRsvMeetingRoom(map);
		}else{
			if(vo.getRsvId()!=0){
				HashMap<String, Object>map = new HashMap();
				map.put("rsvId", vo.getRsvId());
				meetingRoomDAO.doDeleteRsvMeetingRoom(map);			// 회의실 예약 삭제
			}
		}
		
		
		return vo.getScheSeq();
	}
	
	// 선택된 반복 일정 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetRepetScheduleList(ScheduleVO vo) throws Exception {
		return scheDAO.GetRepetScheduleList(vo);
	}
	
	// 하루 일정인 경우 update
	@SuppressWarnings("rawtypes")
	public void scheduleUpdate(ScheduleVO vo) throws Exception {
		 scheDAO.ScheduleEditEnd(vo);
	}
	
	
	/**
	 * @Method     : ScheduleEditEnd
	 * @descripton : 일정 수정(하루짜리 일정)
	 * @date       : 2017. 9. 8.
	 * @author     : synergy
	 * @param      : HttpServletRequest req
	 * @param      : ScheduleVO vo
	 */
	public void ScheduleEditEnd(HttpServletRequest req, ScheduleVO vo) throws Exception {
		
		//일정정보수정(하루짜리 일정)
		scheDAO.ScheduleEditEnd(vo);
		
		
		//Alone 일때 참가자 리스트 재 입력을위해 처음에  지운다. 
		scheDAO.ScheduleEntryDelEnd(vo);		// ERP_ScheduleEntry delete
		
		if(vo.getScheGubun().equals("All")) {	// 그룹 구분이 all 경우
			int EmpCnt = Integer.parseInt(req.getParameter("EmpCnt")) + 1;			// 참가자 리스트
			List<Map<String, Object>> EntryList = new ArrayList<Map<String, Object>>();
			
			for(int i = 1; i < EmpCnt; i++) {	// 참가자 인원 전체 중 DelFlag가 N 인 사람(체크된 참가자)을 EntryList로 저장함
				Map<String, Object> EntryParam = new HashMap<String, Object>();
				
				EntryParam.put("ScheSeq",     vo.getScheSeq());
				EntryParam.put("PerSabun",    req.getParameter("EntrySabunAry" + i));
				EntryParam.put("RegPerSabun", vo.getPerSabun());
				EntryParam.put("DelFlag",     req.getParameter("EntryDelFlagAry" + i));
				EntryParam.put("tmpCpnId",    vo.getTmpCpnId());
				EntryParam.put("tmpCstId",    vo.getTmpCstId());
				EntryParam.put("grpCd",       vo.getGrpCd());
				
				System.out.println(EntryParam.get("PerSabun") +":"+EntryParam.get("DelFlag"));
//				if(!EntryParam.get("PerSabun").equals("")) EntryList.add(EntryParam);	기존방식.. 무조건 등록후 선별해서 출력 2015.01.14
				if(!EntryParam.get("PerSabun").equals("") && EntryParam.get("DelFlag").equals("N")) {
					EntryList.add(EntryParam);
				}
			}
			
			if(EntryList.size() > 0) {
				scheDAO.ScheduleEntryProcEnd(EntryList);		// 체크된 참가자를 ERP_ScheduleEntry 에 insert
			}
		} else{ 
			 scheDAO.ScheduleEntryAddEnd(vo);		// 개인일정일 경우 ERP_ScheduleEntry 에 insert
		}
		
		
		//회의실 예약 
		if(vo.getMeetingRoomUseFlag().equals("Y")){
			
			HashMap<String, Object>map = new HashMap();
			map.put("startDate", vo.getScheSDate());
			map.put("endDate", vo.getScheSDate());
			map.put("startTime", vo.getMeetStartTime());
			map.put("endTime", vo.getMeetEndTime());
			map.put("comment", vo.getScheTitle());
			map.put("meetingRoomId", vo.getMeetingRoomId());
			map.put("rsvId", vo.getRsvId());
			map.put("rsvUserId", vo.getPerSabun());
			map.put("userSeq", vo.getUserSeq());
			map.put("scheduleId",vo.getScheSeq());
			
			if(vo.getRsvId()!=0) meetingRoomDAO.updateRsvMeetingRoom(map);
			else  meetingRoomDAO.intsertRsvMeetingRoom(map);
		}else{
			if(vo.getRsvId()!=0){
				
				HashMap<String, Object>map = new HashMap();
				map.put("rsvId", vo.getRsvId());
				meetingRoomDAO.doDeleteRsvMeetingRoom(map);			// 회의실 예약 삭제
			}
		}
		
	}
	
	
	/**
	 * 일정 삭제
	 * 
	 * @Method Name : ScheduleDelEnd
	 * @date : 2017. 9. 8.
	 * @author : synergy
	 * @param :  ScheduleVO 
	 */
	public void ScheduleDelEnd(ScheduleVO vo) throws Exception {
		scheDAO.ScheduleDelEnd(vo);				// erp_schedule delflag = Y 로 update
		scheDAO.ScheduleEntryDelEnd(vo);		// ERP_ScheduleEntry DELETE
		
		//--회의실 내역 삭제
		HashMap map = new HashMap();
		map.put("scheduleId", vo.getScheSeq());
		meetingRoomDAO.doDeleteRsvMeetingRoom(map);
	}
	
	
	
	
	//모바일 일정 카운트 
	public List workCountList(Map<String, Object> map) throws Exception {
		
		return scheDAO.workCountList(map);
			
	}
	
	//일정 리스트
	public List scheduleListByMobile(SpCmmVO spCmmVO, ScheduleVO vo) throws Exception {
		
		
		vo.setScheGubun("Alone");
		//if(vo.getSearchPerSabun().equals("")) vo.setScheGubun("Alone");
		
		String Query = "";
	/*	if(vo.getScheGubun().equals("All")) {
			Query += "(";

			String selectUser = vo.getSearchPerSabun();
			String [] userArr =selectUser.split(",");
			for(int i = 0; i < userArr.length; i++) {
				if(i == 0) Query += "(RegPerSabun = '"+userArr[i]+"' OR Entry LIKE ('%"+userArr[i]+"%'))";
				else Query += " OR (RegPerSabun = '"+userArr[i]+"' OR Entry LIKE ('%"+userArr[i]+"%'))";
			}
			Query += ")";
			
		}
		
		else */
		
		Query += "((SchePublicFlag = 'N' AND RegPerSabun = '"+vo.getSearchPerSabun()+"') OR Entry LIKE ('%"+vo.getSearchPerSabun()+"%'))";
		vo.setSearchQuery(Query);
		
		vo.setPerSabun(vo.getSearchPerSabun());
		
		if(vo.getScheType().equals("") || vo.getEventType().equals("Add")) vo.setScheType("AllType");
		
		vo.setScheSYear(Integer.toString(spCmmVO.getSelYear()));
		vo.setScheSMonth(Integer.toString(spCmmVO.getSelMonth()));
		
		System.out.println(vo.getOnlySche());
		
		return scheDAO.GetScheduleList(vo);
	}
	
	//달력(휴일) 데이터
	public List getCalendarList(Map<String, Object> map) throws Exception {
		
		return scheDAO.getCalendarList(map);
	}
	
	//기간일정 프로세스 서비스로 분리 
	public List scheListForPeriod(ScheduleVO vo)throws Exception{
		
		
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
			
			String seq = GetScheSeq();
			
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
			
			paramTemp.put("tmpCpnId", vo.getTmpCpnId());
			paramTemp.put("tmpCstId", vo.getTmpCstId());
			
			paramTemp.put("grpCd", vo.getGrpCd());
			
			list.add(paramTemp);
		}
		return list;
		
		
	}
	
	//일정 수정 로직 서비스로 뺌(기간일정일때)
	public void schduleEditPeriodMobileService(HttpServletRequest req,ScheduleVO vo) throws Exception {
		
		ScheduleDelEnd(vo);
		vo.setScheGrpCd("Period");
		
		//신규 그룹코드 생성 (시간 + 사번)
		vo.setGrpCd(Long.toString(System.currentTimeMillis()) + ((LoginVO)req.getSession().getAttribute("userLoginInfo")).getSabun());  // grpCd insert
		
		List list = scheListForPeriod(vo); 
		
		if(list.size() > 0) ScheduleAllAddEnd(req, vo, list);
		
	}
	
	//일정 삭제 로직 서비스로 뺌(기간일정일때)
	public void schduleDelPeriodMobileService(ScheduleVO vo) throws Exception {
		
		ScheduleController ScheduleCon = new ScheduleController();
		
		List<Map<String, Object>> RepetScheduleList = GetRepetScheduleList(vo);
		for(int i = 0; i < RepetScheduleList.size(); i++) {
			ScheduleDelEnd(ScheduleCon.GetRepetScheduleData(vo, RepetScheduleList.get(i)));
		}
		
	}

	public List getCarUseYnList(ScheduleVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}