package ib.crm.admin.service.impl;

import ib.cmm.service.impl.ComAbstractDAO;
import ib.schedule.service.CusVO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository("adminDAO")
public class AdminDAO extends ComAbstractDAO {


	
	/**	시가	**/
	// 시가 등록 위한 시가 코드 받아오기
	public String GetPriceSeq(CusVO vo) throws Exception {
		return (String)selectByPk("adminDAO.GetPriceSeq", vo);
	}
	
	// 시가 개별 등록 완료
	public void AlonePriceAddEnd(CusVO vo) throws Exception {
		insert("adminDAO.AlonePriceAddEnd", vo);
	}
	
	// 시가 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetPriceList(CusVO vo) throws Exception {
		return list("adminDAO.GetPriceList", vo);
	}
	
	// 시가 등록을 위한 종목리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetPriceAddList(CusVO vo) throws Exception {
		return list("adminDAO.GetPriceAddList", vo);
	}
	
	// 미등록된 종목 자동 업데이트
	@SuppressWarnings("rawtypes")
	public void AutoCateAddEnd(List list) throws Exception {
		insert("adminDAO.AutoCateAddEnd", list);
	}
	
	// 시가 등록 완료
	@SuppressWarnings("rawtypes")
	public void PriceAddEnd(Map map) throws Exception {
		insert("adminDAO.PriceAddEndOneByOne", map);		
	}
	
	//주식외시가 등록
	@SuppressWarnings("rawtypes")
	public void PriceAddEnd(List<Map<String, Object>> map) throws Exception {
		insert("adminDAO.PriceAddEnd", map);		
	}
	
	// 시가 수정 완료
	public void PriceEditEnd(CusVO vo) throws Exception {
		update("adminDAO.PriceEditEnd", vo);
	}
	
	// 시가 최초 입력일&최근 입력일 받아오기
	public String GetCatePriceDate(CusVO vo) throws Exception {
		return (String)selectByPk("adminDAO.GetCatePriceDate", vo);
	}
	
	// 시가 통계 받아오기
	@SuppressWarnings("rawtypes")
	public List GetCatePriceStats(CusVO vo) throws Exception {
		return list("adminDAO.GetCatePriceStats", vo);
	}
		
	// 펀드 수익율 정보 등록 
	@SuppressWarnings("rawtypes")
	public void FundIrrAddEnd(List list) throws Exception {
		insert("adminDAO.FundIrrAddEnd", list);
	}
	
	// 회사 정보 등록 완료
	@SuppressWarnings("rawtypes")
	public void CompanyInfoAddEnd(List list) throws Exception {
		insert("adminDAO.CompanyInfoAddEnd", list);
	}
	/**	시가	**/
	
	/** IB **/
	// 투자회사 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetInvestComList(Map<String, String> param) throws Exception {
		return list("adminDAO.GetInvestComList", param);
	}
	
	// 최근 분석&탐방 리스트
	@SuppressWarnings("rawtypes")
	public List GetVisitAnalList(CusVO vo) throws Exception {
		return list("adminDAO.GetVisitAnalList", vo);
	}
	
	// 최근 분석&탐방 정보
	public CusVO GetVisitAnalInfo(CusVO vo) throws Exception {
		return (CusVO)selectByPk("adminDAO.GetVisitAnalInfo", vo);
	}
	
	// 분석 리스트
	@SuppressWarnings("rawtypes")
	public List GetAnalList(CusVO vo) throws Exception {
		return list("adminDAO.GetAnalList", vo);
	}
	/** IB **/
	
	/** 홈페이지 **/
	// 투자성과 리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetInvestResultList(CusVO vo) throws Exception {
		return list("adminDAO.GetInvestResultList", vo);
	}
	
	/** 홈페이지 **/
	// 투자성과 리스트 받아오기 #2
	@SuppressWarnings("rawtypes")
	public List GetInvestResultListForSA(Map map) throws Exception {
		return list("adminDAO.GetInvestResultListForSA", map);
	}
	
	/** 홈페이지 **/
	
	// 현금 등록 관련 로그
	@SuppressWarnings("rawtypes")
	public void CashLogAddEnd_List(List list) throws Exception {
		insert("adminDAO.CashLogAddEnd_List", list);
	}
	
	public void CashLogAddEnd_Alone(CusVO vo) throws Exception {
		insert("adminDAO.CashLogAddEnd_Alone", vo);
	}
	
	//펀드 수익율 조회
	@SuppressWarnings("rawtypes")
	public List GetFundIrr() throws Exception {
		return list("adminDAO.GetFundIrr", null);
	}
	
	//펀드 수익율 조회 - REST API 용
	@SuppressWarnings("rawtypes")
	public List GetFundIrrNew() throws Exception {
		return list("adminDAO.GetFundIrrNew", null);
	}
	
	//펀드 수익율 조회 일자
	@SuppressWarnings("rawtypes")
	public String GetFundIrrLastDate() throws Exception {
		return (String)selectByPk("adminDAO.GetFundIrrLastDate", null);
	}
	
	// 권한 조회
	public int HasAuthority(Map param) throws Exception {
		return (Integer)selectByPk("adminDAO.CheckPerAuthority", param);
	}
}