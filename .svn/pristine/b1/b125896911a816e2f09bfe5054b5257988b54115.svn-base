package ib.mobile.web;

import ib.cmm.LoginVO;
import ib.cmm.service.CommonService;
import ib.cmm.util.sim.service.AjaxResponse;


import ib.work.service.WorkDiaryService;
import ib.work.service.WorkService;

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
public class MbWorkDiaryController {
	
    @Resource(name = "workDiaryService")
    WorkDiaryService workDiaryService;

    /** log */
    protected static final Log LOG = LogFactory.getLog(MbWorkDiaryController.class);
	
	//업무일지 리스트 가져오기
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "m/schedule/getWorkList.do")
	public void getWorkList(
			HttpServletRequest req,
			HttpServletResponse response,HttpSession session,
			ModelMap model, @RequestParam Map<String,Object>map
			) throws Exception {
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		map.put("sabun", loginUser.getSabun());
		List<Map>list =workDiaryService.getWorkListByNoPaging(map);
		
		AjaxResponse.responseAjaxSelect(response, list);
		
	}
	
	//업무일지 등록페이지
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "/m/schedule/workProcPop_openLayer.do")
	public String MbWorkDiaryProc(
			HttpServletRequest req,
			HttpServletResponse response,HttpSession session,
			ModelMap model, @RequestParam Map<String,Object>map
			) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		if(!map.containsKey("sNb")) map.put("sNb", "0");
		
		model.addAllAttributes(map);
		
		return "m/schedule/MbWorkDiaryProc";
		
	}
	
	//업무일지 상세보기
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "/m/schedule/workViewPop_openLayer.do")
	public String MbWorkDiaryView(
			HttpServletRequest req,
			HttpServletResponse response,HttpSession session,
			ModelMap model, @RequestParam Map<String,Object>map
			) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		if(!map.containsKey("sNb")) map.put("sNb", "0");
		
		model.addAllAttributes(map);
		
		return "m/schedule/MbWorkDiaryView";
		
	}
	
	//업무일지 등록페이지
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "m/schedule/getWorkDiaryInfo.do")
	public void getWorkDiaryInfo(
			HttpServletRequest req,
			HttpServletResponse response,HttpSession session,
			ModelMap model, @RequestParam Map<String,Object>map
			) throws Exception {
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
		List list = workDiaryService.getWorkListByNoPaging(map);
		
		Object object = null;
		
		if(list.size()>0) object = list.get(0);
		
		AjaxResponse.responseAjaxObject(response, object);
	
	}
	
	
	
	
	//업무일지 수정&등록
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "m/schedule/workDiarySave.do")
	public void workDiarySave(
			HttpServletRequest req,
			HttpServletResponse response,HttpSession session,
			ModelMap model, @RequestParam Map<String,Object>map
			) throws Exception {
		
		int saveCnt =0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
			map.put("name", loginUser.getName());
			map.put("rgId", loginUser.getId());
			
			saveCnt = workDiaryService.saveWorkDiary(map);
		}
		
		
		AjaxResponse.responseAjaxSave(response, saveCnt);
		
	}
	
	//업무일지 상태값 변경
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "m/schedule/workDiaryProcess.do")
	public void workDiaryProcess(
			HttpServletRequest req,
			HttpServletResponse response,HttpSession session,
			ModelMap model, @RequestParam Map<String,Object>map
			) throws Exception {
		
		int saveCnt =0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
			map.put("rgId", loginUser.getUserId());
			workDiaryService.workDiaryProcess(map);
		}
		
		AjaxResponse.responseAjaxSave(response, saveCnt);
		
	}
	
	//업무일지 삭제
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "m/schedule/deleteWorkDiary.do")
	public void deleteWorkDiary(
			HttpServletRequest req,
			HttpServletResponse response,HttpSession session,
			ModelMap model, @RequestParam Map<String,Object>map
			) throws Exception {
		
		int saveCnt =0;
		
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		if(loginUser == null){
			
			saveCnt=-8;
		}else{
			
			saveCnt = workDiaryService.deleteWorkDiary(map);
		}
	
		AjaxResponse.responseAjaxSave(response, saveCnt);
		
	}
	
	
	
	
	
	
	
	
}