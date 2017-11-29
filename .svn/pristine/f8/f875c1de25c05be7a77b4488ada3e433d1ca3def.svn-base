package ib.mobile.web;

import ib.cmm.FileUpDbVO;
import ib.cmm.LoginVO;
import ib.cmm.service.CommonService;
import ib.cmm.util.sim.service.AjaxResponse;
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
public class MbWorkMemoController {
	
    @Resource(name = "workMemoService")
    WorkMemoService workMemoService;
    
    @Resource(name = "workService")
    WorkService workService;

    /** log */
    protected static final Log LOG = LogFactory.getLog(MbWorkMemoController.class);
	
	
    //메모 리스트 가져오기
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/schedule/getMemoList.do")
  	public void getMemoList(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
  		
  		map.put("sabun", loginUser.getSabun());
  		List<Map>list =workMemoService.getMemoListForMobile(map);
  		
  		AjaxResponse.responseAjaxSelect(response, list);
  		
  	}
  	
    //메모 리스트 가져오기(forPaging)
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/schedule/getMemoListForPaing.do")
  	public void getMemoListForPaing(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
  		
  		map.put("sabun", loginUser.getSabun());
  		Map resultMap =workMemoService.getMemoListForMobilePaging(map);
  		
  		AjaxResponse.responseAjaxObject(response, resultMap);
  		
  	}
  	
