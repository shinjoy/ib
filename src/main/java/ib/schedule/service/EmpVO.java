package ib.schedule.service;

import java.io.Serializable;

import ib.schedule.service.CusVO;

public class EmpVO extends CusVO implements Serializable {
	
	private String InfoMessage		= "";	// 경고문구
	private String DocType			= "";
	private String searchKeyword	= "";
	private String OrderFlag		= "";	// 정렬객체 문자, 숫자구분
	private String OrderType		= "";	// 정렬타입
	private String OrderKey			= "";	// 정렬기준
	private String OrderObj			= "";	// 정렬객체
	private String OrderObjNm		= "";	// 정렬객체명
	
	private String PerSabun			= "";	// 사번
	private String PerNm			= "";	// 사원명
	private String PerJumin			= "";	// 주민등록번호
	private String PerDept			= "";	// 부서
	private String ComPosition		= "";	// 소속회사
	private String compositionCd	= "";	// 소속회사코드
	private String PerPosition		= "";	// 직책코드
	private String PerPositionNm	= "";	// 직책
	private String PerJob			= "";	// 직무
	private String PerJoinCom		= "";	// 입사일
	private String PerOutCom		= "";	// 퇴사일
	private String PerComTel		= "";	// 내선번호
	private String PerId			= "";	// 아이디
	private String PerPW			= "";	// 비밀번호
	private String PerPhone			= "";	// 핸드폰
	private String SendNumFlag		= "";	// 발신번호 등록 여부
	private String PerEmail			= "";	// 이메일
	private String PerAddr			= "";	// 주소
	private String PerBirthday		= "";	// 생일
	private String MoonFlag			= "";	// 양력(S) 음력(L) 구분
	private String SeatNum			= "";	// 자리번호
	private String MailFlag			= "";	// 메일담당여부
	private String HolidayFlag		= "";	// 연차 관리 여부
	private String ViewFlag			= "";	// 리스트 출력여부
	private String PayFlag			= "";	// 급여관리 여부
	private String PayAccount		= "";	// 급여 계좌번호
	private String PayViewOrder		= "";	// 급여관리 출력순서
	private String MaxPayOrder		= "";	// 회사별 급여순서 최대값
	private String EmpInsuranceFlag	= "";	// 고용보험 공제여부
	private String RegDate			= "";	// 등록일
	private String RegPerSabun		= "";	// 등록자사번
	private String DelFlag			= "";	// 삭제여부
	
	private String EmpFlag			= "";	// 직원관리권한여부
	private String CusRFlag			= "";	// 고객관리읽기권한
	private String CusWFlag			= "";	// 고객관리쓰기권한
	
	private String PositionCd		= "";	// 직책순번
	private String PositionNm		= "";	// 직책명
	private String PositionOrder	= "";	// 직책출력순서
	
	private String DeptSeq			= "";	// 부서순번
	private String DeptNm			= "";	// 부서명
	private String TeamLeaderSabun	= "";	// 팀장사번
	private String TeamLeaderNm		= "";	// 팀장명	
	private String DeptOrder		= "";	// 부서출력순서
	private String OrderLog			= "";	// 기존출력순서
	
	private String office 			= "";	//회사
	
	
	private static final long serialVersionUID = -8274004534207618049L;
	
	public String getInfoMessage() {return InfoMessage;}
	public void setInfoMessage(String infoMessage) {InfoMessage = infoMessage;}
	
	public String getDocType() {return DocType;}
	public void setDocType(String docType) {DocType = docType;}
	
	public String getSearchKeyword() {return searchKeyword;}
	public void setSearchKeyword(String searchKeyword) {this.searchKeyword = searchKeyword;}
	
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
	
	public String getPerSabun() {return PerSabun;}
	public void setPerSabun(String perSabun) {PerSabun = perSabun;}
	
	public String getPerNm() {return PerNm;}
	public void setPerNm(String perNm) {PerNm = perNm;}
	
	public String getPerJumin() {return PerJumin;}
	public void setPerJumin(String perJumin) {PerJumin = perJumin;}
	
	public String getPerDept() {return PerDept;}
	public void setPerDept(String perDept) {PerDept = perDept;}
	
	public String getComPosition() {return ComPosition;}
	public void setComPosition(String comPosition) {ComPosition = comPosition;}
	
	public String getPerPositionNm() {return PerPositionNm;}
	public void setPerPositionNm(String perPositionNm) {PerPositionNm = perPositionNm;}
	
	public String getPerJob() {return PerJob;}
	public void setPerJob(String perJob) {PerJob = perJob;}
	
	public String getPerJoinCom() {return PerJoinCom;}
	public void setPerJoinCom(String perJoinCom) {PerJoinCom = perJoinCom;}
	
	public String getPerOutCom() {return PerOutCom;}
	public void setPerOutCom(String perOutCom) {PerOutCom = perOutCom;}
	
	public String getPerComTel() {return PerComTel;}
	public void setPerComTel(String perComTel) {PerComTel = perComTel;}
	
