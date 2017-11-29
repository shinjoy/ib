package ib.cmm.web;


import ib.cmm.LoginVO;
import ib.cmm.service.CommonService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.login.service.StaffVO;
import ib.person.service.impl.PersonDAO;
import ib.work.service.WorkVO;

import java.util.ArrayList;
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



@Controller
public class CommonController {

	@Resource(name = "commonService")
	private CommonService commonService;
	
	@Resource(name = "personDAO")
	private PersonDAO personDAO;
	
	protected static final Log logger = LogFactory.getLog(CommonController.class);

	
	
	/**
	 * 공통코드
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2015. 6. 24.
	 */
	@RequestMapping(value = "/common/getCommonCode.do")
	public void getCommonCode(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,String> map) throws Exception {
		
		
		List<Map> list = commonService.getCommonCode(map);
				
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
	}
	
	
	/**
	 * 직원리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2015. 6. 24.
	 */
	@RequestMapping(value = "/common/getStaffList.do")
	public void getStaffList(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,String> map) throws Exception {
		
		
		List<Map> list = commonService.getStaffList(map);
			
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
	}
	
	
	/**
	 * 직원리스트 (이름소팅)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2015. 6. 24.
	 */
	@RequestMapping(value = "/common/getStaffListNameSort.do")
	public void getStaffListNameSort(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,String> map) throws Exception {
		
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		List<Map> list = commonService.getStaffListNameSort(map);
		
		
		AjaxResponse.responseAjaxSelect(response,list );	//결과전송
	}
	
	/**
	 * divisionList(sort 정렬)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2016. 7. 12.
	 */
	@RequestMapping(value = "/common/getDivisionList.do")
	public void getDivisionList(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,String> map) throws Exception {
		
		
		List<Map> list = commonService.getSelectDivisionList(map);
				
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
	}
	
	
	/**
	 * 부서 리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 8. 10.
	 */
	@RequestMapping(value = "/common/getDeptList.do")
	public void getDeptList(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,String> map) throws Exception {
		
		
		List<Map> list = commonService.getDeptList(map);
				
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
	}
	
	
	
	/**
	 * 직원선택 공통팝업
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: sjy
	 * @date		: 2017. 1. 9.
	 */
	@RequestMapping(value="/common/selectUserCheckPopup.do")
	public String selectUserCheckPopup(HttpServletRequest request,
			HttpSession session,HttpServletResponse response,
			@RequestParam Map<String,Object> map,
			ModelMap model) throws Exception{
		
		model.addAllAttributes(map);
		return "user/selectUserCheckPopup";
	}
	
	
}