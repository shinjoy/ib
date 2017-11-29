package ib.cmm.service.impl;


import ib.cmm.service.CommonService;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


/**
 * <pre>
 * package	: eam.common.service.impl 
 * filename	: CommonServiceImpl.java
 * </pre>
 * 
 * 
 * 
 * @author	: YoungSik Oh
 * @date	: 2015. 6. 29.
 * @version : 
 *
 */
@Service("commonService")
public class CommonServiceImpl extends AbstractServiceImpl implements CommonService {

    @Resource(name="commonDAO")
    private CommonDAO commonDAO;
    
    protected static final Log logger = LogFactory.getLog(CommonServiceImpl.class);

    
    //공통코드
	public List<Map> getCommonCode(Map<String, String> param) throws Exception {
		
		return commonDAO.getCommonCode(param);
	}


	//사원리스트
	public List<Map> getStaffList(Map<String, String> param) throws Exception {
		
		return commonDAO.getStaffList(param);
	}

	
	//사원리스트(이름정렬)
	public List<Map> getStaffListNameSort(Map<String, String> param) throws Exception {
			
		return commonDAO.getStaffListNameSort(param);
	}
	
	//사원리스트(이름정렬) - map Object 로 받음
	public List<Map> getStaffListNameSortForObjectMap(Map<String, Object> param) throws Exception {
			
		return commonDAO.getStaffListNameSortForObjectMap(param);
	}
	
	
	//division 리스트
	public List<Map> getSelectDivisionList(Map<String, String> map) throws Exception {
		
		return commonDAO.getSelectDivisionList(map);
	}
	
	
	//부서 리스트
	public List<Map> getDeptList(Map<String, String> map) throws Exception {
	
		return commonDAO.getDeptList(map);
	}
	
	
	//회사 리스트 
	public List<Map> getCompanyList(Map<String, String> map) throws Exception{
		return commonDAO.getCompanyList(map);
	}


	//직급 리스트
	public List<Map> getPositionList(Map<String, String> map) throws Exception {
		return commonDAO.getPositionList(map);
	}
	
	
	
	
}
