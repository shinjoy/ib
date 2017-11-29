package ib.schedule.service;

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
 * @author	: oys
 * @date	: 2016. 01. 15.
 * @version : 
 *
 */
public interface PersonMgmtService {

	//회사별 부서 리스트
	List<Map> getCpnDeptList(Map map) throws Exception;

	//고객리스트
	List<Map> getCustList(Map<String, String> map) throws Exception;
	//Map<String, Object> getCustList(Map<String, Object> map) throws Exception;

	//신규할당 고객
	List<Map> getCustListNewInCharge(Map<String, String> map) throws Exception;

	//할당고객 수락
	int doAcceptCstManager(Map<String, Object> map) throws Exception;

	//고객등록(기본 + 네트워크)
	int insertCustomer(PersonVO personVO) throws Exception;

	//고객찾기(이름으로)
	Map getCustomerByName(Map<String, Object> map) throws Exception;
	
}
