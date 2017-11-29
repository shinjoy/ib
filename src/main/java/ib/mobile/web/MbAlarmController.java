package ib.mobile.web;

import ib.cmm.FileUpDbVO;
import ib.cmm.LoginVO;
import ib.cmm.service.CommonService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.push.service.PushService;
import ib.schedule.service.SpCmmVO;
import ib.schedule.service.impl.ScheduleVO;
import ib.work.service.WorkMemoService;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;
import ib.work.web.WorkMemoController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import egovframework.rte.fdl.property.EgovPropertyService;


@Controller
public class MbAlarmController {
	
    @Resource(name = "pushService")
    PushService pushService;
   

    /** log */
    protected static final Log LOG = LogFactory.getLog(MbAlarmController.class);
	
  
    //알람 리스트 페이지
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/commonPop/alarmListMainPop_openLayer.do")
  	public String alarmListMainPop(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
  		
  		if(loginUser == null)  return "m/sessionOut";
  		return "/m/commonPop/alarmListMainPop";
  		
  	}
  	
    //알람 리스트
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "/m/alarm/getAlarmList.do")
   	public void getAlarmList(
   			HttpServletRequest req,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map
   			) throws Exception {
   		
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		map.put("userId", loginUser.getStaffSnb());
		
		List list = pushService.getAlarmList(map);
		AjaxResponse.responseAjaxSelect(response, list);
   		
   	}
   	
    // 알람 읽음 처리 
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "/m/alarm/updateAlarmReadStatus.do")
   	public void updateAlarmReadStatus(
   			HttpServletRequest req,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map
   			) throws Exception {
   		
   	
   		int saveCnt = 0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		if(loginUser == null){
			
			saveCnt=-8;
			
		}else{
			map.put("userId", loginUser.getStaffSnb());
			
			saveCnt = pushService.updateAlarmReadStatus(map);
		}
		
   		
   		
		AjaxResponse.responseAjaxSave(response, saveCnt);
   		
   	}
   	
   	
    //알람 세팅 페이지
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/alarm/setAlarmPop_openLayer.do")
  	public String setAlarmPop(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  	
  		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
  		
  		
  		return "/m/commonPop/setAlarmPop";
  		
  	}
  	
  	//알람 정보 변경 
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "/m/alarm/updateUserProfileToPushInfo.do")
   	public void savePushInfo(
   			HttpServletRequest req,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map
   			) throws Exception {
   		
   	
   		int saveCnt = 0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		if(loginUser == null){
			
			saveCnt=-8;
			
		}else{
			map.put("userId", loginUser.getStaffSnb());
			
			saveCnt = pushService.updateUserProfileToPushInfo(map);
		}
		
   		
   		
		AjaxResponse.responseAjaxSave(response, saveCnt);
   		
   	}
   	
   	//안읽은 갯수 
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "/m/alarm/getNoReadCount.do")
   	public void getNoReadCount(
   			HttpServletRequest req,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map
   			) throws Exception {
   		
   	
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		map.put("userId", loginUser.getStaffSnb());
		
		int pushCount = pushService.getBadgeCount(map);
   		
   		
		AjaxResponse.responseAjaxSave(response, pushCount);
   		
   	}

   	
	
}