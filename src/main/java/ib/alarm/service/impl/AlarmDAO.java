
package ib.alarm.service.impl;



import ib.cmm.service.impl.ComAbstractDAO;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

@Repository("alarmDAO")
public class AlarmDAO extends ComAbstractDAO{
	

	//알림리스트
	@SuppressWarnings("unchecked")
	public List<Map> getAlarmList(Map<String, Object> map) throws Exception {
		return list("alarm.getAlarmList",map);
	}

	//총 갯수
	public int getAlarmListCount(Map<String, Object> map) throws Exception{
		return Integer.parseInt(selectByPk("alarm.getAlarmListCount", map).toString());
	}
	
	//등록
	public String insertAlarm(Map<String, Object> map) throws Exception{
		return (String)insert("alarm.insertAlarm", map);
	}
	//수정
	public void updateAlarm(Map<String, Object> map) throws Exception{
		update("alarm.updateAlarm", map);
	}
	//삭제 (이긴하나 날짜만 변경함.)
	public void deleteAlarm(Map<String, Object> map) throws Exception{
		update("alarm.deleteAlarm", map);
	}

	/**
	 * 알림 팝업창 조건 체크 ( 법인카드 소지여부 : 'Y', 관리대상 여부 : 'Y')
	 * @param Map<String, Object> 로그인아이디,사번
	 * @return 사용자 정보 반환
	 * @throws Exception
	 */
	public Map selectPopUser(Map<String, Object> map) throws Exception{
		return (Map) getSqlMapClientTemplate().queryForObject("alarm.selectPopUser", map);
	}
	
	/**
	 * 알림 팝업창 아이디 리스트 반환.
	 * @return 알림 팝업창 기준 아이디 값 리스트
	 * @throws Exception
	 */
	public List<Map> selectPopupIds() throws Exception{
		return list("alarm.selectPopupIds", null);
	}
	
	/**
	 * 알림 팝업창 정보 반환
	 * @param Map<String, Object> 아이디 값
	 * @return 알림 팝업 정보
	 * @throws Exception
	 */
	public Map selectPopupInfo(Map<String, Object> map) throws Exception{
		return (Map) getSqlMapClientTemplate().queryForObject("alarm.selectPopupInfo", map);
	}
	//타겟 유저 삭제
	public void deleteAlarmTarget(Map<String, Object> map) throws Exception{
		delete("alarm.deleteAlarmTarget", map);
	}
	//타겟 유저 등록
	public void insertAlarmTarget(Map<String, Object> map) throws Exception{
		insert("alarm.insertAlarmTarget", map);
	}
	//타겟 유저 리스트
	public List<Map> getAlarmTargetList(Map<String, Object> map) throws Exception{
		return list("alarm.getAlarmTargetList", map);
	}	

	/**
	 * 알림 공지대상자 리스트 반환
	 * @return
	 * @throws Exception
	 */
	public List<Map> selectAlarmUsers(Map<String, Object> map) throws Exception{
		return list("alarm.selectAlarmUsers", map);
	}

	/**
	 * 알림 공지대상자 리스트 총 갯수 반환
	 * @param param
	 * @return
	 */
	public int selectAlarmUsersCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return Integer.parseInt(selectByPk("alarm.selectAlarmUsersCount", map).toString());
	}
	
	
	/**
	 * 소속 부서리스트 반환
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<Map> selectDeptList(Map<String, Object> map) throws Exception{
		return list("alarm.selectDeptList", map);
	}
	
}