	public String getPerId() {return PerId;}
	public void setPerId(String perId) {PerId = perId;}
	
	public String getPerPW() {return PerPW;}
	public void setPerPW(String perPW) {PerPW = perPW;}
	
	public String getPerPhone() {return PerPhone;}
	public void setPerPhone(String perPhone) {PerPhone = perPhone;}
	
	public String getSendNumFlag() {return SendNumFlag;}
	public void setSendNumFlag(String sendNumFlag) {SendNumFlag = sendNumFlag;}
	
	public String getPerEmail() {return PerEmail;}
	public void setPerEmail(String perEmail) {PerEmail = perEmail;}
	
	public String getPerAddr() {return PerAddr;}
	public void setPerAddr(String perAddr) {PerAddr = perAddr;}
	
	public String getPerBirthday() {return PerBirthday;}
	public void setPerBirthday(String perBirthday) {PerBirthday = perBirthday;}
	
	public String getMoonFlag() {return MoonFlag;}
	public void setMoonFlag(String moonFlag) {MoonFlag = moonFlag;}
	
	public String getSeatNum() {return SeatNum;}
	public void setSeatNum(String seatNum) {SeatNum = seatNum;}
	
	public String getMailFlag() {return MailFlag;}
	public void setMailFlag(String mailFlag) {MailFlag = mailFlag;}
	
	public String getHolidayFlag() {return HolidayFlag;}
	public void setHolidayFlag(String holidayFlag) {HolidayFlag = holidayFlag;}
	
	public String getViewFlag() {return ViewFlag;}
	public void setViewFlag(String viewFlag) {ViewFlag = viewFlag;}
	
	public String getPayFlag() {return PayFlag;}
	public void setPayFlag(String payFlag) {PayFlag = payFlag;}
	
	public String getPayAccount() {return PayAccount;}
	public void setPayAccount(String payAccount) {PayAccount = payAccount;}
	
	public String getPayViewOrder() {return PayViewOrder;}
	public void setPayViewOrder(String payViewOrder) {PayViewOrder = payViewOrder;}
	
	public String getMaxPayOrder() {return MaxPayOrder;}
	public void setMaxPayOrder(String maxPayOrder) {MaxPayOrder = maxPayOrder;}
	
	public String getEmpInsuranceFlag() {return EmpInsuranceFlag;}
	public void setEmpInsuranceFlag(String empInsuranceFlag) {EmpInsuranceFlag = empInsuranceFlag;}
	
	public String getRegDate() {return RegDate;}
	public void setRegDate(String regDate) {RegDate = regDate;}
	
	public String getRegPerSabun() {return RegPerSabun;}
	public void setRegPerSabun(String regPerSabun) {RegPerSabun = regPerSabun;}
	
	public String getDelFlag() {return DelFlag;}
	public void setDelFlag(String delFlag) {DelFlag = delFlag;}

	public String getEmpFlag() {return EmpFlag;}
	public void setEmpFlag(String empFlag) {EmpFlag = empFlag;}
	
	public String getCusRFlag() {return CusRFlag;}
	public void setCusRFlag(String cusRFlag) {CusRFlag = cusRFlag;}
	
	public String getCusWFlag() {return CusWFlag;}
	public void setCusWFlag(String cusWFlag) {CusWFlag = cusWFlag;}
	
	public String getPositionCd() {return PositionCd;}
	public void setPositionCd(String positionCd) {PositionCd = positionCd;}
	
	public String getPositionNm() {return PositionNm;}
	public void setPositionNm(String positionNm) {PositionNm = positionNm;}
	
	public String getPositionOrder() {return PositionOrder;}
	public void setPositionOrder(String positionOrder) {PositionOrder = positionOrder;}
	
	public String getDeptSeq() {return DeptSeq;}
	public void setDeptSeq(String deptSeq) {DeptSeq = deptSeq;}
	
	public String getDeptNm() {return DeptNm;}
	public void setDeptNm(String deptNm) {DeptNm = deptNm;}
	
	public String getTeamLeaderSabun() {return TeamLeaderSabun;}
	public void setTeamLeaderSabun(String teamLeaderSabun) {TeamLeaderSabun = teamLeaderSabun;}
	
	public String getTeamLeaderNm() {return TeamLeaderNm;}
	public void setTeamLeaderNm(String teamLeaderNm) {TeamLeaderNm = teamLeaderNm;}
	
	public String getDeptOrder() {return DeptOrder;}
	public void setDeptOrder(String deptOrder) {DeptOrder = deptOrder;}
	
	public String getOrderLog() {return OrderLog;}
	public void setOrderLog(String orderLog) {OrderLog = orderLog;}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	public String getCompositionCd() {
		return compositionCd;
	}
	public void setCompositionCd(String compositionCd) {
		this.compositionCd = compositionCd;
	}
	public String getPerPosition() {
		return PerPosition;
	}
	public void setPerPosition(String perPosition) {
		PerPosition = perPosition;
	}
}