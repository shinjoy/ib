package ib.schedule.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import ib.cmm.service.impl.ComAbstractDAO;


/**
 * <pre>
 * package	: eam.common.service.impl 
 * filename	: CommonDAO.java
 * </pre>
 * 
 * 
 * 
 * @author	: YoungSik Oh
 * @date	: 2015. 6. 29.
 * @version : 
 *
 */
@Repository("commonDAO2")
public class CommonDAO extends ComAbstractDAO{
	
	
	protected static final Log logger = LogFactory.getLog(CommonDAO.class);

	
	
	
	/**
	 * 공통코드
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: YoungSik Oh
	 * @date		: 2015. 6. 29.
	 */
	public List<Map> getCommonCode(Map<String, String> param) throws Exception{
		
		List<Map> list = list("common.selectCommonCode", param);
				
		return list;
	}


	/**
	 * 사원리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 3. 9.
	 */
	public List<Map> getStaffList(Map<String, String> param) throws Exception{
		
		List<Map> list = list("common.selectStaffList", param);
		return list;
	}


	/**
	 * 사원리스트(이름정렬)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 3. 18.
	 */
	public List<Map> getStaffListNameSort(Map<String, String> param) throws Exception{
		
		List<Map> list = list("common.selectStaffListNameSort", param);
		return list;
	}

	

}