package ib.network.web;

import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.login.service.StaffVO;
import ib.network.service.impl.NetworkDAO;
import ib.work.service.WorkVO;
import ib.work.service.impl.WorkDAO;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author  : ChanWoo Lee
 * @since   : 2013. 1. 15.
 * @version : 1.0.0
 *
 * <pre>
 * package  : ib.network.web
 * filename : NetworkController.java
 * </pre>
 */
@Controller
public class NetworkController {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;

	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;
    
    @Resource(name = "networkDAO")
    private NetworkDAO networkDAO;
    
    @Resource(name = "workDAO")
    private WorkDAO workDAO;
    
	/** log */
    protected static final Log LOG = LogFactory.getLog(NetworkController.class);

	/**
	 * Main 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return Main Page
	 * @exception Exception
	 */
	@RequestMapping(value="/network/main.do")
	public String index(HttpServletRequest request,
			HttpSession session,
			WorkVO wVO,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		model.addAttribute("search", wVO.getSearch());
		
		try{
			if(wVO.getSearch().length()==0) wVO.setSearch("^검색어입력^");
			List<WorkVO> result = networkDAO.selectNetworkList(wVO);
			LOG.debug(loginUser.getId()+"^_^networkDAO.selectNetworkList^_^"+wVO.getSearch());
			model.addAttribute("netList", result);
		}catch(Exception e){
			e.printStackTrace();
		}
		
    	return "network/networkMain";
    }

