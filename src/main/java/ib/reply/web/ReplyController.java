/**
 * 
 */
/**
 * 
 * @author  : ChanWoo Lee
 * @since   : 2015. 2. 5.
 * @filename : package-info.java
 * @version : 1.0.0
 * @see
 *
 * <pre>
 * package  : ib.reply.web
 * </pre>
 */
package ib.reply.web;

import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.login.service.StaffVO;
import ib.reply.service.ReplyVO;
import ib.work.service.WorkService;
import ib.work.service.impl.WorkDAO;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReplyController {

	/** CmmUseService */
	@Resource(name = "CmmUseService")
	private CmmUseService cmm;

	/** MessageSource */
	@Resource(name = "IBsMessageSource")
	IBsMessageSource MessageSource;

	@Resource(name = "workService")
	private WorkService workService;

	@Resource(name = "workDAO")
	private WorkDAO workDAO;
	
	/** log */
  protected static final Log LOG = LogFactory.getLog(ReplyController.class);
  
	/**
	 * 딜 화면 팝업에서 매각관련 내용 팝업
	 * @MethodName : PopUpReplyDisposal
	 * @param rcmdVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 2. 5.
	 */
	@RequestMapping(value="/reply/PopUpReplyDisposal.do")
	public String PopUpReplyDisposal( ReplyVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		String rtn = "ajaxPopDiv/replyDisposal";
		
		try{
			
			StaffVO staffVO = new StaffVO();
			model.addAttribute("userList", cmm.UserList(staffVO));
			model.addAttribute("offerSNB", vo.getsNb());
			model.addAttribute("supportList", workDAO.selectSupporterList(vo));
			
			if("stats".equals(vo.getTmpNum2())) {
				model.addAttribute("disposalList", workDAO.selectDisposalList4stats(vo));
				model.addAttribute("close", "stats");
				model.addAttribute("mainNm", vo.getTmpNum1());

				rtn = "ajaxPopDiv/statsDisposal";
				
			}else{
				model.addAttribute("disposalList", workDAO.selectDisposalList(vo));
				
			}
			
		}catch (Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		return rtn;
	}
	/**
	 * 매각 모달 페이지 저장
	 * @MethodName : saveDisposal
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 2. 23.
	 */
	@RequestMapping(value="/reply/saveDisposal.do")
	public String saveDisposal( ReplyVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		try{
			
			String[] arr = null; 
			if(vo.getArrStaffSnb()!=null){
				arr = new String[vo.getArrStaffSnb().length];
				for(int i=0
						,leng=vo.getArrStaffSnb().length; i<leng; i++){
					
					ReplyVO vo1 = new ReplyVO();
					vo1.setRgId(loginUser.getId());
					vo1.setStaffSnb(vo.getArrStaffSnb()[i]);
					vo1.setPrice(vo.getArrPrice()[i]);
					vo1.setMargin(vo.getArrMargin()[i]);
					vo1.setInvestSnb(vo.getArrSnb2nd()[i]);
					
					int updLeng = 0;
					if(vo.getArrSnb()!=null){
						updLeng=vo.getArrSnb().length;
					}
					if(i<updLeng){//update
						vo1.setsNb(vo.getArrSnb()[i]);
						workDAO.updateDisposal(vo1);
						
					}else{//insert
						vo1.setOfferSnb(vo.getOfferSnb());
						arr[i]=workDAO.insertDisposal(vo1);
					}
				}
			}
			//supporter insert
			if(vo.getArrOfferSnb()!=null){
				for(int j=0
						,supLeng=vo.getArrOfferSnb().length; j<supLeng; j++){
					
					ReplyVO vo2 = new ReplyVO();
					
					String offerSnb = vo.getArrOfferSnb()[j];
					
					if(offerSnb.indexOf("_")>-1){
						offerSnb = arr[Integer.parseInt(offerSnb.replace("_",""))];
					}
					
					
					vo2.setRgId(loginUser.getId());
					vo2.setOfferSnb(offerSnb);
					vo2.setStaffSnb(vo.getArrSupSnb()[j]);
					vo2.setRatio(vo.getArrRatio()[j]);
					
					if(offerSnb.equals(vo.getOfferSnb())) vo2.setCate("1");
					else vo2.setCate("2");
					
					workDAO.insertSupporter(vo2);
					
				}
			}
			model.addAttribute("result", 1);
			
		}catch(Exception e){
			model.addAttribute("result", -1);
			LOG.error(e);
			e.printStackTrace();
		}
		
		return "basic/result";
	}
	/**
	 * 딜 팝업 페이지 매각 삭제
	 * @MethodName : deleteDisposal
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 2. 24.
	 */
	@RequestMapping(value="/reply/deleteDisposal.do")
	public String deleteDisposal( ReplyVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		try{
			for(int i=0
					,leng=vo.getArrSnb().length; i<leng; i++){
				vo.setsNb(vo.getArrSnb()[i]);
				workDAO.deleteDisposal(vo);
			}
			model.addAttribute("result", 1);
		}catch(Exception e){
			model.addAttribute("result", -1);
			LOG.error(e);
			e.printStackTrace();
		}
		
		return "basic/result";
	}
	/**
	 * 딜 팝업 페이지 서포터 삭제
	 * @MethodName : deleteSupporter
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 2. 24.
	 */
	@RequestMapping(value="/reply/deleteSupporter.do")
	public String deleteSupporter( ReplyVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		try{
			for(int i=0
					,leng=vo.getArrSnb().length; i<leng; i++){
				vo.setsNb(vo.getArrSnb()[i]);
				workDAO.deleteSupporter(vo);
			}
			model.addAttribute("result", 1);
		}catch(Exception e){
			model.addAttribute("result", -1);
			LOG.error(e);
			e.printStackTrace();
		}
		
		return "basic/result";
	}
}