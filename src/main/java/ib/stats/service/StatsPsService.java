package ib.stats.service;

import java.util.List;
import java.util.Map;


/**
 * <pre>
 * package	: ib.stats.service 
 * filename	: StatsPsService.java
 * </pre>
 * 
 * 
 * 
 * @author	: oys
 * @date	: 2017. 1. 4.
 * @version : 
 *
 */
public interface StatsPsService {

	//메자닌 성과 설정 정보
	List<Map> getPsMezzConfigInfo(Map map) throws Exception;

	//유형정보
	List<Map> getPsMezzType(Map map) throws Exception;

	//직원정보
	List<Map> getPsMezzStaff(Map map) throws Exception;

	//메자닌 성과 설정정보 저장
	int doSavePsConfigInfo(Map<String, Object> map) throws Exception;

	//직원 정보 저장 (연봉, 목표, ROLL RATE)
	int doSaveStaffInfo(Map<String, Object> map) throws Exception;

	//유형 정보 코드 전체
	List<Map> getMezzTypeAll(Map map) throws Exception;

	//선택 유형 정보 저장
	int doSaveMezzType(Map<String, Object> map) throws Exception;

	//대상자 정보 저장
	int doSaveMezzStaff(Map<String, Object> map) throws Exception;

	
}
