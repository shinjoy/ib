package ib.selfImprovement.web;

import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.login.service.StaffVO;
import ib.selfImprovement.service.SelfImprovementVO;
import ib.selfImprovement.service.impl.SelfImprovementDAO;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
 * package  : ib.selfImprovement.web
 * filename : SelfImprovementController.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2013. 7. 1.
 * @version : 1.0.0
 */
@Controller
public class SelfImprovementController {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;
    
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;
    
    @Resource(name = "selfImprovementDAO")
    private SelfImprovementDAO selfDAO;  
    
    @Resource(name = "workService")
    private WorkService workService;
    
	/** log */
    protected static final Log LOG = LogFactory.getLog(SelfImprovementController.class);
	
	protected static Calendar cal = Calendar.getInstance();

	/**
	 * 자기개발 Main 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return Main Page
	 * @exception Exception
	 */
	@RequestMapping(value="/selfImprovement/index.do")
	public String index( SelfImprovementVO selfVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		List<SelfImprovementVO> result = null;
		List<SelfImprovementVO> file = null;
		
		if(selfVO.getChoice_year().equals("") && selfVO.getChoice_month().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
			
			selfVO.setChoice_year(date.substring(0, 4));
			selfVO.setChoice_month(date.substring(4, 6));
			workVO.setChoice_year(date.substring(0, 4));
			workVO.setChoice_month(date.substring(4, 6));
			
		}else{
			workVO.setChoice_year(selfVO.getChoice_year());
			//workVO.setChoice_month(selfVO.getChoice_month());
		}
		
		if(selfVO.getChoice_month().length()==1){
			selfVO.setChoice_month("0"+selfVO.getChoice_month());
			workVO.setChoice_month(selfVO.getChoice_month());
		}
		
		selfVO.setChoice_monthS("01");
		workVO.setChoice_monthS("01");
		selfVO.setChoice_month("12");
		workVO.setChoice_month("12");
		
		String year = selfVO.getChoice_year();
		String month = selfVO.getChoice_month();
		
		try{
			result = selfDAO.selectSelfImprovementList(selfVO);
			file = selfDAO.selectTempFile(selfVO);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		

		model.addAttribute("selfList", result);
		model.addAttribute("tempFileList", file);
		model.addAttribute("choice_year", year);
		model.addAttribute("choice_month", month); 

		return "selfImprovement/SelfMain";
    }
	
    
	/**
	 * 자기개발 left 직원
	 * @MethodName : selectWork
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/selfImprovement/selectLeft.do")
	public String selectLeft( 
			HttpSession session,
            ModelMap model) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		StaffVO staffVO = new StaffVO();
		try {
			model.addAttribute("userList", cmm.UserList(staffVO));
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
    	return "selfImprovement/SelfLeft";
    }
	
	
	
	/**
	 * 자기개발 main 내용 입력
	 * @MethodName : insertSelfImprovement
	 * @param selfVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/selfImprovement/insertSelf.do")
	public String insertSelfImprovement( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		int cnt = 0;
		try {
			cnt = selfDAO.insertList(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.insertList");
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "selfImprovement/SelfMain";
	}
	/**
	 * 자기개발 main 내용 삭제
	 * @MethodName : deleteSelfImprovement
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/selfImprovement/deleteSelf.do")
	public String deleteSelfImprovement( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		int cnt = 0;
		try {
			cnt = selfDAO.deleteSelf(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.deleteSelf");
			selfDAO.deleteSelfFile(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.deleteSelfFile");
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("deleteCnt", cnt);
		model.addAttribute("message", "삭제되었습니다.");
		return "selfImprovement/SelfMain";
	}

	/**
	 * 자기개발 main 노트 저장
	 * @MethodName : insertNote
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/selfImprovement/insertNote.do")
	public String insertNote( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		int cnt = 0;
		try {
			cnt = selfDAO.insertNote(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.insertNote");
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "selfImprovement/SelfMain";
	}
	
	
	/**                                  
	 * 
	 * 
	 * 
	 * 추천도서 BOOK
	 * 
	 * 
	 * 
	 **/
	
	
	/**
	 * 추천도서 main
	 * @MethodName : bookIndex
	 * @param selfVO
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/book/index.do")
	public String bookIndex( SelfImprovementVO selfVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		model.addAttribute("search", selfVO.getSearch());
		List<SelfImprovementVO> result = null;
		List<SelfImprovementVO> result1 = null;
		List<SelfImprovementVO> result2 = null;
		
		try{
			result = selfDAO.selectBookList(selfVO);
			result1 = selfDAO.selectEpilogueList(selfVO);
			result2 = selfDAO.selectReaderList(selfVO);

		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		StaffVO staffVO = new StaffVO();
		model.addAttribute("userList", cmm.UserList(staffVO));

		model.addAttribute("bookList", result);
		model.addAttribute("epilogueList", result1);
		model.addAttribute("readerList", result2);

		return "book/BookMain";
    }
	
	
	
	/**
	 * 도서입력
	 * @MethodName : insertBook
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/book/insertBook.do")
	public String insertBook( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		int cnt = 0;
		try {
			cnt = selfDAO.insertBook(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.insertBook");
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "book/BookMain";
	}
	
	/**
	 * 후기입력
	 * @MethodName : insertEpilogue
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/book/insertEpilogue.do")
	public String insertEpilogue( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		int cnt = 0;
		try {
			cnt = selfDAO.insertEpilogue(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.insertEpilogue");
			selfDAO.updateReader(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.updateReader^_^"+selfVO.getsNb());
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "book/BookMain";
	}

	/**
	 * 추천도서 삭제
	 * @MethodName : deleteBook
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/book/deleteBook.do")
	public String deleteBook( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		int cnt = 0;
		try {
			cnt = selfDAO.deleteBook(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.deleteBook");
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("deleteCnt", cnt);
		return "book/BookMain";
	}
	
	/**
	 * 후기 삭제
	 * @MethodName : deleteEpilogue
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/book/deleteEpilogue.do")
	public String deleteEpilogue( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		int cnt = 0;
		try {
			cnt = selfDAO.deleteEpilogue(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.deleteEpilogue");
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("deleteCnt", cnt);
		return "book/BookMain";
	}
	
	/**
	 * 추천도서 대여
	 * @MethodName : modifyRent
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/book/modifyRent.do")
	public String modifyRent( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		if("1".equals(selfVO.getRent())) selfVO.setRent(loginUser.getName());
		
		int cnt = 0;
		try {
			cnt = selfDAO.modifyRent(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.modifyRent^_^"+selfVO.getsNb());
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("deleteCnt", cnt);
		return "book/BookMain";
	}
	
	
	/**
	 * 도서입력 내용 수정
	 * @MethodName : updateBook
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/book/updateBook.do")
	public String updateBook( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		try {
			cnt = selfDAO.updateBook(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.updateBook^_^"+selfVO.getsNb());
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "book/BookMain";
	}
	/**
	 * 책읽는 사람 순서 저장
	 * @MethodName : saveReader
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/book/saveReader.do")
	public String saveReader( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		String[] usrId = selfVO.getArrUsrId();
		try {
			if(selfVO.getTmpNum1()!=null&&!"".equals(selfVO.getTmpNum1())){
				selfDAO.deleteReader(selfVO);
				LOG.debug(loginUser.getId()+"^_^selfDAO.deleteReader");
			}
			for(int i=0;i<usrId.length;i++){
				//System.out.println("\n\n====================="+usrId[i]);
				selfVO.setTurn(Integer.toString(i+1));
				selfVO.setReaderId(usrId[i]);
				cnt = selfDAO.saveReader(selfVO);
				LOG.debug(loginUser.getId()+"^_^selfDAO.saveReader^_^"+selfVO.getsNb());
			}
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "book/BookMain";
	}
	
	
	/**                                  
	 * 
	 * 
	 * 
	 * IDEA 제안
	 * 
	 * 
	 * 
	 **/

	
	/**
	 * idea 제안  main
	 * @MethodName : bookIndex
	 * @param selfVO
	 * @param workVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/idea/index.do")
	public String ideaIndex( SelfImprovementVO selfVO,
			WorkVO workVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		List<SelfImprovementVO> rstIdea = null;
		List<SelfImprovementVO> rstRcmd = null;
		
		if(selfVO.getChoice_year().equals("") && selfVO.getChoice_month().equals("")){
			// Calendar cal = Calendar.getInstance();
			cal.setTime( new Date(System.currentTimeMillis()) );
			String date = new SimpleDateFormat("yyyyMM").format( cal.getTime() );
			
			selfVO.setChoice_year(date.substring(0, 4));
			selfVO.setChoice_month(date.substring(4, 6));
			workVO.setChoice_year(date.substring(0, 4));
			workVO.setChoice_month(date.substring(4, 6));
			
		}else{
			workVO.setChoice_year(selfVO.getChoice_year());
			//workVO.setChoice_month(selfVO.getChoice_month());
		}
		StaffVO staffVO = new StaffVO();
		model.addAttribute("userList", cmm.UserList(staffVO));
		model.addAttribute("cmmCdProcessList", cmm.CommonCdList("00014"));
		
		selfVO.setChoice_monthS("01");
		workVO.setChoice_monthS("01");
		selfVO.setChoice_month("12");
		workVO.setChoice_month("12");
		
		String year = selfVO.getChoice_year();
		String month = selfVO.getChoice_month();
		
		try{
			rstIdea = selfDAO.selectIdeaList(selfVO);
			rstRcmd = selfDAO.selectRcmdList(selfVO);

		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		model.addAttribute("ideaList", rstIdea);
		model.addAttribute("rcmdList", rstRcmd);
		model.addAttribute("choice_year", year);
		model.addAttribute("choice_month", month); 

		return "idea/IdeaMain";
    }

	/**
	 * idea 제안 입력
	 * @MethodName : saveIdea
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/idea/insertIdea.do")
	public String saveIdea( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		try {
			cnt = selfDAO.saveIdea(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.saveIdea");
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "idea/IdeaMain";
	}
	/**
	 * idea 수정
	 * @MethodName : updateIdea
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/idea/updateIdea.do")
	public String updateIdea( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		try {
			cnt = selfDAO.updateIdea(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.updateIdea^_^"+selfVO.getsNb());
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "idea/IdeaMain";
	}
	/**
	 * idea 삭제하기
	 * @MethodName : deleteIdea
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/idea/deleteIdea.do")
	public String deleteIdea( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		try {
			cnt = selfDAO.deleteIdea(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.deleteIdea");
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "idea/IdeaMain";
	}

	/**
	 * 추천사유 입력
	 * @MethodName : saveRcmd
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/idea/insertRcmd.do")
	public String saveRcmd( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		try {
			cnt = selfDAO.saveRcmd(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.saveRcmd");
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "idea/IdeaMain";
	}
	
	/**
	 * 추천사유 수정
	 * @MethodName : updateRcmd
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/idea/updateRcmd.do")
	public String updateRcmd( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		try {
			cnt = selfDAO.updateRcmd(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.updateRcmd^_^"+selfVO.getsNb());
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "idea/IdeaMain";
	}
	
	/**
	 * 추천사유 삭제
	 * @MethodName : deleteRcmd
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/idea/deleteRcmd.do")
	public String deleteRcmd( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		try {
			cnt = selfDAO.deleteRcmd(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.deleteRcmd");
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "idea/IdeaMain";
	}
	
	/**
	 * 아이디어 코멘트 평가 수정
	 * @MethodName : updateEval
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/idea/updateEval.do")
	public String updateEval( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		try {
			cnt = selfDAO.updateEval(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.updateEval^_^"+selfVO.getsNb());
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "idea/IdeaMain";
	}	
	/**
	 * 아이디어 진행사항 수정
	 * @MethodName : updateProcess
	 * @param selfVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/idea/updateProcess.do")
	public String updateProcess( SelfImprovementVO selfVO,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		selfVO.setRgId(loginUser.getId());
		
		int cnt = 0;
		try {
			cnt = selfDAO.updateProcess(selfVO);
			LOG.debug(loginUser.getId()+"^_^selfDAO.updateProcess^_^"+selfVO.getsNb());
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		model.addAttribute("saveCnt", cnt);
		return "idea/IdeaMain";
	}	
}