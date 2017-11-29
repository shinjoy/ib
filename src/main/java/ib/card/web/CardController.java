package ib.card.web;

import ib.card.service.CardService;
import ib.card.service.CardVO;
import ib.card.service.impl.CardDAO;
import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.service.CommonService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.cmm.util.sim.service.LogUtil;
import ib.login.service.StaffVO;

import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * <pre>
 * package  : ib.card.web
 * filename : CardController.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 11. 14.
 * @version : 1.0.0
 */
@Controller
public class CardController {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;
    
    @Resource(name = "cardDAO")
    private CardDAO cardDAO;  
    
    @Resource(name = "cardService")
    private CardService cardService;  
    
	/** log */
    protected static final Log LOG = LogFactory.getLog(CardController.class);

	/**
	 * Main 화면으로 들어간다
	 * @MethodName : index
	 * @param cardVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/card/index.do")
	public String index( CardVO cardVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		//피드백 메모 입력/수정/삭제 권한 부여
		if(Integer.parseInt(loginUser.getPermission()) >= 20 || ((loginUser.getId().equals("mjy") || loginUser.getId().equals("jyl") || loginUser.getId().equals("kmy")))){
			model.addAttribute("memoAuth","Y");
		}else{
			model.addAttribute("memoAuth","N");
		}
		
		List<CardVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		model.addAttribute("usrID", cardVO.getUsrId());
		
		if(cardVO.getChoice_year().equals("") && cardVO.getChoice_month().equals("")){
			Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
			
			cardVO.setChoice_year(date.substring(0, 4));
			cardVO.setChoice_month(date.substring(4, 6));
			
			//System.out.println(date);
		}
		String year = cardVO.getChoice_year();
		String month = cardVO.getChoice_month();
		
		if(cardVO.getChoice_month().length()==1){
			cardVO.setChoice_month("0"+cardVO.getChoice_month());
		}
		if(cardVO.getTotal().equals("tot")){
			cardVO.setChoice_monthS("01");
		} else {
			cardVO.setChoice_monthS(cardVO.getChoice_month());
		}
		
		cardVO.setSort_date("2");
		
		try{
			result = cardDAO.selectCardUsedList(cardVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		/*============야근일때 야근시간 가져오기 : S ==============*/
		try {
			for(int i=0;i<result.size();i++){
				CardVO card = result.get(i);
				if(card.getDv().equals("60")){//야근일때
					Map<String,Object>cardMap = new HashMap();
					cardMap.put("useDate",(card.getTmDt()));   //사용일
					cardMap.put("cardSnb",card.getsNb());				       //지출 snb
					card.setStaffInfoList(cardDAO.selectCardUserList(cardMap));//야근지출일때 포함되는 직원 정보
					result.set(i, card);
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		/*============야근일때 야근시간 가져오기 : E ==============*/
		map.put("cardList", result);
		model.addAttribute("cardList", map.get("cardList"));
		model.addAttribute("choice_year", year);
		model.addAttribute("choice_month", month);
		
		/*StaffVO staffVO = new StaffVO();
		try {
			model.addAttribute("userList", cmm.UserList(staffVO));
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
    	return "card/CardMain";
    }
	
	
	
	/**
	 *
	 * @MethodName : insertCard
	 * @param cardVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/card/insertUsed.do")
	public String insertCard( CardVO cardVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		cardVO.setRgId(loginUser.getId());
		cardVO.setArrayName(cardVO.getMemoSndName().split(","));
		List<CardVO> result = null;
		
		int cnt = 0;
		try{
			cnt = cardDAO.insertCardUsedList(cardVO);
			LOG.debug(loginUser.getId()+"^_^cardDAO.insertCardUsedList");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		try{
			result = cardDAO.selectMaxSNb(cardVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		cardVO.setsNb(result.get(0).getsNb());
		for(int i=0;i<cardVO.getArrayName().length;i++){
			cardVO.setMemoSndName(cardVO.getArrayName()[i]);
			try{
				cnt = cardDAO.insertCardUsedStaffList(cardVO);
				LOG.debug(loginUser.getId()+"^_^cardDAO.insertCardUsedStaffList");
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
		}
		model.addAttribute("saveCnt", cnt);
		
    	return "card/CardMain";
    }
	
	/**
	 *
	 * @MethodName : updateUsed		20151207
	 * @param cardVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/card/updateUsed.do")
	public String updateUsed( CardVO cardVO,
			HttpSession session,
			ModelMap model, @RequestParam Map<String,String> map) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
try {		
		cardVO.setRgId(loginUser.getId());
		cardVO.setArrayName(cardVO.getMemoSndName().split(","));
		List<CardVO> result = null;
		
		cardVO.setsNb(map.get("cardSnb").toString());
		
		int cnt = 0;
		try{
			cnt = cardDAO.updateCardUsedList(cardVO);
			LOG.debug(loginUser.getId()+"^_^cardDAO.updateCardUsedList");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		/*try{
			result = cardDAO.selectMaxSNb(cardVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		cardVO.setsNb(result.get(0).getsNb());*/
		
		cardDAO.deleteCardUsedStaffList(cardVO);
		
		for(int i=0;i<cardVO.getArrayName().length;i++){
			cardVO.setMemoSndName(cardVO.getArrayName()[i]);
			
			cnt = cardDAO.insertCardUsedStaffList(cardVO);
			LOG.debug(loginUser.getId()+"^_^cardDAO.insertCardUsedStaffList");
			
		}
		model.addAttribute("saveCnt", cnt);
		
   	return "card/CardMain";
   	
}catch(Exception e) {
	e.printStackTrace();
	throw e;
}
   }

	/**
	 * 지출 left
	 * @MethodName : selectLeft
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/card/selectLeft.do")
	public String selectLeft( 
			HttpSession session,
            ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
	/*	LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		StaffVO staffVO = new StaffVO();
		try {
			model.addAttribute("userList", cmm.UserList(staffVO));
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}*/
    	return "card/CardLeft";
    }
	
	
	/**
	 *
	 * @MethodName : updateFeedback
	 * @param cardVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/card/insertCardFeedback.do")
	public String updateFeedback( CardVO cardVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		cardVO.setRgId(loginUser.getId());
		int cnt = 0;
		
		try{
			cnt = cardService.updateCardFeedback(cardVO); //cardDAO.updateCardFeedback(cardVO);
			LOG.debug(loginUser.getId()+"^_^cardDAO.updateCardFeedback^_^"+cardVO.getsNb());
		}catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "card/CardMain";
	}
	
	/**
	 * 지출 삭제하기
	 * @MethodName : deleteCardUsed
	 * @param request
	 * @param session
	 * @param cVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/card/deleteCardUsed.do")
	public String deleteCardUsed(HttpServletRequest request,
			HttpSession session,
			CardVO cVO,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		//System.out.println("---snb:"+workVO.getsNb());
		
		int cnt = cardDAO.deleteCardUsed(cVO);
		LOG.debug(loginUser.getId()+"^_^cardDAO.deleteCardUsed");
		model.addAttribute("deleteCnt", cnt);
		model.addAttribute("message", MessageSource.getMessage("success.common.delete"));
		
		return "card/CardMain";
	}
	
	
	
	/**
	 * 카드사용 수정 페이지 팝업
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2015. 12. 07.
	 */
	@RequestMapping(value = "/card/updateCardPop.do")
	public String updateCardPop(HttpServletRequest request,
			HttpSession session, HttpServletResponse response, ModelMap model, @RequestParam Map<String,String> map) throws Exception {
				
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		
		model.addAllAttributes(map);	//받은 파라미터 화면으로 그대로 전달.
		
		StaffVO staffVO = new StaffVO();
		model.addAttribute("userList", cmm.UserList(staffVO));
		
		return "card/updateCardPop";
	}
	
