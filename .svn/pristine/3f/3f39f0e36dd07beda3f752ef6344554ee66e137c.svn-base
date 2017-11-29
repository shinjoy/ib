package ib.board.service.impl;

import ib.cmm.service.impl.ComAbstractDAO;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import ib.schedule.service.LoginVO;
import ib.schedule.service.impl.ScheduleVO;


@Repository("boardDAO")
public class BoardDAO extends ComAbstractDAO {
	
	protected static final Log LOG = LogFactory.getLog(BoardDAO.class);
	
	/** 관리자 **/
	// 게시판 그룹&카테고리 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetGrpCateList() throws Exception {
		return list("boardDAO.GetGrpCateList", "");
	}
	
	// 게시판 그룹 등록을 위한 그룹코드 받아오기
	public String GetGrpCd() throws Exception {
		return (String)selectByPk("boardDAO.GetGrpCd", "");
	}
	
	// 게시판 그룹 등록/수정/삭제 완료
	public void GrpProcEnd(BoardVO vo) throws Exception {
		insert("boardDAO.GrpProcEnd", vo);
	}
	
	// 게시판 그룹 등록/수정에 따른 순서 업데이트 (기존값 > 변경값)
	public void GrpOrderUpEditEnd(BoardVO vo) throws Exception {
		update("boardDAO.GrpOrderUpEditEnd", vo);
	}
	
	// 게시판 그룹 등록/수정에 따른 순서 업데이트 (기존값 < 변경값)
	public void GrpOrderDownEditEnd(BoardVO vo) throws Exception {
		update("boardDAO.GrpOrderDownEditEnd", vo);
	}
	
	// 게시판 그룹 삭제에 따른 순서 업데이트
	public void GrpOrderEditEnd(BoardVO vo) throws Exception {
		update("boardDAO.GrpOrderEditEnd", vo);
	}
	
	// 게시판 그룹 삭제에 따른 카테고리 삭제
	public void GrpCateDelEnd(BoardVO vo) throws Exception {
		update("boardDAO.GrpCateDelEnd", vo);
	}
	
	// 게시판 공개자&수신자 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCateOptPerList() throws Exception {
		return list("boardDAO.GetCateOptPerList", "");
	}
	
	// 게시판 카테고리 등록을 위한 카테고리코드 받아오기
	public String GetCateCd(BoardVO vo) throws Exception {
		return (String)selectByPk("boardDAO.GetCateCd", vo);
	}
	
	// 게시판 카테고리 등록/수정/삭제 완료
	public void CateProcEnd(BoardVO vo) throws Exception {
		insert("boardDAO.CateProcEnd", vo);
	}
	
	// 게시판 공개자&수신자 등록/수정 완료
	@SuppressWarnings("rawtypes")
	public void CateOptProcEnd(List list) throws Exception {
		insert("boardDAO.CateOptProcEnd", list);
	}
	
	// 그룹 등록/수정에 따른 순서 업데이트 (기존값 > 변경값)
	public void CateOrderUpEditEnd(BoardVO vo) throws Exception {
		update("boardDAO.CateOrderUpEditEnd", vo);
	}
	
	// 그룹 등록/수정에 따른 순서 업데이트 (기존값 < 변경값)
	public void CateOrderDownEditEnd(BoardVO vo) throws Exception {
		update("boardDAO.CateOrderDownEditEnd", vo);
	}
	
	// 그룹 삭제에 따른 순서 업데이트
	public void CateOrderEditEnd(BoardVO vo) throws Exception {
		update("boardDAO.CateOrderEditEnd", vo);
	}
	/** 관리자 **/
	
	/** 타이틀 **/
	// 게시판 그룹 리스트 불러오기(메뉴)
	@SuppressWarnings("rawtypes")
	public List GetBoardGrpList() throws Exception {
		return list("boardDAO.GetBoardGrpList", "");
	}
	
	// 게시판 리스트 불러오기(카테고리)
	@SuppressWarnings("rawtypes")
	public List GetBoardCateList(BoardVO vo) throws Exception {
		return list("boardDAO.GetBoardCateList", vo);
	}
	
	// 선택된 게시판 그룹 정보 받아오기
	public BoardVO GetGrpInfo(BoardVO vo) throws Exception {
		return (BoardVO)selectByPk("boardDAO.GetGrpInfo", vo);
	}
	/** 타이틀 **/
	
	/** 게시물 **/
	// 결재진행중 문서 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetConfirmIngList(LoginVO vo) throws Exception {
		return list("boardDAO.GetConfirmIngList", vo);
	}
	
	// 반송된 문서 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetReturnList(LoginVO vo) throws Exception {
		return list("boardDAO.GetReturnList", vo);
	}
	
	// 휴가등록시 휴가기간 계산하기
	public String HolidayPeriod(BoardVO vo) throws Exception {
		return (String)selectByPk("boardDAO.HolidayPeriod", vo);
	}
	
	// 기간 휴가 등록시 일정시퀀스 프로시저
	public void SetScheSeq() throws Exception {
		selectByPk("boardDAO.SetScheSeq", "");
	}
	
	// 휴가 승인 완료시 스케쥴러 등록 완료
	public void HoliScheduleAddEnd(ScheduleVO vo) throws Exception {
		insert("boardDAO.HoliScheduleAddEnd", vo);
		insert("boardDAO.ScheduleEntryProcEnd", vo);	// 휴가 참가자 등록 완료
	}
	
	// 휴가 승인 완료시 연차사용내역 등록 완료
	public void WorkHoliAddEnd(BoardVO vo) throws Exception {
		insert("boardDAO.WorkHoliAddEnd", vo);
	}
	
	//게시판 리스트 총 건수
	public int getBoardListTotalCount(BoardVO vo) throws Exception {
		return (Integer)selectByPk("boardDAO.selectBoardListTotalCount", vo);
	}
	
	@SuppressWarnings("rawtypes")
	public List GetBoardList(BoardVO vo) throws Exception {
		return list("boardDAO.GetBoardList", vo);
	}
	
	// 게시물 등록을 위한 게시물 코드 받아오기
	public String GetWriteCd(BoardVO vo) throws Exception {
		return (String)selectByPk("boardDAO.GetWriteCd", vo);
	}
	
	// 게시물 등록/수정/삭제 완료
	public void BoardProcEnd(BoardVO vo) throws Exception {
		insert("boardDAO.BoardProcEnd", vo);
	}
	
	// 게시물 요청관련 담당자&참조인 등록/수정 완료
	@SuppressWarnings("rawtypes")
	public void BoardConfirmOptProcEnd(List list) throws Exception {
		insert("boardDAO.BoardConfirmOptProcEnd", list);
	}
	
	// 게시물 요청관련 담당자&참조인 삭제 완료
	public void BoardConfirmOptDelEnd(BoardVO vo) throws Exception {
		delete("boardDAO.BoardConfirmOptDelEnd", vo);
	}
	
	// 게시물 파일코드 받아오기
	public int GetBoardFileSeq(BoardVO vo) throws Exception {
		return (Integer)selectByPk("boardDAO.GetBoardFileSeq", vo);
	}
	
	// 게시물 파일 등록 완료
	@SuppressWarnings("rawtypes")
	public void BoardFileAddEnd(List list) throws Exception {
		insert("boardDAO.BoardFileAddEnd", list);
	}
	
	// 게시물 보고완료처리 완료
	public void BoardWriteEnd(BoardVO vo) throws Exception {
		update("boardDAO.BoardWriteEnd", vo);
	}
	
	// 보고서 승인/반송 정보 등록
	public void BoardConfirmInfoAddEnd(BoardVO vo) throws Exception {
		insert("boardDAO.BoardConfirmInfoAddEnd", vo);
	}
	
	// 보고서 승인/반송 처리 완료
	public void BoardConfirmEnd(BoardVO vo) throws Exception {
//		insert("boardDAO.BoardConfirmInfoAddEnd", vo);
//		if(vo.getWriteStatus().equals("return")) update("boardDAO.BoardConfirmEnd", vo);
//		if(vo.getConfirmPerSabun().equals(vo.getRegPerSabun())) update("boardDAO.BoardConfirmEnd", vo);
		update("boardDAO.BoardConfirmEnd", vo);
	}
	
	// 게시물 정보 받아오기
	public BoardVO GetBoardInfo(BoardVO vo) throws Exception {
		return (BoardVO)selectByPk("boardDAO.GetBoardInfo", vo);
	}
	
	// 게시물 요청관련 담당자&참조인 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetBoardConfirmOptPerList(BoardVO vo) throws Exception {
		return list("boardDAO.GetBoardConfirmOptPerList", vo);
	}
	
	// 게시물 파일 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetBoardFileList(BoardVO vo) throws Exception {
		return list("boardDAO.GetBoardFileList", vo);
	}
	
	// 게시물 파일 정보 받아오기
	public BoardVO GetBoardFileInfo(BoardVO vo) throws Exception {
		return (BoardVO)selectByPk("boardDAO.GetBoardFileInfo", vo);
	}
	
	// 게시물 파일 삭제 완료
	public void BoardFileDelEnd(BoardVO vo) throws Exception {
		update("boardDAO.BoardFileDelEnd", vo);
	}
	
	// 게시물 조회 정보 등록 완료
	public void BoardReadAddEnd(BoardVO vo) throws Exception {
		insert("boardDAO.BoardReadAddEnd", vo);
	}
	
	// 게시물 조회수 업데이트 완료
	public void BoardHitEditEnd(BoardVO vo) throws Exception {
		update("boardDAO.BoardHitEditEnd", vo);
	}
	
	// 게시물 조회로그 리스트 불러오기
	@SuppressWarnings("rawtypes")
	public List GetBoardReadLogList(BoardVO vo) throws Exception {
		return list("boardDAO.GetBoardReadLogList", vo);
	}
	
	// 게시물 이동 완료
	public void BoardMoveEnd(BoardVO vo) throws Exception {
		update("boardDAO.BoardMoveEnd", vo);
		update("boardDAO.BoardFileMoveEnd", vo);
		update("boardDAO.ReplyMoveEnd", vo);
		update("boardDAO.ReplyFileMoveEnd", vo);
		update("boardDAO.ReadLogMoveEnd", vo);
		update("boardDAO.ReplyReadLogMoveEnd", vo);
		update("boardDAO.ConfirmMoveEnd", vo);
		update("boardDAO.ConfirmInfoMoveEnd", vo);
	}
	
	// 휴가 취소 보고를 위한 신청한 휴가내역 불러오기
	@SuppressWarnings("rawtypes")
	public List GetHoliList(BoardVO vo) throws Exception {
		return list("boardDAO.GetHoliList", vo);
	}
	
	// 휴가 취소에 따른 일정/연차 내역 삭제 완료
	public void HoliCancelEditEnd(BoardVO vo) throws Exception {
		update("boardDAO.ScheEditEnd", vo);		// 일정 내역 삭제 완료
		update("boardDAO.HoliEditEnd", vo);		// 연차 내역 삭제 완료
	}
	/** 게시물 **/
	
	/** 댓글 **/
	// 댓글 리스트
	@SuppressWarnings("rawtypes")
	public List GetReplyList(BoardVO vo) throws Exception {
		return list("boardDAO.GetReplyList", vo);
	}

	// 댓글 파일 리스트
	@SuppressWarnings("rawtypes")
	public List GetReplyFileList(BoardVO vo) throws Exception {
		return list("boardDAO.GetReplyFileList", vo);
	}

	// 댓글 코드 받아오기
	public String GetReplyCd(BoardVO vo) throws Exception {
		return (String)selectByPk("boardDAO.GetReplyCd", vo);
	}
		
	// 댓글 등록/수정/삭제 완료
	public void ReplyProcEnd(BoardVO vo) throws Exception {
		insert("boardDAO.ReplyProcEnd", vo);
	}
		
	// 댓글 파일코드 받아오기
	public int GetReplyFileSeq(BoardVO vo) throws Exception {
		return (Integer)selectByPk("boardDAO.GetReplyFileSeq", vo);
	}
		
	// 댓글 파일 등록 완료
	@SuppressWarnings("rawtypes")
	public void ReplyFileAddEnd(List list) throws Exception {
		insert("boardDAO.ReplyFileAddEnd", list);
	}
		
	// 댓글 파일 삭제 완료
	public void ReplyFileDelEnd(BoardVO vo) throws Exception {
		update("boardDAO.ReplyFileDelEnd", vo);
	}
	
	// 댓글 조회 정보 등록 완료
	@SuppressWarnings("rawtypes")
	public void ReplyReadAddEnd(List list) throws Exception {
		insert("boardDAO.ReplyReadAddEnd", list);
	}
	/** 댓글 **/

	
}