package ib.car.web;

import ib.car.service.CarVO;
import ib.car.sevice.impl.CarDAO;
import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.login.service.StaffVO;
import ib.work.service.WorkService;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;



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
public class CarController {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;
	
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;
    
    @Resource(name = "carDAO")
    private CarDAO carDAO;  
    
    @Resource(name = "workService")
    private WorkService workService;    
    
	/** log */
    protected static final Log LOG = LogFactory.getLog(CarController.class);

	/**
	 * Main 화면으로 들어간다
	 * @MethodName : index
	 * @param carVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/car/index.do")
	public String index( CarVO carVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		List<CarVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		if(( carVO.getChoice_year().equals("")||carVO.getChoice_year().equals(null) ) && ( carVO.getChoice_month().equals("")||carVO.getChoice_month().equals(null) )){
			Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
			
			carVO.setChoice_year(date.substring(0, 4));
			carVO.setChoice_month(date.substring(4, 6));
			
			System.out.println(date);
		}
		//String year = carVO.getChoice_year();
		//String month = carVO.getChoice_month();
		model.addAttribute("choice_year", carVO.getChoice_year());
		model.addAttribute("choice_month", carVO.getChoice_month());
		
		if(carVO.getChoice_month().length()==1){
			carVO.setChoice_month("0"+carVO.getChoice_month());
		}
		if(carVO.getTotal().equals("tot")) {
			carVO.setChoice_monthS("01");
		} else {
			carVO.setChoice_monthS(carVO.getChoice_month());
		}
		
		carVO.setSort_date("2");
		String car_number = carVO.getCarNum();
		
		try{
			result = carDAO.selectCarUsedList(carVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		StaffVO staffVO = new StaffVO();
		map.put("carList", result);
		model.addAttribute("carList", map.get("carList"));
		model.addAttribute("userList", cmm.UserList(staffVO));
		model.addAttribute("carNumber", car_number);
		
    	return "car/CarMain";
    }
	
	
	/**
	 * Main - Left
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return Left Page
	 * @exception Exception
	 */
	@RequestMapping(value="/car/selectLeft.do")
	public String selectWork( CarVO carVO,
            ModelMap model) throws Exception{
		List<CarVO> result = null;
		try{
			result = carDAO.selectCarParkingFloorList(carVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("carList", result);
		/*for(int i=0;i<result.size();i++){
			model.addAttribute("car"+result.get(i).getCarNum(), result.get(i).getFloor());
		}*/
    	return "car/CarLeft";
    }
	/**
	 * 점유 process 처리
	 * @MethodName : possess
	 * @param carVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/car/possess.do")
	public String possess( CarVO carVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		if("".equals(carVO.getsNb())||null==carVO.getsNb()) return "car/CarLeft";
		
		carVO.setRgId(loginUser.getId());
		try{
			carDAO.updateFloor(carVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "redirect:/car/selectLeft.do";
	}

	
	/**
	 *
	 * @MethodName : insertCar
	 * @param carVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/car/insertCarUsed.do")
	public String insertCar( CarVO carVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		carVO.setRgId(loginUser.getId());
		
		
		carVO.setDepartureTime(carVO.getDepartureTime().substring(0, 2)+":"+carVO.getDepartureTime().substring(2));
		carVO.setArriveTime(carVO.getArriveTime().substring(0, 2)+":"+carVO.getArriveTime().substring(2));
		
/*		
		List<CarVO> result = null;
		try{
			result = carDAO.selectTotalDistance(carVO);
		}catch(Exception e){
			LOG.error(e);
			System.out.println("----------error----------\n---car/insertCarUsed.do/selectTotalDistance---\n"+e);
		}
		
		carVO.setTotalDistance(Integer.toString(Integer.parseInt(result.get(0).getTotalDistance())+Integer.parseInt(carVO.getMileage())));
*/		
		if("".equals(carVO.getPrice())||carVO.getPrice().equals(null)) carVO.setPrice("0");
		
		int cnt = 0;
		try{
			cnt = carDAO.insertCarUsedList(carVO);
			LOG.debug(loginUser.getId()+"^_^carDAO.insertCarUsedList");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}

		model.addAttribute("saveCnt", cnt);
		
    	return "car/CarMain";
    }
	
	/**
	 * 차량정보 삭제
	 * @MethodName : deleteCar
	 * @param carVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/car/deleteCarUsed.do")
	public String deleteCar( CarVO carVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		int cnt = 0;
		try{
			cnt = carDAO.deleteCarUsedList(carVO);
			LOG.debug(loginUser.getId()+"^_^carDAO.deleteCarUsedList^_^"+carVO.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("deleteCnt", cnt);
		
		return "car/CarMain";
	}
	
		

}