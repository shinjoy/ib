package ib.notice.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ib.notice.service.NoticeService;
import ib.notice.service.NoticeVO;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service("noticeService")
public class NoticeServiceImpl extends AbstractServiceImpl implements NoticeService {

	@Resource(name = "noticeDAO")
    private NoticeDAO noticeDAO;
    
    protected static final Log logger = LogFactory.getLog(NoticeServiceImpl.class);

    @SuppressWarnings("rawtypes")
    public List selectNoticeMezzaineList(NoticeVO vo) throws Exception {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
		
		List<NoticeVO> result = noticeDAO.selectNoticeMezzaineList(vo); 
		
		for(int i=0; i<result.size(); i++){
			//인수자 리스트를 가져와서 result 각 row 에 추가해준다.
			param.put("noticeId", result.get(i).getsNb());
			List<Map> receiverList = noticeDAO.selectNoticeReceiverList(param);
			result.get(i).setReceiverList(receiverList);
		}
    	
    	return result;
    }
	
    public Object selectNoticeMezzaine(NoticeVO vo) throws Exception {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	
    	List<NoticeVO> result = (List<NoticeVO>) noticeDAO.selectNoticeMezzaine(vo);
    	
    	for(int i=0; i<result.size(); i++){
    		//인수자 리스트를 가져와서 result 각 row 추가
    		param.put("noticeId", result.get(i).getsNb());
    		List<Map> receiverList = noticeDAO.selectNoticeReceiverList(param);
    		result.get(i).setReceiverList(receiverList);
    	}
    	
    	return result;
    }
    
    @SuppressWarnings("rawtypes")
    public List selectNoticeMezzaineCategoryList(NoticeVO vo) throws Exception {
    	return noticeDAO.selectNoticeMezzaineCategoryList(vo);
    }
    
    
    public int insertNotice(NoticeVO vo) throws Exception {
    	int cnt = 0;
    	
		cnt = noticeDAO.insertNotice(vo);
		return cnt;
	}
    
    public int insertPublicNoticeMezzanine(NoticeVO vo, Map<String, Object> map) throws Exception {
    	int cnt = 0;
    	int rcCnt = 0;
    	
		cnt = noticeDAO.insertPublicNoticeMezzanine(vo);
		if(!"".equals(map.get("idListStr").toString()) && 
				!"".equals(map.get("priceListStr").toString())){
			
			String idList = map.get("idListStr").toString();
			String[] cpnIdList = idList.toString().split("::");
			String priceList = map.get("priceListStr").toString();
			String[] investorPriceList = priceList.split("::");
			
			for(int i=0; i<cpnIdList.length;i++){
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("noticeId", cnt);
				param.put("cpnId", cpnIdList[i]);
				param.put("price", investorPriceList[i]);
				param.put("rgId", vo.getRgId());
				rcCnt = noticeDAO.insertNoticeReceiver(param);					
			}
		}
		
		return 1;
	}

	public int modifyPublicNoticeMezzanine(NoticeVO vo, Map<String, Object> map) throws Exception {
		int cnt = noticeDAO.modifyPublicNoticeMezzanine(vo);
		int rcCnt = 0;
		rcCnt = noticeDAO.deleteNoticeReceiver(vo);						//기존 데이터 삭제 		
		if(!"".equals(map.get("idListStr").toString()) && 
				!"".equals(map.get("priceListStr").toString())){
			
			String idList = map.get("idListStr").toString();
			String[] cpnIdList = idList.toString().split("::");
			String priceList = map.get("priceListStr").toString();
			String[] investorPriceList = priceList.split("::");
			
			for(int i=0; i<cpnIdList.length;i++){
				Map<String, Object> param = new HashMap<String, Object>();
				//param.put("noticeId", cnt);
				param.put("noticeId", vo.getsNb());
				param.put("cpnId", cpnIdList[i]);
				param.put("price", investorPriceList[i]);
				param.put("rgId", vo.getRgId());
				rcCnt = noticeDAO.insertNoticeReceiver(param);				//재등록					
			}
		}
		return cnt;
	}

	public int deletePublicNoticeMezzanine(NoticeVO vo) throws Exception {
		int cnt = 0;
		int rcCnt = 0;
		
		rcCnt = noticeDAO.deleteNoticeReceiver(vo);	
		cnt = noticeDAO.deletePublicNotice(vo);
		
		return cnt;
	}

	@SuppressWarnings("rawtypes")
	public List<Map> selectMezzaninePriceList(Map<String, Object> map) throws Exception {
		return noticeDAO.selectMezzaninePriceList(map);
	}    
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectMezzanineCountList(Map<String, Object> map) throws Exception {
		return noticeDAO.selectMezzanineCountList(map);
	}

	@SuppressWarnings("rawtypes")
	public List<Map> selectInvestorList(Map<String, Object> map) throws Exception {
		return noticeDAO.selectInvestorList(map);
	}
	
	public int insertPublicNoticeInCap(NoticeVO vo) throws Exception {
		return noticeDAO.insertNotice(vo);
	}

	public int modifyPublicNoticeIncCap(NoticeVO vo) throws Exception {
		return noticeDAO.modifyPublicNoticeIncCap(vo);
	}
	
	public int deletePublicNoticeIncCap(NoticeVO vo) throws Exception {
		return noticeDAO.deletePublicNotice(vo);
	}

	public List<NoticeVO> selectNoticeIncCapList(NoticeVO vo) throws Exception {
		return noticeDAO.selectNoticeIncCapList(vo);
	}

	public Map getNoticeMezzanineInfo(Map<String, String> map) throws Exception {
		
		Map<String, Object> param = new HashMap<String, Object>();
		Map result = noticeDAO.getNoticeMezzanineInfo(map);
		
		param.put("noticeId", result.get("sNb"));
		List<Map> receiverList = noticeDAO.selectNoticeReceiverList(param);
		result.put("receiverList", receiverList);
		
		return result;
	}


}
