package ib.work.service.impl;

import ib.cmm.service.impl.ComAbstractDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


/**
 * <pre>
 * package	: ib.work.service.impl 
 * filename	: WorkTypeDAO.java
 * </pre>
 * 
 * 
 * 
 * @author	: 
 * @date	: 2017. 7. 5.
 * @version : 
 *
 */
@Repository("workTypeDAO")
public class WorkTypeDAO extends ComAbstractDAO{
	
	
	
	/**
	 * 업무유형 리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 6.
	 */
	public List<Map> getWorkTypeList(Map param) throws Exception{
		
		return list("workType.getWorkTypeList", param);
	}

	
	/**
	 * 업무유형 등록
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 6.
	 */
	public void insertWorkType(Map<String, Object> map) throws Exception{
		
		insert("workType.insertWorkType", map);
	}
		
	
	/**
	 * 업무유형 업무직원 등록
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 6.
	 */
	public int insertWorkTypeStaff(Map map) throws Exception{
		
		return update("workType.insertWorkTypeStaff", map);
	}
	
	
	/**
	 * 업무유형 수정
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 6.
	 */
	public int updateWorkType(Map<String, Object> map) throws Exception{
		
		return update("workType.updateWorkType", map);
	}
	
	
	/**
	 * 업무유형 업무담당자 삭제
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 6.
	 */
	public void deleteWorkTypeStaff(Map<String, Object> map) throws Exception{
		
		update("workType.deleteWorkTypeStaff", map);
	}
	
	
	/**
	 * 업무유형 삭제
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 6.
	 */
	public int deleteWorkType(Map<String, Object> map) throws Exception{

		return update("workType.deleteWorkType", map);
	}
	
	
			
}