	/**
	 * 네트워크 left
	 * @MethodName : selectLeft
	 * @param request
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/network/selectLeft.do")
	public String selectLeft(HttpServletRequest request,
			HttpSession session,
            ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Left";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
    	return "network/networkLeft";
    }
	
	/**
	 * 통합검색
	 * @MethodName : integratedSearch
	 * @param request
	 * @param session
	 * @param wVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/network/integratedSearch.do")
	public String integratedSearch(HttpServletRequest request,
			HttpSession session,
			WorkVO wVO,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		model.addAttribute("search", wVO.getSearch());
		
		if("".equals(wVO.getSearch()) || wVO.getSearch()==null) return "search/integrateSearchMain";
		
		try{
			List<WorkVO> result = networkDAO.selectIntegrateSearchList(wVO);
			LOG.debug(loginUser.getId()+"^_^networkDAO.selectIntegrateSearchList^_^"+wVO.getSearch());
			model.addAttribute("netList", result);
		}catch(Exception e){
			e.printStackTrace();
		}
		
    	return "search/integrateSearchMain";
    }
	/**
	 * 직원인맥 메인페이지
	 * @MethodName : selectStaffNetwork
	 * @param request
	 * @param session
	 * @param wVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/network/selectStaffNetwork.do")
	public String selectStaffNetwork(HttpServletRequest request,
			HttpSession session,
			WorkVO wVO,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		model.addAttribute("cmmCdNet", cmm.CommonCdList(wVO.ccdNWstaff));
		String rtn = "network/staffNetworkMain";
		try{
			StaffVO staffVO = new StaffVO();
			List<StaffVO> result = null;
//			staffVO.setSrtCd("00010");
//			staffVO.setLimit("8");
			if("00002".equals(wVO.getSorting())){
				LOG.debug(loginUser.getId()+"^_^workDAO.selectStaffList4incharge");
				result = workDAO.selectStaffList4incharge(staffVO);
				rtn = "network/inchargeMain";
				
			}else{
				LOG.debug(loginUser.getId()+"^_^workDAO.selectStaffList4ib");
				result = workDAO.selectStaffList4ib(staffVO);
				
			}
			model.addAttribute("TAB", wVO.getSorting());
			model.addAttribute("userList", result);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return rtn;
	}
	/**
	 * 직원인맥 개인별 netCD
	 * @MethodName : selectNetCD
	 * @param request
	 * @param session
	 * @param wVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/network/selectNetCD.do")
	public String selectNetCD(HttpServletRequest request,
			HttpSession session,
			WorkVO wVO,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		model.addAttribute("cmmCdNet", cmm.CommonCdList(wVO.ccdNWstaff));
		try{
			List<WorkVO> result = networkDAO.selectStaffNetListCnt(wVO);
			LOG.debug(loginUser.getId()+"^_^networkDAO.selectStaffNetListCnt");
			model.addAttribute("staffNetList", result);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "network/ajax2ndCommonCd";
	}
	
	/**
	 * 구분으로 인맥 검색
	 * @MethodName : selectNetInfo
	 * @param request
	 * @param session
	 * @param wVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/network/selectNetInfo.do")
	public String selectNetInfo(HttpServletRequest request,
			HttpSession session,
			WorkVO wVO,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		model.addAttribute("cmmCdNet", cmm.CommonCdList(wVO.ccdNWstaff));
		try{
			List<WorkVO> result = networkDAO.selectStaffNetList(wVO);
			LOG.debug(loginUser.getId()+"^_^networkDAO.selectStaffNetList");
			model.addAttribute("staffNetList", result);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "network/ajax3rdNetInfo";
	}
	/**
	 * 직원 개인인맥 입력
	 * @MethodName : insertStaffNetwork
	 * @param request
	 * @param session
	 * @param wVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/network/insertStaffNetwork.do")
	public String insertStaffNetwork(HttpServletRequest request,
			HttpSession session,
			WorkVO vo,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		String rgid = vo.getRgId();
		model.addAttribute("result", 0);
		if("".equals(rgid)|| rgid==null) rgid = loginUser.getId();
		if("".equals(rgid)|| rgid==null) return "basic/result";
		vo.setRgId(rgid);
		
		try{
			//직원과 인물로 중복확인
			if(vo.getSnb1st()!=null && vo.getSnb1st().length()>0){
				vo.setRgId(vo.getUsrId());
				if(networkDAO.selectDuplicateCheckStaffNetworkCnt(vo)>0){
					model.addAttribute("result", 1);
					return "basic/result";
				}
			}
			model.addAttribute("save", networkDAO.insertStaffNetwork(vo));
			LOG.debug(loginUser.getId()+"^_^networkDAO.insertStaffNetwork");
		}catch(Exception e){
			e.printStackTrace();
		}
		return "basic/result";
	}
	/**
	 * 직원 개인인맥 수정
	 * @MethodName : updateStaffNetwork
	 * @param request
	 * @param session
	 * @param wVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/network/updateStaffNetwork.do")
	public String updateStaffNetwork(HttpServletRequest request,
			HttpSession session,
			WorkVO wVO,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			int cnt = networkDAO.updateStaffNetwork(wVO);
			LOG.debug(loginUser.getId()+"^_^networkDAO.updateStaffNetwork");
			model.addAttribute("save", cnt);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "network/staffNetworkMain";
	}
	/**
	 * 직원 개인인맥 삭제
	 * @MethodName : deleteStaffNetwork
	 * @param request
	 * @param session
	 * @param wVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/network/deleteStaffNetwork.do")
	public String deleteStaffNetwork(HttpServletRequest request,
			HttpSession session,
			WorkVO wVO,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			int cnt = networkDAO.deleteStaffNetwork(wVO);
			LOG.debug(loginUser.getId()+"^_^networkDAO.deleteStaffNetwork");
			model.addAttribute("save", cnt);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "network/staffNetworkMain";
	}
	
	/**
	 * 직원인맥 입력 페이지
	 * @MethodName : mainNetInfo
	 * @param request
	 * @param session
	 * @param wVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/network/mainNetInfo.do")
	public String mainNetInfo(HttpServletRequest request,
			HttpSession session,
			WorkVO wVO,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		model.addAttribute("switch", "2");
		model.addAttribute("cmmCdNet", cmm.CommonCdList(wVO.ccdNWstaff));
		try{
			//List<WorkVO> result = networkDAO.selectStaffNetList(wVO);
			LOG.debug(loginUser.getId()+"^_^networkDAO.selectStaffNetList");
			//model.addAttribute("staffNetList", result);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "network/ajax3rdNetInfo";
	}
	
	/**
	 * 담당자 회사/인물 ajax
	 * @MethodName : selectStaffIncharge
	 * @param request
	 * @param session
	 * @param wVO
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 3. 10.
	 */
	@RequestMapping(value="/network/selectStaffIncharge.do")
	public String selectStaffIncharge(HttpServletRequest request,
			HttpSession session,
			WorkVO wVO,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		try{
			model.addAttribute("staffNetList", networkDAO.selectStaffInchargeList(wVO));
			LOG.debug(loginUser.getId()+"^_^networkDAO.selectStaffInchargeList");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "network/ajax2ndIncharge";
	}
}