	/**
	 * 카드사용 정보 (카드 수정 팝업)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2015. 12. 07.
	 */
	@RequestMapping(value = "/card/getCardInfo.do")
	public void getCardInfo(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,String> map) throws Exception {
		
		CardVO cardVO = new CardVO();
		cardVO.setsNb(map.get("snb").toString());
		
		List<CardVO> result = cardDAO.selectCardUsedList(cardVO);
		
		Map pMap = new HashMap();
		pMap.put("sNb", result.get(0).getsNb());
		pMap.put("cstSnb", result.get(0).getCstSnb());
		pMap.put("staffNm", result.get(0).getStaffNm());
		pMap.put("cstNm", result.get(0).getCstNm());
		pMap.put("cstCpnNm", result.get(0).getCstCpnNm());
		pMap.put("position", result.get(0).getPosition());
		pMap.put("staff", result.get(0).getStaff());
		pMap.put("place", result.get(0).getPlace());
		pMap.put("note", result.get(0).getNote());
		pMap.put("dv", result.get(0).getDv());
		pMap.put("dv2", result.get(0).getDv2());
		pMap.put("feedback", result.get(0).getFeedback());
		pMap.put("price", result.get(0).getPrice());
		pMap.put("etcNum", result.get(0).getEtcNum());
		pMap.put("rgDt", result.get(0).getRgDt());
		pMap.put("tmDt", result.get(0).getTmDt());
		
		List<Map> list = new ArrayList<Map>();
		list.add(pMap);
		LogUtil.printMap(pMap);	//map console log
		//List<Map> list = menuRegService.getMenuList(map);
		
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
	}
	
