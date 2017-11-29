package ib.schedule.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import ib.schedule.service.PersonMgmtService;
import ib.schedule.service.PersonVO;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service("personMgmtService2")
public class PersonMgmtServiceImpl extends AbstractServiceImpl implements PersonMgmtService {

    @Resource(name="personDAO2")
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
		
		/*Map<String, Object> map = new HashMap<String, Object>();
		//parameter
		int pageSize = Integer.parseInt(param.get("pageSize").toString());
		int pageNo 	 = Integer.parseInt(param.get("pageNo").toString());
		
		map.put("pageNo", param.get("pageNo"));							//넘어온 검색페이지번호도 세팅해서 그대로 반환해준다.
		
		int totalCount = personDAO.getCustListCount(param);				//총 건수
		map.put("totalCount", totalCount);
		
		int pageCount = (totalCount/Integer.parseInt(param.get("pageSize").toString()));
		pageCount = (totalCount>pageCount*pageSize)?pageCount+1:pageCount;		//총 페이지수 ... (총수/페이지크기)떨어지는지, 절삭하는지 확인하여 총페이지크기를 (+1)여부결정
		map.put("pageCount", pageCount);										//총 페이지수
		
		param.put("offset", (pageNo-1) * pageSize);
		param.put("limit", Integer.parseInt(param.get("pageSize").toString()));	//페이지크기 pageSize
		
		map.put("list", personDAO.getCustList(param));				//목록리스트
		
		return map;		//Map map: pageNo(페이지번호), totalCount(총 건수), pageCount(총 페이지수), list(리스트)
*/	}


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

	//고객찾기(이름으로)
	public Map getCustomerByName(Map<String, Object> map) throws Exception {
		
		return personDAO.getCustomerByName(map);
	}
	
}
