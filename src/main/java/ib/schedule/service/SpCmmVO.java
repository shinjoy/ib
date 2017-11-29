package ib.schedule.service;

import java.io.Serializable;

@SuppressWarnings("serial")
public class SpCmmVO implements Serializable {
	private String searchCondition 		= "";	// 검색조건
	private String searchKeyword 		= "";	// 검색어
	private String searchUseYn			= "";	// 검색어 사용여부
	private String InfoMessage			= "";	// 경고문구
	private String DocType				= "";	// 문서 타입
    private String DocNm				= "";	// 문서 이름
    private String DocPage				= "";	// 문서 페이지
	
	private int pageIndex				= 1;	// 현재페이지
    private int pageUnit				= 5;	// 페이지갯수
    private int pageSize				= 1;	// 페이지 사이즈
    private int firstIndex				= 1;	// firstIndex
    private int lastIndex				= 1;	// lastIndex
    private int recordCountPerPage		= 1;	// recordCountPerPage
    private int seq;							// 페이징서 순번
	
    private String OrderFlag			= "";	// 정렬객체 문자, 숫자구분
	private String OrderType			= "";	// 정렬타입
	private String OrderKey				= "";	// 정렬기준
	private String OrderObj				= "";	// 정렬객체
	private String OrderObjNm			= "";	// 정렬객체명
	
	private String ZipCode				= "";	// 우편번호
	private String Sido					= "";	// 특별시,광역시,도
	private String Gugun				= "";	// 시,군,구
	private String Dong					= "";	// 읍,면,동,리,건물명
	private String Bunji				= "";	// 번지,아파트동,호수
	private String ZipCodeSeq			= "";	// 데이터 순서

	private String CellColor			= "onmouseover=\"this.style.background='#FEFFD5';\" onmouseout=\"this.style.background='#FFFFFF';\"";						// 일임
	private String CellColor2			= "bgcolor=\"#EAEAEA\" onmouseover=\"this.style.background='#FEFFD5';\" onmouseout=\"this.style.background='#EAEAEA';\"";	// 일임외
	private String NotCellColor			= "bgcolor=\"#F9BBBB\" onmouseover=\"this.style.background='#FEFFD5';\" onmouseout=\"this.style.background='#F9BBBB';\"";	// 일임 거래 해지
	private String NoneCellColor		= "bgcolor=\"#FEEFDE\" onmouseover=\"this.style.background='#FEFFD5';\" onmouseout=\"this.style.background='#FEEFDE';\"";	// 일임 거래 미등록
	private String HopeCellColor		= "bgcolor=\"#B8FCFA\" onmouseover=\"this.style.background='#FEFFD5';\" onmouseout=\"this.style.background='#B8FCFA';\"";	// 잠재
	private String EtcCellColor			= "bgcolor=\"#DDEEFF\" onmouseover=\"this.style.background='#FEFFD5';\" onmouseout=\"this.style.background='#DDEEFF';\"";	// 기타
	private String SellCellColor		= "bgcolor=\"#C2C2C2\" onmouseover=\"this.style.background='#FEFFD5';\" onmouseout=\"this.style.background='#C2C2C2';\"";	// 매각
	private String JoinCellColor		= "bgcolor=\"#AEAED7\" onmouseover=\"this.style.background='#FEFFD5';\" onmouseout=\"this.style.background='#AEAED7';\"";	// 공동투자고객
	private String JamunCellColor		= "bgcolor=\"#FFE0C1\" onmouseover=\"this.style.background='#FEFFD5';\" onmouseout=\"this.style.background='#FFE0C1';\"";	// 자문고객
	
	
	private String ClaimColor			= "bgcolor=\"#E9FEF5\" onmouseover=\"this.style.background='#FEFFD5';\" onmouseout=\"this.style.background='#E9FEF5';\"";	// 투자개요 행사가능
	private String CallOptionColor		= "bgcolor=\"#8EC5D4\" onmouseover=\"this.style.background='#FEFFD5';\" onmouseout=\"this.style.background='#8EC5D4';\"";	// 투자개요 콜옵션 행사일 해당
	
	private String NumOpt				= "size=\"14\" style=\"text-align:right;\" onkeyup=\"NumFormat(this.name, this.value);\"";
	private String NumOpt_S				= "size=\"10\" style=\"text-align:right;\" onkeyup=\"NumFormat(this.name, this.value);\"";
	private String DateOpt				= "size=\"12\" maxlength=\"10\" onkeyup=\"DateFormat(this.name, this.value);\"";
	
//	private String DivFix				= "style=\"height:100%;overflow:auto;scrollbar-face-color:#DADFE4;scrollbar-highlight-color:#FFFFFF;scrollbar-3dlight-color:#AEBACB;scrollbar-shadow-color:#7B8DA5;scrollbar-darkshadow-color:white;scrollbar-track-color:WHITE;scrollbar-arrow-color:white;\"";
	private String DivFix				= "style=\"height:100%;overflow:auto;\"";
	private String BaseFocus			= "onfocusin=\"BaseInFocus(this.id);\" onfocusout=\"BaseOutFocus(this.id);\"";
	private String Focus				= "onfocusin=\"InFocus(this.id);\" onfocusout=\"OutFocus(this.id);\"";
	
