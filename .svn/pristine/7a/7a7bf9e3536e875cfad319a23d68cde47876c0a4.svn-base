package ib.push.service.impl;



import java.util.List;
import java.util.Map;

import ib.cmm.service.impl.ComAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("pushDAO")
public class PushDAO extends ComAbstractDAO{
	
	
	/**
	 *
	 * @MethodName : updateUserProfileToPushInfo
	 * @param 
	 * @return
	 */

	public void updateUserProfileToPushInfo(Map<String, Object> map) throws Exception{
		
		update("push.updateUserProfileToPushInfo", map);
	}
	
	/**
	 *
	 * @MethodName : insertPushLog
	 * @param 
	 * @return
	 */
	
	public int insertPushLog(Map<String, Object> map) throws Exception{
		
		return  Integer.parseInt(insert("push.insertPushLog", map).toString());
	}
	
	/**
	 *
	 * @MethodName : getAlarmList(알림 내역)
	 * @param 
	 * @return
	 */
	
	public List<Map> getAlarmList(Map<String, Object> map) throws Exception{
		List list = list("push.getAlarmList", map);
		return list;
	}
	
	/**
	 *
	 * @MethodName : updateAlarmReadStatus (읽음 상태업데이트)
	 * @param 
	 * @return
	 */
	
	public int updateAlarmReadStatus(Map<String, Object> map) throws Exception{
		int cnt =0;
		
		update("push.updateAlarmReadStatus", map);
		
		cnt =1;
		return cnt;
	}
	
	//푸시 뱃지 갯수
	public int getBadgeCount(Map<String, Object> map) throws Exception{
		
		return Integer.parseInt(selectByPk("push.getBadgeCount", map).toString());
	}

}