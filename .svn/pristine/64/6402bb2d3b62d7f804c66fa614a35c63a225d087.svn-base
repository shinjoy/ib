package ib.mobile.web;

import ib.cmm.LoginVO;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.meetingRoom.service.MeetingRoomService;
import ib.meetingRoom.service.impl.MeetingRoomServiceImpl;


import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MbMeetingRoomController {
   
	
	@Resource(name = "meetingRoomService")
    private MeetingRoomService meetingRoomService;	

	
	/** log */
    protected static final Log LOG = LogFactory.getLog(MbMeetingRoomController.class);

	
    //예약화면
	@RequestMapping(value="/m/meetingRoom/meetingRoomMgmt.do")
	public String meetingRoomMgmt( 
			HttpSession session,
			HttpServletRequest request,
			ModelMap model,
			@RequestParam Map<String,Object> map ) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
		
		return "m/meetingRoom/meetingRoomMgmt";
    }
	
	// 회의실 리스트
	@RequestMapping(value = "/m/meetingRoomListPop.do")
	public String meetingRoomListPop(
			HttpSession session,
			HttpServletResponse response,
			HttpServletRequest request,
			ModelMap model,
			@RequestParam Map<String,Object> map) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
		
		model.addAllAttributes(map);
		return "m/meetingRoom/meetingRoomListPop";
	}
	
	
	//예약 내역 가저오기 
	@RequestMapping(value="/m/meetingRoom/getMeetingRoomRsvList.do")
	public void getMeetingRoomRsvList( 
			HttpSession session,
			HttpServletResponse response,
			HttpServletRequest request,
			ModelMap model,
			@RequestParam Map<String,Object> map ) throws Exception{
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		map.put("userSeq", loginUser.getStaffSnb());
		
		List list= meetingRoomService.getMeetingRoomRsvList(map);
		
		AjaxResponse.responseAjaxSelect(response,list);
		
    }
	
	
	


}
