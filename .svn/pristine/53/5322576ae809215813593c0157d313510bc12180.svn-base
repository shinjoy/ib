package ib.recommend.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ib.file.service.FileService;
import ib.push.service.PushService;
import ib.push.service.PushVO;
import ib.recommend.service.RecommendService;
import ib.recommend.service.RecommendVO;
import ib.work.service.impl.WorkMemoDAO;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service("recommendService")
public class RecommendServiceImpl extends AbstractServiceImpl implements RecommendService {

    @Resource(name="recommendDAO")
    private RecommendDAO recommendDAO;
    
    @Resource(name="workMemoDAO")
    private WorkMemoDAO workMemoDAO;
    
    @Resource(name = "fileService")
	private FileService fileService;
    
    @Resource(name="pushService")
    private PushService pushService;
    
    private PushVO pushVO = new PushVO();
    
    protected static final Log logger = LogFactory.getLog(RecommendServiceImpl.class);

    
    
    //추천종목 >> 제안중 딜 등록
	public int regPropDeal(Map<String, Object> map) throws Exception {

		int upCnt = 0;
		
//		String sNb = map.get("sNb").toString();
//		String comment = map.get("comment").toString();
//		String usrId = map.get("usrId").toString();
		
		//딜 제안중 등록
		int mainSnb = recommendDAO.regPropDeal(map);
		
		//파일 등록
		map.put("offerSnb", mainSnb + "");	//새로운 메모 키
		//workMemoDAO.clonePropDealFile(map);		//!!!!!!!!!!!!!!!!!!!!! 일단 주석처리... 딜상세보기 팝업에서 추천종목 정보를 모두 가져오므로 볼 수 있기 때문에 추가카피는 일단 주석
		
		//추천종목 상태 변경
		upCnt = recommendDAO.updateRcmdDealStts(map);
		
		return upCnt;
	}
	
	//분석자 지정
	public int saveAnalyUser(Map<String, Object> map) throws Exception {
		
		
		int result = recommendDAO.insertAnalyUser(map);
		
		
		
		return result;
	}
	
	//분석자로 지정된 사람리스트 
	public List<Map> getAnalyUserList(Map map) throws Exception {
		
		
		return recommendDAO.getAnalyUserList(map);
	}

	//분석자 삭제
	public void deleteAnalyUser(Map<String, Object> map) throws Exception {
		
		recommendDAO.deleteAnalyUser(map);
	}
	
	//딜 상세정보
	public List<RecommendVO> selectRecommendInfo(RecommendVO recommendVO) throws Exception {
		
		return recommendDAO.selectRecommendInfo(recommendVO);
	}
	
	//딜 의견
	public List<RecommendVO> selectOpinionList(RecommendVO recommendVO) throws Exception {
		
		return recommendDAO.selectOpinionList(recommendVO);
	}
	
	//딜 코멘트 등록 (모바일)
	public int saveDealComment(RecommendVO recommendVO, Map<String, Object> map) throws Exception {
		
			
		String paramSnb = recommendVO.getsNb();
		int sNb =0;
		//딜 코멘트 등록
		if(paramSnb.equals("")){
			
			sNb = recommendDAO.insertDealComment(recommendVO);
			
			try{
				
				String comment = recommendVO.getComment();
				if(comment.length() > 100) comment = comment.substring(0, 100);
				
				//딜 코멘트 등록	
				Map pushMap = new HashMap();
				
				pushMap.put("pushType", pushVO.ptDealComment);
				pushMap.put("pushTypeId", sNb);
				pushMap.put("usrId", recommendVO.getUserId());
				pushMap.put("content", "[신규 코멘트]"+recommendVO.getCpnNm()+"("+recommendVO.getRgNm()+":"+comment+")");
				pushMap.put("rgUserId", map.get("rgUserId").toString());
				
				if(!recommendVO.getUserId().equals("")) pushService.insertPushLogSearchSabunList(pushMap);
				
				
			}catch(Exception e){
				
			}
			
			
			
		//수정
		}else{
			
			sNb = Integer.parseInt(paramSnb);
			recommendDAO.updateDealComment(recommendVO);
		
			if(sNb !=0 && !map.get("delFileList").toString().equals("")){		//정상저장 이고 파일이 있을때
	  			 String [] arr = map.get("delFileList").toString().split(",");
	  			 map.put("offerSnb", sNb);
	  			 map.put("fileArr", arr);
	  			 fileService.fileDeleteDbAndPhy(map);						//파일 db저장 & 물리 삭제
			}
		}
		
		//파일 등록
		if(sNb !=0 && !map.get("fileList").toString().equals("")){		//정상저장 이고 파일이 있을때
			
			map.put("offerSnb",sNb);
			map.put("reportYn", "N");
			
    		fileService.insertFileListJson(map);						//파일 db저장
    		
		}	
		
		return sNb;
	}
	
