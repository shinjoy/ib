package ib.schedule.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import ib.schedule.service.SpCmmVO;
import ib.schedule.service.CusVO;

public interface CusService {
	
	/** 공통 **/
	@SuppressWarnings("rawtypes")
	List GetSMSPerList(CusVO vo) throws Exception;									// 문자 주소록 불러오기
	public int GetSMSSeq() throws Exception;										// 문자 전송시 모아샷 연동 인덱스 코드 받아오기
	@SuppressWarnings("rawtypes")
	void SMSSendEnd(List list) throws Exception;									// 문자 전송 완료
	@SuppressWarnings("rawtypes")
	void SMSResultEnd(List list) throws Exception;									// 문자 전송결과 업데이트 완료
	@SuppressWarnings("rawtypes")
	void SMSLogAddEnd(List list) throws Exception;									// 문자 로그 등록 완료
	@SuppressWarnings("rawtypes")
	List GetSMSSendList(CusVO vo) throws Exception;									// 문자 전송결과 받아오기
	CusVO GetSMSSendInfo(CusVO vo) throws Exception;								// 문자 전송내역 상세보기
	@SuppressWarnings("rawtypes")
	List GetPerList(CusVO vo) throws Exception;										// 내부담당자 & 유치자 & 메일담당자 리스트 받아오기
	String GetDateDiff(CusVO vo) throws Exception;									// 두 날짜 기간 구하기
	/** 공통 **/
	
	/** 고객 **/
	@SuppressWarnings("rawtypes")
	List GetCusList(CusVO vo) throws Exception;										// 일임&일임외&채권매각&유치자별 고객 리스트
	@SuppressWarnings("rawtypes")
	List GetXIRR(CusVO vo) throws Exception;										// XIRR 수익율 받아오기
	@SuppressWarnings("rawtypes")
	List GetCusList_Hope(CusVO vo) throws Exception;								// 잠재 고객 리스트
	@SuppressWarnings("rawtypes")
	List GetOwnCusList(CusVO vo) throws Exception;									// 자기자본 고객 리스트
	List<?> GetOwnBondList(CusVO vo) throws Exception;								// 자기자본 채권 상세현황
	void OwnEtcEditEnd(CusVO vo) throws Exception;									// 자기자본 채권 코멘트 변경 완료
	String GetCusCd(CusVO vo) throws Exception;										// 고객등록 위한 고객코드 받아오기
	int CusNmChkEnd(CusVO vo) throws Exception;										// 고객명 중복 검사 완료
	void CusBasicAddEnd(HttpServletRequest req, CusVO vo) throws Exception;			// 고객 기본정보 등록 완료
	void CusAccountAddEnd(CusVO vo) throws Exception;								// 고객 계정 생성 완료
	CusVO GetCusBasicInfo(CusVO vo) throws Exception;								// 고객정보조회
	void CusNmEditEnd(CusVO vo) throws Exception;									// 고객명 수정 완료
	void CusAccountEditEnd(CusVO vo) throws Exception;								// 고객명 수정에 따른 고객 계정 수정 완료
	void CusInSuInCusNmEditEnd(CusVO vo) throws Exception;							// 고객명 수정에 따른 투자개요 세부내역 고객명 수정 완료
	void CusInSuWarCusNmEditEnd(CusVO vo) throws Exception;							// 고객명 수정에 따른 투자개요 워런트 고객명 수정 완료
	void CusBasicEditEnd(CusVO vo) throws Exception;								// 고객 기본정보 수정 완료
	void CusAccountUseFlagEditEnd(CusVO vo) throws Exception;						// 고객 계정 사용여부 수정 완료
	void CusInfoCopy(CusVO vo) throws Exception;									// 고객정보 복사 완료
	/** 고객 **/
	
