package ib.work.service;

import java.util.List;
import java.util.Map;


/**
 * <pre>
 * package	: ib.work.service 
 * filename	: WorkMemoService.java
 * </pre>
 * 
 * 
 * 
 * @author	: oys
 * @date	: 2016. 4. 15.
 * @version : 
 *
 */
public interface WorkMemoService {

	
	//메모리스트
	Map<String, Object> getMemoList(Map<String, Object> map) throws Exception;

	//메모 상세
	List<Map> getMemoDetail(Map<String, String> map) throws Exception;

	//메모 읽음 상태 업데이트
	int updateMemoStatus(Map<String, Object> map) throws Exception;
	
	//메모 답글 달기
	int insertMemoReply(Map<String, Object> map) throws Exception;

	//메모 참여자 수신 확인 정보
	List<Map> getMemoRecvInfo(Map<String, String> map) throws Exception;

	//메모 내용
	List<Map> getMemoCntnt(Map<String, Object> map) throws Exception;

	//메모 재발송
	int memoResend(Map<String, Object> map) throws Exception;

	//메모유형변경
	int updateMemoType(Map<String, Object> map) throws Exception;

	//메모 참조인 삭제
	int delMemoStaff(Map<String, Object> map) throws Exception;

	//댓글 존재여부 체크
	Map checkMemoReplyExist(Map<String, Object> map) throws Exception;
	

	/*-----모바일 신규------*/
	
	//메모리스트 (모바일)
	List getMemoListForMobile(Map<String, Object> map) throws Exception;
	
	//메모리스트(페이징)
	Map<String, Object> getMemoListForMobilePaging(Map<String, Object> map) throws Exception;
	
	//한 메모 글 리스트
	List getMemoMobileDetail(Map<String, Object> map) throws Exception;
	
	//메모 obj
	Map<String, Object> getCommentInfo(Map<String, Object> map) throws Exception;
	
	//댓글 obj
	Map<String, Object> getReplyInfo(Map<String, Object> map) throws Exception;
	
	//메모 등록 & 수정(본글)
	int doSaveMemo(Map<String, Object> map) throws Exception;
	
	//메모 삭제(본글)
	int doDeleteMemoFirst(WorkVO vo) throws Exception;
	
	//메모 등록 & 수정(댓글)
	int doSaveReply(Map<String, Object> map) throws Exception;
	
	//메모 삭제(댓글)
	int doDeleteReply(WorkVO vo) throws Exception;
	
	//참가자 추가
	int doSaveEntry(Map<String, Object> map) throws Exception;
	
	//읽음 확인
	int saveLastReadDate(Map<String, Object> map) throws Exception;
	
	//메모 첫글 정보
	Map<String, Object> getFirstCommentInfo(Map<String, Object> map) throws Exception;
	
	//오늘 신규 메모
	List getTodayNewMemoList(Map<String, Object> map) throws Exception;

	//최초글 정보
	Map getInfoForSendSms(Map p) throws Exception;
}
