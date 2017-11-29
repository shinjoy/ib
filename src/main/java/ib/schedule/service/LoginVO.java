package ib.schedule.service;

import java.io.Serializable;

import ib.schedule.service.EmpVO;

public class LoginVO extends EmpVO implements Serializable {
	
	private String InfoMessage		= "";				// 경고문구
	private String CMD				= "";				// 명령
	
	/** IB Login **/
	private String IB_ID			= "";
	private String IB_PW			= "";
	private String Flag				= "";
	/** IB Login **/
	
	private String PerSabun			= "";				// 사번
	private String PerNm			= "";				// 사원명
	private String PerDept			= "";				// 부서
	private String PerPositionNm	= "";				// 직책
	private String ComPosition		= "";				// 소속
	private String PerJoinCom		= "";				// 입사일
	private String PerId			= "";				// 아이디
	private String PerPW			= "";				// 비밀번호
	private String PerPhone			= "";				// 핸드폰
	private String PerEmail			= "";				// 이메일
	private String PerAddr			= "";				// 주소
	private String GMailId			= "";				// Gmail 계정
	private String GMailPW			= "";				// Gmail 비밀번호
	private String RegDate			= "";				// 등록일
	private String RegPerSabun		= "";				// 등록자사번
	private String DelFlag			= "";				// 삭제여부
	
	private String OldPerPW			= "";				// 기존비밀번호
	private String NewPerPW			= "";				// 신규비밀번호
	private String RePerPW			= "";				// 비밀번호확인
	
	private String EmpFlag			= "";				// 직원관리권한여부
	private String HolidayFlag		= "";				// 연차 관리 여부
	private String CusRFlag			= "";				// 고객관리읽기권한
	private String CusWFlag			= "";				// 고객관리쓰기권한
	private String MasterFlag		= "";				// 총괄권한
	
	private String FileSeq			= "";				// 파일순번
	private String FileNm			= "";				// 파일명
	private String FileUpNm			= "";				// 업로드된 파일명
	private String FilePath			= "";				// 파일경로
	private long FileSize			= 0L;				// 파일크기
	private int FileOrder			= 0;				// 파일출력순서
	private int MaxFileSize			= 10 * 1024 * 1024;	// 파일크기
	
	/** 고객 게시판 **/
	private String CusCd			= "";				// 고객코드
	private String CusNm			= "";				// 고객명
	private String CusId			= "";				// 고객아이디
	private String CusPW			= "";				// 고객비밀번호
	private String UseFlag			= "";				// 계정 사용여부
	private String CusTel			= "";				// 고객 전화번호
	private String CusStatus		= "";				// 고객상태
	private String LatelyVisit		= "";				// 최근방문일자
	private String VisitCnt			= "";				// 방문횟수
	/** 고객 게시판 **/
	
	
	private String usrCusId			= "";				//사용자 고객 cusId (ib_customer.s_nb)
	private String staffSnb			= "";				//ib_staff.s_nb
	private String division			= "";				//division
	
	
	private static final long serialVersionUID = -8274004534207618049L;
	
	public String getInfoMessage() {return InfoMessage;}
	public void setInfoMessage(String infoMessage) {InfoMessage = infoMessage;}
	
	public String getCMD() {return CMD;}
	public void setCMD(String cMD) {CMD = cMD;}
	
	
	/** IB Login **/
	public String getIB_ID() {return IB_ID;}
	public void setIB_ID(String iB_ID) {IB_ID = iB_ID;}
	
	public String getIB_PW() {return IB_PW;}
	public void setIB_PW(String iB_PW) {IB_PW = iB_PW;}
	
	public String getFlag() {return Flag;}
	public void setFlag(String flag) {Flag = flag;}
	/** IB Login **/
	
	public String getPerSabun() {return PerSabun;}
	public void setPerSabun(String perSabun) {PerSabun = perSabun;}
	
	public String getPerNm() {return PerNm;}
	public void setPerNm(String perNm) {PerNm = perNm;}
	
	public String getPerDept() {return PerDept;}
	public void setPerDept(String perDept) {PerDept = perDept;}
	
	public String getPerPositionNm() {return PerPositionNm;}
	public void setPerPositionNm(String perPositionNm) {PerPositionNm = perPositionNm;}
	
	public String getComPosition() {return ComPosition;}
	public void setComPosition(String comPosition) {ComPosition = comPosition;}
	
	public String getPerJoinCom() {return PerJoinCom;}
	public void setPerJoinCom(String perJoinCom) {PerJoinCom = perJoinCom;}
	
	public String getPerId() {return PerId;}
	public void setPerId(String perId) {PerId = perId;}
	
	public String getPerPW() {return PerPW;}
	public void setPerPW(String perPW) {PerPW = perPW;}
	
