package ib.cmm.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;



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
@Repository("commonDAO")
public class CommonDAO extends ComAbstractDAO{
	
	
	protected static final Log logger = LogFactory.getLog(CommonDAO.class);

	
	
	
	/**
	 * 공통코드
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
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
	
	/**
	 * 사원리스트(이름정렬) - map object
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2017. 8. 30.
	 */
	public List<Map> getStaffListNameSortForObjectMap(Map<String, Object> param) throws Exception{
		
		List<Map> list = list("common.selectStaffListNameSort", param);
		return list;
	}

	/**
	 * divisionList(sort 정렬)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 7. 12.
	 */
	public List<Map> getSelectDivisionList(Map<String, String> param) throws Exception{
		
		List<Map> list = list("common.getSelectDivisionList", param);
		return list;
	}


	/**
	 * 부서 리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 8. 10.
	 */
	public List<Map> getDeptList(Map<String, String> map) throws Exception{
		
		List<Map> list = list("common.selectDeptList", map);
		return list;
	}
	
	/**
	 * 회사 리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 12.
	 */
	public List<Map> getCompanyList(Map<String, String> map) throws Exception{
		
		List<Map> list = list("common.selectCompanyList", map);
		return list;
	}
	
	/**
	 * 실시간 변경 가능한 전역변수 조회  
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: psh
	 * @date		: 2017. 07. 3
	 */
	public String getGlobalParam(String param) throws Exception{
		
		return (String)selectByPk("common.selectGlobalParameters", param);
		
	}


	/**
	 * 직급 리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 8. 8.
	 */
	public List<Map> getPositionList(Map<String, String> map) throws Exception{
		return list("common.selectPositionList", map);
	}

}