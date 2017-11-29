package ib.alarm.web;

import ib.alarm.service.AlarmService;
import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.util.sim.service.AjaxResponse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



/**
 * <pre>
 * package  : ib.alarm.web
 * filename : AlarmController.java
 * </pre>
 * 
 */
@Controller
public class AlarmController {
	
	@Resource(name="alarmService")
	private AlarmService alarmService;
	
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;

	/** log */
    protected static final Log LOG = LogFactory.getLog(AlarmController.class);

    /**
	 * 팝업 알람공지 리스트 index
	 * @MethodName : 
	 * @param
	 * @param 
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/alarm/index.do")
	public String alarmIndex(HttpServletRequest request,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		return "/alarm/alarmList";
	}
	
	/**
	 * 팝업 알람공지 리스트
	 * @MethodName : 
	 * @param
	 * @param 
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/alarm/getAlarmList.do")
	public void getAlarmList(HttpServletRequest request,
			HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,Object> map,
			ModelMap model) throws Exception{
		Map<String, Object> resultMap =alarmService.getAlarmList(map);
		AjaxResponse.responseAjaxSelectForPage(response, resultMap);	//결과전송
	}
	/**
	 * 등록/수정 팝업
	 * @MethodName : 
	 * @param
	 * @param 
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/alarm/regAlarm.do")
	public String regAlarm(HttpServletRequest request,
			HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,Object> map,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		model.addAttribute("alarmId",map.get("alarmId"));
		return "/alarm/regAlarm";
	}
	/**
	 * 알림 상세보기
	 * @MethodName : 
	 * @param
	 * @param 
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/alarm/getAlarmDetail.do")
	public void getAlarmDetail(HttpServletRequest request,
			HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,Object> map,
			ModelMap model) throws Exception{
			
		List<Map>list=alarmService.getAlarmDetail(map);
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
	}
	/**
	 * 알림 저장
	 * @MethodName : 
	 * @param
	 * @param 
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/alarm/saveAlarm.do")
	public void saveAlarm(HttpServletRequest request,
			HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,Object> map,
			ModelMap model) throws Exception{
		int saveCnt=0;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		map.put("staffSnb", loginUser.getStaffSnb());	
		int alarmId = alarmService.saveAlarm(map);	//등록 및 수정. alarmId 0 신규등록 ,외 수정
		map.put("alarmId", alarmId);
		alarmService.insertTarget(map);				/*targetList 저장*/
		saveCnt=1;
		AjaxResponse.responseAjaxSave(response, saveCnt);
	}
	/**
	 * 알림 삭제
	 * @MethodName : 
	 * @param
	 * @param 
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/alarm/deleteAlarm.do")
	public void deleteAlarm(HttpServletRequest request,
			HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,Object> map,
			ModelMap model) throws Exception{
		int saveCnt=0;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		map.put("sabun", loginUser.getSabun());	
		alarmService.deleteAlarm(map);	//삭제
		saveCnt=1;
		AjaxResponse.responseAjaxSave(response, saveCnt);
	}
	
	/**
	 * 알림 팝업 정보 반환
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/alarm/alarmInfo.do")
	public String getAlarmInfo( 
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		String id = request.getParameter("id");
		Map map  = new HashMap<String, Object>();
		map.put("alarmId", id);
		
		//아이디에 해당하는 알림 팝업창 정보 반환
		Map resultMap = alarmService.selectPopupInfo(map);
		LOG.info("##############");
		LOG.info(resultMap);
		model.addAttribute("alarm", resultMap);	
		
		return "basic/popAlarm";
	}
	
	/**
	 * 알림을 받는 유저리스트
	 * @MethodName : 
	 * @param
	 * @param 
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/alarm/getAlarmTargetList.do")
	public void getAlarmTargetList(HttpServletRequest request,
			HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,Object> map,
			ModelMap model) throws Exception{
			
		List<Map>list=alarmService.getAlarmTargetList(map);
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
	}
	
	/**
	 * 알림 공지대상자 조회페이지
	 * @MethodName : 
	 * @param
	 * @param 
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/alarm/getAlaUserList.do")
	public String getAlaUserList(HttpServletRequest request,
			HttpSession session,HttpServletResponse response,
			ModelMap model) throws Exception{
			
		model.addAttribute("deptList",alarmService.selectDeptList(null));
		return "alarm/popAlarmUser";
	}
	
	/**
	 * 알림 공지대상자 조회
	 * @MethodName : 
	 * @param
	 * @param 
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/alarm/selectAlarmUser.do")
	public void selectAlarmUser(HttpServletRequest request,
			HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,Object> map,
			ModelMap model) throws Exception{
		
		Map<String, Object> resultMap = alarmService.selectAlarmUsers(map);
		AjaxResponse.responseAjaxSelectForPage(response, resultMap);	//결과전송
	}
	
	
}