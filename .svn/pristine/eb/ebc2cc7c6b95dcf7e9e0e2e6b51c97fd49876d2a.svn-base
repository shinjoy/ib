/**
 * 
 */
package ib.recommend.service.impl;

import ib.recommend.service.RecommendVO;
import ib.work.service.WorkVO;
import ib.basic.service.CpnExcelVO;
import ib.cmm.service.impl.ComAbstractDAO;
import ib.personnel.service.PersonnelVO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package  : ib.recommend.service.impl
 * filename : RecommendDAO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2013. 3. 20.
 * @version : 1.0.0
 */
@Repository("recommendDAO")
public class RecommendDAO extends ComAbstractDAO{

	/**
	 *
	 * @MethodName : selectIBlist
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<RecommendVO> selectIBlist(RecommendVO  VO) throws Exception {
		return list("recommendDAO.selectIBlist", VO);
	}

	/**
	 *
	 * @MethodName : selectOpinionList
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<RecommendVO> selectOpinionList(RecommendVO  VO) throws Exception {
		return list("recommendDAO.selectOpinionList", VO);
	}

	/**
	 *
	 * @MethodName : updateResult
	 * @param rcmdVO
	 * @return
	 */
	public int updateResult(RecommendVO VO) throws Exception {
		return (Integer)update("recommendDAO.updateResult", VO);
	}

	/**
	 *
	 * @MethodName : insertRecommendOpinion
	 * @param VO
	 * @throws Exception
	 */
	public void insertRecommendOpinion(RecommendVO VO) throws Exception {
		//return (Integer)update("recommendDAO.insertRecommendOpinion", VO);
		getSqlMapClientTemplate().insert("recommendDAO.insertRecommendOpinion", VO);
	}
	/**
	 *
	 * @MethodName : updatecomment
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	public int updatecomment(RecommendVO VO) throws Exception {
		return (Integer)update("recommendDAO.updatecomment", VO);
	}

	/**
	 *
	 * @MethodName : deleteRecommendOpinion
	 * @param rcmdVO
	 * @return
	 */
	public int deleteRecommendOpinion(RecommendVO VO) throws Exception {
		return (Integer)update("recommendDAO.deleteRecommendOpinion",VO);
	}

	/**
	 *
	 * @MethodName : selectRecommendInfo
	 * @param rcmdVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<RecommendVO> selectRecommendInfo(RecommendVO VO) throws Exception {
		return list("recommendDAO.selectRecommendInfo", VO);
	}

	/**
	 *
	 * @MethodName : selectMaxOpinionSnb
	 * @param rcmdVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<RecommendVO> selectMaxOpinionSnb(RecommendVO VO) throws Exception {
		return list("recommendDAO.selectMaxOpinionSnb", VO);
	}


	/**
	 * 추천종목 >> 제안중 딜 등록
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 24.
	 */
	public int regPropDeal(Map<String, Object> map) {
		return Integer.parseInt(insert("recommend.insertPropDeal", map).toString());
	}

	
	
	/**
	 * 추천종목 상태변경
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 24.
	 */
	public int updateRcmdDealStts(Map<String, Object> map) {
		return (Integer)update("recommend.updateRcmdDealStts", map);
	}

	
	/**
	 * 추천종목 딜 정보 가져오기
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 24.
	 */
	public List<RecommendVO> selectRcmdDealInfo(RecommendVO rcmdVO) {
		
		return list("recommend.selectRcmdDealInfo", rcmdVO);
	}
	
	/**
	 * 딜 팝업 -> 분석자 지정 
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2017. 3. 31.
	 */
	public int insertAnalyUser(Map<String, Object> map) {
		return Integer.parseInt(insert("recommend.insertAnalyUser", map).toString());
	}
	
	/**
	 * 딜 팝업 -> 분석자 리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2017. 3. 31.
	 */
	public List<Map> getAnalyUserList(Map<String, Object> map) {
		
		return list("recommend.getAnalyUserList", map);
	}
	
	/**
	 * 분석자 삭제
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2017. 3. 31.
	 */
	public void deleteAnalyUser(Map<String, Object> map) {
		update("recommend.deleteAnalyUser", map);
	}
	
	//단순 의견 달기 (등록)
	public int insertDealComment(RecommendVO recommendVO) {
		
		return Integer.parseInt(insert("recommendDAO.insertRecommendOpinion", recommendVO).toString());
	}
	
	//단순 의견 달기 (수정)
	public int updateDealComment(RecommendVO recommendVO) {
		
		return update("recommendDAO.updatecomment", recommendVO);
	}
	
	
	
	
}