	/** 공동 유치자 **/
	@SuppressWarnings("rawtypes")
	List GetInvitePerList() throws Exception;										// 유치자 리스트 받아오기
	@SuppressWarnings("rawtypes")
	List GetInviteCusList(CusVO vo) throws Exception;								// 유치자별 고객 리스트 받아오기
	@SuppressWarnings("rawtypes")
	List GetCollaboPerList() throws Exception;										// 외부협력자 리스트 받아오기
	@SuppressWarnings("rawtypes")
	List GetCollaboCusList(CusVO vo) throws Exception;								// 외부협력자별 고객 리스트 받아오기
	@SuppressWarnings("rawtypes")
	List GetCusInvitePerList(CusVO vo) throws Exception;							// 공동 유치자 리스트 받아오기
	void CusInviteProcEnd(HttpServletRequest req, CusVO vo) throws Exception;		// 공동 유치자 등록/수정 완료
	void InviteDelEnd(CusVO vo) throws Exception;									// 공동 유치자 삭제 완료
	/** 공동 유치자 **/
	
	@SuppressWarnings("rawtypes")
	List GetOutSidePerList() throws Exception;										// 외부사람 리스트 받아오기
	
	/** 외부 협력자 **/
	@SuppressWarnings("rawtypes")
	List GetCusCollaboPerList(CusVO vo) throws Exception;							// 외부 협력자 리스트 받아오기
	void CusCollaboProcEnd(HttpServletRequest req, CusVO vo) throws Exception;		// 외부 협력자 등록/수정 완료
	void CollaboDelEnd(CusVO vo) throws Exception;									// 외부 협력자 삭제 완료
	/** 외부 협력자 **/
	
	/** 연관 고객 **/
	int GetConSeq(CusVO vo) throws Exception;										// 연관고객 코드 받아오기
	@SuppressWarnings("rawtypes")
	void ConCusAddEnd(List list) throws Exception;									// 연관고객 정보 등록 완료
	@SuppressWarnings("rawtypes")
	List GetConCusList(CusVO vo) throws Exception;									// 연관 고객 정보 조회
	@SuppressWarnings("rawtypes")
	List GetConCusList2(CusVO vo) throws Exception;
	@SuppressWarnings("rawtypes")
	List GetConCusDelList(CusVO vo) throws Exception;								// 연관 고객 정보 삭제 리스트 받아오기
	@SuppressWarnings("rawtypes")
	void ConCusDelEnd(List list) throws Exception;									// 연관 고객 정보 삭제 완료
	/** 연관 고객 **/
	
	/** 고객 관리 **/
	@SuppressWarnings("rawtypes")
	List GetInvestStatusTitle(CusVO vo) throws Exception;							// 유치자별 투자현황 (타이틀)
	@SuppressWarnings("rawtypes")
	List GetInvestStatus(CusVO vo) throws Exception;								// 유치자별 투자현황
	/** 고객 관리 **/
	
	/** 고객 담당자 **/
	@SuppressWarnings("rawtypes")
	List GetCusPerList(CusVO vo) throws Exception;									// 고객 담당자 리스트
	String GetCusPerCd(CusVO vo) throws Exception;									// 고객 담당자 등록을 위한 담당자코드 받아오기
	void CusManagerAddEnd(CusVO vo) throws Exception;								// 고객 담당자 등록 완료
	void CusManagerEditEnd(CusVO vo) throws Exception;								// 고객 담당자 수정 완료
	void CusManagerDelEnd(CusVO vo) throws Exception;								// 고객 담당자 삭제 완료
	/** 고객 담당자 **/
	
	/** 계약정보 **/
	@SuppressWarnings("rawtypes")
	List GetCusTradeList(CusVO vo) throws Exception;								// 계약 리스트 받아오기
	@SuppressWarnings("rawtypes")
	List GetCusTradeFileList(CusVO vo) throws Exception;							// 계약 파일 리스트 받아오기
	String GetTradeCd(CusVO vo) throws Exception;									// 계약 등록을 위한 계약코드 받아오기
	void CusTradeAddEnd(CusVO vo) throws Exception;									// 계약 등록 완료
	int GetCusTradeFileCd(CusVO vo) throws Exception;								// 계약 파일 코드 받아오기
	@SuppressWarnings("rawtypes")
	void CusTradeFileAddEnd(List list) throws Exception;							// 계약 파일 등록 완료
	void CusTradeEditEnd(CusVO vo) throws Exception;								// 계약 수정 완료
	String CateTradeHostAddEnd(CusVO vo) throws Exception;							// 종목별 매매주체 관리
	void CusTradeDelEnd(CusVO vo) throws Exception;									// 계약 삭제 완료
	void CusTradeFileAllDelEnd(CusVO vo) throws Exception;							// 계약 파일 일괄 삭제 완료
	void CusTradeFileDelEnd(CusVO vo) throws Exception;								// 계약 파일 삭제 완료
	/** 계약정보 **/
	
