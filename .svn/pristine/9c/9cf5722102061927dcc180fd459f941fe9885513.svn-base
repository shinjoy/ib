package ib.stats.service.impl;

import ib.cmm.service.impl.ComAbstractDAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package	: ib.stats.service.impl 
 * filename	: StatsPsDAO.java
 * </pre>
 * 
 * 
 * 
 * @author	: oys
 * @date	: 2017. 1. 4.
 * @version : 
 *
 */
@Repository("statsPsDAO")
public class StatsPsDAO extends ComAbstractDAO{
	
	
	
	/**
	 * 메자닌 성과 설정 정보
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 4.
	 */
	public List<Map> getPsMezzConfigInfo(Map map) throws Exception {
		return list("stats.selectPsMezzConfigInfo", map);
	}

		
	/**
	 * 유형정보 코드 전체
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 4.
	 */
	public List<Map> getMezzTypeAll(Map map) throws Exception {
		return list("stats.selectMezzTypeAll", map);
	}
	
	
	/**
	 * 유형정보
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 4.
	 */
	public List<Map> getPsMezzType(Map map) throws Exception {
		return list("stats.selectPsMezzType", map);
	}


	/**
	 * 직원정보
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 4.
	 */
	public List<Map> getPsMezzStaff(Map map) throws Exception {
		return list("stats.selectPsMezzStaff", map);
	}

	
	/**
	 * 메자닌 성과 설정정보 저장
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 5.
	 */
	public int doSavePsConfigInfo(Map<String, Object> map) throws Exception {
		return update("stats.mergePsConfigInfo", map);
	}

	
	/**
	 * 직원 정보 저장 (연봉, 목표, ROLL RATE)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 6.
	 */
	public int doSaveStaffInfo(Map<String, Object> map) throws Exception {
		int upCnt = 0;

		List list = (ArrayList<Map>)map.get("staffInfo");
		String userSeq = map.get("userSeq").toString();				//로그인 사용자 id
			
		for(int i=0; i<list.size(); i++) {
			
			int up = update("stats.updatePsStaffInfo", (Map)list.get(i));		//저장
			
			if(up>0) upCnt++;
		}
		
		return upCnt;
	}

	
	/**
	 * 해당년도 유형정보 삭제
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 6.
	 */
	public void deleteMezzType(Map<String, Object> map) throws Exception {
		update("stats.deleteMezzType", map);
	}
	
	
	/**
	 * 해당년도 선택 유형정보 등록
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 6.
	 */
	public int insertMezzType(Map<String, Object> map) throws Exception {
		int upCnt = 0;

		List list = (ArrayList<Map>)map.get("typeList");
			
		for(int i=0; i<list.size(); i++) {			
			update("stats.insertMezzType", (Map)list.get(i));		//저장
			upCnt++;
		}
		
		return upCnt;
	}


	
	/**
	 * 대상자 정보 저장
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 9.
	 */
	public int doSaveMezzStaff(Map<String, Object> map) throws Exception {
		int upCnt = 0;

		List list = (ArrayList<Map>)map.get("staffList");
			
		for(int i=0; i<list.size(); i++) {			
			update("stats.mergeMezzStaff", (Map)list.get(i));		//저장
			upCnt++;
		}
		
		return upCnt;
	}


	/**
	 * 대상자 정보 일괄삭제
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 9.
	 */
	public void deleteMezzStaff(Map<String, Object> map) throws Exception {
		update("stats.deleteMezzStaff", map);
	}

	

}