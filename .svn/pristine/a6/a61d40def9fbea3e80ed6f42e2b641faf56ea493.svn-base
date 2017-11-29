package ib.card.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.ModelMap;

public interface CardService {
	
	
	/**
	 * 최초 데이터 년도 조회
	 * @param 
	 * @return String
	 */
	public String selectMinYear(Map<String, Object> map)throws Exception;
	/**
	 * 지출 조회
	 * @param 
	 * @return List
	 */
	public List<Map> selectCardList(Map<String, Object> map)throws Exception;
	/**
	 * 지출 참가자 조회
	 * @param 
	 * @return List
	 */
	public List<Map> selectCardUserList(Map<String, Object> map)throws Exception;
	/**
	 * 소모품 내역 조회
	 * @param 
	 * @return List
	 */
	public List<Map> selectCardMro(Map<String, Object> map)throws Exception;
	/**
	 * 지출 내역 등록
	 * @param 
	 * @return int
	 */
	public int regCardUse(Map<String, Object> map)throws Exception;
	/**
	 * 지출 내역 수정
	 * @param 
	 * @return int
	 */
	public void updateCardUse(Map<String, Object> map) throws Exception;
	/**
	 * 피드백 수정
	 * @param 
	 * @return int
	 */
	public int updateCardFeedback(CardVO cardVO) throws Exception;
	/**
	 * 지출 내역 삭제
	 * @param 
	 * @return int
	 */
	public void deleteCardUse(Map<String, Object> map) throws Exception;
	/**
	 * 지출 참가자 등록
	 * @param 
	 * @return int
	 */
	public int insertCardUsedStaffListBysabun(Map<String, Object> map) throws Exception;
	/**
	 * 지출 참가자 삭제
	 * @param 
	 * @return 
	 */
	public void deleteCardUsedStaffList(Map<String, Object> map) throws Exception;
	/**
	 * 소모품 등록
	 * @param 
	 * @return int
	 */
	public int insertCardMro(Map<String, Object> map) throws Exception;
	/**
	 * 소모품 삭제
	 * @param 
	 * @return 
	 */
	public void delectCardMro(Map<String, Object> map) throws Exception;
	/**
	 * 통계 dv
	 * @param 
	 * @return 
	 */
	public List<Map> selectDvCardStatistics(Map<String, String> map)throws Exception;
	/**
	 * 통계 dv2
	 * @param 
	 * @return 
	 */
	public List<Map> selectDv2CardStatistics(Map<String, String> map)throws Exception;
	/**
	 * 월별 통계
	 * @param 
	 * @return 
	 */
	public List<Map> selectMonthCardStatistics(Map<String, String> map)throws Exception;
	
	/* 법인카드 바로빌 연동정보 관련 */
	
	/**
	 * 법인카드 사용정보 등록
	 * @param 
	 * @return 
	 */
	public int insertCardCorpUsed(String string) throws Exception;
	
	/**
	 * 법인카드 정보 조회
	 * @param 
	 * @return 
	 */
	public List<Map> selectCardCorpInfoList() throws Exception;
	
	/**
	 * 법인 회사 정보 조회
	 * @param 
	 * @return 
	 */
	public List<Map> selectCorpInfoList() throws Exception;	
	
	/**
	 * 법인카드 사용내역 조회
	 * @param 
	 * @return 
	 */
	public Map<String, Object> selectCardCorpUsedList(Map<String, Object> map) throws Exception;
	
	/**
	 * 법인카드 사용내역 삭제
	 * @param 
	 * @return 
	 */
	public void deleteCardCorpUsed(Map<String, Object> map) throws Exception;
	
	/**
	 * 스케쥴을 조회한다.
	 * @param 
	 * @return List
	 */	
	public List<Map> selectScheList(Map<String, Object> map)throws Exception;
	
	/**
	 * 처리되지 않은 법인카드 사용내역을 조회/처리	
	 * @param 
	 * @return List
	 */	
	public void checkCardCorpUnregList() throws Exception;
	
	
	/**
	 * 지출등록 회사/고객 조회 리스트	
	 * @param 
	 * @return List
	 * @throws Exception 
	 */	
	public List<Map> selectCardUsedCustomerList(Map<String, Object> map) throws Exception;
	
	
	/**
	 * 지출등록 회사/고객 삭제	
	 * @param 
	 * @throws Exception 
	 */
	public void deleteCardUsedCustomerList(Map<String, Object> map) throws Exception;
	
}
