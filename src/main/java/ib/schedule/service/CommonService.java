package ib.schedule.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * package	: eam.common.service 
 * filename	: CommonService.java
 * </pre>
 * 
 * 
 * 
 * @author	: oys
 * @date	: 2015. 6. 29.
 * @version : 
 *
 */
public interface CommonService {

	List<Map> getCommonCode(Map<String, String> map) throws Exception;

	List<Map> getStaffList(Map<String, String> map) throws Exception;

	List<Map> getStaffListNameSort(Map<String, String> map) throws Exception;
}
