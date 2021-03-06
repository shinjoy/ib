package ib.schedule.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import ib.schedule.service.CusVO;
import ib.schedule.service.SpCmmVO;
import ib.schedule.service.Utill;
//import sp.crm.admin.service.impl.AdminDAO;
import ib.schedule.service.CusService;

@Service("cusService")
public class CusServiceImpl extends AbstractServiceImpl implements CusService{
	
	@Resource(name = "cusDAO")
	private CusDAO cusDAO;
	
//	@Resource(name = "adminDAO")
//	private AdminDAO adminDAO; 
	
	/**	공통	**/
	// 문자 주소록 불러오기
	@SuppressWarnings("rawtypes")
	public List GetSMSPerList(CusVO vo) throws Exception {
		return cusDAO.GetSMSPerList(vo);
	}
	
	// 문자 전송시 모아샷 연동 인덱스 코드 받아오기
	public int GetSMSSeq() throws Exception {
		return cusDAO.GetSMSSeq();
	}
	
	// 문자 전송 완료
	@SuppressWarnings("rawtypes")
	public void SMSSendEnd(List list) throws Exception {
		log.debug(list.toString());
		cusDAO.SMSSendEnd(list);
	}
	
	// 문자 전송결과 업데이트 완료
	@SuppressWarnings("rawtypes")
	public void SMSResultEnd(List list) throws Exception {
		log.debug(list.toString());
		cusDAO.SMSResultEnd(list);
	}
	
	// 문자 로그 등록 완료
	@SuppressWarnings("rawtypes")
	public void SMSLogAddEnd(List list) throws Exception {
		log.debug(list.toString());
		cusDAO.SMSLogAddEnd(list);
	}
	
	// 문자 전송결과 받아오기
	@SuppressWarnings("rawtypes")
	public List GetSMSSendList(CusVO vo) throws Exception {
		return cusDAO.GetSMSSendList(vo);
	}
	
	// 문자 전송내역 상세보기
	public CusVO GetSMSSendInfo(CusVO vo) throws Exception {
		return cusDAO.GetSMSSendInfo(vo);
	}
	
