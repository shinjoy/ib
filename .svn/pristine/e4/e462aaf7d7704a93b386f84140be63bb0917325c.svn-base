package ib.work.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ib.work.service.WorkDiaryService;





import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service("workDiaryService")
public class WorkDiaryServiceImpl extends AbstractServiceImpl implements WorkDiaryService {

    @Resource(name="workDiaryDAO")
    private WorkDiaryDAO workDiaryDAO;

    
    protected static final Log logger = LogFactory.getLog(WorkDiaryServiceImpl.class);

    


	//모바일 업무리스트 
	public List getWorkListByNoPaging(Map<String, Object> map) throws Exception {
		
		return workDiaryDAO.getWorkListByNoPaging(map);
	}
	
	//업무일지 수정 및 등록
	public int saveWorkDiary(Map<String, Object> map) throws Exception {
		
		int seq = -1;
		
		//수정
		if(Integer.parseInt(map.get("sNb").toString()) >0){
			
			seq = workDiaryDAO.updateWorkDiary(map);
			
		}else{
			
			seq = workDiaryDAO.insertWorkDiary(map);
		}
		
		return seq;
	}
	
	//업무일지 진행상태 변경
	public void workDiaryProcess(Map<String, Object> map) throws Exception {
	
		if(!map.get("sNb").equals("")) workDiaryDAO.workDiaryProcess(map);
	}
	
	//업무일지 삭제
	public int deleteWorkDiary(Map<String, Object> map) throws Exception {
		
		int seq = -1;
		
		if(!map.get("sNb").equals("")) workDiaryDAO.deleteWorkDiary(map);
		
		seq = 0;
		
		return seq;
	}

	

	

	
}
