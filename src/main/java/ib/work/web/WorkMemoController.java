package ib.work.web;

import ib.cmm.LoginVO;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.company.service.CompanyVO;
import ib.person.service.PersonVO;
import ib.work.service.WorkMemoService;
import ib.work.service.WorkVO;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * <pre>
 * package  : ib.work.web
 * filename : WorkMemoController.java
 * </pre>
 *
 * @author  :
 * @since   :
 * @version :
 */
@Controller
public class WorkMemoController {


    @Resource(name = "workMemoService")
    WorkMemoService workMemoService;



	/** log */
    protected static final Log LOG = LogFactory.getLog(WorkMemoController.class);

	protected static final Calendar cal = Calendar.getInstance();

	
	
	/**
	 * 메모박스 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return Main Page
	 * @exception Exception
	 */
	@RequestMapping(value="/work/memoBox.do")
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

		return "work/memoBox";
    }
	
	
	/**
	 * 메모리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 15.
	 */
	@RequestMapping(value = "/work/getMemoList.do")
	public void getMemoList(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,String> map) throws Exception {
	
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		//map.put("usrId", loginUser.getId());				//사용자 login id
		//map.put("usrCusId", loginUser.getCusId());			//사용자 고객id (sequence)
		map.put("usrNm", loginUser.getName());				//사용자 이름		
		
		//List<Map> list = workMemoService.getMemoList(map);
		Map<String, Object> resultMap = workMemoService.getMemoList((Map)map);
				
		//AjaxResponse.responseAjaxSelect(response, list);	//결과전송
		AjaxResponse.responseAjaxSelectForPage(response, resultMap);	//결과전송

	}
	
	
	/**
	 * 메모 상세
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 18.
	 */
	@RequestMapping(value = "/work/getMemoDetail.do")
	public void getMemoDetail(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,String> map) throws Exception {
	
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		List<Map> list = workMemoService.getMemoDetail(map);
				
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
		
	}
	
	
	/**
	 * 메모 읽음 상태 업데이트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 20.
	 */
	@RequestMapping(value = "/work/updateMemoStatus.do")
	public void updateMemoStatus(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		
		map.put("rgId", loginUser.getId());
		
		int upCnt = 0;
		
		upCnt = workMemoService.updateMemoStatus(map);
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
	
	/**
	 * 답글달기
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 20.
	 */
	@RequestMapping(value = "/work/insertMemoReply.do")
	public void insertMemoReply(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		
		map.put("rgId", loginUser.getId());
		
		
		int upCnt = 0;
		
		upCnt = workMemoService.insertMemoReply(map);
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
	
	
	/**
	 * ajax 호출후 단순 성공을 위해 dummy page 연결
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 20.
	 */
	@RequestMapping(value="/work/ajaxDummy.do")
	public String ajaxDummy(@ModelAttribute("personVO") PersonVO personVO,
			CompanyVO companyVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		return "basic/result";
    }
	
	
	/**
	 * 메모 참여자 수신 확인 정보 json
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 18.
	 */
	@RequestMapping(value = "/work/getMemoRecvInfo.do")
	public void getMemoRecvInfo(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,String> map) throws Exception {
	
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		List<Map> list = workMemoService.getMemoRecvInfo(map);
				
		AjaxResponse.responseAjaxSelect(response, list);	//결과전송
		
	}
	
	
	/**
	 * 메모 참여자 수신 확인 정보
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 22.
	 */
	@RequestMapping(value="/work/memoRecvInfoPopup.do")
	public String memoRecvInfoPopup(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,String> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());

		model.addAllAttributes(map);	//모든 받은 정보 그대로 전달

		return "work/memoRecvInfoPopup";
    }
	
	
	/**
	 * 메모 재전송 팝업
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 16.
	 */
	@RequestMapping(value = "/work/memoResendPopup.do")
	public String memoResendPopup(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		//SESSION check!
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		//model.addAllAttributes(map);	//받은 파라미터 화면으로 그대로 전달.
		
		map.put("mainSnb", map.get("s"));
		
		Map memo = workMemoService.getMemoCntnt(map).get(0);
		model.addAttribute("comment", memo.get("comment").toString());
		model.addAttribute("sNb", map.get("s"));
		model.addAttribute("dt", memo.get("dt"));
		model.addAttribute("resendDate", memo.get("resendDate"));
		
		return "work/memoResendPopup";
	}
	
	
	/**
	 * 메모 재전송
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 16.
	 */
	@RequestMapping(value = "/work/memoResend.do")
	public void memoResend(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		//SESSION check!
		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		//model.addAllAttributes(map);	//받은 파라미터 화면으로 그대로 전달.
		
		int upCnt = 0;
		
		map.put("usrId", loginUser.getId());
		upCnt = workMemoService.memoResend(map);		//재전송
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
	}
	
	
	
	/**
	 * 읽지않은 이전 업무보고 전체보기 상태 업데이트 (세션 변경)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 20.
	 */
	@RequestMapping(value = "/work/setNoReadAllYn.do")
	public void setNoReadAllYn(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,
			HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		loginUser.setNoReadAllYn((String)map.get("noReadAllYn"));
		
		int upCnt = 1;
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
	
	/**
	 * 메모유형 변경
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 6. 22.
	 */
	@RequestMapping(value="/work/updateMemoType.do")
	public void updateMemoType(HttpServletRequest request,
								HttpServletResponse response, ModelMap model,
								HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		map.put("rgId", loginUser.getId());
		
		int upCnt = 0;
		upCnt = workMemoService.updateMemoType(map);
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
	
	
	/**
	 * 메모 참조인 삭제
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 19.
	 */
	@RequestMapping(value="/work/delMemoStaff.do")
	public void delMemoStaff(HttpServletRequest request,
								HttpServletResponse response, ModelMap model,
								HttpSession session, @RequestParam Map<String,Object> map) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return;
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		map.put("rgId", loginUser.getId());
		
		int upCnt = 0;
		
		Map checkInfo = workMemoService.checkMemoReplyExist(map);
		if(Integer.parseInt(checkInfo.get("replyCnt").toString()) > 0){		//댓글이 존재
			//댓글이 이미 존재하여 삭제프로세스를 타지 않는다.
		}else{		
			upCnt = workMemoService.delMemoStaff(map);
		}
		
		AjaxResponse.responseAjaxSave(response, upCnt);		//결과전송
		
	}
}