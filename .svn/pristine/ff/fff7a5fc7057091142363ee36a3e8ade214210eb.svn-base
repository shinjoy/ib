package ib.schedule.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import ib.schedule.service.CommonService;
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
@Service("commonService2")
public class CommonServiceImpl extends AbstractServiceImpl implements CommonService {

    @Resource(name="commonDAO2")
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
}
