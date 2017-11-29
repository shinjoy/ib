package ib.work.web;

import ib.basic.service.CpnExcelVO;
import ib.basic.service.impl.CpnUploadExcelMapping;
import ib.basic.web.MultiFileUpload;
import ib.basic.web.UtilReplaceTag;
import ib.cmm.ComCodeVO;
import ib.cmm.FileUpDbVO;
import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.service.CommonService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.cmm.util.sim.service.PagingAjax;
import ib.company.service.CompanyVO;
import ib.company.service.impl.CompanyDAO;
import ib.login.service.StaffVO;
import ib.network.service.impl.NetworkDAO;
import ib.person.service.PersonVO;
import ib.person.service.impl.PersonDAO;
import ib.push.service.PushService;
import ib.push.service.PushVO;
import ib.recommend.service.RecommendVO;
import ib.recommend.service.impl.RecommendDAO;
import ib.work.service.CusBasicConnectVO;
import ib.work.service.WorkMemoService;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;
import ib.work.service.impl.WorkDAO;

import java.io.IOException;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.fdl.idgnr.impl.Base64;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * <pre>
 * package  : ib.work.web
 * filename : WorkController.java
 * </pre>
 *
 * @author  : ChanWoo Lee
 * @since   : 2012. 8. 1.
 * @version : 1.0.0
 */
@Controller
public class WorkController {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;

	@Resource(name="commonService")
	private CommonService commonService;

	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;

    @Resource(name = "workDAO")
    private WorkDAO workDAO;

    @Resource(name = "workService")
    private WorkService workService;

    @Resource(name = "companyDAO")
    private CompanyDAO companyDAO;

    @Resource(name = "personDAO")
    private PersonDAO personDAO;

    @Resource(name = "networkDAO")
    NetworkDAO networkDAO;

    @Resource(name = "recommendDAO")
    RecommendDAO recommendDAO;
    
    @Resource(name = "pushService")
    private PushService pushService;
    
    @Resource(name = "workMemoService")
    private WorkMemoService workMemoService;
    
    
    
    @Autowired
    private DefaultBeanValidator beanValidator;
	/** log */
    protected static final Log LOG = LogFactory.getLog(WorkController.class);

