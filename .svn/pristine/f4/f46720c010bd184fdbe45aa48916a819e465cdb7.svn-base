/**
 * 
 */
package ib.notice.service.impl;

import ib.cmm.service.impl.ComAbstractDAO;
import ib.notice.service.NoticeShVO;
import ib.notice.service.NoticeVO;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package  : ib.notice.service.impl
 * filename : NoticeDAO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2014. 4. 23.
 * @version : 1.0.0
 */
@Repository("noticeDAO")
public class NoticeDAO extends ComAbstractDAO{
	
	public int deleteCarUsedList(NoticeVO VO) throws Exception {
		return (Integer)update("noticeDAO.deleteCarUsedList", VO);
	}

	/**
	 *
	 * @MethodName : insertNotice
	 * @param vo
	 * @return
	 */
	public int insertNotice(NoticeVO vo) throws Exception {
		return (Integer)update("noticeDAO.insertNotice", vo);
	}
	
	/**
	 *
	 * @MethodName : insertNoticeSh
	 * @param vo
	 * @return
	 */
	public int insertNoticeSh(Map<String,String> param) throws Exception {
		return (Integer)update("noticeDAO.insertNoticeSh", param);
	}
	
	
	/**
	 *
	 * @MethodName : insertNoticeSh
	 * @param vo
	 * @return
	 */
	public int modifyNoticeSh(Map<String,String> param) throws Exception {
		return (Integer)update("noticeDAO.modifyNoticeSh", param); 
	}
	
	
	/**
	 *
	 * @MethodName : selectNoticeMezzaineList
	 * @param vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<NoticeVO> selectNoticeMezzaineList(NoticeVO vo) throws Exception {
		return list("noticeDAO.selectNoticeMezzaineList", vo);
	}

	/**
	 * 공시증자
	 *
	 * @MethodName : selectNoticeIncCapList
	 * @param vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<NoticeVO> selectNoticeIncCapList(NoticeVO vo) throws Exception {
		return list("noticeDAO.selectNoticeIncCapList", vo);
	}

	
	/**
	 *
	 * @MethodName : selectNoticeIncCapList
	 * @param vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<NoticeShVO> selectNoticeShList(NoticeVO vo) throws Exception {
		return list("noticeDAO.selectNoticeShList", vo);
	}

	
	/**
	 *
	 * @MethodName : selectNoticeIncCapList
	 * @param vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public NoticeShVO selectNoticeSh(Map<String,String> param) throws Exception {
		return (NoticeShVO) selectByPk("noticeDAO.selectNoticeSh", param);
	}

	
	/**
	 *
	 * @MethodName : modifyPublicNoticeIncCap
	 * @param vo
	 * @return
	 */
	public int modifyPublicNoticeIncCap(NoticeVO vo) throws Exception {
		return (Integer)update("noticeDAO.modifyPublicNoticeIncCap", vo);
	}

	/**
	 *
	 * @MethodName : modifyPublicNoticeMezzaine
	 * @param vo
	 * @return
	 */
	public int modifyPublicNoticeMezzanine(NoticeVO vo) throws Exception {
		return (Integer)update("noticeDAO.modifyPublicNoticeMezzanine", vo);
	}

	/**
	 *
	 * @MethodName : selectNoticeMezzaine
	 * @param workVO
	 * @return
	 */
	public Object selectNoticeMezzaine(Object vo) throws Exception {
		return list("noticeDAO.selectNoticeMezzaine", vo);
	}

	/**
	 * 
	 * @MethodName : deletePublicNoticeMezzanine
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 2. 27.
	 */
	public int deletePublicNotice(NoticeVO vo) throws Exception {
		return (Integer)update("noticeDAO.deletePublicNotice", vo);
	}

	/**
	 * 
	 * @MethodName : selectNoticeMezzaineCategoryList
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 6. 5.
	 */
	@SuppressWarnings("unchecked")
	public List<NoticeVO> selectNoticeMezzaineCategoryList(NoticeVO vo) throws Exception {
		return list("noticeDAO.selectNoticeMezzaineCategoryList", vo);
	}

	/**
	 * 
	 * @MethodName : selectEventNoticeList
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 6. 11.
	 */
	@SuppressWarnings("unchecked")
	public List<NoticeVO> selectEventNoticeList(NoticeVO vo) throws Exception {
		return list("noticeDAO.selectEventNoticeList", vo);
	}

	/**
	 * 
	 * @MethodName : insertEventPublicNotice
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 6. 11.
	 */
	public int insertEventPublicNotice(NoticeVO vo) throws Exception {
		return (Integer)update("noticeDAO.insertEventPublicNotice", vo);
	}

	/**
	 * 
	 * @MethodName : modifyEventPublicNoticee
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 6. 11.
	 */
	public int modifyEventPublicNotice(NoticeVO vo) throws Exception {
		return (Integer)update("noticeDAO.modifyEventPublicNotice", vo);
	}

	/**
	 * 
	 * @MethodName : deleteEventPublicNotice
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 6. 11.
	 */
	public int deleteEventPublicNotice(NoticeVO vo) throws Exception {
		return (Integer)update("noticeDAO.deleteEventPublicNotice", vo);
	}
	
	//selectkey를 받기 위한 공시-메자닌 등록 20170809 ksm
	public int insertPublicNoticeMezzanine(NoticeVO vo) throws Exception {
		return (Integer)insert("noticeDAO.insertPublicNoticeMezzanine", vo);
	}
	
	//인수자, 인수자당 투자 금액 등록 20170804 ksm 
	public int insertNoticeReceiver(Map<String, Object> map) throws Exception{
		return (Integer)update("noticeDAO.insertNoticeReceiver", map);
	}

	//인수자, 인수자당 투자 금액 리스트 20170808 ksm
	@SuppressWarnings("unchecked")
	public List<Map> selectNoticeReceiverList(Map<String, Object> map) {
		return list("noticeDAO.selectNoticeReceiverList", map);
	}

	//인수자, 인수자당 투자 금액 삭제 20170808 ksm
	public int deleteNoticeReceiver(NoticeVO vo) throws Exception{
		return (Integer)update("noticeDAO.deleteNoticeReceiver", vo);
	}

	//메자닌발행현황 리스트(금액기준) 2017814 ksm
	public List<Map> selectMezzaninePriceList(Map<String, Object> map) throws Exception{
		return list("noticeDAO.selectMezzaninePriceList", map);
	}
	
	//메자닌발행현황 리스트(발행건수 기준) 2017814 ksm
	public List<Map> selectMezzanineCountList(Map<String, Object> map) throws Exception{
		return list("noticeDAO.selectMezzanineCountList", map);
	}

	//경쟁사현황 리스트 20170816 ksm
	public List<Map> selectInvestorList(Map<String, Object> map) throws Exception{
		return list("noticeDAO.selectInvestorList", map);
	}
	
	//공시(증자) 입력 20170905 ksm
	public int insertPublicNoticeInCap(NoticeVO vo) throws Exception{
		return (Integer)update("noticeDAO.insertNotice", vo);
	}

	//공시 메자닌 팝업 20170915 ksm 
	public Map getNoticeMezzanineInfo(Map<String, String> map) {
		return (Map) selectByPk("noticeDAO.getNoticeMezzanineInfo", map);
	}
}