package ib.board.service.impl;

import ib.board.service.BoardService;
import ib.board.service.impl.BoardDAO;
import ib.schedule.service.LoginVO;
import ib.schedule.service.ScheduleService;
import ib.schedule.service.Utill;
import ib.schedule.service.impl.ScheduleVO;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service("boardService")
public class BoardServiceImpl extends AbstractServiceImpl implements BoardService {
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	@Resource(name = "scheService")
	private ScheduleService scheService;
	
	// 파일 업로드
	@SuppressWarnings("rawtypes")
	public static List FileUpLoad(HttpServletRequest req, BoardVO vo, String Flag, String DicNm, int FileCd) throws Exception {
		final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		vo.setFilePath("F:\\SynergyCus\\DATA\\ERP\\"+ DicNm +"\\"+ Utill.Today("Year") + Utill.Today("Month") + "");
		File FileDir = new File(vo.getFilePath());
		if(!FileDir.exists() || FileDir.isFile()) FileDir.mkdirs();
		
		int FileOrder, Cnt = 0;
		List<MultipartFile> mf = multiRequest.getFiles("DataAry");
		if(mf.size() >= 1 && !mf.get(0).getOriginalFilename().equals("")) {
			for(int oOo = 0; oOo < mf.size(); oOo++) {
				Map<String, Object> paramTemp = new HashMap<String, Object>();
				FileOrder = oOo + 1; // 파일 출력 순서
				vo.setFileUpNm(Utill.UpFileReName(mf.get(oOo), mf.get(oOo).getOriginalFilename(), vo.getFilePath())); // 파일명 변경
				
				if(Cnt != 0) FileCd++;
				mf.get(oOo).transferTo(new File(vo.getFilePath() + "/" + vo.getFileUpNm()));	// 파일 카피
				if(Flag.equals("Board")) {
					paramTemp.put("GrpCd", vo.getGrpCd());								// 그룹코드
					paramTemp.put("CateCd", vo.getCateCd());							// 게시판코드
					paramTemp.put("WriteCd", vo.getWriteCd());							// 게시물코드
				}
				else if(Flag.equals("Reply")) {
					paramTemp.put("GrpCd", vo.getGrpCd());								// 그룹코드
					paramTemp.put("CateCd", vo.getCateCd());							// 게시판코드
					paramTemp.put("WriteCd", vo.getWriteCd());							// 게시물코드
					paramTemp.put("ReplyCd", vo.getReplyCd());							// 댓글코드
				}
				paramTemp.put("FileSeq", Integer.toString(FileCd));						// 파일순번
				paramTemp.put("FileNm", mf.get(oOo).getOriginalFilename());				// 실제 파일명
				paramTemp.put("FileUpNm", vo.getFileUpNm());							// 업로드 파일명
				paramTemp.put("FilePath", vo.getFilePath());							// 파일경로
				paramTemp.put("FileSize", mf.get(oOo).getSize());						// 파일 크기
				paramTemp.put("FileOrder", FileOrder);									// 파일 출력 순서
				list.add(paramTemp);
				Cnt++;
			}
		}
		return list;
	}
	
	/** 관리자 **/
	// 게시판 그룹&카테고리 받아오기
	@SuppressWarnings("rawtypes")
	public List GetGrpCateList() throws Exception {
		return boardDAO.GetGrpCateList();
	}
	
	// 게시판 그룹 등록/수정/삭제 완료
	public void GrpProcEnd(BoardVO vo) throws Exception {
		if(vo.getCMD().equals("Add")) {
			if(!vo.getGrpOrder().equals(vo.getGrpOrderLog())) {
				if(Integer.parseInt(vo.getGrpOrder()) < Integer.parseInt(vo.getGrpOrderLog())) boardDAO.GrpOrderUpEditEnd(vo);
				else boardDAO.GrpOrderDownEditEnd(vo);
			}
			vo.setGrpCd(boardDAO.GetGrpCd());
		}
		else {
			if(vo.getCMD().equals("Edit") && !vo.getGrpOrder().equals(vo.getGrpOrderLog())) {
				if(Integer.parseInt(vo.getGrpOrder()) < Integer.parseInt(vo.getGrpOrderLog())) boardDAO.GrpOrderUpEditEnd(vo);
				else boardDAO.GrpOrderDownEditEnd(vo);
			}
			else if(vo.getCMD().equals("Del")) {
				boardDAO.GrpOrderEditEnd(vo);		// 그룹순서 변경
				boardDAO.GrpCateDelEnd(vo);			// 카테고리 삭제
			}
		}
		boardDAO.GrpProcEnd(vo);
	}
	