	/** 계약금 **/
	@SuppressWarnings("rawtypes")
	List GetCusTradeMoneyList(CusVO vo) throws Exception;							// 계약금 리스트
	String GetTradeMoneyCd(CusVO vo) throws Exception;								// 계약금 등록을 위한 계약금 코드 받아오기
	void TradeMoneyAddEnd(CusVO vo) throws Exception;								// 계약금 등록 완료
	void TradeMoneyEditEnd(CusVO vo) throws Exception;								// 계약금 수정 완료
	void TradeMoneyDelEnd(CusVO vo) throws Exception;								// 계약금 삭제 완료
    int GetTradeMoneyDateInCashDate(CusVO vo) throws Exception;						// 계약금 해당일에 예수금 등록여부 받아오기
    String GetLastCashMoney(CusVO vo) throws Exception;								// 계약금 해당일에 예수금 미등록일시 가장 최근 예수금 받아오기
    void TradeMoneySetCashEditEnd(CusVO vo) throws Exception;						// 계약금 변경에 따른 예수금 변경
	/** 계약금 **/
	
	/** 매매 **/
    @SuppressWarnings("rawtypes")
	List GetInvestTradeList(CusVO vo) throws Exception;								// 매매 정보 리스트
	/** 매매 **/
	
	/** 유가증권 **/
    @SuppressWarnings("rawtypes")
	List GetInvestList_SelList(CusVO vo, String Flag) throws Exception;				// 유가증권 조회를 위한 고객&종목 선택페이지
	@SuppressWarnings("rawtypes")
	List GetCusInvestList(CusVO vo) throws Exception;								// 투자 현황 리스트
	String GetInvestCd(CusVO vo) throws Exception;									// 투자 현황 등록을 위한 투자 현황 코드 받아오기
	void CusInvestAddEnd(CusVO vo) throws Exception;								// 투자 현황 등록 완료
    void InvestBuyAddCashApplyEnd(CusVO vo) throws Exception;						// 매수에 따른 예수금 수정 완료
	@SuppressWarnings("rawtypes")
	List GetInvestList_Cus_Buy(CusVO vo) throws Exception;							// 매수 현황 리스트
	CusVO GetInvestBuyDateInCashDate(CusVO vo) throws Exception;					// 매수 수정/삭제 해당일에 예수금 정보 받아오기
	void CusInvestBuyEditEnd(CusVO vo) throws Exception;							// 매수 수정 완료
	void InvestBuyEditCashApplyEnd(CusVO vo) throws Exception;						// 매수 수정에 따른 예수금 수정 완료
	void CusInvestBuyDelEnd(CusVO vo) throws Exception;								// 매수&현금 삭제 완료
	void InvestBuyDelCashApplyEnd(CusVO vo) throws Exception;						// 매수 삭제에 따른 예수금 수정 완료
	void InvestSellTmpAddEnd(CusVO vo) throws Exception;							// 매도에 따른 예수금 Tmp 등록 완료
	@SuppressWarnings("rawtypes")
	List CashTmpChk(CusVO vo) throws Exception;										// 매도에 따른 예수금 Tmp 반영일 및 반영가능 여부 받아오기
	@SuppressWarnings("rawtypes")
	List GetInvestList_Cus_Sell(CusVO vo) throws Exception;							// 매도 현황 리스트
	void CusInvestSellEditEnd(CusVO vo) throws Exception;							// 매도 수정 완료
	void InvestSellTmpEditEnd(CusVO vo) throws Exception;							// 매도수정에 따른 예수금 Tmp 수정 완료
	void CusInvestSellDelEnd(CusVO vo) throws Exception;							// 매도 삭제 완료
	void InvestSellTmpDelEnd(CusVO vo) throws Exception;							// 매도삭제에 따른 예수금  Tmp 삭제 완료
	@SuppressWarnings("rawtypes")
	List GetCashTmpList(CusVO vo) throws Exception;									// 예수금 반영을 위한  예수금 Tmp 리스트 받아오기
	void CashTmpApplyAddEnd(CusVO vo) throws Exception;								// 예수금 Tmp 예수금 반영 완료
	void CashTmpApplyEditEnd(CusVO vo) throws Exception;							// 예수금 Tmp 반영 완료 후 해당 예수금 Tmp 수정 완료
	/** 유가증권 **/
    
