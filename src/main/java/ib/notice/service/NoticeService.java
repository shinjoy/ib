package ib.notice.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * package	: 
 * filename	: 
 * </pre>
 * 
 * 
 * 
 * @author	: ksm
 * @date	: 2017. 08. 07.
 * @version : 
 *
 */
public interface NoticeService {

	@SuppressWarnings("rawtypes")
	public List selectNoticeMezzaineList(NoticeVO vo) throws Exception;	

	@SuppressWarnings("rawtypes")
	public List selectNoticeMezzaineCategoryList(NoticeVO vo) throws Exception;
	
	public Object selectNoticeMezzaine(NoticeVO vo) throws Exception;
	
	public int insertNotice(NoticeVO vo) throws Exception;
	
	public int insertPublicNoticeMezzanine(NoticeVO vo, Map<String, Object> map) throws Exception;

	public int modifyPublicNoticeMezzanine(NoticeVO vo, Map<String, Object> map) throws Exception;
	
	public int deletePublicNoticeMezzanine(NoticeVO vo) throws Exception;

	@SuppressWarnings("rawtypes")
	public List<Map> selectMezzaninePriceList(Map<String, Object> map) throws Exception;

	@SuppressWarnings("rawtypes")
	public List<Map> selectMezzanineCountList(Map<String, Object> map) throws Exception;

	@SuppressWarnings("rawtypes")
	public List<Map> selectInvestorList(Map<String, Object> map) throws Exception;

	public int insertPublicNoticeInCap(NoticeVO vo) throws Exception;

	public int modifyPublicNoticeIncCap(NoticeVO vo) throws Exception;
	
	public int deletePublicNoticeIncCap(NoticeVO vo) throws Exception;

	public List<NoticeVO> selectNoticeIncCapList(NoticeVO vo) throws Exception;

	public Map getNoticeMezzanineInfo(Map<String, String> map) throws Exception;


}
