package ib.meetingRoom.web;

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
public class MeetingRoomController {
   
	
	@Resource(name = "meetingRoomService")
    private MeetingRoomService meetingRoomService;	
	
	/** log */
    protected static final Log LOG = LogFactory.getLog(MeetingRoomController.class);

    
    
    //회의실 관리
  	@RequestMapping(value="/meetingRoom/meetingRoomReg.do")
  	public String meetingRoomReg(
					  			HttpSession session,
					  			HttpServletRequest request,
					  			ModelMap model,
					  			@RequestParam Map<String,Object> map ) throws Exception{

  		return "/meetingRoom/meetingRoomReg";
  	}
    
  	
  	//회의실등록 팝업
  	@RequestMapping(value="/meetRoom/openRegMeetingRoomPop/pop.do")
  	public String openRegMeetingRoomPop(
  			HttpSession session,
  			HttpServletRequest request,
  			ModelMap model,
  			@RequestParam Map<String,Object> map ) throws Exception{

  		model.addAllAttributes(map);

  		return "/meetingRoom/openRegMeetingRoomPop";
	}
  	
  	
  	//회의실 저장
  	@RequestMapping(value="/meetingRoom/doSaveMeetingRoom.do")
  	public void doSaveMeetingRoom(
  			HttpSession session,
  			HttpServletResponse response,
  			HttpServletRequest request,
  			ModelMap model,
  			@RequestParam Map<String,Object> map ) throws Exception{

  		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		map.put("userSeq", loginUser.getStaffSnb());

  		int cnt= meetingRoomService.doSaveMeetingRoom(map);

  		AjaxResponse.responseAjaxSave(response,cnt);

	}

  	
  	//회의실 순서 업데이트
  	@RequestMapping(value="/meetingRoom/doSortChange.do")
  	public void doSortChange(
  			HttpSession session,
  			HttpServletResponse response,
  			HttpServletRequest request,
  			ModelMap model,
  			@RequestParam Map<String,Object> map ) throws Exception{

  		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		map.put("userSeq", loginUser.getStaffSnb());

  		int cnt= meetingRoomService.doSortChange(map);

  		AjaxResponse.responseAjaxSave(response,cnt);

	}
  	
  	
  	//회의실 리스트
  	@RequestMapping(value="/meetingRoom/getMeetingRoomList.do")
  	public void getMeetingRoomList(
					  			HttpSession session,
					  			HttpServletResponse response,
					  			HttpServletRequest request,
					  			ModelMap model,
					  			@RequestParam Map<String,Object> map ) throws Exception{


  		List list= meetingRoomService.getMeetingRoomList(map);

  		AjaxResponse.responseAjaxSelect(response,list);

	}
  	
	
    //예약화면
	@RequestMapping(value="/meetingRoom/meetingRoomMgmt.do")
	public String meetingRoomMgmt( 
			HttpSession session,
			HttpServletRequest request,
			ModelMap model,
			@RequestParam Map<String,Object> map ) throws Exception{
		
		//회의실리스트 20170907 ksm
		List list= meetingRoomService.getMeetingRoomList(map);
		model.addAttribute("meetingRoomList", list);
		
		return "/meetingRoom/meetingRoomMgmt";
    }
	
	// 회의실 리스트
	@RequestMapping(value = "/meetingRoomListPop.do")
	public String meetingRoomListPop(
			HttpSession session,
			HttpServletResponse response,
			HttpServletRequest request,
			ModelMap model,
			@RequestParam Map<String,Object> map) throws Exception {
		
		model.addAllAttributes(map);
		return "/meetingRoom/meetingRoomListPop";
	}

	//예약 내역 가저오기 
	@RequestMapping(value="/meetingRoom/getMeetingRoomRsvList.do")
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
	
	//일정 내역
	@RequestMapping(value="/meetingRoom/getScheduleList.do")
	public void getScheduleList( 
			HttpSession session,
			HttpServletResponse response,
			HttpServletRequest request,
			ModelMap model,
			@RequestParam Map<String,Object> map ) throws Exception{
		
		List list= meetingRoomService.getScheduleList(map);
		
		AjaxResponse.responseAjaxSelect(response,list);
		
    }
	
	//예약하기
	@RequestMapping(value="/meetingRoom/doSaveRsvMeetingRoom.do")
	public void doSaveRsvMeetingRoom( 
			HttpSession session,
			HttpServletResponse response,
			HttpServletRequest request,
			ModelMap model,
			@RequestParam Map<String,Object> map ) throws Exception{
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		map.put("userSeq", loginUser.getStaffSnb());
		int chk = meetingRoomService.doSaveRsvMeetingRoom(map);
		
		AjaxResponse.responseAjaxSave(response, chk);
		
    }
	
	//삭제하기
	@RequestMapping(value="/meetingRoom/doDeleteRsvMeetingRoom.do")
	public void doDeleteRsvMeetingRoom( 
			HttpSession session,
			HttpServletResponse response,
			HttpServletRequest request,
			ModelMap model,
			@RequestParam Map<String,Object> map ) throws Exception{
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		map.put("userSeq", loginUser.getStaffSnb());
		meetingRoomService.doDeleteRsvMeetingRoom(map);
		
		AjaxResponse.responseAjaxSave(response, 1);
		
    }
}