    /** 종목 **/
	@SuppressWarnings("rawtypes")
	List GetCateList(CusVO vo) throws Exception;									// 종목리스트 받아오기
	@SuppressWarnings("rawtypes")
	List GetAddCateList(CusVO vo) throws Exception;									// 종목 등록을 위한 종목 리스트 받아오기
	int ChkCateNm(CusVO vo) throws Exception;										// 종목 중복 여부 확인
	String GetOutCateCd(CusVO vo) throws Exception;									// 등록되지 않은 비상장 종목코드 생성
	//void CateAddEnd(CusVO vo) throws Exception;										// 종목 등록 완료
	@SuppressWarnings("rawtypes")
	List GetCateBtnList(CusVO vo) throws Exception;									// 종목 버튼 리스트 받아오기
	void CateNotUseEnd(CusVO vo) throws Exception;									// 종목 사용 안함 완료
	void CateUseEnd(CusVO vo) throws Exception;										// 종목 사용함 완료
	@SuppressWarnings("rawtypes")
	List GetCusCateList(CusVO vo) throws Exception;									// 종목별 고객리스트 받아오기
	/** 종목 **/
	
	/** 현금 **/
	@SuppressWarnings("rawtypes")
	List GetCusCashList(CusVO vo) throws Exception;				    				// 현금기준 고객리스트
	String GetForAllCashInvestCd(CusVO vo) throws Exception;						// 일괄등록을 위한 CMA 및 예수금 등록 여부 받기
	void ForAllCashInvestDelEnd(CusVO vo) throws Exception;							// 일괄등록을 위한 기존 CMA 및 예수금 삭제하기
	@SuppressWarnings("rawtypes")
	void CusInvestAllAddEnd_Cash(List list) throws Exception;						// 일괄 현금 등록 완료
	@SuppressWarnings("rawtypes")
	List GetCashCateList(CusVO vo) throws Exception;								// 현금 현황 버튼 리스트 받아오기
	@SuppressWarnings("rawtypes")
	List GetCusInvestList_Cash(CusVO vo) throws Exception;							// 고객별 현금 현황 리스트
	@SuppressWarnings("rawtypes")
	List GetCashAddList(CusVO vo) throws Exception;									// 고객별 현금 등록을 위한 현금 리스트 받아오기
	@SuppressWarnings("rawtypes")
	void CusInvestAddEnd_Cash(List list) throws Exception;							// 고객별 현금 현황 등록 완료
	/** 현금 **/
	