	public String getPerPhone() {return PerPhone;}
	public void setPerPhone(String perPhone) {PerPhone = perPhone;}
	
	public String getPerEmail() {return PerEmail;}
	public void setPerEmail(String perEmail) {PerEmail = perEmail;}
	
	public String getPerAddr() {return PerAddr;}
	public void setPerAddr(String perAddr) {PerAddr = perAddr;}
	
	public String getGMailId() {return GMailId;}
	public void setGMailId(String gMailId) {GMailId = gMailId;}
	
	public String getGMailPW() {return GMailPW;}
	public void setGMailPW(String gMailPW) {GMailPW = gMailPW;}
	
	public String getRegDate() {return RegDate;}
	public void setRegDate(String regDate) {RegDate = regDate;}
	
	public String getRegPerSabun() {return RegPerSabun;}
	public void setRegPerSabun(String regPerSabun) {RegPerSabun = regPerSabun;}
	
	public String getDelFlag() {return DelFlag;}
	public void setDelFlag(String delFlag) {DelFlag = delFlag;}
	
	public String getOldPerPW() {return OldPerPW;}
	public void setOldPerPW(String oldPerPW) {OldPerPW = oldPerPW;}
	
	public String getNewPerPW() {return NewPerPW;}
	public void setNewPerPW(String newPerPW) {NewPerPW = newPerPW;}
	
	public String getRePerPW() {return RePerPW;}
	public void setRePerPW(String rePerPW) {RePerPW = rePerPW;}
	
	public String getEmpFlag() {return EmpFlag;}
	public void setEmpFlag(String empFlag) {EmpFlag = empFlag;}
	
	public String getHolidayFlag() {return HolidayFlag;}
	public void setHolidayFlag(String holidayFlag) {HolidayFlag = holidayFlag;}
	
	public String getCusRFlag() {return CusRFlag;}
	public void setCusRFlag(String cusRFlag) {CusRFlag = cusRFlag;}
	
	public String getCusWFlag() {return CusWFlag;}
	public void setCusWFlag(String cusWFlag) {CusWFlag = cusWFlag;}
	
	public String getMasterFlag() {return MasterFlag;}
	public void setMasterFlag(String masterFlag) {MasterFlag = masterFlag;}
	
	public String getFileSeq() {return FileSeq;}
	public void setFileSeq(String fileSeq) {FileSeq = fileSeq;}
	
	public String getFileNm() {return FileNm;}
	public void setFileNm(String fileNm) {FileNm = fileNm;}
	
	public String getFileUpNm() {return FileUpNm;}
	public void setFileUpNm(String fileUpNm) {FileUpNm = fileUpNm;}
	
	public String getFilePath() {return FilePath;}
	public void setFilePath(String filePath) {FilePath = filePath;}
	
	public long getFileSize() {return FileSize;}
	public void setFileSize(long fileSize) {FileSize = fileSize;}
	
	public int getFileOrder() {return FileOrder;}
	public void setFileOrder(int fileOrder) {FileOrder = fileOrder;}
	
	public int getMaxFileSize() {return MaxFileSize;}
	public void setMaxFileSize(int maxFileSize) {MaxFileSize = maxFileSize;}
		
	/** 고객 게시판 **/
	public String getCusCd() {return CusCd;}
	public void setCusCd(String cusCd) {CusCd = cusCd;}
	
	public String getCusNm() {return CusNm;}
	public void setCusNm(String cusNm) {CusNm = cusNm;}
	
	public String getCusId() {return CusId;}
	public void setCusId(String cusId) {CusId = cusId;}
	
	public String getCusPW() {return CusPW;}
	public void setCusPW(String cusPW) {CusPW = cusPW;}
	
	public String getCusTel() {return CusTel;}
	public void setCusTel(String cusTel) {CusTel = cusTel;}
	
	public String getUseFlag() {return UseFlag;}
	public void setUseFlag(String useFlag) {UseFlag = useFlag;}
	
	public String getCusStatus() {return CusStatus;}
	public void setCusStatus(String cusStatus) {CusStatus = cusStatus;}
	
	public String getLatelyVisit() {return LatelyVisit;}
	public void setLatelyVisit(String latelyVisit) {LatelyVisit = latelyVisit;}
	
	public String getVisitCnt() {return VisitCnt;}
	public void setVisitCnt(String visitCnt) {VisitCnt = visitCnt;}
	/** 고객 게시판 **/
	
	
	public String getUsrCusId() {
		return usrCusId;
	}
	public void setUsrCusId(String usrCusId) {
		this.usrCusId = usrCusId;
	}
	public String getStaffSnb() {
		return staffSnb;
	}
	public void setStaffSnb(String staffSnb) {
		this.staffSnb = staffSnb;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	
}