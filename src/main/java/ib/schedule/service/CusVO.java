package ib.schedule.service;

import java.io.Serializable;

public class CusVO implements Serializable {
	private String CMD						= "";
	
	private String HighSearchQuery			= "";	// 고급검색
	private String HighSearchData			= "";	// 고급검색데이터
	private String HighSearchSDate			= "";
	private String HighSearchEDate			= "";
	private String searchCondition			= "";	// 검색조건
	private String searchKeyword			= "";	// 검색어
	private String OrderFlag				= "";	// 정렬조건(S 문자 I 숫자)
	private String OrderType				= "";	// 정렬타입
	private String OrderKey					= "";	// 정렬기준
	private String NewWinFlag				= "";	// 새창여부
	private String EventFlag				= "";	// 발생 이벤트 구분자
	private String InfoMessage				= "";	// 경고문구
	private String ObjNm					= "";	// 객체명
	private String SelDate					= "";	// 선택일자
	private String SearchSDate				= "";	// 기간검색 시작일
    private String SearchEDate				= "";	// 기간검색 종료일
    private String DocType					= "";	// 문서 타입
    private String DocNm					= "";	// 문서 이름
    private String DocPage					= "";	// 문서 페이지
    private String URL						= "";
    private String StatsType				= "";	// 통계타입
    private String RegDate					= "";	// 등록일
	private String RegPerSabun				= "";	// 등록자사번
	private String EditDate					= "";	
	private String EditPerSabun				= "";	// 수정자사번
	private String DelDate					= "";	// 삭제일
	private String DelPerSabun				= "";	// 삭제자사번
	private String DelFlag					= "";	// 삭제여부
	
	private String FileSeq					= "";	// 파일순번
	private String FileGubun				= "";	// 정산시 파일 구분 (info - 안내문, trade - 갱신계약서, report - 연간리포트)
	private String FileNm					= "";	// 파일명
	private String FileUpNm					= "";	// 업로드된 파일명
	private String FilePath					= "";	// 파일경로
	private long FileSize					= 0L;	// 파일크기
	private int FileOrder					= 0;	// 파일출력순서
	private int MaxFileSize					= 10 * 1024 * 1024;	// 파일크기
	private String NameStamp				= "";	// 회사 명판

	/**	고객	**/
	private String S_Nb						= "";	// IB 연결코드
	private String CusCd					= "";	// 고객코드
	private String CusNm					= "";	// 고객명
	private String CopyCusCd				= "";	// 복사할 고객코드
	private String CopyCusNm				= "";	// 복사할 고객명
	private String CusType					= "";	// 회사종류(1.법인/2.개인)
	private String CusCorType				= "";	// 회사유형(1.유가증권/2.코스닥/3.비상장)
	private String RegNum_1					= "";	// 사업자등록번호1
	private String RegNum_2					= "";	// 사업자등록번호2
	private String RegNum_3					= "";	// 사업자등록번호3
	private String CusRegNum				= "";	// 사업자등록번호
	private String CorRegNum_1				= "";	// 법인등록번호1
	private String CorRegNum_2				= "";	// 법인등록번호2
	private String CusCorRegNum				= "";	// 법인등록번호
	private String CusOwnNm					= "";	// 대표자명
	private String OwnJumin_1				= "";	// 대표자주민번호1
	private String OwnJumin_2				= "";	// 대표자주민번호2
	private String CusOwnJumin				= "";	// 대표자주민번호
	private String CusTel					= "";	// 전화번호
	private String CusPhone					= "";	// 핸드폰번호
	private String CusFax					= "";	// 팩스번호
	private String CusEmail					= "";	// 이메일
	private String CusPost					= "";	// 우편번호
	private String CusAddr					= "";	// 우편발송주소
	private String CusStatus				= "";	// 고객구분(1.투자유치가능고객/2.일임고객/3.기타/4.매각/5.해지)
	private String CusStatusNm				= "";
	private String CusStatusOrder			= "";
	private String CusSubStatus				= "";	// 세부고객구분(1.일임외관리/2.일임외비관리/3.매각보증/4.매각무보증
	private String CusTradeEndDate			= "";	// 해지일자
	private String CusAddInvestFlag			= "";	// 추가투자 가능여부 (1.가능/2.불가능)
	private String CusManagerNm				= "";	// 내부담당자명
	private String CusManagerSabun			= "";	// 내부담당자사번
	private String CusInviteNm				= "";	// 유치자명
	private String CusInviteSabun			= "";	// 유치자사번
	private String CusMailingPerNm			= "";	// 메일담당자명
	private String CusMailingPerSabun		= "";	// 메일담당자사번
	private String CusEtc					= "";	// 기타사항
	private String CusOfficeNm				= "";	// 근무처명
	private String CusOfficePosition		= "";	// 근무처 직급
	private String CusOfficeTel				= "";	// 근무처 직통번호
	private String CusOfficeEtc				= "";	// 근무처 비고
	private String CusId					= "";	// 고객 아이디
	private String CusPW					= "";	// 고객 비밀번호
	private String UseFlag					= "";	// 고객 계정 사용여부
	
	/**	공동유치자	**/
	private String InviteRate				= "";	// 공동유치비율
	private String InviteReason				= "";	// 공동유치사유
	
	/** 외부협력자 **/
	private String CollaboPerSabun			= "";	// 외부협력자 사번
	private String CollaboRate				= "";	// 외부협력자 비율
	private String CollaboReason			= "";	// 외부협력자 사유
	
	/** 외부사람정보 **/
	private String OutPerSabun				= "";	// 외부사람 사번
	private String OutPerNm					= "";	// 외부사람 이름
	
	/**	연관고객	**/
	private String ConSeq					= "";	// 연관순번
	private String ConCusCd					= "";	// 연관고객코드
	private String ConCusNm					= "";	// 연관고객명
	private String ConCusStatus				= "";	// 연관고객상태
	
	/**	고객 담당자	**/
	private String CusPerCd					= "";	// 담당자코드
	private String CusPerNm					= "";	// 담당자명
	private String CusPerPosition			= "";	// 담당자직급
	private String CusPerPositionNm			= "";	// 담당자직급명
	private String CusPerPhone				= "";	// 담당자 연락처
	private String CusPerTel				= "";	// 담당자 직통번호
	private String CusPerEmail				= "";	// 담당자 이메일
	private String CusMailingFlag			= "";	// 메일링 대상여부 (1.대상/2.비대상)
	private String CusPerPost				= "";	// 담당자 우편번호
	private String CusPerAddr				= "";	// 담당자 주소
	private String CusPerEtc				= "";	// 담당자 비고
	
	/**	종목	**/
	private String ComCd					= "";	// 회사코드
	private String ComNm					= "";	// 회사명
	private String CateCd					= "";	// 종목코드 Cash 예수금 / CMA CMA / ComKeep 당사보관 / CusKeep 고객보관 / Except 제외금액
	private String OldCateCd				= "";	// 기존의 종목코드
	private String CateNm					= "";	// 종목명
	private String CateType					= "";	// 구분	1.유가증권 / 2.현금
	private String CateTypeNm				= "";	// 구분명
	private String SubCateCd				= "";	// 타입코드 1.채권 / 2.주식 / 3.워런트 / 4.CB / 5.EB / 6.잠재주식 / 7.전환권리 / 8.교환권리
	private String SubCateNm				= "";	// 타입명
	private String CateNum					= "";	// 종목의 회차
	private String UpFlag					= "";	// 상장여부 Y.상장 / N.비상장
	
	/**	시가	**/
	private String PriceSeq					= "";	// 시가순번
	private String PriceDate				= "";	// 시가등록일
	private String UnitPrice				= "";	// 종목별단가
	private String PublicStock				= "";	// 상장주식수
	private String StockValue				= "";	// 시가총액
	private String OwnStock					= "";	// 자기주식수
	private String FaceValue				= "";	// 액면가
	
	/**	분석(회사정보)	**/
	private String AccountMonth				= "";	// 결산월
	private String MarketType				= "";	// 시장구분
	private String Addr						= "";	// 주소
	private String Tel						= "";	// 전화번호
	private String IRTel					= "";	// IR담당자
	private String CEO						= "";	// 대표이사
	private String BusiType					= "";	// WICS업종명(소)
	private String MaxHolder				= "";	// 최대주주명
	private String MaxHaveStockRate			= "";	// 최대주주보유보통주지분율
	private String FoundDate				= "";	// 설립일
	private String PublicDate				= "";	// 상장일
	private String EmpCnt					= "";	// 종업원수
	
	/**	계약	**/
	private String TradeCd					= "";	// 계약코드
	private String TradeType				= "";	// 계약 구분 (1.기간/2.건별)
	private String TradeTypeNm				= "";	// 계약 구분명 (기간/건별)
	private String TradeQuarter				= "";	// 쿼터
	private String TradeFirstDate			= "";	// 최초계약일
	private String TradeStartDate			= "";	// 계약일
	private String TradeEndDate				= "";	// 해지일
	private String TradeStartPeriod			= "";	// 계약기간 시작일
	private String TradeEndPeriod			= "";	// 계약기간 끝일
	private String TradeCharge				= "";	// 수수료율
	private String TradeHopeMoney			= "";	// 쿼터(투자희망액)
	private String TradeSecAccount			= "";	// 증권계좌
	private String TradeCMAAccount			= "";	// CMA계좌
	private String TradeHost				= "";	// 매매주체
	private String TradeSpot				= "";	// 매매지점
	private String TradeStatus				= "";	// 계약상태(1.진행/2.해지)
	private String TradeDocFlag				= "";	// 계약서 제출여부
	private String ConfirmFlag				= "";	// 확인서 제출여부
	private String IDCardFlag				= "";	// 신분증 제출여부
	private String CusTradeETC				= "";	// 계약서 기타사항
	private String CalcuCd					= "";	// 정산코드
	private String CalcuType				= "";	// 정산타입 (Calcu.정산/NoneCalcu.무정산)
	private String CalcuDate				= "";	// 정산일
	private String ReturnMoney				= "";	// 수익금액(정산일당시)
	private String ReturnRate				= "";	// 수익율(정산일당시)
	private String ReturnCharge				= "";	// 성과수수료(정산일당시)
	private String SellUnitPrice			= "";	// 매도단가
	private String SellUnitPriceDate		= "";	// 매도단가 입력일
	private String SellUnitPricePerSabun	= "";	// 매도단가 입력자 사번
	private String HostSeq					= "";	// 매매주체 순번
	
	/**	계약금	**/
	private String TradeMoneyCd				= "";	// 계약금 코드
	private String TradeMoneyFlag			= "";	// 입출금 구분 (1.입금/2.출금)
	private String TradeMoney				= "";	// 금액
	private String TradeMoneyDate			= "";	// 입출금일자
	private String OldTradeMoney			= "";	// 기존 입출금액
    private String OldTradeMoneyDate		= "";	// 기존 입출금일자
    private String DepositMoney			= "";	// 실제 거치되어 있는 현재 금액(입금-출금)
	
	/**	투자 현황	**/
	private String InvestType				= "";	// 투자 형태 구분 (1.매수/2.매도)
	private String InvestCd					= "";	// 투자현황코드
	private String InvestCnt				= "";	// 투자 수량
	private String InvestUnitPrice			= "";	// 매수/매도 당시의 단가
	private String InvestTradeMoney			= "";	// 매매대금 (수량 * 단가)
	private String OddlotMoney				= "";	// 단주대금
	private String InvestCharge				= "";	// 수수료
	private String InvestTax				= "";	// 세금
	private String InvestCalcuMoney			= "";	// 정산금액 (매매대금 - 수수료 - 세금)
	private String OldInvestCalcuMoney		= "";	// 기존 정산금액 (매매대금 - 수수료 - 세금)
	private String InvestDate				= "";	// 매수/매도일자
	private String OldInvestDate			= "";	// 기존의 매수/매도일자
	private String ETCInfo					= "";	// 기타등록 사유
	private String ProcType					= "";	// 등록방법 '' - 직접, InSum - 사모투자세부내용, Event - 행사
	private String AddMethod				= "";	// 등록방법(로그)
	
