package ib.work.web;

import ib.basic.service.impl.CpnUploadExcelMapping;
import ib.cmm.FileUpDbVO;
import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.company.service.CompanyVO;
import ib.company.service.impl.CompanyDAO;
import ib.login.service.StaffVO;
import ib.person.service.PersonVO;
import ib.person.service.impl.PersonDAO;
import ib.work.service.CusBasicConnectVO;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;
import ib.work.service.impl.WorkDAO;

import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import egovframework.rte.fdl.idgnr.impl.Base64;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * <pre>
 * package  : ib.work.web
 * filename : WorkController.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 8. 1.
 * @version : 1.0.0
 */
@Controller
public class MonthlyController {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;
    
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;
    
    @Resource(name = "workDAO")
    private WorkDAO workDAO;
    
    @Resource(name = "workService")
    private WorkService workService;    

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name = "companyDAO")
    private CompanyDAO companyDAO;   
 
    @Resource(name = "personDAO")
    private PersonDAO personDAO;   
 
    @Autowired
    private DefaultBeanValidator beanValidator;
	/** log */
    protected static final Log LOG = LogFactory.getLog(WorkController.class);

	protected static Calendar cal = Calendar.getInstance();
	
	/**
	 *
	 * @MethodName : selectMonthlyLeft
	 * @param request
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectMonthlyLeft.do")
	public String selectMonthlyLeft(HttpServletRequest request,
			HttpSession session,
            ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Left";
		
		StaffVO staffVO = new StaffVO();
		model.addAttribute("userList", cmm.UserList(staffVO));
		
		List<WorkVO> resu = workDAO.selectOutStaffList(staffVO);
		model.addAttribute("outStaffList", resu);
		
    	return "work/Left";
    }
	
	/**
	 *
	 * @MethodName : viewMonthly
	 * @param request
	 * @param session
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/work/selectMonthlyV.do")
	public String viewMonthly(HttpServletRequest request,
			HttpSession session,
			WorkVO workVO,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		if(workVO.getName()=="") workVO.setName(loginUser.getName());
		if(workVO.getTmpId()=="")workVO.setTmpId(loginUser.getId());
		
		String date = null;
		if(workVO.getChoice_year().equals("") && workVO.getChoice_month().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
			
			workVO.setChoice_year(date.substring(0, 4));
			workVO.setChoice_month(date.substring(4));
			
		}else model.addAttribute("choice_year", workVO.getChoice_year());
		Calendar now = cal;
		now.set(Integer.parseInt(workVO.getChoice_year()), Integer.parseInt(workVO.getChoice_month())-1, 1);
		model.addAttribute("last_day", now.getActualMaximum(Calendar.DATE));
		model.addAttribute("first_day", now.get(Calendar.DAY_OF_WEEK));
		
		model.addAttribute("cmmCdCategoryList", cmm.CommonCdList(workVO.ccdCateCd));
		model.addAttribute("cmmCdOfferList", cmm.CommonCdList(workVO.ccdOffCd));
		model.addAttribute("cmmCd1stSlctList", cmm.CommonCdList("00015"));
		model.addAttribute("cmmCdResultList", cmm.CommonCdList("00010"));
		model.addAttribute("cmmCdDealList", cmm.CommonCdList("00011"));
		
		Map<String, Object> map = null;
		List<WorkVO> result0 = null;
		List<WorkVO> inside = null;
		try{
			map = workService.selectBusinessRecordList(workVO);
			result0 = workDAO.selectOfferListNfile(workVO);
			inside = workDAO.selectInsideList(workVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("offerList",result0);
		model.addAttribute("insideList",inside);
		
		return "work/monthly/monthly";
	}
}