package ib.bsnsPlan.web;

import ib.basic.web.Util;
import ib.bsnsPlan.service.BsnsPlanVO;
import ib.bsnsPlan.service.impl.BsnsPlanDAO;
import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.login.service.StaffVO;
import ib.personnel.service.ManagementVO;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
 * @param <BsnsPlanDAO>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 12. 6.
 * @version : 1.0.0
 */
@Controller
public class BsnsPlanController {
    
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;
    
    @Resource(name = "bsnsPlanDAO")
    private BsnsPlanDAO bsnsPlanDAO;  
    
	@Resource(name="CmmUseService")
	private CmmUseService cmm;
    
    @Resource(name = "workService")
    private WorkService workService;
    
	/** log */
    protected static final Log LOG = LogFactory.getLog(BsnsPlanController.class);

	protected static Calendar cal = Calendar.getInstance();
	
	/**
	 * 
	 * @MethodName : index
	 * @param personnelVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/bsnsPlan/index.do")
	public String index( BsnsPlanVO bsnsPlanVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		bsnsPlanVO.setRgId(loginUser.getId());
		model.addAttribute("sltNm", loginUser.getName());
		
		List<BsnsPlanVO> result = null;
		
		model.addAttribute("cmmCdList", cmm.CommonCdList(bsnsPlanVO.ccdMidOffCd));
		
		
		if(bsnsPlanVO.getChoice_year().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyy").format( cal.getTime() );
			
			bsnsPlanVO.setChoice_year(date);
			
		}//System.out.println("---------choice_year---"+bsnsPlanVO.getChoice_year()+"---");
		String year = bsnsPlanVO.getChoice_year();
		
		try {
			result = bsnsPlanDAO.selectBsnsPlanList(bsnsPlanVO);
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
//		map.put("bsnsPlanList", result);
		model.addAttribute("bsnsPlanList", result);
		model.addAttribute("choice_year", year);
		
    	return "bsnsPlan/BsnsPlanMain";
    }
	/**
	 *
	 * @MethodName : viewIndex
	 * @param bsnsPlanVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/bsnsPlan/viewIndex.do")
	public String viewIndex( BsnsPlanVO bsnsPlanVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		List<BsnsPlanVO> result = null;
//		Map<String, Object> map = new HashMap<String, Object>();
		model.addAttribute("sltId", bsnsPlanVO.getRgId());
		model.addAttribute("sltNm", bsnsPlanVO.getStaffNm());
		
		model.addAttribute("cmmCdList", cmm.CommonCdList(bsnsPlanVO.ccdMidOffCd));
		
		if(bsnsPlanVO.getChoice_year().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyy").format( cal.getTime() );
			
			bsnsPlanVO.setChoice_year(date);
			
		}//System.out.println("---------choice_year---"+bsnsPlanVO.getChoice_year()+"---");
		String year = bsnsPlanVO.getChoice_year();
		
		try {
			result = bsnsPlanDAO.selectBsnsPlanList(bsnsPlanVO);
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
//		model.addAttribute("staffName", (String)result.get(0).getStaffNm());
		model.addAttribute("bsnsPlanList", result);
		model.addAttribute("choice_year", year);
		
		return "bsnsPlan/viewBsnsPlanMain";
	}

	
	/**
	 * Main - Left
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return Left Page
	 * @exception Exception
	 */
	@RequestMapping(value="/bsnsPlan/selectLeft.do")
	public String selectWork(
            ModelMap model) throws Exception{
		/*
		StaffVO staffVO = new StaffVO();
		
		try {
			model.addAttribute("userList", cmm.UserList(staffVO));
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}*/
		//System.out.println("===========selectLeft==============");
    	return "bsnsPlan/BsnsPlanLeft";
    }
	
	