	private String BuyInvestCnt				= "";	// 매수수량
	private String BuyInvestUnitPrice		= "";	// 매수단가
	private String BuyInvestTradeMoney		= "";	// 매수대금
	private String SellInvestCnt			= "";	// 매도수량
	private String SellInvestUnitPrice		= "";	// 매도단가
	private String SellInvestTradeMoney		= "";	// 매도대금
	private String NowInvestCnt				= "";	// 현재수량
	private String NowCalcuMoney			= "";	// 현재금액
	private String NowCash					= "";	// 현재 현금
	private String NowSecurity				= "";	// 현재 유가증권
	private String CashType					= "";	// 1.현금등록(예수금, CMA) 2.기타등록(제외금액, 고객보관, 당사보관)
	
	private String PastMoneyCd				= "";	// 평가코드
	private String PastInvestCnt			= "";	// 평가수량
	private String PastUnitPrice			= "";	// 평가단가
	private String PastCalcuMoney			= "";	// 평가액
	private String PastInvestDate			= "";	// 평가일
	private String PastCash					= "";	// 평가일 현금
	private String PastSecurity				= "";	// 평가일 유가증권
	private String PastFlag					= "";	// 평가액 등록 여부
	
	private String InvestMoneyTmp			= "";	// 예수금Tmp
	private String ApplyFlag				= "";	// 예수금Tmp 적용여부
	private String ApplyDate				= "";	// 예수금Tmp 적용일자
	private String ApplyPerSabun			= "";	// 예수금Tmp 적용자 사번
	
	/** 매매대상 메모 **/
	private String InvestMemoSeq			= "";	// 매매대상 메모 순번
	private String InvestMemo				= "";	// 매매대상 메모
	
	/**	투자개요	**/
	private String InSuCd					= "";	// 투자개요코드
	private String InSuNm					= "";	// 투자개요명
	private String InSuCom					= "";	// 발행회사
	private String WarCateCd				= "";	// 연관 워런트 코드
	private String WarCateNm				= "";	// 연관 워런트 명
	private String SecCateCd				= "";	// 연관 주식 코드
	private String SecCateNm				= "";	// 연관 주식 명
	private String BondCateCd				= "";	// 연관 채권/CB/EB 코드
	private String BondCateNm				= "";	// 연관 채권/CB/EB 명
	private String InSuChungDay				= "";	// 청약일
	private String InSuNabDay				= "";	// 납입일
	private String InSuSaChaeDay			= "";	// 사채만기일
	private String InSuExpiryRate			= "";	// 만기이자율
	private String InSuRepayDay				= "";	// 조기상환일
	private String InSuRepayIza				= "";	// 조기상환이자율
	private String InSuRepayPeriod1			= "";	// 조기상환신청기간1
	private String InSuRepayPeriod2			= "";	// 조기상환신청기간2
	private String InSuRepayFlag			= "";	// 조기상환신청여부
	private String InSuRepayDate			= "";	// 조기상환신청완료일
	private String InSuRepayPerSabun		= "";	// 조기상환신청완료자사번
	private String InSuRepayMethod			= "";	// 조기상환방법
	private String InSuRepayRate			= "";	// 조기상환율
	private String InSuIzaDay				= "";	// 이자지급일
	private String InSuIzaFlag				= "";	// 이자지급여부
	private String InSuIzaDate				= "";	// 이자지급완료일
	private String InSuIzaPerSabun			= "";	// 이자지급완료자사번
	private String InSuSurfaceRate			= "";	// 표면이자율
	private String InSuSurfaceDay			= "";	// 표면이자지급시기
	private String InSuFirstPrice			= "";	// 최초행사가액
	private String InSuBasePrice			= "";	// 기준행사가액
	private String InSuRefixLimit			= "";	// 리픽싱한도
	private String InSuRefixLimitPrice		= "";	// 리픽싱한도가액
	private String InSuNowPrice				= "";	// 현재행사가액
	private String InSuRefixDay				= "";	// 리픽싱일자
	private String InSuRefixReason			= "";	// 리픽싱 발생 사유
	private String InSuRefixReasonCd		= "";	// 리픽싱 발생 사유 코드
	private String InSuRefixFlag			= "";	// 리픽싱여부
	private String InSuRefixDate			= "";	// 리픽싱완료일
	private String InSuRefixPerSabun		= "";	// 리픽싱완료자사번
	private String InSuRefixMethod			= "";	// 리픽싱방법
	private String InSuClaimStart			= "";	// 권리행사시작일
	private String InSuClaimEnd				= "";	// 권리행사종료일
	private String InSuClaimFlag			= "";	// 권리행사여부
	private String InSuClaimDate			= "";	// 권리행사 완료일
	private String InSuClaimPerSabun		= "";	// 권리행사 완료자 사번
	private String InSuBuyBack				= "";	// 바이백
	private String InSuBuyBackPre			= "";	// 바이백프리미엄
	private String InSuCallOption			= "";	// 콜옵션
	private String InSuYtc					= "";	// YTP
	private String InSuCallStart			= "";	// 콜 시작일
	private String InSuCallEnd				= "";	// 콜 종료일
	private String InSuOutMoney				= "";	// 총발행금액
	private String InSuSumMoney				= "";	// 총투자금액
	private String InSuBondForm				= "";	// 채권보유형태
	private String InSuWar					= "";	// 워런트
	private String SecTotalCnt				= "";	// 총발행수량
	private String SecShare					= "";	// 지분율
	private String InSuETC					= "";	// 투자개요기타
	private String OwnETC					= "";	// 자기자본코멘트
	private String OwnWar					= "";	// 자기자본 워런트 총액
	private String AlarmDate1				= "";	// 알람일자1
	private String AlarmDate2				= "";	// 알람일자2
	private String RefixDateTmp				= "";	// 리픽싱시 매수를 위한 리픽싱일자 Tmp
	private String InSuNowPriceTmp			= "";	// 리픽싱시 리픽싱전의 행사가액 Tmp
	private String InSuRefixSeq				= "";	// 리픽싱순번
	private String InSuRefixPrice			= "";	// 리픽싱후 금액
	private String MailPassType				= "";	// 메일전달 종류 event - 행사, repay - 조기상환
	private String HomeViewFlag				= "";	// 홈페이지 출력여부
	private String HomeViewFlagNm			= "";
	private String ReturnDate				= "";	// 회수일
	
	/**	투자개요 세부내역	**/
	private String ISICCd					= "";	// 연관순번
	private String ISICBond					= "";	// 채권
	private String ISICWar					= "";	// 워런트
	private String ISICInMoney				= "";	// 입금액
	private String ISICInMoneyDate			= "";	// 입금일
	private String ISICSurfaceIza			= "";	// 표면이자
	private String ISICSecCom				= "";	// 증권사
	private String ISICSecAccount			= "";	// 계좌번호
	private String ISICSaChaeCon			= "";	// 사채내용		1. 이체 / 2. 교부 / 3. 보관증
	private String ISICWarCon				= "";	// 워런트내용		1. 교부 / 2. 보관증
	
	/**	투자개요 이자	**/
	private String ISICIzaSeq				= "";	// 순번
	private String ISICRealIza				= "";	// 실지급이자
	private String ISICRealIzaDay			= "";	// 실지급일
	
	/** 투자개요 워런트 **/
	private String WarGrpCd					= "";	// 워런트그룹코드
	private String WarCd					= "";	// 워런트코드
	private String WarMoney					= "";	// 워런트권종
	private String WarSeqNum				= "";	// 워런트일련번호
	private String WarSetFlag				= "";	// 워런트부여여부
	
	/** 투자개요 채권 **/
	private String BondGrpCd				= "";	// 채권그룹코드
	private String BondCd					= "";	// 채권코드
	private String BondMoney				= "";	// 채권권종
	private String BondSeqNum				= "";	// 채권일련번호
	private String BondSetFlag				= "";	// 채권부여여부
	
	/** 투자개요 분석&탐방 **/
	private String Memo						= "";
	private String OfferType				= "";
	private String FileFlag					= "";
	
	/** 채권매각 고객 세부 정보 **/
	private String BondCusSeq				= "";	// 채권매각고객순번
	private String TargetMoney				= "";	// 대상금액
	private String ToDoSellDay				= "";	// 매각예정일
	private String ExtraPeriod				= "";	// 잔여기간
	private String ExtraDay					= "";	// 잔여일
	private String RepayMoney				= "";	// 조기상환금액
	private String PeriodIza				= "";	// 기간이자
	private String SumReturnMoney			= "";	// 총회수금액
	private String ReqReturnRate			= "";	// 요구수익율
	private String DealPrice				= "";	// 매매단가
	private String DealPriceOpt				= "";	// 단리,복리	(Dan - 단리 // Bok - 복리)
	private String DealPriceOptNm			= "";
	private String DealMoney				= "";	// 매매금액
	private String DealMoneyOpt				= "";	// 매매금액단위	(Won - 원단위 // Man - 만단위 // Jik - 직접입력)
	private String DealMoneyOptNm			= "";
	private String DealTax					= "";	// 세금
	private String RealDealMoney			= "";	// 실거래금액
	private String AssureFlag				= "";	// 보증여부		(Y - 여 // N - 부)
	private String AssureFlagNm				= "";
	private String WithHoldingFlag			= "";	// 원천징수여부	(Y - 여 // N - 부)
	private String PutEventDay				= "";	// 풋행사시기
	private String PutCycle					= "";	// 풋주기
	private String PutEventFlag				= "";	// 풋행사 플래그 (in - 내부, out - 외부)
	private String EventTargetMoney			= "";	// 풋행사한 대상금액
	
	/** 채권매각 고객 풋행사정보 **/
	private String BondEventSeq				= "";	// 행사순번
	private String BuyMoney					= "";	// 매수금액
	private String BuyDay					= "";	// 매수일
	private String SellDay					= "";	// 매도일
	private String PassPeriod				= "";	// 경과기간
	
	/**	보고서	**/
	private String ReportCd					= "";	// 레포트코드
	private String ReportSDate				= "";	// 운용기간1
	private String ReportEDate				= "";	// 운용기간2
	private String ImpDate					= "";	// 부과일자
	private String ChargeFlag				= "";	// 수수료구분
	private String ChargeMoney				= "";	// 금액
	private String PayLimit					= "";	// 납입기한
	private String PayFlag					= "";	// 납부결과
	private String CalcuInfo				= "";	// 정산 코멘트
	private String SecInfo					= "";	// 유가증권 코멘트
	private String ManaInfo					= "";	// 운용내역 코멘트	
	private String AccMoney					= "";	// 누적 수익 금액
	private String PeriodMoney				= "";	// 기간 수익 금액
	private String StartValue				= "";	// 기초 평가액
	private String StartCash				= "";	// 기초 평가액 현금
	private String StartSec					= "";	// 기초 평가액 유가증권
	private String EndValue					= "";	// 기말 평가액
	private String EndCash					= "";	// 기말 평가액 현금
	private String EndSec					= "";	// 기말 평가액 유가증권
	private String CommitFlag				= "";	// 마감여부
	private String CommitDate				= "";	// 마감일자
	private String CommitPerSabun			= "";	// 마감자사번
	private String CalcuAddMoney			= "";
	
	/**	메일	**/
	private String MailCd					= "";	// 메일코드
	private String MailTitle				= "";	// 메일제목
	private String MailCon					= "";	// 메일내용
	private String MailFileFlag				= "";	// 파일첨부여부
	private String MailRePerNm				= "";	// 수신자명
	private String MailRePerEmail			= "";	// 수신자 이메일
	private String MailSePerSabun			= "";	// 발신자사번
	private String MailSePerNm				= "";	// 발신자명
	private String MailSePerEmail			= "";	// 발신자 이메일
	private String MailSendDate				= "";	// 발신일자
	private String MailKey					= "";	// 수신확인키
	private String MailOpenFlag				= "";	// 수신여부
	
