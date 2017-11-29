package ib.work.service;

import java.util.List;
import java.util.Map;


/**
 * <pre>
 * package	: ib.work.service 
 * filename	: WorkDiaryService.java
 * </pre>
 * 
 * 
 * 
 * @author	: sjy
 * @date	: 2017. 6. 14.
 * @version : 
 *
 */
public interface WorkDiaryService {

	
	
	//업무리스트(no Paging)
	List getWorkListByNoPaging(Map<String, Object> map) throws Exception;
	
	//업무일지 수정 및 등록
	int saveWorkDiary(Map<String, Object> map) throws Exception;
	
	//업무일지 진행상태 변경
	void workDiaryProcess(Map<String, Object> map) throws Exception;
	
	//업무일지 삭제
	int deleteWorkDiary(Map<String, Object> map) throws Exception;
	
}
