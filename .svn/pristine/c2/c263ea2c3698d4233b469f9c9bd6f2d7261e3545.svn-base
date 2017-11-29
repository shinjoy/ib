package ib.schedule.service.impl;

import java.io.Serializable;

import ib.schedule.service.CusVO;

public class ScheduleVO extends CusVO implements Serializable {
	
	private static final long serialVersionUID = -8274004534207618049L;
	
	
//	private String EventType			= "";
	private String ContactLoc			= "";
	private String ParentPage			= "";	// 요청페이지
	private String PerSabun				= "";	// 사번
//	private String RegDate				= "";	// 등록일
//	private String RegPerSabun			= "";	// 등록자사번
//	private String RegPerNm				= "";	// 등록자
	private String RegPerPhone			= "";
//	private String EditDate				= "";	// 수정일
//	private String DelDate				= "";	// 삭제일
//	private String DelFlag				= "";	// 삭제여부
/*	private String SearchSDate			= "";
	private String SearchEDate			= "";*/
	private String SearchPerSabun		= "";
	private String SearchQuery			= "";
//	private String SMSContent			= "";
	private String HoliDocFlag			= "";	// 휴가보고서여부 (Y - 휴가보고서, N - 일반보고서, F - 경조사보고서)
	
	
	//private String ScheSeq				= "";	// 스케쥴시퀀스
	private String ScheGrpCd			= "";	// 반복일정 그룹코드
	private String ScheGubun			= "";	// 일정구분 All - 전체일정, Along - 개인일정
	private String ScheGubunNm			= "";
	private String ScheType				= "";	// 일정상세구분 IR - IR, Visit - 탐방, Other - 기타
	
	private String mnaType				= "";	// 일정 분류 M&A 상세분류 (미팅,실사,중개,관리)
	private String IsMna				= "";	// M&A
	
	private String ScheSYear			= "";	// 시작년
	private String ScheSMonth			= "";	// 시작월
	private String ScheSDay				= "";	// 시작일
	private String ScheSDate			= "";	// 시작일자
	private String ScheSTimeAMPM		= "";	// 시작시간오전오후
	private String ScheSTimeAMPMNm		= "";
	private String ScheSTime			= "";	// 시작시간
	private String ScheEYear			= "";	// 종료년
	private String ScheEMonth			= "";	// 종료월
	private String ScheEDay				= "";	// 종료일
	private String ScheEDate			= "";	// 종료일자
	private String ScheETimeAMPM		= "";	// 종료시간오전오후
	private String ScheETimeAMPMNm		= "";
	private String ScheETime			= "";	// 종료시간
	private String ScheAllTime			= "";	// 종일일정 구분 Y - 종일일정, N - 특정시간
	private String SchePeriodFlag		= "";

	
	private String ScheTitle			= "";	// 스케쥴명
	private String ScheArea				= "";	// 장소
	private String ScheCon				= "";	// 스케쥴내용
	
	
	
	private String ScheRepetFlag		= "";	// 반복여부
	private String ScheRepetFlagNm		= "";	// 반복여부
	private String ScheAlarmFlag		= "";	// 알림시기
	private String ScheAlarmFlagNm		= "";	// 알림시기
	private String ScheAlarmHow			= "";	// 알림방법
	private String ScheAlarmHowNm		= "";	// 알림방법
	private String ScheImportant		= "";	// 중요도
	private String ScheImportantNm		= "";	// 중요도
	private String ScheChkFlag			= "";	// 확인여부
	private String ScheChkDate			= "";	// 확인일
	private String SchePublicFlag		= "";	// 공개여부
	private String ProcFlag				= "";	// 반복 일정 관련 플래그
	
	private String CarUseFlag			= "";
	private String CarNum				= "";
	private String CarArriveTime		= "";
	private String CarFloor				= "";
	private String CarUsePerNm			= "";
	
	
	private String tmpCpnId				= "";	//회사코드			ib_company		20160303
	private String tmpCstId				= "";	//고객 id (sequence) ib_customer
	
	private String company				= "";	//회사코드
	private String companyNm			= "";	//회사명
	private String customerId			= "";	//고객id
	private String customer				= "";	//고객명
	
	private String beforePage 			= ""; 	//모바일 화면 전환용..
	private String sortType				= "";	//스케쥴 정렬 순서 
	
