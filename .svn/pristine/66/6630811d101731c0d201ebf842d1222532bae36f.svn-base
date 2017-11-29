package ib.car.web;

import ib.car.service.Car2Service;
import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.login.service.StaffVO;
import ib.person.service.impl.PersonDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



/**
 * <pre>
 * package  : ib.car.web
 * filename : CarController.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 11. 23.
 * @version : 1.0.0
 */
@Controller
public class Car2Controller {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;
	
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;
    
    @Resource(name = "car2Service")
    private Car2Service car2Service;
    
    @Resource(name = "personDAO")
    private PersonDAO personDAO;  
     
    
	/** log */
    protected static final Log LOG = LogFactory.getLog(Car2Controller.class);

	/**
	 * Main 화면으로 들어간다
	 * @MethodName : index
	 * @param carVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/car2/index.do")
	public String index( 
			
			StaffVO staffVO,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "redirect:basic/Content";
	
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
	
		return "car/car2Main";
    }
	
	@RequestMapping(value="/car2/userList.do")
	public void userList(StaffVO staffVO,HttpServletResponse response,HttpSession session,@RequestParam Map<String,Object> map) throws Exception{
		
		LoginVO loginUser =(LoginVO)session.getAttribute("userLoginInfo");
	
		List<Map> resultMap =personDAO.selectStaffList(staffVO);
		LOG.info(resultMap);
		
		AjaxResponse.responseAjaxSelect(response, resultMap);
	}
	
	
	
	@RequestMapping(value="/car2/carList.do")
	public void carList(HttpServletResponse response,HttpSession session,@RequestParam Map<String,Object> map) throws Exception{
		
		LoginVO loginUser =(LoginVO)session.getAttribute("userLoginInfo");
		map.put("hqId", loginUser.getHqId());
		
		List<Map> resultMap =car2Service.selectCarList(map);
		LOG.info(resultMap);
		
		AjaxResponse.responseAjaxSelect(response, resultMap);
	}
	
	@RequestMapping(value="/car2/getCarLogList.do")
	public void carLogList(HttpServletResponse response,HttpSession session,@RequestParam Map<String,Object> map) throws Exception{
		
		LOG.info(map);
		List<Map> resultMap =car2Service.selectCarLogList(map);
		LOG.info(resultMap);
		
		AjaxResponse.responseAjaxSelect(response, resultMap);
	}
	
	@RequestMapping(value="/car2/popUpmemo.do")
	public String popUpmemo(HttpServletResponse response,HttpSession session,@RequestParam Map<String,Object> map,ModelMap model) throws Exception{
		
		model.addAttribute("date",map.get("date"));
		model.addAttribute("carNick",map.get("carNick"));
		LOG.info(map.get("date"));
		
		return "/car/popUpmemo";
	}
	
	@RequestMapping(value="/car2/popUpmemoAjax.do")
	public void popUpmemoAjax(HttpServletResponse response,HttpSession session,@RequestParam Map<String,Object> map,ModelMap model) throws Exception{

		List<Map> resultMap =car2Service.selectScheList(map);
		//System.out.println("ddd");
		LOG.info(car2Service.selectScheList(map));
		AjaxResponse.responseAjaxSelect(response, resultMap);
	}
	
	//차량 이용 등록
	@RequestMapping(value="/car2/insertCarLog.do")
	public void carLogInsert(HttpServletResponse response,HttpSession session,@RequestParam Map<String,Object> map,ModelMap model)throws Exception{
			
		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		int cnt =0;
		Map result= new HashMap();
		
		if(loginUser == null){
			
			cnt=-8;
		}else{
			
			int errDis=0;
			
	
			///판별
		
			List<Map>list=car2Service.chkDistance(map);
			int totalDis =Integer.parseInt((String)map.get("totalDistance"));
			int beDis=Integer.parseInt(list.get(0).get("beDayMile").toString());
			int afDis=Integer.parseInt(list.get(0).get("afDayMile").toString());
			int nowDis=Integer.parseInt(list.get(0).get("nowDayMile").toString());
		
			if(!(-1==beDis) && totalDis<=beDis){cnt=-2; errDis=beDis;} 		//전날보다 작으면
			else if(!(-1==afDis) && afDis<=totalDis){cnt=-3;errDis=afDis;}	//다음날보다 크면
			else if(!(-1==nowDis)){cnt=-4;errDis=nowDis;}					//해당 날짜에 같은 입력값이 있다면
			else{cnt=car2Service.insertCarLog(map);}
			
			result.put("cnt", cnt);
			result.put("errDis", errDis);
			
		}
			AjaxResponse.responseAjaxObject(response, result);
	}
	
	
	/**
	 * Main 화면으로 들어간다
	 * @MethodName : index
	 * @param carVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/car2/carMgmt.do")
	public String carMgmt( 
			StaffVO staffVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		System.out.println("dd");
    	return "car/carMgmt";
    }
	

}