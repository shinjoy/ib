package ib.personnel.web;

import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.login.service.StaffVO;
import ib.personnel.service.PersonnelVO;
import ib.personnel.service.impl.PersonnelDAO;
import ib.work.service.WorkService;
import ib.work.service.impl.WorkDAO;

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
 * package  : ib.personnel.web
 * filename : PersonnelController.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 12. 6.
 * @version : 1.0.0
 */
@Controller
public class PersonnelController {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;
	
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;
    
    @Resource(name = "personnelDAO")
    private PersonnelDAO personnelDAO;  
    
    @Resource(name = "workDAO")
    private WorkDAO workDAO;  
    
    @Resource(name = "workService")
    private WorkService workService;    
    
	/** log */
    protected static final Log LOG = LogFactory.getLog(PersonnelController.class);

	protected static Calendar cal = Calendar.getInstance();
	
	/**
	 * 
	 * @MethodName : index
	 * @param personnelVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/index.do")
	public String index( PersonnelVO personnelVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
//		if(Integer.parseInt(loginUser.getPermission())<11) return "basic/Content";
		LOG.info(loginUser.getId());
		
		List<PersonnelVO> result = null;
		List<PersonnelVO> rstPass = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(personnelVO.getChoice_year().equals("") && personnelVO.getChoice_month().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyy").format( cal.getTime() );
			
			personnelVO.setChoice_year(date);
			
			//System.out.println(date);
		}//System.out.println("---------choice_year---\n"+personnelVO.getChoice_year());
		String year = personnelVO.getChoice_year();
		
		personnelVO.setChoice_monthS("01");
		personnelVO.setChoice_month("12");
		
		StaffVO staffVO = new StaffVO();
		List<StaffVO> staffList = null;
		
		personnelVO.setFlagHt("0");
		
		try {
			staffList = workDAO.selectStaffListWithoutJoinDt(staffVO);
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		try{
			result = personnelDAO.selectPersonnelYearList1(personnelVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		try{
			rstPass = personnelDAO.selectPersonnelYearPassList(personnelVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		/*
		String [] arrMon;
		String [] arrHld;// = new String[result.size()]

		for(int i=0;i<result.size();i++){
			arrMon = result.get(i).getGrMon().split(",");
			arrHld = result.get(i).getGrHld().split(",");
			String [] perDay = new String [] {"0","0","0","0","0","0","0","0","0","0","0","0","0"};
			for(int k=0;k<arrMon.length;k++){
				perDay[Integer.parseInt(arrMon[k])]=arrHld[k];
			}
			
			result.get(i).setPerDay(perDay);
		}
*/
		map.put("personnelYearList", result);
		model.addAttribute("personnelYearList", map.get("personnelYearList"));
		map.put("passList", rstPass);
		model.addAttribute("passList", map.get("passList"));
		model.addAttribute("choice_year", year);
		model.addAttribute("userList", staffList);
		
//    	return "personnel/vacation/TardinessMain";
    	return "personnel/vacation/HolidayMain";
    }
	/**
	 * 월별 페이지(세부화면)
	 * @MethodName : monthIndex
	 * @param personnelVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/monthIndex.do")
	public String monthIndex( PersonnelVO personnelVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		List<PersonnelVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(personnelVO.getChoice_year().equals("") && personnelVO.getChoice_month().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
			
			personnelVO.setChoice_year(date.substring(0, 4));
			personnelVO.setChoice_month(date.substring(4, 6));
			
			//System.out.println(date);
		}
		
		Calendar now = Calendar.getInstance();
		now.set(Integer.parseInt(personnelVO.getChoice_year()), Integer.parseInt(personnelVO.getChoice_month())-1, 1);
		model.addAttribute("last_day", now.getActualMaximum(Calendar.DATE));
		
		if(personnelVO.getChoice_month().length()==1){
			personnelVO.setChoice_month("0"+personnelVO.getChoice_month());
		}
		
		String year = personnelVO.getChoice_year();
		String month = personnelVO.getChoice_month();
		
		if(personnelVO.getTotal().equals("tot")) {
			personnelVO.setChoice_monthS("01");
		} else {
			personnelVO.setChoice_monthS(personnelVO.getChoice_month());
		}
		personnelVO.setSort_date("1");
		personnelVO.setFlagHt("0");
		
		
		
		StaffVO staffVO = new StaffVO();
		
		try {
			model.addAttribute("userList", cmm.UserList(staffVO));
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		
		
		try{
			result = personnelDAO.selectPersonnelMonthList1(personnelVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		/*
		String [] arrMon;
		String [] arrHld;// = new String[result.size()]
		
		for(int i=0;i<result.size();i++){
			arrMon = result.get(i).getGrDay().split(",");
			arrHld = result.get(i).getGrHld().split(",");
			String [] perDay = new String [] {
					 "0","0","0","0","0","0","0","0","0","0"
					,"0","0","0","0","0","0","0","0","0","0"
					,"0","0","0","0","0","0","0","0","0","0"
					,"0","0"};
			for(int k=0;k<arrMon.length;k++){
				perDay[Integer.parseInt(arrMon[k])]=arrHld[k];
			}			
			
//			String [] perDay = new String [32];
//			for(int j=1;j<32;j++){
//				perDay[j]="0";
//				for(int k=0;k<arrMon.length;k++){
//					if(Integer.parseInt(arrMon[k])==j) perDay[j]=arrHld[k];
//				}
//			}
		
			result.get(i).setPerDay(perDay);
		}*/
		map.put("personnelMonthList", result);
		model.addAttribute("personnelMonthList", map.get("personnelMonthList"));
		model.addAttribute("choice_year", year);
		model.addAttribute("choice_month", month);
		
