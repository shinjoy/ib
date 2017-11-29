package ib.mobile.web;

import ib.basic.web.MultiFileUpload;
import ib.cmm.ComCodeVO;
import ib.cmm.FileUpDbVO;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.service.CommonService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.login.service.StaffVO;
import ib.person.service.PersonVO;
import ib.push.service.PushService;
import ib.recommend.service.RecommendService;
import ib.recommend.service.RecommendVO;
import ib.reply.service.ReplyVO;
import ib.schedule.service.SpCmmVO;
import ib.schedule.service.impl.ScheduleVO;
import ib.stats.service.StatsService;
import ib.work.service.WorkMemoService;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;
import ib.work.web.WorkMemoController;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import egovframework.rte.fdl.property.EgovPropertyService;


@Controller
public class MbDealCommentController {
	
	@Resource(name="CmmUseService")
	private CmmUseService cmm;
	
	@Resource(name="workService")
	private WorkService workService;
	
	@Resource(name="recommendService")
	private RecommendService recommendService;
	
	@Resource(name="statsService")
	private StatsService statsService;
	
    /** log */
    protected static final Log LOG = LogFactory.getLog(MbDealCommentController.class);
   
    Calendar cal = Calendar.getInstance();
	
    //딜 코멘트 리스트 페이지
  	@SuppressWarnings({ "unchecked" })
  	@RequestMapping(value = "m/deal/dealCommentMain.do")
  	public String alarmListMainPop(
  			HttpServletRequest req,
  			HttpServletResponse response,HttpSession session,
  			ModelMap model, @RequestParam Map<String,Object>map
  			) throws Exception {
  		
  	
  		if(session.getAttribute("userLoginInfo")==null)  return "m/sessionOut";
  		
  		
  		return "/m/dealComment/dealCommentMain";
  		
  	}
  	
    //딜 코멘트 리스트
   	@SuppressWarnings({ "unchecked" })
   	@RequestMapping(value = "m/deal/getDealCommentList.do")
   	public void getDealCommentList(
   			HttpServletRequest req,
   			HttpServletResponse response,HttpSession session,
   			ModelMap model, @RequestParam Map<String,Object>map
   			) throws Exception {
   		
   		LoginVO loginUser=(LoginVO)session.getAttribute("userLoginInfo");
		
   		String tab = map.get("tab").toString();
   		map.put("sorting", "");
   		map.put("listed", "");
   		map.put("middleOfferCd", "");
   		
   		Map resultMap = new HashMap();
   		
   		if("00001".equals(tab)){ 			//메자닌_상장
   			map.put("sorting", "00001");
   	   		map.put("listed", "Y");
   		}else if("00002".equals(tab)){		//딜 제안중
   			map.put("middleOfferCd", "00004");
   	   		map.put("sorting", "null");
		}else if("00004".equals(tab)){		//메자닌_비상장
			map.put("sorting", "00001");
   	   		map.put("listed", "N");
   	   	}else if("00005".equals(tab)){		//PRE-IPO
   	   		map.put("sorting", "00012");	
		}else if("00006".equals(tab)){		//벤처
			map.put("sorting", "00016");
		}else if("00007".equals(tab)){		//M&A
			map.put("sorting", "00008");
		}else if("00008".equals(tab)){		//스팩
			map.put("sorting", "00013");
		}else if("00000".equals(tab)){		//전체
			map.put("sorting", "00000");
		}else if("00009".equals(tab)){		//바이오/헬스케어
			map.put("sorting","00017");
		}else{ //그 이외에
			map.put("sorting",tab);
		}
   		
		List list = workService.selectDealCommentList(map);
		List todayCommentList = workService.getTodayDealComment(map);
		
		resultMap.put("commentList", list);
		resultMap.put("todayCommentList", todayCommentList);
		
   		
		AjaxResponse.responseAjaxObject(response, resultMap);
   		
   		
   		
   	}
  	
 
}