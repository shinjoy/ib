package ib.person.web;

import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.company.service.CompanyVO;
import ib.company.service.impl.CompanyDAO;
import ib.network.service.impl.NetworkDAO;
import ib.person.service.PersonMgmtService;
import ib.person.service.PersonVO;
import ib.person.service.impl.PersonDAO;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;
import ib.work.service.impl.WorkDAO;

import java.util.Calendar;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * <pre>
 * package  : ib.person.web
 * filename : PersonMgmtController.java
 * </pre>
 * 
 * @author  :
 * @since   :
 * @version : 
 */
@Controller
public class PersonMgmtController {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
    
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;

    @Resource(name = "personDAO")
    private PersonDAO personDAO;   
    
    @Resource(name = "companyDAO")
    private CompanyDAO companyDAO;   
    
    @Resource(name = "networkDAO")
    private NetworkDAO networkDAO;   
    
    @Resource(name = "workDAO")
    private WorkDAO workDAO;   
    
    @Resource(name = "workService")
    private WorkService workService;
    
    
    @Resource(name = "personMgmtService")
	private PersonMgmtService personMgmtService;
    
    
    /** log */
    protected static final Log LOG = LogFactory.getLog(PersonMgmtController.class);
	
	protected static Calendar cal = Calendar.getInstance();

	/**
	 * Main 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return Main Page
	 * @exception Exception
	 */
	@RequestMapping(value="/person/personMgmt.do")
	public String index(@ModelAttribute("personVO") PersonVO personVO,
			CompanyVO companyVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		//List<PersonVO> netList = personDAO.selectNetPointLatest(personVO);
		//model.addAttribute("netList", netList);

		return "person/personMgmt";
    }

	
	/**
	 * 회사별 부서 리스트 ajax
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 01. 15.
	 */
	@RequestMapping(value = "/person/getCpnDeptList.do")
	public void getCpnDeptList(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,String> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;	
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		List<Map> list;
	
		list = personMgmtService.getCpnDeptList((Map)map);
		
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송

	}
	
	
	/**
	 * 고객리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2015. 6. 24.
	 */
	@RequestMapping(value = "/person/getCustList.do")
	public void getCustList(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,String> map) throws Exception {
	
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		map.put("usrId", loginUser.getId());				//사용자 login id
		map.put("usrStaffSnb", loginUser.getStaffSnb());			//사용자 고객id (sequence)
				
		List<Map> list = personMgmtService.getCustList(map);
				
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
		
	}
	
	
	/**
	 * 신규할당 고객리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2015. 6. 24.
	 */
	@RequestMapping(value = "/person/getCustListNewInCharge.do")
	public void getCustListNewInCharge(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,String> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		map.put("usrId", loginUser.getId());				//사용자 login id
		map.put("usrCusId", loginUser.getCusId());			//사용자 고객id (sequence)
				
		List<Map> list = personMgmtService.getCustListNewInCharge(map);
		//Map<String, Object> resultMap = personMgmtService.getCustList((Map)map);
				
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
		//AjaxResponse.responseAjaxSelectForPage(response, resultMap);	//결과전송
	}
	
	
	/**
	 * 신규 할당된 고객리스트 팝업
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 03. 16.
	 */
	@RequestMapping(value = "/person/newCstInChargePopup.do")
	public String newCstInChargePopup(HttpServletRequest request, HttpServletResponse response, ModelMap model,
								HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		model.addAllAttributes(map);	//받은 파라미터 화면으로 그대로 전달.
		
		return "person/newCstInChargePopup";
	}

	
	/**
	 * 담당자 지정 등록 ajax
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 2. 19.
	 */
	@RequestMapping(value = "/person/doAcceptCstManager.do")
	public void doAcceptCstManager(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		/*
		cstList : cstSnbList	//고객 id list (sequence list)
		*/
		
		map.put("userSeq", loginUser.getStaffSnb());
		map.put("cusId", loginUser.getCusId());
		
		int upCnt = 0;
		
		upCnt = personMgmtService.doAcceptCstManager(map);
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
	
	/**
	 * 담당자 변경 팝업
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 03. 15.
	 */
	@RequestMapping(value = "/person/chngCstManagerPopup.do")
	public String chngCstManagerPopup(HttpServletRequest request, HttpServletResponse response, ModelMap model,
								HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		model.addAllAttributes(map);	//받은 파라미터 화면으로 그대로 전달.
		
		return "person/chngCstManagerPopup";
	}
	

	/**
	 * 고객 등록 팝업
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 03. 23.
	 */
	@RequestMapping(value = "/person/regCstPopup.do")
	public String regCstPopup(HttpServletRequest request, HttpServletResponse response, ModelMap model,
								HttpSession session, @RequestParam Map<String,Object> map) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		model.addAllAttributes(map);	//받은 파라미터 화면으로 그대로 전달.
		
		return "person/regCstPopup";
	}
	
	
	/**
	 * 신규 고객 등록 ajax
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 2. 23.
	 */
	@RequestMapping(value = "/person/regCustomer.do")
	public void regNewCst(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;	
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		map.put("rgId", loginUser.getId());
		map.put("staffSnb", loginUser.getStaffSnb());
		
		//int upCnt = 0;
		Map obj;
		obj = personMgmtService.regCustomer(map);			//담당자등록 및 네트워크 등록을 위한 서비스추가후 연결
		
		
		//AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		AjaxResponse.responseAjaxObject(response, obj);			//결과전송

	}
	
	
	/**
	 * 고객이름 찾기(신규등록을 위해 없는 이름) ajax
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 2. 23.
	 */
	@RequestMapping(value = "/person/getCustomerName.do")
	public void getCustomerName(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;	
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		Map cstM = null;
		
		String cstNm = map.get("cstNm").toString();
		int idx = 0;
		
		for(int i=0; i<30; i++){
			if(i>0){
				//cstNm = cstNm + i;	//뒤에 숫자를 붙여서  1,2,...
				map.put("cstNm", cstNm + i);					//다시 찾아볼 이름을 세팅
			}
				
			cstM = personMgmtService.getCustomerByName(map);	//이름으로 찾아본다.
			
			if(cstM==null){		//없을때는
				idx = i;
				break;			//등록할 수 있는 이름이므로 빠져나간다.
			}
		}
		
		Map obj = new HashMap<String,String>();
		obj.put("cstNm", cstNm + idx);				//등록할 수 있는 이름
		obj.put("isExist", (idx>0?"Y":"N"));		//요청한 이름이 있는지 ... 'Y' 있어서 등록할 수 있는 이름을 찾아서 반환해준 케이스
		
		//AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		AjaxResponse.responseAjaxObject(response, obj);			//결과전송

	}
	
	
	/**
	 * 고객 구분 변경 ajax
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 7.
	 */
	@RequestMapping(value = "/person/doSaveCstType.do")
	public void doSaveCstType(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		/*
		cstList : cstSnbList	//고객 id list (sequence list)
		*/
		
		map.put("rgId", loginUser.getId());
		
		int upCnt = 0;
		
		upCnt = personMgmtService.doSaveCstType(map);
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
	
	/**
	 * 고객삭제 ajax
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 8.
	 */
	@RequestMapping(value = "/person/doDelCst.do")
	public void doDelCst(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		/*
		cstList : cstSnbList	//고객 id list (sequence list)
		*/
		
		map.put("userSeq", loginUser.getStaffSnb());
		
		int upCnt = 0;
		
		upCnt = personMgmtService.doDelCst(map);
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
	
	
}