	/*======================등록/수정 화면 팝업 변경:S jy=======================*/

	/**
	 * 등록/수정 팝업
	 * @MethodName : 
	 * @param
	 * @param 
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/card/regCard.do")
	public String regCard(HttpServletRequest request,
			HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,Object> map,
			ModelMap model) throws Exception{
		if( session.getAttribute("userLoginInfo") == null ) return "basic/Content";
		if( map.containsKey("tmDt") ) model.addAttribute("tmDt",map.get("tmDt"));
		if( map.containsKey("approvalCost") ) model.addAttribute("approvalCost",map.get("approvalCost"));
		if( map.containsKey("placeName") ){
			String placeName = (String)map.get("placeName");
			if(placeName != null)
				model.addAttribute("placeName", placeName.replace('\'', ' '));
		}
		if( map.containsKey("cardSnb") ) model.addAttribute("cardSnb",map.get("cardSnb"));
		if( map.containsKey("cardCorpSnb") ) model.addAttribute("cardCorpSnb",map.get("cardCorpSnb"));	
		return "/card/regCard";
	}
	
	/**
	 * 지출 내역 등록 ajax
	 * @MethodName : regCardUse
	 * @param 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/card/regCardUse.do")
	public void regCardUse(HttpSession session,HttpServletResponse response,
		@RequestParam Map<String,Object> map,ModelMap model)throws Exception{
		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		map.put("rgId",loginUser.getId());
		
		//지출 등록 & 법인카드내역 업데이트
		int sNb = cardService.regCardUse(map);
		
		AjaxResponse.responseAjaxSave(response, sNb);
	}
	
	/**
	 * 카드사용 정보 (카드 수정 팝업)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 09. 08.
	 */
	@RequestMapping(value = "/card/getCardDetail.do")
	public void getCardDetail(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
		
		Map<String,Object> result = new HashMap();
		//지출 사용내역.
		map.put("usrIdArrCount", "0");
		List<Map> list = cardService.selectCardList(map);
		
		//지출에 등록된 참가자.
		map.put("cardSnb", map.get("sNb"));
		List<Map> userList = cardService.selectCardUserList(map);
		
		//소모품일때 소모품 리스트.
		List<Map> mroList = cardService.selectCardMro(map);
		
		// 지출 대상자 리스트
		List<Map> cstList = cardService.selectCardUsedCustomerList(map);
		
		result.put("card",list.get(0));		//지출 내역
		result.put("userList",userList);	//참가자 리스트
		result.put("mroList",mroList);		//소모품 리스트
		result.put("cstList",cstList);		// 지출 대상자 리스트
		AjaxResponse.responseAjaxMap(response, result);	//결과전송
	}
	
	
	/**
	 * @Method Name : getCstCustomer
	 * @descripton  : 지출 회사/고객 조회
	 * @date : 2017. 8. 29.
	 * @author : yujin
	 * @param : request, response, model, session, map
	 */
	@RequestMapping(value = "/card/getCstCustomer.do")
	public void getCstCustomer(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
		
		Map<String,Object> result = new HashMap();   // 결과 map
		// 지출 회사/고객 조회
		map.put("cardSnb", map.get("sNb"));
		List<Map> cstList = cardService.selectCardUsedCustomerList(map);
		 
		result.put("cstList",cstList);
		
		AjaxResponse.responseAjaxMap(response, result);	//결과전송
	}
	
	
	
	
	