	boolean init_array(String[] array, int number, BsnsPlanVO vo, int list_leng, String return_value){
		if(array!=null && list_leng>number){
			if(array[number]!=null && !"".equals(array[number])){
				vo.setRtnVal(array[number]);
			}else{
				if(list_leng==2000) return false;
				vo.setRtnVal(return_value);
			}
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 업무계획 입력/수정
	 * @MethodName : BsnsPlan
	 * @param bsnsPlanVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/bsnsPlan/insertBsnsPlan.do")
	public String BsnsPlan( BsnsPlanVO vo,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());
		model.addAttribute("choice_year", vo.getChoice_year());
		
		
		for(int i=0; i<vo.getARbsnsList().length; i++){
			
			String Day = "";
			if(i<9) Day = "0"+(i+1); else Day = Integer.toString(i+1);//항목 순서지정 - 정렬위한 순서
			vo.setChoice_day(Day);
			vo.setChoice_month(vo.getARrdo()[i]);
			
			if(Util.init_array(vo.getARbsnsDtail(), 		i, vo, 1000, "")) 				vo.setBsnsDtail(vo.getRtnVal());
			if(Util.init_array(vo.getARsNb(), 			i, vo, vo.getObLen(), null)) 	vo.setsNb(vo.getRtnVal());
			if(Util.init_array(vo.getARbsnsList(), 		i, vo, 1000, "")) 				vo.setBsnsList(vo.getRtnVal());
			if(Util.init_array(vo.getARdetailDivCd(), 	i, vo, 1000, "00041")) 			vo.setDetailDivCd(vo.getRtnVal());
			if(Util.init_array(vo.getARgoal(), 			i, vo, 1000, "")) 				vo.setGoal(vo.getRtnVal());
			if(Util.init_array(vo.getARgoalM(), 			i, vo, 1000, "")) 				vo.setGoalM(vo.getRtnVal());
			if(Util.init_array(vo.getARgoalHY(), 		i, vo, 1000, "")) 				vo.setGoalHY(vo.getRtnVal());
			if(Util.init_array(vo.getARnote(), 			i, vo, 1000, null)) 			vo.setNote(vo.getRtnVal());
			if(Util.init_array(vo.getARschedule(), 		i, vo, 1000, "0")) 				vo.setSchedule(vo.getRtnVal());
			if(Util.init_array(vo.getARmon1(), 		i, vo, 1000, null)) 				vo.setMon1(vo.getRtnVal());
			if(Util.init_array(vo.getARmon2(), 		i, vo, 1000, null)) 				vo.setMon2(vo.getRtnVal());
			if(Util.init_array(vo.getARmon3(), 		i, vo, 1000, null)) 				vo.setMon3(vo.getRtnVal());
			if(Util.init_array(vo.getARmon4(), 		i, vo, 1000, null)) 				vo.setMon4(vo.getRtnVal());
			if(Util.init_array(vo.getARmon5(), 		i, vo, 1000, null)) 				vo.setMon5(vo.getRtnVal());
			if(Util.init_array(vo.getARmon6(), 		i, vo, 1000, null)) 				vo.setMon6(vo.getRtnVal());
			
			
			/*System.out.println("---------insertBsnsPlan---\n"
					+"bsnsDtail:"+vo.getARbsnsDtail()[i]+" / "
					+"snb:"+vo.getARsNb()[i]+" / "
					+"bsnsList:"+vo.getARbsnsList()[i]+" / "
					+"detailDivCd:"+vo.getARdetailDivCd()[i]+" / "
					+"goal:"+vo.getARgoal()[i]+" / "
					+"schedule:"+vo.getARschedule()[i]);
			*/
			
			try{
				if(vo.getObLen()>i){
					if("".equals(vo.getBsnsList()) && "".equals(vo.getGoalM()) & "".equals(vo.getGoalHY())){ 
						bsnsPlanDAO.deleteBsnsPlan(vo); //delete
						LOG.debug(loginUser.getId()+"^_^bsnsPlanDAO.deleteBsnsPlan");
					}else{
						bsnsPlanDAO.updateBsnsPlan(vo); //update
						LOG.debug(loginUser.getId()+"^_^bsnsPlanDAO.updateBsnsPlan^_^"+vo.getsNb());
					}
				}else {
					if(Integer.parseInt(vo.getARdetailDivCd()[i])<21){ 
						if((vo.getARgoalM()[i]==null || "".equals(vo.getARgoalM()[i]))&(vo.getARgoalHY()[i]==null || "".equals(vo.getARgoalHY()[i]))) 
							continue;
					}else{ 
						if(vo.getARbsnsDtail()[i]==null || "".equals(vo.getARbsnsDtail()[i])) 
							continue;
					}
					//if((vo.getARbsnsDtail()[i]==null || "".equals(vo.getARbsnsDtail()[i]))&(vo.getARgoal()[i]==null || "".equals(vo.getARgoal()[i]))) continue;
					if(Util.init_array(vo.getARbsnsList(), 		i, vo, 1000, "00000")) 			vo.setBsnsList(vo.getRtnVal());
					if(Util.init_array(vo.getARgoalM(), 		i, vo, 1000, "0")) 				vo.setGoalM(vo.getRtnVal());
					if(Util.init_array(vo.getARgoalHY(), 		i, vo, 1000, "0")) 				vo.setGoalHY(vo.getRtnVal());

					bsnsPlanDAO.insertBsnsPlan(vo);//insert 
					LOG.debug(loginUser.getId()+"^_^bsnsPlanDAO.insertBsnsPlan");
				}
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
		}
		model.addAttribute("saveCnt", "1");
		return "bsnsPlan/BsnsPlanMain";
//    	return "redirect:/bsnsPlan/index.do";
    }
	
	/**
	 * 노트 수정
	 * @MethodName : BsnsPlanNote
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/bsnsPlan/insertBsnsPlanNote.do")
	public String BsnsPlanNote( BsnsPlanVO vo,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());
		
		try{
			bsnsPlanDAO.updateBsnsPlanNote(vo); //update
			LOG.debug(loginUser.getId()+"^_^bsnsPlanDAO.updateBsnsPlanNote^_^"+vo.getsNb());
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "bsnsPlan/BsnsPlanMain";
	}

	/**
	 * 드래그 앤 드롭 수정
	 * @MethodName : modifyBusinessPlanTmdt
	 * @param request
	 * @param session
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/bsnsPlan/modifyBusinessPlanTmdt.do")
	public String modifyBusinessPlanTmdt(HttpServletRequest request,
			HttpSession session,
			BsnsPlanVO vo,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setRgId(loginUser.getId());
		
		vo.setChoice_year(vo.getTmDt().substring(0,4));
		
		List<BsnsPlanVO> result = null;
		int cnt = 0;
		try{
			result = bsnsPlanDAO.selectBsnsPlanList(vo);
			
			int InTurn = Integer.parseInt(vo.getTmDt().substring(8,10))
				,LsTurn = 1
				,idx = 0
				,LsMax = result.size()
				,Max = LsMax<(InTurn+1)?(InTurn+1):LsMax ;
			String InSnb = vo.getsNb();
			StringBuffer bufTmDt = new StringBuffer();
			if(InTurn==0)LsTurn = 0;
			System.out.println("\n\n====================\n");
			while(idx<Max & (idx+LsTurn)<=(idx+LsMax)){
				System.out.println(InTurn+"::"+idx+":"+LsTurn+"::"+LsMax+":"+Max);
				//System.out.println("\n\n====================\n"+InTurn+"::"+idx+":"+LsTurn+"::"+LsMax+":"+Max+"\n====================\n");
				if(InTurn==LsTurn){
					vo.setsNb(InSnb);
				}else{
					String LsSnb = result.get(idx).getsNb();
					idx++;
					if(InSnb.equals(LsSnb)){
						continue;
					}else{
						vo.setsNb(LsSnb);
					}
				}
				bufTmDt.delete(0,bufTmDt.capacity());
				bufTmDt.append(vo.getTmDt().substring(0,8));
				bufTmDt.append(LsTurn < 10?"0"+LsTurn:LsTurn);
				
				vo.setTmDt(bufTmDt.toString());
				System.out.println("----------------\n"+vo.getTmDt()+"\n----------------\n");
			LsTurn++;
			cnt = bsnsPlanDAO.updateBusinessPlanTmdt(vo);
			LOG.debug(loginUser.getId()+"^_^bsnsPlanDAO.updateBusinessPlanTmdt^_^"+vo.getsNb());
			}
			System.out.println("\n\n====================\n");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		
		return "work/PrivateWorkView";
	}
}