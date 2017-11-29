package ib.meetingRoom.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Service;

import ib.meetingRoom.service.MeetingRoomService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("meetingRoomService")
public class MeetingRoomServiceImpl extends AbstractServiceImpl implements MeetingRoomService {
	
	@Resource(name="meetingRoomDAO")
	MeetingRoomDAO meetingRoomDAO;
	
	
	
	//회의실 예약 내역
	public List<Map> getMeetingRoomRsvList(Map<String, Object> map) throws Exception {
		
		//list에 회의실명 추가 20170907 ksm
		Map<String, Object> midMap = new HashMap<String, Object>();
		List<Map> list = meetingRoomDAO.getMeetingRoomRsvList(map);
		Map mInfo = null;
		
		for(int i=0;i<list.size();i++){
			midMap.put("meetingRoomId", list.get(i).get("meetingRoomId"));		//일정seq로 예약한 회의실id 받아오기
			mInfo = meetingRoomDAO.getMeetingRoomInfo(midMap);					//회의실id로 회의실정보 받아오기
			if(mInfo != null) list.get(i).put("meetingRoomNm", mInfo.get("meetingRoomNm"));		//list에 회의실명 추가	
		}
		
		return list;
	}
	
	//스케줄 내역
	public List<Map> getScheduleList(Map<String, Object> map) throws Exception {
		
		return meetingRoomDAO.getScheduleList(map);
	}
	
	//회의실 예약 하기( 등록.수정)
	public int doSaveRsvMeetingRoom(Map<String, Object> map) throws Exception {
		
		String rsvId = map.get("rsvId").toString();
		int cnt = 0;
		
		if(rsvId.equals("0")) cnt = meetingRoomDAO.intsertRsvMeetingRoom(map);
		else cnt =  meetingRoomDAO.updateRsvMeetingRoom(map);
		
		return cnt;
	}
	
	
	//삭제
	public void doDeleteRsvMeetingRoom(Map<String, Object> map)throws Exception{
		
		 meetingRoomDAO.doDeleteRsvMeetingRoom(map);
	}

	
	//회의실 목록
	public List getMeetingRoomList(Map<String, Object> map) throws Exception {
		return meetingRoomDAO.getMeetingRoomList(map);
	}
	
	
	//회의실 등록( 등록.수정)
	public int doSaveMeetingRoom(Map<String, Object> map) throws Exception {
		
		String meetingRoomId = map.get("meetingRoomId").toString();
		int cnt = 0;
		
		if(meetingRoomId.equals("0")) cnt = meetingRoomDAO.intsertMeetingRoom(map);
		else cnt =  meetingRoomDAO.updateMeetingRoom(map);
		
		return cnt;
	}
	
	
	//순서변경
	public int doSortChange(Map<String, Object> map) throws Exception {
		
		String sortListStr = map.get("sortList").toString();

		TypeReference<List<Map>> mapType = new TypeReference<List<Map>>() {};
		List<Map> sortList = new ObjectMapper().readValue(sortListStr, mapType);

		for(int i=0;i<sortList.size();i++){
			Map objMap = sortList.get(i);
			objMap.put("userSeq",map.get("userSeq"));
			meetingRoomDAO.updateMeetingRoom(objMap);
		}
		
		return 1;
	}
		
		
	
	
	/*
	public List<Map> selectLimitCarLogList(Map<String, Object> param)throws Exception{
		// TODO Auto-generated method stub
		return car2Dao.selectLimitCarLogList(param);
	}
	
	public List<Map> selectScheList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return car2Dao.selectScheList(map);
	}
	
	public int insertCarLog(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return car2Dao.intsertCarLog(map);
	}
	
	public List<Map> chkDistance(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return  car2Dao.chkDistance(map);
	}
	
	public String selectCarName(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return car2Dao.selectCarName(map);
	}
	
	public  String maxDistance(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return car2Dao.maxDistance(map);
	}*/
	
	
	
}