	// 게시판 공개자&수신자 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCateOptPerList() throws Exception {
		return boardDAO.GetCateOptPerList();
	}
	
	// 게시판 카테고리 등록/수정/삭제 완료
	public void CateProcEnd(HttpServletRequest req, BoardVO vo) throws Exception {
		if(vo.getCMD().equals("Add")) {
			if(!vo.getCateOrder().equals(vo.getCateOrderLog())) {
				if(Integer.parseInt(vo.getCateOrder()) < Integer.parseInt(vo.getCateOrderLog())) boardDAO.CateOrderUpEditEnd(vo);
				else boardDAO.CateOrderDownEditEnd(vo);
			}
			vo.setCateCd(boardDAO.GetCateCd(vo));
		}
		else {
			if(vo.getCMD().equals("Edit") && !vo.getCateOrder().equals(vo.getCateOrderLog())) {
				if(Integer.parseInt(vo.getCateOrder()) < Integer.parseInt(vo.getCateOrderLog())) boardDAO.CateOrderUpEditEnd(vo);
				else boardDAO.CateOrderDownEditEnd(vo);
			}
			else if(vo.getCMD().equals("Del")) boardDAO.CateOrderEditEnd(vo);
		}
		boardDAO.CateProcEnd(vo);
		
		int EmpCnt = Integer.parseInt(req.getParameter("EmpCnt")) + 1;
		List<Map<String, Object>> PublicList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> ReceiveList = new ArrayList<Map<String, Object>>();
		
		for(int oOo = 1; oOo < EmpCnt; oOo++) {
			Map<String, Object> PublicParam = new HashMap<String, Object>();
			Map<String, Object> ReceiveParam = new HashMap<String, Object>();
			
			PublicParam.put("GrpCd", vo.getGrpCd());
			PublicParam.put("CateCd", vo.getCateCd());
			PublicParam.put("PerSabun", req.getParameter("PublicValAry" + oOo));
			PublicParam.put("OptFlag", "Public");
			PublicParam.put("RegPerSabun", vo.getRegPerSabun());
			PublicParam.put("DelFlag", req.getParameter("PublicDelAry" + oOo));
			if(!PublicParam.get("PerSabun").equals("")) PublicList.add(PublicParam);
			
			ReceiveParam.put("GrpCd", vo.getGrpCd());
			ReceiveParam.put("CateCd", vo.getCateCd());
			ReceiveParam.put("PerSabun", req.getParameter("ReceiveValAry" + oOo));
			ReceiveParam.put("OptFlag", "Receive");
			ReceiveParam.put("RegPerSabun", vo.getRegPerSabun());
			ReceiveParam.put("DelFlag", req.getParameter("ReceiveDelAry" + oOo));
			if(!ReceiveParam.get("PerSabun").equals("")) ReceiveList.add(ReceiveParam);
		}
		if(PublicList.size() > 0) boardDAO.CateOptProcEnd(PublicList);		// 게시판 공개자 등록/수정 완료
		if(ReceiveList.size() > 0) boardDAO.CateOptProcEnd(ReceiveList);	// 게시판 메일&문자 수신자 등록/수정 완료
	}
	/** 관리자 **/
	
	/** 타이틀 **/
	// 게시판 그룹 리스트 불러오기(메뉴)
	@SuppressWarnings("rawtypes")
	public List GetBoardGrpList() throws Exception {
		return boardDAO.GetBoardGrpList();
	}
	
	// 게시판 리스트 불러오기(카테고리)
	@SuppressWarnings("rawtypes")
	public List GetBoardCateList(BoardVO vo) throws Exception {
		return boardDAO.GetBoardCateList(vo);
	}
	
	// 선택된 게시판 그룹 정보 받아오기
	public BoardVO GetGrpInfo(BoardVO vo) throws Exception {
		return boardDAO.GetGrpInfo(vo);
	}
	/** 타이틀 **/
	
	/** 게시물 **/
	// 결재진행중 문서 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetConfirmIngList(LoginVO vo) throws Exception {
		return boardDAO.GetConfirmIngList(vo);
	}
	
	// 반송된 문서 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetReturnList(LoginVO vo) throws Exception {
		return boardDAO.GetReturnList(vo);
	}
	
	// 휴가등록시 휴가기간 계산하기
	public String HolidayPeriod(BoardVO vo) throws Exception {
		return boardDAO.HolidayPeriod(vo);
	}
	
	// 게시물 총건수
	@SuppressWarnings("rawtypes")
	public int getBoardListTotalCount(BoardVO vo) throws Exception {
		return boardDAO.getBoardListTotalCount(vo);
	}
	
	// 게시물 리스트
	@SuppressWarnings("rawtypes")
	public List GetBoardList(BoardVO vo) throws Exception {
		return boardDAO.GetBoardList(vo);
	}
	
	// 게시물 등록/수정/삭제 완료
	@SuppressWarnings("rawtypes")
	public void BoardProcEnd(HttpServletRequest req, BoardVO vo) throws Exception {
		if(vo.getCMD().equals("Del")) {
			boardDAO.BoardFileDelEnd(vo);
			BoardVO DelVO = boardDAO.GetBoardInfo(vo);
			DelVO.setCMD("Del");
			boardDAO.BoardProcEnd(DelVO);
		}
		else {
			if(vo.getCMD().equals("Add")) {
				vo.setBoardVer("1");
				vo.setWriteCd(boardDAO.GetWriteCd(vo));
				boardDAO.BoardReadAddEnd(vo);
			}
			
			if(vo.getHoliDocFlag().equals("F")) {
				vo.setEventSelCd1(Integer.toString(Integer.parseInt(vo.getEventSelCd1()) + 1));
				vo.setEventSelCd2(Integer.toString(Integer.parseInt(vo.getEventSelCd2()) + 1));
			}
			
			if(req.getParameter("OldWriteStatus") !=null && req.getParameter("OldWriteStatus").equals("return")) {	// 재기안 문서일시 버전 업
				vo.setBoardVer(Integer.toString(Integer.parseInt(vo.getBoardVer()) + 1));
			}
			
			List FileList = FileUpLoad(req, vo, "Board", "BoardFile", boardDAO.GetBoardFileSeq(vo));
			if(FileList.size() > 0) boardDAO.BoardFileAddEnd(FileList);
			boardDAO.BoardProcEnd(vo);
		
			// 컨펌기능이 있고, 승인자 사번이 있을경우 중간승인자와 참조인을 등록한다.
			if(vo.getConfirmProcFlag().equals("Y") && !vo.getConfirmPerSabun().equals("")) {
				int EmpCnt = Integer.parseInt(req.getParameter("EmpCnt")) + 1;
				List<Map<String, Object>> MiddleList = new ArrayList<Map<String, Object>>();
				List<Map<String, Object>> ConsultList = new ArrayList<Map<String, Object>>();
				
				for(int oOo = 1; oOo < EmpCnt; oOo++) {
					Map<String, Object> MiddleParam = new HashMap<String, Object>();
					Map<String, Object> ConsultParam = new HashMap<String, Object>();
					
					MiddleParam.put("GrpCd", vo.getGrpCd());
					MiddleParam.put("CateCd", vo.getCateCd());
					MiddleParam.put("WriteCd", vo.getWriteCd());
					MiddleParam.put("PerSabun", req.getParameter("MiddleSabunAry" + oOo));
					
					MiddleParam.put("OptFlag", "Middle");
					MiddleParam.put("RegPerSabun", vo.getRegPerSabun());
					MiddleParam.put("DelFlag", req.getParameter("MiddleDelFlagAry" + oOo));
//					if(!MiddleParam.get("PerSabun").equals("")) MiddleList.add(MiddleParam);	기존방법 무조건 추가였으나 관련자만 추가로 수정(2015.01.14)
					if(!MiddleParam.get("PerSabun").equals("") && "N".equals(MiddleParam.get("DelFlag")))
						MiddleList.add(MiddleParam);
					
					ConsultParam.put("GrpCd", vo.getGrpCd());
					ConsultParam.put("CateCd", vo.getCateCd());
					ConsultParam.put("WriteCd", vo.getWriteCd());
					ConsultParam.put("PerSabun", req.getParameter("ConsultSabunAry" + oOo));
					ConsultParam.put("OptFlag", "Consult");
					ConsultParam.put("RegPerSabun", vo.getRegPerSabun());
					ConsultParam.put("DelFlag", req.getParameter("ConsultDelFlagAry" + oOo));
//					if(!ConsultParam.get("PerSabun").equals("")) ConsultList.add(ConsultParam);	기존방법 무조건 추가였으나 관련자만 추가로 수정(2015.01.14)
					if(!ConsultParam.get("PerSabun").equals("") && "N".equals(ConsultParam.get("DelFlag")))
						ConsultList.add(ConsultParam);
					
					//System.out.println("중간"+MiddleParam);
					//System.out.println("참조"+ConsultParam);
				
				}
				// 기존에 등록된 관련자 초기화(2015.01.14)
				if(vo.getCMD().equals("Edit")) boardDAO.BoardConfirmOptDelEnd(vo);			// 게시물 요청관련 담당자&참조인 삭제 완료(초기화)
				if(MiddleList.size() > 0) boardDAO.BoardConfirmOptProcEnd(MiddleList);		// 게시물 요청관련 담당자 등록/수정 완료
				if(ConsultList.size() > 0) boardDAO.BoardConfirmOptProcEnd(ConsultList);	// 게시물 요청관련 참조인 등록/수정 완료
			}
		}
	}
	
	// 게시물 보고완료처리 완료
	public void BoardWriteEnd(BoardVO vo) throws Exception {
		boardDAO.BoardWriteEnd(vo);
	}
	
	// 보고서 승인/반송 처리 완료
	public void BoardConfirmEnd(BoardVO vo) throws Exception {
		boardDAO.BoardConfirmInfoAddEnd(vo);
		
		if(vo.getWriteStatus().equals("return")) boardDAO.BoardConfirmEnd(vo);
		if(vo.getConfirmPerSabun().equals(vo.getRegPerSabun()) && vo.getWriteStatus().equals("end")) {
			boardDAO.BoardConfirmEnd(vo);
			
			if(vo.getHoliDocFlag().equals("Y") || vo.getHoliDocFlag().equals("F")) {	// 휴가보고서 승인이면
				/** 일정연동 **/
				ScheduleVO ScheVO = new ScheduleVO();
				
				ScheVO.setScheSeq(scheService.GetScheSeq());	// 일정시퀀스
				ScheVO.setPerSabun(vo.getPerSabun());			// 일정해당자
				ScheVO.setScheSDate(vo.getHoliSDate());			// 일정 시작일
				ScheVO.setScheEDate(vo.getHoliEDate());			// 일정 종료일
				ScheVO.setScheCon(vo.getWriteCon());			// 일정내용
				ScheVO.setSchePeriodFlag("N");					// 기간여부
				if(vo.getHoliFlag().equals("half")) {			// 반차이면
					ScheVO.setScheAllTime("N");					// 종일일정여부
					if(vo.getHalfFlag().equals("am")) {
						ScheVO.setScheTitle("오전반차");		// 일정제목
						ScheVO.setScheSTimeAMPM("AM");
						ScheVO.setScheSTime("8:30");
						ScheVO.setScheETimeAMPM("PM");
						ScheVO.setScheETime("2:00");
					}
					else {
						ScheVO.setScheTitle("오후반차");		// 일정제목
						ScheVO.setScheSTimeAMPM("PM");
						ScheVO.setScheSTime("2:00");
						ScheVO.setScheETimeAMPM("PM");
						ScheVO.setScheETime("6:00");
					}
				}
				else {	// 연차이면
					ScheVO.setScheAllTime("Y");					// 종일일정여부
					if(vo.getHoliDocFlag().equals("Y")) ScheVO.setScheTitle("휴가");				// 일정제목
					else {
						ScheVO.setScheTitle("경조휴가");
						ScheVO.setScheCon(vo.getEventDoc());
						ScheVO.setHoliDocFlag(vo.getHoliDocFlag());
					}
					ScheVO.setScheSTimeAMPM("AM");
					ScheVO.setScheSTime("8:30");
					ScheVO.setScheETimeAMPM("PM");
					ScheVO.setScheETime("6:00");
					if(!vo.getHoliUseDay().equals("1")) {
						boardDAO.SetScheSeq();
						ScheVO.setScheGrpCd("Period");			// 그룹코드
						ScheVO.setSchePeriodFlag("Y");			// 기간일정
					}
				}
				log.debug(ScheVO.toString());
				boardDAO.HoliScheduleAddEnd(ScheVO);
				
				/** 연차연동 **/
				if(vo.getHoliDocFlag().equals("Y")) boardDAO.WorkHoliAddEnd(vo);
			}
			else if(vo.getHoliDocFlag().equals("C")) {	// 휴가 취소 보고서 승인이면
				boardDAO.HoliCancelEditEnd(vo);
			}
		}
	}
	
	// 게시물 정보 받아오기
	public BoardVO GetBoardInfo(BoardVO vo) throws Exception {
		return boardDAO.GetBoardInfo(vo);
	}
	
	// 게시물 요청관련 담당자&참조인 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetBoardConfirmOptPerList(BoardVO vo) throws Exception {
		return boardDAO.GetBoardConfirmOptPerList(vo);
	}
	
	// 게시물 파일 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetBoardFileList(BoardVO vo) throws Exception {
		return boardDAO.GetBoardFileList(vo);
	}
	
	// 게시물 파일 정보 받아오기
	public BoardVO GetBoardFileInfo(BoardVO vo) throws Exception {
		return boardDAO.GetBoardFileInfo(vo);
	}
	
	// 게시물 파일 삭제 완료
	public void BoardFileDelEnd(BoardVO vo) throws Exception {
		boardDAO.BoardFileDelEnd(vo);
	}
	
	// 게시물 조회 정보 등록 완료
	public void BoardReadAddEnd(BoardVO vo) throws Exception {
		boardDAO.BoardReadAddEnd(vo);
	}
	
	// 게시물 조회수 업데이트 완료
	public void BoardHitEditEnd(BoardVO vo) throws Exception {
		boardDAO.BoardHitEditEnd(vo);
	}
		
	// 조회로그 리스트 불러오기
	@SuppressWarnings("rawtypes")
	public List GetBoardReadLogList(BoardVO vo) throws Exception {
		return boardDAO.GetBoardReadLogList(vo);
	}
	
	// 게시물 이동 완료
	public void BoardMoveEnd(BoardVO vo) throws Exception {
		System.out.println(vo.getWriteCd()+"==");
		vo.setWriteCd(boardDAO.GetWriteCd(vo));
		System.out.println("=="+vo.getWriteCd()+"==");
		
		boardDAO.BoardMoveEnd(vo);
//		boardDAO.GetWriteCd(vo);		// 이동할 게시판의 게시물 번호
//		boardDAO.GetBoardFileList(vo);	// 파일리스트
//		boardDAO.GetReplyList(vo);		// 댓글리스트
//		boardDAO.GetReplyFileList(vo);	// 댓글파일리스트
	}
	
	// 휴가 취소 보고를 위한 신청한 휴가내역 불러오기
	@SuppressWarnings("rawtypes")
	public List GetHoliList(BoardVO vo) throws Exception {
		return boardDAO.GetHoliList(vo);
	}
	
	// 휴가 취소에 따른 일정/연차 내역 삭제 완료
	public void HoliCancelEditEnd(BoardVO vo) throws Exception {
		boardDAO.HoliCancelEditEnd(vo);
	}
	/** 게시물 **/
	
	/** 댓글 **/
	// 댓글 리스트
	@SuppressWarnings("rawtypes")
	public List GetReplyList(BoardVO vo) throws Exception {
		return boardDAO.GetReplyList(vo);
	}

	// 댓글 파일 리스트
	@SuppressWarnings("rawtypes")
	public List GetReplyFileList(BoardVO vo) throws Exception {
		return boardDAO.GetReplyFileList(vo);
	}

	// 댓글 코드 받아오기
	public String GetReplyCd(BoardVO vo) throws Exception {
		return boardDAO.GetReplyCd(vo);
	}
		
	// 댓글 등록/수정/삭제 완료
	@SuppressWarnings("rawtypes")
	public void ReplyProcEnd(HttpServletRequest req, BoardVO vo) throws Exception {
		if(vo.getCMD().equals("Del")) boardDAO.ReplyFileDelEnd(vo);
		else {
			List FileList = FileUpLoad(req, vo, "Reply", "BoardFile", boardDAO.GetReplyFileSeq(vo));
			if(FileList.size() > 0) boardDAO.ReplyFileAddEnd(FileList);
			
			if(vo.getCMD().equals("Add")) {
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				Map<String, Object> paramTemp = new HashMap<String, Object>();
				paramTemp.put("GrpCd", vo.getGrpCd());
				paramTemp.put("CateCd", vo.getCateCd());
				paramTemp.put("WriteCd", vo.getWriteCd());
				paramTemp.put("ReplyCd", vo.getReplyCd());
				paramTemp.put("PerSabun", vo.getRegPerSabun());
				list.add(paramTemp);
				boardDAO.ReplyReadAddEnd(list);
			}
		}
		boardDAO.ReplyProcEnd(vo);
	}
	
	// 댓글 조회 정보 등록 완료
	@SuppressWarnings("rawtypes")
	public void ReplyReadAddEnd(List list) throws Exception {
		boardDAO.ReplyReadAddEnd(list);
	}
	/** 댓글 **/
}