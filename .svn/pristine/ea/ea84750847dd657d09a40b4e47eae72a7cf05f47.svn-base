package ib.google.web;

import ib.basic.web.Util;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.dart.service.DartService;
import ib.google.service.GoogleCalendarService;
import ib.schedule.service.LoginVO;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GoogleCalendarController {
	
	@Autowired
	DartService dartService;	
	
	@Autowired
	GoogleCalendarService googleCalendarService;
	
	protected static final Log LOG = LogFactory.getLog(GoogleCalendarController.class);
	
	@RequestMapping("/login/GoogleCalendarLink.do")
	public String GoogleCalendarLink(
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model,
			@RequestParam Map<String, Object> map1) throws Exception {		
		try{
		LoginVO loginVO = (LoginVO) request.getSession().getAttribute("loginVO");
		String sabun = loginVO.getPerSabun();
		Util.d("sabun", sabun);
		model.addAttribute("PerSabun", loginVO.getPerSabun());
		return "login/GoogleCalendarLink";
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	/*
	 *  DB를 통해 구글 계정 인증된 여부 및 캘린더 리스트를 조회한다
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/getGoogleAuthInfo.do")
	public void getGoogleAuthInfo(
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model,
			@RequestParam Map<String, Object> map) throws Exception {
				
		try {
			LoginVO loginVO = (LoginVO)request.getSession().getAttribute("loginVO");
			map.put("PerSabun", loginVO.getPerSabun());
			map.put("PerId", loginVO.getPerId());			
			
			Util.d("PerSabun", loginVO.getPerSabun());
			Util.d("PerId", loginVO.getPerId());
						
			Map dataMap = new HashMap();
			Map param = new HashMap();
			
			// 인증여부 조회			
			Map resultMap = googleCalendarService.GetGoogleAuthInfo(map);
			dataMap.put("googleAuthInfo", resultMap);			
			
			//인증사용자면 이메일주소, 달력목록 조회
			if( resultMap.get("authFlag").equals("Y") ){
				dataMap.put("email", resultMap.get("email"));
				dataMap.put("calendarList", googleCalendarService.GetGoogleCalendarList(map));
			}		
			
			AjaxResponse.responseAjaxObject(response, dataMap );			
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
	}
	
	/*
	 * @@ deprecated 삭제예정
	 */
	@RequestMapping("/AuthGoogleAccount.do")
	public void AuthGoogleAccount(
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model,
			@RequestParam Map<String, Object> map) throws Exception {
		
		try {
			LoginVO loginVO = (LoginVO)request.getSession().getAttribute("loginVO");
		
			Map dataMap = new HashMap<String,Object>();
			AjaxResponse.responseAjaxObject(response, dataMap );				
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
	}	
	
	/*
	 *  구글 인증 후 리다이렉트 URI 로 지정
	 */
	@RequestMapping("/AuthGoogleRedirect.do")
	public String AuthGoogleRedirect(			
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model,
			@RequestParam Map<String, Object> map) throws Exception {
		
		try {			
			/*
			 *  synergyict001@gmail.com / tooza!@34 계정 google dev console
			 *  redirect URL 도메인 셋팅 필요
			 *  인사이드 : gw.synergynet.co.kr, IB : ib.synergynet.co.kr
			 */
			
			String perSabun = map.get("state").toString();
			String authCode = map.get("code").toString();

			Map param = new HashMap();
			param.put("PerSabun", perSabun);
			param.put("code", authCode);
			
			boolean ret = googleCalendarService.doAuthWithCode(param);
			model.addAttribute("authSuccess", ret);
			
			// 인증완료시 이메일주소 조회 후 업데이트
			if( ret ){
				googleCalendarService.UpdateGoogleEmail(param);
			}
		}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
		
		return "login/GoogleCalendarCallback";
	}
	
	/*
	 *  구글 계정연동 해제	  
	 */
	@RequestMapping("/UnlinkGoogleAccount.do")
	public void UnlinkGoogleAccount(
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model,
			@RequestParam Map<String, Object> map) throws Exception {
		
		try {
			LoginVO loginVO = (LoginVO)request.getSession().getAttribute("loginVO");
			
			googleCalendarService.UnlinkGoogleAccount(map); 
			
			//Utill.d("LoginVO",loginVO.getPerSabun());
			Map dataMap = new HashMap<String,Object>();
			AjaxResponse.responseAjaxObject(response, dataMap);				
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
	}
	
	/*
	 * 구글 일정연동할 달력ID 저장
	 */
	@RequestMapping("/UpdateGoogleCalendarInfo.do")
	public void UpdateGoogleCalendarInfo(
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model,
			@RequestParam Map<String, Object> map) throws Exception {
		
		try {
			LoginVO loginVO = (LoginVO)request.getSession().getAttribute("loginVO");
			
			googleCalendarService.UpdateGoogleCalendarInfo(map);  
			
			//Utill.d("LoginVO",loginVO.getPerSabun());
			Map dataMap = new HashMap<String,Object>();
			AjaxResponse.responseAjaxObject(response, dataMap);				
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
	}
	
}
