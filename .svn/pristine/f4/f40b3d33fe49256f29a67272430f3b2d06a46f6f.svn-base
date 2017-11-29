package ib.car.web;

import ib.car.service.Car2Service;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.schedule.service.ScheduleService;
import ib.schedule.service.impl.ScheduleVO;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
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
public class CarMController {
   
	
	@Resource(name = "car2Service")
    private Car2Service car2Service;	
	
	@Resource(name = "scheService")
	private ScheduleService scheService;
	
	
	/** log */
    protected static final Log LOG = LogFactory.getLog(CarMController.class);

	/**
	 * Main 화면으로 들어간다
	
	 */
	@RequestMapping(value="/m/car/carRecord.do")
	public String index( 
			HttpSession session,
			HttpServletRequest request,
			ModelMap model,
			@RequestParam (defaultValue="0") String popType) throws Exception{
		if(session.getAttribute("userLoginInfo")==null){ return "redirect:/m/main.do";}
		model.addAttribute("popType", popType);
		return "/m/car/carRecord";
    }
	
	@RequestMapping(value="/m/car/carLogList.do")
	public String carLogList( 
			HttpSession session,
			ModelMap model,
			HttpServletRequest request,
			@RequestParam Map<String,Object> map) throws Exception{
		
	
		if(session.getAttribute("userLoginInfo")==null){return "redirect:/m/main.do";}
		
		if(map.containsKey("carId")){
			model.addAttribute("carId",map.get("carId"));
			model.addAttribute("carName",car2Service.selectCarName(map));
				
		}
		model.addAttribute("workId",map.get("workId"));
		model.addAttribute("useDate",map.get("useDate"));
		
		String path="";
		if(map.get("type")==null){
			path="/m/car/carLogList";
		}else{
			path="/m/car/carLogListView";
		}
		return path;
    }
	
	@RequestMapping(value="/m/car/getCarLogList.do")
	public void LimitcarLogList(
			HttpServletResponse response,
			HttpSession session,
			HttpServletRequest request,
			@RequestParam Map<String,Object> map) throws Exception{
		
	
		LOG.info(map);
		List<Map> resultMap =car2Service.selectLimitCarLogList(map);
		LOG.info(resultMap);
		
		AjaxResponse.responseAjaxSelect(response, resultMap);
	}
	
	@RequestMapping(value="/m/car/carRsvLogList.do")
	public String carRsvLogList( 
			HttpSession session,
			ModelMap model,ScheduleVO vo,
			HttpServletRequest request,
			@RequestParam Map<String,Object> map) throws Exception{
		
		model.addAttribute("searchDate", vo.getScheSDate());
		model.addAttribute("CarUseList", scheService.GetCarUseList(vo));
		model.addAttribute("vo", vo);
		
		
		return "/m/car/carRsvListView";
		
    }
	

	
	
	@RequestMapping(value="/m/car/disMaxValue.do")
	public void disMaxValue( 
			HttpSession session,
			ModelMap model,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map<String,Object> map) throws Exception{
	
		Map result= new HashMap();
		
		String maxDis = (String)car2Service.maxDistance(map);
		if(maxDis==null){ maxDis="0"; }
		LOG.info("0000000000000000000000000"+map);
		result.put("maxDis", maxDis);
		LOG.info("0000000000000000000000000"+result);
		AjaxResponse.responseAjaxObject(response, result);
		
    }

}
