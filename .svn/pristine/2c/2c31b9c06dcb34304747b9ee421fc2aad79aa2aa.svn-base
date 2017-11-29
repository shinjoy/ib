package ib.schedule.service;

import java.util.List;
import java.util.Map;

import ib.schedule.service.FormDocVO;

public interface FormDocService {
	
	
	@SuppressWarnings("rawtypes")
	List GetFormDocTypeList() throws Exception;								// 증명서 종류 받아오기
	@SuppressWarnings("rawtypes")
	List GetPerList() throws Exception;										// 사원리스트 받아오기
	List GetPerList(Map vo) throws Exception;										// 사원리스트 받아오기
	@SuppressWarnings("rawtypes")
	List GetAllPerList() throws Exception;									// 퇴사자 포함 사원리스트 받아오기
	FormDocVO GetPerInfo(FormDocVO vo) throws Exception;					// 선택 사원 정보 받아오기
	void FormDocReqEnd(FormDocVO vo) throws Exception;						// 증명서 발급 요청 완료
	@SuppressWarnings("rawtypes")
	List GetFormDocReqList(FormDocVO vo) throws Exception;					// 증명서 발급 내역 리스트
	FormDocVO GetFormDocInfo(FormDocVO vo) throws Exception;				// 증명서 정보 받아오기
	void FormDocStatusEditEnd(FormDocVO vo) throws Exception;				// 증명서 상태 변경 완료
	void FormDocCancelEnd(FormDocVO vo) throws Exception;					// 증명서 요청 취소 완료
}