	/** 사모투자 **/
	@SuppressWarnings("rawtypes")
	List GetAlarmList(SpCmmVO vo) throws Exception;									// 알람 리스트
	void AlarmCheckEnd(CusVO vo) throws Exception;									// 알람확인 완료
	@SuppressWarnings("rawtypes")
	List GetInSumList(CusVO vo) throws Exception;									// 투자개요 리스트
	String GetInSuCd(CusVO vo) throws Exception;									// 투자개요 등록을 위한 투자개요코드 받아오기
	void InSumProcEnd(CusVO vo) throws Exception;									// 투자개요 등록&수정 완료
	void InSumInCusEditEnd(CusVO vo) throws Exception;								// 투자개요 수정시 연관종목 변경에 따른 고객 매수 정보 업데이트
	void InSumRefixInfoAddEnd(CusVO vo) throws Exception;							// 투자개요 수정시 리픽싱 정보 등록하기
	int GetInSumFileCd(CusVO vo) throws Exception;									// 투자개요 파일코드 받아오기
	@SuppressWarnings("rawtypes")
	void InSumFileAddEnd(List list) throws Exception;								// 투자개요 파일 등록 완료
	CusVO GetInSumInfo(CusVO vo) throws Exception;									// 투자개요 정보 불러오기
	@SuppressWarnings("rawtypes")
	List GetInSumRefixList(CusVO vo) throws Exception;								// 투자개요 리픽싱정보 받아오기
	@SuppressWarnings("rawtypes")
	List GetInSumFileList(CusVO vo) throws Exception;								// 투자개요 파일 리스트 받아오기
	void InSumFileDelEnd(CusVO vo) throws Exception;								// 투자개요 파일 삭제 완료
	int InSumUnitPriceAddEnd(CusVO vo) throws Exception;							// 투자개요 매도단가 입력 완료
	void InSumUseFlagEnd(CusVO vo) throws Exception;								// 투자개요 사용여부 변경 완료
	@SuppressWarnings("rawtypes")
	List GetInSumVisitFileList(CusVO vo) throws Exception;							// 투자개요 탐방리포트 받아오기
	/** 사모투자 **/
	
	/** 사모투자 이자관리 **/
	@SuppressWarnings("rawtypes")
	List GetInSumInCusForIzaList(CusVO vo) throws Exception;						// 이자 등록을 위한 투자개요 세부내역 불러오기
	String GetISICIzaSeq(CusVO vo) throws Exception;								// 이자 등록을 위한 이자 순번 받아오기
	@SuppressWarnings("rawtypes")
	void InSumInCusIzaAddEnd(List list, CusVO vo) throws Exception;					// 이자 등록 완료
	/** 사모투자 이자관리 **/
	
	/** 세부내용 관리 **/
	@SuppressWarnings("rawtypes")
	List GetInCusAddList(CusVO vo) throws Exception;								// 투자개요 세부내역 등록을 위한 고객리스트 받아오기
	String GetISICCd(CusVO vo) throws Exception;									// 투자개요 세부내역 등록을 위한 연관코드 받아오기
	@SuppressWarnings("rawtypes")
	void InCusAddEnd(List list) throws Exception;									// 투자개요 세부내역 등록 완료
	int GetInSumInCusFileCd(CusVO vo) throws Exception;								// 투자개요 세부내역 파일코드 받아오기
	@SuppressWarnings("rawtypes")
	void InSumInCusFileAddEnd(List list) throws Exception;							// 투자개요 세부내역 파일 등록 완료
	void InSumInCusTradeDocAddEnd(CusVO vo) throws Exception;						// 투자개요 세부내역 계약서 파일 생성 완료
	@SuppressWarnings("rawtypes")
	List GetInCusList(CusVO vo) throws Exception;									// 투자개요 세부내역 불러오기
	@SuppressWarnings("rawtypes")
	List GetInCusFileList(CusVO vo) throws Exception;								// 투자개요 세부내역 파일 불러오기
	void InCusEditEnd(CusVO vo) throws Exception;									// 투자개요 세부내용 수정 완료
	void InCusDelEnd(CusVO vo) throws Exception;									// 투자개요 세부내용 삭제 완료
	void InCusWarDelEnd(CusVO vo) throws Exception;									// 투자개요 연동 워런트 정보 삭제 완료
	@SuppressWarnings("rawtypes")
	List GetInCusInvestInfo(CusVO vo) throws Exception;								// 투자개요 세부내용 연동 매매내역 정보 받아오기
	void InCusInvestDelEnd(CusVO vo) throws Exception;								// 투자개요 세부내용 연동 매매내역 삭제 완료
	void InCusFileDelEnd(CusVO vo) throws Exception;								// 투자개요 세부내용 파일 삭제 완료
	@SuppressWarnings("rawtypes")
	List GetInSumCusPerList(CusVO vo) throws Exception;								// 세부내용 행사, 조기상환 전달을 위한 고객 담당자 리스트 받아오기
	String GetInSumMailCd(CusVO vo) throws Exception;								// 세부내용 행사, 조기상환 메일 코드 받아오기
	@SuppressWarnings("rawtypes")
	void InSumInCusMailLogAddEnd(List list) throws Exception;						// 세부내용 행사, 조기상환 메일 로그 등록 완료
	int GetInSumMailFileCd(CusVO vo) throws Exception;								// 세부내용 행사, 조기상환 메일 파일 코드 받아오기
	@SuppressWarnings("rawtypes")
	void InSumInCusMailFileAddEnd(List list) throws Exception;						// 세부내용 행사, 조기상환 메일 파일 등록 완료
	@SuppressWarnings("rawtypes")
	List GetInCusMailSendList(CusVO vo) throws Exception;							// 세부내용 행사, 조기상환 메일 전송 현황 받아오기
	/** 세부내용 관리 **/
	
