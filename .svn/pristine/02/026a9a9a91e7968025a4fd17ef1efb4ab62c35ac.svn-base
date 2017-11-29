package ib.board.service.impl;

import ib.board.service.PagingInfo;

import java.io.Serializable;



public class BoardVO extends PagingInfo implements Serializable {
	
	private static final long serialVersionUID = -8274004534207618049L;
	private String sabun="";
	// 게시판 그룹
	private String GrpCd					= "";			// 그룹코드
	private String GrpNm					= "";			// 그룹명
	private String GrpInfo					= "";			// 그룹설명
	private String GrpOrder					= "";			// 그룹순서
	private String GrpOrderLog				= "";			// 그룹순서로그
	private String ConfirmProcFlag			= "";			// 컨펌여부
	
	// 게시판 카테고리 종류
	private String CateCd					= "";			// 게시판코드
	private String CateNm					= "";			// 게시판명
	private String CateInfo					= "";			// 게시판설명
	private String CateOrder				= "";			// 게시판순서
	private String CateOrderLog				= "";			// 게시판순서로그
	private String ConfirmPerSabun			= "";			// 승인게시판의 경우 승인자사번 (유무에 따라 승인기능 사용여부 판단)
	private String ConfirmPerNm				= "";
	private String OldCateCd				= "";
	private String OldWriteCd				= "";
	
	private String OptCd					= "";
	private int OptSeq						= 0;
	private int OptSeqLog					= 0;
	private String OptFlag					= "";	// 참조인 및 중간승인자 구분
	
	// 게시물
	private String WriteCd					= "";	// 글순번
	private String WriteTitle				= "";	// 제목
	private String WriteCon					= "";	// 내용
	private String NoticeFlag				= "";	// 공지여부
	private String NoticeSDate				= "";	// 공지시작일
	private String NoticeEDate				= "";	// 공지종료일
	private int Hit							= 0;	// 조회수
	private String WriteStatus				= "";	// 글상태
	private String BoardVer					= "";	// 글버전
	private String ReadDate					= "";	// 조회일
	
	// 휴가보고서
	private String HoliDocFlag				= "";	// 휴가보고서여부 (Y - 휴가보고서, N - 일반보고서, F - 경조사보고서)
	private String HoliFlag					= "";	// 휴가유형 half - 반차, all - 종일
	private String HoliFlagNm				= "";
	private String HalfFlag					= "";	// 반차유형 am - 오전, pm - 오후
	private String HalfFlagNm				= "";
	private String HoliSDate				= "";	// 휴가시작일
	private String HoliSDateNm				= "";
	private String HoliEDate				= "";	// 휴가종료일
	private String HoliEDateNm				= "";
	private String HoliUseDay				= "";	// 총사용일
	private String HoliCancelCd				= "";	// 휴가 취소 부모글
	
	// 경조사 보고서
	private String EventSelCd1				= "";	// 경조사분류
	private String EventSelCd2				= "";	// 세부분류
	private String EventDay					= "";	// 경조일
	private String EventDoc					= "";	// 경조 증빙서류
	
	// 댓글
	private String ReplyCd					= "";	// 댓글코드
	private String ReplyCon					= "";	// 댓글내용
	private String ReplyPerSabun			= "";	// 댓글작성자코드
	private String ReplyPerNm				= "";	// 댓글작성자명
	private String ReadFlag					= "";
	
	// 결제정보
	private String ConfirmSeq				= "";	// 결제순번
	private String ConfirmStatus			= "";	// 결제상태 (ing - 진행, return - 반송, end - 완료)
	private String ConfirmCon				= "";	// 결제내용
	private String ConfirmDate				= "";	// 결제일자
	private String MiddleCnt				= "";	// 중간승인자수
	private String EndCnt					= "";	// 중간승인자 승인 수
	private String ReturnCnt				= "";	// 중간승인자 반송 수
	
	
	// 공통
	private String PerSabun					= "";
	private String PerPositionNm			= "";
	private String PerDept					= "";
	private String PerJoinCom				= "";
	private String CMD						= "";
	private String PopFlag					= "";
	private String EventType				= "";
	private String RegPerSabun				= "";
	private String RegPerNm					= "";
	private String RegDate					= "";
	private String RegYear					= "";
	private String RegMonth					= "";
	private String EditPerSabun				= "";
	private String EditDate					= "";
	private String DelPerSabun				= "";
	private String DelDate					= "";
	private String DelFlag					= "";
	private String FileSeq					= "";	// 파일순번
	private String FileNm					= "";	// 파일명
	private String FileUpNm					= "";	// 업로드된 파일명
	private String FilePath					= "";	// 파일경로
	private String FileIco					= "";	// 파일확장자아이콘
	private long FileSize					= 0L;	// 파일크기
	private int FileOrder					= 0;	// 파일출력순서
	private int MaxFileSize					= 10 * 1024 * 1024;	// 파일크기
	
