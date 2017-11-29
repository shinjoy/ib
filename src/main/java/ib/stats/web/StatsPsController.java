package ib.stats.web;

import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.cmm.util.sim.service.LogUtil;
import ib.stats.service.StatsPsService;
import ib.stats.service.StatsVO;
import ib.stats.service.impl.StatsDAO;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;
import ib.work.service.impl.WorkDAO;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
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

import com.google.gson.Gson;


/**
 * <pre>
 * package	: ib.stats.web 
 * filename	: StatsPsController.java
 * </pre>
 * 
 * 
 * 
 * @author	: oys
 * @date	: 2017. 1. 3.
 * @version : 
 *
 */
@Controller
public class StatsPsController {


    @Resource(name = "statsPsService")
    private StatsPsService statsPsService;
    
    
    
	/** log */
    protected static final Log logger = LogFactory.getLog(StatsPsController.class);

	protected static Calendar cal = Calendar.getInstance();


	/**
	 * PS 설정 화면
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 3.
	 */
	@RequestMapping(value="/stats/psConfig.do")
	public String psConfig(HttpServletRequest request,
							HttpServletResponse response,
							HttpSession session, ModelMap model,
							@RequestParam Map<String,String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";

    	return "stats/psConfig";
    }
	
	
	/**
	 * 유형 정보 코드 전체
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 3.
	 */
	@RequestMapping(value="/stats/getMezzTypeAll.do")
	public void getMezzTypeAll(HttpServletRequest request,
							HttpServletResponse response,
							HttpSession session, ModelMap model,
							@RequestParam Map<String,String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		List<Map> info = statsPsService.getMezzTypeAll((Map)map);
				
		AjaxResponse.responseAjaxSelect(response, info);	//결과전송
    }
	
	
	/**
	 * 유형 정보
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 3.
	 */
	@RequestMapping(value="/stats/getPsMezzType.do")
	public void getPsMezzType(HttpServletRequest request,
							HttpServletResponse response,
							HttpSession session, ModelMap model,
							@RequestParam Map<String,String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		List<Map> info = statsPsService.getPsMezzType((Map)map);
				
		AjaxResponse.responseAjaxSelect(response, info);	//결과전송
    }
	
	
	/**
	 * 선택 유형 정보 저장
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 5.
	 */
	@RequestMapping(value = "/stats/doSaveMezzType.do")
	public void doSaveMezzType(HttpServletRequest request,
							HttpServletResponse response, ModelMap model,
							HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		map.put("userSeq", loginUser.getStaffSnb());
		
		List<String> typeList = Arrays.asList(((String)map.get("typeList")).split(","));		//저장할 유형문자열들
		
		List<Map> infoList = new ArrayList<Map>();
		
		//저장할 정보 Map 구성
		for(int i=0; i<typeList.size(); i++){
			if(typeList.get(i).length() > 0){		//정상 유형 코드일때만(한개도 선택하지 않을때 예외처리)
				Map m = new HashMap();
				m.put("psMezzYear", map.get("year").toString());
				m.put("psIbMatch",	typeList.get(i));
				m.put("userSeq", 	loginUser.getStaffSnb()); 	//등록자id	추가
				
				infoList.add(m);	//추가
			}
		}
		
		map.put("typeList", infoList);				//json string 을 ArrayList 로 바꿔 전달한다.
		
		statsPsService.doSaveMezzType(map);
		
		AjaxResponse.responseAjaxSave(response, 1);		//결과전송
	}
	
	
	/**
	 * 직원 정보
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 3.
	 */
	@RequestMapping(value="/stats/getPsMezzStaff.do")
	public void getPsMezzStaff(HttpServletRequest request,
							HttpServletResponse response,
							HttpSession session, ModelMap model,
							@RequestParam Map<String,String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		List<Map> info = statsPsService.getPsMezzStaff((Map)map);
				
		AjaxResponse.responseAjaxSelect(response, info);	//결과전송
    }
	
	
	/**
	 * 메자닌 성과 설정 정보
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 3.
	 */
	@RequestMapping(value="/stats/getPsMezzConfigInfo.do")
	public void getPsMezzConfigInfo(HttpServletRequest request,
							HttpServletResponse response,
							HttpSession session, ModelMap model,
							@RequestParam Map<String,String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		List<Map> info = statsPsService.getPsMezzConfigInfo((Map)map);
				
		AjaxResponse.responseAjaxSelect(response, info);	//결과전송
    }
	
		
	/**
	 * 메자닌 성과 설정정보 저장
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 5.
	 */
	@RequestMapping(value = "/stats/doSavePsConfigInfo.do")
	public void doSavePsConfigInfo(HttpServletRequest request,
							HttpServletResponse response, ModelMap model,
							HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		map.put("userSeq", loginUser.getStaffSnb());
		
		int upCnt = 0;
		
		upCnt = statsPsService.doSavePsConfigInfo(map);
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
		
	/**
	 * 연봉, 목표, ROLL RATE 수정
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 3.
	 */
	@RequestMapping(value="/stats/editStaffInfo.do")
	public String editStaffInfo(HttpServletRequest request,
							HttpServletResponse response,
							HttpSession session, ModelMap model,
							@RequestParam Map<String,String> map) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";

    	return "stats/editStaffInfo";
    }
	
	
	/**
	 * 직원 정보 저장 (연봉, 목표, ROLL RATE)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 6.
	 */
	@RequestMapping(value = "/stats/doSaveStaffInfo.do")
	public void doSaveStaffInfo(HttpServletRequest request,
							HttpServletResponse response, ModelMap model,
							HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		map.put("userSeq", loginUser.getStaffSnb());
		
		LogUtil.printMap(map);	//map console log
		
		String jsonStr = (String)map.get("staffInfo");
		Gson gson = new Gson();
		ArrayList<Map> infoList = null;
		infoList = gson.fromJson(jsonStr, java.util.ArrayList.class);
		
		//
		for(int i=0; i<infoList.size(); i++){			
			infoList.get(i).put("userSeq", 	loginUser.getStaffSnb()); 	//수정자id	추가		
		}
			
		int upCnt = 1;								//성공 '1'(임시값)
		
		map.put("staffInfo", infoList);				//json string 을 ArrayList 로 바꿔 전달한다.
	
		upCnt = statsPsService.doSaveStaffInfo(map);
		
		AjaxResponse.responseAjaxSave(response, upCnt);	//결과전송
	}
	
	
	/**
	 * 대상자 정보 저장
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 5.
	 */
	@RequestMapping(value = "/stats/doSaveMezzStaff.do")
	public void doSaveMezzStaff(HttpServletRequest request,
							HttpServletResponse response, ModelMap model,
							HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		map.put("userSeq", loginUser.getStaffSnb());
		
		List<String> staffList = Arrays.asList(((String)map.get("staffList")).split(","));		//저장할 대상자 s_nb
		
		List<Map> infoList = new ArrayList<Map>();
		
		//저장할 정보 Map 구성
		for(int i=0; i<staffList.size(); i++){
			if(staffList.get(i).length() > 0){		//정상 유형 코드일때만(한개도 선택하지 않을때 예외처리)
				Map m = new HashMap();
				m.put("psMezzYear", map.get("year").toString());
				m.put("psMezzRole",	map.get("role").toString());
				m.put("psMezzStaff",staffList.get(i));
				m.put("userSeq", 	loginUser.getStaffSnb()); 	//등록자id	추가
				
				infoList.add(m);	//추가
			}
		}
		
		map.put("staffList", infoList);				//json string 을 ArrayList 로 바꿔 전달한다.
		
		statsPsService.doSaveMezzStaff(map);
		
		AjaxResponse.responseAjaxSave(response, 1);		//결과전송
	}
	
}