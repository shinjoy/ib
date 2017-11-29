package ib.pass.web;

import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.util.sim.service.FileScrty;
import ib.company.service.impl.CompanyDAO;
import ib.network.service.impl.NetworkDAO;
import ib.person.service.PersonMgmtService;
import ib.person.service.impl.PersonDAO;
import ib.work.service.WorkService;
import ib.work.service.impl.WorkDAO;

import java.util.Calendar;
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

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * <pre>
 * package	: ib.pass.web 
 * filename	: PassController.java
 * </pre>
 * 
 * 
 * 
 * @author	: oys
 * @date	: 2017. 1. 23.
 * @version : 
 *
 */
@Controller
public class PassController {

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
    protected static final Log logger = LogFactory.getLog(PassController.class);
	
	protected static Calendar cal = Calendar.getInstance();

	
	/**
	 * 패스 업무일지 화면
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 1. 23.
	 */
	@RequestMapping(value="/pass/work.do")
	public String index(HttpServletRequest request,
						HttpServletResponse response, ModelMap model,
						HttpSession session, @RequestParam Map<String,String> map) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		//LOG.info(loginUser.getId());
		
		
		model.put("ibtopass", FileScrty.encode(loginUser.getId()));

		return "pass/work";
    }

	

	
}