	// 내부담당자 & 유치자 & 메일담당자 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetPerList(CusVO vo) throws Exception {
		return cusDAO.GetPerList(vo);
	}
	
	// 두 날짜 기간 구하기
	public String GetDateDiff(CusVO vo) throws Exception {
		return cusDAO.GetDateDiff(vo);
	}
	/**	공통	**/
	
	/**	고객	**/
	// 일임&일임외&채권매각&유치자별 고객 리스트
	@SuppressWarnings("rawtypes")
	public List GetCusList(CusVO vo) throws Exception {
		return cusDAO.GetCusList(vo);
	}
	
	// XIRR 수익율 받아오기
	@SuppressWarnings("rawtypes")
	public List GetXIRR(CusVO vo) throws Exception {
		return cusDAO.GetXIRR(vo);
	}
	
	// 잠재 고객 리스트
	@SuppressWarnings("rawtypes")
	public List GetCusList_Hope(CusVO vo) throws Exception {
		return cusDAO.GetCusList_Hope(vo);
	}
	
	// 자기자본 고객 리스트
	@SuppressWarnings("rawtypes")
	public List GetOwnCusList(CusVO vo) throws Exception {
		return cusDAO.GetOwnCusList(vo);
	}
	
	// 자기자본 채권 상세현황
	public List<?> GetOwnBondList(CusVO vo) throws Exception {
		return cusDAO.GetOwnBondList(vo);
	}
	
	// 자기자본 채권 코멘트 변경 완료
	public void OwnEtcEditEnd(CusVO vo) throws Exception {
		cusDAO.OwnEtcEditEnd(vo);
	}
	
	// 고객등록 위한 고객코드 받아오기
	public String GetCusCd(CusVO vo) throws Exception {
		return cusDAO.GetCusCd(vo);
	}
	
	// 고객명 중복 검사 완료
	public int CusNmChkEnd(CusVO vo) throws Exception {
		return cusDAO.CusNmChkEnd(vo);
	}
	
	// 고객 기본정보 등록 완료
	public void CusBasicAddEnd(HttpServletRequest req, CusVO vo) throws Exception {
		if(!req.getParameter("InviteLen").equals("")) CusInviteProcEnd(req, vo);	// 공동유치자 등록
		if(!req.getParameter("CollaboLen").equals("")) CusCollaboProcEnd(req, vo);	// 외부협력자 등록
		log.debug(vo.toString());
		cusDAO.CusBasicAddEnd(vo);
	}
	
	// 고객 계정 생성 완료
	public void CusAccountAddEnd(CusVO vo) throws Exception {
		log.debug(vo.toString());
		cusDAO.CusAccountAddEnd(vo);
	}
		
	// 고객정보조회
	public CusVO GetCusBasicInfo(CusVO vo) throws Exception {
		return cusDAO.GetCusBasicInfo(vo);
	}
	
	// 고객명 수정 완료
	public void CusNmEditEnd(CusVO vo) throws Exception {
		cusDAO.CusNmEditEnd(vo);
	}
	
	// 고객명 수정에 따른 고객 계정 수정 완료
	public void CusAccountEditEnd(CusVO vo) throws Exception {
		cusDAO.CusAccountEditEnd(vo);
	}
	
	// 고객명 수정에 따른 투자개요 세부내역 고객명 수정 완료
	public void CusInSuInCusNmEditEnd(CusVO vo) throws Exception {
		cusDAO.CusInSuInCusNmEditEnd(vo);
	}
	
	// 고객명 수정에 따른 투자개요 워런트 고객명 수정 완료
	public void CusInSuWarCusNmEditEnd(CusVO vo) throws Exception {
		cusDAO.CusInSuWarCusNmEditEnd(vo);
	}
	
	// 고객 기본정보 수정 완료
	public void CusBasicEditEnd(CusVO vo) throws Exception {
		cusDAO.CusBasicEditEnd(vo);
	}
	
	// 고객 계정 사용여부 수정 완료
	public void CusAccountUseFlagEditEnd(CusVO vo) throws Exception {
		cusDAO.CusAccountUseFlagEditEnd(vo);
	}
	
	// 고객정보 복사 완료
	public void CusInfoCopy(CusVO vo) throws Exception {
		cusDAO.CusInfoCopy(vo);
	}
	/**	고객	**/
	
	/** 공동 유치자 **/
	// 유치자 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetInvitePerList() throws Exception {
		return cusDAO.GetInvitePerList();
	}
	
	// 유치자별 고객 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetInviteCusList(CusVO vo) throws Exception {
		return cusDAO.GetInviteCusList(vo);
	}
	
	// 외부협력자 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCollaboPerList() throws Exception {
		return cusDAO.GetCollaboPerList();
	}
	
	// 외부협력자별 고객 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCollaboCusList(CusVO vo) throws Exception {
		return cusDAO.GetCollaboCusList(vo);
	}
	
	// 공동 유치자 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCusInvitePerList(CusVO vo) throws Exception {
		return cusDAO.GetCusInvitePerList(vo);
	}
	
	// 공동 유치자 등록/수정 완료
	public void CusInviteProcEnd(HttpServletRequest req, CusVO vo) throws Exception {
		int InviteLen = Integer.parseInt(req.getParameter("InviteLen")) + 1;
		List<Map<String, Object>> InviteList = new ArrayList<Map<String, Object>>();
		
		for(int oOo = 1; oOo < InviteLen; oOo++) {
			Map<String, Object> InviteParam = new HashMap<String, Object>();
			InviteParam.put("CusCd", vo.getCusCd());
			InviteParam.put("PerSabun", req.getParameter("InvitePerSabunAry" + oOo));
			InviteParam.put("InviteRate", req.getParameter("InviteRateAry" + oOo));
			InviteParam.put("InviteReason", req.getParameter("InviteReasonAry" + oOo));
			InviteParam.put("RegPerSabun", vo.getRegPerSabun());
			InviteParam.put("DelFlag", req.getParameter("InviteDelFlagAry" + oOo));
			if(!InviteParam.get("PerSabun").equals("X")) InviteList.add(InviteParam);
		}
		for(int a = 0; a < InviteList.size(); a++) {
			System.out.println(InviteList.get(a));
		}
		if(InviteList.size() > 0) cusDAO.CusInviteProcEnd(InviteList);		// 공동 유치자 등록/수정 완료
	}
	
	// 공동 유치자 삭제 완료
	public void InviteDelEnd(CusVO vo) throws Exception {
		cusDAO.InviteDelEnd(vo);
	}
	/** 공동 유치자 **/
	
	// 외부사람 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetOutSidePerList() throws Exception {
		return cusDAO.GetOutSidePerList();
	}
	
	/** 외부 협력자 **/
	// 외부 협력자 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCusCollaboPerList(CusVO vo) throws Exception {
		return cusDAO.GetCusCollaboPerList(vo);
	}
		
	// 외부 협력자 등록/수정 완료
	public void CusCollaboProcEnd(HttpServletRequest req, CusVO vo) throws Exception {
		int CollaboLen = Integer.parseInt(req.getParameter("CollaboLen")) + 1;
		int OutPerSabun = cusDAO.GetOutSidePerSabun();
		List<Map<String, Object>> CollaboList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> OutSideList = new ArrayList<Map<String, Object>>();
		
		for(int oOo = 1; oOo < CollaboLen; oOo++) {
			Map<String, Object> CollaboParam = new HashMap<String, Object>();
			CollaboParam.put("CusCd", vo.getCusCd());
			CollaboParam.put("CollaboPerSabun", req.getParameter("CollaboPerSabunAry" + oOo));
			CollaboParam.put("OutPerNm", req.getParameter("CollaboPerNmAry" + oOo));
//			CollaboParam.put("CollaboRate", req.getParameter("CollaboRateAry" + oOo));	2015.07.13 외부협력자 비율삭제
			CollaboParam.put("CollaboReason", req.getParameter("CollaboReasonAry" + oOo));
			CollaboParam.put("RegPerSabun", vo.getRegPerSabun());
			CollaboParam.put("DelFlag", req.getParameter("CollaboDelFlagAry" + oOo));
			if(!CollaboParam.get("CollaboPerSabun").equals("X")) CollaboList.add(CollaboParam);	// 기존에 등록된 외부사람이면 협력자로 바로 등록
			else {	// 새로운 외부사람이면 외부사람 정보 입력 후 협력자로 등록
				if(!CollaboParam.get("OutPerNm").equals("")) {
					CollaboParam.put("OutPerSabun", OutPerSabun);
					OutSideList.add(CollaboParam);
					
					CollaboParam.put("CollaboPerSabun", OutPerSabun);
					CollaboList.add(CollaboParam);
					OutPerSabun++;
				}
			}
		}
		if(OutSideList.size() > 0) cusDAO.OutSidePerAddEnd(OutSideList);	// 신규 인원있으면 등록
		if(CollaboList.size() > 0) cusDAO.CusCollaboProcEnd(CollaboList);
	}
	
	// 외부 협력자 삭제 완료
	public void CollaboDelEnd(CusVO vo) throws Exception {
		cusDAO.CollaboDelEnd(vo);
	}
	/** 외부 협력자 **/
	
	/** 연관 고객 **/
	// 연관고객 코드 받아오기
	public int GetConSeq(CusVO vo) throws Exception {
		return cusDAO.GetConSeq(vo);
	}
	
	// 연관고객 정보 등록 완료
	@SuppressWarnings("rawtypes")
	public void ConCusAddEnd(List list) throws Exception {
		log.debug(list.toString());
		cusDAO.ConCusAddEnd(list);
	}
	
	// 연관 고객 정보 조회
	@SuppressWarnings("rawtypes")
	public List GetConCusList(CusVO vo) throws Exception {
		return cusDAO.GetConCusList(vo);
	}
	
	@SuppressWarnings("rawtypes")
	public List GetConCusList2(CusVO vo) throws Exception {
		return cusDAO.GetConCusList2(vo);
	}
	
	// 연관 고객 정보 삭제 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetConCusDelList(CusVO vo) throws Exception {
		return cusDAO.GetConCusDelList(vo);
	}
	
	// 연관 고객 정보 삭제
	@SuppressWarnings("rawtypes")
	public void ConCusDelEnd(List list) throws Exception {
		log.debug(list.toString());
		cusDAO.ConCusDelEnd(list);
	}
	/** 연관 고객 **/
	
	/**	고객 관리	**/
	// 유치자별 투자현황 (타이틀)
	@SuppressWarnings("rawtypes")
	public List GetInvestStatusTitle(CusVO vo) throws Exception {
		return cusDAO.GetInvestStatusTitle(vo);
	}
	
	// 유치자별 투자현황
	@SuppressWarnings("rawtypes")
	public List GetInvestStatus(CusVO vo) throws Exception {
		return cusDAO.GetInvestStatus(vo);
	}
	/**	고객 관리	**/
	
	/**	고객 담당자	**/
	// 고객 담당자 리스트
	@SuppressWarnings("rawtypes")
	public List GetCusPerList(CusVO vo) throws Exception {
		return cusDAO.GetCusPerList(vo);
	}
	
	// 고객 담당자 등록을 위한 담당자코드 받아오기
	public String GetCusPerCd(CusVO vo) throws Exception {
		return (String)cusDAO.GetCusPerCd(vo);
	}
	
	// 고객 담당자 등록 완료
	public void CusManagerAddEnd(CusVO vo) throws Exception {
		log.debug(vo.toString());
		cusDAO.CusManagerAddEnd(vo);
	}
	
	// 고객 담당자 수정 완료
	public void CusManagerEditEnd(CusVO vo) throws Exception {
		cusDAO.CusManagerEditEnd(vo);
	}
	
	// 고객 담당자 삭제 완료
	public void CusManagerDelEnd(CusVO vo) throws Exception {
		cusDAO.CusManagerDelEnd(vo);
	}
	/**	고객 담당자	**/
	
	/**	계약정보	**/
	// 계약 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCusTradeList(CusVO vo) throws Exception {
		return cusDAO.GetCusTradeList(vo);
	}
	
	// 계약 파일 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCusTradeFileList(CusVO vo) throws Exception {
		return cusDAO.GetCusTradeFileList(vo);
	}
	
	// 계약 등록을 위한 계약코드 받아오기
	public String GetTradeCd(CusVO vo) throws Exception {
		return cusDAO.GetTradeCd(vo);
	}
	
	// 계약 등록 완료
	public void CusTradeAddEnd(CusVO vo) throws Exception {
		log.debug(vo.toString());
		cusDAO.CusTradeAddEnd(vo);
	}
	
	// 계약 파일 코드 받아오기
	public int GetCusTradeFileCd(CusVO vo) throws Exception {
		return cusDAO.GetCusTradeFileCd(vo);
	}
	
	// 계약 파일 등록 완료
	@SuppressWarnings("rawtypes")
	public void CusTradeFileAddEnd(List list) throws Exception {
		log.debug(list.toString());
		cusDAO.CusTradeFileAddEnd(list);
	}
	
	// 계약 수정 완료
	public void CusTradeEditEnd(CusVO vo) throws Exception {
		cusDAO.CusTradeEditEnd(vo);
	}
	
	// 종목별 매매주체 관리
	public String CateTradeHostAddEnd(CusVO vo) throws Exception {
		return cusDAO.CateTradeHostAddEnd(vo);
	}
	
	// 계약 삭제 완료
	public void CusTradeDelEnd(CusVO vo) throws Exception {
		cusDAO.CusTradeDelEnd(vo);
	}
	
	// 계약 파일 일괄 삭제 완료
	public void CusTradeFileAllDelEnd(CusVO vo) throws Exception {
		cusDAO.CusTradeFileAllDelEnd(vo);
	}
	
	// 계약 파일 삭제 완료
	public void CusTradeFileDelEnd(CusVO vo) throws Exception {
		cusDAO.CusTradeFileDelEnd(vo);
	}
	/**	계약정보	**/
	
	/**	계약금	**/
	// 계약금 리스트
	@SuppressWarnings("rawtypes")
	public List GetCusTradeMoneyList(CusVO vo) throws Exception {
		return cusDAO.GetCusTradeMoneyList(vo);
	}
	
	// 계약금 등록을 위한 계약금 코드 받아오기
	public String GetTradeMoneyCd(CusVO vo) throws Exception {
		return cusDAO.GetTradeMoneyCd(vo);
	}
	
	// 계약금 등록 완료
	public void TradeMoneyAddEnd(CusVO vo) throws Exception {
		log.debug(vo.toString());
		cusDAO.TradeMoneyAddEnd(vo);
	}
	
	// 계약금 수정 완료
	public void TradeMoneyEditEnd(CusVO vo) throws Exception {
		cusDAO.TradeMoneyEditEnd(vo);
	}
	
	// 계약금 삭제 완료
	public void TradeMoneyDelEnd(CusVO vo) throws Exception {
		cusDAO.TradeMoneyDelEnd(vo);
	}
	
	// 계약금 해당일에 예수금 등록여부 받아오기
	public int GetTradeMoneyDateInCashDate(CusVO vo) throws Exception {
	    return cusDAO.GetTradeMoneyDateInCashDate(vo);
	}
	
	// 계약금 해당일에 예수금 미등록일시 가장 최근 예수금 받아오기
	public String GetLastCashMoney(CusVO vo) throws Exception {
	    return cusDAO.GetLastCashMoney(vo);
	}
	
	// 계약금 변경에 따른 예수금 변경
	public void TradeMoneySetCashEditEnd(CusVO vo) throws Exception {
	    cusDAO.TradeMoneySetCashEditEnd(vo);
	}
	/**	계약금	**/
	
	/**	매매	**/
	// 매매 정보 리스트
	@SuppressWarnings("rawtypes")
	public List GetInvestTradeList(CusVO vo) throws Exception {
	    return cusDAO.GetInvestTradeList(vo);
	}
	/**	매매	**/
	
	/**	유가증권	**/
	// 유가증권 조회를 위한 고객&종목 선택페이지
	@SuppressWarnings("rawtypes")
	public List GetInvestList_SelList(CusVO vo, String Flag) throws Exception {
		vo.setEventFlag(Flag);
		return cusDAO.GetInvestList_SelList(vo);
	}
	
	// 투자 현황 리스트
	@SuppressWarnings("rawtypes")
	public List GetCusInvestList(CusVO vo) throws Exception {
		return cusDAO.GetCusInvestList(vo);
	}
		
	// 투자 현황 등록을 위한 투자 현황 코드 받아오기
	public String GetInvestCd(CusVO vo) throws Exception {
		return cusDAO.GetInvestCd(vo);
	}

	// 투자 현황 등록 완료
	public void CusInvestAddEnd(CusVO vo) throws Exception {
		log.debug(vo.toString());
		cusDAO.CusInvestAddEnd(vo);
	}
	
	// 매수에 따른 예수금 수정 완료
	public void InvestBuyAddCashApplyEnd(CusVO vo) throws Exception {
	    cusDAO.InvestBuyAddCashApplyEnd(vo);
	}
	
	// 매수 현황 리스트
	@SuppressWarnings("rawtypes")
	public List GetInvestList_Cus_Buy(CusVO vo) throws Exception {
		return cusDAO.GetInvestList_Cus_Buy(vo);
	}
	
	// 매수 수정/삭제 해당일에 예수금 정보 받아오기
	public CusVO GetInvestBuyDateInCashDate(CusVO vo) throws Exception {
		return cusDAO.GetInvestBuyDateInCashDate(vo);
	}
	
	// 매수 수정 완료
	public void CusInvestBuyEditEnd(CusVO vo) throws Exception {
		cusDAO.CusInvestBuyEditEnd(vo);
	}
	
	// 매수 수정에 따른 예수금 수정 완료
	public void InvestBuyEditCashApplyEnd(CusVO vo) throws Exception {
		cusDAO.InvestBuyEditCashApplyEnd(vo);
	}
	
	// 매수&현금 삭제 완료
	public void CusInvestBuyDelEnd(CusVO vo) throws Exception {
		cusDAO.CusInvestBuyDelEnd(vo);
	}
	
	// 매수 삭제에 따른 예수금 삭제 완료
	public void InvestBuyDelCashApplyEnd(CusVO vo) throws Exception {
		cusDAO.InvestBuyDelCashApplyEnd(vo);
	}
	
	// 매도에 따른 예수금 Tmp 등록 완료
	public void InvestSellTmpAddEnd(CusVO vo) throws Exception {
		log.debug(vo.toString());
		cusDAO.InvestSellTmpAddEnd(vo);
	}
	
	// 매도에 따른 예수금 Tmp 반영일 및 반영가능 여부 받아오기
	@SuppressWarnings("rawtypes")
	public List CashTmpChk(CusVO vo) throws Exception {
		return cusDAO.CashTmpChk(vo);
	}
	
	// 매도 현황 리스트
	@SuppressWarnings("rawtypes")
	public List GetInvestList_Cus_Sell(CusVO vo) throws Exception {
		return cusDAO.GetInvestList_Cus_Sell(vo);
	}
	
	// 매도 수정 완료
	public void CusInvestSellEditEnd(CusVO vo) throws Exception {
		cusDAO.CusInvestSellEditEnd(vo);
	}
	
	// 매도수정에 따른 예수금 Tmp 수정 완료
	public void InvestSellTmpEditEnd(CusVO vo) throws Exception {
		cusDAO.InvestSellTmpEditEnd(vo);
	}
	
	// 매도 삭제 완료
	public void CusInvestSellDelEnd(CusVO vo) throws Exception {
		cusDAO.CusInvestSellDelEnd(vo);
	}
	
	// 매도삭제에 따른 예수금  Tmp 삭제 완료
	public void InvestSellTmpDelEnd(CusVO vo) throws Exception {
		cusDAO.InvestSellTmpDelEnd(vo);
	}
	
	// 예수금 반영을 위한  예수금 Tmp 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCashTmpList(CusVO vo) throws Exception {
		return cusDAO.GetCashTmpList(vo);
	}
	
	// 예수금 Tmp 예수금 반영 완료
	public void CashTmpApplyAddEnd(CusVO vo) throws Exception {
		cusDAO.CashTmpApplyAddEnd(vo);
	}
	
	// 예수금 Tmp 반영 완료 후 해당 예수금 Tmp 수정 완료
	public void CashTmpApplyEditEnd(CusVO vo) throws Exception {
		cusDAO.CashTmpApplyEditEnd(vo);
	}
	/**	유가증권	**/
	
	/**	종목	**/
	// 종목리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCateList(CusVO vo) throws Exception {
		return cusDAO.GetCateList(vo);
	}
	
	// 종목 등록을 위한 종목 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetAddCateList(CusVO vo) throws Exception {
		return cusDAO.GetAddCateList(vo);
	}
	
	// 종목 중복 여부 확인
	public int ChkCateNm(CusVO vo) throws Exception {
		return cusDAO.ChkCateNm(vo);
	}
	
	// 등록되지 않은 비상장 종목코드 생성
	public String GetOutCateCd(CusVO vo) throws Exception {
		return cusDAO.GetOutCateCd(vo);
	}
	
