package ib.push.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * package	: 
 * filename	: 
 * </pre>
 * 
 * 
 * 
 * @author	: sjy
 * @date	: 2017. 08. 01.
 * @version : 
 *
 */
public interface PushService {

	
	//push 정보 업데이트 bs_user_profile
	public int updateUserProfileToPushInfo(Map<String, Object> map) throws Exception;

	//push 받을 유저 정보 리스트
	int insertPushLogSearchSabunList(Map<String, Object> map) throws Exception;
	
	//push 알림리스트 
	List<Map> getAlarmList(Map<String, Object> map) throws Exception;

	//알람 읽음 상태 업데이트 
	int updateAlarmReadStatus(Map<String, Object> map) throws Exception;
	
	//안읽은 푸시 갯수
	int getBadgeCount(Map<String, Object> map) throws Exception;
	
}
