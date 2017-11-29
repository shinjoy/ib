package ib.person.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ib.person.service.PersonMgmtService;
import ib.person.service.PersonVO;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service("personMgmtService")
public class PersonMgmtServiceImpl extends AbstractServiceImpl implements PersonMgmtService {

    @Resource(name="personDAO")
    private PersonDAO personDAO;
    
    protected static final Log logger = LogFactory.getLog(PersonMgmtServiceImpl.class);

    
    

	//프로젝트 정보
	public List<Map> getCpnDeptList(Map map) throws Exception {
		
		List<Map> list = personDAO.getCpnDeptList(map);
		
		return list;
	}



	//고객리스트
	public List<Map> getCustList(Map<String, String> param) throws Exception {

		List<Map> list = personDAO.getCustList(param);
		
		return list;		
	}


	//신규할당 고객
	public List<Map> getCustListNewInCharge(Map<String, String> param) throws Exception {
		List<Map> list = personDAO.getCustListNewInCharge(param);
		
		return list;
	}


	//신규할당 고객 수락
	public int doAcceptCstManager(Map<String, Object> param) throws Exception {
		
		return personDAO.doAcceptCstManager(param);
	}


	//고객등록(기본 + 담당자 + 네트워크)
	public int insertCustomer(PersonVO personVO) throws Exception {
		
		int cstId = personDAO.insertCustomer(personVO);					//1. 고객(인물) 기본등록
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cstId", cstId);
		map.put("usrCusId", personVO.getUsrCusId());	//담당자 cusId
		map.put("memo", personVO.getRelMemo());			//관계메모
		map.put("userSeq", personVO.getStaffSnb());
		personDAO.doSaveCstManagerDirect(map);							//2. 담당자 등록
		
		
		personVO.setsNb1st(personVO.getUsrCusId());		//담당자 cusId
		personVO.setsNb2nd(""+cstId);					//고객 cusId
		personVO.setNote(personVO.getRelMemo());
		personDAO.insertNetworkCst(personVO);							//3. 네트워크 등록
		
		return 1;
	}

	
	//고객등록(기본 + 담당자 + 네트워크) ... by Map
	public Map regCustomer(Map<String, Object> map) throws Exception {
		
		int cstId = personDAO.regCustomer(map);							//1. 고객(인물) 기본등록
		
		
		//Map<String,Object> map = new HashMap<String,Object>();
		map.put("cstId", cstId);
		//map.put("usrCusId", personVO.getUsrCusId());	//담당자 cusId
		map.put("memo", map.get("relMemo"));			//관계메모
		map.put("userSeq", map.get("staffSnb"));
		personDAO.doSaveCstManagerDirect(map);							//2. 담당자 등록
		
		
		map.put("sNb1st", map.get("usrCusId"));		//담당자 cusId
		map.put("sNb2nd", cstId);					//고객 cusId
		map.put("note",map.get("relMemo"));
		personDAO.regNetworkCst(map);									//3. 네트워크 등록
		
		
		Map obj = personDAO.getCustomer(cstId);
		
		return obj;
	}



	public Map getCustomerByName(Map<String, Object> map) throws Exception {
		
		return personDAO.getCustomerByName(map);
	}


	//고객 구분 변경
	public int doSaveCstType(Map<String, Object> map) throws Exception {
		
		return personDAO.doSaveCstType(map);
	}


	//고객삭제
	public int doDelCst(Map<String, Object> map) throws Exception {

		return personDAO.doDelCst(map);
	}

	// 사원리스트 (해당 회사의 사원리스트)

	public List GetPerList(Map<String,Object> map) throws Exception {
		List<Map> list =personDAO.GetPerList(map);
		
		return list;
	}
	

	
}