	/**
	 * 카드내역 삭제
	 * @MethodName : deleteCardUse
	 * @param 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/card/deleteCardUse.do")
	public void deleteCardUse(HttpSession session,HttpServletResponse response,
		@RequestParam Map<String,Object> map,
		ModelMap model)throws Exception{
		int chk = 0 ;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		map.put("rgId",loginUser.getId());
		//지출 삭제
		cardService.deleteCardUse(map);				  // 지출 내역삭제
		cardService.deleteCardUsedCustomerList(map);  // 지출 회사/고객 삭제
		cardService.deleteCardUsedStaffList(map);	  // 지출 참가자 삭제
		cardService.delectCardMro(map);				  // 지출 소모품 삭제
		
		chk = 1 ;
		AjaxResponse.responseAjaxSave(response, chk);
	}
	
	/*신규 지출 리스트*/

	/**
	 * Main 화면으로 들어간다
	 * @MethodName : index
	 * @author		: sjy
	 * @throws Exception 
	 * @date		: 2016. 09. 08.
	 */
	@RequestMapping(value="/card/cardIndex.do")
	public String cardList( CardVO cardVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		Map map = new HashMap();
		String minYear = cardService.selectMinYear(map);	//최초 데이터 입력 년도 조회
		model.addAttribute("minYear", minYear);
		return "/card/cardList";
    }
	