    //메모 보기화면
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "/m/schedule/memoViewPop_openLayer.do")
  	public String memoViewPop(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
  		
  		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
  		
  	
  		model.addAllAttributes(map);
  		
  		return "/m/schedule/memoView";
  		
  	}
  	
    //메모 더보기화면
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "/m/schedule/memoMoreViewPop_openLayer.do")
  	public String memoMoreViewPop(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
  		
  		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
  		
  	
  		model.addAllAttributes(map);
  		
  		return "/m/schedule/memoMoreViewPop";
  		
  	}
  	
  	
  	
    //메모 글리스트
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "/m/schedule/getMemoDetail.do")
  	public void getMemoDetail(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
  		
  	
  		AjaxResponse.responseAjaxSelect(response, workMemoService.getMemoMobileDetail(map));
  		
  	}
  	
    //메모 첫글 조회 
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "/m/schedule/getFirstCommentInfo.do")
  	public void getFirstCommentInfo(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
  		
  		Map resultMap = workMemoService.getFirstCommentInfo(map);
  		
  		if(resultMap ==  null){
  			map.put("mainSnb", map.get("sNb").toString());
  			
  			resultMap = workMemoService.getFirstCommentInfo(map);
  			
  		}
  		
  		AjaxResponse.responseAjaxObject(response, resultMap);
  			
  	}
  	
    //메모 글정보
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "/m/schedule/getCommentInfo.do")
  	public void getCommentInfo(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
  		
  		Map resultMap = workMemoService.getCommentInfo(map);
  		
  		AjaxResponse.responseAjaxObject(response, resultMap);
  			
  	}
  	
    //메모 댓글정보
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "/m/schedule/getReplyInfo.do")
  	public void getReplyInfo(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
  		
  	
  		AjaxResponse.responseAjaxObject(response, workMemoService.getReplyInfo(map));
  		
  	}

  	
  	
    //메모 등록 & 수정(본글)
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "/m/schedule/doSaveMemo.do")
   	public void doSaveMemo(
   			HttpServletRequest req,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map
   			) throws Exception {
   		
   		int saveCnt =0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
   		
	   		map.put("rgNm", loginUser.getName());
	   		map.put("rgId", loginUser.getId());
	   		map.put("sabun", loginUser.getSabun());
	   		map.put("name", loginUser.getName());
	   		map.put("rgUserId", loginUser.getStaffSnb());
	   		
	   		saveCnt = workMemoService.doSaveMemo(map);
		}
   		
   		AjaxResponse.responseAjaxSave(response, saveCnt);
  		
   	}
   	
   	//메모 삭제 (본글)
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "/m/schedule/doDeleteFirstComment.do")
   	public void doDeleteFirstComment(
   			HttpServletRequest req,WorkVO vo,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map
   			) throws Exception {
   		
   		int saveCnt =0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
			
			saveCnt = workMemoService.doDeleteMemoFirst(vo);
		}
   		
		
   		
   		AjaxResponse.responseAjaxSave(response, saveCnt);
  		
   	}
   	
   	//메모  등록 & 수정 (댓글)
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "/m/schedule/doSaveReply.do")
   	public void doSaveReply(
   			HttpServletRequest req,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map
   			) throws Exception {
   		
   		int saveCnt =0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		if(loginUser == null){
			
			saveCnt=-8;
		}else{

	   		map.put("rgNm", loginUser.getName());
	   		map.put("rgId", loginUser.getId());
	 		map.put("sabun", loginUser.getSabun());
	   		map.put("name", loginUser.getName());
	   		map.put("rgUserId", loginUser.getStaffSnb());
	   		
	   		saveCnt = workMemoService.doSaveReply(map);
		}
   		
   		
   		AjaxResponse.responseAjaxSave(response, saveCnt);
  		
   	}
   	
	//메모 삭제 (댓글)
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "/m/schedule/doDeleteReply.do")
   	public void doDeleteReply(
   			HttpServletRequest req,WorkVO vo,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map
   			) throws Exception {
   		
   		int saveCnt =0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
			
			saveCnt = workMemoService.doDeleteReply(vo);
		}
   		
		AjaxResponse.responseAjaxSave(response, saveCnt);
  		
   	}
   	
	//메모 참가자 추가
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "/m/schedule/doSaveEntry.do")
   	public void doSaveEntry(
   			HttpServletRequest req,WorkVO vo,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map
   			) throws Exception {
   		
   		int saveCnt = 0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		if(loginUser == null){
			
			saveCnt = -8;
		}else{
			

	   		map.put("rgId", loginUser.getId());
	   		map.put("sabun", loginUser.getSabun());
	   		
	   		saveCnt = workMemoService.doSaveEntry(map);
		}
   		
   		
   		AjaxResponse.responseAjaxSave(response, saveCnt);
  		
   	}
   	
   	
	//메모 읽음 확인
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "/m/schedule/saveLastReadDate.do")
   	public void saveLastReadDate(
   			HttpServletRequest req,WorkVO vo,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map
   			) throws Exception {
   		
   		int saveCnt =0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
			
			map.put("rgId", loginUser.getId());
	   		map.put("sabun", loginUser.getSabun());
	   		saveCnt = workMemoService.saveLastReadDate(map);
		}
   		
   		AjaxResponse.responseAjaxSave(response, saveCnt);
  		
   	}
   	
	// 메모 검색 팝업
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/m/schedule/memoSearchViewPop_openLayer.do")
	public String memoSearchView(
			@RequestParam Map map,HttpSession session,
			Model model) throws Exception {
	
		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
	
		
		return "m/schedule/memoSearchViewPop";
	}
  	
   	
	// 오늘 신규 메모 검색 팝업
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/m/schedule/todayNewMemoViewPop_openLayer.do")
	public String todayNewMemoView(
			@RequestParam Map map,HttpSession session,
			Model model) throws Exception {
	
		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
	
		
		return "m/schedule/todayNewMemoViewPop";
	}
	
	// 오늘 신규 메모 리스트 
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/m/schedule/getTodayNewMemoList.do")
	public void getTodayNewMemoList(
			@RequestParam Map map,HttpSession session,HttpServletResponse response,
			Model model) throws Exception {
	
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		map.put("sabun", loginUser.getSabun());
		map.put("rgId", loginUser.getId());
		
		List newMemoList = workMemoService.getTodayNewMemoList(map);
	
		AjaxResponse.responseAjaxSelect(response, newMemoList);
	}
  	
   	
	
}