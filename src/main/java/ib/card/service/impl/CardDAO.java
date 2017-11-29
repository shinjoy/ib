/**
 * 
 */
package ib.card.service.impl;

import ib.card.service.CardVO;
import ib.cmm.service.impl.ComAbstractDAO;

import java.util.List;
import java.util.Map;









import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package  : ib.card.service.impl
 * filename : CardDAO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 11. 14.
 * @version : 1.0.0
 */

@Repository("cardDAO")
public class CardDAO extends ComAbstractDAO{

	
	
	/**
	 *
	 * @MethodName : selectCardUsedList
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CardVO> selectCardUsedList(CardVO VO) throws Exception {
		return list("cardDAO.selectCardUsedList", VO);
	}

	/**
	 *
	 * @MethodName : insertCardUsedList
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	public int insertCardUsedList(CardVO VO) throws Exception {
		return (Integer)update("cardDAO.insertCardUsedList", VO);
	}

	/**
	 *
	 * @MethodName : updateCardUsedList
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	public int updateCardUsedList(CardVO VO) throws Exception {
		return (Integer)update("cardDAO.updateCardUsedList", VO);
	}
	
	/**
	 *
	 * @MethodName : insertCardUsedStaffList
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	public int insertCardUsedStaffList(CardVO VO) throws Exception {
		return (Integer)update("cardDAO.insertCardUsedStaffList", VO);
	}
	
	/**
	 *
	 * @MethodName : deleteCardUsedStaffList
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	public int deleteCardUsedStaffList(CardVO VO) throws Exception {
		return (Integer)update("cardDAO.deleteCardUsedStaffList", VO);
	}

	/**
	 *
	 * @MethodName : selectMaxSNb
	 * @param cardVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CardVO> selectMaxSNb(CardVO VO) throws Exception{
		return list("cardDAO.selectMaxSNb", VO);
	}

	/**
	 *
	 * @MethodName : updateCardFeedback
	 * @param cardVO
	 * @return
	 */
	public int updateCardFeedback(CardVO VO) throws Exception {
		return (Integer)update("cardDAO.updateCardFeedback", VO);
	}

	/**
	 *
	 * @MethodName : deleteCardUsed
	 * @param cVO
	 * @return
	 */
	public int deleteCardUsed(CardVO VO) throws Exception {
		return (Integer)update("cardDAO.deleteCardUsed", VO);
	}
	

	
	/*===============팝업 변경으로인한 지출 변경건. jy(20160907)=============*/
	

	
	/**
	 * 년도 리스트
	 * @MethodName : selectMinYear
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String selectMinYear(Map<String,Object>map) throws Exception {
		return (String) selectByPk("card.selectMinYear", map);  // 단건조회
	}
	
	/**
	 * 지출 리스트
	 * @MethodName : selectCardList
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectCardList(Map<String,Object>map) throws Exception {
		return list("card.selectCardList", map);
	}
	
	/**
	 * 소모품 리스트
	 * @MethodName : selectCardMro
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectCardMro(Map<String,Object>map) throws Exception {
		return list("card.selectCardMro", map);
	}
	
	/**
	 * 지출 참가자 리스트
	 * @MethodName : selectCardUserList
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectCardUserList(Map<String,Object>map) throws Exception {
		return list("card.selectCardUserList", map);
	}
	
	/**
	 * 지출 등록
	 * @MethodName : insertCardUse
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int insertCardUse(Map<String,Object>map) throws Exception {
		return (Integer)insert("card.insertCardUse", map);
	}

	/**
	 * 지출 수정
	 * @MethodName : updateCardUse
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public void updateCardUse(Map<String,Object>map) throws Exception {
		update("card.updateCardUse", map);
	}

	/**
	 * 지출 삭제
	 * @MethodName : deleteCardUse
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public void deleteCardUse(Map<String,Object>map) throws Exception {
		delete("cardDAO.deleteCardUsed",map);
	}
	
	/**
	 * 지출 참가자 등록 
	 * @MethodName : insertCardUsedStaffListBysabun
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int insertCardUsedStaffListBysabun(Map<String,Object>map) throws Exception {
		return (Integer)insert("card.insertCardUsedStaffListBysabun", map);
	}

	/**
	 * 참가자 삭제
	 * @MethodName : deleteCardUsedStaffList
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public void deleteCardUsedStaffList(Map<String,Object>map) throws Exception {
		delete("cardDAO.deleteCardUsedStaffList", map);	
	}
	
	/**
	 * 소모품 등록
	 * @MethodName : insertCardMro
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int insertCardMro(Map<String,Object>map) throws Exception {
		return (Integer)insert("card.insertCardMro", map);
	}
	
	/**
	 * 소모품 삭제
	 * @MethodName : delectCardMro
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public void delectCardMro(Map<String,Object>map) throws Exception {
		delete("card.delectCardMro", map);
	}

	/**
	 * 통계 dv
	 * @MethodName : selectDvCardStatistics
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectDvCardStatistics(Map<String,String>map) throws Exception {
		return list("card.selectDvCardStatistics", map);
	}
	
	/**
	 * 통계 dv2
	 * @MethodName : selectDv2CardStatistics
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectDv2CardStatistics(Map<String,String>map) throws Exception {
		return list("card.selectDv2CardStatistics", map);
	}
	
	/**
	 * 통계 월별
	 * @MethodName : selectMonthCardStatistics
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectMonthCardStatistics(Map<String,String>map) throws Exception {
		return list("card.selectMonthCardStatistics", map);
	}
	
	/** 바로빌 법인카드 조회 서비스용 **/
	
