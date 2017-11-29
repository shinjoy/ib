package ib.board.service;

import ib.board.service.impl.BoardVO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import ib.schedule.service.LoginVO;


public interface BoardService {
	
	/** 관리자 **/
	@SuppressWarnings("rawtypes")
	List GetGrpCateList() throws Exception;										// 게시판 그룹&카테고리 리스트 받아오기
	void GrpProcEnd(BoardVO vo) throws Exception;								// 게시판 그룹 등록/수정/삭제 완료
	@SuppressWarnings("rawtypes")
	List GetCateOptPerList() throws Exception;									// 게시판 공개자&수신자 리스트 받아오기
	void CateProcEnd(HttpServletRequest req, BoardVO vo) throws Exception;		// 게시판 카테고리 등록/수정/삭제 완료
	/** 관리자 **/
	
	/** 타이틀 **/
	@SuppressWarnings("rawtypes")
	List GetBoardGrpList() throws Exception;									// 게시판 그룹 리스트 불러오기(메뉴)
	@SuppressWarnings("rawtypes")
	List GetBoardCateList(BoardVO vo) throws Exception;							// 게시판 리스트 불러오기(카테고리)
	BoardVO GetGrpInfo(BoardVO vo) throws Exception;							// 선택된 게시판 그룹 정보 받아오기
	/** 타이틀 **/
	
	/** 게시물 **/
	@SuppressWarnings("rawtypes")
	List GetConfirmIngList(LoginVO vo) throws Exception;						// 결재진행중 문서 리스트 받아오기
	@SuppressWarnings("rawtypes")
	List GetReturnList(LoginVO vo) throws Exception;							// 반송된 문서 리스트 받아오기
	String HolidayPeriod(BoardVO vo) throws Exception;							// 휴가등록시 휴가기간 계산하기
	@SuppressWarnings("rawtypes")
	List GetBoardList(BoardVO vo) throws Exception;								// 게시물 리스트 받아오기
	
	int getBoardListTotalCount(BoardVO vo) throws Exception;					// 게시물 전체 건수
	
	void BoardProcEnd(HttpServletRequest req, BoardVO vo) throws Exception;		// 게시물 등록/수정/삭제 완료
	void BoardWriteEnd(BoardVO vo) throws Exception;							// 게시물 보고완료처리 완료
	void BoardConfirmEnd(BoardVO vo) throws Exception;							// 보고서 승인/반송 처리 완료
	BoardVO GetBoardInfo(BoardVO vo) throws Exception;							// 게시물 정보 받아오기
	@SuppressWarnings("rawtypes")
	List GetBoardConfirmOptPerList(BoardVO vo) throws Exception;				// 게시물 요청관련 담당자&참조인 리스트 받아오기
	@SuppressWarnings("rawtypes")
	List GetBoardFileList(BoardVO vo) throws Exception;							// 게시물 파일 리스트 받아오기
	BoardVO GetBoardFileInfo(BoardVO vo) throws Exception;						// 게시물 파일 정보 받아오기
	void BoardFileDelEnd(BoardVO vo) throws Exception;							// 게시물 파일 삭제 완료
		
	void BoardReadAddEnd(BoardVO vo) throws Exception;							// 게시물 조회 정보 등록 완료
	void BoardHitEditEnd(BoardVO vo) throws Exception;							// 게시물 조회수 업데이트 완료
	@SuppressWarnings("rawtypes")
	List GetBoardReadLogList(BoardVO vo) throws Exception;						// 조회로그 리스트 불러오기
	void BoardMoveEnd(BoardVO vo) throws Exception;								// 게시물 이동 완료
	@SuppressWarnings("rawtypes")
	List GetHoliList(BoardVO vo) throws Exception;								// 휴가 취소 보고를 위한 신청한 휴가내역 불러오기
	void HoliCancelEditEnd(BoardVO vo) throws Exception;						// 휴가 취소에 따른 일정/연차 내역 삭제 완료
	/** 게시물 **/
	
	/** 댓글 **/
	@SuppressWarnings("rawtypes")
	List GetReplyList(BoardVO vo) throws Exception;								// 댓글 리스트
	@SuppressWarnings("rawtypes")
	List GetReplyFileList(BoardVO vo) throws Exception;							// 댓글 파일 리스트
	String GetReplyCd(BoardVO vo) throws Exception;								// 댓글 코드 받아오기
	void ReplyProcEnd(HttpServletRequest req, BoardVO vo) throws Exception;		// 댓글 등록/수정/삭제 완료
	@SuppressWarnings("rawtypes")
	void ReplyReadAddEnd(List list) throws Exception;							// 댓글 조회 정보 등록 완료
	/** 댓글 **/
}