	private String OrderFlag				= "";	// 정렬객체 문자, 숫자구분
	private String OrderType				= "";	// 정렬타입
	private String OrderKey					= "";	// 정렬기준
	private String OrderObj					= "";	// 정렬객체
	private String OrderObjNm				= "";	// 정렬객체명
	private String KeyType					= "";	// 검색조건
	private String KeyWord					= "";	// 검색어
	private String division 				= "";   //회사
	
	private String readN					= "";	//읽음여부
	
	public String getReadN() {
		return readN;
	}
	public void setReadN(String readN) {
		this.readN = readN;
	}
	
	
	public String getSabun() {
		return sabun;
	}
	public void setSabun(String sabun) {
		this.sabun = sabun;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	// 게시판 종류
	public String getGrpCd() {return GrpCd;}
	public void setGrpCd(String grpCd) {GrpCd = grpCd;}
	
	public String getGrpNm() {return GrpNm;}
	public void setGrpNm(String grpNm) {GrpNm = grpNm;}
	
	public String getGrpInfo() {return GrpInfo;}
	public void setGrpInfo(String grpInfo) {GrpInfo = grpInfo;}
	
	public String getGrpOrder() {return GrpOrder;}
	public void setGrpOrder(String grpOrder) {GrpOrder = grpOrder;}
	
	public String getGrpOrderLog() {return GrpOrderLog;}
	public void setGrpOrderLog(String grpOrderLog) {GrpOrderLog = grpOrderLog;}
	
	public String getConfirmProcFlag() {return ConfirmProcFlag;}
	public void setConfirmProcFlag(String confirmProcFlag) {ConfirmProcFlag = confirmProcFlag;}
	
	// 게시판 하위 종류
	public String getCateCd() {return CateCd;}
	public void setCateCd(String cateCd) {CateCd = cateCd;}
	
	public String getCateNm() {return CateNm;}
	public void setCateNm(String cateNm) {CateNm = cateNm;}
	
	public String getCateInfo() {return CateInfo;}
	public void setCateInfo(String cateInfo) {CateInfo = cateInfo;}
	
	public String getCateOrder() {return CateOrder;}
	public void setCateOrder(String cateOrder) {CateOrder = cateOrder;}
	
	public String getCateOrderLog() {return CateOrderLog;}
	public void setCateOrderLog(String cateOrderLog) {CateOrderLog = cateOrderLog;}
	
	public String getOptCd() {return OptCd;}
	public void setOptCd(String optCd) {OptCd = optCd;}
	
	public String getConfirmPerSabun() {return ConfirmPerSabun;}
	public void setConfirmPerSabun(String confirmPerSabun) {ConfirmPerSabun = confirmPerSabun;}
	
	public String getOldCateCd() {return OldCateCd;}
	public void setOldCateCd(String oldCateCd) {OldCateCd = oldCateCd;}

	public String getOldWriteCd() {return OldWriteCd;}
	public void setOldWriteCd(String oldWriteCd) {OldWriteCd = oldWriteCd;}
	
	public String getConfirmPerNm() {return ConfirmPerNm;}
	public void setConfirmPerNm(String confirmPerNm) {ConfirmPerNm = confirmPerNm;}
	
	public int getOptSeq() {return OptSeq;}
	public void setOptSeq(int optSeq) {OptSeq = optSeq;}
	
	public int getOptSeqLog() {return OptSeqLog;}
	public void setOptSeqLog(int optSeqLog) {OptSeqLog = optSeqLog;}
	
	public String getOptFlag() {return OptFlag;}
	public void setOptFlag(String optFlag) {OptFlag = optFlag;}
	
	// 게시물
	public String getWriteCd() {return WriteCd;}
	public void setWriteCd(String writeCd) {WriteCd = writeCd;}
	
	public String getWriteTitle() {return WriteTitle;}
	public void setWriteTitle(String writeTitle) {WriteTitle = writeTitle;}
	
	public String getWriteCon() {return WriteCon;}
	public void setWriteCon(String writeCon) {WriteCon = writeCon;}
	
	public String getNoticeFlag() {return NoticeFlag;}
	public void setNoticeFlag(String noticeFlag) {NoticeFlag = noticeFlag;}
	
	public String getNoticeSDate() {return NoticeSDate;}
	public void setNoticeSDate(String noticeSDate) {NoticeSDate = noticeSDate;}
	
	public String getNoticeEDate() {return NoticeEDate;}
	public void setNoticeEDate(String noticeEDate) {NoticeEDate = noticeEDate;}
	
	public int getHit() {return Hit;}
	public void setHit(int hit) {Hit = hit;}
	
	public String getWriteStatus() {return WriteStatus;}
	public void setWriteStatus(String writeStatus) {WriteStatus = writeStatus;}
	
	public String getBoardVer() {return BoardVer;}
	public void setBoardVer(String boardVer) {BoardVer = boardVer;}
	
	public String getReadDate() {return ReadDate;}
	public void setReadDate(String readDate) {ReadDate = readDate;}
	
	// 휴가보고서
	public String getHoliDocFlag() {return HoliDocFlag;}
	public void setHoliDocFlag(String holiDocFlag) {HoliDocFlag = holiDocFlag;}
	
	public String getHoliFlag() {return HoliFlag;}
	public void setHoliFlag(String holiFlag) {HoliFlag = holiFlag;}
	
	public String getHoliFlagNm() {return HoliFlagNm;}
	public void setHoliFlagNm(String holiFlagNm) {HoliFlagNm = holiFlagNm;}
	
	public String getHalfFlag() {return HalfFlag;}
	public void setHalfFlag(String halfFlag) {HalfFlag = halfFlag;}
	
	public String getHalfFlagNm() {return HalfFlagNm;}
	public void setHalfFlagNm(String halfFlagNm) {HalfFlagNm = halfFlagNm;}
	
	public String getHoliSDate() {return HoliSDate;}
	public void setHoliSDate(String holiSDate) {HoliSDate = holiSDate;}
	
	public String getHoliSDateNm() {return HoliSDateNm;}
	public void setHoliSDateNm(String holiSDateNm) {HoliSDateNm = holiSDateNm;}
	
	public String getHoliEDate() {return HoliEDate;}
	public void setHoliEDate(String holiEDate) {HoliEDate = holiEDate;}
	
	public String getHoliEDateNm() {return HoliEDateNm;}
	public void setHoliEDateNm(String holiEDateNm) {HoliEDateNm = holiEDateNm;}
	
	public String getHoliUseDay() {return HoliUseDay;}
	public void setHoliUseDay(String holiUseDay) {HoliUseDay = holiUseDay;}
	
	public String getHoliCancelCd() {return HoliCancelCd;}
	public void setHoliCancelCd(String holiCancelCd) {HoliCancelCd = holiCancelCd;}
	
	// 경조사 보고서
	public String getEventSelCd1() {return EventSelCd1;}
	public void setEventSelCd1(String eventSelCd1) {EventSelCd1 = eventSelCd1;}
	
	public String getEventSelCd2() {return EventSelCd2;}
	public void setEventSelCd2(String eventSelCd2) {EventSelCd2 = eventSelCd2;}
	
	public String getEventDay() {return EventDay;}
	public void setEventDay(String eventDay) {EventDay = eventDay;}
	
	public String getEventDoc() {return EventDoc;}
	public void setEventDoc(String eventDoc) {EventDoc = eventDoc;}
	
	// 댓글
	public String getReplyCd() {return ReplyCd;}
	public void setReplyCd(String replyCd) {ReplyCd = replyCd;}
	
	public String getReplyCon() {return ReplyCon;}
	public void setReplyCon(String replyCon) {ReplyCon = replyCon;}
	
	public String getReplyPerSabun() {return ReplyPerSabun;}
	public void setReplyPerSabun(String replyPerSabun) {ReplyPerSabun = replyPerSabun;}
	
	public String getReplyPerNm() {return ReplyPerNm;}
	public void setReplyPerNm(String replyPerNm) {ReplyPerNm = replyPerNm;}
	
	public String getReadFlag() {return ReadFlag;}
	public void setReadFlag(String readFlag) {ReadFlag = readFlag;}
	
	// 결제정보
	public String getConfirmSeq() {return ConfirmSeq;}
	public void setConfirmSeq(String confirmSeq) {ConfirmSeq = confirmSeq;}
	
	public String getConfirmStatus() {return ConfirmStatus;}
	public void setConfirmStatus(String confirmStatus) {ConfirmStatus = confirmStatus;}
	
	public String getConfirmCon() {return ConfirmCon;}
	public void setConfirmCon(String confirmCon) {ConfirmCon = confirmCon;}
	
	public String getConfirmDate() {return ConfirmDate;}
	public void setConfirmDate(String confirmDate) {ConfirmDate = confirmDate;}
	
	public String getMiddleCnt() {return MiddleCnt;}
	public void setMiddleCnt(String middleCnt) {MiddleCnt = middleCnt;}
	
	public String getEndCnt() {return EndCnt;}
	public void setEndCnt(String endCnt) {EndCnt = endCnt;}
	
	public String getReturnCnt() {return ReturnCnt;}
	public void setReturnCnt(String returnCnt) {ReturnCnt = returnCnt;}
	
	// 공통
	public String getPerSabun() {return PerSabun;}
	public void setPerSabun(String perSabun) {PerSabun = perSabun;}
	
	public String getPerPositionNm() {return PerPositionNm;}
	public void setPerPositionNm(String perPositionNm) {PerPositionNm = perPositionNm;}
	
	public String getPerDept() {return PerDept;}
	public void setPerDept(String perDept) {PerDept = perDept;}
	
	public String getPerJoinCom() {return PerJoinCom;}
	public void setPerJoinCom(String perJoinCom) {PerJoinCom = perJoinCom;}
	
	public String getCMD() {return CMD;}
	public void setCMD(String cMD) {CMD = cMD;}
	
	public String getPopFlag() {return PopFlag;}
	public void setPopFlag(String popFlag) {PopFlag = popFlag;}
	
	public String getEventType() {return EventType;}
	public void setEventType(String eventType) {EventType = eventType;}
	
	public String getRegPerSabun() {return RegPerSabun;}
	public void setRegPerSabun(String regPerSabun) {RegPerSabun = regPerSabun;}
	
	public String getRegPerNm() {return RegPerNm;}
	public void setRegPerNm(String regPerNm) {RegPerNm = regPerNm;}
	
	public String getRegDate() {return RegDate;}
	public void setRegDate(String regDate) {RegDate = regDate;}
	
	public String getRegYear() {return RegYear;}
	public void setRegYear(String regYear) {RegYear = regYear;}
	
	public String getRegMonth() {return RegMonth;}
	public void setRegMonth(String regMonth) {RegMonth = regMonth;}
	
	public String getEditPerSabun() {return EditPerSabun;}
	public void setEditPerSabun(String editPerSabun) {EditPerSabun = editPerSabun;}
	
	public String getEditDate() {return EditDate;}
	public void setEditDate(String editDate) {EditDate = editDate;}
	
	public String getDelPerSabun() {return DelPerSabun;}
	public void setDelPerSabun(String delPerSabun) {DelPerSabun = delPerSabun;}
	
	public String getDelDate() {return DelDate;}
	public void setDelDate(String delDate) {DelDate = delDate;}
	
	public String getDelFlag() {return DelFlag;}
	public void setDelFlag(String delFlag) {DelFlag = delFlag;}
	
	public String getFileSeq() {return FileSeq;}
	public void setFileSeq(String fileSeq) {FileSeq = fileSeq;}
	
	public String getFileNm() {return FileNm;}
	public void setFileNm(String fileNm) {FileNm = fileNm;}
	
	public String getFileUpNm() {return FileUpNm;}
	public void setFileUpNm(String fileUpNm) {FileUpNm = fileUpNm;}
	
	public String getFilePath() {return FilePath;}
	public void setFilePath(String filePath) {FilePath = filePath;}
	
	public String getFileIco() {return FileIco;}
	public void setFileIco(String fileIco) {FileIco = fileIco;}
	
	public long getFileSize() {return FileSize;}
	public void setFileSize(long fileSize) {FileSize = fileSize;}
	
	public int getFileOrder() {return FileOrder;}
	public void setFileOrder(int fileOrder) {FileOrder = fileOrder;}
	
	public int getMaxFileSize() {return MaxFileSize;}
	public void setMaxFileSize(int maxFileSize) {MaxFileSize = maxFileSize;}
	
	public String getOrderFlag() {return OrderFlag;}
	public void setOrderFlag(String orderFlag) {this.OrderFlag = orderFlag;}
	
	public String getOrderType() {return OrderType;}
	public void setOrderType(String orderType) {this.OrderType = orderType;}
	
	public String getOrderKey() {return OrderKey;}
	public void setOrderKey(String orderKey) {this.OrderKey = orderKey;}
	
	public String getOrderObj() {return OrderObj;}
	public void setOrderObj(String orderObj) {this.OrderObj = orderObj;}
	
	public String getOrderObjNm() {return OrderObjNm;}
	public void setOrderObjNm(String orderObjNm) {this.OrderObjNm = orderObjNm;}
	
	public String getKeyType() {return KeyType;}
	public void setKeyType(String keyType) {KeyType = keyType;}
	
	public String getKeyWord() {return KeyWord;}
	public void setKeyWord(String keyWord) {KeyWord = keyWord;}
	
	
}