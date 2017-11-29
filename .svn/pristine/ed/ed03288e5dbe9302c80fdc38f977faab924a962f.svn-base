package ib.work.service;

import ib.login.service.StaffVO;
import ib.recommend.service.RecommendVO;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * package  : ib.work.service
 * filename : WorkService.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 8. 10.
 * @version : 1.0.0
 */
public interface WorkService {


	/**
	 *
	 * @MethodName : selectBusinessRecordList
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectBusinessRecordList(WorkVO vo) throws Exception;

	/**
	 *
	 * @MethodName : selectStaffList
	 * @param staffVO
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectStaffList(StaffVO staffVO) throws Exception;

	/**
	 *
	 * @MethodName : selectMemoList
	 * @param staffVO
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectMemoList(WorkVO workVO) throws Exception;

	/**
	 *
	 * @MethodName : selectBusinessRecordStaffList
	 * @param staffVO
	 * @return
	 */
	Map<String, Object> selectBusinessRecordStaffList(WorkVO VO) throws Exception;

	
	
	//정보등급별 사용자 리스트
	List<Map> getInfoLevelUser(Map<String, String> map) throws Exception;

	//정보등급 리스트
	List<String> getInfoLevelList() throws Exception;

	//투자심의 정보 리스트
	List<Map> getInvestInfo(Map<String, String> map) throws Exception;

	//투심정보 등록
	int regMyInvest(Map<String, Object> map) throws Exception;

	//통계일(투자결정 기준일) 저장
	int doSaveInvestDt(Map<String, Object> map) throws Exception;

	//회사명 수정
	int modifyCpnNm(Map<String, Object> map) throws Exception;

	//회사명 간단 조회
	List<Map> getSimpleCompanyInfo(Map<String, String> map) throws Exception;
	
	//투자사(경쟁사) 등록 20170822 ksm
	int insertInvestorCompany(Map<String, Object> map) throws Exception;
	
	//투자사(경쟁사) 담당자명 수정 20170823 ksm
	int modifyInvestorManager(Map<String, Object> map) throws Exception;
	
	//투자사(경쟁사) 삭제 20170912 ksm
	int delInvestorCompany(Map<String, Object> map) throws Exception;
	
	//모바일 딜리스트 
	List<Map> selectOfferAllDealListForMobile(WorkVO workVO) throws Exception;
	
	//mna 매칭 회사 
	List<RecommendVO> selectMnaMatchCpnList(RecommendVO vo) throws Exception;
	
	//제안서 ir 분석 딜 등록 (모바일)
	int saveDeal(WorkVO workVO, Map<String,Object>map) throws Exception;
	
	//딜 삭제
	int deleteDeal(WorkVO workVO, Map<String,Object>map) throws Exception;
	
	//딜 투자의견 수정
	int doEditDealInvest(WorkVO workVO, Map<String, Object> map) throws Exception;
	
	//모바일 추천인 
	List<WorkVO> selectRecommendOne(WorkVO workVO) throws Exception;
	
	//모바일 딜코멘트 리스트
	List<Map> selectDealCommentList(Map<String,Object>map) throws Exception;
	
	//딜 & 코멘트 메인 카운트(모바일)
	Map<String, Object> getMainDealNCommentCount(Map<String,Object>map) throws Exception;
	
	//오늘 등록된 딜
	List<Map> getTodayDeal(Map<String,Object>map) throws Exception;

	//오늘 등록된 딜코멘트
	List<Map> getTodayDealComment(Map<String,Object>map) throws Exception;
	
}