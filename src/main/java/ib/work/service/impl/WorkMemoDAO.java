package ib.work.service.impl;

import ib.cmm.service.impl.ComAbstractDAO;
import ib.work.service.WorkVO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package  : ib.work.service.impl
 * filename : WorkDAO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 8. 28.
 * @version : 1.0.0
 */
@Repository("workMemoDAO")
public class WorkMemoDAO extends ComAbstractDAO{
	
	
	
	
	/**
	 * 메모 리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 15.
	 */
	public List<Map> getMemoList(Map<String, Object> param) throws Exception{
		
		return list("work.selectMemoList", param);
	}

	
	/**
	 * 메모 건수
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 15.
	 */
	public int getMemoListCount(Map<String, Object> param) throws Exception{
		return Integer.parseInt(selectByPk("work.selectMemoListCount", param).toString());
	}


	
	/**
	 * 메모 상세
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 18.
	 */
	public List<Map> getMemoDetail(Map<String, String> map) throws Exception{
		return list("work.selectMemoDetail", map);
	}


	
	/**
	 * 메모 읽음 상태 업데이트		ib_comment
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 20.
	 */
	public int updateMemoMainStatus(Map<String, Object> map) throws Exception{
		
		return update("work.updateMemoMainStatus", map);
	}


	/**
	 * 메모 읽음 상태 업데이트		ib_reply
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 20.
	 */
	public int updateMemoReplyStatus(Map<String, Object> map) throws Exception{
		
		return update("work.updateMemoReplyStatus", map);
	}


	
	/**
	 * 메모 참여자 수신 확인 정보
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 22.
	 */
	public List<Map> getMemoRecvInfo(Map<String, String> map) throws Exception{
		return list("work.selectMemoRecvInfo", map);
	}


	
	/**
	 * 메모 내용
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 16.
	 */
	public List<Map> getMemoCntnt(Map<String, Object> map) throws Exception{
		
		return list("work.selectMemoCntnt", map);
	}


	
	/**
	 * 메모 재전송 (메인 데이터)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 16.
	 */
	public int cloneResendMemoMain(Map<String, Object> map) throws Exception{
		return Integer.parseInt(insert("work.cloneResendMemoMain", map).toString());
	}


	
	/**
	 * 메모 재전송 (서브 데이터)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 16.
	 */
	public int cloneResendMemoSub(Map<String, Object> map) throws Exception{
		
		return update("work.cloneResendMemoSub", map);
	}


	/**
	 * 메모 파일 재전송
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 17.
	 */
	public void cloneResendFile(Map<String, Object> map) throws Exception{
		
		update("work.cloneResendFile", map);
	}


	/**
	 * 추천종목 >> 제안중딜 등록 파일카피등록
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 24.
	 */
	public void clonePropDealFile(Map<String, Object> map) throws Exception{
		
		update("work.clonePropDealFile", map);
	}
	
	
	/**
	 * 메모유형 변경
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 6. 22.
	 */
	public int updateMemoType(Map<String, Object> map) throws Exception{
		return update("work.updateMemoType", map);
	}


	/**
	 * 메모참조인 삭제(IB_COMMENT)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 19.
	 */
	public int delMemoStaffComment(Map<String, Object> map) throws Exception{		
		return delete("work.deleteMemoStaffComment", map);
	}
	
	
	/**
	 * 메모참조인 삭제(IB_REPLY)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 19.
	 */
	public int delMemoStaffReply(Map<String, Object> map) throws Exception{		
		return delete("work.deleteMemoStaffReply", map);
	}

	
	/**
	 * 메모 해당 사용자 댓글 존재 여부
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 19.
	 */
	public Map checkMemoReplyExist(Map<String, Object> map) {
		return (Map)(list("work.checkMemoReplyExist", map).get(0));
	}
	
	/* ==========모바일 신규구현==========*/
	
	//메모리스트
	public List getMemoListForMobile(Map<String, Object> map) throws Exception {
		
		return list("work.getMemoListForMobile", map);
	}
	
	//메모카운트
	int getMemoListForMobileCount(Map<String, Object> map) throws Exception {
		
		return Integer.parseInt(selectByPk("work.getMemoListForMobileCount", map).toString());
	}
	
	//메모상세
	public List getMemoMobileDetail(Map<String, Object> map) throws Exception {
		
		return list("work.getMemoMobileDetail", map);
	}
	
	//본글 정보
	public Map<String, Object> getCommentInfo(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectByPk("work.selectMemoCntnt", map);
	}
	
	//댓글 정보
	public Map<String, Object> getReplyInfo(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectByPk("work.getReplyInfo", map);
	}
	
	//본글 등록
	public int insertMemo(Map<String, Object> map) throws Exception {
		
		return Integer.parseInt(insert("work.insertMemoNew", map).toString());
	}
	
	//본글 수정
	public void updateMemo(Map<String, Object> map) throws Exception {
		update("workDAO.updateMemo", map);
	}
	
	
	//댓글 저장
	public int insertReplyReturnKey(WorkVO VO) throws Exception {
    	return Integer.parseInt(insert("reply.insertReply", VO).toString());
    }
	
	
	//참가자 등록
    public int insertEntryMemo(WorkVO workVO) throws Exception {
    	int already = Integer.parseInt((String)selectByPk("workDAO.selectAlreadySend", workVO));
   	
	   	if(already == 0){
	   		return Integer.parseInt(insert("work.insertMemoNew", workVO).toString());
	   	}else{
	   		return 0;
	   	}
    }
    
	//참가자 sms 발송 정보
    public Map<String, Object> getInfoForSendSms(Map<String,Object> map) throws Exception {
    	
    	return (Map) selectByPk("work.getInfoForSendSms", map);
    }
    
	//참가자 추가 등록
    public int insertAddEntryMemo(WorkVO workVO) throws Exception {
    	
    	int already = Integer.parseInt((String)selectByPk("workDAO.selectAlreadySend", workVO));
   	
	   	if(already == 0){
	   		return Integer.parseInt(insert("work.insertAddEntryMemo", workVO).toString());
	   	}else{
	   		return 0;
	   	}
    }
    
	//메모 수정
	public void updateImportance(Map<String, Object> map) throws Exception {
		update("work.updateImportance", map);
	}
	
	//메모첫글 정보
    public Map<String, Object> getFirstCommentInfo(Map<String,Object> map) throws Exception {
    	
    	return (Map) selectByPk("work.getFirstCommentInfo", map);
    }
    
	//읽은 갯수 체크
	public int getCommentFirstReadCount(Map<String, Object> map)throws Exception {
		
		return Integer.parseInt(selectByPk("work.getCommentFirstReadCount", map).toString());
	}

	//오늘 신규메모
	public List getTodayNewMemoList(Map<String, Object> map) throws Exception {
		
		return list("work.getTodayNewMemoList", map);
	}

}