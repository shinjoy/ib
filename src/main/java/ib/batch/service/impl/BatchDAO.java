package ib.batch.service.impl;

import ib.cmm.service.impl.ComAbstractDAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package	: ib.batch.service.impl 
 * filename	: BatchDAO.java
 * </pre>
 * 
 * 
 * 
 * @author	: oys
 * @date	: 2016. 8. 18.
 * @version : 
 *
 */
@Repository("batchDAO")
public class BatchDAO extends ComAbstractDAO{
	
	
	/**
	 * 등용문 회사정보 일배치
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 8. 18.
	 */
	public List<Map> getCompanyList(Map<String, Object> map) throws Exception{
		return list("batch.selectCompanyListForReport", map);
	}

	
	/**
	 * 등용문 인물(직원)정보 일배치
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 8. 23.
	 */
	public List<Map> getCustomerList(Map<String, Object> map) throws Exception{
		return list("batch.selectCustomerListForReport", map);
	}

	
	/**
	 * 등용문 주가정보
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 8. 24.
	 */
	public List<Map> getStockPriceList(Map<String, Object> map) throws Exception{
		return list("batch.selectPriceListForReport", map);
	}

	
	/**
	 * 등용문 기업탐방정보
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 8. 24.
	 */
	public List<Map> getCpnVisitList(Map<String, Object> map) throws Exception{
		return list("batch.selectVisitListForReport", map);
	}


	/**
	 * 리포트 IF 테이블 저장 
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 21.
	 */
	public int insertReportIf(Map<String, Object> map) throws Exception{
		
		return (Integer) insert("batch.insertReportIf", map);
	}
	

	/**
	 * 파일 IF 테이블 저장 
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 21.
	 */
	public int insertFileIf(Map<String, Object> map) throws Exception{
		
		return (Integer) insert("batch.insertFileIf", map);
	}
	
	
	/**
	 * 파트너 회원정보
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 12. 21.
	 */
	public List<Map> getPartnerList(Map<String, Object> map) throws Exception{
		return list("batch.selectPartnerListForReport", map);
	}
	
	
	/**
	 * offer 에 저장
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 21.
	 */
	public int insertIbOffer(Map<String, Object> map) throws Exception{
		
		return (Integer) insert("batch.insertIbOffer", map);
	}
	
	/**
	 * offer 에 update
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 21.
	 */
	public void updateIbOffer(Map<String, Object> map) throws Exception{
		
		update("batch.updateIbOffer", map);
	}
	
	/**
	 * offer info 에저장
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 21.
	 */
	public int insertIbOfferInfo(Map<String, Object> map) throws Exception{
		
		return (Integer) insert("batch.insertIbOfferInfo", map);
	}
	
	/**
	 * offer info 에 update
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 21.
	 */
	public void updateIbOfferInfo(Map<String, Object> map) throws Exception{
		
		update("batch.updateIbOfferInfo", map);
	}
	
	/**
	 * file_info 저장
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 21.
	 */
	public int insertIbFileInfo(Map<String, Object> map) throws Exception{
		
		return (Integer)insert("batch.insertIbFileInfo", map);
	}
	
	/**
	 * 등용문 IF 테이블에 offerId 기록  
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 21.
	 */
	public void updateReportIf(Map<String, Object> map) throws Exception{
		
		update("batch.updateReportIf", map);
	}
	
	/**
	 * 가장 최근 IF 테이블에 기록된 정보
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 21.
	 */
	public Map getBeforeIfInfo(Map<String, Object> map) throws Exception{
		
		return (Map)selectByPk("batch.getBeforeIfInfo", map);
	}
	
	/**
	 * File Info 삭제
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 21.
	 */
	public void deleteIbFileInfo(int offerSnb) throws Exception{
		
		delete("batch.deleteIbFileInfo", offerSnb);
	}
	
	/**
	 * ib_offer 삭제
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 21.
	 */
	public void deleteIbOffer(Map<String, Object> map) throws Exception{
		
		delete("batch.deleteIbOffer", map);
	}
	
	/**
	 * ib_offer_Info 삭제
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 21.
	 */
	public void deleteIbOfferInfo(Map<String, Object> map) throws Exception{
		
		delete("batch.deleteIbOfferInfo", map);
	}
	
	/**
	 * ib_offer 등록전 판별
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 21.
	 */
	public int chkIbOffer(Map<String, Object> map) throws Exception{
		
		return Integer.parseInt(selectByPk("batch.chkIbOffer", map).toString());
	}
	
	/**
	 * ib_offer_info 등록전 판별
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 12. 21.
	 */
	public int chkIbOfferInfo(Map<String, Object> map) throws Exception{
		
		return Integer.parseInt(selectByPk("batch.chkIbOfferInfo", map).toString());
	}


	
	
	
}