	//단순 의견 달기(등록)
	public int insertDealComment(RecommendVO recommendVO) throws Exception {
		
		return recommendDAO.insertDealComment(recommendVO);
	}
	
	//단순 의견 달기(수정) 
	public int updateDealComment(RecommendVO recommendVO) throws Exception {
		
		return recommendDAO.updateDealComment(recommendVO);
	}
	
	//단순 의견(삭제)
	public void deleteDealComment(RecommendVO recommendVO) throws Exception {
		
		recommendDAO.deleteRecommendOpinion(recommendVO);
		
	}
    


//	//고객등록(기본 + 담당자 + 네트워크)
//	public int insertCustomer(PersonVO personVO) throws Exception {
//		
//		int cstId = personDAO.insertCustomer(personVO);					//1. 고객(인물) 기본등록
//		
//		
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("cstId", cstId);
//		map.put("usrCusId", personVO.getUsrCusId());	//담당자 cusId
//		map.put("memo", personVO.getRelMemo());			//관계메모
//		map.put("userSeq", personVO.getStaffSnb());
//		personDAO.doSaveCstManagerDirect(map);							//2. 담당자 등록
//		
//		
//		personVO.setsNb1st(personVO.getUsrCusId());		//담당자 cusId
//		personVO.setsNb2nd(""+cstId);					//고객 cusId
//		personVO.setNote(personVO.getRelMemo());
//		personDAO.insertNetworkCst(personVO);							//3. 네트워크 등록
//		
//		return 1;
//	}
//
//	
//	//고객등록(기본 + 담당자 + 네트워크) ... by Map
//	public Map regCustomer(Map<String, Object> map) throws Exception {
//		
//		int cstId = personDAO.regCustomer(map);							//1. 고객(인물) 기본등록
//		
//		
//		//Map<String,Object> map = new HashMap<String,Object>();
//		map.put("cstId", cstId);
//		//map.put("usrCusId", personVO.getUsrCusId());	//담당자 cusId
//		map.put("memo", map.get("relMemo"));			//관계메모
//		map.put("userSeq", map.get("staffSnb"));
//		personDAO.doSaveCstManagerDirect(map);							//2. 담당자 등록
//		
//		
//		map.put("sNb1st", map.get("usrCusId"));		//담당자 cusId
//		map.put("sNb2nd", cstId);					//고객 cusId
//		map.put("note",map.get("relMemo"));
//		personDAO.regNetworkCst(map);									//3. 네트워크 등록
//		
//		
//		Map obj = personDAO.getCustomer(cstId);
//		
//		return obj;
//	}
//
//
//
//	public Map getCustomerByName(Map<String, Object> map) throws Exception {
//		
//		return personDAO.getCustomerByName(map);
//	}
//
//
//	//고객 구분 변경
//	public int doSaveCstType(Map<String, Object> map) throws Exception {
//		
//		return personDAO.doSaveCstType(map);
//	}
//
//
//	//고객삭제
//	public int doDelCst(Map<String, Object> map) throws Exception {
//
//		return personDAO.doDelCst(map);
//	}
//

	
}
