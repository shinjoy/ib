package ib.control.web;

import ib.basic.web.SCflag;
import ib.cmm.FileUpDbVO;
import ib.cmm.IBsMessageSource;
import ib.cmm.LoginVO;
import ib.cmm.service.CommonService;
import ib.cmm.util.fcc.service.StringUtil;
import ib.login.service.StaffVO;
import ib.person.service.PersonVO;
import ib.person.service.impl.PersonDAO;
import ib.work.service.WorkVO;
import ib.work.service.impl.WorkDAO;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;



import com.google.gson.Gson;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 
 * @author  : ChanWoo Lee
 * @since   : 2013. 11. 21.
 * @version : 1.0.0
 *
 * <pre>
 * package  : ib.control.web
 * filename : ControlController.java
 * </pre>
 */
@Controller
public class ControlController {
	/** MessageSource */
    @Resource(name="IBsMessageSource")
    IBsMessageSource MessageSource;

    @Resource(name = "personDAO")
    private PersonDAO personDAO;   
    
    @Resource(name = "workDAO")
    private WorkDAO workDAO;
    
    @Resource(name = "commonService")
    private CommonService commonService;
    
    
    
	/** log */
    protected static final Log LOG = LogFactory.getLog(ControlController.class);

    
	/**
	 * 사용자 관리
	 * @MethodName : selectMainLogo
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/control/userControl.do")
	public String selectMainLogo(ModelMap model
								,StaffVO psnVo
								,HttpSession session) throws Exception{
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		
		
		//------- PASS 사용자 정보 :S -----------------------------------------
		
		List<Map> passUserList = null;
		try{
			
			//Spring Rest Template.....
		    RestTemplate restTemplate = new RestTemplate();
		
		    //Ib System 의 api url
		    String url = "http://synergy.passerp.co.kr/rest/api.do";
		    //String url = "http://172.16.0.51:8090/rest/api.do";
		
		    
		    //등용문에서 요청 정보를 넘기기 위한 맵...
		    Map<String,Object> reqMap = new HashMap<String,Object>();
		   
		    reqMap.put("apiKey", "REQ_PASS_SYNERGY_USER_STATUS");
		    
		    HttpHeaders headers = new HttpHeaders();
		    headers.setContentType(MediaType.APPLICATION_JSON);
		
		    HttpEntity<Map<String, Object>> entity = new HttpEntity<Map<String, Object>>(reqMap, headers);
		
		
		    //호출 ...리턴 제이슨을 스트링으로 받는다.
		    Map returnMap = restTemplate.postForObject(url, entity, Map.class);				//사용자 정보를 받아온다
		
		    String userListStr = returnMap.get("passSynergyUserStatusList").toString();			
			/*
				LOGIN_ID		AS loginId
				NAME			AS name
				USER_STATUS		AS userStatus
			*/
		    Gson gson = new Gson();
			
