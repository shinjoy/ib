package ib.work.web;

import ib.cmm.LoginVO;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.company.service.CompanyVO;
import ib.person.service.PersonVO;
import ib.work.service.WorkTypeService;
import ib.work.service.WorkVO;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * <pre>
 * package	: ib.work.web 
 * filename	: WorkTypeController.java
 * </pre>
 * 
 * 
 * 
 * @author	: 
 * @date	: 2017. 7. 5.
 * @version : 
 *
 */
@Controller
public class WorkTypeController {


    @Resource(name = "workTypeService")
    WorkTypeService workTypeService;



	/** log */
    protected static final Log logger = LogFactory.getLog(WorkTypeController.class);

	protected static final Calendar cal = Calendar.getInstance();

	
	
	
	/**
	 * 업무목록 화면
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 5.
	 */
	@RequestMapping(value="/workType/workTypeList.do")
	public String workTypeList(HttpSession session,
								ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		
		return "workType/workTypeList";
    }
	
	
	/**
	 * 업무유형 리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 6.
	 */
	@RequestMapping(value = "/workType/getWorkTypeList.do")
	public void getWorkTypeList(HttpServletRequest request,
								HttpServletResponse response,
								HttpSession session, ModelMap model,
								@RequestParam Map<String,Object> map) throws Exception {
	
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		if(map.get("searchText") != null && !"".equals(map.get("searchText").toString())){
			String searchText = map.get("searchText").toString().trim().replaceAll(" +", " ");
			String[] searchTextList = searchText.toString().split(" ");
			for(int i=0; i<searchTextList.length; i++){
				searchTextList[i] = searchTextList[i].trim();
			}
			
			map.put("searchTextList", searchTextList);
			map.put("searchTextStr", StringUtils.join(searchTextList, "|"));
		}
		
		
		List<Map> list = workTypeService.getWorkTypeList((Map)map);
		
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송

	}
	
	
	/**
	 * 업무유형 저장
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 6.
	 */
	@RequestMapping(value = "/workType/doSaveWorkType.do")
	public void doSaveWorkType(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		map.put("rgId", loginUser.getStaffSnb());
		
		int upCnt = 0;
		
		if("new".equals(map.get("mode").toString()))
			upCnt = workTypeService.insertWorkType(map);
		else
			upCnt = workTypeService.updateWorkType(map);
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
	
	
	@RequestMapping(value = "/workType/deleteWorkType.do")
	public void deleteWorkType(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		int upCnt = 0;
		
		upCnt = workTypeService.deleteWorkType(map);
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
	
	
//	
//	/**
//	 * ajax 호출후 단순 성공을 위해 dummy page 연결
//	 *
//	 * @param		: 
//	 * @return		: 
//	 * @exception	: 
//	 * @author		: oys
//	 * @date		: 2016. 4. 20.
//	 */
//	@RequestMapping(value="/workType/ajaxDummy.do")
//	public String ajaxDummy(@ModelAttribute("personVO") PersonVO personVO,
//			CompanyVO companyVO,
//			WorkVO workVO,
//			HttpSession session,
//			ModelMap model) throws Exception{
//
//		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
//		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		logger.info(loginUser.getId());
//
//		return "basic/result";
//    }
//	
//	
//	/**
//	 * 메모 참여자 수신 확인 정보 json
//	 *
//	 * @param		: 
//	 * @return		: 
//	 * @exception	: 
//	 * @author		: oys
//	 * @date		: 2016. 4. 18.
//	 */
//	@RequestMapping(value = "/workType/getMemoRecvInfo.do")
//	public void getMemoRecvInfo(HttpServletRequest request,
//			HttpServletResponse response,
//			HttpSession session, ModelMap model,
//			@RequestParam Map<String,String> map) throws Exception {
//	
//		if(session.getAttribute("userLoginInfo")==null) return;
//		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		
//		
//		List<Map> list = workTypeService.getMemoRecvInfo(map);
//				
//		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
//		
//	}
//	
//	
//	/**
//	 * 메모 참여자 수신 확인 정보
//	 *
//	 * @param		: 
//	 * @return		: 
//	 * @exception	: 
//	 * @author		: oys
//	 * @date		: 2016. 4. 22.
//	 */
//	@RequestMapping(value="/workType/memoRecvInfoPopup.do")
//	public String memoRecvInfoPopup(HttpServletRequest request,
//			HttpServletResponse response,
//			HttpSession session, ModelMap model,
//			@RequestParam Map<String,String> map) throws Exception {
//
//		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
//		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		logger.info(loginUser.getId());
//
//		model.addAllAttributes(map);	//모든 받은 정보 그대로 전달
//
//		return "work/memoRecvInfoPopup";
//    }
//	
//	
//	/**
//	 * 메모 재전송 팝업
//	 *
//	 * @param		: 
//	 * @return		: 
//	 * @exception	: 
//	 * @author		: oys
//	 * @date		: 2016. 5. 16.
//	 */
//	@RequestMapping(value = "/workType/memoResendPopup.do")
//	public String memoResendPopup(HttpServletRequest request,
//			HttpServletResponse response, ModelMap model,
//			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
//
//		//SESSION check!
//		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
//		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		logger.info(loginUser.getId());
//		
//		//model.addAllAttributes(map);	//받은 파라미터 화면으로 그대로 전달.
//		
//		map.put("mainSnb", map.get("s"));
//		
//		Map memo = workTypeService.getMemoCntnt(map).get(0);
//		model.addAttribute("comment", memo.get("comment").toString());
//		model.addAttribute("sNb", map.get("s"));
//		model.addAttribute("dt", memo.get("dt"));
//		model.addAttribute("resendDate", memo.get("resendDate"));
//		
//		return "work/memoResendPopup";
//	}
//	
//	
//	/**
//	 * 메모 재전송
//	 *
//	 * @param		: 
//	 * @return		: 
//	 * @exception	: 
//	 * @author		: oys
//	 * @date		: 2016. 5. 16.
//	 */
//	@RequestMapping(value = "/workType/memoResend.do")
//	public void memoResend(HttpServletRequest request,
//			HttpServletResponse response, ModelMap model,
//			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
//
//		//SESSION check!
//		if(session.getAttribute("userLoginInfo")==null) return;
//		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		logger.info(loginUser.getId());
//		
//		//model.addAllAttributes(map);	//받은 파라미터 화면으로 그대로 전달.
//		
//		int upCnt = 0;
//		
//		map.put("usrId", loginUser.getId());
//		upCnt = workTypeService.memoResend(map);		//재전송
//		
//		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
//	}
//	
//	
//	
//	/**
//	 * 읽지않은 이전 업무보고 전체보기 상태 업데이트 (세션 변경)
//	 *
//	 * @param		: 
//	 * @return		: 
//	 * @exception	: 
//	 * @author		: oys
//	 * @date		: 2016. 4. 20.
//	 */
//	@RequestMapping(value = "/workType/setNoReadAllYn.do")f
//	public void setNoReadAllYn(HttpServletRequest request,
//			HttpServletResponse response, ModelMap model,
//			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
//
//		if(session.getAttribute("userLoginInfo")==null) return;
//		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		logger.info(loginUser.getId());
//		
//		loginUser.setNoReadAllYn((String)map.get("noReadAllYn"));
//		
//		int upCnt = 1;
//		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
//		
//	}
	
}