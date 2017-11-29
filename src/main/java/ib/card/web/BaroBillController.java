package ib.card.web;

import ib.card.service.CardService;
import ib.card.service.CardVO;
import ib.card.service.impl.CardDAO;
import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.cmm.service.CommonService;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.cmm.util.sim.service.LogUtil;
import ib.login.service.StaffVO;
import ib.work.service.WorkVO;

import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baroservice.ws.*;
import com.google.gson.JsonParser;


/**
 * <pre>
 * package  : ib.card.web
 * filename : CardController.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 11. 14.
 * @version : 1.0.0
 */
@Controller
public class BaroBillController {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;
    
    @Resource(name = "cardDAO")
    private CardDAO cardDAO;  
    
    @Resource(name = "cardService")
    private CardService cardService;  
    
	/** log */
    protected static final Log LOG = LogFactory.getLog(BaroBillController.class);

	/**
	 * 바로빌 카드사용내역 가져오기(스케쥴러 통한 배치형식)
	 * @MethodName : /barobill/updateCardCorpUsed.do
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/barobill/updateCardCorpUsed.do")
	@ResponseBody
	public void updateCardCorpUsed(HttpServletRequest request, HttpSession session,			
			ModelMap model) throws RemoteException{
		
		System.out.println("## Auth getAuthType: " + request.getAuthType());
		Enumeration<String> names = request.getHeaderNames();
		while(names.hasMoreElements() == true){
			System.out.println("## Auth getHeaderName: " + names.nextElement().toString());
		}
		 
		
		try{
			// baseDate 기준 
			// 지정일 없을 경우 기준일(오늘) 하루전으로 지정(카드사 데이타 업데이트 시점 불일치로 인해 7일치 데이타 확보)
			// 주말, 공휴일에 대한 체크로직 필요
			String baseDate = "";
			if( request.getParameter("baseDate") == null ){				
				cardService.insertCardCorpUsed(getBaseDate(-1));
				cardService.insertCardCorpUsed(getBaseDate(-2));
				cardService.insertCardCorpUsed(getBaseDate(-3));
				cardService.insertCardCorpUsed(getBaseDate(-4));
				cardService.insertCardCorpUsed(getBaseDate(-5));
				cardService.insertCardCorpUsed(getBaseDate(-6));
				cardService.insertCardCorpUsed(getBaseDate(-7));
			}
			// 지정일 있을 경우 해당일자 데이타 확보
			else{
				baseDate = request.getParameter("baseDate").toString();
				cardService.insertCardCorpUsed(baseDate);
			}			
			
			
		}catch(RemoteException re){
			
		}catch(Exception ex){
			System.out.println("## Error insertCardCorpUsed");
		}    	
    }
	
	// 오늘일자 기준으로 day 일만큼 더하고 뺀 날짜값 계산
	private String getBaseDate(int day){
		Calendar cal = Calendar.getInstance();
		
		cal.add(cal.DATE, day);				
		SimpleDateFormat yesterday = new SimpleDateFormat("yyyyMMdd");
		return yesterday.format(cal.getTime());
	}
	
}