	/**	투자제안	**/
	private String InvestOfferCd			= "";	// 투자제안코드
	private String InvestOfferNm			= "";	// 투자제안명
	private String InvestOfferCon			= "";	// 투자제안내용
	private String InvestOfferMoney			= "";	// 총투자금액
	private String MailingViewFlag			= "";	// 메일링 출력여부
	private String HiddenFlag				= "";	// 숨김여부
	private int ViewOrder					= 0;	// 출력순서
	private String ScheSeq					= "";
	
	/**	고객분배	**/
	private String DivOfferCd				= "";	// 분배코드
	private String DivOfferMoney			= "";	// 분배 금액
	private String InvestOfferFlag			= "";	// 투자제안여부
	private String DivConfirmFlag			= "";	// 분배 확정 여부
	private String DivInMoneyFlag			= "";	// 분배 입금 여부
	
	private String OfferMemoSeq				= "";	// 메모순번
	private String OfferMemo				= "";	// 메모

	/**	고객게시판	**/
	// 공통
	private String EventType				= "";	// 이벤트타입
	private String EventTypeTmp				= "";	// 이벤트타입Tmp
	private String ReadFlag					= "";	// 게시물 읽음여부
	private String MenuCon					= "";	// 고객별 메뉴 설명
	private String RegPerNm					= "";
	
	// 운용보고서
	private String NowSumMoney				= "";	// 기말평가액
	private String AccPer					= "";	// 누적 수익율
	private String AddAvgPer				= "";	// 가중평균수익율
	private String RealNowCash				= "";	// 실제 현재 현금
	private String WarSecurity				= "";	// 워런트평가이익
	private String NowTotalSumMoney			= "";	// 총평가액
	private String AddAvgPeriod				= "";	// 가중평균일임기간
	private String HdnAccPer				= "";	// 워런트포함 누적수익율
	private String HdnAddAvgPer				= "";	// 워런트포함 가중평균수익율
	
	// 문의게시판
	private String WriteCd					= "";	// 글코드
	private String WriteTitle				= "";	// 글제목
	private String WriteCon					= "";	// 글내용
	private String WritePerNm				= "";	// 작성자성명
	private String WritePerSabun			= "";	// 작성자코드
	private String WritePW					= "";	// 게시물 비밀번호
	
	// 문의게시판댓글
	private String ReplyCd					= "";	// 댓글코드
	private String ReplyCon					= "";	// 댓글내용
	private String ReplyPerSabun			= "";	// 댓글작성자코드
	private String ReplyPerNm				= "";	// 댓글작성자명
	/** 고객게시판 **/
	
	/**	문자	**/
	private int SMSSeq						= 0;	// 순번
	private String SMSTitle					= "";	// 전송제목
	private String SMSType					= "";	// 전송구분 (3.단문문자/5.장문문자/6.이미지포함문자)
	private String SMSToNum					= "";	// 수신자번호 (하이픈제거/동보전송시 , 로 구분)
	private String SMSFromNum				= "";	// 발신자번호 (하이픈제거)
	private String SMSContent				= "";	// 내용
	private String SMSReserTime				= "";	// 발신시간(예약시간)	(년(4)월(2)일(2)시(2)분(2)초(2) 로 설정)
	private String SMSSendTime				= "";	// 전송시작시간
	private String SMSEndTime				= "";	// 전송완료시간
	private String SMSSendFlag				= "";	// 전송결과 (1.성공/7.잘못된번호/16.수신거부/19.기타)
	private String SMSSendFlagData			= "";
	private String SMSFlag					= "";	// 문자연동구분자 (메일, 보고서, 일반)
	private String SMS_Grp_Seq				= "";	// 상용구 그룹순번
	private String SMS_Grp_Nm				= "";	// 상용구 그룹명
	private String SMS_Grp_Order			= "";	// 상용구 그룹 출력순서
	private String OrderLog					= "";	// 기존출력순서
	private String SMS_Con_Seq				= "";	// 상용구 내용순번
	private String SMS_Con					= "";	// 상용구 내용

	
	private static final long serialVersionUID = -8274004534207618049L;
	
	public String getCMD() {return CMD;}
	public void setCMD(String cMD) {CMD = cMD;}
	
	public String getHighSearchQuery() {return HighSearchQuery;}
	public void setHighSearchQuery(String highSearchQuery) {HighSearchQuery = highSearchQuery;}
	
	public String getHighSearchData() {return HighSearchData;}
	public void setHighSearchData(String highSearchData) {HighSearchData = highSearchData;}
	
	public String getHighSearchSDate() {return HighSearchSDate;}
	public void setHighSearchSDate(String highSearchSDate) {HighSearchSDate = highSearchSDate;}
	
	public String getHighSearchEDate() {return HighSearchEDate;}
	public void setHighSearchEDate(String highSearchEDate) {HighSearchEDate = highSearchEDate;}
	
	public String getSearchCondition() {return searchCondition;}
	public void setSearchCondition(String searchCondition) {this.searchCondition = searchCondition;}
	
	public String getSearchKeyword() {return searchKeyword;}
	public void setSearchKeyword(String searchKeyword) {this.searchKeyword = searchKeyword;}
	
	public String getOrderFlag() {return OrderFlag;}
	public void setOrderFlag(String orderFlag) {OrderFlag = orderFlag;}
	
	public String getOrderType() {return OrderType;}
	public void setOrderType(String orderType) {OrderType = orderType;}
	
	public String getOrderKey() {return OrderKey;}
	public void setOrderKey(String orderKey) {OrderKey = orderKey;}
	
	public String getNewWinFlag() {return NewWinFlag;}
	public void setNewWinFlag(String newWinFlag) {NewWinFlag = newWinFlag;}
	
	public String getEventFlag() {return EventFlag;}
	public void setEventFlag(String eventFlag) {EventFlag = eventFlag;}
	
	public String getInfoMessage() {return InfoMessage;}
	public void setInfoMessage(String infoMessage) {InfoMessage = infoMessage;}
	
	public String getObjNm() {return ObjNm;}
	public void setObjNm(String objNm) {ObjNm = objNm;}
	
	public String getSelDate() {return SelDate;}
	public void setSelDate(String selDate) {SelDate = selDate;}
	
	public String getSearchSDate() {return SearchSDate;}
	public void setSearchSDate(String searchSDate) {SearchSDate = searchSDate;}
	
	public String getSearchEDate() {return SearchEDate;}
	public void setSearchEDate(String searchEDate) {SearchEDate = searchEDate;}
	
	public String getDocType() {return DocType;}
	public void setDocType(String docType) {DocType = docType;}
	
	public String getDocNm() {return DocNm;}
	public void setDocNm(String docNm) {DocNm = docNm;}
	
	public String getDocPage() {return DocPage;}
	public void setDocPage(String docPage) {DocPage = docPage;}
	
	public String getURL() {return URL;}
	public void setURL(String uRL) {URL = uRL;}
	
	public String getStatsType() {return StatsType;}
	public void setStatsType(String statsType) {StatsType = statsType;}
	
	public String getRegDate() {return RegDate;}
	public void setRegDate(String regDate) {RegDate = regDate;}
	
	public String getRegPerSabun() {return RegPerSabun;}
	public void setRegPerSabun(String regPerSabun) {RegPerSabun = regPerSabun;}
	
	public String getEditDate() {return EditDate;}
	public void setEditDate(String editDate) {EditDate = editDate;}
	
	public String getEditPerSabun() {return EditPerSabun;}
	public void setEditPerSabun(String editPerSabun) {EditPerSabun = editPerSabun;}
	
	public String getDelDate() {return DelDate;}
	public void setDelDate(String delDate) {DelDate = delDate;}
	
	public String getDelPerSabun() {return DelPerSabun;}
	public void setDelPerSabun(String delPerSabun) {DelPerSabun = delPerSabun;}
	
	public String getDelFlag() {return DelFlag;}
	public void setDelFlag(String delFlag) {DelFlag = delFlag;}
	
	public String getFileSeq() {return FileSeq;}
	public void setFileSeq(String fileSeq) {FileSeq = fileSeq;}
	
	public String getFileGubun() {return FileGubun;}
	public void setFileGubun(String fileGubun) {FileGubun = fileGubun;}
	
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
	
	public String getNameStamp() {return NameStamp;}
	public void setNameStamp(String nameStamp) {NameStamp = nameStamp;}
	
	/**	고객	**/
	public String getS_Nb() {return S_Nb;}
	public void setS_Nb(String s_Nb) {S_Nb = s_Nb;}
	
	public String getCusCd() {return CusCd;}
	public void setCusCd(String cusCd) {CusCd = cusCd;}
	
	public String getCusNm() {return CusNm;}
	public void setCusNm(String cusNm) {CusNm = cusNm;}
	
	public String getCopyCusCd() {return CopyCusCd;}
	public void setCopyCusCd(String copyCusCd) {CopyCusCd = copyCusCd;}
	
	public String getCopyCusNm() {return CopyCusNm;}
	public void setCopyCusNm(String copyCusNm) {CopyCusNm = copyCusNm;}
	
	public String getCusType() {return CusType;}
	public void setCusType(String cusType) {CusType = cusType;}
	
	public String getCusCorType() {return CusCorType;}
	public void setCusCorType(String cusCorType) {CusCorType = cusCorType;}
	
	public String getRegNum_1() {return RegNum_1;}
	public void setRegNum_1(String regNum_1) {RegNum_1 = regNum_1;}
	
	public String getRegNum_2() {return RegNum_2;}
	public void setRegNum_2(String regNum_2) {RegNum_2 = regNum_2;}
	
	public String getRegNum_3() {return RegNum_3;}
	public void setRegNum_3(String regNum_3) {RegNum_3 = regNum_3;}
	
	public String getCusRegNum() {return CusRegNum;}
	public void setCusRegNum(String cusRegNum) {CusRegNum = cusRegNum;}
	
	public String getCorRegNum_1() {return CorRegNum_1;}
	public void setCorRegNum_1(String corRegNum_1) {CorRegNum_1 = corRegNum_1;}
	
	public String getCorRegNum_2() {return CorRegNum_2;}
	public void setCorRegNum_2(String corRegNum_2) {CorRegNum_2 = corRegNum_2;}
	
	public String getCusCorRegNum() {return CusCorRegNum;}
	public void setCusCorRegNum(String cusCorRegNum) {CusCorRegNum = cusCorRegNum;}
	
	public String getCusOwnNm() {return CusOwnNm;}
	public void setCusOwnNm(String cusOwnNm) {CusOwnNm = cusOwnNm;}
	
	public String getOwnJumin_1() {return OwnJumin_1;}
	public void setOwnJumin_1(String ownJumin_1) {OwnJumin_1 = ownJumin_1;}
	
	public String getOwnJumin_2() {return OwnJumin_2;}
	public void setOwnJumin_2(String ownJumin_2) {OwnJumin_2 = ownJumin_2;}
	
	public String getCusOwnJumin() {return CusOwnJumin;}
	public void setCusOwnJumin(String cusOwnJumin) {CusOwnJumin = cusOwnJumin;}
	
	public String getCusTel() {return CusTel;}
	public void setCusTel(String cusTel) {CusTel = cusTel;}
	
	public String getCusPhone() {return CusPhone;}
	public void setCusPhone(String cusPhone) {CusPhone = cusPhone;}
	
	public String getCusFax() {return CusFax;}
	public void setCusFax(String cusFax) {CusFax = cusFax;}
	
	public String getCusEmail() {return CusEmail;}
	public void setCusEmail(String cusEmail) {CusEmail = cusEmail;}
	
	public String getCusPost() {return CusPost;}
	public void setCusPost(String cusPost) {CusPost = cusPost;}
	