	private int NowYear					= 0;	// 현재년
	private int NowMonth				= 0;	// 현재월
	private int NowDay					= 0;	// 현재일
	private int SelYear					= 0;	// 선택년
	private int SelMonth				= 0;	// 선택월
	private int SelDay					= 0;	// 선택일
	private int StartDay				= 1;	// 해당월의 시작일
	private int EndDay					= 0;	// 해당월의 마지막일
	private int StartPosition			= 0;	// 해당월의 시작일의 위치
	private int EndPosition				= 0;	// 해당월의 마지막일 위치
	private int PreYear					= 0;	// 전년
	private int PreMonth				= 0;	// 전월
	private int NextYear				= 0;	// 후년
	private int NextMonth				= 0;	// 후월
	
	private String SelDate				= "";	// 선택년월일
	private String SearchSDate			= "";	// 검색 시작일
    private String SearchEDate			= "";	// 검색 종료일
	private String ObjNm				= "";	// 객체이름
	private String SubmitFlag			= "";	// 달력 선택후 서브밋 여부
	private String RegPerSabun			= "";
	
	private String MailTemp				= "<img src=\"http://106.250.177.91:8280/SynergyCus/images/sp/report/ReportBottom.gif\" width=\"250\" border=\"0\" alt=\"시너지 투자자문(주)\"><div style=\"border:3px solid #b4cef3;border-radius:10px;width:40%;min-width:700px;padding:10px;line-height:20pt;font-weight:bold;font-size:12pt;font-family:맑은 고딕, Verdana, Geneva, sans-serif;\">";

	
	public String getSearchCondition() {return searchCondition;}
	public void setSearchCondition(String searchCondition) {this.searchCondition = searchCondition;}
	
	public String getSearchKeyword() {return searchKeyword;}
	public void setSearchKeyword(String searchKeyword) {this.searchKeyword = searchKeyword;}
	
	public String getSearchUseYn() {return searchUseYn;}
	public void setSearchUseYn(String searchUseYn) {this.searchUseYn = searchUseYn;}
	
	public String getInfoMessage() {return InfoMessage;}
	public void setInfoMessage(String infoMessage) {this.InfoMessage = infoMessage;}
	
	public String getDocType() {return DocType;}
	public void setDocType(String docType) {this.DocType = docType;}
	
	public String getDocNm() {return DocNm;}
	public void setDocNm(String docNm) {this.DocNm = docNm;}
	
	public String getDocPage() {return DocPage;}
	public void setDocPage(String docPage) {this.DocPage = docPage;}
	
	public int getPageIndex() {return pageIndex;}
	public void setPageIndex(int pageIndex) {this.pageIndex = pageIndex;}
	
	public int getPageUnit() {return pageUnit;}
	public void setPageUnit(int pageUnit) {this.pageUnit = pageUnit;}
	
	public int getPageSize() {return pageSize;}
	public void setPageSize(int pageSize) {this.pageSize = pageSize;}
	
	public int getFirstIndex() {return firstIndex;}
	public void setFirstIndex(int firstIndex) {this.firstIndex = firstIndex;}
	
	public int getLastIndex() {return lastIndex;}
	public void setLastIndex(int lastIndex) {this.lastIndex = lastIndex;}
	
	public int getRecordCountPerPage() {return recordCountPerPage;}
	public void setRecordCountPerPage(int recordCountPerPage) {this.recordCountPerPage = recordCountPerPage;}
	
	public int getSeq() {return seq;}
	public void setSeq(int seq) {this.seq = seq;}
	
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
	
	public String getZipCode() {return ZipCode;}
	public void setZipCode(String zipCode) {this.ZipCode = zipCode;}
	
	public String getSido() {return Sido;}
	public void setSido(String sido) {this.Sido = sido;}
	
	public String getGugun() {return Gugun;}
	public void setGugun(String gugun) {this.Gugun = gugun;}
	
	public String getDong() {return Dong;}
	public void setDong(String dong) {this.Dong = dong;}
	
	public String getBunji() {return Bunji;}
	public void setBunji(String bunji) {this.Bunji = bunji;}
	
	public String getZipCodeSeq() {return ZipCodeSeq;}
	public void setZipCodeSeq(String zipCodeSeq) {ZipCodeSeq = zipCodeSeq;}
	
	public String getCellColor() {return CellColor;}
	public void setCellColor(String cellColor) {this.CellColor = cellColor;}
	
	public String getCellColor2() {return CellColor2;}
	public void setCellColor2(String cellColor2) {this.CellColor2 = cellColor2;}
	
	public String getNotCellColor() {return NotCellColor;}
	public void setNotCellColor(String notCellColor) {this.NotCellColor = notCellColor;}
	
