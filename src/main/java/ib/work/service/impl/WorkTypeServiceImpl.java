package ib.work.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ib.work.service.WorkTypeService;
import ib.work.service.WorkVO;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service("workTypeService")
public class WorkTypeServiceImpl extends AbstractServiceImpl implements WorkTypeService {

    @Resource(name="workTypeDAO")
    private WorkTypeDAO workTypeDAO;
    
    
    protected static final Log logger = LogFactory.getLog(WorkTypeServiceImpl.class);

    


	//업무유형 리스트
	public List<Map> getWorkTypeList(Map param) throws Exception {

		List<Map> list = workTypeDAO.getWorkTypeList(param);				//목록리스트
				
		return list;		//Map map: pageNo(페이지번호), totalCount(총 건수), pageCount(총 페이지수), list(리스트)
			
	}

	
	//업무유형 등록
	public int insertWorkType(Map<String, Object> map) throws Exception {
		
		//BS_WORK_TYPE
		workTypeDAO.insertWorkType(map);		//등록 후 map 에 work_type_id 반환
		
		//BS_WORK_TYPE_STAFF		
		String userListStr = map.get("userListStr").toString();
		String[] userIdList = userListStr.split(",");
		Map staffMap = new HashMap<String,String>();
		for(int i=0; i<userIdList.length; i++){
			if(userIdList[i].length()>0){
				staffMap.put("workTypeId", map.get("workTypeId"));
				staffMap.put("userId", userIdList[i]);
				staffMap.put("rgId", map.get("rgId"));
				
				workTypeDAO.insertWorkTypeStaff(staffMap);		//업무유형 업무담당자 등록
			}
		}
		
		return (Integer)map.get("workTypeId");
	}
	
	
	//업무유형 수정
	public int updateWorkType(Map<String, Object> map) throws Exception {
		int cnt = 0;
		
		//BS_WORK_TYPE
		cnt = workTypeDAO.updateWorkType(map);
		
		//BS_WORK_TYPE_STAFF
		workTypeDAO.deleteWorkTypeStaff(map);				//업무유형 업무담당자 초기화(삭제)
		String userListStr = map.get("userListStr").toString();
		String[] userIdList = userListStr.split(",");
		Map staffMap = new HashMap<String,String>();
		for(int i=0; i<userIdList.length; i++){		
			if(userIdList[i].length()>0){
				staffMap.put("workTypeId", map.get("workTypeId"));
				staffMap.put("userId", userIdList[i]);
				staffMap.put("rgId", map.get("rgId"));
				
				workTypeDAO.insertWorkTypeStaff(staffMap);		//업무유형 업무담당자 등록
			}
		}
		
		return cnt;
	}
		

	//업무유형 삭제
	public int deleteWorkType(Map<String, Object> map) throws Exception {
		int cnt = 0;
		
		//BS_WORK_TYPE
		cnt = workTypeDAO.deleteWorkType(map);
		
		//BS_WORK_TYPE_STAFF
		workTypeDAO.deleteWorkTypeStaff(map);		//업무유형 업무담당자
		
		return cnt;
	}
	
	
	

	
}