//    	return "personnel/vacation/TardinessMain";
		return "personnel/vacation/HolidayMonthMain";
	}
	
	
	/**
	 * Main - Left
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return Left Page
	 * @exception Exception
	 */
	@RequestMapping(value="/personnel/selectLeft.do")
	public String selectWork(
            ModelMap model) throws Exception{
		
		//System.out.println("===========selectLeft==============");
    	return "personnel/vacation/PersonnelLeft";
    }

	/**
	 * 월별 페이지 내용수정
	 * @MethodName : modifyMonth
	 * @param personnelVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/modifyHoliday.do")
	public String modifyMonth( PersonnelVO personnelVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		List<PersonnelVO> result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(personnelVO.getChoice_year().equals("") && personnelVO.getChoice_month().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
			
			personnelVO.setChoice_year(date.substring(0, 4));
			personnelVO.setChoice_month(date.substring(4, 6));
			
			//System.out.println(date);
		}
		
		Calendar now = Calendar.getInstance();
		now.set(Integer.parseInt(personnelVO.getChoice_year()), Integer.parseInt(personnelVO.getChoice_month())-1, 1);
		model.addAttribute("last_day", now.getActualMaximum(Calendar.DATE));
		
		if(personnelVO.getChoice_month().length()==1){
			personnelVO.setChoice_month("0"+personnelVO.getChoice_month());
		}
		
		String year = personnelVO.getChoice_year();
		String month = personnelVO.getChoice_month();
		
		if(personnelVO.getTotal().equals("tot")) {
			personnelVO.setChoice_monthS("01");
		} else {
			personnelVO.setChoice_monthS(personnelVO.getChoice_month());
		}
		personnelVO.setSort_date("1");
		personnelVO.setFlagHt("0");
		
		
		StaffVO staffVO = new StaffVO();
		
		try {
			model.addAttribute("userList", cmm.UserList(staffVO));
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		try{
			result = personnelDAO.selectPersonnelMonthList1(personnelVO); 
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		/*
		String [] arrMon;
		String [] arrHld;// = new String[result.size()]
		for(int i=0;i<result.size();i++){
			arrMon = result.get(i).getGrDay().split(",");
			arrHld = result.get(i).getGrHld().split(",");
			String [] perDay = new String [] {
					 "0","0","0","0","0","0","0","0","0","0"
					,"0","0","0","0","0","0","0","0","0","0"
					,"0","0","0","0","0","0","0","0","0","0"
					,"0","0"};
			for(int k=0;k<arrMon.length;k++){
				perDay[Integer.parseInt(arrMon[k])]=arrHld[k];
			}			

			
//			String [] perDay = new String [32];
//			for(int j=1;j<32;j++){
//				perDay[j]="0";
//				for(int k=0;k<arrMon.length;k++){
//					if(Integer.parseInt(arrMon[k])==j) perDay[j]=arrHld[k];
//				}
//			}
			 
			result.get(i).setPerDay(perDay);
		}
		*/
		
		map.put("personnelMonthList", result);
		model.addAttribute("personnelMonthList", map.get("personnelMonthList"));
		model.addAttribute("choice_year", year);
		model.addAttribute("choice_month", month);
		