	public String getCusAddr() {return CusAddr;}
	public void setCusAddr(String cusAddr) {CusAddr = cusAddr;}
	
	public String getCusStatus() {return CusStatus;}
	public void setCusStatus(String cusStatus) {CusStatus = cusStatus;}
	
	public String getCusStatusNm() {return CusStatusNm;}
	public void setCusStatusNm(String cusStatusNm) {CusStatusNm = cusStatusNm;}
	
	public String getCusStatusOrder() {return CusStatusOrder;}
	public void setCusStatusOrder(String cusStatusOrder) {CusStatusOrder = cusStatusOrder;}
	
	public String getCusSubStatus() {return CusSubStatus;}
	public void setCusSubStatus(String cusSubStatus) {CusSubStatus = cusSubStatus;}
	
	public String getCusTradeEndDate() {return CusTradeEndDate;}
	public void setCusTradeEndDate(String cusTradeEndDate) {CusTradeEndDate = cusTradeEndDate;}
	
	public String getCusAddInvestFlag() {return CusAddInvestFlag;}
	public void setCusAddInvestFlag(String cusAddInvestFlag) {CusAddInvestFlag = cusAddInvestFlag;}
	
	public String getCusManagerNm() {return CusManagerNm;}
	public void setCusManagerNm(String cusManagerNm) {CusManagerNm = cusManagerNm;}
	
	public String getCusManagerSabun() {return CusManagerSabun;}
	public void setCusManagerSabun(String cusManagerSabun) {CusManagerSabun = cusManagerSabun;}
	
	public String getCusInviteNm() {return CusInviteNm;}
	public void setCusInviteNm(String cusInviteNm) {CusInviteNm = cusInviteNm;}
	
	public String getCusInviteSabun() {return CusInviteSabun;}
	public void setCusInviteSabun(String cusInviteSabun) {CusInviteSabun = cusInviteSabun;}
	
	public String getCusMailingPerNm() {return CusMailingPerNm;}
	public void setCusMailingPerNm(String cusMailingPerNm) {CusMailingPerNm = cusMailingPerNm;}
	
	public String getCusMailingPerSabun() {return CusMailingPerSabun;}
	public void setCusMailingPerSabun(String cusMailingPerSabun) {CusMailingPerSabun = cusMailingPerSabun;}
	
	public String getCusEtc() {return CusEtc;}
	public void setCusEtc(String cusEtc) {CusEtc = cusEtc;}
	
	public String getCusOfficeNm() {return CusOfficeNm;}
	public void setCusOfficeNm(String cusOfficeNm) {CusOfficeNm = cusOfficeNm;}
	
	public String getCusOfficePosition() {return CusOfficePosition;}
	public void setCusOfficePosition(String cusOfficePosition) {CusOfficePosition = cusOfficePosition;}
	
	public String getCusOfficeTel() {return CusOfficeTel;}
	public void setCusOfficeTel(String cusOfficeTel) {CusOfficeTel = cusOfficeTel;}
	
	public String getCusOfficeEtc() {return CusOfficeEtc;}
	public void setCusOfficeEtc(String cusOfficeEtc) {CusOfficeEtc = cusOfficeEtc;}
	
	public String getCusId() {return CusId;}
	public void setCusId(String cusId) {CusId = cusId;}
	
	public String getCusPW() {return CusPW;}
	public void setCusPW(String cusPW) {CusPW = cusPW;}
	
	public String getUseFlag() {return UseFlag;}
	public void setUseFlag(String useFlag) {UseFlag = useFlag;}
	
	/**	공동유치자	**/
	public String getInviteRate() {return InviteRate;}
	public void setInviteRate(String inviteRate) {InviteRate = inviteRate;}
	
	public String getInviteReason() {return InviteReason;}
	public void setInviteReason(String inviteReason) {InviteReason = inviteReason;}
	
	/** 외부협력자 **/
	public String getCollaboPerSabun() {return CollaboPerSabun;}
	public void setCollaboPerSabun(String collaboPerSabun) {CollaboPerSabun = collaboPerSabun;}
	
	public String getCollaboRate() {return CollaboRate;}
	public void setCollaboRate(String collaboRate) {CollaboRate = collaboRate;}
	
	public String getCollaboReason() {return CollaboReason;}
	public void setCollaboReason(String collaboReason) {CollaboReason = collaboReason;}
	
	/** 외부사람정보 **/
	public String getOutPerSabun() {return OutPerSabun;}
	public void setOutPerSabun(String outPerSabun) {OutPerSabun = outPerSabun;}
	
	public String getOutPerNm() {return OutPerNm;}
	public void setOutPerNm(String outPerNm) {OutPerNm = outPerNm;}
	
	/**	연관고객 **/
	public String getConSeq() {return ConSeq;}
	public void setConSeq(String conSeq) {ConSeq = conSeq;}
	
	public String getConCusCd() {return ConCusCd;}
	public void setConCusCd(String conCusCd) {ConCusCd = conCusCd;}
	
	public String getConCusNm() {return ConCusNm;}
	public void setConCusNm(String conCusNm) {ConCusNm = conCusNm;}
	
	public String getConCusStatus() {return ConCusStatus;}
	public void setConCusStatus(String conCusStatus) {ConCusStatus = conCusStatus;}
	
	/**	담당자 정보	**/ 
	public String getCusPerCd() {return CusPerCd;}
	public void setCusPerCd(String cusPerCd) {CusPerCd = cusPerCd;}
	
	public String getCusPerNm() {return CusPerNm;}
	public void setCusPerNm(String cusPerNm) {CusPerNm = cusPerNm;}
	
	public String getCusPerPosition() {return CusPerPosition;}
	public void setCusPerPosition(String cusPerPosition) {CusPerPosition = cusPerPosition;}
	
	public String getCusPerPositionNm() {return CusPerPositionNm;}
	public void setCusPerPositionNm(String cusPerPositionNm) {CusPerPositionNm = cusPerPositionNm;}
	
	public String getCusPerPhone() {return CusPerPhone;}
	public void setCusPerPhone(String cusPerPhone) {CusPerPhone = cusPerPhone;}
	
	public String getCusPerTel() {return CusPerTel;}
	public void setCusPerTel(String cusPerTel) {CusPerTel = cusPerTel;}
	
	public String getCusPerEmail() {return CusPerEmail;}
	public void setCusPerEmail(String cusPerEmail) {CusPerEmail = cusPerEmail;}
	
	public String getCusMailingFlag() {return CusMailingFlag;}
	public void setCusMailingFlag(String cusMailingFlag) {CusMailingFlag = cusMailingFlag;}
	
	public String getCusPerPost() {return CusPerPost;}
	public void setCusPerPost(String cusPerPost) {CusPerPost = cusPerPost;}
	
	public String getCusPerAddr() {return CusPerAddr;}
	public void setCusPerAddr(String cusPerAddr) {CusPerAddr = cusPerAddr;}
	
	public String getCusPerEtc() {return CusPerEtc;}
	public void setCusPerEtc(String cusPerEtc) {CusPerEtc = cusPerEtc;}
	
	/** 종목 및 시가	**/
	public String getComCd() {return ComCd;}
	public void setComCd(String comCd) {ComCd = comCd;}
	
	public String getComNm() {return ComNm;}
	public void setComNm(String comNm) {ComNm = comNm;}
	
	public String getCateCd() {return CateCd;}
	public void setCateCd(String cateCd) {CateCd = cateCd;}
	
	public String getOldCateCd() {return OldCateCd;}
	public void setOldCateCd(String oldCateCd) {OldCateCd = oldCateCd;}
	
	public String getCateNm() {return CateNm;}
	public void setCateNm(String cateNm) {CateNm = cateNm;}
	
	public String getCateType() {return CateType;}
	public void setCateType(String cateType) {CateType = cateType;}
	
	public String getCateTypeNm() {return CateTypeNm;}
	public void setCateTypeNm(String cateTypeNm) {CateTypeNm = cateTypeNm;}
	
	public String getSubCateCd() {return SubCateCd;}
	public void setSubCateCd(String subCateCd) {SubCateCd = subCateCd;}
	
	public String getSubCateNm() {return SubCateNm;}
	public void setSubCateNm(String subCateNm) {SubCateNm = subCateNm;}
	
	public String getCateNum() {return CateNum;}
	public void setCateNum(String cateNum) {CateNum = cateNum;}
	
	public String getUpFlag() {return UpFlag;}
	public void setUpFlag(String upFlag) {UpFlag = upFlag;}
	
	public String getPriceSeq() {return PriceSeq;}
	public void setPriceSeq(String priceSeq) {PriceSeq = priceSeq;}
	
	public String getPriceDate() {return PriceDate;}
	public void setPriceDate(String priceDate) {PriceDate = priceDate;}
	
	public String getUnitPrice() {return UnitPrice;}
	public void setUnitPrice(String unitPrice) {UnitPrice = unitPrice;}
	
	public String getPublicStock() {return PublicStock;}
	public void setPublicStock(String publicStock) {PublicStock = publicStock;}
	
	public String getStockValue() {return StockValue;}
	public void setStockValue(String stockValue) {StockValue = stockValue;}
	
	public String getOwnStock() {return OwnStock;}
	public void setOwnStock(String ownStock) {OwnStock = ownStock;}
	
	public String getFaceValue() {return FaceValue;}
	public void setFaceValue(String faceValue) {FaceValue = faceValue;}
	
	/**	분석(회사정보)	**/
	public String getAccountMonth() {return AccountMonth;}
	public void setAccountMonth(String accountMonth) {AccountMonth = accountMonth;}
	
	public String getMarketType() {return MarketType;}
	public void setMarketType(String marketType) {MarketType = marketType;}
	
	public String getAddr() {return Addr;}
	public void setAddr(String addr) {Addr = addr;}
	
	public String getTel() {return Tel;}
	public void setTel(String tel) {Tel = tel;}
	
	public String getIRTel() {return IRTel;}
	public void setIRTel(String iRTel) {IRTel = iRTel;}
	
	public String getCEO() {return CEO;}
	public void setCEO(String cEO) {CEO = cEO;}
	
	public String getBusiType() {return BusiType;}
	public void setBusiType(String busiType) {BusiType = busiType;}
	
	public String getMaxHolder() {return MaxHolder;}
	public void setMaxHolder(String maxHolder) {MaxHolder = maxHolder;}
	
	public String getMaxHaveStockRate() {return MaxHaveStockRate;}
	public void setMaxHaveStockRate(String maxHaveStockRate) {MaxHaveStockRate = maxHaveStockRate;}
	
	public String getFoundDate() {return FoundDate;}
	public void setFoundDate(String foundDate) {FoundDate = foundDate;}
	
	public String getPublicDate() {return PublicDate;}
	public void setPublicDate(String publicDate) {PublicDate = publicDate;}
	
	public String getEmpCnt() {return EmpCnt;}
	public void setEmpCnt(String empCnt) {EmpCnt = empCnt;}
	
	/**	계약	**/
	public String getTradeCd() {return TradeCd;}
	public void setTradeCd(String tradeCd) {TradeCd = tradeCd;}
	
	public String getTradeType() {return TradeType;}
	public void setTradeType(String tradeType) {TradeType = tradeType;}
	
	public String getTradeTypeNm() {return TradeTypeNm;}
	public void setTradeTypeNm(String tradeTypeNm) {TradeTypeNm = tradeTypeNm;}
	
	public String getTradeQuarter() {return TradeQuarter;}
	public void setTradeQuarter(String tradeQuarter) {TradeQuarter = tradeQuarter;}
	
	public String getTradeFirstDate() {return TradeFirstDate;}
	public void setTradeFirstDate(String tradeFirstDate) {TradeFirstDate = tradeFirstDate;}
	
	public String getTradeStartDate() {return TradeStartDate;}
	public void setTradeStartDate(String tradeStartDate) {TradeStartDate = tradeStartDate;}
	