			passUserList =  gson.fromJson(userListStr, java.util.ArrayList.class);


		}catch(Exception e){
			e.printStackTrace();
			
			passUserList = new ArrayList<Map>();
			
		}finally{
			LOG.debug("############################ size ################################:::" + passUserList.size());
			
		}
		
		//------- PASS 사용자 정보 :E -----------------------------------------
		
		try{
		//---------- 사용자 정보 :S ---------------------
		List<StaffVO> rst = personDAO.selectStaff(psnVo);					//사용자정보
		model.addAttribute("staffList", rst);
		
		
		
		//사용자 상태정보 추가
		Map userStatus = new HashMap<String,String>();
		for(int i=0; i<passUserList.size(); i++){			
			userStatus.put(passUserList.get(i).get("loginId"), passUserList.get(i).get("userStatus"));		// {LOGIN_ID:USER_STATUS}			
		}
		LOG.debug("#############DDD############:::" + passUserList.size() + userStatus.get("oys"));
		for(int i=0; i<rst.size(); i++){			
			rst.get(i).setUserStatus(StringUtil.isNullToString(userStatus.get(rst.get(i).getUsrId())));		//사용자 상태 추가
		}
		
		//---------- 사용자 정보 :E ---------------------
		
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		
		
		List<Map> companyList = commonService.getCompanyList(null);			//회사
		model.addAttribute("companyList", companyList);
		
		List<Map> list = commonService.getDeptList(null);					//부서
		model.addAttribute("deptList", list);
		
		List<Map> positionList = commonService.getPositionList(null);		//직급
		model.addAttribute("positionList", positionList);
		
		List<Map> divLst = commonService.getSelectDivisionList(null);
		model.addAttribute("divList", divLst);
		
		
		return "control/userControl";
	}
	
	
	/**
	 * requestmon
	 * @MethodName : requestmon
	 * @param model
	 * @param psnVo
	 * @param session
	 * @return
	 * @throws Exception
	 * @author : user
	 * @since : 2015. 1. 20.
	 */
	@RequestMapping(value="/control/requestmon.do")
	public String requestmon(ModelMap model
			,HttpSession session) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		return "control/requestmon";
	}
	
	/**
	 * 직원 로그인 암호 초기화
	 * @MethodName : reSetPw
	 * @param model
	 * @param psnVo
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/control/reSetPw.do")
	public String reSetPw(ModelMap model
			,StaffVO psnVo
			,HttpSession session) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		psnVo.setRgId(loginUser.getId());
		psnVo.setUsrPw("cRDtpNCeBiql5KOQsKVyrA0sAiA=");
		personDAO.modifyPassword(psnVo);
		
	return "control/userControl";
}
	/**
	 * 직원 퇴사처리
	 * @MethodName : setResign
	 * @param model
	 * @param psnVo
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/control/setResign.do")
	public String setResign(ModelMap model
			,StaffVO psnVo
			,HttpSession session) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		psnVo.setRgId(loginUser.getId());
		psnVo.setSrtCd("10000");
		psnVo.setUsrPw("xlPfQrXSpZvoVK8K6erw7rRV/BA=");
		personDAO.modifyPassword(psnVo);
		
		return "control/userControl";
	}

	/**
	 * 관리페이지 직원정보 수정
	 * @MethodName : saveStaffInfo
	 * @param model
	 * @param psnVo
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/control/modifyStaffInfo.do")
	public String saveStaffInfo(ModelMap model
			,StaffVO stVo
			,HttpSession session) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		stVo.setRgId(loginUser.getId());
		personDAO.updateStaffInformation(stVo);
		
		System.out.println(stVo.getMezzN()+"###"+stVo.getAnalYn());
		if(!stVo.getAnalYn().equals("") || !stVo.getMezzL().equals("") || !stVo.getMezzN().equals(""))
		personDAO.updateUserProfile(stVo);
		
		
	return "control/userControl";
}
	
	/**
	 * 이름으로 인사이드 사번, 주소, 핸드폰, 이메일 update
	 * @MethodName : updateIBstaffwithInside
	 * @param model
	 * @param stVo
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/control/updateIBstaffwithInside.do")
	public String updateIBstaffwithInside(ModelMap model
			,StaffVO stVo
			,HttpSession session) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		stVo.setRgId(loginUser.getId());
		personDAO.updateIBstaffwithInside(stVo);
		
		return "control/userControl";
}
	/**
	 * 직원추가
	 * @MethodName : insertStaff
	 * @param model
	 * @param stVo
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/control/insertStaff.do")
	public String insertStaff(ModelMap model
			,StaffVO stVo
			,HttpSession session) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		stVo.setRgId(loginUser.getId());
		stVo.setUsrPw("cRDtpNCeBiql5KOQsKVyrA0sAiA=");
		
		PersonVO psnVo = new PersonVO();
		psnVo.setRgId(loginUser.getId());
		psnVo.setCstNm(stVo.getUsrNm());
		psnVo.setPhn1(stVo.getPhn1());
		psnVo.setPosition(stVo.getPosition());
		
		if("1".equals(stVo.getOffice())){//투자자문
			psnVo.setCpnId("68");
		}else if("2".equals(stVo.getOffice())){//파트너스
			psnVo.setCpnId("67");
		}else if("3".equals(stVo.getOffice())){//IB투자
			psnVo.setCpnId("950548");
		}else if("4".equals(stVo.getOffice())){//벤처투자
			psnVo.setCpnId("951044");
		}
		
		try{
			personDAO.insertStaff(stVo);
			
			if(personDAO.selectSearchDuplicateB4excelInsert(psnVo) == 0){
				personDAO.insertCustomer(psnVo);
				
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		return "redirect:/control/userControl.do";
	}

	
	/**
	 * log 페이지
	 * @MethodName : selectLog
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/control/mainLog.do")
	public String selectLog(ModelMap model
			,HttpSession session) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		//LOG.info(loginUser.getId());
		
		StaffVO psnVo = new StaffVO();
		List<StaffVO> rst = personDAO.selectStaff(psnVo);
		model.addAttribute("staffList",rst);
		
		BufferedReader br = null;
		File FF = null;
		
		String folderPath ="D:/LOG/IBsystem/";
		
		//os가 리눅스면 D:를 제거한다
		if(System.getProperty("os.name").toUpperCase().indexOf("WINDOWS") < 0)
        {
			if(folderPath.indexOf("D:")>=0){
				folderPath = "/home/synergy"+folderPath.split("D:")[1];
			}
        }
		
		
		FF = new File(folderPath+"log.log");
		if(SCflag.IS_SERVER){
			br = new BufferedReader(new InputStreamReader(new FileInputStream(FF),"euc-kr"));
		}else{
			br = new BufferedReader(new InputStreamReader(new FileInputStream(FF),"utf-8"));
		}
		String line = null;
		String [] strSpl = null;
		WorkVO fVO = new WorkVO();
		List<WorkVO> list = new ArrayList<WorkVO>();
		try{
			while((line=br.readLine())!=null){
				fVO = new WorkVO();
				strSpl = line.split("\\^_\\^");
				if(strSpl.length<2) {//쿼리 에러 여러줄로 나오는거 출력
					fVO.setTmpNum1(strSpl[0]);
					list.add(fVO);
					continue;
				}
				fVO.setTmDt(strSpl[0]);
				fVO.setTitle(strSpl[1]);
				fVO.setTmpId(strSpl[2]);
				if(strSpl.length>3) fVO.setRgId(strSpl[3]);
				if(strSpl.length>4) {
					fVO.setTmpNum1(strSpl[4]);
					String arr[] = strSpl[4].split("\\.");
					if(arr.length>1){
						if(arr[1].contains("insert")) fVO.setTmpNum2("slateblue");
						else if(arr[1].contains("update")) fVO.setTmpNum2("peru");
						else if(arr[1].contains("delete")) fVO.setTmpNum2("mediumvioletred");
						else fVO.setTmpNum2("green");
					}else fVO.setTmpNum2("green");
				}
				if(strSpl.length>5) fVO.setsNb(strSpl[5]);
				list.add(fVO);				
			}
			model.addAttribute("fileList",list);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}finally{
			psnVo = null;
			rst = null;
			FF.deleteOnExit();
			fVO = null;
			list = null;
			strSpl = null;
		}
		return "control/MainLog";
	}
	/**
	 * 로그 그래프
	 * @MethodName : selectLogGraph
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked", "resource" })
	@RequestMapping(value="/control/mainLogGraph.do")
	public String selectLogGraph(ModelMap model
			,HttpSession session) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		//LOG.info(loginUser.getId());
		
		// StaffVO psnVo = new StaffVO();
		// List<StaffVO> rst = personDAO.selectStaff(psnVo);
		// model.addAttribute("staffList",rst);
		
		BufferedReader br;
		if(SCflag.IS_SERVER){
			
			String folderPath ="D:/LOG/IBsystem/";
			
			//os가 리눅스면 D:를 제거한다
			if(System.getProperty("os.name").toUpperCase().indexOf("WINDOWS") < 0)
	        {
				if(folderPath.indexOf("D:")>=0){
					folderPath = "/home/synergy"+folderPath.split("D:")[1];
				}
	        }
			
			
			File FF = new File(folderPath+"log.log");
			br = new BufferedReader(new InputStreamReader(new FileInputStream(FF),"euc-kr"));
		}else{
			
			String folderPath ="E:/LOG/IBsystem/";
			
			//os가 리눅스면 D:를 제거한다
			if(System.getProperty("os.name").toUpperCase().indexOf("WINDOWS") < 0)
	        {
				if(folderPath.indexOf("D:")>=0){
					folderPath = "/home/synergy"+folderPath.split("D:")[1];
				}
	        }
			File FF = new File(folderPath+"log.log");
			br = new BufferedReader(new InputStreamReader(new FileInputStream(FF),"utf-8"));
		}
		String line = null;
		String [] strSpl;
		Map<String, Integer> map = new HashMap<String, Integer>();
		Map<String, String> mapD = new HashMap<String, String>();
		Map<String, String> mapTsave = new HashMap<String, String>();
		Map<String, String> mapT = new HashMap<String, String>();;
		Map<String,Object> curMap = null;
		List<Map> listO = new ArrayList<Map>();
		List<Map> listT = new ArrayList<Map>();
		List<Map> listD = new ArrayList<Map>();
		String date = "",contrl = "";
		int count = 0,endLine = 0,intI = 0;
		try{
			while((line=br.readLine())!=null || endLine ==0){
				
				String day = "", contName = "";
				
				if(line==null){ 
					endLine ++;
				}else{
					strSpl = line.split("\\^_\\^");
					//[0] 년월일시분초, [1] id, [2] 컨트롤러명, [3] 메소드명, [4] dao명 or 정보
					if(strSpl[0].length()<10) continue;
					day = strSpl[0].substring(0,10);
					if(strSpl.length<2)continue;
					contName = strSpl[2].split("Controller")[0];
				}
				//System.out.println(":::date["+date+"] day["+day+"]:::"+contName+"::");
				if(date.equals(day)){
					if(map.containsKey(contName)) {
						count = map.get(contName);
						map.remove(contName);
						map.put(contName, 1+count );
					}else{
						map.put(contName, 1 );
						mapT.put("title", contName );
						// System.out.println(":::new title["+contName+"] map["+mapT+"]:::"+contName+"::");
						if(!mapTsave.containsValue(contName)){
							mapTsave.put(String.valueOf(intI++),contName);
							listT.add(mapT);
							mapT = new HashMap<String, String>();
						}
					}
				}else if("".equals(date)){
					date = day;
					mapD.put("day", day);
					listD.add(mapD);
					mapD = new HashMap<String, String>();
				}else{
					// System.out.println(":::listT.isEmpty()"+listT+" :::::");
					// System.out.println(":::map"+map+" :::::\n\n");
					
					for(int i=0,len=listT.size();i<len;i++){
						curMap = listT.get(i);
						Object T = curMap.get("title");
						Object ccnt = null;
						
						if(map.containsKey(T)){
							
							for(int j=0,lenJ=listD.size();j<lenJ;j++){
								
								if(null!=curMap.get("count")) {
									ccnt = curMap.get("count");
									String[] tmp = String.valueOf(ccnt).split(",");
									j=tmp.length;
								}
								
								if(date.equals((String)listD.get(j).get("day")) ){
									if(ccnt == null){
										curMap.put("count",map.get(T));
									}else{
										curMap.put("count",ccnt+","+map.get(T) );
									}
								}else{
									if(ccnt == null){
										curMap.put("count","0");
									}else{
										curMap.put("count",ccnt+",0");
									}
								}
								// System.out.println("::"+curMap.get("count")+":::["+curMap.get("title")+"]::day["+date+"]:::"+(String)listD.get(j).get("day")+"::");
							}
						}
					}
					map = new HashMap<String, Integer>();
					count = 0;
					date = day;
					mapD.put("day", day);
					listD.add(mapD);
					mapD = new HashMap<String, String>();
				}
			}
			model.addAttribute("day",listD);
			model.addAttribute("title",listT);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "control/MainLogGraph";
	}
	/**
	 * 자료실?
	 * @MethodName : selectFile
	 * @param model
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/control/mainFile.do")
	public String selectFile(ModelMap model
		,HttpSession session
		,FileUpDbVO vo) throws Exception {

		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		
		int totCnt = 0;
		model.addAttribute("searchName", vo.getRealName());
		List<FileUpDbVO> result = null;
	    PaginationInfo paginationInfo = new PaginationInfo();
	  
	    paginationInfo.setCurrentPageNo(vo.getPageIndex());		//현재 페이지 번호
	    paginationInfo.setRecordCountPerPage(15);				//한 페이지에 게시되는 게시물 건수
	    paginationInfo.setPageSize(10);							//페이징 리스트의 사이즈
	
	    int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		int recordCountPerPage = paginationInfo.getRecordCountPerPage();
		vo.setFirstIndex(firstRecordIndex);
		vo.setRecordCountPerPage(recordCountPerPage);
	
		vo.setFileCategory("00000");	//00000:정보정리, 00001: staff사진 ,  00002: 댓글 첨부파일, 00003: 인사관리->이력서파일
		try{
			result = workDAO.selectFileInfoList(vo);
			totCnt = workDAO.selectFileInfoListCnt(vo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		paginationInfo.setTotalRecordCount(totCnt); 			//전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		
	    model.addAttribute("fileList", result);
	    model.addAttribute("message", MessageSource.getMessage("success.common.select"));
	    
		return "control/MainFile";
	}
	/**
	 * 자료 페이지에서 업로드한 파일 삭제
	 * @MethodName : deleteFileInfo
	 * @param model
	 * @param session
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/control/deleteFileInfo.do")
	public String deleteFileInfo(ModelMap model
			,HttpSession session
			,FileUpDbVO vo) throws Exception {
		
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		try{
			workDAO.deleteFileInfo(vo);
			LOG.debug(loginUser.getId()+"^_^workDAO.deleteFileInfo");
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "control/MainFile";
	}


}