	/**
	 * 지출 Main 화면으로 들어간다
	 * @MethodName : cardCorpList
	 * @author		: psh
	 * @throws Exception 
	 * @date		: 2016. 10. 25.
	 */
	@RequestMapping(value="/card/cardCorpIndex.do")
	public String cardCorpList( CardVO cardVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		Map map = new HashMap();
		String minYear = cardService.selectMinYear(map);	//최초 데이터 입력 년도

		List<Map> corpList = new ArrayList();				//법인회사 정보리스트
		corpList = cardService.selectCorpInfoList();
		
		model.addAttribute("minYear", minYear);
		JSONArray jsonArray = new JSONArray();		
		model.addAttribute("corpList", jsonArray.fromObject(corpList));
		
		return "/card/cardCorpList";
    }
	
	
	/**
	 * 카드사용 정보 (지출리스트)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: psh
	 * @date		: 2016. 10. 25.
	 */
	@RequestMapping(value = "/card/getCardList.do")
	public void getCardList(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
		
		Map<String,Object> result = new HashMap();	//결과 전송 맵
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		List<Map> cardList = new ArrayList();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		int count =0;
		//검색 유저 아이디
		if(!map.get("usrId").toString().equals("") || Integer.parseInt(map.get("checkCount").toString()) == 0){
			count =1;
		}
		String [] usrArr = usrArr = map.get("usrId").toString().split(",");	
		map.put("usrIdArrCount", count);
		map.put("usrIdArr", usrArr);
		
		try{
			cardList = cardService.selectCardList(map);  // 카드리스트 조회
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		/*============야근 혹은 점심-직원 일때 참가자 리스트 가져오기 : S ==============*/
		try {
			for(int i=0;i<cardList.size();i++){
				if(cardList.get(i).get("dv").equals("60") || cardList.get(i).get("dv").equals("55")){	//야근 혹은 점심-직원
					Map<String,Object>cardMap = new HashMap();
					cardMap.put("useDate",cardList.get(i).get("tmDt").toString());   	//사용일
					cardMap.put("cardSnb",cardList.get(i).get("sNb").toString());		//지출 snb
					cardList.get(i).put("cardUserList",cardService.selectCardUserList(cardMap));//야근 혹은 점심-직원일때 포함되는 직원 정보
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		/*============야근 혹은 점심-직원 일때 참가자 리스트 가져오기 : E ==============*/
		result.put("cardList", cardList);
		AjaxResponse.responseAjaxMap(response, result);	//결과전송
	}
	
	
	/**
	 * 법인카드 사용정보 (법인카드사용내역 화면)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: psh
	 * @date		: 2016. 10. 25.
	 */
	@RequestMapping(value = "/card/getCardCorpUsedList.do")
	public void getCardCorpUsedList(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
		try{
			Map<String, Object> paramMap = new HashMap<String, Object>();
			int count =0;
			
			//검색 유저 아이디
			if(!map.get("usrId").toString().equals("") || Integer.parseInt(map.get("checkCount").toString()) == 0){
				count =1;
			}
			String [] usrArr = usrArr = map.get("usrId").toString().split(",");	
			map.put("usrIdArrCount", count);
			map.put("usrIdArr", usrArr);			
			
			Map<String,Object> result = new HashMap();	//결과 전송 맵
						
			try{				
				result = cardService.selectCardCorpUsedList(map);	//법인카드 사용내역
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
						
			AjaxResponse.responseAjaxMap(response, result);	//결과전송
		}
		catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
	}
	
	/**
	 * 법인카드 삭제 (법인카드사용내역 화면에서 삭제해야 할 대상에 적용)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: psh
	 * @date		: 2017. 02. 22.
	 */
	@RequestMapping(value = "/card/deleteCardCorpUsed.do")
	public void deleteCardCorpUsed(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
		try{
			Map<String,Object> result = new HashMap();	//결과 전송 맵
						
			try{							
				cardService.deleteCardCorpUsed(map);	 //법인카드 사용내역				
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
			AjaxResponse.responseAjaxSave(response, 1);
		}
		catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 법인카드 사용내역 팝업화면으로 들어간다
	 * @MethodName : cardCorpUsedListPopup
	 * @author		: psh
	 * @throws Exception 
	 * @date		: 2016. 10. 26.
	 */
	@RequestMapping(value="/card/cardCorpUsedListPopup.do")
	public String cardCorpUsedListPopup( CardVO cardVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";				
		
		return "/card/cardCorpUsedListPopup";
    }
	
	
	
	/**
	 * 소모품 팝업
	 * @MethodName : 
	 * @param
	 * @param 
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/card/popSupplies.do")
	public String popSupplies(HttpServletRequest request,
			HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,Object> map,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		model.addAttribute("cardSnb",map.get("cardSnb"));
		return "/card/popSupplies";
	}
	
	
	/*통계 화면*/
	@RequestMapping(value="/card/statistics.do")
	public String cardStatistics(
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		Map map = new HashMap();
		String minYear = cardService.selectMinYear(map);	//최초 데이터 입력 년도
		model.addAttribute("minYear", minYear);
		return "/card/cardStatistics";
    }
	
	//통계리스트
	@RequestMapping(value = "/card/getCardStatistics.do")
	public void getCardStatistics(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,String> map) throws Exception {
		
		List<Map> resultList = new ArrayList<Map>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String checkStr = map.get("checkList").toString();
		String [] checkArr = checkStr.split(",");
		
		//부서리스트
		List<Map> deptList = commonService.getDeptList(map);			//부서 리스트 조회
		//유저리스트
		List<Map> userList = commonService.getStaffListNameSort(map);	//유저 리스트 조회
		
		List<Integer> array4sort = new ArrayList<Integer>();			//정렬을 위한 합계값
		
		for(int i=0;i<checkArr.length;i++){  // 체크 리스트 만큼 for
			Map<String,Object> rMap = new HashMap();			//검색 하나 
			String search = checkArr[i];
			map.put("search", search);
			List<Map> dvCardList = cardService.selectDvCardStatistics(map);		//dv 통계 조회
			rMap.put("dvCardList", dvCardList); 
			List<Map> dv2CardList = cardService.selectDv2CardStatistics(map);	//dv2 통계 조회
			
			//정렬을 위해 합계를 구해서 추가해준다.
			int s = 0;
			for(int m=0; m<dv2CardList.size(); m++){
				s += Integer.parseInt(dv2CardList.get(m).get("sum").toString());
			}
			rMap.put("rSum", s);
			array4sort.add(s);		//정렬을 위한 합계값 list 에 add
			
			rMap.put("dv2CardList", dv2CardList);
			List<Map> monthList = cardService.selectMonthCardStatistics(map);  // 월별 통계조회
			rMap.put("monthList", monthList);
			if(map.get("searchType").toString().equals("team")){
				String name="";
				for(int k=0;k<deptList.size();k++){
					String seq =deptList.get(k).get("deptSeq").toString();
					if(seq.equals(search)){
						name=deptList.get(k).get("deptNm").toString();
					}
				}
				rMap.put("name", name);
			}else if(map.get("searchType").toString().equals("person")){
				String name="";
				for(int k=0;k<userList.size();k++){
					if(userList.get(k).get("usrId").equals(search)){
						name=userList.get(k).get("usrNm").toString();
					}
				}
				rMap.put("name", name);
			}else{
				rMap.put("name", "");
			}
			resultList.add(i, rMap);
		}
		
		//월별 전체 통계
		//List<Map> totalList= cardService.selectMonthCardStatistics(map);
		//resultMap.put("totalList", totalList);
		
		
		List<Map> resultListLast = new ArrayList<Map>();		//최종 결과
		
		//합계 별로 resultList 재정렬 :S -------------------
		for(int n=0; n<array4sort.size(); n++){
		
			int maxValIdx = -1;
			int maxVal = -1;
			for(int k=0; k<array4sort.size(); k++){				
				if(array4sort.get(k) > maxVal){
					maxVal = array4sort.get(k);
					maxValIdx = k;
				}
			}
			
			resultListLast.add(resultList.get(maxValIdx));
			array4sort.remove(maxValIdx);
			array4sort.add(maxValIdx, -1);
		}
		//합계 별로 resultList 재정렬 :E -------------------
		
		resultMap.put("resultList", resultListLast);
		
		AjaxResponse.responseAjaxMap(response, resultMap);
	}
	
	
	
	/**
	 * 일정 조회 (법인카드 사용내역 지출 등록)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 6. 12.
	 */
	@RequestMapping(value="/card/getScheduleForCard.do")
	public void getScheduleForCard(HttpServletResponse response, @RequestParam Map<String,Object> map) throws Exception{

		List<Map> resultMap = cardService.selectScheList(map);		// 스케줄 조회
		
		AjaxResponse.responseAjaxSelect(response, resultMap);
	}
	
	
	
	/**
	 * 법인카드등록내역에 대해 미입력건에 대한 체크 진행
	 * 매주 화, 수 입력지연건에 대해 카운팅하며 2회 카운팅 시 지연패널티 1점이 부여됨
	 * 화, 수에 휴일이 껴있는 경우 그 다음 워킹데이에 체크
	 * 입력지연 패널티 3점이 부여될 시 법인카드 회수 조치됨 
	 */
	@RequestMapping(value="/card/checkCardCorpUsedStatus.do")
	@ResponseBody
	public void checkCardCorpUsedStatus(HttpServletRequest request, HttpSession session,			
			ModelMap model) throws RemoteException{
		
		System.out.println("## Auth getAuthType: " + request.getAuthType());
		Enumeration<String> names = request.getHeaderNames();
		while(names.hasMoreElements() == true){
			System.out.println("## Auth getHeaderName: " + names.nextElement().toString());
		}
		 
		try{
			// 오전 9시 체크 - 젠킨스 스케쥴러 이용
			// 월요일, 휴일에는 Skip			
				
			// 이번주 이전에 사용된 카드내역에 대해 화, 수 기준으로 체크	
			// 해당 프로세스 실행시 당일 이미 체크된 건에 대해서는 Skip
			cardService.checkCardCorpUnregList();
		}catch(RemoteException re){
			
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println(ex.getMessage());
		}    	
    }
	
	
	/**
	 * 지출상세검색 (통계)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 8. 4.
	 */
	@RequestMapping(value="/card/cardList4Srch.do")
	public String cardList4Srch( CardVO cardVO,
									HttpSession session,
									ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		Map map = new HashMap();
		String minYear = cardService.selectMinYear(map);	//최초 데이터 입력 년도
		model.addAttribute("minYear", minYear);
		return "/card/cardList4Srch";
    }
	
	
}