//	// 종목 등록 완료
//	public void CateAddEnd(CusVO vo) throws Exception {
//		log.debug(vo.toString());
//		cusDAO.CateAddEnd(vo);
//		if(vo.getUpFlag().equals("N")) {	// 비상장 종목이면 등록과 동시에 싯가 등록 워런트 0원 채권, CB, EB, RCPS 10000원
//			vo.setPriceSeq(adminDAO.GetPriceSeq(vo));
//			vo.setPriceDate(Utill.Today("Today"));
//			if(vo.getSubCateCd().equals("3")) vo.setUnitPrice("0");
//			else if(vo.getSubCateCd().equals("1") || vo.getSubCateCd().equals("4") || vo.getSubCateCd().equals("5") || vo.getSubCateCd().equals("6")) vo.setUnitPrice("10000");
//			adminDAO.AlonePriceAddEnd(vo);
//		}
//	}
	
	// 종목 버튼 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCateBtnList(CusVO vo) throws Exception {
		return cusDAO.GetCateBtnList(vo);
	}
	
	// 종목 사용 안함 완료
	public void CateNotUseEnd(CusVO vo) throws Exception {
		cusDAO.CateNotUseEnd(vo);
	}
	
	// 종목 사용함 완료
	public void CateUseEnd(CusVO vo) throws Exception {
		cusDAO.CateUseEnd(vo);
	}
	
	// 종목별 고객리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCusCateList(CusVO vo) throws Exception {
        return cusDAO.GetCusCateList(vo);
    }
	/**	종목	**/
	
	/**	현금	**/
	// 현금기준 고객리스트
	@SuppressWarnings("rawtypes")
	public List GetCusCashList(CusVO vo) throws Exception {
		return cusDAO.GetCusCashList(vo);
	}
	
	// 일괄등록을 위한 CMA 및 예수금 등록 여부 받기
	public String GetForAllCashInvestCd(CusVO vo) throws Exception {
		return cusDAO.GetForAllCashInvestCd(vo);
	}
	
	// 일괄등록을 위한 기존 CMA 및 예수금 삭제하기
	public void ForAllCashInvestDelEnd(CusVO vo) throws Exception {
		cusDAO.ForAllCashInvestDelEnd(vo);
	}
	
	// 일괄 현금 등록 완료
	@SuppressWarnings("rawtypes")
	public void CusInvestAllAddEnd_Cash(List list) throws Exception {
		log.debug(list.toString());
		cusDAO.CusInvestAllAddEnd_Cash(list);
	}
	
	// 현금 현황 버튼 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCashCateList(CusVO vo) throws Exception {
		return cusDAO.GetCashCateList(vo);
	}
	
	// 고객별 현금 현황 리스트
	@SuppressWarnings("rawtypes")
	public List GetCusInvestList_Cash(CusVO vo) throws Exception {
		return cusDAO.GetCusInvestList_Cash(vo);
	}
	
	// 고객별 현금 등록을 위한 현금 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCashAddList(CusVO vo) throws Exception {
		return cusDAO.GetCashAddList(vo);
	}
	
	// 고객별 현금 현황 등록 완료
	@SuppressWarnings("rawtypes")
	public void CusInvestAddEnd_Cash(List list) throws Exception {
		log.debug(list.toString());
		cusDAO.CusInvestAddEnd_Cash(list);
	}
	/**	현금	**/
	
	/**	사모투자	**/
	// 알람 리스트
	@SuppressWarnings("rawtypes")
	public List GetAlarmList(SpCmmVO vo) throws Exception {
		return cusDAO.GetAlarmList(vo);
	}
	
	// 알람확인 완료
	public void AlarmCheckEnd(CusVO vo) throws Exception {
		cusDAO.AlarmCheckEnd(vo);
	}
	
	// 투자개요 리스트
	@SuppressWarnings("rawtypes")
	public List GetInSumList(CusVO vo) throws Exception {
		return cusDAO.GetInSumList(vo);
	}
	
	// 투자개요 등록을 위한 투자개요코드 받아오기
	public String GetInSuCd(CusVO vo) throws Exception {
		return cusDAO.GetInSuCd(vo);
	}
	
	// 투자개요 등록&수정 완료
	public void InSumProcEnd(CusVO vo) throws Exception {
		log.debug(vo.toString());
		cusDAO.InSumProcEnd(vo);
	}
	
	// 투자개요 수정시 연관종목 변경에 따른 고객 매수 정보 업데이트
	public void InSumInCusEditEnd(CusVO vo) throws Exception {
		cusDAO.InSumInCusEditEnd(vo);
	}
	
	// 투자개요 수정시 리픽싱 정보 등록하기
	public void InSumRefixInfoAddEnd(CusVO vo) throws Exception {
		log.debug(vo.toString());
		cusDAO.InSumRefixInfoAddEnd(vo);
	}
	
	// 투자개요 파일코드 받아오기
	public int GetInSumFileCd(CusVO vo) throws Exception {
		return cusDAO.GetInSumFileCd(vo);
	}
	
	// 투자개요 파일 등록 완료
	@SuppressWarnings("rawtypes")
	public void InSumFileAddEnd(List list) throws Exception {
		log.debug(list.toString());
		cusDAO.InSumFileAddEnd(list);
	}
		
	// 투자개요 정보 불러오기
	public CusVO GetInSumInfo(CusVO vo) throws Exception {
		return cusDAO.GetInSumInfo(vo);
	}
	
	// 투자개요 리픽싱정보 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetInSumRefixList(CusVO vo) throws Exception {
		return cusDAO.GetInSumRefixList(vo);
	}
	
	// 투자개요 파일 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetInSumFileList(CusVO vo) throws Exception {
		return cusDAO.GetInSumFileList(vo);
	}
	
	// 투자개요 파일 삭제 완료
	public void InSumFileDelEnd(CusVO vo) throws Exception {
		cusDAO.InSumFileDelEnd(vo);
	}
	
	// 투자개요 매도단가 입력 완료
	public int InSumUnitPriceAddEnd(CusVO vo) throws Exception {
		return cusDAO.InSumUnitPriceAddEnd(vo);
	}
	
	// 투자개요 사용여부 변경 완료
	public void InSumUseFlagEnd(CusVO vo) throws Exception {
		cusDAO.InSumUseFlagEnd(vo);
	}
	
	// 투자개요 탐방리포트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetInSumVisitFileList(CusVO vo) throws Exception {
		return cusDAO.GetInSumVisitFileList(vo);
	}
	/**	사모투자	**/
	
	/** 사모투자 이자관리 **/
	// 이자 등록을 위한 투자개요 세부내역 불러오기
	@SuppressWarnings("rawtypes")
	public List GetInSumInCusForIzaList(CusVO vo) throws Exception {
		return cusDAO.GetInSumInCusForIzaList(vo);
	}
	
	// 이자 등록을 위한 이자 순번 받아오기
	public String GetISICIzaSeq(CusVO vo) throws Exception {
		return cusDAO.GetISICIzaSeq(vo);
	}
	
	// 이자 등록 완료
	@SuppressWarnings("rawtypes")
	public void InSumInCusIzaAddEnd(List list, CusVO vo) throws Exception {
		log.debug(list.toString());
		cusDAO.InSumInCusIzaAddEnd(list, vo);
	}
	/** 사모투자 이자관리 **/
	
	/** 세부내용 관리 **/
	// 투자개요 세부내역 등록을 위한 고객리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetInCusAddList(CusVO vo) throws Exception {
		return cusDAO.GetInCusAddList(vo);
	}
	
	// 투자개요 세부내역 등록을 위한 연관코드 받아오기
	public String GetISICCd(CusVO vo) throws Exception {
		return (String)cusDAO.GetISICCd(vo);
	}
		
	// 투자개요 세부내역 등록 완료
	@SuppressWarnings("rawtypes")
	public void InCusAddEnd(List list) throws Exception {
		log.debug(list.toString());
		cusDAO.InCusAddEnd(list);
	}
		
	// 투자개요 세부내역 파일코드 받아오기
	public int GetInSumInCusFileCd(CusVO vo) throws Exception {
		return cusDAO.GetInSumInCusFileCd(vo);
	}
		
	// 투자개요 세부내역 파일 등록 완료
	@SuppressWarnings("rawtypes")
	public void InSumInCusFileAddEnd(List list) throws Exception {
		log.debug(list.toString());
		cusDAO.InSumInCusFileAddEnd(list);
	}
	
	// 투자개요 세부내역 계약서 생성 완료
	public void InSumInCusTradeDocAddEnd(CusVO vo) throws Exception {
		log.debug(vo.toString());
		cusDAO.InSumInCusTradeDocAddEnd(vo);
	}
	
	// 투자개요 세부내역 불러오기
	@SuppressWarnings("rawtypes")
	public List GetInCusList(CusVO vo) throws Exception {
		return cusDAO.GetInCusList(vo);
	}
	
	// 투자개요 세부내역 파일 불러오기
	@SuppressWarnings("rawtypes")
	public List GetInCusFileList(CusVO vo) throws Exception {
		return cusDAO.GetInCusFileList(vo);
	}
	
	// 투자개요 세부내용 수정 완료
	public void InCusEditEnd(CusVO vo) throws Exception {
		cusDAO.InCusEditEnd(vo);
	}
	
	// 투자개요 세부내용 삭제 완료
	public void InCusDelEnd(CusVO vo) throws Exception {
		cusDAO.InCusDelEnd(vo);
	}
	
	// 투자개요 연동 워런트 정보 삭제 완료
	public void InCusWarDelEnd(CusVO vo) throws Exception {
		cusDAO.InCusWarDelEnd(vo);
	}
	
	// 투자개요 세부내용 연동 매매내역 정보 받아오기
	@SuppressWarnings("rawtypes")
	public List GetInCusInvestInfo(CusVO vo) throws Exception {
		return cusDAO.GetInCusInvestInfo(vo);
	}
	
	// 투자개요 세부내용 연동 매매내역 삭제 완료
	public void InCusInvestDelEnd(CusVO vo) throws Exception {
		cusDAO.InCusInvestDelEnd(vo);
	}
	
	// 투자개요 세부내용 파일 삭제 완료
	public void InCusFileDelEnd(CusVO vo) throws Exception {
		cusDAO.InCusFileDelEnd(vo);
	}
	
	// 세부내용 행사, 조기상환 전달을 위한 고객 담당자 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetInSumCusPerList(CusVO vo) throws Exception {
		return cusDAO.GetInSumCusPerList(vo);
	}
	
	// 세부내용 행사, 조기상환 메일 코드 받아오기
	public String GetInSumMailCd(CusVO vo) throws Exception {
		return cusDAO.GetInSumMailCd(vo);
	}
	
	// 세부내용 행사, 조기상환 메일 로그 등록 완료
	@SuppressWarnings("rawtypes")
	public void InSumInCusMailLogAddEnd(List list) throws Exception {
		cusDAO.InSumInCusMailLogAddEnd(list);
	}
	
	// 세부내용 행사, 조기상환 메일 파일 코드 받아오기
	public int GetInSumMailFileCd(CusVO vo) throws Exception {
		return cusDAO.GetInSumMailFileCd(vo);
	}
	
	// 세부내용 행사, 조기상환 메일 파일 등록 완료
	@SuppressWarnings("rawtypes")
	public void InSumInCusMailFileAddEnd(List list) throws Exception {
		cusDAO.InSumInCusMailFileAddEnd(list);
	}
	
	// 세부내용 행사, 조기상환 메일 전송 현황 받아오기
	@SuppressWarnings("rawtypes")
	public List GetInCusMailSendList(CusVO vo) throws Exception {
		return cusDAO.GetInCusMailSendList(vo);
	}
	/** 세부내용 관리 **/
	
	/**	채권매각고객 상세정보 **/
	// 채권매각고객 고급검색 키워드
	@SuppressWarnings("rawtypes")
	public List GetBondSellCusKeyList(CusVO vo) throws Exception {
		return cusDAO.GetBondSellCusKeyList(vo);
	}
	
	// 채권매각고객 세부정보 리스트
	@SuppressWarnings("rawtypes")
	public List GetBondSellCusList(CusVO vo) throws Exception {
		return cusDAO.GetBondSellCusList(vo);
	}
	
	// 채권매각고객 세부정보 상세보기
	public CusVO GetBondSellCusInfo(CusVO vo) throws Exception {
		return cusDAO.GetBondSellCusInfo(vo);
	}
	
	// 채권매각고객 세부정보 시퀀스 받아오기
	public String GetBondCusSeq(CusVO vo) throws Exception {
		return cusDAO.GetBondCusSeq(vo);
	}
	
	// 채권매각고객 세부정보 등록 완료
	@SuppressWarnings("rawtypes")
	public void BondSellCusAddEnd(List list) throws Exception {
		log.debug(list.toString());
		cusDAO.BondSellCusAddEnd(list);
	}
	
	// 채권매각고객 세부정보 수정 완료
	public void BondSellCusInfoEditEnd(CusVO vo) throws Exception {
		cusDAO.BondSellCusInfoEditEnd(vo);
	}
	
	// 세부내용 수정에 따른 채권매각고객 세부정보 수정
	public void BondSellCusEditEnd(CusVO vo) throws Exception {
		cusDAO.BondSellCusEditEnd(vo);
	}
	
	// 채권매각고객 세부정보 삭제
	public void BondSellCusDelEnd(CusVO vo) throws Exception {
		cusDAO.BondSellCusDelEnd(vo);
	}
	
	// 사모투자 세부내용 건별 정보 받아오기
	public CusVO GetInSumInCusInfo(CusVO vo) throws Exception {
		return cusDAO.GetInSumInCusInfo(vo);
	}
	
	// 채권매각고객 풋행사 완료
	public void BondSellCusEventAddEnd(CusVO vo) throws Exception {
		vo.setBondEventSeq(cusDAO.GetBondEventSeq(vo));
		log.debug(vo.toString());
		cusDAO.BondSellCusEventAddEnd(vo);
	}
	
	// 채권매각고객 풋행사 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetBondSellCusEventList(CusVO vo) throws Exception {
		return cusDAO.GetBondSellCusEventList(vo);
	}
	
	// 채권매각고객 풋행사 정보 받아오기
	public CusVO GetBondSellCusEventView(CusVO vo) throws Exception {
		return cusDAO.GetBondSellCusEventView(vo);
	}
	/**	채권매각고객 상세정보 **/
	
	/** 고객별 통계 **/
	// 고객별 통계 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCusStats(CusVO vo) throws Exception {
		return cusDAO.GetCusStats(vo);
	}
	
	// 고객 상태별 통계 받아오기
	@SuppressWarnings("rawtypes")
	public List GetStatusStats(CusVO vo) throws Exception {
		return cusDAO.GetStatusStats(vo);
	}
	/** 고객별 통계 **/
	
	/** 워런트 관리 **/
	// 워런트 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetWarList(CusVO vo) throws Exception {
		return cusDAO.GetWarList(vo);
	}
	
	// 워런트 파일 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetWarFileList(CusVO vo) throws Exception {
		return cusDAO.GetWarFileList(vo);
	}
	
	// 워런트 그룹코드 받아오기
	public int GetWarGrpCd(CusVO vo) throws Exception {
		return cusDAO.GetWarGrpCd(vo);
	}
	
	// 워런트 코드 받아오기
	public int GetWarCd(CusVO vo) throws Exception {
		return cusDAO.GetWarCd(vo);
	}
	
	// 워런트 등록/수정 완료
	@SuppressWarnings("rawtypes")
	public void WarMngProcEnd(List list) throws Exception {
		log.debug(list.toString());
		cusDAO.WarMngProcEnd(list);
	}
	
	// 워런트 파일 코드 받아오기
	public int GetWarFileCd(CusVO vo) throws Exception {
		return cusDAO.GetWarFileCd(vo);
	}
	
	// 워런트 파일 등록 완료
	@SuppressWarnings("rawtypes")
	public void WarFileAddEnd(List list) throws Exception {
		log.debug(list.toString());
		cusDAO.WarFileAddEnd(list);
	}
	
	// 워런트 삭제 완료
	public void WarMngDelEnd(CusVO vo) throws Exception {
		cusDAO.WarMngDelEnd(vo);
	}
	
	// 워런트 파일 삭제 완료
	public void WarFileDelEnd(CusVO vo) throws Exception {
		cusDAO.WarFileDelEnd(vo);
	}
	/** 워런트 관리 **/

}