	public String getTradeEndDate() {return TradeEndDate;}
	public void setTradeEndDate(String tradeEndDate) {TradeEndDate = tradeEndDate;}
	
	public String getTradeStartPeriod() {return TradeStartPeriod;}
	public void setTradeStartPeriod(String tradeStartPeriod) {TradeStartPeriod = tradeStartPeriod;}
	
	public String getTradeEndPeriod() {return TradeEndPeriod;}
	public void setTradeEndPeriod(String tradeEndPeriod) {TradeEndPeriod = tradeEndPeriod;}
	
	public String getTradeCharge() {return TradeCharge;}
	public void setTradeCharge(String tradeCharge) {TradeCharge = tradeCharge;}
	
	public String getTradeHopeMoney() {return TradeHopeMoney;}
	public void setTradeHopeMoney(String tradeHopeMoney) {TradeHopeMoney = tradeHopeMoney;}
	
	public String getTradeSecAccount() {return TradeSecAccount;}
	public void setTradeSecAccount(String tradeSecAccount) {TradeSecAccount = tradeSecAccount;}
	
	public String getTradeCMAAccount() {return TradeCMAAccount;}
	public void setTradeCMAAccount(String tradeCMAAccount) {TradeCMAAccount = tradeCMAAccount;}
	
	public String getTradeHost() {return TradeHost;}
	public void setTradeHost(String tradeHost) {TradeHost = tradeHost;}
	
	public String getTradeSpot() {return TradeSpot;}
	public void setTradeSpot(String tradeSpot) {TradeSpot = tradeSpot;}
	
	public String getTradeStatus() {return TradeStatus;}
	public void setTradeStatus(String tradeStatus) {TradeStatus = tradeStatus;}
	
	public String getTradeDocFlag() {return TradeDocFlag;}
	public void setTradeDocFlag(String tradeDocFlag) {TradeDocFlag = tradeDocFlag;}
	
	public String getConfirmFlag() {return ConfirmFlag;}
	public void setConfirmFlag(String confirmFlag) {ConfirmFlag = confirmFlag;}
	
	public String getIDCardFlag() {return IDCardFlag;}
	public void setIDCardFlag(String iDCardFlag) {IDCardFlag = iDCardFlag;}
	
	public String getCusTradeETC() {return CusTradeETC;}
	public void setCusTradeETC(String cusTradeETC) {CusTradeETC = cusTradeETC;}
	
	public String getCalcuCd() {return CalcuCd;}
	public void setCalcuCd(String calcuCd) {CalcuCd = calcuCd;}
	
	public String getCalcuType() {return CalcuType;}
	public void setCalcuType(String calcuType) {CalcuType = calcuType;}
	
	public String getCalcuDate() {return CalcuDate;}
	public void setCalcuDate(String calcuDate) {CalcuDate = calcuDate;}
	
	public String getReturnMoney() {return ReturnMoney;}
	public void setReturnMoney(String returnMoney) {ReturnMoney = returnMoney;}
	
	public String getReturnRate() {return ReturnRate;}
	public void setReturnRate(String returnRate) {ReturnRate = returnRate;}
	
	public String getReturnCharge() {return ReturnCharge;}
	public void setReturnCharge(String returnCharge) {ReturnCharge = returnCharge;}
	
	public String getSellUnitPrice() {return SellUnitPrice;}
	public void setSellUnitPrice(String sellUnitPrice) {SellUnitPrice = sellUnitPrice;}
	
	public String getSellUnitPriceDate() {return SellUnitPriceDate;}
	public void setSellUnitPriceDate(String sellUnitPriceDate) {SellUnitPriceDate = sellUnitPriceDate;}
	
	public String getSellUnitPricePerSabun() {return SellUnitPricePerSabun;}
	public void setSellUnitPricePerSabun(String sellUnitPricePerSabun) {SellUnitPricePerSabun = sellUnitPricePerSabun;}
	
	public String getHostSeq() {return HostSeq;}
	public void setHostSeq(String hostSeq) {HostSeq = hostSeq;}
	
	/**	계약금	**/
	public String getTradeMoneyCd() {return TradeMoneyCd;}
	public void setTradeMoneyCd(String tradeMoneyCd) {TradeMoneyCd = tradeMoneyCd;}
	
	public String getTradeMoneyFlag() {return TradeMoneyFlag;}
	public void setTradeMoneyFlag(String tradeMoneyFlag) {TradeMoneyFlag = tradeMoneyFlag;}
	
	public String getTradeMoney() {return TradeMoney;}
	public void setTradeMoney(String tradeMoney) {TradeMoney = tradeMoney;}
	
	public String getTradeMoneyDate() {return TradeMoneyDate;}
	public void setTradeMoneyDate(String tradeMoneyDate) {TradeMoneyDate = tradeMoneyDate;}
	
	public String getOldTradeMoney() {return OldTradeMoney;}
	public void setOldTradeMoney(String oldTradeMoney) {OldTradeMoney = oldTradeMoney;}
	
	public String getOldTradeMoneyDate() {return OldTradeMoneyDate;}
	public void setOldTradeMoneyDate(String oldTradeMoneyDate) {OldTradeMoneyDate = oldTradeMoneyDate;}
	
	public String getDepositMoney() {return DepositMoney;}
	public void setDepositMoney(String depositMoney) {DepositMoney = depositMoney;}
	
	/**	투자현황	**/
	public String getInvestType() {return InvestType;}
	public void setInvestType(String investType) {InvestType = investType;}
	
	public String getInvestCd() {return InvestCd;}
	public void setInvestCd(String investCd) {InvestCd = investCd;}
	
	public String getInvestCnt() {return InvestCnt;}
	public void setInvestCnt(String investCnt) {InvestCnt = investCnt;}
	
	public String getInvestUnitPrice() {return InvestUnitPrice;}
	public void setInvestUnitPrice(String investUnitPrice) {InvestUnitPrice = investUnitPrice;}
	
	public String getInvestTradeMoney() {return InvestTradeMoney;}
	public void setInvestTradeMoney(String investTradeMoney) {InvestTradeMoney = investTradeMoney;}
	
	public String getOddlotMoney() {return OddlotMoney;}
	public void setOddlotMoney(String oddlotMoney) {OddlotMoney = oddlotMoney;}
	
	public String getInvestCharge() {return InvestCharge;}
	public void setInvestCharge(String investCharge) {InvestCharge = investCharge;}
	
	public String getInvestTax() {return InvestTax;}
	public void setInvestTax(String investTax) {InvestTax = investTax;}
	
	public String getInvestCalcuMoney() {return InvestCalcuMoney;}
	public void setInvestCalcuMoney(String investCalcuMoney) {InvestCalcuMoney = investCalcuMoney;}
	
	public String getOldInvestCalcuMoney() {return OldInvestCalcuMoney;}
	public void setOldInvestCalcuMoney(String oldInvestCalcuMoney) {OldInvestCalcuMoney = oldInvestCalcuMoney;}
	
	public String getInvestDate() {return InvestDate;}
	public void setInvestDate(String investDate) {InvestDate = investDate;}
	
	public String getOldInvestDate() {return OldInvestDate;}
	public void setOldInvestDate(String oldInvestDate) {OldInvestDate = oldInvestDate;}
	
	public String getETCInfo() {return ETCInfo;}
	public void setETCInfo(String eTCInfo) {ETCInfo = eTCInfo;}
	
	public String getProcType() {return ProcType;}
	public void setProcType(String procType) {ProcType = procType;}
	
	public String getAddMethod() {return AddMethod;}
	public void setAddMethod(String addMethod) {AddMethod = addMethod;}
	
	public String getBuyInvestCnt() {return BuyInvestCnt;}
	public void setBuyInvestCnt(String buyInvestCnt) {BuyInvestCnt = buyInvestCnt;}
	
	public String getBuyInvestUnitPrice() {return BuyInvestUnitPrice;}
	public void setBuyInvestUnitPrice(String buyInvestUnitPrice) {BuyInvestUnitPrice = buyInvestUnitPrice;}
	
	public String getBuyInvestTradeMoney() {return BuyInvestTradeMoney;}
	public void setBuyInvestTradeMoney(String buyInvestTradeMoney) {BuyInvestTradeMoney = buyInvestTradeMoney;}
	
	public String getSellInvestCnt() {return SellInvestCnt;}
	public void setSellInvestCnt(String sellInvestCnt) {SellInvestCnt = sellInvestCnt;}
	
	public String getSellInvestUnitPrice() {return SellInvestUnitPrice;}
	public void setSellInvestUnitPrice(String sellInvestUnitPrice) {SellInvestUnitPrice = sellInvestUnitPrice;}
	
	public String getSellInvestTradeMoney() {return SellInvestTradeMoney;}
	public void setSellInvestTradeMoney(String sellInvestTradeMoney) {SellInvestTradeMoney = sellInvestTradeMoney;}
	
	public String getNowInvestCnt() {return NowInvestCnt;}
	public void setNowInvestCnt(String nowInvestCnt) {NowInvestCnt = nowInvestCnt;}
	
	public String getNowCalcuMoney() {return NowCalcuMoney;}
	public void setNowCalcuMoney(String nowCalcuMoney) {NowCalcuMoney = nowCalcuMoney;}
	
	public String getNowCash() {return NowCash;}
	public void setNowCash(String nowCash) {NowCash = nowCash;}
	
	public String getNowSecurity() {return NowSecurity;}
	public void setNowSecurity(String nowSecurity) {NowSecurity = nowSecurity;}
	
	public String getCashType() {return CashType;}
	public void setCashType(String cashType) {CashType = cashType;}
	
	public String getPastMoneyCd() {return PastMoneyCd;}
	public void setPastMoneyCd(String pastMoneyCd) {PastMoneyCd = pastMoneyCd;}
	
	public String getPastInvestCnt() {return PastInvestCnt;}
	public void setPastInvestCnt(String pastInvestCnt) {PastInvestCnt = pastInvestCnt;}
	
	public String getPastUnitPrice() {return PastUnitPrice;}
	public void setPastUnitPrice(String pastUnitPrice) {PastUnitPrice = pastUnitPrice;}
	
	public String getPastCalcuMoney() {return PastCalcuMoney;}
	public void setPastCalcuMoney(String pastCalcuMoney) {PastCalcuMoney = pastCalcuMoney;}
	
	public String getPastInvestDate() {return PastInvestDate;}
	public void setPastInvestDate(String pastInvestDate) {PastInvestDate = pastInvestDate;}
	
	public String getPastCash() {return PastCash;}
	public void setPastCash(String pastCash) {PastCash = pastCash;}
	
	public String getPastSecurity() {return PastSecurity;}
	public void setPastSecurity(String pastSecurity) {PastSecurity = pastSecurity;}
	
	public String getPastFlag() {return PastFlag;}
	public void setPastFlag(String pastFlag) {PastFlag = pastFlag;}
	
	public String getInvestMoneyTmp() {return InvestMoneyTmp;}
	public void setInvestMoneyTmp(String investMoneyTmp) {InvestMoneyTmp = investMoneyTmp;}
	
	public String getApplyFlag() {return ApplyFlag;}
	public void setApplyFlag(String applyFlag) {ApplyFlag = applyFlag;}
	
	public String getApplyDate() {return ApplyDate;}
	public void setApplyDate(String applyDate) {ApplyDate = applyDate;}
	
	public String getApplyPerSabun() {return ApplyPerSabun;}
	public void setApplyPerSabun(String applyPerSabun) {ApplyPerSabun = applyPerSabun;}
	
	/** 매매대상 메모 **/
	public String getInvestMemoSeq() {return InvestMemoSeq;}
	public void setInvestMemoSeq(String investMemoSeq) {InvestMemoSeq = investMemoSeq;}
	public String getInvestMemo() {return InvestMemo;}
	public void setInvestMemo(String investMemo) {InvestMemo = investMemo;}
	
