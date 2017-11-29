package ib.recommend.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * package	: ib.recommend.service 
 * filename	: RecommendService.java
 * </pre>
 * 
 * 
 * 
 * @author	: oys
 * @date	: 2016. 5. 24.
 * @version : 
 *
 */
public interface RecommendService {

	//추천종목 >> 딜제안중 등록
	int regPropDeal(Map<String, Object> map) throws Exception;

	//분석자 지정 
	int saveAnalyUser(Map<String, Object> map) throws Exception;
	
	//분석자로 지정된 직원 리스트 
	List<Map> getAnalyUserList(Map map) throws Exception;
	
	//분석자 삭제 
	void deleteAnalyUser(Map<String, Object> map) throws Exception;
	
	//딜 상세 정보
	List<RecommendVO> selectRecommendInfo(RecommendVO recommendVO) throws Exception;
	
	//딜 의견
	List<RecommendVO> selectOpinionList(RecommendVO recommendVO) throws Exception;
	
	//딜 코멘트(단순의견)
	int saveDealComment(RecommendVO recommendVO,Map<String, Object> map) throws Exception;
		
	//딜 코멘트(단순의견) 등록
	int insertDealComment(RecommendVO recommendVO) throws Exception;
	
	//딜 코멘트(단순의견) 수정 
	int updateDealComment(RecommendVO recommendVO) throws Exception;
	
	//딜 코멘트 삭제
	void deleteDealComment(RecommendVO recommendVO) throws Exception;
	
//	//회사별 부서 리스트
//	List<Map> getCpnDeptList(Map map) throws Exception;
//
//	//고객리스트
//	List<Map> getCustList(Map<String, String> map) throws Exception;
//	//Map<String, Object> getCustList(Map<String, Object> map) throws Exception;
//
//	//신규할당 고객
//	List<Map> getCustListNewInCharge(Map<String, String> map) throws Exception;
//
//	//할당고객 수락
//	int doAcceptCstManager(Map<String, Object> map) throws Exception;
//
//	//고객등록(기본 + 네트워크)
//	int insertCustomer(PersonVO personVO) throws Exception;
//
//	//고객등록(기본 + 네트워크) ... by Map
//	//int regCustomer(Map<String, Object> map) throws Exception;
//	Map regCustomer(Map<String, Object> map) throws Exception;
//
//	//고객찾기(이름으로)
//	Map getCustomerByName(Map<String, Object> map) throws Exception;
//
//	//고객구분 변경
//	int doSaveCstType(Map<String, Object> map) throws Exception;
//
//	//고객 삭제
//	int doDelCst(Map<String, Object> map) throws Exception;

	
}
