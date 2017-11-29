package ib.dart.web;

import ib.cmm.LoginVO;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.dart.service.DartService;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class DartController {
	
	@Autowired
	DartService dartService;	
	
	
	
	/**
	 * 공시문서 리스트 팝업
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 6. 12.
	 */
	@RequestMapping(value="/dart/officialNotice.do")
	public String officialNotice(HttpSession session,
								ModelMap model,
								@RequestParam Map<String,Object> map) throws Exception{

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		model.addAllAttributes(map);	//받은 파라미터 화면으로 그대로 전달.
		
		return "dart/officialNotice";
    }
	
	
	/**
	 * 공시문서 리스트 조회
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 6. 12.
	 */
	@RequestMapping(value = "/dart/getOfficialNoticeList.do")
	public void getOfficialNoticeList(HttpServletResponse response,
									@RequestParam Map<String,Object> map) throws Exception {
		
		try{
			String obj = dartService.getOfficialNoticeList(map);
			
			AjaxResponse.responseAjaxObject(response, obj);		//"SUCCESS" 전달
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		
	}
	
	
	
}