	/**
	 * 법인카드 사용내역 조회
	 * @MethodName : selectCardCorpUsedList
	 * @param 조회 날짜, 조회 법인 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectCardCorpUsedList(Map<String,Object>map) throws Exception {
		return list("card.selectCardCorpUsedList", map);
	}
	
	/**
	 * 법인카드 사용내역 등록
	 * @MethodName : insertCardCorpUsed
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int insertCardCorpUsed(Map<String,Object>map) throws Exception {
		return (Integer)insert("card.insertCardCorpUsed", map);
	}
	
	
	/**
	 * 법인카드 정보 조회
	 * @MethodName : selectCardCorpInfoList
	 * @param  
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectCardCorpInfoList() throws Exception {
		return list("card.selectCardCorpInfoList", null);
	}
	
	
	/**
	 * 카드 승인/취소 코드 정보 조회
	 * @MethodName : selectCardCorpStatusCode
	 * @param  
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectCardCorpStatusCode() throws Exception {
		return list("card.selectCardCorpStatusCode", null);
	}
	
	
	/**
	 * 법인회사 정보 조회
	 * @MethodName : selectCorpInfoList
	 * @param  
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectCorpInfoList() throws Exception {
		return list("card.selectCorpInfoList", null);
	}
	
	
	/**
	 * 로그 정보 등록
	 * @MethodName : insertCardCorpUsed
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int insertCardCorpLog(Map<String,Object>map) throws Exception {
		return (Integer)insert("card.insertCardCorpLog", map);
	}
	
	/**
	 * 법인카드사용내역 수정
	 * @MethodName : updateCardCorpUse
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public void updateCardCorpUse(Map<String,Object>map) throws Exception {
		update("card.updateCardCorpUse", map);
	}
	
	/**
	 * 법인카드사용내역 삭제
	 * @MethodName : deleteCardCorpUsed
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public void deleteCardCorpUsed(Map<String,Object>map) throws Exception {
		update("card.deleteCardCorpUsed", map);
	}
	
	
	/**
	 * 일정 조회 (법인카드 사용내역 지출 등록)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 6. 12.
	 */
	public List<Map> selectScheList(Map<String, Object> param) throws Exception {
		return list("card.selectScheList", param);
	}
	
	/**
	 * 법인카드 미등록건 리스트 조회
	 * @MethodName : selectCardCorpUsedList
	 * @param 조회 날짜, 조회 법인 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map> getCardCorpUnregList() throws Exception {
		return list("card.getCardCorpUnregList", null);
	}
	
	/**
	 *	법인카드 지연입력건 기록
	 * @MethodName : insertCardUsedList
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public void insertCardCorpUsedStatus(Map map) throws Exception {
		insert("card.insertCardCorpUsedStatus", map);
	}
	
	/**
	 *	법인카드 지연입력건 기록
	 * @MethodName : insertCardUsedList
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public void updateCardCorpRegLateFlag(Map map) throws Exception {
		update("card.updateCardCorpRegLateFlag", map);
	}
	
	/**
	 *	법인카드 SMS 전송 내역 등록
	 * @MethodName : insertCardCorpSmsLog 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public void insertCardCorpSmsLog(Map map) throws Exception {
		insert("card.insertCardCorpSmsLog", map);
	}
	
	/*
	 * SMS 전송 내역 조회
	 */
	@SuppressWarnings("rawtypes")
	public Map getCardCorpSmsLog(String recvNumber) throws Exception {
		return (Map)selectByPk("card.getCardCorpSmsLog", recvNumber);
	}
	
	
	/*
	 * 휴가자 조회
	 */
	@SuppressWarnings("rawtypes")
	public Map getHolidayStatus(String inputDate) throws Exception {
		return (Map)selectByPk("card.getHolidayStatus", inputDate);
	}

	/*
	 * 지출등록 회사/고객 insert 
	 */
	@SuppressWarnings("rawtypes")
	public int insertCardUsedCustomer(Map<String, Object> map) {
		return (Integer)insert("card.insertCardUsedCustomer", map);
	}

	/*
	 * 지출등록 회사/고객 조회 
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> selectCardUsedCustomerList(Map<String, Object> map) {
		return list("card.selectCardUsedCustomerList", map);
	}

	/*
	 * 지출등록 회사/고객 삭제 
	 */
	public void deleteCardUsedCustomerList(Map<String, Object> map) {
		delete("cardDAO.deleteCardUsedCustomerList", map);	
	}
	
}