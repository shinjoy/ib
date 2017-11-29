package ib.schedule.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ib.cmm.service.impl.ComAbstractDAO;
import ib.schedule.service.SpCmmVO;


@Repository("scheDAO")
public class ScheduleDAO extends ComAbstractDAO {
	// 달력 생성을 위한 년도 불러오기
	public String GetCalNextYear() throws Exception {
		return (String)selectByPk("scheDAO.GetCalNextYear", "");
	}
	
	// 달력 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCalendar(ScheduleVO vo) throws Exception {
		return list("scheDAO.GetCalendar", vo);
	}
	
	// 달력 생성
	public void MakeCalendar(SpCmmVO vo) throws Exception {
		insert("scheDAO.MakeCalendar", vo);
		insert("scheDAO.UpdateCalendar", vo);
	}
	
	// 선택시간 차량 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCarList(ScheduleVO vo) throws Exception {
		return list("scheDAO.GetCarList", vo);
	}
	
	// 선택일자 차량 사용 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCarUseList(ScheduleVO vo) throws Exception {
		return list("scheDAO.GetCarUseList", vo);
	}
	
	
	// 선택일자(시간) 내에 사용되고 있는 차량 조회 170912 jin 
	@SuppressWarnings("rawtypes")
	public List getCarUseYnList(ScheduleVO vo) throws Exception {
		return list("scheDAO.getCarUseYnList", vo);
	}
	
	
	
	// 일정 SMS 알람 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetScheduleSMSList(ScheduleVO vo) throws Exception {
		return list("scheDAO.GetScheduleSMSList", vo);
	}
	
	// 일정 알람 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetScheduleAlarmList(ScheduleVO vo) throws Exception {
		return list("scheDAO.GetScheduleAlarmList", vo);
	}
	
	// 일정 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetScheduleList(ScheduleVO vo) throws Exception {
		return list("scheDAO.GetScheduleList", vo);
	}
	
	// 선택 일정 정보 받아오기
	public ScheduleVO GetScheInfo(ScheduleVO vo) throws Exception {
		return (ScheduleVO)selectByPk("scheDAO.GetScheInfo", vo);
	}
	
	// 선택일정 참가자 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetScheduleEntryList(ScheduleVO vo) throws Exception {
		return list("scheDAO.GetScheduleEntryList", vo);
	}
	
	// 선택 일정 완료 처리
	public void ScheduleChkEnd(ScheduleVO vo) throws Exception {
		update("scheDAO.ScheduleChkEnd", vo);
	}
	
	// 일정 등록을 위한 일정시퀀스 받아오기
	public String GetScheSeq() throws Exception {
		return (String)selectByPk("scheDAO.GetScheSeq", "");
	}
		
	// 일정 일괄 등록 완료
	@SuppressWarnings("rawtypes")
	public void ScheduleAllAddEnd(List list) throws Exception {
		insert("scheDAO.ScheduleAllAddEnd", list);
	}
	
	// 일정 등록 완료
	public void ScheduleAddEnd(ScheduleVO vo) throws Exception {
		insert("scheDAO.ScheduleAddEnd", vo);
	}
	
	// 일정 참가자 일괄 등록
	@SuppressWarnings("rawtypes")
	public void ScheduleEntryProcEnd(List list) throws Exception {
		insert("scheDAO.ScheduleEntryProcEnd", list);
	}
	
	// 개인일정일시 작성자 참가 등록 완료
	public void ScheduleEntryAddEnd(ScheduleVO vo) throws Exception {
		insert("scheDAO.ScheduleEntryAddEnd", vo);
	}
	
	// 선택된 반복 일정 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetRepetScheduleList(ScheduleVO vo) throws Exception {
		return list("scheDAO.GetRepetScheduleList", vo);
	}
	
	// 일정 수정
	public void ScheduleEditEnd(ScheduleVO vo) throws Exception {
		update("scheDAO.ScheduleEditEnd", vo);
	}
	
	// 일정 삭제
	public void ScheduleDelEnd(ScheduleVO vo) throws Exception {
		update("scheDAO.ScheduleDelEnd", vo);
	}
	
	// 일정 참가자 삭제
	public void ScheduleEntryDelEnd(ScheduleVO vo) throws Exception {
		delete("scheDAO.ScheduleEntryDelEnd", vo);
	}

	// 구글캘린더 등록된 이벤트ID 업데이트
	public void UpdateScheduleCalendarEventId(Map param){
		update("scheDAO.UpdateScheduleCalendarEventId", param);
	}
	
	// 일정에 등록된 이벤트ID 조회
	public String GetScheEventId(Map param) throws Exception {
		return (String)selectByPk("scheDAO.GetScheEventId", param);
	}
	
	//모바일 일정 카운트 
	public List workCountList(Map<String, Object> map) throws Exception {
		return list("scheDAO.workCountList", map);
	}
	
	//달력 (휴일) 데이터
	public List getCalendarList(Map<String, Object> map) throws Exception {
		return list("scheDAO.getCalendarList", map);
	}
	
}