	/**	채권매각고객 상세정보 **/
	@SuppressWarnings("rawtypes")
	List GetBondSellCusKeyList(CusVO vo) throws Exception;							// 채권매각고객 고급검색 키워드
	@SuppressWarnings("rawtypes")
	List GetBondSellCusList(CusVO vo) throws Exception;								// 채권매각고객 세부정보 리스트
	CusVO GetBondSellCusInfo(CusVO vo) throws Exception;							// 채권매각고객 세부정보 상세보기
	String GetBondCusSeq(CusVO vo) throws Exception;								// 채권매각고객 세부정보 시퀀스 받아오기
	@SuppressWarnings("rawtypes")
	void BondSellCusAddEnd(List list) throws Exception;								// 채권매각고객 세부정보 등록 완료
	void BondSellCusInfoEditEnd(CusVO vo) throws Exception;							// 채권매각고객 세부정보 수정 완료
	void BondSellCusEditEnd(CusVO vo) throws Exception;								// 세부내용 수정에 따른 채권매각고객 세부정보 수정
	void BondSellCusDelEnd(CusVO vo) throws Exception;								// 채권매각고객 세부정보 삭제
	CusVO GetInSumInCusInfo(CusVO vo) throws Exception;								// 사모투자 세부내용 건별 정보 받아오기
	void BondSellCusEventAddEnd(CusVO vo) throws Exception;							// 채권매각고객 풋행사 완료
	@SuppressWarnings("rawtypes")
	List GetBondSellCusEventList(CusVO vo) throws Exception;						// 채권매각고객 풋행사 리스트 받아오기
	CusVO GetBondSellCusEventView(CusVO vo) throws Exception;						// 채권매각고객 풋행사 세부정보 받아오기
	/**	채권매각고객 상세정보 **/
	
	/** 고객별 통계 **/
	@SuppressWarnings("rawtypes")
	List GetCusStats(CusVO vo) throws Exception;									// 고객별 통계 받아오기
	@SuppressWarnings("rawtypes")
	List GetStatusStats(CusVO vo) throws Exception;									// 고객 상태별 통계 받아오기
	/** 고객별 통계 **/
	
	/** 워런트 관리 **/
	@SuppressWarnings("rawtypes")
	List GetWarList(CusVO vo) throws Exception;										// 워런트 리스트 받아오기
	@SuppressWarnings("rawtypes")
	List GetWarFileList(CusVO vo) throws Exception;									// 워런트 파일 리스트 받아오기
	int GetWarGrpCd(CusVO vo) throws Exception;										// 워런트 그룹코드 받아오기
	int GetWarCd(CusVO vo) throws Exception;										// 워런트 코드 받아오기
	@SuppressWarnings("rawtypes")
	void WarMngProcEnd(List list) throws Exception;									// 워런트 등록/수정 완료
	int GetWarFileCd(CusVO vo) throws Exception;									// 워런트 파일 코드 받아오기
	@SuppressWarnings("rawtypes")
	void WarFileAddEnd(List list) throws Exception;									// 워런트 파일 등록 완료
	void WarMngDelEnd(CusVO vo) throws Exception;									// 워런트 삭제 완료
	void WarFileDelEnd(CusVO vo) throws Exception;									// 워런트 파일 삭제 완료
	/** 워런트 관리 **/
}