	/**	투자개요	**/
	public String getInSuCd() {return InSuCd;}
	public void setInSuCd(String inSuCd) {InSuCd = inSuCd;}
	
	public String getInSuNm() {return InSuNm;}
	public void setInSuNm(String inSuNm) {InSuNm = inSuNm;}
	
	public String getInSuCom() {return InSuCom;}
	public void setInSuCom(String inSuCom) {InSuCom = inSuCom;}
	
	public String getWarCateCd() {return WarCateCd;}
	public void setWarCateCd(String warCateCd) {WarCateCd = warCateCd;}
	
	public String getWarCateNm() {return WarCateNm;}
	public void setWarCateNm(String warCateNm) {WarCateNm = warCateNm;}
	
	public String getSecCateCd() {return SecCateCd;}
	public void setSecCateCd(String secCateCd) {SecCateCd = secCateCd;}
	
	public String getSecCateNm() {return SecCateNm;}
	public void setSecCateNm(String secCateNm) {SecCateNm = secCateNm;}
	
	public String getBondCateCd() {return BondCateCd;}
	public void setBondCateCd(String bondCateCd) {BondCateCd = bondCateCd;}
	
	public String getBondCateNm() {return BondCateNm;}
	public void setBondCateNm(String bondCateNm) {BondCateNm = bondCateNm;}
	
	public String getInSuChungDay() {return InSuChungDay;}
	public void setInSuChungDay(String inSuChungDay) {InSuChungDay = inSuChungDay;}
	
	public String getInSuNabDay() {return InSuNabDay;}
	public void setInSuNabDay(String inSuNabDay) {InSuNabDay = inSuNabDay;}
	
	public String getInSuSaChaeDay() {return InSuSaChaeDay;}
	public void setInSuSaChaeDay(String inSuSaChaeDay) {InSuSaChaeDay = inSuSaChaeDay;}
	
	public String getInSuExpiryRate() {return InSuExpiryRate;}
	public void setInSuExpiryRate(String inSuExpiryRate) {InSuExpiryRate = inSuExpiryRate;}
	
	public String getInSuRepayDay() {return InSuRepayDay;}
	public void setInSuRepayDay(String inSuRepayDay) {InSuRepayDay = inSuRepayDay;}
	
	public String getInSuRepayIza() {return InSuRepayIza;}
	public void setInSuRepayIza(String inSuRepayIza) {InSuRepayIza = inSuRepayIza;}
	
	public String getInSuRepayPeriod1() {return InSuRepayPeriod1;}
	public void setInSuRepayPeriod1(String inSuRepayPeriod1) {InSuRepayPeriod1 = inSuRepayPeriod1;}
	
	public String getInSuRepayPeriod2() {return InSuRepayPeriod2;}
	public void setInSuRepayPeriod2(String inSuRepayPeriod2) {InSuRepayPeriod2 = inSuRepayPeriod2;}
	
	public String getInSuRepayFlag() {return InSuRepayFlag;}
	public void setInSuRepayFlag(String inSuRepayFlag) {InSuRepayFlag = inSuRepayFlag;}
	
	public String getInSuRepayDate() {return InSuRepayDate;}
	public void setInSuRepayDate(String inSuRepayDate) {InSuRepayDate = inSuRepayDate;}
	
	public String getInSuRepayPerSabun() {return InSuRepayPerSabun;}
	public void setInSuRepayPerSabun(String inSuRepayPerSabun) {InSuRepayPerSabun = inSuRepayPerSabun;}
	
	public String getInSuRepayMethod() {return InSuRepayMethod;}
	public void setInSuRepayMethod(String inSuRepayMethod) {InSuRepayMethod = inSuRepayMethod;}
	
	public String getInSuRepayRate() {return InSuRepayRate;}
	public void setInSuRepayRate(String inSuRepayRate) {InSuRepayRate = inSuRepayRate;}
	
	public String getInSuIzaDay() {return InSuIzaDay;}
	public void setInSuIzaDay(String inSuIzaDay) {InSuIzaDay = inSuIzaDay;}
	
	public String getInSuIzaFlag() {return InSuIzaFlag;}
	public void setInSuIzaFlag(String inSuIzaFlag) {InSuIzaFlag = inSuIzaFlag;}
	
	public String getInSuIzaDate() {return InSuIzaDate;}
	public void setInSuIzaDate(String inSuIzaDate) {InSuIzaDate = inSuIzaDate;}
	
	public String getInSuIzaPerSabun() {return InSuIzaPerSabun;}
	public void setInSuIzaPerSabun(String inSuIzaPerSabun) {InSuIzaPerSabun = inSuIzaPerSabun;}
	
	public String getInSuSurfaceRate() {return InSuSurfaceRate;}
	public void setInSuSurfaceRate(String inSuSurfaceRate) {InSuSurfaceRate = inSuSurfaceRate;}
	
	public String getInSuSurfaceDay() {return InSuSurfaceDay;}
	public void setInSuSurfaceDay(String inSuSurfaceDay) {InSuSurfaceDay = inSuSurfaceDay;}
	
	public String getInSuFirstPrice() {return InSuFirstPrice;}
	public void setInSuFirstPrice(String inSuFirstPrice) {InSuFirstPrice = inSuFirstPrice;}
	
	public String getInSuBasePrice() {return InSuBasePrice;}
	public void setInSuBasePrice(String inSuBasePrice) {InSuBasePrice = inSuBasePrice;}
	
	public String getInSuRefixLimitPrice() {return InSuRefixLimitPrice;}
	public void setInSuRefixLimitPrice(String inSuRefixLimitPrice) {InSuRefixLimitPrice = inSuRefixLimitPrice;}
	
	public String getInSuRefixLimit() {return InSuRefixLimit;}
	public void setInSuRefixLimit(String inSuRefixLimit) {InSuRefixLimit = inSuRefixLimit;}
	
	public String getInSuNowPrice() {return InSuNowPrice;}
	public void setInSuNowPrice(String inSuNowPrice) {InSuNowPrice = inSuNowPrice;}
	
	public String getInSuRefixDay() {return InSuRefixDay;}
	public void setInSuRefixDay(String inSuRefixDay) {InSuRefixDay = inSuRefixDay;}
	
	public String getInSuRefixReason() {return InSuRefixReason;}
	public void setInSuRefixReason(String inSuRefixReason) {InSuRefixReason = inSuRefixReason;}
	
	public String getInSuRefixReasonCd() {return InSuRefixReasonCd;}
	public void setInSuRefixReasonCd(String inSuRefixReasonCd) {InSuRefixReasonCd = inSuRefixReasonCd;}
	
	public String getInSuRefixFlag() {return InSuRefixFlag;}
	public void setInSuRefixFlag(String inSuRefixFlag) {InSuRefixFlag = inSuRefixFlag;}
	
	public String getInSuRefixDate() {return InSuRefixDate;}
	public void setInSuRefixDate(String inSuRefixDate) {InSuRefixDate = inSuRefixDate;}
	
	public String getInSuRefixPerSabun() {return InSuRefixPerSabun;}
	public void setInSuRefixPerSabun(String inSuRefixPerSabun) {InSuRefixPerSabun = inSuRefixPerSabun;}
	
	public String getInSuRefixMethod() {return InSuRefixMethod;}
	public void setInSuRefixMethod(String inSuRefixMethod) {InSuRefixMethod = inSuRefixMethod;}
	
	public String getInSuClaimStart() {return InSuClaimStart;}
	public void setInSuClaimStart(String inSuClaimStart) {InSuClaimStart = inSuClaimStart;}
	
	public String getInSuClaimEnd() {return InSuClaimEnd;}
	public void setInSuClaimEnd(String inSuClaimEnd) {InSuClaimEnd = inSuClaimEnd;}
	
	public String getInSuClaimFlag() {return InSuClaimFlag;}
	public void setInSuClaimFlag(String inSuClaimFlag) {InSuClaimFlag = inSuClaimFlag;}
	
	public String getInSuClaimDate() {return InSuClaimDate;}
	public void setInSuClaimDate(String inSuClaimDate) {InSuClaimDate = inSuClaimDate;}
	
	public String getInSuClaimPerSabun() {return InSuClaimPerSabun;}
	public void setInSuClaimPerSabun(String inSuClaimPerSabun) {InSuClaimPerSabun = inSuClaimPerSabun;}
	
	public String getInSuBuyBack() {return InSuBuyBack;}
	public void setInSuBuyBack(String inSuBuyBack) {InSuBuyBack = inSuBuyBack;}
	
	public String getInSuBuyBackPre() {return InSuBuyBackPre;}
	public void setInSuBuyBackPre(String inSuBuyBackPre) {InSuBuyBackPre = inSuBuyBackPre;}
	
	// 사모투자 콜옵션 처리 관련 필드 추가 
	public String getInSuCallOption() {return InSuCallOption;}
	public void setInSuCallOption(String inSuCallOption) {InSuCallOption = inSuCallOption;}
	
	public String getInSuYtc() {return InSuYtc;}
	public void setInSuYtc(String inSuYtc) {InSuYtc = inSuYtc;}
	
	public String getInSuCallStart() {return InSuCallStart;}
	public void setInSuCallStart(String inSuCallStart) {InSuCallStart = inSuCallStart;}
	
	public String getInSuCallEnd() {return InSuCallEnd;}
	public void setInSuCallEnd(String inSuCallEnd) {InSuCallEnd = inSuCallEnd;}
	
	/***********************************/
	
	public String getInSuOutMoney() {return InSuOutMoney;}
	public void setInSuOutMoney(String inSuOutMoney) {InSuOutMoney = inSuOutMoney;}
	
	public String getInSuSumMoney() {return InSuSumMoney;}
	public void setInSuSumMoney(String inSuSumMoney) {InSuSumMoney = inSuSumMoney;}
	
	
	public String getInSuBondForm() {return InSuBondForm;}
	public void setInSuBondForm(String inSuBondForm) {InSuBondForm = inSuBondForm;}
	
	public String getInSuWar() {return InSuWar;}
	public void setInSuWar(String inSuWar) {InSuWar = inSuWar;}
	
	public String getSecTotalCnt() {return SecTotalCnt;}
	public void setSecTotalCnt(String secTotalCnt) {SecTotalCnt = secTotalCnt;}
	
	public String getSecShare() {return SecShare;}
	public void setSecShare(String secShare) {SecShare = secShare;}
	
	public String getInSuETC() {return InSuETC;}
	public void setInSuETC(String inSuETC) {InSuETC = inSuETC;}
	
	public String getOwnETC() {return OwnETC;}
	public void setOwnETC(String ownETC) {OwnETC = ownETC;}
	
	public String getOwnWar() {return OwnWar;}
	public void setOwnWar(String ownWar) {OwnWar = ownWar;}
	
	public String getAlarmDate1() {return AlarmDate1;}
	public void setAlarmDate1(String alarmDate1) {AlarmDate1 = alarmDate1;}
	
	public String getAlarmDate2() {return AlarmDate2;}
	public void setAlarmDate2(String alarmDate2) {AlarmDate2 = alarmDate2;}
	
	public String getRefixDateTmp() {return RefixDateTmp;}
	public void setRefixDateTmp(String refixDateTmp) {RefixDateTmp = refixDateTmp;}
	
	public String getInSuNowPriceTmp() {return InSuNowPriceTmp;}
	public void setInSuNowPriceTmp(String inSuNowPriceTmp) {InSuNowPriceTmp = inSuNowPriceTmp;}
	
	public String getInSuRefixSeq() {return InSuRefixSeq;}
	public void setInSuRefixSeq(String inSuRefixSeq) {InSuRefixSeq = inSuRefixSeq;}
	
	public String getInSuRefixPrice() {return InSuRefixPrice;}
	public void setInSuRefixPrice(String inSuRefixPrice) {InSuRefixPrice = inSuRefixPrice;}
	
