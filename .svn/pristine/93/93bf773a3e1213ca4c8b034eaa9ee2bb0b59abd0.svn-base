package ib.board.web;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


import ib.board.service.BoardService;
import ib.board.service.impl.BoardVO;
import ib.cmm.util.sim.service.AjaxResponse;
import ib.schedule.service.CusService;
import ib.schedule.service.FormDocService;
import ib.schedule.service.LoginVO;
import ib.schedule.service.ScheduleService;
import ib.schedule.service.SpCmmVO;
import ib.schedule.service.Utill;
@Controller
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@Resource(name = "cusService")
	private CusService cusService;
	
	@Resource(name = "formService")
	private FormDocService formService;
	
	@Resource(name = "scheService")
	private ScheduleService scheService;
	
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	//protected static final Log LOG = LogFactory.getLog(BoardController.class);
	
	
	//왼쪽메뉴
	@RequestMapping(value="/board/selectLeft.do")
	public String boardSelectLeft( 
			HttpSession session,
			HttpServletRequest req,
			ModelMap model,BoardVO boardVO) throws Exception{
		ib.cmm.LoginVO loginUser = (ib.cmm.LoginVO) session.getAttribute("userLoginInfo");
		model.addAttribute("boardVO",boardVO);
		boardVO.setDivision(loginUser.getDivision());
		model.addAttribute("GrpInfo", boardService.GetGrpInfo(boardVO));
		return "board/left";
	}
	
	//ajax
		@RequestMapping(value="/board/getGrpInfo.do")
		public void getGrpInfo( 
				HttpSession session,
				HttpServletRequest req,
				HttpServletResponse response,
				ModelMap model,BoardVO boardVO) throws Exception{
			ib.cmm.LoginVO loginUser = (ib.cmm.LoginVO) session.getAttribute("userLoginInfo");
			LoginVO vo = (LoginVO)req.getSession().getAttribute("loginVO");
			boardVO.setRegPerSabun(vo.getPerSabun());
			boardVO.setDivision(loginUser.getDivision());
			BoardVO bord =boardService.GetGrpInfo(boardVO);
			
			
			AjaxResponse.responseAjaxObject(response, bord);
		}
	//ajax
	@RequestMapping(value="/board/getCateList.do")
	public void getCateList( 
			HttpSession session,
			HttpServletRequest req,
			HttpServletResponse response,
			ModelMap model,BoardVO boardVO) throws Exception{
		ib.cmm.LoginVO loginUser = (ib.cmm.LoginVO) session.getAttribute("userLoginInfo");
		LoginVO vo = (LoginVO)req.getSession().getAttribute("loginVO");
		boardVO.setRegPerSabun(vo.getPerSabun());
		boardVO.setDivision(loginUser.getDivision());
		List<Map> resultMap = boardService.GetBoardCateList(boardVO);
		

		AjaxResponse.responseAjaxSelect(response, resultMap);
	}
	//ajax
	@RequestMapping(value="/board/getEmpList.do")
	public void getEmpList( 
			HttpSession session,
			HttpServletRequest req,
			HttpServletResponse response,
			ModelMap model,BoardVO boardVO) throws Exception{
		ib.cmm.LoginVO loginUser = (ib.cmm.LoginVO) session.getAttribute("userLoginInfo");
		LoginVO vo = (LoginVO)req.getSession().getAttribute("loginVO");
		boardVO.setRegPerSabun(vo.getPerSabun());
		boardVO.setDivision(loginUser.getDivision());
		List<Map> resultMap =boardService.GetBoardCateList(boardVO);
		

		AjaxResponse.responseAjaxSelect(response, resultMap);
	}
	
	
	
	
	@RequestMapping(value = "/Html5PhotoView.do")
	public void Html5PhotoView(HttpServletRequest req, HttpServletResponse res) throws Exception {
		try {
			// 파일정보
			String sFileInfo = "";
			String filename = req.getHeader("file-name");	// 파일명을 받는다 - 일반 원본파일명
			String filename_ext = filename.substring(filename.lastIndexOf(".")+1);	// 파일 확장자
			filename_ext = filename_ext.toLowerCase();	// 확장자를소문자로 변경

			// 이미지 검증 배열변수
			String[] allow_file = {"jpg","png","bmp","gif"};

			// 돌리면서 확장자가 이미지인지 
			int cnt = 0;
			for(int oOo = 0; oOo < allow_file.length; oOo++) {
				if(filename_ext.equals(allow_file[oOo])){
					cnt++;
				}
			}

			// 이미지가 아님
			if(cnt == 0) {
			PrintWriter print = res.getWriter();
				print.print("NOTALLOW_"+filename);
				print.flush();
				print.close();
			}
			else { // 이미지이므로 신규 파일로 디렉토리 설정 및 업로드	
				String NewFileNm = "", SerFilePath = "", RealFilePath = "F:/SynergyCus/DATA/ImgView/";
//				SerFilePath = req.getSession().getServletContext().getRealPath("/")+"/resources/editor/multiupload/";
				SerFilePath = req.getSession().getServletContext().getRealPath("/")+"/DATA/ImgView/";
				File FileDir = new File(SerFilePath);
				if(!FileDir.exists() || FileDir.isFile()) FileDir.mkdirs();

				NewFileNm = System.currentTimeMillis() + filename.substring(filename.lastIndexOf("."));
				String SerFile = SerFilePath + NewFileNm;
				String RealFile = RealFilePath + NewFileNm;

				///////////////// 서버에 파일쓰기 ///////////////// 
				InputStream is = req.getInputStream();
				OutputStream os = new FileOutputStream(SerFile);
				OutputStream os2 = new FileOutputStream(RealFile);
				int numRead;
				byte b[] = new byte[Integer.parseInt(req.getHeader("file-size"))];
				while((numRead = is.read(b,0,b.length)) != -1) {
					os.write(b, 0, numRead);
					os2.write(b, 0, numRead);
				}
				if(is != null) {
					is.close();
				}
				os.flush();
				os.close();
				os2.flush();
				os2.close();

				System.out.println("size=="+req.getHeader("file-size")+"====filenm=="+filename+"==="+NewFileNm);
				///////////////// 서버에 파일쓰기 /////////////////
				
				// 정보 출력
				sFileInfo += "&bNewLine=true";
				// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
				sFileInfo += "&sFileName="+ filename;
//				sFileInfo += "&sFileURL="+"/SynergyCus/resources/editor/multiupload/"+NewFileNm;
				sFileInfo += "&sFileURL="+"/SynergyCus/DATA/ImgView/"+NewFileNm;
				PrintWriter print = res.getWriter();
				print.print(sFileInfo);
				print.flush();
				print.close();
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/PhotoView.do")
	public String PhotoView(Locale locale, Model model,HttpServletRequest req, HttpServletResponse res) throws Exception {
		final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;
		final Map<String, MultipartFile> files = multiRequest.getFileMap();

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		String NewFileNm = "", SerFilePath = "", RealFilePath;
		
		SerFilePath = req.getSession().getServletContext().getRealPath("/")+"/DATA/ImgView";
		File FileDir = new File(SerFilePath);
		if(!FileDir.exists() || FileDir.isFile()) FileDir.mkdirs();
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;
		
		while(itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			if(!"".equals(file.getOriginalFilename())) {
				NewFileNm = Utill.UpFileReName(file, file.getOriginalFilename(), SerFilePath);// 파일명 변경
				file.transferTo(new File(SerFilePath + "/" + NewFileNm));	// 파일 카피
			}
		}
		
		RealFilePath = "F:/SynergyCus/DATA/ImgView";
		File RealFile = new File(RealFilePath);
		if(!RealFile.exists() || RealFile.isFile()) RealFile.mkdirs();
		
		File RealFileFlag = new File(RealFilePath + "/" + NewFileNm);
		if(!RealFileFlag.isFile()) {	// 웹루트에 파일이 없다면 업로드 폴더에서 복사해준다.
			FileInputStream fis = new FileInputStream(SerFilePath + "/" + NewFileNm);
			FileOutputStream fos = new FileOutputStream(RealFilePath + "/" + NewFileNm);
			int data = 0;
			while((data=fis.read())!=-1) {
				fos.write(data);
			}
			fis.close();
			fos.close();
		}
		model.addAttribute("NewFileNm", NewFileNm);
		model.addAttribute("FilePath", SerFilePath);
		
		System.out.println("=="+NewFileNm+"===");
		
		return "board/CallBack";
	}
	
	// 파일 다운로드
	@RequestMapping(value = "/FileDown.do")
	public void FileDown(Map<String, Object> commandMap, HttpServletRequest req, HttpServletResponse res) throws Exception {
		String FilePath = Utill.SpecialStrChange(req.getParameter("FilePath"));
		String FileUpNm = Utill.SpecialStrChange(req.getParameter("FileUpNm"));
		String FileNm = Utill.SpecialStrChange(req.getParameter("FileNm")).replace(",", "/");
		
		FilePath = new String(FilePath.getBytes("8859_1"), "UTF-8");
		FileUpNm = new String(FileUpNm.getBytes("8859_1"), "UTF-8");
		FileNm = new String(FileNm.getBytes("8859_1"), "UTF-8");
		
		System.out.println("FilePath==="+FilePath+"==="+new String(FilePath.getBytes("8859_1"), "UTF-8"));
		System.out.println("FileUpNm==="+FileUpNm+"==="+new String(FileUpNm.getBytes("8859_1"), "UTF-8"));
		System.out.println("FileNm=="+FileNm+"==="+new String(FileNm.getBytes("8859_1"), "UTF-8"));
		Utill.FileDownload(FilePath, FileUpNm, FileNm, req, res);
	}

	
	/** 관리자 **/
	// 관리 페이지
	@RequestMapping(value = "/AdminMng.do")
	public String AdminMng(@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, HttpServletRequest req, BoardVO vo, Model model) throws Exception {
		model.addAttribute("GrpCateList", boardService.GetGrpCateList());
		model.addAttribute("EmpList", formService.GetPerList());
		model.addAttribute("CateOptPerList", boardService.GetCateOptPerList());
		
		model.addAttribute("vo", vo);
		model.addAttribute("message", spCmmVO.getInfoMessage());
		return "board/AdminMng";
	}
	
	// 게시판 그룹 등록/수정/삭제 완료
	@RequestMapping(value = "/GrpProcEnd.do")
	public String GrpProcEnd(BoardVO vo, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
		beanValidator.validate(vo, bindingResult);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("vo", vo);
			model.addAttribute("message", "실패 하였습니다.");
			return "board/AdminMng";
		}
		boardService.GrpProcEnd(vo);
		status.setComplete();
		return "forward:/AdminMng.do";
	}
	
	// 게시판 카테고리 등록/수정/삭제 완료
	@RequestMapping(value = "/CateProcEnd.do")
	public String CateProcEnd(HttpServletRequest req, BoardVO vo, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
		beanValidator.validate(vo, bindingResult);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("vo", vo);
			model.addAttribute("message", "실패 하였습니다.");
			return "board/AdminMng";
		}
		boardService.CateProcEnd(req, vo);
		status.setComplete();
		return "forward:/AdminMng.do";
	}
	/** 관리자 **/
	
	/** 타이틀 **/
	
	
	/** 타이틀 **/
	
	
	/** 게시물 **/
	// 결재진행중 문서 리스트
	@RequestMapping(value = "/ConfirmList.do")
	public String ConfirmList(HttpServletRequest req, ModelMap model) throws Exception {
		LoginVO loginVO = (LoginVO)req.getSession().getAttribute("loginVO");
		model.addAttribute("loginVO", loginVO);
		model.addAttribute("ConfirmIngList", boardService.GetConfirmIngList(loginVO));
		return "board/ConfirmList";
	}
	
	// 반송된 문서 리스트
	@RequestMapping(value = "/ReturnList.do")
	public String ReturnList(HttpServletRequest req, ModelMap model) throws Exception {
		LoginVO loginVO = (LoginVO)req.getSession().getAttribute("loginVO");
		model.addAttribute("loginVO", loginVO);
		model.addAttribute("ReturnList", boardService.GetReturnList(loginVO));
		return "board/ReturnList";
	}
	
	// 선택된 그룹&카테고리 게시물 리스트
	@RequestMapping(value = "/BoardList.do")
	public String BoardList(
			HttpSession session,
			@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, BoardVO vo, Model model,HttpServletRequest req) throws Exception {
		try{

			LoginVO loginVO = (LoginVO)req.getSession().getAttribute("loginVO");
			vo.setRegPerSabun(loginVO.getPerSabun());
			
			ib.cmm.LoginVO loginUser = (ib.cmm.LoginVO) session.getAttribute("userLoginInfo");
		
			vo.setDivision(loginUser.getDivision());
			vo.setSabun(loginUser.getSabun());
			if(vo.getRegMonth().equals("")) vo.setRegMonth("All");
			model.addAttribute("MaxYear", scheService.GetCalNextYear());
	
			if(vo.getCurrentPageNo() == 0) vo.setCurrentPageNo(1);			// 현재 페이지 번호
			vo.setCMD("CNT");
			//vo.setTotalRecordCount(boardService.GetBoardList(vo).size());	// 총 게시물 수
			vo.setTotalRecordCount(boardService.getBoardListTotalCount(vo));	// 총 게시물 수
			
			vo.setCMD("");
			model.addAttribute("GrpInfo", boardService.GetGrpInfo(vo));
			model.addAttribute("boardList", boardService.GetBoardList(vo));
			model.addAttribute("BoardCateList", boardService.GetBoardCateList(vo));
			model.addAttribute("vo", vo);
			model.addAttribute("message", spCmmVO.getInfoMessage());
		
			System.out.println(boardService.GetBoardList(vo));
			// PaginationInfo에 필수 정보를 넣어 준다.
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(vo.getCurrentPageNo());				// 현재 페이지 번호
			paginationInfo.setRecordCountPerPage(vo.getRecordCountPerPage());	// 페이지당 게시물수
			paginationInfo.setPageSize(vo.getPageSize());						// 블럭 수
			paginationInfo.setTotalRecordCount(vo.getTotalRecordCount());		// 총 게시물 건 수
			model.addAttribute("paginationInfo", paginationInfo);
			
			return "board/BoardList";
		
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	// 게시물 등록 메인
	@RequestMapping(value = "/BoardProcMain.do")
	public String BoardProcMain(BoardVO vo,HttpSession session, ModelMap model) throws Exception {

		ib.cmm.LoginVO loginUser = (ib.cmm.LoginVO) session.getAttribute("userLoginInfo");
		vo.setDivision(loginUser.getDivision());
		model.addAttribute("BoardCateList", boardService.GetBoardCateList(vo));
	//	LOG.info(vo);
	//	LOG.info(boardService.GetBoardCateList(vo));
		model.addAttribute("vo", vo);
		return "board/BoardProcMain";
	}
	
	// 휴가등록시 휴가기간 계산하기
	@RequestMapping(value = "/HolidayPeriod.do")
	public String test(BoardVO vo, ModelMap model) throws Exception {
//		model.addAttribute("HoliPeriod", boardService.HolidayPeriod(vo));
//		model.addAttribute("vo", vo);
//		return "sp/erp/board/HolidayPeriod";
		model.addAttribute("result", boardService.HolidayPeriod(vo));
		return "basic/result";
	}
	
	// 휴가등록 페이지
	@RequestMapping(value = "/HolidayProc.do")
	public String HolidayProc(HttpSession session,BoardVO vo, ModelMap model) throws Exception {
		if(!vo.getCMD().equals("Add")) {
			model.addAttribute("BoardInfo", boardService.GetBoardInfo(vo));
			model.addAttribute("BoardFileList", boardService.GetBoardFileList(vo));
			model.addAttribute("BoardConfirmOptPerList", boardService.GetBoardConfirmOptPerList(vo));	// 게시물 요청관련 담당자&참조인 리스트 받아오기
		}
		
		ib.cmm.LoginVO loginUser = (ib.cmm.LoginVO) session.getAttribute("userLoginInfo");
		
		Map p = new HashMap();
		p.put("divEnable", "Y");
		p.put("division",loginUser.getDivision());
		
		model.addAttribute("EmpList", formService.GetPerList(p));
		model.addAttribute("vo", vo);
		return "board/HolidayProc"; 
	}
	
	// 경조사 신청 페이지
	@RequestMapping(value = "/FamilyEventProc.do")
	public String FamilyEventProc(HttpServletRequest req, BoardVO vo, ModelMap model) throws Exception {
		LoginVO loginVO = (LoginVO)req.getSession().getAttribute("loginVO");
		BoardVO BoardInfo = new BoardVO();
		if(!vo.getCMD().equals("Add")) {
			BoardInfo	= boardService.GetBoardInfo(vo);
			model.addAttribute("BoardFileList", boardService.GetBoardFileList(vo));
			
			if(vo.getConfirmProcFlag().equals("Y")) {
				model.addAttribute("BoardConfirmOptPerList", boardService.GetBoardConfirmOptPerList(vo));	// 게시물 요청관련 담당자&참조인 리스트 받아오기
			}
		}
		else {
			BoardInfo.setWriteTitle("[" + loginVO.getPerNm() + "] 경조금 및 경조휴가 신청합니다." );
		}
		
		model.addAttribute("BoardInfo", BoardInfo);
		model.addAttribute("EmpList", formService.GetPerList());
		model.addAttribute("vo", vo);
		return "board/FamilyEventProc";
	}
	
	// 휴가 취소 페이지
	@RequestMapping(value = "/HolidayCancelProc.do")
	public String HolidayCancelProc(HttpServletRequest req,HttpSession session, BoardVO vo, ModelMap model) throws Exception {
		LoginVO loginVO = (LoginVO)req.getSession().getAttribute("loginVO");
		BoardVO BoardInfo = new BoardVO();
		if(!vo.getCMD().equals("Add")) {
			BoardInfo = boardService.GetBoardInfo(vo);
			model.addAttribute("BoardInfo", BoardInfo);
			
			model.addAttribute("BoardFileList", boardService.GetBoardFileList(vo));
			
			model.addAttribute("BoardConfirmOptPerList", boardService.GetBoardConfirmOptPerList(vo));	// 게시물 요청관련 담당자&참조인 리스트 받아오기
		}
		else BoardInfo.setWriteTitle("[" + loginVO.getPerNm() + "] 휴가계획 취소 신청 합니다." );
		model.addAttribute("BoardInfo", BoardInfo);
		ib.cmm.LoginVO loginUser = (ib.cmm.LoginVO) session.getAttribute("userLoginInfo");
		
		Map p = new HashMap();
		p.put("divEnable", "Y");
		p.put("division",loginUser.getDivision());
		
		model.addAttribute("EmpList", formService.GetPerList(p));
		
		model.addAttribute("HoliList", boardService.GetHoliList(vo));
		model.addAttribute("vo", vo);
		return "board/HolidayCancelProc";
	}
	
	// 게시물 등록/수정 페이지
	@RequestMapping(value = "/BoardProc.do")
	public String BoardProc(HttpServletRequest req,HttpSession session, BoardVO vo, ModelMap model) throws Exception {
		if(!vo.getCMD().equals("Add")) {
			
			BoardVO BoardInfo	= boardService.GetBoardInfo(vo);
			model.addAttribute("BoardInfo", BoardInfo);
			
			model.addAttribute("BoardFileList", boardService.GetBoardFileList(vo));
			if(vo.getConfirmProcFlag().equals("Y")) model.addAttribute("BoardConfirmOptPerList", boardService.GetBoardConfirmOptPerList(vo));	// 게시물 요청관련 담당자&참조인 리스트 받아오기
		}
		else {
			String reqURL = req.getRequestURL().toString().replace("BoardProc", "BoardView");	// 게시물 URL 정보
			model.addAttribute("reqURL", reqURL);
		}
		ib.cmm.LoginVO loginUser = (ib.cmm.LoginVO) session.getAttribute("userLoginInfo");
		
		Map p = new HashMap();
		p.put("divEnable", "Y");
		p.put("division",loginUser.getDivision());
		
		if(vo.getConfirmProcFlag().equals("Y")) model.addAttribute("EmpList", formService.GetPerList(p));
		model.addAttribute("SMSSeq", cusService.GetSMSSeq());
		model.addAttribute("vo", vo);
		return "board/BoardProc";
	}
	

	
	// 게시물 등록/수정/삭제 완료
	@RequestMapping(value = "/BoardProcEnd.do")
	public String BoardProcEnd(@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, HttpServletRequest req, BoardVO vo, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
		beanValidator.validate(vo, bindingResult);

		if(bindingResult.hasErrors()) {
			model.addAttribute("vo", vo);
			model.addAttribute("message", "등록 실패 하였습니다.");
			return "board/BoardProc";
		}
		boardService.BoardProcEnd(req, vo);
		
		model.addAttribute("message", spCmmVO.getInfoMessage());
		status.setComplete();
		if(vo.getPopFlag().equals("Pop")) return "forward:/ReturnList.do";
		else return "forward:/BoardList.do";
	}
	
	// 게시물 보고완료 처리
	@RequestMapping(value = "/BoardWriteEnd.do")
	public String BoardWriteEnd(BoardVO vo, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
		beanValidator.validate(vo, bindingResult);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("vo", vo);
			model.addAttribute("message", "완료처리 실패 하였습니다.");
			return "board/BoardView";
		}
		boardService.BoardWriteEnd(vo);
		status.setComplete();
		return "forward:/BoardView.do";
	}
	
	// 보고서 승인/반송 처리 완료
	@RequestMapping(value = "/BoardConfirmEnd.do")
	public String BoardConfirmEnd(BoardVO vo, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
		beanValidator.validate(vo, bindingResult);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("vo", vo);
			model.addAttribute("message", "완료처리 실패 하였습니다.");
			return "board/BoardView";
		}
		boardService.BoardConfirmEnd(vo);
		status.setComplete();
		return "forward:/BoardView.do";
	}
	
	// 게시물 상세보기
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/BoardView.do")
	public String BoardView(@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, HttpServletRequest req, BoardVO vo, ModelMap model) throws Exception {
		String QueryStr = req.getQueryString();
		if(QueryStr != null && !QueryStr.split("/")[0].split("=")[0].equals("GrpCd")) return "forward:/SynergyErp.do";		// URL 접근
		else {
			LoginVO loginVO = (LoginVO)req.getSession().getAttribute("loginVO");
			vo.setPerSabun(loginVO.getPerSabun());
			vo.setRegPerSabun(loginVO.getPerSabun());
			
		}
		StringBuffer reqURL = req.getRequestURL();					// 게시물 URL 정보
		model.addAttribute("reqURL", reqURL);
		
		BoardVO BoardInfo	= boardService.GetBoardInfo(vo);		// 게시물 정보
		model.addAttribute("BoardInfo", BoardInfo);
		
		if(BoardInfo.getConfirmProcFlag().equals("Y") && !BoardInfo.getConfirmPerSabun().equals("")) {
			model.addAttribute("BoardConfirmOptPerList", boardService.GetBoardConfirmOptPerList(vo));	// 게시물 요청관련 담당자&참조인 리스트 받아오기
		}	
		model.addAttribute("BoardFileList", boardService.GetBoardFileList(vo));	// 게시물 파일
		
		// 이미지를 포함하고 있으면
		if(BoardInfo.getWriteCon().indexOf("/SynergyCus/DATA/ImgView") > 0) {
			int len = BoardInfo.getWriteCon().split("<img").length;
			String tmp;
			for(int a = 0; a < len; a++) {
				tmp = BoardInfo.getWriteCon().split("<img")[a];
				System.out.println("1111==="+tmp);
				if(tmp.indexOf("/SynergyCus/DATA/ImgView/") > 0) {
					tmp = tmp.split("/")[4].split("\"")[0];
					System.out.println("22222==="+tmp);
					Utill.FileCopy("F:/SynergyCus/DATA/ImgView/", req.getSession().getServletContext().getRealPath("/")+"/DATA/ImgView/", tmp);
				}
			}
		}
		
		boardService.BoardReadAddEnd(vo);													// 조회 로그 등록
		boardService.BoardHitEditEnd(vo);													// 조회수 업데이트
		
		vo.setReplyCd(boardService.GetReplyCd(vo));											// 댓글 순번
		List<Map<String, Object>> ReplyList = boardService.GetReplyList(vo);				// 댓글 리스트
		model.addAttribute("ReplyList", ReplyList);
		
		if(ReplyList.size() > 0) {															// 댓글 로그 등록
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			for(int oOo = 0; oOo < ReplyList.size(); oOo++) {
				Map<String, Object> paramTemp = new HashMap<String, Object>();
				paramTemp.put("GrpCd", ReplyList.get(oOo).get("grpcd"));
				paramTemp.put("CateCd", ReplyList.get(oOo).get("catecd"));
				paramTemp.put("WriteCd", ReplyList.get(oOo).get("writecd"));
				paramTemp.put("ReplyCd", ReplyList.get(oOo).get("replycd"));
				paramTemp.put("PerSabun", vo.getRegPerSabun());
				list.add(paramTemp);
			}
			if(list.size() > 0) boardService.ReplyReadAddEnd(list);
		}
		model.addAttribute("ReplyFileList", boardService.GetReplyFileList(vo));	// 댓글 파일
		
		model.addAttribute("vo", vo);
		model.addAttribute("message", spCmmVO.getInfoMessage());
		if(BoardInfo.getHoliDocFlag().equals("Y")) return "board/HolidayView";
		else if(BoardInfo.getHoliDocFlag().equals("F")) return "board/FamilyEventView";
		else if(BoardInfo.getHoliDocFlag().equals("C")) return "board/HolidayCancelView";
		else return "board/BoardView";
	}
	
	// 게시물 파일 삭제 완료
	@RequestMapping(value = "/BoardFileDelEnd.do")
	public String BoardFileDelEnd(BoardVO vo, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
		beanValidator.validate(vo, bindingResult);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("vo", vo);
			model.addAttribute("message", "삭제 실패 하였습니다.");
			return "board/BoardProc";
		}
		boardService.BoardFileDelEnd(vo);
		status.setComplete();
		if(vo.getHoliDocFlag().equals("F")) return "forward:/FamilyEventProc.do";
		else return "forward:/BoardProc.do";
	}
	
	// 조회로그 리스트 불러오기
	@RequestMapping(value = "/BoardReadLogList.do")
	public String BoardReadLogList(@ModelAttribute("spCmmVO") SpCmmVO spCmmVO, BoardVO vo, Model model) throws Exception {
		model.addAttribute("BoardReadLogList", boardService.GetBoardReadLogList(vo));
		return "board/BoardReadLogList";
	}
	
	// 게시물 이동 요청 페이지
	@RequestMapping(value = "/BoardMove.do")
	public String BoardMove(BoardVO vo, Model model) throws Exception {
		model.addAttribute("BoardCateList", boardService.GetBoardCateList(vo));
		model.addAttribute("BoardInfo", boardService.GetBoardInfo(vo));	// 게시물 정보
		model.addAttribute("vo", vo);
		return "board/BoardMove";
	}
	
	// 게시물 이동 완료
	@RequestMapping(value = "/BoardMoveEnd.do")
	public String BoardMoveEnd(BoardVO vo, Model model) throws Exception {
		boardService.BoardMoveEnd(vo);
		model.addAttribute("vo", vo);
		return "forward:/BoardList.do";
	}
	/** 게시물 **/
	
	/** 댓글 **/
	// 댓글 등록/수정/삭제 완료
	@RequestMapping(value = "/ReplyProcEnd.do")
	public String ReplyProcEnd(HttpServletRequest req, BoardVO vo, BindingResult bindingResult, Model model, SessionStatus status) throws Exception {
		beanValidator.validate(vo, bindingResult);

		if(bindingResult.hasErrors()) {
			model.addAttribute("vo", vo);
			model.addAttribute("message", "등록 실패 하였습니다.");
			return "board/BoardView";
		}
		
		boardService.ReplyProcEnd(req, vo);
		status.setComplete();
		return "forward:/BoardView.do";
	}
	/** 댓글 **/
}