	public String getNoneCellColor() {return NoneCellColor;}
	public void setNoneCellColor(String noneCellColor) {this.NoneCellColor = noneCellColor;}
	
	public String getHopeCellColor() {return HopeCellColor;}
	public void setHopeCellColor(String hopeCellColor) {this.HopeCellColor = hopeCellColor;}
	
	public String getEtcCellColor() {return EtcCellColor;}
	public void setEtcCellColor(String etcCellColor) {this.EtcCellColor = etcCellColor;}
	
	public String getSellCellColor() {return SellCellColor;}
	public void setSellCellColor(String sellCellColor) {this.SellCellColor = sellCellColor;}
	
	public String getJoinCellColor() {return JoinCellColor;}
	public void setJoinCellColor(String joinCellColor) {JoinCellColor = joinCellColor;}
	
	public String getJamunCellColor() {return JamunCellColor;}
	public void setJamunCellColor(String jamunCellColor) {JamunCellColor = jamunCellColor;}
	
	public String getClaimColor() {return ClaimColor;}
	public void setClaimColor(String claimColor) {this.ClaimColor = claimColor;}
	
	public String getCallOptionColor() {return CallOptionColor;}
	public void setCallOptionColor(String callOptionColor) {this.CallOptionColor = callOptionColor;}
		
	public String getNumOpt() {return NumOpt;}
	public void setNumOpt(String numOpt) {this.NumOpt = numOpt;}
	
	public String getNumOpt_S() {return NumOpt_S;}
	public void setNumOpt_S(String numOpt_S) {NumOpt_S = numOpt_S;}
	
	public String getDateOpt() {return DateOpt;}
	public void setDateOpt(String dateOpt) {DateOpt = dateOpt;}
	
	public String getBaseFocus() {return BaseFocus;}
	public void setBaseFocus(String baseFocus) {BaseFocus = baseFocus;}
	
	public String getDivFix() {return DivFix;}
	public void setDivFix(String divFix) {this.DivFix = divFix;}
	
	public String getFocus() {return Focus;}
	public void setFocus(String focus) {Focus = focus;}
	
	public int getNowYear() {return NowYear;}
	public void setNowYear(int nowYear) {this.NowYear = nowYear;}
	
	public int getNowMonth() {return NowMonth;}
	public void setNowMonth(int nowMonth) {this.NowMonth = nowMonth;}
	
	public int getNowDay() {return NowDay;}
	public void setNowDay(int nowDay) {this.NowDay = nowDay;}
	
	public int getSelYear() {return SelYear;}
	public void setSelYear(int selYear) {this.SelYear = selYear;}
	
	public int getSelMonth() {return SelMonth;}
	public void setSelMonth(int selMonth) {this.SelMonth = selMonth;}
	
	public int getSelDay() {return SelDay;}
	public void setSelDay(int selDay) {this.SelDay = selDay;}
	
	public int getStartDay() {return StartDay;}
	public void setStartDay(int startDay) {this.StartDay = startDay;}
	
	public int getEndDay() {return EndDay;}
	public void setEndDay(int endDay) {this.EndDay = endDay;}
	
	public int getStartPosition() {return StartPosition;}
	public void setStartPosition(int startPosition) {this.StartPosition = startPosition;}
	
	public int getEndPosition() {return EndPosition;}
	public void setEndPosition(int endPosition) {EndPosition = endPosition;}
	
	public int getPreYear() {return PreYear;}
	public void setPreYear(int preYear) {this.PreYear = preYear;}
	
	public int getPreMonth() {return PreMonth;}
	public void setPreMonth(int preMonth) {this.PreMonth = preMonth;}
	
	public int getNextYear() {return NextYear;}
	public void setNextYear(int nextYear) {this.NextYear = nextYear;}
	
	public int getNextMonth() {return NextMonth;}
	public void setNextMonth(int nextMonth) {this.NextMonth = nextMonth;}
	
	public String getSelDate() {return SelDate;}
	public void setSelDate(String selDate) {this.SelDate = selDate;}
	
	public String getSearchSDate() {return SearchSDate;}
	public void setSearchSDate(String searchSDate) {this.SearchSDate = searchSDate;}
	
	public String getSearchEDate() {return SearchEDate;}
	public void setSearchEDate(String searchEDate) {this.SearchEDate = searchEDate;}
	
	public String getObjNm() {return ObjNm;}
	public void setObjNm(String objNm) {this.ObjNm = objNm;}
	
	public String getSubmitFlag() {return SubmitFlag;}
	public void setSubmitFlag(String submitFlag) {this.SubmitFlag = submitFlag;}
	
	public String getRegPerSabun() {return RegPerSabun;}
	public void setRegPerSabun(String regPerSabun) {this.RegPerSabun = regPerSabun;}
	
	public String getMailTemp() {return MailTemp;}
	public void setMailTemp(String mailTemp) {MailTemp = mailTemp;}
}