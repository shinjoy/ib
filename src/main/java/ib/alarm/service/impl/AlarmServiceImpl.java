package ib.alarm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ib.alarm.service.AlarmService;
import ib.car.service.Car2Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("alarmService")
public class AlarmServiceImpl extends AbstractServiceImpl implements AlarmService {
	
	@Resource(name="alarmDAO")
	AlarmDAO alarmDao;
	
	//알림 리스트
	public Map<String, Object> getAlarmList(Map<String, Object> param) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		//parameter
		int pageSize = Integer.parseInt(param.get("pageSize").toString());
		int pageNo 	 = Integer.parseInt(param.get("pageNo").toString());
		
		map.put("pageNo", param.get("pageNo"));							//넘어온 검색페이지번호도 세팅해서 그대로 반환해준다.
		
		int totalCount = alarmDao.getAlarmListCount(param);				//총 건수
		map.put("totalCount", totalCount);
		
		int pageCount = (totalCount/Integer.parseInt(param.get("pageSize").toString()));
		pageCount = (totalCount>pageCount*pageSize)?pageCount+1:pageCount;		//총 페이지수 ... (총수/페이지크기)떨어지는지, 절삭하는지 확인하여 총페이지크기를 (+1)여부결정
		map.put("pageCount", pageCount);										//총 페이지수
		
		param.put("offset", (pageNo-1) * pageSize);
		param.put("limit", Integer.parseInt(param.get("pageSize").toString()));	//페이지크기 pageSize
		map.put("list", alarmDao.getAlarmList(param));				//목록리스트
		
		return map;		//Map map: pageNo(페이지번호), totalCount(총 건수), pageCount(총 페이지수), list(리스트)
	}
	
	//알림 상세
	public List<Map> getAlarmDetail(Map<String, Object> map)throws Exception {
		 List list =alarmDao.getAlarmList(map);
		 return list;
	}
	//알림 저장
	public int saveAlarm(Map<String, Object> map) throws Exception {
		int alarmId=0;
		if(map.get("alarmId").equals("0")){		//신규
			alarmId=Integer.parseInt(alarmDao.insertAlarm(map));
		}else{
			alarmDao.updateAlarm(map);			//수정
			alarmId=Integer.parseInt((String)map.get("alarmId"));
		}
		return alarmId;
	}
	//알림 삭제
	public void deleteAlarm(Map<String, Object> map) throws Exception {
		alarmDao.deleteAlarm(map);			
		alarmDao.deleteAlarmTarget(map);
	}

	//알림 팝업 정보 반환
	public Map<String, Object> selectPopupInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return alarmDao.selectPopupInfo(map);
	}
	
	//알림 팝업창 조건에 부합하는지 확인
	public Map<String, Object> selectPopUser(Map<String, Object> map) throws Exception{
		return alarmDao.selectPopUser(map);
	}
	
	// 알림 팝업창 아이디 리스트 반환.
	public List<Map> selectPopupIds() throws Exception{
		return alarmDao.selectPopupIds();
	}
	
	//target 테이블에 저장. (보낼사람)
	public void insertTarget(Map<String, Object> map) throws Exception {
		String targetStr =(String)map.get("targetList");
		String [] targetArr = targetStr.split(",");
		Map<String,Object>personMap=new HashMap();
		personMap.put("alarmId", map.get("alarmId"));
		personMap.put("staffSnb", map.get("staffSnb"));
		personMap.put("alarmYn", "Y");			//일단 Y로 등록
		alarmDao.deleteAlarmTarget(map);		//그 알림에 있는 타겟리스트 지우고
		for(int i=0;i<targetArr.length;i++){
			personMap.put("userId", targetArr[i]);
			alarmDao.insertAlarmTarget(personMap);	//타겟에 저장
		}
	}
	//해당 알림에 targetList 
	public List<Map> getAlarmTargetList(Map<String, Object> map)throws Exception {
		List<Map>list=alarmDao.getAlarmTargetList(map);
		return list;
	}
	
	// 알림 공지대상자 리스트 반환
	public Map selectAlarmUsers(Map<String, Object> param) throws Exception{
			
		Map<String, Object> map = new HashMap<String, Object>();
		//parameter
		int pageSize = Integer.parseInt(param.get("pageSize").toString());
		int pageNo 	 = Integer.parseInt(param.get("pageNo").toString());
			
		map.put("pageNo", param.get("pageNo"));							//넘어온 검색페이지번호도 세팅해서 그대로 반환해준다.
		
		int totalCount = alarmDao.selectAlarmUsersCount(param);				//총 건수
		map.put("totalCount", totalCount);
		
		int pageCount = (totalCount/Integer.parseInt(param.get("pageSize").toString())); 
		pageCount = (totalCount>pageCount*pageSize)?pageCount+1:pageCount;		
		map.put("pageCount", pageCount);										//총 페이지수
		
		param.put("offset", (pageNo-1) * pageSize);
		param.put("limit", Integer.parseInt(param.get("pageSize").toString()));	//페이지크기 pageSize
		
		map.put("list", alarmDao.selectAlarmUsers(param));				//목록리스트
		
		return map;		//Map map: pageNo(페이지번호), totalCount(총 건수), pageCount(총 페이지수), list(리스트)
	}
		
	//소속 부서 리스트 반환
	public List<Map> selectDeptList(Map<String, Object> param) throws Exception{
		return alarmDao.selectDeptList(param);
	}
	
}
