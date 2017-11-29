package ib.work.service.impl;

import ib.cmm.service.impl.ComAbstractDAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package  : ib.work.service.impl
 * filename : workDiaryDAO.java
 * </pre>
 * 
 * @author  : sjy
 * @since   : 2017. 6. 14.
 * @version : 1.0.0
 */
@Repository("workDiaryDAO")
public class WorkDiaryDAO extends ComAbstractDAO{
	
	
	//모바일 업무 리스트 가져오기 
	public List getWorkListByNoPaging(Map<String, Object> map) {
		
		return list("work.getWorkListByNoPaging", map);
	}
	
	//업무일지 등록
	public int insertWorkDiary(Map<String, Object> map) {
		
		return Integer.parseInt((insert("workDAO.insertBusinessRecord", map)).toString());
	}
	
	//업무일지 수정
	public int updateWorkDiary(Map<String, Object> map){
		int cnt =0;
		
		update("workDAO.updateBusinessRecord", map);
		
		cnt = 1;
		
		return cnt;
	}
	
	//업무일지 상태변경 
	public void workDiaryProcess(Map<String, Object> map){
		
		update("workDAO.updatePrecessResult", map);
	}
	
	//업무일지 상태변경 
	public void deleteWorkDiary(Map<String, Object> map){
		
		delete("workDAO.deleteBusinessRecord", map);
	}
	
	

}