	protected static final Calendar cal = Calendar.getInstance();
	/**
	 * Main - Left
	 * @MethodName : selectWork
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectLeft.do")
	public String selectWork(HttpServletRequest request,
							HttpSession session,
				            ModelMap model,
				            @RequestParam Map<String, String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Left";
		
		model.addAllAttributes(map);	//넘어온 파라미터 화면으로 전달. (deal='Y')
		
    	return "work/Left";
    }

	@RequestMapping(value="/work/selectuserList.do")
	public void selectuserList(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
            ModelMap model,
            @RequestParam Map<String, String> map) throws Exception{

		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		StaffVO staffVO = new StaffVO();	
		
		List<Map>list =  commonService.getStaffListNameSort(map);
		
	
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
    }
	
	
	@RequestMapping(value="/work/outStaffList.do")
	public void selectWorkAjax(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			StaffVO staffVO,
            ModelMap model) throws Exception{

		List<WorkVO> resu = workDAO.selectOutStaffList(staffVO);

		AjaxResponse.responseAjaxObject(response, resu);	//결과전송
    }
	
	@RequestMapping(value="/work/excelDownloadComment.do")
	public String excelDownloadComment(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			@RequestParam Map<String,Object>map,WorkVO vo,
            ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		if(vo.getSrchYear().toString().length() == 0){
			vo.setSrchYear("" + cal.get(Calendar.YEAR));
		}
		
		try{
			model.addAttribute("financingList", workDAO.selectAnalysisCommentsList(vo));
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/keyPointChk/excelDownloadComment";
    }
	
	
	@RequestMapping(value="/work/selectCommonCdListKeyPoint.do")
	public void selectCommonCdListKeyPoint(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			StaffVO staffVO,
            ModelMap model) throws Exception{
		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		List<ComCodeVO> list = cmm.CommonCdList("00018", loginUser.getId());		//핵심체크사항

		AjaxResponse.responseAjaxObject(response, list);	//결과전송
    }

	
	/**
	 * 개인별 업무일지 페이지
	 * @MethodName : viewPrivateWork
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectPrivateWorkV.do")
	public String viewPrivateWork(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			LoginVO loginVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		model.addAttribute("focus", workVO.getFocus());

		StaffVO staffVO = new StaffVO();

		if("".equals(workVO.getName())) workVO.setName(loginUser.getName());		//화면에서 조회대상자 이름 (없으면, 로그인 사용자명)
		if("".equals(workVO.getTmpId()))workVO.setTmpId(loginUser.getId());			//화면에서 조회대상자 id	(없으면, 로그인 사용자id)
		model.addAttribute("tmpId", workVO.getTmpId());
		model.addAttribute("name", workVO.getName());

		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(workVO.ccdCateCd));
		model.addAttribute("cmmCdOfferList", cmm.CommonCdList(workVO.ccdOffCd));
		model.addAttribute("cmmCd1stSlctList", cmm.CommonCdList("00015"));
		model.addAttribute("cmmCdResultList", cmm.CommonCdList("00010"));
		model.addAttribute("cmmCdanalysisCpnList", cmm.CommonCdList("00020"));

		String date = null;
		if(workVO.getChoice_year().equals("") && workVO.getChoice_month().equals("")){
			cal.setTime( new Date(System.currentTimeMillis()) );
			date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );

			workVO.setChoice_year(date.substring(0, 4));
			workVO.setChoice_month(date.substring(4));

		}else model.addAttribute("choice_year", workVO.getChoice_year());
		workVO.setChoice_monthS(workVO.getChoice_month());

		Calendar now = cal;
		now.set(Integer.parseInt(workVO.getChoice_year()), Integer.parseInt(workVO.getChoice_month())-1, 1);
		model.addAttribute("last_day", now.getActualMaximum(Calendar.DATE));
		model.addAttribute("choice_year", workVO.getChoice_year());
		model.addAttribute("choice_month", workVO.getChoice_month());

		try{

			 //암호화
			String decrypted = workVO.getTitle();
			try{
			    MessageDigest md = MessageDigest.getInstance("SHA-256");
			    md.update(new String(decrypted).getBytes("UTF-8"));

			    byte[] digested = md.digest();
			    decrypted = new String(Base64.encode(digested));
			}
			catch (Exception e){
			    decrypted = new String(decrypted);
			}
			workVO.setTitle(decrypted);

			model.addAttribute("resultList", workDAO.selectBusinessRecordList(workVO));
			//staffVO.setTmpNum1("notInHere");
			model.addAttribute("userList", cmm.UserList(staffVO));
			model.addAttribute("introducerList",workDAO.selectIntroducer(workVO));
			
			workVO.setComment(null);
			workVO.setTmDt(null);
			workVO.setRgId(null);

			model.addAttribute("memoList", workDAO.selectMemoList(workVO));						//업무보고(최초작성 TM_DT 기준)
			
			WorkVO param = new WorkVO();
			param.setChoice_year(workVO.getChoice_year());
			param.setChoice_monthS(workVO.getChoice_monthS());
			param.setChoice_month(workVO.getChoice_month());
			param.setName(workVO.getName());
			model.addAttribute("memoReplyRgDtList", workDAO.selectMemoReplyRgDtList(param));	//업무보고(최근댓글 RG_DT 기준)
						
			workVO.setRgId(workVO.getTmpId());
			workVO.setPastYn("Y");
			model.addAttribute("memoListNoRead", workDAO.selectComment(workVO));				//읽지 않은 메모 오늘날짜에 보이도록 추가 20170424
			
			workVO.setRgId(null);
			model.addAttribute("offerList",workDAO.selectOfferListNfile(workVO));
			model.addAttribute("netpList",workDAO.selectNetPoint(workVO));
			model.addAttribute("dealInfoList",workDAO.selectCstDealInfo(workVO));
			//model.addAttribute("cmntStaffNm",workDAO.selectSameCommentStaffName(workVO));
			
			String tmNm = workVO.getName();
			workVO.setName(null);
			model.addAttribute("replyList", workDAO.selectReplyList(workVO));
			workVO.setName(tmNm);

			if(loginUser.getName().equals(workVO.getName())) workVO.setTmpNum2("1");
			else workVO.setTmpNum2("2");
			model.addAttribute("insideList",workDAO.selectInsideList(workVO));
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}finally{
		}
		
		return "work/PrivateWorkView";
	}

	
	/**
	 * 업무일지 업무내용 조회
	 * @MethodName : selectBusinessRecord
	 * @param request
	 * @param session
	 * @param vo
	 * @param loginVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectBusinessRecord.do")
	public String selectBusinessRecord(HttpServletRequest request,
			HttpSession session,
			WorkVO vo,
			LoginVO loginVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());

		model.addAttribute("DaY", vo.getDay());
		try{
			if(vo.getsNb()!=null && !vo.getsNb().equals("n") && vo.getsNb().length()>0){
				model.addAttribute("bsnsList", workDAO.selectBusinessRecordOne(vo));
				LOG.debug(loginUser.getId()+"^_^workDAO.selectBusinessRecordOne");
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "ajaxPopDiv/bsns_data";
	}
	/**
	 * 업무일지 인사이드 조회
	 * @MethodName : selectInside
	 * @param request
	 * @param session
	 * @param vo
	 * @param loginVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectInside.do")
	public String selectInside(HttpServletRequest request,
			HttpSession session,
			WorkVO vo,
			LoginVO loginVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());

		model.addAttribute("DaY", vo.getDay());
		try{
			model.addAttribute("insideList", workDAO.selectInsideOne(vo));
			LOG.debug(loginUser.getId()+"^_^workDAO.selectInsideOne");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "ajaxPopDiv/bsns_data";
	}

	/**
	 * 업무일지 업무내용 입력
	 * @MethodName : insertBusinessRecord
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/insertBusinessRecord.do")
	public String insertBusinessRecord(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			LoginVO loginVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		model.addAttribute("result", workVO.getDay());
		workVO.setTmDt(workVO.getChoice_year()+workVO.getChoice_month()+workVO.getDay());
		workVO.setRgId(loginUser.getId());

		int cnt = 0;
		try{
			cnt = workDAO.insertBusinessRecord(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.insertBusinessRecord");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		return "basic/result";
	}

	/**
	 * 업무일지 업무내용 수정
	 * @MethodName : modifyBusinessRecord
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyBusinessRecord.do")
	public String modifyBusinessRecord(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			LoginVO loginVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());

		int cnt = workDAO.updateBusinessRecord(workVO);
		LOG.debug(loginUser.getId()+"^_^workDAO.updateBusinessRecord^_^"+workVO.getsNb());
		model.addAttribute("saveCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));
		model.addAttribute("result", workVO.getDay());

		return "basic/result";
	}

	/**
	 * 업무일지 업무내용 삭제
	 * @MethodName : deleteBusinessRecord
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/deleteBusinessRecord.do")
	public String deleteBusinessRecord(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		int cnt = workDAO.deleteBusinessRecord(workVO);
		LOG.debug(loginUser.getId()+"^_^workDAO.deleteBusinessRecord^_^"+workVO.getsNb());
		model.addAttribute("deleteCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.delete"));

		model.addAttribute("result", workVO.getFocus());
		return "basic/result";
	}

	/**
	 *
	 * @MethodName : cusManagementSystem
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int cusManagementSystem(WorkVO workVO) throws Exception{
		CusBasicConnectVO cusVO = new CusBasicConnectVO();
		List<PersonVO> resultP = null;
		int cntCus = 0;

		//입력된 data로 고객정보 긁어오기
		PersonVO perVO = new PersonVO();
		perVO.setsNb(workVO.getCstId());
		perVO.setRgId(workVO.getRgId());
		resultP = personDAO.selectMainPersonList(perVO);//고객정보 select


		if("00001".equals(workVO.getCpnCst())) {
			cusVO.setCusNm(resultP.get(0).getCpnNm());//법인이름
			cusVO.setS_Nb(resultP.get(0).getCpnSnb());
		}
		else if("00002".equals(workVO.getCpnCst()))	{
			cusVO.setCusNm(resultP.get(0).getCstNm());//고객이름
			cusVO.setS_Nb(workVO.getCstId());
		}
		cusVO.setCusPerNm(resultP.get(0).getCstNm());


		try{
			List<CusBasicConnectVO> resultCus = workDAO.selectCusBasicConnet(cusVO);//중복확인
			List<CusBasicConnectVO> sumPrice = workDAO.selectTotalOfferPrice(cusVO);//신규&증액 금액 총합
			String inPrice = (sumPrice.get(0).getTradeQuerter());
			if(resultCus.isEmpty()){//신규 insert

				//입력값
				cusVO.setCusPhone(resultP.get(0).getPhn1());
				cusVO.setCusEmail(resultP.get(0).getEmail());
				cusVO.setCusEtc(workVO.getCstNm().replace("\n", "").replace("\t", " ; ")+resultP.get(0).getPosition()+"\n"+workVO.getMemo());
				cusVO.setCusStatus("1");
				cusVO.setCusType(Integer.parseInt(workVO.getCpnCst()));
				cusVO.setCusAddInvestFlag("1");
				cusVO.setCusManagerNm(workVO.getRgNm());
				cusVO.setCusInviteNm(workVO.getRgNm());

				cusVO.setCusOfficeNm(resultP.get(0).getCpnNm());
				cusVO.setCusOfficePosition(resultP.get(0).getPosition());
				cusVO.setCusOfficeTel(resultP.get(0).getPhn2());
				cusVO.setRegPerSabun(resultP.get(0).getRegPerSabun());

				//* 고객정보 등록
				cntCus = workDAO.insertCusBasic(cusVO);
				LOG.debug(workVO.getRgId()+"^_^workDAO.insertCusBasic");

				//String [] inPrice = workVO.getPrice().split("억");
				inPrice+="00000000";
				cusVO.setTradeQuerter(inPrice);
				//* 계약서 등록
				cntCus = workDAO.insertCusTrade(cusVO);
				LOG.debug(workVO.getRgId()+"^_^workDAO.insertCusTrade");

				cusVO.setCusPerTel(resultP.get(0).getPhn2());
				//* 담당자 등록
				cntCus = workDAO.insertCusWorkPer(cusVO);
				LOG.debug(workVO.getRgId()+"^_^workDAO.insertCusWorkPer");


			}else{//증액 update
				cusVO.setRegPerSabun(resultP.get(0).getRegPerSabun());
				//String [] inPrice = workVO.getPrice().split("억");
				inPrice+="00000000";
				cusVO.setTradeQuerter(inPrice);
				cntCus = workDAO.updateCusTrade(cusVO);
				LOG.debug(workVO.getRgId()+"^_^workDAO.updateCusTrade");
			}

		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}return cntCus;
	}

	/**
	 * 핵심체크 내용 DB입력
	 * @MethodName : insertOfferInfo
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int insertOfferInfo(WorkVO vo) throws Exception{
		int cnt = 0;
		List<WorkVO> slctSnb = workDAO.selectOfferInfo(vo);
		vo.setOfferSnb(slctSnb.get(0).getsNb());//input : offerSnb

		if(vo.getKeyP().length()<0) return 0;

		String arrNote[] 	= vo.getKeyP().split(",")
			 , arrNum[] 	= vo.getKeyPnum().split(",");
		int lengArr = arrNum.length;
		StringBuffer cate = null;

		for(int i=0; i<lengArr; i++){
			cate = new StringBuffer();
			switch( arrNum[i].length() ) {
			case 1: cate.append("0000").append(arrNum[i]); break;
			case 2: cate.append("000").append(arrNum[i]); break;
			case 3: cate.append("00").append(arrNum[i]); break;
			}
			vo.setCategoryCd( cate.toString() );
			vo.setComment(arrNote[i]);
			cnt += workDAO.insertOfferInfo(vo);
			LOG.debug(vo.getRgId()+"^_^workDAO.insertOfferInfo_"+cate.toString());
		}
		return cnt;
	}

	/**
	 * 정보정리 입력
	 * @MethodName : insertDeal
	 * @param request
	 * @param workVO
	 * @param loginVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/insertDeal.do")
	public String insertDeal(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			LoginVO loginVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		String orgCategoryCd = workVO.getCategoryCd();
		
		if(workVO.getDay()!=null&workVO.getDay().length()!=0) workVO.setTmDt(workVO.getChoice_year()+workVO.getChoice_month()+workVO.getDay());
		workVO.setRgId(loginUser.getId());
		workVO.setRgNm(loginUser.getName());
		if("".equals(workVO.getMiddleOfferCd())||workVO.getMiddleOfferCd()==null)workVO.setMiddleOfferCd("00000");
		if("".equals(workVO.getInfoProvider())||workVO.getInfoProvider()==null)workVO.setInfoProvider("0");
		if("".equals(workVO.getSupporter())||workVO.getSupporter()==null)workVO.setSupporter("0");
		if("".equals(workVO.getRcmdSnb())||workVO.getRcmdSnb()==null)workVO.setRcmdSnb("0");
		int cnt = 0, cntCus = 0;
		if(!"00011".equals(workVO.getMiddleOfferCd())){
			workVO.setEntrust(null);
		}
		try{
			
			String offerSnb = Integer.toString(workDAO.insertDealReturnSnb(workVO));
			
			cnt += insertOfferInfo(workVO);
			
			
			//------- 푸쉬 세팅 :S -----------
			try{
				//딜 등록일때만
				if((workVO.getOfferCd()).equals("00006") || (workVO.getOfferCd()).equals("00007") || (workVO.getOfferCd()).equals("00000")){
										
					Map pushMap = new HashMap();
					
					pushMap.put("pushType",		PushVO.ptDeal);
					pushMap.put("pushTypeId",	offerSnb);
					pushMap.put("content",		"[신규 딜]"+workVO.getRgNm()+":"+workVO.getCpnNm()+"-"+workVO.getCategoryNm());
					pushMap.put("rgUserId",		loginUser.getStaffSnb());
					
					//메자닌 상장인지 여부
					
					if("Y".equals(workVO.getListed())
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
			//------- 푸쉬 세팅 :E -----------
			
			

			
			//----- 딜 제안중(직접발굴) 입력건에 대해서 추천인(추천종목) 이 있을때, 해당 추천종목(IB_OFFER 에 존재) 의 상태를 '00003' 제안중(구, 성사) 로 업데이트 :S -------
			if(!"0".equals(workVO.getRcmdSnb())){
				//workDAO.updateRcmdStts(workVO);
				Map map = new HashMap();
				map.put("sNb", workVO.getRcmdSnb());
				map.put("usrId", loginUser.getId());
				recommendDAO.updateRcmdDealStts(map);		//추천종목 상태 변경
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

					if(1 == offerCd) offerNm="미팅";else if(7 == offerCd) offerNm="받은제안";else if(8 == offerCd) offerNm="저녁미팅";else if(9 == offerCd) offerNm="전화통화";else if(11 == offerCd) offerNm="일임계약";else if(12 == offerCd) offerNm="재매각";
					switch(offerCd){
					case 1:case 7:case 8:case 9:case 11:case 12:
						//인물네트워크 추가
						sb.append(workVO.getTmDt()).append(" : ").append(offerNm); //.append(" / 회사코드 : ").append(workVO.getCpnId())
						pvo.setNote(sb.toString());
						cnt1 = personDAO.insertNetworkCst(pvo);
						LOG.debug(loginUser.getId()+"^_^personDAO.insertNetworkCst");
						break;
					default: break;
					}
				}
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("insertCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		/** 고객관리 시스템 연동 **/
/*		if("00011".equals(workVO.getMiddleOfferCd())){
			cntCus = cusManagementSystem(workVO);
		}if(cntCus==0) System.out.println("------------error------------\n---------고객관리시스템 insert---------");
	*/
		model.addAttribute("result", workVO.getDay());
		return "basic/result";
	}
	/**
	 * 공동진행 팝업
	 * @MethodName : popUpSup
	 * @param request
	 * @param workVO
	 * @param companyVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/popUpSup.do")
	public String popUpSup(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			CompanyVO companyVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		StaffVO staffVO = new StaffVO();
		model.addAttribute("userList", cmm.UserList(staffVO));

		if(workVO.getsNb()!=null && !"".equals(workVO.getsNb())){
			List <WorkVO> result= null;
			workVO.setOfferSnb(workVO.getsNb());
			model.addAttribute("parentSNB", workVO.getsNb());
			model.addAttribute("pop", "ok");
			try{
				result = workDAO.selectOfferJointProgress(workVO);
				model.addAttribute("jointList", result);
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
		}
		return "work/popUp/PopUpSup";
	}

	/**
	 * 팝업 공동진행 저장
	 * @MethodName : popUpSupJoint
	 * @param request
	 * @param workVO
	 * @param companyVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/popUpSupJoint.do")
	public String popUpSupJoint(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			ModelMap model) throws Exception{
		
		try {
			if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
			LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
			LOG.info(loginUser.getId());
			workVO.setRgId(loginUser.getId());
	
			for(int i=0;i<workVO.getArrStaffSnb().length;i++){		//공동진행 사원 id 배열
				String staffSnb = workVO.getArrStaffSnb()[i];	//사원 id
				String ratio = workVO.getArrRatio()[i];			//비율
				String snb = workVO.getArrSnb()[i];				//
	
				if(staffSnb!=null && !"".equals(staffSnb) && !"0".equals(staffSnb)){
					if(ratio!=null && !"".equals(ratio) && !"0".equals(ratio)){
						workVO.setStaffSnb(staffSnb);
						workVO.setRatio(ratio);
						workVO.setComment(workVO.getArrComment()[i]);
						if(snb!=null && !"".equals(snb)) {
							//update
							workVO.setsNb(snb);
							workDAO.updateOfferJointProgress(workVO);
							LOG.debug(loginUser.getId()+"^_^workDAO.updateOfferJointProgress^_^"+workVO.getsNb());
						}else{
							//insert
							workDAO.insertOfferJointProgress(workVO);
							LOG.debug(loginUser.getId()+"^_^workDAO.insertOfferJointProgress^_^"+workVO.getsNb());
						}
					}
				}
			}
	
			StaffVO staffVO = new StaffVO();
			model.addAttribute("userList", cmm.UserList(staffVO));
	
			List <WorkVO> result= null;
			model.addAttribute("parentSNB", workVO.getOfferSnb());
			model.addAttribute("pop", "ok");
			result = workDAO.selectOfferJointProgress(workVO);
			model.addAttribute("jointList", result);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
			throw e;
		}

		return "work/funds/PopUpSup";
	}

	/**
	 * 공동진행 삭제
	 * @MethodName : deletePopUpSupJoint
	 * @param request
	 * @param session
	 * @param workVO
	 * @param companyVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/deletePopUpSupJoint.do")
	public String deletePopUpSupJoint(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		try{
			workDAO.deleteOfferJointProgress(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.deleteOfferJointProgress^_^"+workVO.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/funds/PopUpSup";
	}
	/**
	 * 소개
	 * @MethodName : popUpIntroducer
	 * @param request
	 * @param session
	 * @param workVO
	 * @param companyVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/popUpIntroducer.do")
	public String popUpIntroducer(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		model.addAttribute("MDf", workVO.getModalFlag());

		StaffVO staffVO = new StaffVO();
		staffVO.setTmpNum1("notInHere");//김재찬 고문 출력 비상주 인원 출력
		model.addAttribute("userList", cmm.UserList(staffVO));
		model.addAttribute("tmpDate", workVO.getTmDt());

		if(workVO.getsNb()!=null && !"".equals(workVO.getsNb())){
			List<WorkVO> result = null;
			try{
				result = workDAO.selectIntroducerOne(workVO);
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
			model.addAttribute("introducer", result);
		}

		return "work/popUp/PopUpIntroducer";
	}

	/**
	 * 소개장 저장
	 * @MethodName : saveIntroducer
	 * @param request
	 * @param session
	 * @param workVO
	 * @param companyVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/saveIntroducer.do")
	public String saveIntroducer(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			CompanyVO companyVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		workVO.setRgId(loginUser.getId());
		int cnt=0;
		try{
			if(workVO.getsNb()!=null && !"".equals(workVO.getsNb())){
				//update
				cnt = workDAO.updateIntroducer(workVO);
				LOG.debug(loginUser.getId()+"^_^workDAO.updateIntroducer^_^"+workVO.getsNb());
			}else{
				//insert
				cnt = workDAO.insertIntroducer(workVO);
				LOG.debug(loginUser.getId()+"^_^workDAO.insertIntroducer^_^");
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "work/popUp/PopUpIntroducer";
		//return "redirect:/work/popUpIntroducer.do";
	}

	/**
	 * 소개삭제
	 * @MethodName : deleteIntroducer
	 * @param request
	 * @param session
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/deleteIntroducer.do")
	public String deleteIntroducer(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		try{
			workDAO.deleteIntroducer(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.deleteIntroducer^_^"+workVO.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/popUp/PopUpIntroducer";
	}

	/**
	 * 정보정리 수정
	 * @MethodName : modifyDeal
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyDeal.do")
	public String modifyDeal(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			LoginVO loginVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());

		if("".equals(workVO.getMiddleOfferCd())||workVO.getMiddleOfferCd()==null)workVO.setMiddleOfferCd("00000");
		if("".equals(workVO.getInfoProvider())||workVO.getInfoProvider()==null)workVO.setInfoProvider("0");
		if("".equals(workVO.getCstId())||workVO.getCstId()==null)workVO.setCstId("0");
		if("".equals(workVO.getSupporterRatio())||workVO.getSupporterRatio()==null)workVO.setSupporterRatio("0");

		int cnt = workDAO.updateDeal(workVO);
		LOG.debug(loginUser.getId()+"^_^workDAO.updateDeal^_^"+workVO.getsNb());

		cnt += updateNinsertOfferInfo(workVO);
		//고객관리시스템 수정
/*		if("00011".equals(workVO.getMiddleOfferCd())){

			CusBasicConnectVO cusVO = new CusBasicConnectVO();
			String arr[] = workVO.getCstNm().split(": ");

			if(workVO.getPrevCpnCst().equals(workVO.getCpnCst())){		//고객 구분은 바꾸지 않았을 때
				if("00001".equals(workVO.getCpnCst())) {		//법인
					cusVO.setCusNm(null);
					//cusVO.setCusNm(arr[0]);
					cusVO.setS_Nb(workVO.getCpnSnb());
					//System.out.println("기존그대로 법인 tmpid:"+cusVO.getTmpId()+"/snb:"+cusVO.getS_Nb());
				}
				else if("00002".equals(workVO.getCpnCst()))	{	//개인
					cusVO.setCusNm(null);
					//cusVO.setCusNm(arr[1].replace("\n", "").replace("\t", ""));
					cusVO.setS_Nb(workVO.getCstId());
					//System.out.println("기존그대로 개인 tmpid:"+cusVO.getTmpId()+"/snb:"+cusVO.getS_Nb());
				}
			}else{															//법인->고객 or 고객->법인 으로 바꿨을 때
				if("00001".equals(workVO.getCpnCst())) {		//법인
					cusVO.setCusNm(arr[0]);
					cusVO.setTmpId(workVO.getCpnSnb());
					cusVO.setS_Nb(workVO.getCstId());
					//System.out.println("기존내용 바뀌고 법인 tmpid:"+cusVO.getTmpId()+"/snb:"+cusVO.getS_Nb());
				}
				else if("00002".equals(workVO.getCpnCst()))	{	//개인
					cusVO.setCusNm(arr[1].replace("\n", "").replace("\t", ""));
					cusVO.setTmpId(workVO.getCstId());
					cusVO.setS_Nb(workVO.getCpnSnb());
					//System.out.println("기존내용 바뀌고 개인 tmpid:"+cusVO.getTmpId()+"/snb:"+cusVO.getS_Nb());
				}
			}
			List<CusBasicConnectVO> sumPrice = workDAO.selectTotalOfferPrice(cusVO);//신규&증액 금액 총합
			String inPrice = (sumPrice.get(0).getTradeQuerter());
			inPrice+="00000000";
			cusVO.setTradeQuerter(inPrice);

			cusVO.setCusEtc(workVO.getCstNm().replace("\n", "").replace("\t", "")+"\n"+workVO.getMemo());
			cusVO.setCusType(Integer.parseInt(workVO.getCpnCst()));

			workDAO.updateCusTrade(cusVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.updateCusTrade");

			int cntCus = workDAO.updateCusBasic(cusVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.updateCusBasic");
		}
*/
		model.addAttribute("updateCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		model.addAttribute("result", workVO.getDay());
		return "basic/result";
	}

	public int updateNinsertOfferInfo(WorkVO vo){
		int cnt = 0;
		if(vo.getKeyP().length()<0) return 0;

		String
			   keyPnum 		= vo.getKeyPnum()
			 , keyPsnbNum 	= vo.getKeyPsnbNum()
			 , arrNote[] 	= vo.getKeyP().split(",")
			 , arrNum[] 	= keyPnum.split(",")
			 , arrSnbNum[] 	= keyPsnbNum.split(",")
			 , arrSnb[] 	= vo.getKeyPsnb().split(",");
		// int lengArrNum = arrNum.length<arrSnbNum.length?arrSnbNum.length:arrNum.length;
		int lengArrNum = Integer.parseInt(vo.getKeyPmax());
		StringBuffer cate = null;

		try{
			for(int i=0, j=0; i<lengArrNum; i++){
				if(j<arrSnbNum.length&&!keyPnum.contains(arrSnbNum[j])){
					//delete
					vo.setOfferSnb( arrSnb[j++] );
					workDAO.deleteOfferInfo(vo);
					LOG.debug(vo.getRgId()+"^_^workDAO.deleteOfferInfo_"+arrSnb[j-1]);
				}
				if(i<arrNum.length){
					vo.setComment(arrNote[i]);
					cate = new StringBuffer();
					switch( arrNum[i].length() ) {
					case 1: cate.append("0000").append(arrNum[i]); break;
					case 2: cate.append("000").append(arrNum[i]); break;
					case 3: cate.append("00").append(arrNum[i]); break;
					}
					if(keyPsnbNum.contains(arrNum[i])){
						//update
						vo.setOfferSnb( arrSnb[j++] );
						workDAO.updateOfferInfo(vo);
						LOG.debug(vo.getRgId()+"^_^workDAO.updateOfferInfo_"+cate.toString());
					}else{
						//insert
						vo.setCategoryCd( cate.toString() );
						vo.setOfferSnb( vo.getsNb() );
						cnt += workDAO.insertOfferInfo(vo);
						LOG.debug(vo.getRgId()+"^_^workDAO.insertOfferInfo_"+cate.toString());
					}
				}
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		return cnt;
	}

	/**
	 * 정보정리 삭제
	 * @MethodName : deleteOffer
	 * @param request
	 * @param session
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/deleteOffer.do")
	public String deleteOffer(HttpServletRequest request,
			HttpSession session,
			WorkVO vo,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		FileUpDbVO fvo = new FileUpDbVO();
		fvo.setOfferSnb(vo.getsNb());
		System.out.println("---snb:"+fvo.getOfferSnb());

		int cnt = workDAO.deleteOffer(vo);
		LOG.debug(loginUser.getId()+"^_^workDAO.deleteOffer^_^"+vo.getsNb());

		workDAO.deleteFileInfoOfOfferSnb(fvo);

		// 고객관리 시스템
/*		CusBasicConnectVO cusVO = new CusBasicConnectVO();
		if("00001".equals( vo.getEntrust() )){
			cusVO.setCusStatus("4");
		}
		cusVO.setS_Nb(vo.getCstId());
		cusVO.setCusNm(null);

		List<CusBasicConnectVO> sumPrice = workDAO.selectTotalOfferPrice(cusVO);//신규&증액 금액 총합
		String inPrice = (sumPrice.get(0).getTradeQuerter());
		inPrice+="00000000";
		cusVO.setTradeQuerter(inPrice);

		int cntCus = workDAO.updateCusBasic(cusVO);
		LOG.debug(loginUser.getId()+"^_^workDAO.updateCusBasic");
*/
		model.addAttribute("deleteCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.delete"));

		model.addAttribute("result", vo.getFocus());
		return "basic/result";
	}
	
	
	/**
	 * 메모 전달
	 * @MethodName : insertMemo
	 * @param request
	 * @param workVO
	 * @param loginVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/insertMemo.do")
	public String insertMemo(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			LoginVO loginVO,
			ModelMap model) throws Exception{
		try {
				if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
				LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
				LOG.info(loginUser.getId());
				model.addAttribute("focus", workVO.getDay());
				workVO.setRgId(loginUser.getId());
				workVO.setArrayName(workVO.getMemoSndName().split(","));
			
				String[] arr = workVO.getArrayName();
				String returnPage = "work/PrivateWorkView";
		
				if("".equals(workVO.getMemoSndName())){
					viewPrivateWork(request, session, workVO, loginVO, /*loginVO,*/ model);
					return "work/PrivateWorkView";
				}
		
				workVO.setTmDt(workVO.getChoice_year()+workVO.getChoice_month()+workVO.getDay());
				workVO.setChoice_monthS(workVO.getChoice_month());
		
				int cnt = 0, smsCnt = 0;
				List <WorkVO> result= null;
				String rgNm = workDAO.getStaffName(workVO.getRgId());
				
				/** sms */
				if(workVO.getComment().length() > 80) workVO.setSMSType("5");//3-단문문자, 5-LMS(장문문자), 6-MMS(이미지포함문자)
				else workVO.setSMSType("3");
				//workVO.setSMSSendFlag("3");//1-접수여부, 2-성공여부, 3-모두확인, 4-모두확인안함
		
				
				//답장을 위한 메모 로직
		
				//sub메모가 아니다. 입력자 메모..처음입력...
				if("N".equals(workVO.getSubMemo())){
					workVO.setMainSnb("0");
					workVO.setMemoSndName(rgNm);
					
					if("Y".equals(workVO.getPriv())){		//비밀글일때
						workVO.setComment((String) workDAO.selectEncrypt(workVO));		//암호화
					}
		
					workDAO.insertMainMemoNreturnSnb(workVO);
					workVO.setSttsCd("00001");
					
				}
				//sub 메모 중에 mainSnb가 없을떄
				else if("".equals(workVO.getMainSnb())||workVO.getMainSnb()==null||"0".equals(workVO.getMainSnb())){
					try{
						String temp = workVO.getRgId();
						/*if("00010".equals(loginUser.getPermission())) {
							workVO.setRgId(null);
						}*/
		
						String strTemp = workVO.getComment();
						//workVO.setComment(strTemp.split("]")[0]);
						strTemp = strTemp.replace("\r", "");
						workVO.setComment(strTemp);
		
						result = workDAO.selectMemoList(workVO);
		
						workVO.setRgId(temp);
						if(!result.isEmpty()){
							workVO.setMainSnb(result.get(0).getsNb());			//main 글 s_nb
							workVO.setComment(result.get(0).getComment());		//내용 재세팅
						}
		
						//workVO.setComment(strTemp);
					}catch(Exception e){
						LOG.error(e);
						e.printStackTrace();
					}
				}
		
				//비밀글 전달을 할때(최초글 입력이 아닌타이밍때)
				if(!"N".equals(workVO.getSubMemo()) && "Y".equals(workVO.getPriv())){
					workVO.setComment((String) workDAO.selectEncrypt(workVO));
				}
				
				
				//참조인들에게(나 제외)
				for(int i=0;i<arr.length;i++){
					if(!arr[i].equals("")){
						if(rgNm.equals(arr[i])) continue;	//나 제외
						workVO.setMemoSndName(arr[i]);
						
						try{
							/*
							if("direct".equals(workVO.getTmpNum1())){
								workDAO.insertMainMemoNreturnSnb(workVO);
								workVO.setSttsCd("00001");
							}
							*/
							cnt = workDAO.insertMemo(workVO);							
			
							if("sms".equals(workVO.getSMSTitle())){
								workVO.setCategoryType("1");			//1:업무보고 에서 등록한 SMSLOG 정보
								smsCnt = workDAO.insertSMS(workVO);
							}
														
							
							//----------- 메모유형 '업무요청(00040)' or '승인요청(00030)' 시 업무일지 에도 등록되도록(체크시) :S ----------
							if(("00030".equals(workVO.getMemoType()) || "00040".equals(workVO.getMemoType())) && "Y".equals(workVO.getAlsoDailyWork())){
								workVO.setName(arr[i]);
								String ttl = "[";
								if("00030".equals(workVO.getMemoType())) ttl += "승인요청-";
								if("00040".equals(workVO.getMemoType())) ttl += "업무요청-";
								int len = workVO.getComment().length();
								int rlen = Integer.parseInt(workVO.getCommentFirstNewLineIndex());								
								if(rlen>0 && rlen<30)
									len = rlen;
								else
									len = (len > 30)?30:len;
								workVO.setTitle(ttl + loginUser.getName() + "] " + workVO.getComment().substring(0, len));
								workVO.setNote(workVO.getComment());
								workVO.setBsnsRecPrivate("1");
								
								workDAO.insertBusinessRecord(workVO);
							}
							//----------- 메모유형 '업무요청' or '승인요청' 시 업무일지 에도 등록되도록(체크시) :E ----------
							
						}catch(Exception e){
							LOG.error(e);
							e.printStackTrace();
						}
					}
				}
		
				
				//------- 푸쉬 세팅 :S -----------
				try{
					String sabunList = workVO.getMemoSndSabun();
					String commentReal = workVO.getComment();
					if(!"".equals(sabunList)){
						Map pushMap = new HashMap();
						
						pushMap.put("pushType",		PushVO.ptMemo);
						pushMap.put("sabunList",	sabunList);
						pushMap.put("pushTypeId", 	workVO.getMainSnb());
						pushMap.put("content", 		"[업무메모]"+rgNm+":"+( commentReal.length() >70 ? commentReal.substring(0,70) : commentReal));
						pushMap.put("rgUserId", 	loginUser.getStaffSnb());
						
						pushService.insertPushLogSearchSabunList(pushMap);
					
					}
					
				}catch(Exception e){					
				}
				//------- 푸쉬 세팅 :E -----------
				
				
				
				if(smsCnt !=0){
					List<WorkVO> rsltSMS = null;
					UtilReplaceTag rpTag = new UtilReplaceTag();
					try{
						rsltSMS = workDAO.selectSMS(workVO);
					}catch(Exception e){
						LOG.error(e);
						e.printStackTrace();
					}
					rsltSMS.get(0).setSMSContent(rpTag.ReplaceTag(rsltSMS.get(0).getSMSContent(),"decode"));
					model.addAttribute("resultSMS", rsltSMS);
					if("N".equals(workVO.getSubMemo())){
						returnPage = "basic/result_SMS";
						//model.addAttribute("SMSType",rsltSMS.get(0).getSMSType());
						model.addAttribute("SMSType", "3");															//강제 SMS 로
						model.addAttribute("SMSToNum",rsltSMS.get(0).getSMSToNum());
						int endIdx = rsltSMS.get(0).getSMSContent().length();
						if(endIdx > 80) endIdx = 80;
						//model.addAttribute("SMSContent",rsltSMS.get(0).getSMSContent());
						String cntnt = rsltSMS.get(0).getSMSContent().substring(0, endIdx);
						if("Y".equals(rsltSMS.get(0).getPriv())) cntnt = "비밀 업무보고가 작성되었습니다";				//비밀글일때
						model.addAttribute("SMSContent", "IB: " + cntnt);		//강제 SMS 로
						model.addAttribute("SMSFromNum", rsltSMS.get(0).getSMSFromNum());
						model.addAttribute("SMSReserTime", rsltSMS.get(0).getSMSReserTime());
						model.addAttribute("SMSSeq", rsltSMS.get(0).getSMSSeq());
						model.addAttribute("smsOK", "SMSreturnValueOK");
					}
				}
		
				model.addAttribute("saveCnt", cnt);
				viewPrivateWork(request, session, workVO, loginVO, model);
		//		return "work/PrivateWorkView";
				return returnPage;
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
	/**
	 * 메모 참조인 추가 (수정모드)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 24.
	 */
	@RequestMapping(value="/work/addMemoStaff.do")
	public void addMemoStaff(HttpServletRequest request,
							 HttpServletResponse response,
							 HttpSession session,
							 WorkVO workVO,
							 LoginVO loginVO,
							 ModelMap model) throws Exception{
		try {
				if(session.getAttribute("userLoginInfo")==null) return;
				LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
				
				
				workVO.setArrayName(workVO.getMemoSndName().split(","));
			
				String[] arr = workVO.getArrayName();
				String returnPage = "work/PrivateWorkView";
		
		
				//workVO.setTmDt(workVO.getChoice_year()+workVO.getChoice_month()+workVO.getDay());
				//workVO.setChoice_monthS(workVO.getChoice_month());
		
				int cnt = 0, smsCnt = 0;
				List <WorkVO> result= null;
				//String rgNm = workDAO.getStaffName(workVO.getRgId());
				String rgNm = loginUser.getName();
				
				
				/** sms */
				workVO.setSMSType("3");
						
				result = workDAO.selectMemoListGrp(workVO);

				
				List<String> slist = new ArrayList<String>();		//참여자 전체
				for(int i=0; i<result.size(); i++){
					if("0".equals(result.get(i).getMainSnb())){
						workVO.setMainSnb(result.get(0).getsNb());			//main 글 s_nb
						workVO.setComment(result.get(0).getComment());		//내용 재세팅
						workVO.setImportance(result.get(0).getImportance());
						workVO.setPriv(result.get(0).getPriv());
						workVO.setMajor(result.get(0).getMajor());
						workVO.setMemoType(result.get(0).getMemoType());
						workVO.setTmDt(result.get(0).getTmDt());
						workVO.setTmDtTime(result.get(0).getTmDtTime());
						workVO.setRgId(result.get(0).getRgId());
						workVO.setUpId(loginUser.getId());
					}
					
					slist.add(result.get(i).getName());				//참여자 추가
				}
				
		
				//비밀글 전달을 할때(최초글 입력이 아닌타이밍때)
				if(!"N".equals(workVO.getSubMemo()) && "Y".equals(workVO.getPriv())){
					workVO.setComment((String) workDAO.selectEncrypt(workVO));
				}
				
				for(int i=0;i<arr.length;i++){
					if(!"".equals(arr[i])){
						//이미 참여자로 등록된 사람이면
						if(slist.contains(arr[i])) continue;		//skip		//rgNm.equals(arr[i]) 
						workVO.setMemoSndName(arr[i]);
						
						try{
							
							cnt = workDAO.insertMemo(workVO);							
			
							if("sms".equals(workVO.getSMSTitle())){
								workVO.setCategoryType("1");			//1:업무보고 에서 등록한 SMSLOG 정보
								smsCnt = workDAO.insertSMS(workVO);
							}
														
							
							//----------- 메모유형 '업무요청(00040)' or '승인요청(00030)' 시 업무일지 에도 등록되도록(체크시) :S ----------
							if(("00030".equals(workVO.getMemoType()) || "00040".equals(workVO.getMemoType())) && "Y".equals(workVO.getAlsoDailyWork())){
								workVO.setName(arr[i]);
								String ttl = "[";
								if("00030".equals(workVO.getMemoType())) ttl += "승인요청-";
								if("00040".equals(workVO.getMemoType())) ttl += "업무요청-";
								int len = workVO.getComment().length();
								int rlen = Integer.parseInt(workVO.getCommentFirstNewLineIndex());								
								if(rlen>0 && rlen<30)
									len = rlen;
								else
									len = (len > 30)?30:len;
								workVO.setTitle(ttl + loginUser.getName() + "] " + workVO.getComment().substring(0, len));
								workVO.setNote(workVO.getComment());
								workVO.setBsnsRecPrivate("1");
								
								workDAO.insertBusinessRecord(workVO);
							}
							//----------- 메모유형 '업무요청' or '승인요청' 시 업무일지 에도 등록되도록(체크시) :E ----------
							
						}catch(Exception e){
							LOG.error(e);
							e.printStackTrace();
						}
					}//if
				}//for
		
				
				
				//------- 푸쉬 세팅 :S -----------
				try{
					String sabunList = workVO.getMemoSndSabun();
					String commentReal = workVO.getComment();
					if(!"".equals(sabunList)){
						Map pushMap = new HashMap();
						
						pushMap.put("pushType",		PushVO.ptMemo);
						pushMap.put("sabunList",	sabunList);
						pushMap.put("pushTypeId", 	workVO.getMainSnb());
						pushMap.put("content", 		"[업무메모]"+rgNm+":"+( commentReal.length() >70 ? commentReal.substring(0,70) : commentReal));
						pushMap.put("rgUserId", 	loginUser.getStaffSnb());
						
						pushService.insertPushLogSearchSabunList(pushMap);
					
					}
					
				}catch(Exception e){					
				}
				//------- 푸쉬 세팅 :E -----------
				
				
		
				model.addAttribute("saveCnt", cnt);
				viewPrivateWork(request, session, workVO, loginVO, model);
		//		return "work/PrivateWorkView";
				//return returnPage;
				
				
				AjaxResponse.responseAjaxSave(response, cnt);		//결과전송
				
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	/**
	 * 메모 수정
	 * @MethodName : modifyMemo
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyMemo.do")
	public String modifyMemo(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());
		model.addAttribute("focus", workVO.getTmDt().substring(8,10));

		int cnt = 0;
		try{
			cnt = workDAO.updateMemo(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.updateMemo^_^"+workVO.getsNb());
			cnt = workDAO.updateSendedMemo(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.updateSendedMemo^_^"+workVO.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("updateCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		return "work/PrivateWorkView";
	}
	
	
	/**
	 * 메인화면 메모보내기
	 * @MethodName : insertMainNewMemo
	 * @param request
	 * @param session
	 * @param wvo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/insertMainNewMemo.do")
	public String insertMainNewMemo(HttpServletRequest request,
			HttpSession session,
			WorkVO wvo,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		wvo.setRgId(loginUser.getId());

		cal.setTime( new Date(System.currentTimeMillis()) );
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format( cal.getTime() );
		wvo.setTmDt(date);

		if("N".equals(wvo.getSubMemo())){
			wvo.setMainSnb("0");
		}
		try{
			//입력자 메모에 저장
			workDAO.insertMainMemoNreturnSnb(wvo);
			LOG.debug(loginUser.getId()+"^_^workDAO.insertMainMemoNreturnSnb");

			if(wvo.getMainSnb().length()>0){
				//전달하고자 하는 사람 메모 저장
				wvo.setSttsCd("00001");
				workDAO.insertMemo(wvo);
				LOG.debug(loginUser.getId()+"^_^workDAO.insertMemo");
			}

		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "basic/result";
	}

	/**
	 * 메모 답장 기능
	 * @MethodName : insertReply
	 * @param request
	 * @param session
	 * @param workVO
	 * @param loginVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/insertReply.do")
	public String insertReply(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			LoginVO loginVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());
		workVO.setArrayName(workVO.getMemoSndName().split(","));
		String[] arr = workVO.getArrayName();
//		model.addAttribute("result", workVO.getFocus());

		if("".equals(workVO.getMemoSndName())){
			//viewPrivateWork(request, session, workVO, loginVO, /*loginVO,*/ model);
			return "work/PrivateWorkView";
		}
		if("".equals(workVO.getMainSnb()) || "0".equals(workVO.getMainSnb())){
			return "work/PrivateWorkView";
		}
		workVO.setTmDt(workVO.getChoice_year()+workVO.getChoice_month()+workVO.getDay());
		
		if(Integer.parseInt(workVO.getRepSnb()) == 0)	//내가 최초작성자인 글에 내가 댓글달때
			workVO.setSttsCd("00002");		//댓글을 읽음상태로(최초작성자에게만 해당하는 읽음상태값이므로)
		else
			workVO.setSttsCd("00001");		//댓글을 안읽음상태로(최초작성자에게만 해당하는 읽음상태값이므로)
		
		int cnt = 0;
		
		
		for(int i=0;i<arr.length;i++){
			workVO.setMemoSndName(arr[i]);

			try{
				cnt = workDAO.insertReply(workVO);

				workVO.setSttsCd("00001");		//IB_COMMENT 변경일때는 '00001'
				workDAO.modifySttsCd(workVO);
				
				workVO.setCategoryCd("00005");
				workDAO.deleteMaintableCheck(workVO);
				
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
		}
		
		
		//------- 푸쉬 세팅 :S -----------
		try{
			
			Map p = new HashMap();
			p.put("memoSnb", workVO.getMainSnb());
			p.put("all", "Y");
			
			Map commentInfo = workMemoService.getInfoForSendSms(p);				//최초글 정보
			String entryUserStr = commentInfo.get("entryUserList").toString();
			
			
			if(!entryUserStr.equals("")){
						
				String orgComment = commentInfo.get("orgComment").toString();
				String commentReal = workVO.getComment();
						
				String content = "[메모댓글]"+(orgComment.length() >10 ? orgComment.substring(0,10)+".." : orgComment)
								+"("+(commentInfo.get("tmDt").toString()).replaceAll("-", ".")+")의 댓글 "
								+loginUser.getName()+":"+ ( commentReal.length() >40 ? commentReal.substring(0,40) : commentReal);
						
				Map pushMap = new HashMap();
						
				pushMap.put("pushType", 	PushVO.ptMemoComment);
				pushMap.put("sabunList", 	entryUserStr);
				pushMap.put("pushTypeId", 	workVO.getsNb());
				pushMap.put("content", 		content);
				pushMap.put("rgUserId", 	loginUser.getStaffSnb());
						
						
				pushService.insertPushLogSearchSabunList(pushMap);
			}
		}catch(Exception e){
		}
		//------- 푸쉬 세팅 :E -----------
		
		
		try{
		
			/** sms */		 
			arr = workVO.getStaffNmForSms().split(",");
			int smsCnt = 0;
			if(workVO.getComment().length() > 80) workVO.setSMSType("5");//3-단문문자, 5-LMS(장문문자), 6-MMS(이미지포함문자)
			else workVO.setSMSType("3");
			for(int i=0;i<arr.length;i++){
				workVO.setMemoSndName(arr[i]);
				if("sms".equals(workVO.getSMSTitle())){
					//문자발송 저장
					smsCnt = workDAO.insertSMS(workVO);
				}
			}
			
			String returnPage = "basic/result";
			if(smsCnt>0){			
			
				List<WorkVO> rsltSMS = null;
				UtilReplaceTag rpTag = new UtilReplaceTag();
				try{
					rsltSMS = workDAO.selectSMSReply(workVO);
				}catch(Exception e){
					LOG.error(e);
					e.printStackTrace();
				}
				rsltSMS.get(0).setSMSContent(rpTag.ReplaceTag(rsltSMS.get(0).getSMSContent(),"decode"));
				model.addAttribute("resultSMS", rsltSMS);
	
	
				returnPage = "basic/result_SMS";
				model.addAttribute("SMSType",rsltSMS.get(0).getSMSType());
				model.addAttribute("SMSToNum",rsltSMS.get(0).getSMSToNum());
				model.addAttribute("SMSContent",rsltSMS.get(0).getSMSContent());
				model.addAttribute("SMSFromNum",rsltSMS.get(0).getSMSFromNum());
				model.addAttribute("SMSReserTime",rsltSMS.get(0).getSMSReserTime());
				model.addAttribute("SMSSeq",rsltSMS.get(0).getSMSSeq());
				model.addAttribute("smsOK","SMSreturnValueOK");
				
			}		
			
			
			
			model.addAttribute("saveCnt", cnt);		
			//return "basic/result";
			return returnPage;
		
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}

	/**
	 * 다른 사람이 전달한 메모확인
	 * @MethodName : checkMemo
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/checkMemo.do")
	public String checkMemo(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model) throws Exception{

//		System.out.println("---note:"+workVO.getNote());
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());
		model.addAttribute("result", workVO.getFocus());

		int cnt = 0;
		try{
			cnt = workDAO.checkMemo(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.checkMemo^_^"+workVO.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("updateCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		return "basic/result";
	}
	
	
	/**
	 * 다른 사람이 답장한 메모확인
	 * @MethodName : checkReply
	 * @param request
	 * @param session
	 * @param loginVO
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/checkReply.do")
	public String checkReply(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model) throws Exception{

//		System.out.println("---note:"+workVO.getNote());
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());
		model.addAttribute("result", workVO.getFocus());

		int cnt = 0;
		try{
			cnt = workDAO.checkReply(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.checkReply^_^"+workVO.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("updateCnt", cnt);

		return "basic/result";
	}

	
	/**
	 * 메모 답장 수정
	 * @MethodName : modifyReply
	 * @param request
	 * @param session
	 * @param loginVO
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyReply.do")
	public String modifyReply(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());
		model.addAttribute("result", workVO.getFocus());

		int cnt = 0;
		try{
			cnt = workDAO.updateReply(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.updateReply^_^"+workVO.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("updateCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		return "basic/result";
	}

	/**
	 * 메모 삭제
	 * @MethodName : deleteMemo
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/deleteMemo.do")
	public String deleteMemo(HttpServletRequest request,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		WorkVO checkInfo = workDAO.checkMemoOpened(workVO);
		if(Integer.parseInt(checkInfo.getReadCnt()) > 0 || Integer.parseInt(checkInfo.getReplyCnt()) > 0){
			model.addAttribute("result", "opened");	//이미 읽은 글
			
		}else{
			
			int cnt = workDAO.deleteMemo(workVO);
			workDAO.deleteSubMemo(workVO);
			
			model.addAttribute("deleteCnt", cnt);
			model.addAttribute("message", MessageSource.getMessage("success.common.delete"));
	
			model.addAttribute("result", workVO.getFocus());
		}
		
		return "basic/result";		
	}
	/**
	 * 메모 답장 삭제
	 * @MethodName : deleteReply
	 * @param request
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/deleteReply.do")
	public String deleteReply(HttpServletRequest request,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
//		System.out.println("---snb:"+workVO.getsNb());

		int cnt = workDAO.deleteReply(workVO);
		LOG.debug(loginUser.getId()+"^_^workDAO.deleteReply^_^"+workVO.getsNb());
		model.addAttribute("deleteCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.delete"));

		return "work/PrivateWorkView";
	}

/*******************************************************************************************************************************/
/*******************************************************************************************************************************/


	/**
	 * 딜업무 전체딜
	 * @MethodName : selectWorkAllDeal
	 * @param request
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectWorkAllDeal.do")
	public String selectWorkAllDeal(HttpServletRequest request,
			WorkVO workVO,
			HttpSession session,
			ModelMap model,
			@RequestParam Map<String,String> map) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());
		String tab = workVO.getSorting();
		String search = workVO.getSearch();
		model.addAttribute("ttT", workVO.getTotal());
		model.addAttribute("searchName", search);
		model.addAttribute("selectUser", workVO.getSelectUser());

		try{
			model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(workVO.ccdCateCd));	//public final String ccdCateCd = "00005";

			//탭 리스트 반환
			List<ComCodeVO> cmvo = cmm.CommonCdList(workVO.ccdTabCd, loginUser.getId());
			//전체 탭을 위해 추가 ---
			ComCodeVO allv = new ComCodeVO();
			allv.setdTailCd("00000");		//전체
			allv.setCdNm("전체");
			cmvo.add(0, allv);
			model.addAttribute("cmmCdAllDealTabList", cmvo);

			//탭 선택없는 기본 화면 로딩시(탭 첫번째 세팅)
			if(tab.length()==0){
				tab = cmvo.get(0).getdTailCd();
				if(Integer.parseInt(tab)<8){
					tab = "00001";
				}
			}//유형별로 쿼리날리기위한 조건추가
			
			if(!"SYNERGY".equals(loginUser.getDivision())){
				if(tab.equals("00001")){	
					//SYNERGY가 아닌 사용자의 디폴트 탭 설정(탭선택 안했을때 : 딜제안중)
					tab = "00002";
				}
			}
			
			
			//메자닌 비상장도 볼 권한이 없는 사람은 기본화면이 프리IPO로 열리도록
			if("N".equals(loginUser.getMezzN())){
				if(tab.equals("00001")){
					tab = "00005";
				}
			}
			

			//전체 검색시에는 선택되는 탭이 없으므로 0으로 세팅.
			if(search.length()!=0) 
				model.addAttribute("TAB", "0");
			else
				model.addAttribute("TAB", tab);			
					
			/*
				TAB 클릭 시 전달받은 변수 
				'var tab=WorkVO.sorting'을 통해 
				실제 IB_OFFER.CATEGORY_CD와 매핑해준다.

				검색어가 있는 경우 전체에서 검색하여 아래 sorting부분이 필요없음.
				
				탭정보는 IB_COMON_CODE.MENU_CD = 00021 (ORDER BY CD_SORT2)
				IB_OFFER.CATEGORY_CD는 IB_COMMON_CODE.MENU_CD = '00005' 이므로
				아래와 같은 매핑 처리가 필요하다.
			
				TAB: 00001 인 경우 메자닌_상장
					- CATEGORY_CD(0001,0002,0003,00015) && WORKVO.LISTED != 'N'
				TAB: 00002인 경우 딜제안중
					- MIDDLE_OFFER_CD(00004(제안중-중개),00005(제안중-직접)) && ALL IB_OFFER.CATEGORY_CD
				TAB: 00003인 경우 블록딜
					- CATEGORY_CD(00004,00005,00006,00007)
				TAB: 00004인 경우 메자닌_비상장
					- CATEGORY_CD(0001,0002,0003,00015) && WORKVO.LISTED == 'N'	
				TAB: 00005인 경우 Pre_IPO
					- CATEGORY_CD(00012)
				TAB: 00006인 경우 벤처
					- CATEGORY_CD(00016)
				TAB: 00007인 경우 M&A
					- CATEGORY_CD(00008)
				TAB: 00008D인 경우 스팩
					- CATEGORY_CD(00013)				
			*/
			if("00001".equals(tab)){ 			//메자닌_상장
				workVO.setSorting("00001");
				workVO.setListed("Y");
			}else if("00002".equals(tab)){		//딜 제안중
				workVO.setMiddleOfferCd("00004");
				workVO.setSorting("null");
			}else if("00004".equals(tab)){		//메자닌_비상장
				workVO.setSorting("00001");
				workVO.setListed("N");
			}else if("00005".equals(tab)){		//PRE-IPO
				workVO.setSorting("00012");	
			}else if("00006".equals(tab)){		//벤처
				workVO.setSorting("00016");
			}else if("00007".equals(tab)){		//M&A
				workVO.setSorting("00008");
				model.addAttribute("cmmCdMnaPgCdList", cmm.CommonCdList("00016"));
			}else if("00008".equals(tab)){		//스팩
				workVO.setSorting("00013");
			}else if("00000".equals(tab)){		//전체
				model.addAttribute("cmmCdMnaPgCdList", cmm.CommonCdList("00016"));		//전체 탭에서 M&A 진행사항 표기 위해 추가
			}else if("00009".equals(tab)){		//바이오/헬스케어
				workVO.setSorting("00017");
			}else{ //그 이외에
				workVO.setSorting(tab);
			}
			
			if(workVO.getChoice_year().equals("")){
				cal.setTime( new Date(System.currentTimeMillis()) );
				String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
				workVO.setChoice_year(date.substring(0, 4));
			}
			model.addAttribute("choice_year", workVO.getChoice_year());

			workVO.setChoice_yearS( Integer.toString( Integer.parseInt(workVO.getChoice_year())-1) );
			workVO.setChoice_monthS("01");
			workVO.setChoice_month("12");
			if("statsPrivateList".equals(workVO.getTmpNum2()) ) workVO.setTmpNum2("");

			//division 정보 포함 전달
			workVO.setDivision(loginUser.getDivision());
			
			
			if("Y".equals(map.get("toMain"))){		//메인에서
				model.addAttribute("offerList5", workDAO.selectOfferAllDealList(workVO));		//리스트 조회
				
			}else{									//딜 화면에서
				model.addAttribute("offerList", workDAO.selectOfferAllDealList(workVO));		//리스트 조회
			}
			
			
			HashMap param = new HashMap();
			param.put("searchType",	"analYn");
			param.put("division", 	"SYNERGY");
			param.put("deptOrder",	"N");
			
			List<Map> list = commonService.getStaffListNameSort(param);
			HashMap my = new HashMap();
			my.put("staffSnb",	loginUser.getStaffSnb());
			my.put("usrNm", 	"★MY");
			list.add(0, my);	//첫번째에 추가
			
			model.addAttribute("analUserList", list);		//분석자 리스트 bs_user_profile.anal_yn = 'Y'
			
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		
		String returnUrl = "";
		if("Y".equals(map.get("toMain"))){		//메인에서
			returnUrl = "basic/include/allDealMain_INC";
			
		}else{									//딜 화면에서
			returnUrl = "deal/AllDeal";
		}
				
		return returnUrl;
	}

	
	/**
	 * 중개 제안 페이지
	 * @MethodName : sendDeal
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	@RequestMapping(value="/work/selectWorkMediateDealS.do")
	public String selectWorkMediateDealS(HttpServletRequest request,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

//		System.out.println("---note:"+workVO.getNote());
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";

		workVO.setOfferCd("00006");//제안
		workVO.setMiddleOfferCd("00001");//중개

		List<WorkVO> result = null;
		try{
			result = workDAO.selectOfferList(workVO);
		}catch(Exception e){
			LOG.error(e);
			System.out.println("---error\n---error:"+e);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		model.addAttribute("offerList", map.get("resultList"));

		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(workVO.ccdCateCd));
		model.addAttribute("cmmCdFeedbackList", cmm.CommonCdList("00007"));
		model.addAttribute("middleT", "중개");

		return "work/deal/DealSend";
	}
	*/
	/**
	 * 직접발굴 제안
	 * @MethodName : selectWorkDirectDealS
	 * @param request
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectWorkDirectDealS.do")
	public String selectWorkDirectDealS(HttpServletRequest request,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		model.addAttribute("ttT", workVO.getTotal());

		workVO.setOfferCd("00006");//제안
		workVO.setMiddleOfferCd("00002");//직접발굴

		if(workVO.getChoice_year().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );

			workVO.setChoice_year(date.substring(0, 4));
			//System.out.println(date);
		}
		model.addAttribute("choice_year", workVO.getChoice_year());
		workVO.setChoice_monthS("01");
		workVO.setChoice_month("12");

		List<WorkVO> result = null;
		try{
			result = workDAO.selectOfferList(workVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		model.addAttribute("offerList", map.get("resultList"));

		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(workVO.ccdCateCd));
		model.addAttribute("cmmCdFeedbackList", cmm.CommonCdList("00007"));
		model.addAttribute("middleT", "직접발굴");

		return "work/deal/DealSend";
	}
	/**
	 * 딜 유형중 mna만 따로
	 * @MethodName : selectWorkMnaDeal
	 * @param request
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectWorkMnaDeal.do")
	public String selectWorkMnaDeal(HttpServletRequest request,
			WorkVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		model.addAttribute("ttT", vo.getTotal());

		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(vo.ccdCateCd));
		model.addAttribute("cmmCdFeedbackList", cmm.CommonCdList("00007"));

		vo.setCategoryCd("00008");//mna

		if(vo.getChoice_year().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );

			vo.setChoice_year(date.substring(0, 4));
			//System.out.println(date);
		}
		model.addAttribute("choice_year", vo.getChoice_year());
		vo.setChoice_monthS("01");
		vo.setChoice_month("12");

		List<WorkVO> result = null;
		try{
			result = workDAO.selectOfferList(vo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		model.addAttribute("offerList", map.get("resultList"));
		model.addAttribute("middleT", "딜 > M&A");
		model.addAttribute("rqMap", "/work/selectWorkMnaDeal.do");

		return "work/deal/Deal4categoryCd";
	}
	/**
	 * 딜 유형중 프리IPO만 따로
	 * @MethodName : selectWorkIPO
	 * @param request
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectWorkIPO.do")
	public String selectWorkIPO(HttpServletRequest request,
			WorkVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		model.addAttribute("ttT", vo.getTotal());

		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(vo.ccdCateCd));
		model.addAttribute("cmmCdFeedbackList", cmm.CommonCdList("00007"));

		vo.setCategoryCd("00012");//프리IPO

		if(vo.getChoice_year().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );

			vo.setChoice_year(date.substring(0, 4));
			//System.out.println(date);
		}
		model.addAttribute("choice_year", vo.getChoice_year());
		vo.setChoice_monthS("01");
		vo.setChoice_month("12");

		List<WorkVO> result = null;
		try{
			result = workDAO.selectOfferList(vo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		model.addAttribute("offerList", map.get("resultList"));
		model.addAttribute("middleT", "딜 > 프리IPO");
		model.addAttribute("rqMap", "/work/selectWorkIPO.do");

		return "work/deal/Deal4categoryCd";
	}

	/**
	 * 딜 -> MnA 진행자 입력/수정
	 * @MethodName : mnaMatchingStaffs
	 * @param request
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/mnaMatchingStaffs.do")
	public String mnaMatchingStaffs(HttpServletRequest request,
			WorkVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());

		String staffsName = vo.getMemoSndName();
		model.addAttribute("result", staffsName);

		//입력받은 staff_nm 분리
		String[] arr = staffsName.split(",");
		String[] arrMemo = null;
		int idx = 0, sameCnt = 0;
	try{
		//offer_snb로 조회
		List<WorkVO> staffsNm = workDAO.selectOfferMnaStaff(vo);

		if(staffsNm.size()>0){//조회한 data null 아니면
			//조회한 staff_nm 구분자 분리
			String[] arrSel = staffsNm.get(0).getUsrNm().split(",");

			//for문으로 입력받은 진행자와 조회한 진행자 비교 -> 중복N면 메모전송
			int lengArr = arr.length;
			int lengArrSel = arrSel.length;
			arrMemo = new String[arr.length];

			for(int i=0;i<lengArr;i++){
				for(int j=0;j<lengArrSel;j++){
					if(arr[i].equals(arrSel[j])){
						sameCnt++;
					}
				}
				if(sameCnt==1){
					arrMemo[idx++]=arr[i];
					sameCnt = 0;
				}
			}
			//offer_snb로 삭제
			workDAO.deleteOfferMnaStaff(vo);

		}else{
			arrMemo = arr;
		}
		//신규 offer mna staffs 입력
		if(staffsName.length()>0) workDAO.insertOfferMnaStaff(vo);

		//메모전송
		int lengArrMemo = arrMemo.length;
		WorkVO memoVo = new WorkVO();
		String date = new SimpleDateFormat("yyyyMMdd").format( cal.getTime() );
		StringBuffer strB = new StringBuffer();
		strB.append("[M&A 진행자로 지정] 종목: ").append(vo.getCpnNm()).append(" 딜 -> M&A 탭에서 확인바람.");

		memoVo.setTmDt(date);
		memoVo.setComment(strB.toString());
		memoVo.setSttsCd("00001");
		memoVo.setPriv("N");
		memoVo.setMainSnb("0");
		for(int m = 0; m<lengArrMemo; m++){
			memoVo.setMemoSndName(arrMemo[m]);
			workDAO.insertMemo(memoVo);
			LOG.debug(loginUser.getId()+"^_^workDAO.insertMemo");
		}

	}catch(Exception e){
		// e.printStackTrace();
		throw e;
	}
		return "basic/result";
	}

	
	/**
	 * 통계일(투자결정 기준일) 저장
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 03. 06.
	 */
	@RequestMapping(value = "/work/doSaveInvestDt.do")
	public void doSaveInvestDt(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		
		map.put("rgId", loginUser.getId());
		
		int upCnt = 0;
		
		upCnt = workService.doSaveInvestDt(map);
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	

	/**
	 * 피드백 select 옵션 수정
	 * @MethodName : changeFeedback
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/changeFeedback.do")
	public String changeFeedback(HttpServletRequest request,
			WorkVO workVO,
			HttpSession session,
			LoginVO loginVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());

		int cnt = 0;
		try{
			cnt = workDAO.updateFeedback(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.updateFeedback^_^"+workVO.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("updateCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		return "work/deal/DealSend";
	}
	
	
	/**
	 * 진행상황 변경
	 * @MethodName : changeprogressCd
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/changeprogressCd.do")
	public String changeprogressCd(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		workVO.setRgId(loginUser.getId());

		int cnt = 0, cntCus = 0;
		try{
			cnt = workDAO.updateprogressCd(workVO);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		model.addAttribute("updateCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		
		
		//------- 푸쉬 세팅 :S -----------
		try{
			
			//푸시
			Map pushMap = new HashMap();
			
			pushMap.put("pushType",		PushVO.ptDealStatus);
			pushMap.put("pushTypeId",	workVO.getsNb());
			pushMap.put("usrId",		workVO.getUsrId());
			pushMap.put("content",		"[딜 상태] "+workVO.getCpnNm()+" : "+workVO.getProgressNm());
			pushMap.put("rgUserId",		loginUser.getStaffSnb());
			
			if(!"".equals(workVO.getUsrId())) pushService.insertPushLogSearchSabunList(pushMap);
			
		}catch(Exception e){				
		}
		//------- 푸쉬 세팅 :E -----------



		//-------------- 딜 등록자에게 메모 전송 :S -------------
		if(!workVO.getRgNm().equals(loginUser.getName())){		//상태변경자가 딜 등록자 본인인 경우에는 skip 
			
			RecommendVO rcmdVO = new RecommendVO();
			rcmdVO.setMemoSndName(workVO.getRgNm());       //딜 등록자 이름으로
			rcmdVO.setRgId(workVO.getRgId());
			rcmdVO.setMainSnb("0");

			
			rcmdVO.setComment(workVO.getMemo());
			rcmdVO.setPriv("N");

			rcmdVO.setSttsCd("");
			
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMMdd").format( cal.getTime() );
			rcmdVO.setTmDt(date);
			
			workDAO.insertMemo(rcmdVO);
		}
		//-------------- 딜 등록자에게 메모 전송 :E -------------
		
		
		return "work/deal/DealSend";
	}
	
	
	/**
	 * 진행사항 & 매칭회사 수정 (딜 -> mna)
	 * @MethodName : changeprogressCdNmatchCpn
	 * @param request
	 * @param session
	 * @param loginVO
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/changeprogressCdNmatchCpn.do")
	public String changeprogressCdNmatchCpn(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());

		int cnt = 0;
		try{
			cnt = workDAO.updateProgressCdNmatchCpn(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.updateProgressCdNmatchCpn^_^"+workVO.getsNb());
			
			if("00002".equals(workVO.getProgressCd()) ) {
				workDAO.insertMnaMatchCpn(workVO);
				LOG.debug(loginUser.getId()+"^_^workDAO.insertMnaMatchCpn^_^"+workVO.getsNb());
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("updateCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		return "work/deal/DealSend";
	}

	/**
	 * 매칭회사 삭제
	 * @MethodName : delMnaMatchCpn
	 * @param request
	 * @param session
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : chan
	 * @since : 2015. 3. 31.
	 */
	@RequestMapping(value="/work/delMnaMatchCpn.do")
	public String delMnaMatchCpn(HttpServletRequest request,
			HttpSession session,
			WorkVO vo,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		int cnt = 0;
		try{
			cnt = workDAO.deleteMnaMatchCpn(vo);
			LOG.debug(loginUser.getId()+"^_^workDAO.deleteMnaMatchCpn^_^"+vo.getsNb());
			
		}catch(Exception e){
			e.printStackTrace();
			LOG.error(e);
		}
		model.addAttribute("result", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		return "basic/result";
	}
	
	/**
	 * 제안 메모 수정
	 * @MethodName : modifyDealMemo
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyDealMemo.do")
	public String modifyDealMemo(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());

		int cnt = workDAO.updateDealMemo(workVO);
		LOG.debug(loginUser.getId()+"^_^workDAO.updateDealMemo^_^"+workVO.getsNb());

		if("rcmdSendMemo".equals(workVO.getTmpNum1())){
			if(Integer.parseInt(workVO.getProgressCd())<3){
				// Calendar cal = Calendar.getInstance();
				cal.setTime( new Date(System.currentTimeMillis()) );
				String date = new SimpleDateFormat("yyyyMMdd").format( cal.getTime() );

				workVO.setTmDt(date);
				workVO.setMemoSndName(workVO.getRgNm());
				workVO.setComment("[추천] 종목:"+workVO.getCpnNm()+" - "+workVO.getSubMemo());
				workVO.setSttsCd("00001");
				workVO.setPriv("N");
				workVO.setMainSnb("0");
				try{
					workDAO.insertMemo(workVO);
					LOG.debug(loginUser.getId()+"^_^workDAO.insertMemo");
				}catch(Exception e){
					LOG.error(e);
					e.printStackTrace();
				}
			}
		}

		//고객관리시스템
/*
		if(workVO.getCstId().length() != 0){
			CusBasicConnectVO cusVO = new CusBasicConnectVO();
			cusVO.setCusEtc(workVO.getCstNm()+"\n"+workVO.getMemo());
			cusVO.setS_Nb(workVO.getCstId());
			cusVO.setCusNm(null);
			int cntCus = workDAO.updateCusBasic(cusVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.updateCusBasic");
		}
*/
		model.addAttribute("updateCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		return "work/deal/DealSend";
	}
	
	
	/**
	 * 성과/중요도 & 투자의견
	 * @MethodName : modifyDealResult
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyDealResult.do")
	public String modifyDealResult(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		workVO.setRgId(loginUser.getId());
		workVO.setName(loginUser.getName());

		int cnt = workDAO.updateDealResult(workVO);
		
		
		
		//------- 푸쉬 세팅 :S -----------
		try{
			
			//푸시
			Map pushMap = new HashMap();
			
			pushMap.put("pushType",		PushVO.ptDealOpinion);
			pushMap.put("pushTypeId",	workVO.getsNb());
			pushMap.put("usrId",		workVO.getUsrId());
			pushMap.put("content",		"[투자의견]"+workVO.getCpnNm()+"-"+workVO.getRgNm()+":::"+workVO.getOpinion());
			pushMap.put("rgUserId",		loginUser.getStaffSnb());
			
			if(!"".equals(workVO.getUsrId())) pushService.insertPushLogSearchSabunList(pushMap);
			
		}catch(Exception e){				
		}
		//------- 푸쉬 세팅 :E -----------
		
		
		
		if(true){
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMMdd").format( cal.getTime() );

			workVO.setTmDt(date);
			workVO.setSttsCd("00001");
			if(workVO.getOpinion().length()>0){
				try{
					workDAO.insertMemoOfDealResult(workVO);
		
				}catch(Exception e){
					LOG.error(e);
					e.printStackTrace();
				}
			}

		}
		model.addAttribute("updateCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		return "work/deal/DealSend";
	}
	/**
	 * 기한 수정
	 * @MethodName : modifyDueDate
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyDueDate.do")
	public String modifyDueDate(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());

		int cnt = workDAO.updateDueDate(workVO);
		LOG.debug(loginUser.getId()+"^_^workDAO.updateDueDate^_^"+workVO.getsNb());
		model.addAttribute("updateCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		return "work/deal/DealSend";
	}

	/**
	 * 중개 제안받은딜현황
	 * @MethodName : receiveDeal
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectWorkMediateDealR.do")
	public String selectWorkMediateDealR(HttpServletRequest request,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		model.addAttribute("ttT", workVO.getTotal());

		workVO.setOfferCd("00007");//받은제안
		workVO.setMiddleOfferCd("00001");//중개

		//int mon = 0;
		if(workVO.getChoice_year().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );

			workVO.setChoice_year(date.substring(0, 4));
			//mon = Integer.parseInt(date.substring(4, 6));
		}
		model.addAttribute("choice_year", workVO.getChoice_year());

		workVO.setChoice_monthS("01");
		workVO.setChoice_month("12");

		List<WorkVO> result = null;
		try{
			result = workDAO.selectOfferList(workVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("offerList", result);

		model.addAttribute("cmmCdProgressList", cmm.CommonCdList(workVO.ccdPrgressCd));
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(workVO.ccdCateCd));
		model.addAttribute("cmmCdFeedbackList", cmm.CommonCdList("00007"));
		model.addAttribute("middleT", "중개");

		return "work/deal/DealReceive";
	}
	/**
	 * 직접발굴 제안받은딜현황
	 * @MethodName : selectWorkDirectDealS
	 * @param request
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping(value="/work/selectWorkDirectDealR.do")
	public String selectWorkDirectDealR(HttpServletRequest request,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";

		workVO.setOfferCd("00007");//받은제안
		workVO.setMiddleOfferCd("00002");//직접발굴

		List<WorkVO> result = null;
		try{
			result = workDAO.selectOfferList(workVO);
		}catch(Exception e){
			LOG.error(e);
			System.out.println("---error\n---error:"+e);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		model.addAttribute("offerList", map.get("resultList"));

		model.addAttribute("cmmCdProgressList", cmm.CommonCdList(workVO.ccdPrgressCd));
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(workVO.ccdCateCd));
		model.addAttribute("cmmCdFeedbackList", cmm.CommonCdList("00007"));
		model.addAttribute("middleT", "직접발굴");

		return "work/deal/DealReceive";
	}*/
/*******************************************************************************************************************************/
	/**
	 * M&A
	 * @MethodName : selectMna
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectWorkMnA.do")
	public String selectMna(HttpServletRequest request,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		workVO.setOfferCd("00007");//받은제안
		workVO.setCategoryCd("00007");//M&A

		List<WorkVO> result = null;
		List<WorkVO> comment = null;
		try{
			result = workDAO.selectOfferList(workVO);
			comment = workDAO.selectCommentMnaList(workVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		model.addAttribute("offerList", map.get("resultList"));

		map.put("commentList", comment);
		model.addAttribute("commentList", map.get("commentList"));

		model.addAttribute("cmmCdDecisionList", cmm.CommonCdList("00008"));
		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00009"));

		return "work/deal/MnA";
	}

	/**
	 * 회사 찾기 팝업
	 * @MethodName : popUpCpn
	 * @param request
	 * @param workVO
	 * @param companyVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/popUpCpn.do")
	public String popUpCpn(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			CompanyVO companyVO,
			ModelMap model) throws Exception{

//		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
//		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//        LOG.info(loginUser.getId()+"^_^"+workVO.getCpnNm());
		
		int totCnt = 0;
		List<CompanyVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
        PaginationInfo paginationInfo = new PaginationInfo();
        model.addAttribute("searchName", workVO.getCpnNm());
        model.addAttribute("MDf", workVO.getModalFlag());
        model.addAttribute("MDn", workVO.getModalNum());

        //System.out.println(companyVO.getPageIndex());

        paginationInfo.setCurrentPageNo(companyVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(15);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(5);//페이징 리스트의 사이즈

        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
		companyVO.setFirstIndex(firstRecordIndex);
		companyVO.setRecordCountPerPage(recordCountPerPage);

		try{
			result = companyDAO.selectCompanyList(companyVO);
			totCnt = companyDAO.selectCompanyListCnt(companyVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		map.put("resultList", result);
		model.addAttribute("companyList", map.get("resultList"));

        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

		return "work/popUp/PopUpCpn";
	}
	/**
	 * 팝업 실시간 회사검색
	 * @MethodName : ajaxPopUpCpnSearchName
	 * @param request
	 * @param workVO
	 * @param companyVO
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 2. 9.
	 */
	@RequestMapping(value="/work/ajaxPopUpCpnSearchName.do")
	public String ajaxPopUpCpnSearchName(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			CompanyVO companyVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
        LOG.info(loginUser.getId()+"^_^"+workVO.getCpnNm());
		
		int totCnt = 0;
		List<CompanyVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
        PaginationInfo paginationInfo = new PaginationInfo();
        model.addAttribute("searchName", workVO.getCpnNm());
        model.addAttribute("MDf", workVO.getModalFlag());
        model.addAttribute("MDn", workVO.getModalNum());

        //System.out.println(companyVO.getPageIndex());

        paginationInfo.setCurrentPageNo(companyVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(15);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(5);//페이징 리스트의 사이즈

        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
		companyVO.setFirstIndex(firstRecordIndex);
		companyVO.setRecordCountPerPage(recordCountPerPage);

		try{
			result = companyDAO.selectCompanyList(companyVO);
			totCnt = companyDAO.selectCompanyListCnt(companyVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		map.put("resultList", result);
		model.addAttribute("companyList", map.get("resultList"));

        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

		return "includeJSP/PopUpCpn";
	}
	/**
	 * 사람 찾기 팝업
	 * @MethodName : popUpCst
	 * @param request
	 * @param workVO
	 * @param personVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/popUpCst.do")
	public String popUpCst(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			PersonVO personVO,
			ModelMap model) throws Exception{

//		업무일지 기입시 회사 선택한 후 사람선택시 해당 회사 사람만 소팅하기 위한 부분
//		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
//		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//        LOG.info(loginUser.getId()+"^_^"+workVO.getCstNm());

		int totCnt = 0;
		List<PersonVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
        PaginationInfo paginationInfo = new PaginationInfo();
        model.addAttribute("searchName", workVO.getCstNm());
        model.addAttribute("MDf", workVO.getModalFlag());
        model.addAttribute("MDn", workVO.getModalNum());
        model.addAttribute("sortTitle", workVO.getSort_t());


        paginationInfo.setCurrentPageNo(personVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(15);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(5);//페이징 리스트의 사이즈

        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
		personVO.setFirstIndex(firstRecordIndex);
		personVO.setRecordCountPerPage(recordCountPerPage);

		if(personVO.getCpnNm() != null && personVO.getCpnNm().length() != 0) model.addAttribute("YN", "Y");

		
		Object param1 = request.getParameter("f");
		Object param2 = request.getParameter("snb");
		if(param1 != null && param2 != null){
			if("ceo".equals((String)param1)){
				personVO.setCstNm((String)param2);
				personVO.setCstNmKor((String)param2);
			}
		}
		

		try{
			result = personDAO.selectPersonList(personVO);
			totCnt = personDAO.selectPersonListCnt(personVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		map.put("resultList", result);
		model.addAttribute("cstList", map.get("resultList"));

		paginationInfo.setTotalRecordCount(totCnt); //전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);

		return "work/popUp/PopUpCst";
	}

	/**
	 * 팝업 실시간 인물검색
	 * @MethodName : ajaxPopUpCstSearchName
	 * @param request
	 * @param workVO
	 * @param personVO
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 2. 9.
	 */
	@RequestMapping(value="/work/ajaxPopUpCstSearchName.do")
	public String ajaxPopUpCstSearchName(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			PersonVO personVO,
			ModelMap model) throws Exception{

//		업무일지 기입시 회사 선택한 후 사람선택시 해당 회사 사람만 소팅하기 위한 부분
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
        LOG.info(loginUser.getId()+"^_^"+workVO.getCstNm());
		
		int totCnt = 0;
		List<PersonVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
        PaginationInfo paginationInfo = new PaginationInfo();
		
        model.addAttribute("searchName", workVO.getCstNm());
        model.addAttribute("MDf", workVO.getModalFlag());
        model.addAttribute("MDn", workVO.getModalNum());
        model.addAttribute("sortTitle", workVO.getSort_t());


        paginationInfo.setCurrentPageNo(personVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(15);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(5);//페이징 리스트의 사이즈

        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
		personVO.setFirstIndex(firstRecordIndex);
		personVO.setRecordCountPerPage(recordCountPerPage);

		if(personVO.getCpnNm() != null && personVO.getCpnNm().length() != 0) model.addAttribute("YN", "Y");

		try{
			result = personDAO.selectPersonList(personVO);
			totCnt = personDAO.selectPersonListCnt(personVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		map.put("resultList", result);
		model.addAttribute("cstList", map.get("resultList"));

		paginationInfo.setTotalRecordCount(totCnt); //전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);

		return "includeJSP/PopUpCst";
	}

	/**
	 * mna 진행사항 입력
	 * @MethodName : insertCommentMna
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/insertCommentMna.do")
	public String insertCommentMna(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());

		int cnt = 0;
		try{
			cnt = workDAO.insertCommentMna(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.insertCommentMna");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);

		return "work/deal/MnA";
	}
	/**
	 * mna 진행사항 수정
	 * @MethodName : updateCommentMna
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/updateCommentMna.do")
	public String updateCommentMna(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());

		int cnt = 0;
		try{
			cnt = workDAO.updateCommentMna(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.updateCommentMna^_^"+workVO.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);

		return "work/deal/MnA";
	}
	/**
	 * 진행상태 수정
	 * @MethodName : updatePrecessResult
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/updatePrecessResult.do")
	public String updatePrecessResult(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());

		int cnt = 0;
		try{
			cnt = workDAO.updatePrecessResult(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.updatePrecessResult^_^"+workVO.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("updateCnt", cnt);

		return "work/PrivateWorkView";
	}

	/**
	 * 회사 등록화면
	 * @MethodName : rgstCpn
	 * @param companyVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/work/popRgstCpn.do")
	public String rgstCpn(@ModelAttribute("companyVO") CompanyVO companyVO,
							HttpSession session,
							ModelMap model,
							@RequestParam Map<String,String> map){

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		//System.out.println("===========등록할 회사이름:"+companyVO.getSearchCpnNm()+"==============");
		//List<CompanyVO> result = null;
		List<Map> result = null;
		try{
			//result = companyDAO.selectMaxCpnId(companyVO);
			result = companyDAO.selectMaxCpnIds(map);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		//model.addAttribute("maxCpnId", result.get(0).getCpnId());
		model.addAttribute("maxSeq", result.get(0).get("seq"));
		model.addAttribute("maxASeq", result.get(0).get("aSeq"));
		
		String searchCpnNm = companyVO.getSearchCpnNm();
		
		model.addAttribute("cpnNm", (searchCpnNm==null||"".equals(searchCpnNm))? map.get("searchCpnNm4Reg").toString():searchCpnNm);
		model.addAttribute("MDf", companyVO.getModalFlag());
		model.addAttribute("MDn", companyVO.getModalNum());
		LOG.info(loginUser.getId()+"^_^"+companyVO.getSearchCpnNm());

		return "work/RegistCPN";
	}


	/**
	 * 사람 등록화면
	 * @MethodName : rgstCst
	 * @param companyVO
	 * @param personVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/work/popRgstCst.do")
	public String popRgstCst(@ModelAttribute("personVO") PersonVO personVO,
			HttpSession session,
			ModelMap model){

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		//System.out.println("===========등록할 이름:"+personVO.getSearchCstNm()+"==============");
		model.addAttribute("cstNm", personVO.getSearchCstNm());
		model.addAttribute("MDf", personVO.getModalFlag());
		model.addAttribute("MDn", personVO.getModalNum());
		LOG.info(loginUser.getId()+"^_^"+personVO.getSearchCstNm());
		return "work/RegistCST";
	}

	/**
	 * 다중업로드 등록화면
	 * @MethodName : multiUploadV
	 * @param personVO
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/work/multiUpload.do")
	public String multiUploadV(@ModelAttribute("personVO") PersonVO personVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model){

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		return "work/popUp/MultiUpload";
	}
	/**
	 * 다중업로드 process
	 * @MethodName : multiUploadProcess
	 * @param request
	 * @param response
	 * @param personVO
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/work/multiUploadProcess.do")
	public String multiUploadProcess(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("personVO") PersonVO personVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model){

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		model.addAttribute("MDn", workVO.getModalNum());
		model.addAttribute("nm", workVO.getTmpNum1());

		String maxSnb = "";
		List<WorkVO> offerVo = null;

		// snb를 알기위해 offer //
		workVO.setOfferCd("00000");
		workVO.setRgId(loginUser.getId());
		workVO.setRgNm(loginUser.getName());

	    try{
			// 정보 받기
			MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;

		    workVO.setTmDt((String)multi.getParameter("tmDt"));
		    workVO.setsNb((String)multi.getParameter("sNb"));
		    workVO.setReportYN((String)multi.getParameter("reportYN"));
		    workVO.setSubCd((String)multi.getParameter("subCd"));

		    if(workVO.getsNb()==null || "".equals(workVO.getsNb())){
		    	workVO.setOfferCd("11111");
			    try{
			    	insertDeal(request,session,workVO,null, model);
			    	// maxSnb 구하기
			    	offerVo = workDAO.selectMaxSnb(workVO);
			    }catch(Exception e){
			    	LOG.error(e);
			    	e.printStackTrace();
			    }
			    maxSnb = offerVo.get(0).getsNb();
			    workVO.setOfferCd("00000");
		    }else{
		    	maxSnb = workVO.getsNb();
		    }

		    FileUpDbVO fileVo = new FileUpDbVO();
		    fileVo.setOfferSnb(maxSnb);
		    fileVo.setReportYN((String)multi.getParameter("reportYN"));
		    fileVo.setFileCategory("00000");//00000:정보정리, 00001: staff사진 ,  00002: 댓글 첨부파일, 00003: 인사관리->이력서파일
		    fileVo.setRgId(loginUser.getId());
		    // 파일업로드 시키기
		    MultiFileUpload mUpload = new MultiFileUpload();
		    mUpload.fileUpload(multi, fileVo, request, workDAO);

	    }catch(Exception e){
	    	LOG.error(e);
	    	e.printStackTrace();
	    }
		model.addAttribute("upload", 1);
		model.addAttribute("maxSnb", maxSnb);


		return "work/popUp/MultiUpload";
	}

	/**
	 *
	 * @MethodName : transDB
	 * @param realName
	 * @param makeName
	 * @param path
	 * @param maxSnb
	 * @param workVO
	 */
	public void transDB(String realName
			,String makeName
			,String path
			,String maxSnb
			,WorkVO workVO){

		FileUpDbVO fileVo = new FileUpDbVO();

//		//System.out.println("------"+a+"------");
		realName.replace(",","_");
		fileVo.setOfferSnb(maxSnb);
		fileVo.setRealName(realName);
		fileVo.setMakeName(makeName);
		fileVo.setPath(path);
		fileVo.setReportYN(workVO.getReportYN());
		fileVo.setRgId(workVO.getRgId());
		fileVo.setFileCategory("00000");//00000:정보정리, 00001: staff사진 ,  00002: 댓글 첨부파일, 00003: 인사관리->이력서파일
		if(workVO.getSubCd()!=null&&!"".equals(workVO.getSubCd())) fileVo.setSubCd(workVO.getSubCd());

		try{
			 workDAO.insertFileInfo(fileVo);
			LOG.debug(workVO.getRgId()+"^_^workDAO.insertFileInfo^_^"+realName);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
	}

	/**
	 * 핵심체크 공통
	 * @MethodName : keyPoint
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/keyPoint.do")
	public String keyPoint(WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		model.addAttribute("ttT", workVO.getTotal());
		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));
		model.addAttribute("cmmCdKeyPointList", cmm.CommonCdList("00018"));		//핵심체크사항 공통코드

		String select = workVO.getSelectInfo();
		if(select==null || "".equals(select)) return "work/PrivateWorkView";

		switch(Integer.parseInt(select)){
			case  8: 	return "redirect:/work/analysisComments.do";		//분석의견	detail_cd:'00008', menu_cd:'00018'
			
			case 11: 	return "redirect:/work/network.do";					//인맥
			
			case  6: 	return "redirect:/work/resource.do";				//운용인재	사용X
			case 12: 	return "redirect:/work/audit.do";					//심사역		사용X
		}

		try{
			if(workVO.getChoice_year().equals("")){
				cal.setTime( new Date(System.currentTimeMillis()) );
				String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
				workVO.setChoice_year(date.substring(0, 4));
			}
			model.addAttribute("choice_year", workVO.getChoice_year());

			workVO.setChoice_monthS("01");
			workVO.setChoice_dayS("01");
			workVO.setChoice_month("12");
			workVO.setChoice_day("31");

			model.addAttribute("financingList", workDAO.selectofferKeyPoint(workVO));	//분석의견을 제외한 모든 핵심체크사항 공통코드 정보
			
			model.addAttribute("keyPointCd", select);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		return "work/keyPointChk/KeyPoint";
	}

	/**
	 * 핵심체크사항 자금조달 페이지
	 * @MethodName : financing
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/financing.do")
	public String financing(WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		model.addAttribute("ttT", workVO.getTotal());
		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));

		List<PersonVO> result = null;

		StaffVO staffVO = new StaffVO();
		model.addAttribute("userList", cmm.UserList(staffVO));

		workVO.setSelectInfo("financing");
		try{
			result = workDAO.selectofferKeyPoint(workVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("financingList", result);

		return "work/keyPointChk/Financing";
	}
	/**
	 * 핵심체크사항 자산운용 페이지
	 * @MethodName : management
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/management.do")
	public String management(WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		List<PersonVO> result = null;

		StaffVO staffVO = new StaffVO();
		model.addAttribute("userList", cmm.UserList(staffVO));

		workVO.setSelectInfo("management");
		try{
			result = workDAO.selectofferKeyPoint(workVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("financingList", result);
		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));

		return "work/keyPointChk/Management";
	}
	/**
	 * 핵심체크사항 M&A 페이지
	 * @MethodName : mna
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/mna.do")
	public String mna(WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		List<PersonVO> result = null;

		StaffVO staffVO = new StaffVO();
		model.addAttribute("userList", cmm.UserList(staffVO));

		workVO.setSelectInfo("mna");
		try{
			result = workDAO.selectofferKeyPoint(workVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("financingList", result);
		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));

		return "work/keyPointChk/MNA";
	}
	/**
	 * 핵심체크사항 실적 페이지
	 * @MethodName : etc
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/etc.do")
	public String etc(WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		List<PersonVO> result = null;

		StaffVO staffVO = new StaffVO();
		model.addAttribute("userList", cmm.UserList(staffVO));

		workVO.setSelectInfo("etc");
		try{
			result = workDAO.selectofferKeyPoint(workVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("financingList", result);
		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));

		return "work/keyPointChk/ETC";
	}
	/**
	 * 핵심체크사항 공유 페이지
	 * @MethodName : share
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/share.do")
	public String share(WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		List<PersonVO> result = null;

		StaffVO staffVO = new StaffVO();
		model.addAttribute("userList", cmm.UserList(staffVO));

		workVO.setSelectInfo("share");
		try{
			result = workDAO.selectofferKeyPoint(workVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("financingList", result);
		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));

		return "work/keyPointChk/Share";
	}

	/**
	 * 워런트/블록딜
	 * @MethodName : warrant
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/warrant.do")
	public String warrant(WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		List<PersonVO> result = null;

		StaffVO staffVO = new StaffVO();
		model.addAttribute("userList", cmm.UserList(staffVO));

		workVO.setSelectInfo("humanNet");
		try{
			result = workDAO.selectofferKeyPoint(workVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("financingList", result);
		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));

		return "work/keyPointChk/HumanNet";
	}
	/**
	 * 핵심체크사항 운용인재 페이지
	 * @MethodName : resource
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/resource.do")
	public String resource(WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		List<WorkVO> result = null;

//		StaffVO staffVO = new StaffVO();
//		model.addAttribute("userList", cmm.UserList(staffVO));
//		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));

		workVO.setSelectInfo("resource");
		model.addAttribute("page", workVO.getPage());

		String returnText = "";
		try{
			if("1".equals(workVO.getPage())){
				result = workDAO.selectResourceDetailList(workVO);
				returnText = "work/keyPointChk/ResourceDetail";
			}else{
				result = workDAO.selectResourceList(workVO);
				returnText = "work/keyPointChk/Resource";
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("financingList", result);
		return returnText;
	}
	/**
	 * 핵심체크사항 인맥 페이지
	 * @MethodName : network
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/network.do")
	public String network(WorkVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		if(vo.getChoice_year().equals("")){
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );

			vo.setChoice_year(date.substring(0, 4));
			//mon = Integer.parseInt(date.substring(4, 6));
		}
		model.addAttribute("choice_year", vo.getChoice_year());

		try{
			List<WorkVO> result = workDAO.selectHumanNet(vo);
			model.addAttribute("financingList", result);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		return "work/keyPointChk/Network";
	}
	/**
	 * 인맥 전체 엑셀로 다운로드
	 * @MethodName : excelNetwork
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/excelNetwork.do")
	public String excelNetwork(WorkVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		try{
			vo.setTmpNum2("excel");
			model.addAttribute("financingList", workDAO.selectHumanNet(vo));
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		return "work/keyPointChk/ExcelDownloadNetwork";
	}
	/**
	 * 핵심체크사항 심사역 페이지
	 * @MethodName : audit
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/audit.do")
	public String audit(WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		List<WorkVO> result = null;

//		StaffVO staffVO = new StaffVO();
//		model.addAttribute("userList", cmm.UserList(staffVO));
//		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));

		workVO.setSelectInfo("audit");
		model.addAttribute("page", workVO.getPage());

		String returnText = "";
		try{
			if("1".equals(workVO.getPage())){
				result = workDAO.selectAuditDetailList(workVO);
				returnText = "work/keyPointChk/AuditDetail";
			}else{
				result = workDAO.selectAuditList(workVO);
				returnText = "work/keyPointChk/Audit";
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("financingList", result);
		return returnText;
	}
	/**
	 * 핵심체크사항 투자관심 페이지
	 * @MethodName : investInte
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/investInte.do")
	public String investInte(WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		List<PersonVO> result = null;

		StaffVO staffVO = new StaffVO();
		model.addAttribute("userList", cmm.UserList(staffVO));

		workVO.setSelectInfo("investInte");
		try{
			result = workDAO.selectofferKeyPoint(workVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("financingList", result);
		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));

		return "work/keyPointChk/InvestInte";
	}
	/**
	 * 핵심체크사항 업황정보 페이지
	 * @MethodName : servey
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/servey.do")
	public String servey(WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		List<PersonVO> result = null;

		StaffVO staffVO = new StaffVO();
		model.addAttribute("userList", cmm.UserList(staffVO));

		workVO.setSelectInfo("servey");
		try{
			result = workDAO.selectofferKeyPoint(workVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("financingList", result);
		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));

		return "work/keyPointChk/Servey";
	}
	/**
	 * 핵심체크사항 메모수정
	 * @MethodName : modifyKeyPointChkMemo
	 * @param request
	 * @param session
	 * @param loginVO
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyKeyPointChkMemo.do")
	public String modifyKeyPointChkMemo(HttpServletRequest request,
			HttpSession session,
			LoginVO loginVO,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());

		int cnt = workDAO.updateKeyPointChkMemo(workVO);
		LOG.debug(loginUser.getId()+"^_^workDAO.updateKeyPointChkMemo^_^"+workVO.getsNb());

		if(true) { //메모전달
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMMdd").format( cal.getTime() );

			workVO.setTmDt(date);
			workVO.setMemoSndName(workVO.getRgNm());
			workVO.setComment(workVO.getTmpNum1());
			workVO.setSttsCd("00001");
			workVO.setMainSnb("0");
			try{
				workDAO.insertMemo(workVO);
				LOG.debug(loginUser.getId()+"^_^workDAO.insertMemo");
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
		}
		model.addAttribute("updateCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		return "work/deal/DealSend";
	}

	/**
	 * 파일 다운로드 포로세스
	 * @MethodName : downloadProcess
	 * @param request
	 * @param response
	 * @param fileVO
	 * @return
	 */
	@RequestMapping(value="/work/downloadProcess.do")
	public void downloadProcess(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			FileUpDbVO fileVO){
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");

		List<FileUpDbVO> fileUp = null;

		try {
			fileUp = workDAO.selectFileInfo(fileVO);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		LOG.debug(loginUser.getId()+"^_^"+fileUp.get(0).getRealName());
		try {
			CpnUploadExcelMapping.doGet(request, response, fileUp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return;
	}
	
	
	/**
	 * 파일 삭제	20151001
	 * @MethodName : downloadProcess
	 * @param request
	 * @param response
	 * @param fileVO
	 * @return
	 */
	@RequestMapping(value="/work/deleteFileOne.do")
	public void deleteFileOne(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			@RequestParam Map<String,String> map){
		
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		

		try {
			int upCnt = workDAO.deleteFile(map);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		return;
	}
	

	/**
	 * 핵심체크사항 협력자 추가
	 * @MethodName : coworkerKeyPointChk
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/coworkerKPC.do")
	public String coworkerKeyPointChk(WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
//		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		workVO.setRgId(loginUser.getId());

		int cnt = 0;
		//String str = "";
		StringBuffer strB = new StringBuffer();
		String rtn = null;
		rtn = workVO.getUrl();

		if(workVO.getArrayName() != null){
			for(int i=0;i<workVO.getArrayName().length;i++){
				if(i!=0){
					//str += ", ";
					strB.append(strB).append(", ");
				}
				//str += workVO.getArrayName()[i];
				strB.append(strB).append(workVO.getArrayName()[i]);
			}
		}
		//workVO.setCoworker(str);
		workVO.setCoworker(strB.toString());
		try{
			cnt = workDAO.updateOfferCoworker(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.updateOfferCowerker^_^"+workVO.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		if(rtn==null||"".equals(rtn)) return "forward:/work/financing.do";
		else return "forward:/work/" +rtn+".do";
	}


	/**
	 * 핵심체크사항 - 진행사항
	 * @MethodName : processKeyPointChk
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/processKPC.do")
	public String processKeyPointChk(WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());

		int cnt = 0;
		String rtn = null;
		rtn = workVO.getUrl();

		try{
			cnt = workDAO.updateOfferInfoProcess(workVO);
			LOG.debug(loginUser.getId()+"^_^workDAO.updateOfferInfoProcess^_^"+workVO.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		if(rtn==null||"".equals(rtn)) return "forward:/work/financing.do";
		else return "forward:/work/" +rtn+".do";
	}

	/**
	 * 일임
	 * @MethodName : entrust
	 * @param request
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectWorkEntrust.do")
	public String entrust(HttpServletRequest request,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

//		System.out.println("---total:"+workVO.getTotal());
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(workVO.ccdCateCd));
		model.addAttribute("cmmCdFeedbackList", cmm.CommonCdList("00007"));

		model.addAttribute("ttT", workVO.getTotal());

		//workVO.setOfferCd("00006");//제안
		workVO.setMiddleOfferCd("00011");//일임

		if(workVO.getChoice_year().equals("")){
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );

			workVO.setChoice_year(date.substring(0, 4));
			//mon = Integer.parseInt(date.substring(4, 6));
		}
		model.addAttribute("choice_year", workVO.getChoice_year());

		//workVO.setChoice_year("2013");
		workVO.setChoice_monthS("01");
		workVO.setChoice_month("12");

		try{
			
			model.addAttribute("offerList", workDAO.selectOfferList(workVO));
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		return "work/funds/Entrust";
	}
	/**
	 * 재매각
	 * @MethodName : workReSale
	 * @param request
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectWorkResale.do")
	public String workReSale(HttpServletRequest request,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

//		//System.out.println("---note:"+workVO.getNote());
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(workVO.ccdCateCd));
		model.addAttribute("cmmCdFeedbackList", cmm.CommonCdList("00007"));

		model.addAttribute("ttT", workVO.getTotal());
		//workVO.setOfferCd("00006");//제안
		workVO.setMiddleOfferCd("00012");//직접발굴

		if(workVO.getChoice_year().equals("")){
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );

			workVO.setChoice_year(date.substring(0, 4));
			//mon = Integer.parseInt(date.substring(4, 6));
		}
		model.addAttribute("choice_year", workVO.getChoice_year());

		//workVO.setChoice_year("2013");
		workVO.setChoice_monthS("01");
		workVO.setChoice_month("12");

		try{
			model.addAttribute("offerList", workDAO.selectOfferList(workVO));
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "work/funds/Resale";
	}

	/**
	 * 펀드
	 * @MethodName : fund
	 * @param request
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectWorkFund.do")
	public String fund(HttpServletRequest request,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(workVO.ccdCateCd));
		model.addAttribute("cmmCdFeedbackList", cmm.CommonCdList("00007"));

		model.addAttribute("ttT", workVO.getTotal());
		//workVO.setOfferCd("00006");//제안
		workVO.setMiddleOfferCd("00013");//펀드

		if(workVO.getChoice_year().equals("")){
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );

			workVO.setChoice_year(date.substring(0, 4));
		}
		model.addAttribute("choice_year", workVO.getChoice_year());

		workVO.setChoice_monthS("01");
		workVO.setChoice_month("12");

		try{
			model.addAttribute("offerList", workDAO.selectOfferList(workVO));
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}



		return "work/funds/Fund";
	}


	/**
	 * 정보 페이지 중요도 저장
	 * @MethodName : saveLevel
	 * @param request
	 * @param wVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/saveLv.do")
	public String saveLevel(HttpServletRequest request,
			WorkVO wVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		wVO.setRgId(loginUser.getId());

		workDAO.updateOfferInfoLv(wVO);
		LOG.debug(loginUser.getId()+"^_^workDAO.updateOfferInfoLv^_^"+wVO.getsNb());

		return "work/keyPointChk/Financing";
	}

	/**
	 * 추천인 팝업
	 * @MethodName : popUpRecommend
	 * @param request
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/popUpRecommend.do")
	public String popUpRecommend(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		model.addAttribute("MDf", workVO.getModalFlag());
		model.addAttribute("MDn", workVO.getModalNum());

		try{
			List<WorkVO> result = workDAO.selectRecommendOne(workVO);
			model.addAttribute("rcmdList", result);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		if("1".equals(workVO.getTmpNum1()))
			model.addAttribute("pop", "ok");

		return "work/popUp/PopUpRecommend";
	}

	/**
	 * 드래그 앤 드롭으로 업무내용 일자수정
	 * @MethodName : modifyBusinessRecordTmdt
	 * @param request
	 * @param session
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyBusinessRecordTmdt.do")
	public String modifyBusinessRecordTmdt(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		workVO.setRgId(loginUser.getId());

		model.addAttribute("result", workVO.getTmDt().substring(6,8));

		List<WorkVO> result = null;
		int cnt = 0;
		try{
			result = workDAO.selectBusinessTmdt(workVO);

			int inTurn = Integer.parseInt(workVO.getTmpNum2())
				,lsTurn = 1
				,idx = 0
				,lsMax = result.size()
				,max = lsMax<(inTurn+1)?(inTurn+1):lsMax ;
			String inSnb = workVO.getsNb();
			StringBuffer bufTmDt = new StringBuffer();
			if(inTurn==0)lsTurn = 0;

			while(idx<max & (idx+lsTurn)<=(idx+lsMax)){
				//System.out.println("\n\n====================\n"+inTurn+"::"+idx+":"+lsTurn+"::"+lsMax+":"+max+"\n====================\n");
				if(inTurn==lsTurn){
					workVO.setsNb(inSnb);
				}else{
					String lsSnb = result.get(idx).getsNb();
					idx++;
					if(inSnb.equals(lsSnb)){
						continue;
					}else{
						workVO.setsNb(lsSnb);
					}
				}
				bufTmDt.delete(0,bufTmDt.capacity());
				bufTmDt.append(workVO.getTmDt().substring(0,8));
				bufTmDt.append("0000");
				bufTmDt.append(lsTurn < 10?"0"+lsTurn:lsTurn);

				workVO.setTmDt(bufTmDt.toString());
				//System.out.println("\n====================\n"+workVO.getTmDt()+"\n====================\n\n");
				lsTurn++;
				cnt = workDAO.updateBusinessTmdt(workVO);
				//LOG.debug(loginUser.getId()+"^_^workDAO.updateBusinessTmdt^_^"+workVO.getsNb());
			}

		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		//model.addAttribute("message", MessageSource.getMessage("success.common.update"));

		//return "work/PrivateWorkView";
		return "basic/result";
	}

	/**
	 * 메모 모아보기 팝업
	 * @MethodName : popUpMemo
	 * @param request
	 * @param personVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/popUpMemo.do")
	public String popUpMemo(HttpServletRequest request,
			WorkVO wWo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		if(wWo.getChoice_year().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );

			wWo.setChoice_year(date.substring(0, 4));
			//mon = Integer.parseInt(date.substring(4, 6));
			//System.out.println(date);
		}
		wWo.setChoice_monthS("01");
		wWo.setChoice_month("12");
		model.addAttribute("choice_year", wWo.getChoice_year());

		if("".equals(wWo.getName())) wWo.setName(loginUser.getName());
		if("".equals(wWo.getTmpId()))wWo.setTmpId(loginUser.getId());
		model.addAttribute("tmpId", wWo.getTmpId());

		wWo.setMemo4db("memo");
		try{
			model.addAttribute("memoList", workDAO.selectMemoList(wWo));
			model.addAttribute("replyList", workDAO.selectReplyList(wWo));
			model.addAttribute("cmntStaffNm",workDAO.selectSameCommentStaffName(wWo));
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		return "work/popUp/PopUpMemo";
	}

	/**
	 * 탐방 발굴 페이지
	 * @MethodName : selectWorkExporing
	 * @param request
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectWorkExporing.do")
	public String selectWorkExporing(HttpServletRequest request,
			CpnExcelVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		String expCnt = vo.getExploringCnt();
		model.addAttribute("name", vo.getName());
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(vo.ccdCateCd));
		List<CpnExcelVO> result = null;
		List<WorkVO> result1 = null;
		try{
			result1 = workDAO.selectExploringCount(vo);
			if("".equals(expCnt)) {
				expCnt = result1.get(0).getExploringCnt();
				vo.setExploringCnt(expCnt);
			}
			result = workDAO.selectCompanyExploring(vo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		String ment = "";
		if("1".equals(expCnt)) ment="지분율 40% 이상, 영업이익 흑자 기업";
		else if("2".equals(expCnt)) ment="라이프 사이클 투자상 저평가 기업";
		else if("3".equals(expCnt)) ment="메자닌 풋도래 기업";
		model.addAttribute("comMent", ment);

		model.addAttribute("exploringCnt", expCnt);
		model.addAttribute("exploringList", result);
		model.addAttribute("exploringCntList", result1);


		return "work/deal/Exploring";
	}

	/**
	 * 탐방 발굴 검토 수정
	 * @MethodName : modifyExploring
	 * @param request
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyExploring.do")
	public String modifyExploring(HttpServletRequest request,
			CpnExcelVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());
		model.addAttribute("name", vo.getName());

		workDAO.updateCompanyExloring(vo);
		LOG.debug(loginUser.getId()+"^_^workDAO.updateCompanyExloring^_^"+vo.getsNb());

		return "work/deal/Exploring";
	}

	/**
	 * 탐방발굴 대상확인 수정
	 * @MethodName : modifyPbr
	 * @param request
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyPbr.do")
	public String modifyPbr(HttpServletRequest request,
			CpnExcelVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());
		model.addAttribute("name", vo.getName());

		workDAO.updateCompanyPbr(vo);
		LOG.debug(loginUser.getId()+"^_^workDAO.updateCompanyPbr^_^"+vo.getsNb());

		return "work/deal/Exploring";
	}

	/**
	 * 탐방발굴 의견 수정
	 * @MethodName : modifyOpinion
	 * @param request
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyOpinion.do")
	public String modifyOpinion(HttpServletRequest request,
			CpnExcelVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());
		model.addAttribute("name", vo.getName());

		workDAO.updateCompanyOpinion(vo);
		LOG.debug(loginUser.getId()+"^_^workDAO.updateCompanyOpinion^_^"+vo.getsNb());

		return "work/deal/Exploring";
	}

	/**
	 * 탐방발굴 우선순위 수정
	 * @MethodName : modifyRank
	 * @param request
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/modifyRank.do")
	public String modifyRank(HttpServletRequest request,
			CpnExcelVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());
		model.addAttribute("name", vo.getName());

		workDAO.updateCompanyRank(vo);
		LOG.debug(loginUser.getId()+"^_^workDAO.updateCompanyRank^_^"+vo.getsNb());

		return "work/deal/Exploring";
	}

	/**
	 * 업무일지 -> 정보 -> 인맥 중요도 수정
	 * @MethodName : saveImportance
	 * @param request
	 * @param wVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/saveImportance.do")
	public String saveImportance(HttpServletRequest request,
			WorkVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());


		if( Integer.parseInt(vo.getTmpNum1()) < 3){
			vo.setTmpNum2("1");
		}else if( Integer.parseInt(vo.getTmpNum1()) < 5){
			vo.setTmpNum2("2");
			vo.setTmpNum1( Integer.toString( Integer.parseInt(vo.getTmpNum1())-2) );
		}
		try{
			workDAO.updateNetPointImportance(vo);
			LOG.debug(loginUser.getId()+"^_^workDAO.updateOfferInfoLv^_^"+vo.getsNb());
		}catch(Exception e){
			e.printStackTrace();
		}

		return "work/keyPointChk/Financing";
	}

	/**
	 * 딜 > 의견팝업페이지에서 분석, 제안서 입력
	 * @MethodName : insertDealINallDeal
	 * @param request
	 * @param response
	 * @param wvo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/work/insertDealINallDeal.do")
	public String insertDealINallDeal(
			HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("wvo") WorkVO wvo,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		wvo.setRgId(loginUser.getId());
		String rtnPath = "";

		cal.setTime( new Date(System.currentTimeMillis()) );
		String date = new SimpleDateFormat("yyyyMMdd").format( cal.getTime() );

		wvo.setRgNm(loginUser.getName());
		wvo.setMiddleOfferCd("00000");
		wvo.setInfoProvider("0");
		wvo.setSupporter("0");
		wvo.setRcmdSnb("0");

		try{
			// 정보 받기
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

			rtnPath = "redirect:/recommend/comment.do?sNb="+(String) multipartRequest.getParameter("tmpNum1");
			wvo.setCpnId( (String) multipartRequest.getParameter("cpnId"));
			wvo.setMemo( (String) multipartRequest.getParameter("memo"));
			wvo.setOfferCd( (String) multipartRequest.getParameter("offerCd"));
			wvo.setTmDt(date);
			// 코멘트 입력
			workDAO.insertDeal(wvo);
			LOG.debug(loginUser.getId()+"^_^workDAO.insertDeal");

			
			
			//분석 등록									//20160422
			if("00004".equals(wvo.getOfferCd())){		
				//분석의견 등록(ib_offer_info)
				
				wvo.setKeyPnum("8");		//분석의견 '00008'
				wvo.setKeyP((String) multipartRequest.getParameter("anal"));
				wvo.setStar((String) multipartRequest.getParameter("star"));
				wvo.setExpirationDt((String) multipartRequest.getParameter("exDt"));
				
				insertOfferInfo(wvo);		//핵심체크사항 분석의견 등록
			}
			
			
			
			// maxSnb 구하기
			List<WorkVO> rslt = workDAO.selectMaxSnbINopinion(wvo);

			// 파일업로드 시키기
			MultiFileUpload mUpload = new MultiFileUpload();
			FileUpDbVO fileVo = new FileUpDbVO();

			fileVo.setOfferSnb(rslt.get(0).getsNb());
			fileVo.setReportYN("N");
			fileVo.setFileCategory("00000"); //00000:정보정리, 00001: staff사진 ,  00002: 댓글 첨부파일, 00003: 인사관리->이력서파일
			fileVo.setRgId(loginUser.getId());

			mUpload.fileUpload(multipartRequest, fileVo, request, workDAO);

		}catch (Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return rtnPath;
	}
	/**
	 * 업무일지 > 정보 > 분석의견
	 * @MethodName : analysisComments
	 * @param request
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/analysisComments.do")
	public String analysisComments(HttpServletRequest request,
			WorkVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
				
		System.out.println("##################TTT111#############:::" + vo.getSrchYear());
		
		if(vo.getSrchYear().toString().length() == 0){
			vo.setSrchYear("" + cal.get(Calendar.YEAR));
		}
		
		System.out.println("##################TTT222#############:::" + vo.getSrchYear());
		
		model.addAttribute("ttT", vo.getTotal());
		model.addAttribute("TAB", vo.getPage());
		model.addAttribute("name", vo.getName());
		model.addAttribute("srchYear", vo.getSrchYear());
		model.addAttribute("sorting", vo.getSorting());
		try{
			model.addAttribute("financingList", workDAO.selectAnalysisCommentsList(vo));
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}


		return "work/keyPointChk/AnalysisComments";
	}
	/**
	 *
	 * @MethodName : selectGrowthResearch
	 * @param request
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectGrowthResearch.do")
	public String selectGrowthResearch(HttpServletRequest request,
			WorkVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		model.addAttribute("ttT", vo.getTotal());

		vo.setMiddleOfferCd("00070");//신성장

		if(vo.getChoice_year().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );

			vo.setChoice_year(date.substring(0, 4));
			//System.out.println(date);
		}
		model.addAttribute("choice_year", vo.getChoice_year());
		vo.setChoice_monthS("01");
		vo.setChoice_month("12");

		List<WorkVO> result = null;
		try{
			result = workDAO.selectOfferList(vo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		model.addAttribute("offerList", map.get("resultList"));

		model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(vo.ccdCateCd));
		model.addAttribute("cmmCdFeedbackList", cmm.CommonCdList("00007"));


		return "work/deal/Growth";
	}
	/**
	 * 업무일지 > 정보 > matrix
	 * @MethodName : matrix
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 4. 9.
	 */
	@RequestMapping(value="/work/matrix.do")
	public String matrix(WorkVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		//model.addAttribute("cmmCdProgressList", cmm.CommonCdList("00003"));
		model.addAttribute("search", vo.getSearch());
		model.addAttribute("tmpNum", vo.getTmpNum1());
		
		if(vo.getTmpNum1().equals("1")) {//needs
			vo.setTmpNum2(vo.getSearch());
			vo.setSearch("");
		}
		try{
			List<WorkVO> result = workDAO.selectMatrixList(vo);
			model.addAttribute("matrixList", result);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		return "work/keyPointChk/Matrix";
	}
	/**
	 * 업무일지 > 정보정리 > 정보등록 : 리포트 체크박스 ajax
	 * @MethodName : updateFileInfoCheckReport
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 4. 23.
	 */
	@RequestMapping(value="/work/updateFileInfoCheckReport.do")
	public String updateFileInfoCheckReport(WorkVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			model.addAttribute("result",workDAO.updateFileInfoCheckReport(vo));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "basic/result";
	}
	/**
	 * 업무일지 > 정보 > 창투/투자사
	 * @MethodName : matrix2
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 5. 8.
	 */
	@RequestMapping(value="/work/matrix3.do")
	public String matrix2(WorkVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		model.addAttribute("search", vo.getSearch());
		model.addAttribute("tmpNum", vo.getTmpNum1());
		
		try{
			List<WorkVO> result = workDAO.selectMatrix2List(vo);
			model.addAttribute("matrixList", result);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		return "work/keyPointChk/Matrix2";
	}
	@RequestMapping(value="/work/matrix2.do")
	public ModelAndView matrix3(@RequestParam Map<String,Object> cmmnMap) throws Exception{
		
		ModelAndView mv = new ModelAndView("work/keyPointChk/Matrix2");
		mv.addObject("search", cmmnMap.get("search"));
		mv.addObject("tmpNum", cmmnMap.get("tmpNum"));
		
		try{
			List<Map<String,Object>> result = workDAO.selectMatrix3List(cmmnMap);
			mv.addObject("matrixList", result);
			List<Map<String,Object>> investMentList = companyDAO.selectInvestmentList(cmmnMap);
			mv.addObject("investMentList", investMentList);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		return mv;
	}
	
	/**
	 * 딜 > mna > 매칭회사 의견 수정
	 * @MethodName : matchComment
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 5. 15.
	 */
	@RequestMapping(value="/work/matchComment.do")
	public String matchComment(WorkVO vo,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			workDAO.updateMnaMatchComment(vo);
			LOG.debug(loginUser.getId()+"^_^workDAO.updateMnaMatchComment^_^"+vo.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		return "work/keyPointChk/Matrix2";
	}

	/**
	 * 
	 * @MethodName : changeMiddleOfferCd
	 * @param request
	 * @param session
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 6. 9.
	 */
	@RequestMapping(value="/work/changeMiddleOfferCd.do")
	public String changeMiddleOfferCd(HttpServletRequest request,
			WorkVO vo,
			ModelMap model) throws Exception{

		HttpSession session = request.getSession();
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		int cnt = 0;
		try{
			cnt = workDAO.updateMiddleOfferCd(vo);
			LOG.debug(loginUser.getId()+"^_^workDAO.updateMiddleOfferCd^_^"+vo.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("updateCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.update"));
		return "work/deal/DealSend";
	}
	
	
	
	
	
	
	//------------------------------------------- 정보등급 관련 :S ----------------------------------------------
		
	/**
	 * 정보등급보기 팝업 화면
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 22.
	 */
	@RequestMapping(value="/work/infoLevelPopup.do")
	public String infoLevelPopup(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,String> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		model.addAllAttributes(map);	//모든 받은 정보 그대로 전달

		return "work/infoLevelPopup";
    }
	
	
	/**
	 * 정보등급별 사용자 리스트 json
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 2.
	 */
	@RequestMapping(value = "/work/getInfoLevelUser.do")
	public void getInfoLevelUser(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,String> map) throws Exception {
	
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		List<Map> list = workService.getInfoLevelUser(map);
				
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
		
	}
	
	
	/**
	 * 투자심의 팝업
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 05. 25.
	 */
	@RequestMapping(value = "/work/investPopup.do")
	public String investPopup(HttpServletRequest request, HttpServletResponse response, ModelMap model,
								HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		model.addAllAttributes(map);	//받은 파라미터 화면으로 그대로 전달.
		
		return "work/investPopup";
	}

	
	/**
	 * 투자심의 정보 리스트 json
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 25.
	 */
	@RequestMapping(value = "/work/getInvestInfo.do")
	public void getInvestInfo(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,String> map) throws Exception {
	
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		List<Map> list = workService.getInvestInfo(map);
				
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
		
	}
	
	
	/**
	 * 투자심의 등록 ajax
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 24.
	 */
	@RequestMapping(value = "/work/regMyInvest.do")
	public void regMyInvest(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;	
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		int upCnt = 0;
		map.put("userSeq", loginUser.getStaffSnb());
		upCnt = workService.regMyInvest(map);				//투심정보 등록 
		
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
	/**
	 * 투자사(경쟁사)회사 찾기 팝업
	 * @MethodName : popUpInvestor
	 * @param request
	 * @param workVO
	 * @param companyVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/popUpInvestor.do")
	public String popUpInvestor(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			CompanyVO companyVO,
			ModelMap model) throws Exception{

//		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
//		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//      LOG.info(loginUser.getId()+"^_^"+workVO.getCpnNm());
		
		int totCnt = 0;
		List<CompanyVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
        PaginationInfo paginationInfo = new PaginationInfo();
        model.addAttribute("searchName", workVO.getCpnNm());
        model.addAttribute("MDf", workVO.getModalFlag());
        model.addAttribute("MDn", workVO.getModalNum());
        model.addAttribute("kind", workVO.getType());
        model.addAttribute("tblCnt", workVO.getRtnVal());

        paginationInfo.setCurrentPageNo(companyVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(15);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(5);//페이징 리스트의 사이즈

        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
		companyVO.setFirstIndex(firstRecordIndex);
		companyVO.setRecordCountPerPage(recordCountPerPage);

		try{
			result = companyDAO.selectInvestorCompanyList(companyVO);
			totCnt = companyDAO.selectInvestorCompanyListCnt(companyVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		map.put("resultList", result);
		model.addAttribute("investorCompanyList", map.get("resultList"));

        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

		return "work/popUp/popUpInvestor";
	}
	
	/**
	 * 회사명 수정 화면
	 * @MethodName : rgstCpn
	 * @param companyVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/work/popModifyCpn.do")
	public String popModifyCpn(@ModelAttribute("companyVO") CompanyVO companyVO,
							HttpSession session,
							ModelMap model,
							@RequestParam Map<String,String> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		List<Map> list = workService.getSimpleCompanyInfo(map);
		
		if(list.size()>0){
			model.addAttribute("cpnSnb", list.get(0).get("cpnSnb"));
			model.addAttribute("cpnNm",	list.get(0).get("cpnNm"));
		}

		return "work/modifyCpn";
	}
	
	
	/**
	 * 회사명 저장 ajax
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 24.
	 */
	@RequestMapping(value = "/work/modifyCpnNm.do")
	public void modifyCpnNm(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;	
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		int upCnt = 0;
		map.put("rgId", loginUser.getId());
		upCnt = workService.modifyCpnNm(map);				//투심정보 등록 
		
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
	/**
	 * 팝업 실시간 투자사(경쟁사) 검색
	 * @MethodName : ajaxPopUpInvestorSearchName
	 * @param request
	 * @param workVO
	 * @param companyVO
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2017. 8. 7.
	 */
	@RequestMapping(value="/work/ajaxPopUpInvestorSearchName.do")
	public String ajaxPopUpInvestorSearchName(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			CompanyVO companyVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
        LOG.info(loginUser.getId()+"^_^"+workVO.getCpnNm());
		
		int totCnt = 0;
		List<CompanyVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
        PaginationInfo paginationInfo = new PaginationInfo();
        model.addAttribute("searchName", workVO.getCpnNm());
        model.addAttribute("MDf", workVO.getModalFlag());
        model.addAttribute("MDn", workVO.getModalNum());
        model.addAttribute("kind", workVO.getType());

        paginationInfo.setCurrentPageNo(companyVO.getPageIndex());//현재 페이지 번호
        paginationInfo.setRecordCountPerPage(15);//한 페이지에 게시되는 게시물 건수
        paginationInfo.setPageSize(5);//페이징 리스트의 사이즈

        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
		companyVO.setFirstIndex(firstRecordIndex);
		companyVO.setRecordCountPerPage(recordCountPerPage);

		try{
			result = companyDAO.selectInvestorCompanyList(companyVO);
			totCnt = companyDAO.selectInvestorCompanyListCnt(companyVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		map.put("resultList", result);
		model.addAttribute("investorCompanyList", map.get("resultList"));

        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

		return "includeJSP/popUpInvestor";
	}
	
	/**
	 * 투자사(경쟁사) 등록 
	 * @MethodName : insertInvestorCompany
	 * @param map
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2017. 8. 22.
	 */
	@RequestMapping(value="/work/insertInvestorCompany.do")
	public void insertInvestorCompany(@RequestParam Map<String,Object> map,
			HttpSession session,
			HttpServletResponse response,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			map.put("rgId", loginUser.getStaffSnb());
			int cnt = workService.insertInvestorCompany(map);
			AjaxResponse.responseAjaxSave(response, cnt);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
	}
	
	/**
	 * 투자사(경쟁사) 담당자명 저장 ajax
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: user
	 * @date		: 2017. 8. 23.
	 */
	@RequestMapping(value = "/work/modifyInvestorManager.do")
	public void modifyInvestorManager(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;	
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		int upCnt = 0;
		map.put("rgId", loginUser.getStaffSnb());
		upCnt = workService.modifyInvestorManager(map);				
				
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
	/**
	 * 투자사(경쟁사) 삭제 ajax
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: user
	 * @date		: 2017. 9. 12.
	 */
	@RequestMapping(value = "/work/delInvestorCompany.do")
	public void delInvestorCompany(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;	
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		int cnt = 0;
		map.put("rgId", loginUser.getStaffSnb());
		cnt = workService.delInvestorCompany(map);				
				
		AjaxResponse.responseAjaxSave(response, cnt);		//결과전송
		
	}
	
}	