//    	return "personnel/vacation/TardinessMain";
		return "personnel/vacation/ModifyHolidayMonthMain";
	}
		
	

	
	/**
	 *
	 * @MethodName : processInsert
	 * @param VO
	 * @param snb
	 * @param holiday
	 * @param date
	 * @return
	 * @throws Exception
	 */
	public int processInsert(PersonnelVO VO, String snb, String holiday, int date) throws Exception{
		VO.setStaffId(snb);
		VO.setHoliday(holiday);
		VO.setTmDt(VO.getChoice_year()+"-"+VO.getChoice_month()+"-"+date);
		// System.out.println("----processInsert----"+snb+":::"+VO.getHoliday()+":::"+VO.getTmDt()+"---");
	
		int cnt = 10;
		try{
			cnt = personnelDAO.selectCheckPersonnel(VO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		if(cnt==0){
			if("0".equals(holiday)) return cnt;
			try{
				cnt = personnelDAO.insertPersonnel(VO);//insert
				LOG.debug(VO.getRgId()+"^_^personnelDAO.insertPersonnel");
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
			if("1".equals(VO.getFlagHt()))processInsertZero(VO,0);
		}else if(cnt==1){
			if("0".equals(holiday)){
				try{
					cnt = personnelDAO.deletePersonnel(VO);//delete
					LOG.debug(VO.getRgId()+"^_^personnelDAO.deletePersonnel");
				}catch(Exception e){
					LOG.error(e);
					e.printStackTrace();
				}
				if("1".equals(VO.getFlagHt()))processInsertZero(VO,1);
			}else{
				try{
					cnt = personnelDAO.updatePersonnel(VO);//update
					LOG.debug(VO.getRgId()+"^_^personnelDAO.updatePersonnel^_^"+VO.getsNb());
				}catch(Exception e){
					LOG.error(e);
					e.printStackTrace();
				}
			}
		}
		return cnt;
	}
	
	/**
	 *
	 * @MethodName : processInsertZero
	 * @param VO
	 * @param num
	 * @return
	 * @throws Exception
	 */
	public int processInsertZero(PersonnelVO VO, int num) throws Exception{
		
		int holiday = 0;
		int cnt = 10;
		
		VO.setTmDt(VO.getChoice_year()+"-00-00");
		//System.out.println("\n----processInsertZero----\n"+VO.getStaffId()+":::"+VO.getHoliday()+":::"+VO.getTmDt()+"---");
		try{
			holiday = personnelDAO.selectPersonnelLateList(VO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		if(num==0){
			if((holiday+1)%2 == 0){//지각 이틀인경우 휴가DB 내용읽어서 0.5 추가
				int count = 0;
				try{
					//휴가DB에서 휴가 일수 확인
					VO.setTmDt(VO.getChoice_year()+"-"+VO.getChoice_month()+"-00");
					count = personnelDAO.selectPersonnelLateList(VO);
					
					//휴가DB에 데이터 없으면 0 있으면 
					VO.setHoliday(Float.toString((float) (0.5+count)));
					VO.setFlagHt("0");
					if(count == 0){
						cnt = personnelDAO.insertPersonnel(VO);//insert
						LOG.debug(VO.getRgId()+"^_^personnelDAO.inserPersonnel");
					}else{
						cnt = personnelDAO.updatePersonnel(VO);//update
						LOG.debug(VO.getRgId()+"^_^personnelDAO.updatePersonnel^_^"+VO.getsNb());
					}
					
					//휴가 DB에 지각 2일이 0.5휴가로 들어가면 테이블 삭제
					VO.setFlagHt("1");
					VO.setTmDt(VO.getChoice_year()+"-00-00");
					cnt = personnelDAO.deletePersonnel(VO);//delete
					LOG.debug(VO.getRgId()+"^_^personnelDAO.deletePersonnel");
				}catch(Exception e){
					LOG.error(e);
					e.printStackTrace();
				}
			}else{
				VO.setHoliday(Integer.toString(holiday+1));
				try{
					if(holiday==0){
						cnt = personnelDAO.insertPersonnel(VO);//insert
						LOG.debug(VO.getRgId()+"^_^personnelDAO.insertPersonnel");
					}else{
						cnt = personnelDAO.updatePersonnel(VO);//update
						LOG.debug(VO.getRgId()+"^_^personnelDAO.updatePersonnel^_^"+VO.getsNb());
					}
				}catch(Exception e){
					LOG.error(e);
					e.printStackTrace();
				}
			}
		}else if(num==1){
			if(holiday > 0){
				VO.setHoliday(Integer.toString(holiday-1));
				try{
					cnt = personnelDAO.updatePersonnel(VO);//update
					LOG.debug(VO.getRgId()+"^_^personnelDAO.updatePersonnel^_^"+VO.getsNb());
				}catch(Exception e){
					LOG.error(e);
					e.printStackTrace();
				}
			}
		}
		return cnt;
	}

	/**
	 * 
	 * @MethodName : insertPersonnel
	 * @param personnelVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/personnel/insertPersonnelUse.do")
	public String insertPersonnel( PersonnelVO personnelVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		personnelVO.setRgId(loginUser.getId());
		
		String rtn = null;
		if("1".equals(personnelVO.getFlagHt())) rtn = "redirect:/personnel/modifyTardiness.do";
		else rtn = "redirect:/personnel/modifyHoliday.do";
		
		model.addAttribute("choice_year", personnelVO.getChoice_year());
		model.addAttribute("choice_month", personnelVO.getChoice_month());
		try{
			for(int i=0;i<31;i++){
				int j = i+1;
				for(int staffCnt=0;staffCnt<personnelVO.getsTafF().length;staffCnt++){
					String holiday =  null;
					String staffSnb = personnelVO.getsTafF()[staffCnt];
					int staffNum = Integer.parseInt(staffSnb);
					if( personnelVO.getpDay(staffNum)!=null) holiday  =  personnelVO.getpDay(staffNum)[i];

					if("1".equals(personnelVO.getFlagHt())){
						if(j!=31 && holiday  !=null && holiday.length() !=0) 
							processInsert(personnelVO, staffSnb, holiday, j);
					}else{
						personnelVO.setPenalty("N"); 
						if(holiday!=null && holiday.contains("-")){ 	
							holiday = holiday.replace("-", "");		
							personnelVO.setPenalty("Y");	
						}
						if("0".equals(holiday)  || "0.5".equals(holiday)  || "1".equals(holiday))  
							processInsert(personnelVO, staffSnb, holiday, j);
					}
				}
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
    	return rtn;
    }
	
	/**
	 *
	 * @MethodName : insertPersonnelPass
	 * @param personnelVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/personnel/insertPersonnelOverUse.do")
	public String insertPersonnelPass( PersonnelVO personnelVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		personnelVO.setRgId(loginUser.getId());
		
		model.addAttribute("choice_year", personnelVO.getChoice_year());
		model.addAttribute("choice_month", personnelVO.getChoice_month());
		
		personnelVO.setChoice_year(Integer.toString(Integer.parseInt(personnelVO.getChoice_year())+1));
		personnelVO.setChoice_month("00");
		
		String [] arr = personnelVO.getpDay1();
		String [] arrSnb = personnelVO.getpDay2();
		
		//System.out.println("---"+personnelVO.getChoice_year()+"-"+personnelVO.getChoice_month()+":::"+arr[0]+"---");

		personnelVO.setFlagHt("0");
		for(int i=0;i<arr.length;i++){
			String holiday =  null;  if(arr!=null) holiday  =  arr[i].replace("-", "").trim();
			String staffId =  null;  if(arrSnb!=null) staffId  =  arrSnb[i];
			if(holiday!=null && !"".equals(holiday)) processInsert(personnelVO, staffId, holiday, 0);
		}
		return "redirect:/personnel/index.do";
	}
	

	/**
	 *
	 * @MethodName : Tardiness
	 * @param personnelVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/Tardiness.do")
	public String Tardiness( PersonnelVO personnelVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		List<PersonnelVO> result = null;
		List<PersonnelVO> penalty = null;
		
		if(personnelVO.getChoice_year().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
			
			personnelVO.setChoice_year(date.substring(0, 4));
			
			//System.out.println(date);
		}
		
		String year = personnelVO.getChoice_year();
		
		personnelVO.setSort_date("1");
		personnelVO.setFlagHt("1");
		
		StaffVO staffVO = new StaffVO();
		
		try {
			model.addAttribute("userList", cmm.UserList(staffVO));
			result = personnelDAO.selectTardinessList(personnelVO);
			penalty = personnelDAO.selectPenaltyList(personnelVO);
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		
		model.addAttribute("tardinessList", result);
		model.addAttribute("choice_year", year);
		model.addAttribute("penaltyList", penalty);
		
		return "personnel/vacation/TardinessMain";
	}
	
	
	/**
	 *
	 * @MethodName : monthTardiness
	 * @param personnelVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/monthTardiness.do")
	public String monthTardiness( PersonnelVO personnelVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		List<PersonnelVO> result = null;
		List<PersonnelVO> result1 = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(personnelVO.getChoice_year().equals("") && personnelVO.getChoice_month().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
			
			personnelVO.setChoice_year(date.substring(0, 4));
			personnelVO.setChoice_month(date.substring(4, 6));
			
			//System.out.println(date);
		}
		
		Calendar now = Calendar.getInstance();
		now.set(Integer.parseInt(personnelVO.getChoice_year()), Integer.parseInt(personnelVO.getChoice_month())-1, 1);
		model.addAttribute("last_day", now.getActualMaximum(Calendar.DATE));
		
		if(personnelVO.getChoice_month().length()==1){
			personnelVO.setChoice_month("0"+personnelVO.getChoice_month());
		}
		
		String year = personnelVO.getChoice_year();
		String month = personnelVO.getChoice_month();
		
		if(personnelVO.getTotal().equals("tot")) {
			personnelVO.setChoice_monthS("01");
		} else {
			personnelVO.setChoice_monthS(personnelVO.getChoice_month());
		}
		personnelVO.setSort_date("1");
		personnelVO.setFlagHt("1");
		
		StaffVO staffVO = new StaffVO();
		
		try {
			model.addAttribute("userList", cmm.UserList(staffVO));
			result = personnelDAO.selectPersonnelMonthList1(personnelVO);
			result1 = personnelDAO.selectTotalTradiness(personnelVO);
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		
		map.put("personnelMonthList", result);
		model.addAttribute("personnelMonthList", map.get("personnelMonthList"));
		map.put("totalTradiness", result1);
		model.addAttribute("totalTradiness", map.get("totalTradiness"));
		model.addAttribute("choice_year", year);
		model.addAttribute("choice_month", month);
		
		return "personnel/vacation/TardinessMonthMain";
	}

	
	/**
	 *
	 * @MethodName : modifyMonthTardiness
	 * @param personnelVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/modifyTardiness.do")
	public String modifyMonthTardiness( PersonnelVO personnelVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		List<PersonnelVO> result = null;
		List<PersonnelVO> result1 = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(personnelVO.getChoice_year().equals("") && personnelVO.getChoice_month().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
			
			personnelVO.setChoice_year(date.substring(0, 4));
			personnelVO.setChoice_month(date.substring(4, 6));
			
			//System.out.println(date);
		}
		
		Calendar now = Calendar.getInstance();
		now.set(Integer.parseInt(personnelVO.getChoice_year()), Integer.parseInt(personnelVO.getChoice_month())-1, 1);
		model.addAttribute("last_day", now.getActualMaximum(Calendar.DATE));
		
		if(personnelVO.getChoice_month().length()==1){
			personnelVO.setChoice_month("0"+personnelVO.getChoice_month());
		}
		
		String year = personnelVO.getChoice_year();
		String month = personnelVO.getChoice_month();
		
		if(personnelVO.getTotal().equals("tot")) {
			personnelVO.setChoice_monthS("01");
		} else {
			personnelVO.setChoice_monthS(personnelVO.getChoice_month());
		}
		personnelVO.setSort_date("1");
		personnelVO.setFlagHt("1");
		
		
		StaffVO staffVO = new StaffVO();
		
		try {
			model.addAttribute("userList", cmm.UserList(staffVO));
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		try{
			result = personnelDAO.selectPersonnelMonthList1(personnelVO); 
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		try{
			result1 = personnelDAO.selectTotalTradiness(personnelVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		map.put("personnelMonthList", result);
		model.addAttribute("personnelMonthList", map.get("personnelMonthList"));
		map.put("totalTradiness", result1);
		model.addAttribute("totalTradiness", map.get("totalTradiness"));
		model.addAttribute("choice_year", year);
		model.addAttribute("choice_month", month);
		
		return "personnel/vacation/ModifyTradinessMonthMain";
	}
		

}