	private String meetStartTime 		= ""; 	//회의실 예약 시작
	private String meetEndTime			= "";	//회의실 예약 종료 
	private String meetingRoomId		= "";	//회의실 아이디
	private Integer rsvId				= 0;	//회의실 예약 아이디
	private String meetingRoomUseFlag	= "";	//회의실 사용 여부 플래그
	
	private String userSeq				= "";	//유저 시퀀스
	private String grpCd				= "";   //그룹코드 (시간+사번) 
	private String scheSDtEdit			= "";	// 수정될 시작일자
	private String alone			    = "";   // 반복일정수정시 이 일정만 수정인 경우 
	
	
	//모바일 추가
	private String onlySche				= "";	//단지 스케쥴만 조회
	private String openType				= "";	//모바일 - 수정에서 열었는지 등록에서 열었는지
	private String changePeriodN		= ""; 	//기간 -> 기간 N 으로 수정 
	private String searchSabunList		= "";	//일정 검색 대상 사용자 사번 리스트
	private String managerId 			= "";	//담당자 아이디 (BS_CUSTOMER_MANAGER)
	
	
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getChangePeriodN() {
		return changePeriodN;
	}
	public void setChangePeriodN(String changePeriodN) {
		this.changePeriodN = changePeriodN;
	}
	public String getOpenType() {
		return openType;
	}
	public void setOpenType(String openType) {
		this.openType = openType;
	}
	public String getOnlySche() {
		return onlySche;
	}
	public void setOnlySche(String onlySche) {
		this.onlySche = onlySche;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getMeetingRoomUseFlag() {
		return meetingRoomUseFlag;
	}
	public void setMeetingRoomUseFlag(String meetingRoomUseFlag) {
		this.meetingRoomUseFlag = meetingRoomUseFlag;
	}
	
	public String getMeetingRoomId() {
		return meetingRoomId;
	}
	public void setMeetingRoomId(String meetingRoomId) {
		this.meetingRoomId = meetingRoomId;
	}
	public Integer getRsvId() {
		return rsvId;
	}
	public void setRsvId(Integer rsvId) {
		this.rsvId = rsvId;
	}
	public String getMeetStartTime() {
		return meetStartTime;
	}
	public void setMeetStartTime(String meetStartTime) {
		this.meetStartTime = meetStartTime;
	}
	public String getMeetEndTime() {
		return meetEndTime;
	}
	public void setMeetEndTime(String meetEndTime) {
		this.meetEndTime = meetEndTime;
	}
	public String getSortType() {
		return sortType;
	}
	public void setSortType(String sortType) {
		this.sortType = sortType;
	}
	public String getBeforePage() {
		return beforePage;
	}
	public void setBeforePage(String beforePage) {
		this.beforePage = beforePage;
	}
	
/*	public String getEventType() {return EventType;}
	public void setEventType(String eventType) {EventType = eventType;}*/
	
	public String getContactLoc() {return ContactLoc;}
	public void setContactLoc(String contactLoc) {ContactLoc = contactLoc;}
	
	public String getParentPage() {return ParentPage;}
	public void setParentPage(String parentPage) {ParentPage = parentPage;}
	
	public String getPerSabun() {return PerSabun;}
	public void setPerSabun(String perSabun) {PerSabun = perSabun;}
	
/*	public String getRegDate() {return RegDate;}
	public void setRegDate(String regDate) {RegDate = regDate;}*/
	
	/*public String getRegPerSabun() {return RegPerSabun;}
	public void setRegPerSabun(String regPerSabun) {RegPerSabun = regPerSabun;}
	
	public String getRegPerNm() {return RegPerNm;}
	public void setRegPerNm(String regPerNm) {RegPerNm = regPerNm;}*/
	
	public String getRegPerPhone() {return RegPerPhone;}
	public void setRegPerPhone(String regPerPhone) {RegPerPhone = regPerPhone;}
	
	/*public String getEditDate() {return EditDate;}
	public void setEditDate(String editDate) {EditDate = editDate;}
	
	public String getDelDate() {return DelDate;}
	public void setDelDate(String delDate) {DelDate = delDate;}
	
	public String getDelFlag() {return DelFlag;}
	public void setDelFlag(String delFlag) {DelFlag = delFlag;}*/
	
	/*public String getSearchSDate() {return SearchSDate;}
	public void setSearchSDate(String searchSDate) {SearchSDate = searchSDate;}
	
	public String getSearchEDate() {return SearchEDate;}
	public void setSearchEDate(String searchEDate) {SearchEDate = searchEDate;}
	*/
	public String getSearchPerSabun() {return SearchPerSabun;}
	public void setSearchPerSabun(String searchPerSabun) {SearchPerSabun = searchPerSabun;}
	
	public String getSearchQuery() {return SearchQuery;}
	public void setSearchQuery(String searchQuery) {SearchQuery = searchQuery;}
	
	/*public String getSMSContent() {return SMSContent;}
	public void setSMSContent(String sMSContent) {SMSContent = sMSContent;}*/
	
	public String getHoliDocFlag() {return HoliDocFlag;}
	public void setHoliDocFlag(String holiDocFlag) {HoliDocFlag = holiDocFlag;}
	
	/*public String getScheSeq() {return ScheSeq;}
	public void setScheSeq(String scheSeq) {ScheSeq = scheSeq;}*/
	
	public String getScheGrpCd() {return ScheGrpCd;}
	public void setScheGrpCd(String scheGrpCd) {ScheGrpCd = scheGrpCd;}
	
	public String getScheGubun() {return ScheGubun;}
	public void setScheGubun(String scheGubun) {ScheGubun = scheGubun;}
	
	public String getScheGubunNm() {return ScheGubunNm;}
	public void setScheGubunNm(String scheGubunNm) {ScheGubunNm = scheGubunNm;}
	
	public String getScheType() {return ScheType;}
	public void setScheType(String scheType) {ScheType = scheType;}
	
	public String getScheSYear() {return ScheSYear;}
	public void setScheSYear(String scheSYear) {ScheSYear = scheSYear;}
	
	public String getScheSMonth() {return ScheSMonth;}
	public void setScheSMonth(String scheSMonth) {ScheSMonth = scheSMonth;}
	
	public String getScheSDay() {return ScheSDay;}
	public void setScheSDay(String scheSDay) {ScheSDay = scheSDay;}
	
	public String getScheSDate() {return ScheSDate;}
	public void setScheSDate(String scheSDate) {ScheSDate = scheSDate;}
	
	public String getScheSDtEdit() {return scheSDtEdit;}
	public void setScheSDtEdit(String scheSDate) {scheSDtEdit = scheSDate;}
	
	public String getScheSTimeAMPM() {return ScheSTimeAMPM;}
	public void setScheSTimeAMPM(String scheSTimeAMPM) {ScheSTimeAMPM = scheSTimeAMPM;}
	
	public String getScheSTimeAMPMNm() {return ScheSTimeAMPMNm;}
	public void setScheSTimeAMPMNm(String scheSTimeAMPMNm) {ScheSTimeAMPMNm = scheSTimeAMPMNm;}
	
	public String getScheSTime() {return ScheSTime;}
	public void setScheSTime(String scheSTime) {ScheSTime = scheSTime;}
	
	public String getScheEYear() {return ScheEYear;}
	public void setScheEYear(String scheEYear) {ScheEYear = scheEYear;}
	
	public String getScheEMonth() {return ScheEMonth;}
	public void setScheEMonth(String scheEMonth) {ScheEMonth = scheEMonth;}
	
	public String getScheEDay() {return ScheEDay;}
	public void setScheEDay(String scheEDay) {ScheEDay = scheEDay;}
	
	public String getScheEDate() {return ScheEDate;}
	public void setScheEDate(String scheEDate) {ScheEDate = scheEDate;}
	
	public String getScheETimeAMPM() {return ScheETimeAMPM;}
	public void setScheETimeAMPM(String scheETimeAMPM) {ScheETimeAMPM = scheETimeAMPM;}
	
	public String getScheETimeAMPMNm() {return ScheETimeAMPMNm;}
	public void setScheETimeAMPMNm(String scheETimeAMPMNm) {ScheETimeAMPMNm = scheETimeAMPMNm;}
	
	public String getScheETime() {return ScheETime;}
	public void setScheETime(String scheETime) {ScheETime = scheETime;}
	
	public String getScheAllTime() {return ScheAllTime;}
	public void setScheAllTime(String scheAllTime) {ScheAllTime = scheAllTime;}
	
	public String getSchePeriodFlag() {return SchePeriodFlag;}
	public void setSchePeriodFlag(String schePeriodFlag) {SchePeriodFlag = schePeriodFlag;}
	
	public String getScheTitle() {return ScheTitle;}
	public void setScheTitle(String scheTitle) {ScheTitle = scheTitle;}
	
	public String getScheArea() {return ScheArea;}
	public void setScheArea(String scheArea) {ScheArea = scheArea;}
	
	public String getScheCon() {return ScheCon;}
	public void setScheCon(String scheCon) {ScheCon = scheCon;}
	
	public String getScheRepetFlag() {return ScheRepetFlag;}
	public void setScheRepetFlag(String scheRepetFlag) {ScheRepetFlag = scheRepetFlag;}
	
	public String getScheRepetFlagNm() {return ScheRepetFlagNm;}
	public void setScheRepetFlagNm(String scheRepetFlagNm) {ScheRepetFlagNm = scheRepetFlagNm;}
	
	public String getScheAlarmFlag() {return ScheAlarmFlag;}
	public void setScheAlarmFlag(String scheAlarmFlag) {ScheAlarmFlag = scheAlarmFlag;}
	
	public String getScheAlarmFlagNm() {return ScheAlarmFlagNm;}
	public void setScheAlarmFlagNm(String scheAlarmFlagNm) {ScheAlarmFlagNm = scheAlarmFlagNm;}
	
	public String getScheAlarmHow() {return ScheAlarmHow;}
	public void setScheAlarmHow(String scheAlarmHow) {ScheAlarmHow = scheAlarmHow;}
	
	public String getScheAlarmHowNm() {return ScheAlarmHowNm;}
	public void setScheAlarmHowNm(String scheAlarmHowNm) {ScheAlarmHowNm = scheAlarmHowNm;}
	
	public String getScheImportant() {return ScheImportant;}
	public void setScheImportant(String scheImportant) {ScheImportant = scheImportant;}
	
	public String getScheImportantNm() {return ScheImportantNm;}
	public void setScheImportantNm(String scheImportantNm) {ScheImportantNm = scheImportantNm;}
	
	public String getScheChkFlag() {return ScheChkFlag;}
	public void setScheChkFlag(String scheChkFlag) {ScheChkFlag = scheChkFlag;}
	
	public String getScheChkDate() {return ScheChkDate;}
	public void setScheChkDate(String scheChkDate) {ScheChkDate = scheChkDate;}
	
	public String getSchePublicFlag() {return SchePublicFlag;}
	public void setSchePublicFlag(String schePublicFlag) {SchePublicFlag = schePublicFlag;}
	
	public String getProcFlag() {return ProcFlag;}
	public void setProcFlag(String procFlag) {ProcFlag = procFlag;}
	
	public String getCarUseFlag() {return CarUseFlag;}
	public void setCarUseFlag(String carUseFlag) {CarUseFlag = carUseFlag;}
	
	public String getCarNum() {return CarNum;}
	public void setCarNum(String carNum) {CarNum = carNum;}
	
	public String getCarArriveTime() {return CarArriveTime;}
	public void setCarArriveTime(String carArriveTime) {CarArriveTime = carArriveTime;}
	
	public String getCarFloor() {return CarFloor;}
	public void setCarFloor(String carFloor) {CarFloor = carFloor;}
	
	public String getCarUsePerNm() {return CarUsePerNm;}
	public void setCarUsePerNm(String carUsePerNm) {CarUsePerNm = carUsePerNm;}

	public String getMnaType() {return mnaType;}
	public void setMnaType(String mnaType) {this.mnaType = mnaType;}
	public String getIsMna() {
		return IsMna;
	}
	public void setIsMna(String isMna) {
		IsMna = isMna;
	}
	public String getTmpCpnId() {
		return tmpCpnId;
	}
	public void setTmpCpnId(String tmpCpnId) {
		this.tmpCpnId = tmpCpnId;
	}
	public String getTmpCstId() {
		return tmpCstId;
	}
	public void setTmpCstId(String tmpCstId) {
		this.tmpCstId = tmpCstId;
	}

	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCompanyNm() {
		return companyNm;
	}
	public void setCompanyNm(String companyNm) {
		this.companyNm = companyNm;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public String getSearchSabunList() {
		return searchSabunList;
	}
	public void setSearchSabunList(String searchSabunList) {
		this.searchSabunList = searchSabunList;
	}
	
	public String getGrpCd() {
		return grpCd;
	}
	public void setGrpCd(String grpCd) {
		this.grpCd = grpCd;
	}
	
	public String getAlone() {
		return alone;
	}
	public void setAlone(String alone) {
		this.alone = alone;
	}

	
	
}