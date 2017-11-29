package ib.schedule.service;

import java.io.Serializable;

import ib.schedule.service.EmpVO;

public class FormDocVO extends EmpVO implements Serializable {
	
	private static final long serialVersionUID = -8274004534207618049L;
	
	
//	private String PerNm					= "";
//	private String PerSabun					= "";
//	private String PerAddr					= "";
//	private String PerDept					= "";
//	private String PerPositionNm			= "";
//	private String PerJoinCom				= "";
//	private String ComPosition				= "";
	private String KeyWord					= "";
	private String SelYear					= "";
	private String SelMonth					= "";
	private String SearchSDate				= "";
	private String SearchEDate				= "";
//	private String EventType				= "";
//	private String OrderFlag				= "";	// 정렬객체 문자, 숫자구분
//	private String OrderType				= "";	// 정렬타입
//	private String OrderKey					= "";	// 정렬기준
//	private String OrderObj					= "";	// 정렬객체
//	private String OrderObjNm				= "";	// 정렬객체명
	
	
	private String FormDocCd				= "";	// 증명서코드
	private String FormDocNm				= "";	// 증명서명
	
	
	private String FormDocReqSeq			= "";	// 증명서 요청 순번
	private String ReqPerSabun				= "";	// 요청자 사번
	private String ReqPerNm					= "";	// 요청자명
	private String TargetPerSabun			= "";	// 해당자 사번
	private String TargetPerNm				= "";	// 해당자명
	private String Jumin1					= "";	// 주민번호1
	private String Jumin2					= "";	// 주민번호2
	private String JuminFlag				= "";	// 주민번호 공개여부
	private String Period					= "";	// 기간
	private String FormDocEtc				= "";	// 비고
	private String FormDocUse				= "";	// 용도
	private String FormDocReason			= "";	// 발급사유 (요청자와 해당자가 다를때만 사용)
	private String ReqDate					= "";	// 요청일
	private String ReqEndPerSabun			= "";	// 요청 완료자 사번
	private String ReqEndDate				= "";	// 요청완료일
	private String ReqStatus				= "";	// 요청상태
	
	
	

	
	
//	public String getPerNm() {return PerNm;}
//	public void setPerNm(String perNm) {PerNm = perNm;}
//	
//	public String getPerSabun() {return PerSabun;}
//	public void setPerSabun(String perSabun) {PerSabun = perSabun;}
//	
//	public String getPerAddr() {return PerAddr;}
//	public void setPerAddr(String perAddr) {PerAddr = perAddr;}
//	
//	public String getPerDept() {return PerDept;}
//	public void setPerDept(String perDept) {PerDept = perDept;}
//	
//	public String getPerPositionNm() {return PerPositionNm;}
//	public void setPerPositionNm(String perPositionNm) {PerPositionNm = perPositionNm;}
//	
//	public String getPerJoinCom() {return PerJoinCom;}
//	public void setPerJoinCom(String perJoinCom) {PerJoinCom = perJoinCom;}
//	
//	public String getComPosition() {return ComPosition;}
//	public void setComPosition(String comPosition) {ComPosition = comPosition;}
	
	public String getKeyWord() {return KeyWord;}
	public void setKeyWord(String keyWord) {KeyWord = keyWord;}
	
	public String getSelYear() {return SelYear;}
	public void setSelYear(String selYear) {SelYear = selYear;}
	
	public String getSelMonth() {return SelMonth;}
	public void setSelMonth(String selMonth) {SelMonth = selMonth;}
	
	public String getSearchSDate() {return SearchSDate;}
	public void setSearchSDate(String searchSDate) {SearchSDate = searchSDate;}

	public String getSearchEDate() {return SearchEDate;}
	public void setSearchEDate(String searchEDate) {SearchEDate = searchEDate;}
	
//	public String getEventType() {return EventType;}
//	public void setEventType(String eventType) {EventType = eventType;}
//	
//	public String getOrderFlag() {return OrderFlag;}
//	public void setOrderFlag(String orderFlag) {this.OrderFlag = orderFlag;}
//	
//	public String getOrderType() {return OrderType;}
//	public void setOrderType(String orderType) {this.OrderType = orderType;}
//	
//	public String getOrderKey() {return OrderKey;}
//	public void setOrderKey(String orderKey) {this.OrderKey = orderKey;}
//	
//	public String getOrderObj() {return OrderObj;}
//	public void setOrderObj(String orderObj) {this.OrderObj = orderObj;}
//	
//	public String getOrderObjNm() {return OrderObjNm;}
//	public void setOrderObjNm(String orderObjNm) {this.OrderObjNm = orderObjNm;}
	
	
	public String getFormDocCd() {return FormDocCd;}
	public void setFormDocCd(String formDocCd) {FormDocCd = formDocCd;}
	
	public String getFormDocNm() {return FormDocNm;}
	public void setFormDocNm(String formDocNm) {FormDocNm = formDocNm;}
	
	
	public String getFormDocReqSeq() {return FormDocReqSeq;}
	public void setFormDocReqSeq(String formDocReqSeq) {FormDocReqSeq = formDocReqSeq;}
	
	public String getReqPerSabun() {return ReqPerSabun;}
	public void setReqPerSabun(String reqPerSabun) {ReqPerSabun = reqPerSabun;}
	
	public String getReqPerNm() {return ReqPerNm;}
	public void setReqPerNm(String reqPerNm) {ReqPerNm = reqPerNm;}
	
	public String getTargetPerSabun() {return TargetPerSabun;}
	public void setTargetPerSabun(String targetPerSabun) {TargetPerSabun = targetPerSabun;}
	
	public String getTargetPerNm() {return TargetPerNm;}
	public void setTargetPerNm(String targetPerNm) {TargetPerNm = targetPerNm;}
	
	public String getJumin1() {return Jumin1;}
	public void setJumin1(String jumin1) {Jumin1 = jumin1;}
	
	public String getJumin2() {return Jumin2;}
	public void setJumin2(String jumin2) {Jumin2 = jumin2;}
	
	public String getJuminFlag() {return JuminFlag;}
	public void setJuminFlag(String juminFlag) {JuminFlag = juminFlag;}
	
	public String getPeriod() {return Period;}
	public void setPeriod(String period) {Period = period;}
	
	public String getFormDocEtc() {return FormDocEtc;}
	public void setFormDocEtc(String formDocEtc) {FormDocEtc = formDocEtc;}
	
	public String getFormDocUse() {return FormDocUse;}
	public void setFormDocUse(String formDocUse) {FormDocUse = formDocUse;}
	
	public String getFormDocReason() {return FormDocReason;}
	public void setFormDocReason(String formDocReason) {FormDocReason = formDocReason;}
	
	public String getReqDate() {return ReqDate;}
	public void setReqDate(String reqDate) {ReqDate = reqDate;}
	
	public String getReqEndPerSabun() {return ReqEndPerSabun;}
	public void setReqEndPerSabun(String reqEndPerSabun) {ReqEndPerSabun = reqEndPerSabun;}
	
	public String getReqEndDate() {return ReqEndDate;}
	public void setReqEndDate(String reqEndDate) {ReqEndDate = reqEndDate;}
	
	public String getReqStatus() {return ReqStatus;}
	public void setReqStatus(String reqStatus) {ReqStatus = reqStatus;}
}