	public String getMailPassType() {return MailPassType;}
	public void setMailPassType(String mailPassType) {MailPassType = mailPassType;}
	
	public String getHomeViewFlag() {return HomeViewFlag;}
	public void setHomeViewFlag(String homeViewFlag) {HomeViewFlag = homeViewFlag;}
	
	public String getHomeViewFlagNm() {return HomeViewFlagNm;}
	public void setHomeViewFlagNm(String homeViewFlagNm) {HomeViewFlagNm = homeViewFlagNm;}
	
	public String getReturnDate() {return ReturnDate;}
	public void setReturnDate(String returnDate) {ReturnDate = returnDate;}
	
	/**	투자개요 세부내역	**/
	public String getISICCd() {return ISICCd;}
	public void setISICCd(String iSICCd) {ISICCd = iSICCd;}
	
	public String getISICBond() {return ISICBond;}
	public void setISICBond(String iSICBond) {ISICBond = iSICBond;}
	
	public String getISICWar() {return ISICWar;}
	public void setISICWar(String iSICWar) {ISICWar = iSICWar;}
	
	public String getISICInMoney() {return ISICInMoney;}
	public void setISICInMoney(String iSICInMoney) {ISICInMoney = iSICInMoney;}
	
	public String getISICInMoneyDate() {return ISICInMoneyDate;}
	public void setISICInMoneyDate(String iSICInMoneyDate) {ISICInMoneyDate = iSICInMoneyDate;}
	
	public String getISICSurfaceIza() {return ISICSurfaceIza;}
	public void setISICSurfaceIza(String iSICSurfaceIza) {ISICSurfaceIza = iSICSurfaceIza;}
	
	public String getISICSecCom() {return ISICSecCom;}
	public void setISICSecCom(String iSICSecCom) {ISICSecCom = iSICSecCom;}
	
	public String getISICSecAccount() {return ISICSecAccount;}
	public void setISICSecAccount(String iSICSecAccount) {ISICSecAccount = iSICSecAccount;}
	
	public String getISICSaChaeCon() {return ISICSaChaeCon;}
	public void setISICSaChaeCon(String iSICSaChaeCon) {ISICSaChaeCon = iSICSaChaeCon;}
	
	public String getISICWarCon() {return ISICWarCon;}
	public void setISICWarCon(String iSICWarCon) {ISICWarCon = iSICWarCon;}
	
	/**	투자개요 이자	**/
	public String getISICIzaSeq() {return ISICIzaSeq;}
	public void setISICIzaSeq(String iSICIzaSeq) {ISICIzaSeq = iSICIzaSeq;}
	
	public String getISICRealIza() {return ISICRealIza;}
	public void setISICRealIza(String iSICRealIza) {ISICRealIza = iSICRealIza;}
	
	public String getISICRealIzaDay() {return ISICRealIzaDay;}
	public void setISICRealIzaDay(String iSICRealIzaDay) {ISICRealIzaDay = iSICRealIzaDay;}
	
	/** 투자개요 워런트 **/
	public String getWarGrpCd() {return WarGrpCd;}
	public void setWarGrpCd(String warGrpCd) {WarGrpCd = warGrpCd;}
	
	public String getWarCd() {return WarCd;}
	public void setWarCd(String warCd) {WarCd = warCd;}
	
	public String getWarMoney() {return WarMoney;}
	public void setWarMoney(String warMoney) {WarMoney = warMoney;}
	
	public String getWarSeqNum() {return WarSeqNum;}
	public void setWarSeqNum(String warSeqNum) {WarSeqNum = warSeqNum;}
	
	public String getWarSetFlag() {return WarSetFlag;}
	public void setWarSetFlag(String warSetFlag) {WarSetFlag = warSetFlag;}
	
	/** 투자개요 채권 **/
	public String getBondGrpCd() {return BondGrpCd;}
	public void setBondGrpCd(String bondGrpCd) {BondGrpCd = bondGrpCd;}
	
	public String getBondCd() {return BondCd;}
	public void setBondCd(String bondCd) {BondCd = bondCd;}
	
	public String getBondMoney() {return BondMoney;}
	public void setBondMoney(String bondMoney) {BondMoney = bondMoney;}
	
	public String getBondSeqNum() {return BondSeqNum;}
	public void setBondSeqNum(String bondSeqNum) {BondSeqNum = bondSeqNum;}
	
	public String getBondSetFlag() {return BondSetFlag;}
	public void setBondSetFlag(String bondSetFlag) {BondSetFlag = bondSetFlag;}
	
	/** 투자개요 분석&탐방 **/
	public String getMemo() {return Memo;}
	public void setMemo(String memo) {Memo = memo;}
	
	public String getOfferType() {return OfferType;}
	public void setOfferType(String offerType) {OfferType = offerType;}
	
	public String getFileFlag() {return FileFlag;}
	public void setFileFlag(String fileFlag) {FileFlag = fileFlag;}
	
	/** 채권매각 고객 세부 정보 **/
	public String getBondCusSeq() {return BondCusSeq;}
	public void setBondCusSeq(String bondCusSeq) {BondCusSeq = bondCusSeq;}
	
	public String getTargetMoney() {return TargetMoney;}
	public void setTargetMoney(String targetMoney) {TargetMoney = targetMoney;}
	
	public String getToDoSellDay() {return ToDoSellDay;}
	public void setToDoSellDay(String toDoSellDay) {ToDoSellDay = toDoSellDay;}
	
	public String getExtraPeriod() {return ExtraPeriod;}
	public void setExtraPeriod(String extraPeriod) {ExtraPeriod = extraPeriod;}
	
	public String getExtraDay() {return ExtraDay;}
	public void setExtraDay(String extraDay) {ExtraDay = extraDay;}
	
	public String getRepayMoney() {return RepayMoney;}
	public void setRepayMoney(String repayMoney) {RepayMoney = repayMoney;}
	
	public String getPeriodIza() {return PeriodIza;}
	public void setPeriodIza(String periodIza) {PeriodIza = periodIza;}
	
	public String getSumReturnMoney() {return SumReturnMoney;}
	public void setSumReturnMoney(String sumReturnMoney) {SumReturnMoney = sumReturnMoney;}
	
	public String getReqReturnRate() {return ReqReturnRate;}
	public void setReqReturnRate(String reqReturnRate) {ReqReturnRate = reqReturnRate;}
	
	public String getDealPrice() {return DealPrice;}
	public void setDealPrice(String dealPrice) {DealPrice = dealPrice;}
	
	public String getDealPriceOpt() {return DealPriceOpt;}
	public void setDealPriceOpt(String dealPriceOpt) {DealPriceOpt = dealPriceOpt;}
	
	public String getDealPriceOptNm() {return DealPriceOptNm;}
	public void setDealPriceOptNm(String dealPriceOptNm) {DealPriceOptNm = dealPriceOptNm;}
	
	public String getDealMoney() {return DealMoney;}
	public void setDealMoney(String dealMoney) {DealMoney = dealMoney;}
	
	public String getDealMoneyOpt() {return DealMoneyOpt;}
	public void setDealMoneyOpt(String dealMoneyOpt) {DealMoneyOpt = dealMoneyOpt;}
	
	public String getDealMoneyOptNm() {return DealMoneyOptNm;}
	public void setDealMoneyOptNm(String dealMoneyOptNm) {DealMoneyOptNm = dealMoneyOptNm;}
	
	public String getDealTax() {return DealTax;}
	public void setDealTax(String dealTax) {DealTax = dealTax;}
	
	public String getRealDealMoney() {return RealDealMoney;}
	public void setRealDealMoney(String realDealMoney) {RealDealMoney = realDealMoney;}
	
	public String getAssureFlag() {return AssureFlag;}
	public void setAssureFlag(String assureFlag) {AssureFlag = assureFlag;}
	
	public String getAssureFlagNm() {return AssureFlagNm;}
	public void setAssureFlagNm(String assureFlagNm) {AssureFlagNm = assureFlagNm;}
	
	public String getWithHoldingFlag() {return WithHoldingFlag;}
	public void setWithHoldingFlag(String withHoldingFlag) {WithHoldingFlag = withHoldingFlag;}
	
	public String getPutEventDay() {return PutEventDay;}
	public void setPutEventDay(String putEventDay) {PutEventDay = putEventDay;}
	
	public String getPutCycle() {return PutCycle;}
	public void setPutCycle(String putCycle) {PutCycle = putCycle;}
	
	public String getPutEventFlag() {return PutEventFlag;}
	public void setPutEventFlag(String putEventFlag) {PutEventFlag = putEventFlag;}
	
	public String getEventTargetMoney() {return EventTargetMoney;}
	public void setEventTargetMoney(String eventTargetMoney) {EventTargetMoney = eventTargetMoney;}
	
	/** 채권매각 고객 풋행사정보 **/
	public String getBondEventSeq() {return BondEventSeq;}
	public void setBondEventSeq(String bondEventSeq) {BondEventSeq = bondEventSeq;}
	
	public String getBuyMoney() {return BuyMoney;}
	public void setBuyMoney(String buyMoney) {BuyMoney = buyMoney;}
	
	public String getBuyDay() {return BuyDay;}
	public void setBuyDay(String buyDay) {BuyDay = buyDay;}
	
	public String getSellDay() {return SellDay;}
	public void setSellDay(String sellDay) {SellDay = sellDay;}
	
	public String getPassPeriod() {return PassPeriod;}
	public void setPassPeriod(String passPeriod) {PassPeriod = passPeriod;}
	
	/**	보고서	**/
	public String getReportCd() {return ReportCd;}
	public void setReportCd(String reportCd) {ReportCd = reportCd;}
	
	public String getReportSDate() {return ReportSDate;}
	public void setReportSDate(String reportSDate) {ReportSDate = reportSDate;}
	
	public String getReportEDate() {return ReportEDate;}
	public void setReportEDate(String reportEDate) {ReportEDate = reportEDate;}
	
	public String getImpDate() {return ImpDate;}
	public void setImpDate(String impDate) {ImpDate = impDate;}
	
	public String getChargeFlag() {return ChargeFlag;}
	public void setChargeFlag(String chargeFlag) {ChargeFlag = chargeFlag;}
	
	public String getChargeMoney() {return ChargeMoney;}
	public void setChargeMoney(String chargeMoney) {ChargeMoney = chargeMoney;}
	
	public String getPayLimit() {return PayLimit;}
	public void setPayLimit(String payLimit) {PayLimit = payLimit;}
	
	public String getPayFlag() {return PayFlag;}
	public void setPayFlag(String payFlag) {PayFlag = payFlag;}
	
	public String getCalcuInfo() {return CalcuInfo;}
	public void setCalcuInfo(String calcuInfo) {CalcuInfo = calcuInfo;}
	
	public String getSecInfo() {return SecInfo;}
	public void setSecInfo(String secInfo) {SecInfo = secInfo;}
	
	public String getManaInfo() {return ManaInfo;}
	public void setManaInfo(String manaInfo) {ManaInfo = manaInfo;}
	
	public String getAccMoney() {return AccMoney;}
	public void setAccMoney(String accMoney) {AccMoney = accMoney;}
	
	public String getPeriodMoney() {return PeriodMoney;}
	public void setPeriodMoney(String periodMoney) {PeriodMoney = periodMoney;}
	
	public String getStartValue() {return StartValue;}
	public void setStartValue(String startValue) {StartValue = startValue;}
	
	public String getStartCash() {return StartCash;}
	public void setStartCash(String startCash) {StartCash = startCash;}
	
	public String getStartSec() {return StartSec;}
	public void setStartSec(String startSec) {StartSec = startSec;}
	
	public String getEndValue() {return EndValue;}
	public void setEndValue(String endValue) {EndValue = endValue;}
	
	public String getEndCash() {return EndCash;}
	public void setEndCash(String endCash) {EndCash = endCash;}
	
	public String getEndSec() {return EndSec;}
	public void setEndSec(String endSec) {EndSec = endSec;}
	
