package ib.work.service.impl;

import ib.cmm.FileUpDbVO;
import ib.file.service.FileService;
import ib.login.service.StaffVO;
import ib.network.service.impl.NetworkDAO;
import ib.person.service.PersonVO;
import ib.person.service.impl.PersonDAO;
import ib.push.service.PushService;
import ib.push.service.PushVO;
import ib.recommend.service.RecommendService;
import ib.recommend.service.RecommendVO;
import ib.recommend.service.impl.RecommendDAO;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

/**
 * <pre>
 * package  : ib.work.service.impl
 * filename : WorkServiceImpl.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 8. 10.
 * @version : 1.0.0
 */
@Service("workService")
public class WorkServiceImpl extends AbstractServiceImpl implements WorkService{

	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name="workDAO")
    private WorkDAO workDAO;
	
	@Resource(name = "fileService")
	private FileService fileService;
	
	@Resource(name="networkDAO")
    private NetworkDAO networkDAO;
	
	@Resource(name="personDAO")
    private PersonDAO personDAO;
    
    @Resource(name="recommendDAO")
    private RecommendDAO recommendDAO;
    
    @Resource(name="pushService")
    private PushService pushService;
    
    private PushVO pushVO = new PushVO();
    
	
	/* (non-Javadoc)
	 * @see ib.work.service.WorkService#selectStaffList(ib.login.service.StaffVO)
	 */
	public Map<String, Object> selectStaffList(StaffVO staffVO) throws Exception {
		
		List<WorkVO> result = workDAO.selectStaffList(staffVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("resultList", result);

        return map;
	}
	public Map<String, Object> selectBusinessRecordStaffList(WorkVO VO) throws Exception {
		
		List<WorkVO> result = workDAO.selectBusinessRecordStaffList(VO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		
		return map;
	}
	
	/* (non-Javadoc)
	 * @see ib.work.service.WorkService#selectBusinessRecordList(ib.work.service.WorkVO)
	 */
	public Map<String, Object> selectBusinessRecordList(WorkVO vo) throws Exception {
		
//		WorkVO result = workDAO.selectBusinessRecordResult(vo);
		
		List<WorkVO> result = workDAO.selectBusinessRecordList(vo);
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("resultList", result);

        return map;
	}
	
	/* (non-Javadoc)
	 * @see ib.work.service.WorkService#selectMemoList(ib.work.service.WorkVO)
	 */
	public Map<String, Object> selectMemoList(WorkVO workVO) throws Exception {
		
		List<WorkVO> result = workDAO.selectMemoList(workVO);
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("resultList", result);
		
		return map;
	}
	
	
	//정보등급별 사용자 리스트
	public List<Map> getInfoLevelUser(Map<String, String> map) throws Exception {

		if("m".equals(map.get("infoType").toString())){
			return workDAO.getMnaLevelUser(map);
		}else{
			return workDAO.getInfoLevelUser(map);
		}
	}
	
	//정보등급 리스트
	public List<String> getInfoLevelList() throws Exception {
		
		return workDAO.getInfoLevelList();
	}
	
	//투자심의 정보 리스트
	public List<Map> getInvestInfo(Map<String, String> map) throws Exception {
		return workDAO.getInvestInfo(map);
	}
	
	//투심정보 저장
	public int regMyInvest(Map<String, Object> map) throws Exception {		
		return workDAO.regMyInvest(map);
	}
	
	
	//통계일(투자결정기준일) 저장
	public int doSaveInvestDt(Map<String, Object> map) throws Exception {
		return workDAO.doSaveInvestDt(map);
	}
	
	
	//회사명 수정
	public int modifyCpnNm(Map<String, Object> map) throws Exception {
		return workDAO.modifyCpnNm(map);
	}
	
	//회사명 간단 조회
	public List<Map> getSimpleCompanyInfo(Map<String, String> map) throws Exception {
		return workDAO.getSimpleCompanyInfo(map);
	}
	
	//투자사(경쟁사) 등록 20170822 ksm
	public int insertInvestorCompany(Map<String, Object> map) throws Exception {
		int chkCnt = workDAO.selectInvestorCompany(map);
		int cnt = 0;
		if(chkCnt < 1){	
			workDAO.insertInvestorCompany(map);
			cnt = 1;
		}else{
			cnt = 2;
		}
		return cnt;
	}

	//투자사(경쟁사) 담당자명 수정 20170823 ksm
	public int modifyInvestorManager(Map<String, Object> map) throws Exception {
		int cnt = workDAO.selectInvestorManager(map);
		
		if(cnt > 0){			
			workDAO.modifyInvestorManager(map);
		}else{
			workDAO.insertInvestorManager(map);
		}
		return 1;
	}
	
	//투자사(경쟁사) 삭제 20170912 ksm
	public int delInvestorCompany(Map<String, Object> map) throws Exception {
		return workDAO.delInvestorCompany(map);
	}		
	
	//모바일 딜리스트 
	public List<Map> selectOfferAllDealListForMobile(WorkVO workVO) throws Exception {
		
		return workDAO.selectOfferAllDealListForMobile(workVO);
	}
	
	//mna 매칭 회사 
	public List<RecommendVO> selectMnaMatchCpnList(RecommendVO recommendVO) throws Exception {
		
		return workDAO.selectMnaMatchCpnList(recommendVO);
	}
	
	//제안서 ir 분석 딜 등록 (모바일)
	public int saveDeal(WorkVO workVO, Map<String,Object>map) throws Exception {
		
		String sNb = workVO.getsNb();
		String orgSnb = sNb;
		String orgCategoryCd = workVO.getCategoryCd();
		
		//등록
		if(sNb.equals("") || sNb.equals("0")){
			
			sNb = Integer.toString(workDAO.insertDealReturnSnb(workVO));
			
			//----- 딜 제안중(직접발굴) 입력건에 대해서 추천인(추천종목) 이 있을때, 해당 추천종목(IB_OFFER 에 존재) 의 상태를 '00003' 제안중(구, 성사) 로 업데이트 :S -------
			if(!"0".equals(workVO.getRcmdSnb())){
				//workDAO.updateRcmdStts(workVO);
				Map paramMap = new HashMap();
				paramMap.put("sNb", workVO.getRcmdSnb());
				paramMap.put("usrId", workVO.getRgId());
				recommendDAO.updateRcmdDealStts(paramMap);		//추천종목 상태 변경
			}
			//----- 딜 제안중(직접발굴) 입력건에 대해서 추천인(추천종목) 이 있을때, 해당 추천종목(IB_OFFER 에 존재) 의 상태를 '00003' 제안중(구, 성사) 로 업데이트 :E -------	
			
			// 인물네트워크 자동등록
			String cstId = workVO.getCstId();
			if(!"".equals(cstId) && cstId != null && !"0".equals(cstId)){
				int offerCd = 0;
				if(Integer.parseInt(workVO.getMiddleOfferCd())>10){
					offerCd = Integer.parseInt(workVO.getMiddleOfferCd());
				}else{
					offerCd = Integer.parseInt(workVO.getOfferCd());
				}
				
				//네트워크 DB에서 직원id와 cstId로 이전 입력 있는지 확인
				int cnt1 = networkDAO.selectNetworkCnt(workVO);
				if(cnt1==0) {
					//직원의 cstId query
					StaffVO svo = new StaffVO();
					svo.setUsrId(workVO.getRgId());
					List <StaffVO> rtnStaff = personDAO.selectStaff(svo);

					String offerNm = null;
					StringBuffer sb = new StringBuffer();
					PersonVO pvo = new PersonVO();
					pvo.setsNb1st(rtnStaff.get(0).getCstId());
					pvo.setsNb2nd(cstId);
					pvo.setRgId(workVO.getRgId());

					if(1 == offerCd) offerNm="미팅";
					else if(7 == offerCd) offerNm="받은제안";
					else if(8 == offerCd) offerNm="저녁미팅";
					else if(9 == offerCd) offerNm="전화통화";
					else if(11 == offerCd) offerNm="일임계약";
					else if(12 == offerCd) offerNm="재매각";
					
					switch(offerCd){
					case 1:case 7:case 8:case 9:case 11:case 12:
						//인물네트워크 추가
						sb.append(workVO.getTmDt()).append(" : ").append(offerNm);
						pvo.setNote(sb.toString());
						cnt1 = personDAO.insertNetworkCst(pvo);
						break;
					default: break;
					}
				}
			}
			
		//수정	
		}else{
			
			workDAO.updateDeal(workVO);
		
		}
		
		//분석 & 딜 등록일때 offer info 등록
		if((workVO.getOfferCd()).equals("00004") 
				|| (workVO.getOfferCd()).equals("00006") || (workVO.getOfferCd()).equals("00007") || (workVO.getOfferCd()).equals("00000")){		
			
			//분석의견 등록(ib_offer_info)
			if((workVO.getOfferCd()).equals("00004"))  workVO.setCategoryCd("00008");	//분석일때
			else  workVO.setCategoryCd("");
			
			//신규등록
			if(orgSnb.equals("") || orgSnb.equals("0")){
				workVO.setOfferSnb(sNb);
				workDAO.insertOfferInfo(workVO);
				
			}else workDAO.updateOfferInfo(workVO);
			
		}
		
		
		//파일 등록
		if(!sNb.equals("") && !sNb.equals("0")  && !map.get("fileList").toString().equals("")){		//정상저장 이고 파일이 있을때
			
			map.put("offerSnb",sNb);
			map.put("reportYn", "N");
			
    		fileService.insertFileListJson(map);				//파일 db저장
    		
		}
		
		//파일삭제
		if(!sNb.equals("") && !sNb.equals("0") && !map.get("delFileList").toString().equals("")){		//정상저장 이고 파일이 있을때
 			 String [] arr = map.get("delFileList").toString().split(",");
 			 map.put("offerSnb", sNb);
 			 map.put("fileArr", arr);
 			 fileService.fileDeleteDbAndPhy(map);				//파일 db저장 & 물리 삭제
		}
		
		//----------------푸쉬 추가 로직 
		System.out.println(orgSnb);
		try{
			//딜 등록일때만
			if((orgSnb.equals("0") || orgSnb.equals(""))
					&&((workVO.getOfferCd()).equals("00006") || (workVO.getOfferCd()).equals("00007") || (workVO.getOfferCd()).equals("00000"))){
				
				
				
				Map pushMap = new HashMap();
				
				pushMap.put("pushType", pushVO.ptDeal);
				pushMap.put("pushTypeId", sNb);
				pushMap.put("content", "[신규 딜]"+workVO.getRgNm()+":"+workVO.getCpnNm()+"-"+workVO.getCategoryNm());
				pushMap.put("rgUserId", map.get("rgUserId").toString());
				
				
				//메자닌 상장인지 여부
				
				if((workVO.getaCpnId().contains("A") || workVO.getaCpnId().contains("Q"))
						&&(orgCategoryCd.equals("00001") || orgCategoryCd.equals("00002") || orgCategoryCd.equals("00003") || orgCategoryCd.equals("00015"))){
					
					pushMap.put("dealType", "mezzL");		//메자닌 상장임.
				}
				
				//프리 IPO 벤처 기본 (탭권한이 있는 직원에게만 발송을 위해)
				if(orgCategoryCd.equals("00012") || orgCategoryCd.equals("00016")) pushMap.put("basicType", "Y");		
				else pushMap.put("basicType", "N");	
					
				pushService.insertPushLogSearchSabunList(pushMap);
			}
				
			
			
			
		}catch(Exception e){
			
		}
		
		return Integer.parseInt(sNb);
	}
	
	//딜 삭제
	public int deleteDeal(WorkVO workVO, Map<String, Object> map)throws Exception {
		
		int cnt =0;
		RecommendVO rcmdVO = new RecommendVO();
		rcmdVO.setCategoryCd("00001");
		rcmdVO.setsNb(workVO.getsNb());
		List<RecommendVO> opinion = recommendDAO.selectOpinionList(rcmdVO);
		
		
		if(opinion.size() == 0 && !workVO.getsNb().equals("0") && !workVO.getsNb().equals("")){
			cnt = workDAO.deleteOffer(workVO);
			map.put("offerSnb", workVO.getsNb());
			map.put("fileCategory", "00000");
			
			fileService.fileDeleteDbAndPhy(map);				//파일 db저장 & 물리 삭제
			
			cnt =1;
		}
		
		
		return cnt;
	}
	
	
	//딜 투자의견 수정
	public int doEditDealInvest(WorkVO workVO, Map<String, Object> map) throws Exception {
	
		int cnt = workDAO.updateDealResult(workVO);
	
		if(cnt >0){
			
			Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMMdd").format( cal.getTime() );

			workVO.setTmDt(date);
			workVO.setSttsCd("00001");
			if(workVO.getOpinion().length()>0){
				workDAO.insertMemoOfDealResult(workVO);
			}
		}
		
		//푸시
		Map pushMap = new HashMap();
		
		pushMap.put("pushType", pushVO.ptDealOpinion);
		pushMap.put("pushTypeId", workVO.getsNb());
		pushMap.put("usrId", workVO.getUserId());
		pushMap.put("content", "[투자의견]"+workVO.getCpnNm()+"-"+workVO.getRgNm()+":::"+workVO.getOpinion());
		pushMap.put("rgUserId", map.get("rgUserId").toString());
		
		if(!workVO.getUserId().equals("")) pushService.insertPushLogSearchSabunList(pushMap);
		
		return cnt;
		
	}
	
	//모바일 추천인 
	public List<WorkVO> selectRecommendOne(WorkVO workVO) throws Exception {
		
		return workDAO.selectRecommendOne(workVO);
	}
	
	//딜 코멘트 리스트
	public List<Map> selectDealCommentList(Map<String, Object> map) throws Exception {
		
		return workDAO.selectDealCommentList(map);
	}
	
	
	//딜 & 코멘트 메인 카운트(모바일)
	public Map<String, Object> getMainDealNCommentCount(Map<String, Object> map) throws Exception {
		
		return workDAO.getMainDealNCommentCount(map);
	}
	
	//오늘 등록된 딜
	public List<Map> getTodayDeal(Map<String, Object> map) throws Exception {
		
		return workDAO.getTodayDeal(map);
	}
	
	//오늘 등록된 코멘트
	public List<Map> getTodayDealComment(Map<String, Object> map) throws Exception {
		
		return workDAO.getTodayDealComment(map);
	}
	
	
	
	
}