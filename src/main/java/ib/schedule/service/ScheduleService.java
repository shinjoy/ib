package ib.schedule.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import ib.schedule.service.impl.ScheduleVO;

public interface ScheduleService {
	
	String GetCalNextYear() throws Exception;													// 등록된 달력 최대연도 불러오기
	@SuppressWarnings("rawtypes")
	List GetCalendar(ScheduleVO vo) throws Exception;											// 달력 받아오기
	void MakeCalendar() throws Exception;														// 달력 생성
	@SuppressWarnings("rawtypes")
	List GetCarList(ScheduleVO vo) throws Exception;											// 선택시간 차량 리스트 받아오기
	@SuppressWarnings("rawtypes")
	List GetCarUseList(ScheduleVO vo) throws Exception;											// 선택일자 차량 사용 리스트 받아오기
	
	@SuppressWarnings("rawtypes")
	List getCarUseYnList(ScheduleVO vo) throws Exception;	
	
	
	@SuppressWarnings("rawtypes")
	List GetScheduleSMSList(ScheduleVO vo) throws Exception;									// 일정 SMS 리스트 받아오기
	@SuppressWarnings("rawtypes")
	List GetScheduleAlarmList(ScheduleVO vo) throws Exception;									// 일정 알람 리스트 받아오기
	@SuppressWarnings("rawtypes")
	List GetScheduleList(ScheduleVO vo) throws Exception;										// 일정 리스트 받아오기
	ScheduleVO GetScheInfo(ScheduleVO vo) throws Exception;										// 선택 일정 정보 받아오기
	@SuppressWarnings("rawtypes")
	List GetScheduleEntryList(ScheduleVO vo) throws Exception;									// 선택 일정 참가자 리스트 받아오기
	void ScheduleChkEnd(ScheduleVO vo) throws Exception;										// 선택 일정 완료 처리
	String GetScheSeq() throws Exception;														// 일정 등록을 위한 일정시퀀스 받아오기
	@SuppressWarnings("rawtypes")
	void ScheduleAllAddEnd(HttpServletRequest req, ScheduleVO vo, List list) throws Exception;	// 일정 일괄 등록 완료
	String ScheduleAddEnd(HttpServletRequest req, ScheduleVO vo) throws Exception;				// 일정 등록 완료
	@SuppressWarnings("rawtypes")
	List GetRepetScheduleList(ScheduleVO vo) throws Exception;									// 선택된 반복 일정 리스트 받아오기
	void ScheduleEditEnd(HttpServletRequest req, ScheduleVO vo) throws Exception;				// 일정 수정 완료
	void ScheduleDelEnd(ScheduleVO vo) throws Exception;										// 일정 삭제 완료
	
	void scheduleUpdate(ScheduleVO vo) throws Exception;				// 하루 일정 update
	
	
	//모바일 
	
	//일정 카운트
	List workCountList(Map<String,Object> map) throws Exception;
	
	//일정 리스트
	List scheduleListByMobile(SpCmmVO spCmmVO, ScheduleVO vo) throws Exception;
	
	//달력 (휴일) 데이터
	List getCalendarList(Map<String,Object> map) throws Exception;
	
	//기간일정 프로세스 서비스로 분리 
	List scheListForPeriod(ScheduleVO vo) throws Exception;			
	
	//일정 수정 로직 서비스로 뺌(기간일정일때)
	void schduleEditPeriodMobileService(HttpServletRequest req,ScheduleVO vo) throws Exception;	
	
	//일정 삭제 로직 서비스로 뺌(기간일정일때)
	void schduleDelPeriodMobileService(ScheduleVO vo) throws Exception;		
}