	public String getCommitFlag() {return CommitFlag;}
	public void setCommitFlag(String commitFlag) {CommitFlag = commitFlag;}
	
	public String getCommitDate() {return CommitDate;}
	public void setCommitDate(String commitDate) {CommitDate = commitDate;}
	
	public String getCommitPerSabun() {return CommitPerSabun;}
	public void setCommitPerSabun(String commitPerSabun) {CommitPerSabun = commitPerSabun;}
	
	public String getCalcuAddMoney() {return CalcuAddMoney;}
	public void setCalcuAddMoney(String calcuAddMoney) {CalcuAddMoney = calcuAddMoney;}
	
	/**	투자	**/
	
	
	/**	메일	**/
	public String getMailCd() {return MailCd;}
	public void setMailCd(String mailCd) {MailCd = mailCd;}
	
	public String getMailTitle() {return MailTitle;}
	public void setMailTitle(String mailTitle) {MailTitle = mailTitle;}
	
	public String getMailCon() {return MailCon;}
	public void setMailCon(String mailCon) {MailCon = mailCon;}
	
	public String getMailFileFlag() {return MailFileFlag;}
	public void setMailFileFlag(String mailFileFlag) {MailFileFlag = mailFileFlag;}
	
	public String getMailRePerNm() {return MailRePerNm;}
	public void setMailRePerNm(String mailRePerNm) {MailRePerNm = mailRePerNm;}
	
	public String getMailRePerEmail() {return MailRePerEmail;}
	public void setMailRePerEmail(String mailRePerEmail) {MailRePerEmail = mailRePerEmail;}
	
	public String getMailSePerSabun() {return MailSePerSabun;}
	public void setMailSePerSabun(String mailSePerSabun) {MailSePerSabun = mailSePerSabun;}
	
	public String getMailSePerNm() {return MailSePerNm;}
	public void setMailSePerNm(String mailSePerNm) {MailSePerNm = mailSePerNm;}
	
	public String getMailSePerEmail() {return MailSePerEmail;}
	public void setMailSePerEmail(String mailSePerEmail) {MailSePerEmail = mailSePerEmail;}
	
	public String getMailSendDate() {return MailSendDate;}
	public void setMailSendDate(String mailSendDate) {MailSendDate = mailSendDate;}
	
	public String getMailKey() {return MailKey;}
	public void setMailKey(String mailKey) {MailKey = mailKey;}
	
	public String getMailOpenFlag() {return MailOpenFlag;}
	public void setMailOpenFlag(String mailOpenFlag) {MailOpenFlag = mailOpenFlag;}
	
	/**	투자제안	**/
	public String getInvestOfferCd() {return InvestOfferCd;}
	public void setInvestOfferCd(String investOfferCd) {InvestOfferCd = investOfferCd;}
	
	public String getInvestOfferNm() {return InvestOfferNm;}
	public void setInvestOfferNm(String investOfferNm) {InvestOfferNm = investOfferNm;}
	
	public String getInvestOfferCon() {return InvestOfferCon;}
	public void setInvestOfferCon(String investOfferCon) {InvestOfferCon = investOfferCon;}
	
	public String getInvestOfferMoney() {return InvestOfferMoney;}
	public void setInvestOfferMoney(String investOfferMoney) {InvestOfferMoney = investOfferMoney;}
	
	public String getMailingViewFlag() {return MailingViewFlag;}
	public void setMailingViewFlag(String mailingViewFlag) {MailingViewFlag = mailingViewFlag;}
	
	public String getHiddenFlag() {return HiddenFlag;}
	public void setHiddenFlag(String hiddenFlag) {HiddenFlag = hiddenFlag;}
	
	public int getViewOrder() {return ViewOrder;}
	public void setViewOrder(int viewOrder) {ViewOrder = viewOrder;}
	
	public String getScheSeq() {return ScheSeq;}
	public void setScheSeq(String scheSeq) {ScheSeq = scheSeq;}
	
	/**	고객분배	**/
	public String getDivOfferCd() {return DivOfferCd;}
	public void setDivOfferCd(String divOfferCd) {DivOfferCd = divOfferCd;}
	
	public String getDivOfferMoney() {return DivOfferMoney;}
	public void setDivOfferMoney(String divOfferMoney) {DivOfferMoney = divOfferMoney;}
	
	public String getInvestOfferFlag() {return InvestOfferFlag;}
	public void setInvestOfferFlag(String investOfferFlag) {InvestOfferFlag = investOfferFlag;}
	
	public String getDivConfirmFlag() {return DivConfirmFlag;}
	public void setDivConfirmFlag(String divConfirmFlag) {DivConfirmFlag = divConfirmFlag;}
	
	public String getDivInMoneyFlag() {return DivInMoneyFlag;}
	public void setDivInMoneyFlag(String divInMoneyFlag) {DivInMoneyFlag = divInMoneyFlag;}
	
	public String getOfferMemoSeq() {return OfferMemoSeq;}
	public void setOfferMemoSeq(String offerMemoSeq) {OfferMemoSeq = offerMemoSeq;}
	
	public String getOfferMemo() {return OfferMemo;}
	public void setOfferMemo(String offerMemo) {OfferMemo = offerMemo;}
	
	/**	게시판	**/
	// 공통
	public String getEventType() {return EventType;}
	public void setEventType(String eventType) {EventType = eventType;}
	
	public String getEventTypeTmp() {return EventTypeTmp;}
	public void setEventTypeTmp(String eventTypeTmp) {EventTypeTmp = eventTypeTmp;}
	
	public String getReadFlag() {return ReadFlag;}
	public void setReadFlag(String readFlag) {ReadFlag = readFlag;}
	
	public String getMenuCon() {return MenuCon;}
	public void setMenuCon(String menuCon) {MenuCon = menuCon;}
	
	public String getRegPerNm() {return RegPerNm;}
	public void setRegPerNm(String regPerNm) {RegPerNm = regPerNm;}
	
	// 운용보고서
	public String getNowSumMoney() {return NowSumMoney;}
	public void setNowSumMoney(String nowSumMoney) {NowSumMoney = nowSumMoney;}
	
	public String getAccPer() {return AccPer;}
	public void setAccPer(String accPer) {AccPer = accPer;}
	
	public String getAddAvgPer() {return AddAvgPer;}
	public void setAddAvgPer(String addAvgPer) {AddAvgPer = addAvgPer;}
	
	public String getRealNowCash() {return RealNowCash;}
	public void setRealNowCash(String realNowCash) {RealNowCash = realNowCash;}
	
	public String getWarSecurity() {return WarSecurity;}
	public void setWarSecurity(String warSecurity) {WarSecurity = warSecurity;}
	
	public String getNowTotalSumMoney() {return NowTotalSumMoney;}
	public void setNowTotalSumMoney(String nowTotalSumMoney) {NowTotalSumMoney = nowTotalSumMoney;}
	
	public String getAddAvgPeriod() {return AddAvgPeriod;}
	public void setAddAvgPeriod(String addAvgPeriod) {AddAvgPeriod = addAvgPeriod;}
	
	public String getHdnAccPer() {return HdnAccPer;}
	public void setHdnAccPer(String hdnAccPer) {HdnAccPer = hdnAccPer;}
	
	public String getHdnAddAvgPer() {return HdnAddAvgPer;}
	public void setHdnAddAvgPer(String hdnAddAvgPer) {HdnAddAvgPer = hdnAddAvgPer;}
	
	// 문의게시판
	public String getWriteCd() {return WriteCd;}
	public void setWriteCd(String writeCd) {WriteCd = writeCd;}
	
	public String getWriteTitle() {return WriteTitle;}
	public void setWriteTitle(String writeTitle) {WriteTitle = writeTitle;}
	
	public String getWriteCon() {return WriteCon;}
	public void setWriteCon(String writeCon) {WriteCon = writeCon;}
	
	public String getWritePerNm() {return WritePerNm;}
	public void setWritePerNm(String writePerNm) {WritePerNm = writePerNm;}
	
	public String getWritePerSabun() {return WritePerSabun;}
	public void setWritePerSabun(String writePerSabun) {WritePerSabun = writePerSabun;}
	
	public String getWritePW() {return WritePW;}
	public void setWritePW(String writePW) {WritePW = writePW;}
	
	// 문의게시판 댓글
	public String getReplyCd() {return ReplyCd;}
	public void setReplyCd(String replyCd) {ReplyCd = replyCd;}
	
	public String getReplyCon() {return ReplyCon;}
	public void setReplyCon(String replyCon) {ReplyCon = replyCon;}
	
	public String getReplyPerSabun() {return ReplyPerSabun;}
	public void setReplyPerSabun(String replyPerSabun) {ReplyPerSabun = replyPerSabun;}
	
	public String getReplyPerNm() {return ReplyPerNm;}
	public void setReplyPerNm(String replyPerNm) {ReplyPerNm = replyPerNm;}
	/** 게시판 **/
	
	/**	문자	**/
	public int getSMSSeq() {return SMSSeq;}
	public void setSMSSeq(int sMSSeq) {SMSSeq = sMSSeq;}
	
	public String getSMSTitle() {return SMSTitle;}
	public void setSMSTitle(String sMSTitle) {SMSTitle = sMSTitle;}
	
	public String getSMSType() {return SMSType;}
	public void setSMSType(String sMSType) {SMSType = sMSType;}
	
	public String getSMSToNum() {return SMSToNum;}
	public void setSMSToNum(String sMSToNum) {SMSToNum = sMSToNum;}
	
	public String getSMSFromNum() {return SMSFromNum;}
	public void setSMSFromNum(String sMSFromNum) {SMSFromNum = sMSFromNum;}
	
	public String getSMSContent() {return SMSContent;}
	public void setSMSContent(String sMSContent) {SMSContent = sMSContent;}
	
	public String getSMSReserTime() {return SMSReserTime;}
	public void setSMSReserTime(String sMSReserTime) {SMSReserTime = sMSReserTime;}
	
	public String getSMSSendTime() {return SMSSendTime;}
	public void setSMSSendTime(String sMSSendTime) {SMSSendTime = sMSSendTime;}
	
	public String getSMSEndTime() {return SMSEndTime;}
	public void setSMSEndTime(String sMSEndTime) {SMSEndTime = sMSEndTime;}
	
	public String getSMSSendFlag() {return SMSSendFlag;}
	public void setSMSSendFlag(String sMSSendFlag) {SMSSendFlag = sMSSendFlag;}
	
	public String getSMSSendFlagData() {return SMSSendFlagData;}
	public void setSMSSendFlagData(String sMSSendFlagData) {SMSSendFlagData = sMSSendFlagData;}
	
	public String getSMSFlag() {return SMSFlag;}
	public void setSMSFlag(String sMSFlag) {SMSFlag = sMSFlag;}
	
	public String getSMS_Grp_Seq() {return SMS_Grp_Seq;}
	public void setSMS_Grp_Seq(String sMS_Grp_Seq) {SMS_Grp_Seq = sMS_Grp_Seq;}
	
	public String getSMS_Grp_Nm() {return SMS_Grp_Nm;}
	public void setSMS_Grp_Nm(String sMS_Grp_Nm) {SMS_Grp_Nm = sMS_Grp_Nm;}
	
	public String getSMS_Grp_Order() {return SMS_Grp_Order;}
	public void setSMS_Grp_Order(String sMS_Grp_Order) {SMS_Grp_Order = sMS_Grp_Order;}
	
	public String getOrderLog() {return OrderLog;}
	public void setOrderLog(String orderLog) {OrderLog = orderLog;}
	
	public String getSMS_Con_Seq() {return SMS_Con_Seq;}
	public void setSMS_Con_Seq(String sMS_Con_Seq) {SMS_Con_Seq = sMS_Con_Seq;}
	
	public String getSMS_Con() {return SMS_Con;}
	public void setSMS_Con(String sMS_Con) {SMS_Con = sMS_Con;}
}