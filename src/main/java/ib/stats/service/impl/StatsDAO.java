package ib.stats.service.impl;

import ib.cmm.service.impl.ComAbstractDAO;
import ib.stats.service.StatsVO;
import ib.work.service.WorkVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package  : ib.stats.service.impl
 * filename : StatsDAO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 10. 12.
 * @version : 1.0.0
 */
@Repository("statsDAO")
public class StatsDAO extends ComAbstractDAO{

	/**
	 *
	 * @MethodName : selectPrivateResult
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<StatsVO> selectPrivateResult(StatsVO VO) throws Exception {
		return list("statsDAO.selectPrivateResult", VO);
	}

	/**
	 *
	 * @MethodName : selectPrivateOffer
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectPrivateOffer(WorkVO VO) throws Exception {
		return list("statsDAO.selectPrivateOffer", VO);
	}

	/**
	 *
	 * @MethodName : selectPrivateOfferKeyPoint
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectPrivateOfferKeyPoint(WorkVO workVO) throws Exception {
		return list("statsDAO.selectPrivateOfferKeyPoint", workVO);
	}

	
	/**
	 *
	 * @MethodName : selectPrivateCustomerInsert
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectPrivateCustomerInsert(WorkVO VO) throws Exception {
		return list("statsDAO.selectPrivateCustomerInsert", VO);
	}

	/**
	 *
	 * @MethodName : selectPrivateCustomerInfoInsert
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectPrivateCustomerInfoInsert(WorkVO VO) throws Exception {
		return list("statsDAO.selectPrivateCustomerInfoInsert", VO);
	}

	/**
	 *
	 * @MethodName : selectRecommendOpinion
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectRecommendOpinion(WorkVO VO) throws Exception {
		return list("statsDAO.selectRecommendOpinion", VO);
	}

	/**
	 *
	 * @MethodName : selectNetwork
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectNetwork(WorkVO VO) throws Exception {
		return list("statsDAO.selectNetwork", VO);
	}

	/**
	 *
	 * @MethodName : selectIntroducer
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectIntroducer(WorkVO VO) throws Exception {
		return list("statsDAO.selectIntroducer", VO);
	}

	/**
	 *
	 * @MethodName : selectPrivateOffer4Stats
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectPrivateOffer4Stats(StatsVO VO) throws Exception {
		return list("statsDAO.selectPrivateOffer4Stats", VO);
	}

	/**
	 *
	 * @MethodName : selectOfferInfo
	 * @param workVO
	 * @return
	 */
	public Object selectOfferInfo(StatsVO VO) throws Exception {
		return list("statsDAO.selectOfferInfo", VO);
	}
	
	/********** 통계 정보 **********/
	
	/**
	 *
	 * @MethodName : selectChartInfo
	 * @param workVO
	 * @return
	 */
	public List<Map> selectChartInfo(Map<String, String> map) throws Exception {
		return list("statsDAO.selectChartInfo", map);
	}
	
	/**
	 *
	 * @MethodName : selectDealCount
	 * @param workVO
	 * @return
	 */
	public List<Map> selectDealCount(Map<String, String> map) throws Exception {
		return list("statsDAO.selectDealCount", map);
	}
	
	
	/**
	 *
	 * @MethodName : selectInvestAmount
	 * @param workVO
	 * @return
	 */
	public List<Map> selectInvestAmount(Map<String, String> map) throws Exception {
		return list("statsDAO.selectInvestAmount", map);
	}
	
	
	/**
	 *
	 * @MethodName : selectInvestResult
	 * @param workVO
	 * @return
	 */
	public List<Map> selectInvestResult(Map<String, String> map) throws Exception {
		return list("statsDAO.selectInvestResult", map);
	}
	
		
	/**
	 *
	 * @MethodName : selectInvestAmount
	 * @param workVO
	 * @return
	 */
	public List<Map> selectTotalInvestAmount(Map<String, String> map) throws Exception {
		return list("statsDAO.selectTotalInvestAmount", map);
	}
	
	
	/**
	 *
	 * @MethodName : selectMnaSummary
	 * @param workVO
	 * @return
	 */
	public List<Map> selectMnaSummary(Map<String, String> map) throws Exception {
		return list("statsDAO.selectMnaSummary", map);
	}
	
	/**
	 *  전체 Deal - 진행상황
	 * @MethodName : selectDealProgress
	 * @param workVO
	 * @return
	 */
	public List<Map> selectDealProgress(Map<String, String> map) throws Exception {
		return list("statsDAO.selectDealProgress", map);
	}
	
	/**
	 * 전체 Deal - 유형별
	 * @MethodName : selectDealCategory
	 * @param workVO
	 * @return
	 */
	public List<Map> selectDealCategory(Map<String, String> map) throws Exception {
		return list("statsDAO.selectDealCategory", map);
	}
	
	/**
	 * 직접 투자 건수별 - 유형분석
	 * @MethodName : selectSelfInvestCase
	 * @param workVO
	 * @return
	 */
	public List<Map> selectSelfInvestCase(Map<String, String> map) throws Exception {
		return list("statsDAO.selectSelfInvestCase", map);
	}
	
	/**
	 * 직접 투자 금액별 - 유형분석
	 * @MethodName : selectSelfInvestAmount
	 * @param workVO
	 * @return
	 */
	public List<Map> selectSelfInvestAmount(Map<String, String> map) throws Exception {
		return list("statsDAO.selectSelfInvestAmount", map);
	}
	
	
	/**
	 * 3년 동기대비 실적비교
	 * @MethodName : selectRecordCompare
	 * @param workVO
	 * @return
	 */
	public List<Map> selectRecordCompare(Map<String, String> map) throws Exception {
		return list("statsDAO.selectRecordCompare", map);
	}
	
	
	/**
	 * 중개회사 순위
	 * @MethodName : selectRecordCompare
	 * @param workVO
	 * @return
	 */
	public List<Map> selectMediCorp(Map<String, String> map) throws Exception {
		return list("statsDAO.selectMediCorp", map);
	}
	
	
	/**
	 * 중개인 순위
	 * @MethodName : selectRecordCompare
	 * @param workVO
	 * @return
	 */
	public List<Map> selectBroker(Map<String, String> map) throws Exception {
		return list("statsDAO.selectBroker", map);
	}

	
	/**
	 * 개인별 통계 팝업
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 12. 8.
	 */
	public Map selectPrivateStats(Map<String, Object> map) throws Exception {	
		return (Map)(getSqlMapClientTemplate().queryForObject("statsDAO.selectPrivateStats", map));
	}

	
	
	/**
	 * 개인 통계 팝업 딜건 상세 div
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 12. 14.
	 */
	public List<WorkVO> statsPrivateStatsDtl(Map<String, String> map) throws Exception {
		return list("statsDAO.selectPrivateStatsDtl", map);
	}

	
	
	/**
	 * Deal 유형 코드
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 12. 15.
	 */
	public List<Map> selectDealType() throws Exception {
		return list("statsDAO.selectDealType", null);
	}
	
	
}