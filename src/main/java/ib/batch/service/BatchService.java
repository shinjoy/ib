package ib.batch.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * package	: ib.batch.service 
 * filename	: BatchService.java
 * </pre>
 * 
 * 
 * 
 * @author	: oys
 * @date	: 2016. 8. 18.
 * @version : 
 *
 */
public interface BatchService {

	//등용문 회사정보 일배치
	List<Map> getCompanyList(Map<String, Object> map) throws Exception;

	//등용문 인물(직원)정보 일배치
	List<Map> getCustomerList(Map<String, Object> map) throws Exception;

	//등용문 주가정보
	List<Map> getStockPriceList(Map<String, Object> map) throws Exception;

	//등용문 기업탐방정보
	List<Map> getCpnVisitList(Map<String, Object> map) throws Exception;
	
	//파트너 회원정보
	List<Map> getPartnerList(Map<String, Object> map) throws Exception;
	
	//등용문 데이터 IF 테이블 저장 
	int insertReportIf(Map<String, Object> map) throws Exception;
	
	//등용문 파일 IF 테이블 저장 
	List<Map> insertFileIf(String fileList) throws Exception;
	
	//등용문 IB 저장
	int saveIb(Map<String, Object> map,List<Map> newFileList) throws Exception;
	
	//등용문 인터페이스 테이블에 offerId 기록
	void updateReportIf(Map<String, Object> map) throws Exception;
	
	//가장 최근 데이터 내용 가져오기
	Map getBeforeIfInfo(Map<String, Object> map) throws Exception;
	
	void deleteIb(Map<String, Object> map) throws Exception;
	
	
}
