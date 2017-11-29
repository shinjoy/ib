package ib.personnel.web;

import ib.basic.web.Base64Coder;
import ib.basic.web.MultiFileUpload;
import ib.basic.web.Util;
import ib.cmm.FileUpDbVO;
import ib.cmm.LoginVO;
import ib.cmm.service.CmmUseService;
import ib.login.service.StaffVO;
import ib.personnel.service.ManagementVO;
import ib.personnel.service.impl.ManagementDAO;
import ib.recommend.service.RecommendVO;
import ib.recommend.service.impl.RecommendDAO;
import ib.work.service.WorkService;
import ib.work.service.WorkVO;
import ib.work.service.impl.WorkDAO;
import ib.work.web.WorkController;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 12. 06.
 * @filename : ManagementController.java
 * @version : 1.0.0
 * @see
 *
 * <pre>
 * package  : ib.personnel.web
 * </pre>
 */
@Controller
public class ManagementController {

	/** CmmUseService */
	@Resource(name="CmmUseService")
	private CmmUseService cmm;
      
    @Resource(name = "managementDAO")
    private ManagementDAO managementDAO;  
    
    @Resource(name = "workService")
    private WorkService workService;
    
    @Resource(name = "workDAO")
    private WorkDAO workDAO;
    
    @Resource(name = "recommendDAO")
    private RecommendDAO recommendDAO;  
    
    /** log */
    protected static final Log LOG = LogFactory.getLog(ManagementController.class);
    
    private static final String _cipherAlgorithm = "DES";
    /**
     *
     * @MethodName : encryptText
     * @param text
     * @param key
     * @return
     */
    String encryptText(String text, String key)
    {
    	String encrypted;

    	try{
    		SecretKeySpec ks = new SecretKeySpec(generateKey(key), _cipherAlgorithm);
    		Cipher cipher = Cipher.getInstance(_cipherAlgorithm);
    		cipher.init(Cipher.ENCRYPT_MODE, ks);
    		byte[] encryptedBytes = cipher.doFinal(text.getBytes());
    		encrypted = new String(Base64Coder.encode(encryptedBytes));
    	}
    	catch (Exception e){
    		LOG.error(e);
    		e.printStackTrace();
    		encrypted = text;
    	}

    	return encrypted;
    }
    /**
     *
     * @MethodName : decryptText
     * @param text
     * @param key
     * @return
     */
    String decryptText(String text, String key)
    {
    	String decrypted;

    	try{
    		SecretKeySpec ks = new SecretKeySpec(generateKey(key), _cipherAlgorithm);
    		Cipher cipher = Cipher.getInstance(_cipherAlgorithm);
    		cipher.init(Cipher.DECRYPT_MODE, ks);
    		byte[] decryptedBytes = cipher.doFinal(Base64Coder.decode(text));
    		decrypted = new String(decryptedBytes);
    	}
    	catch (Exception e){
    		LOG.error(e);
    		decrypted = text;
    	}

    	return decrypted;
    }
    /**
     *
     * @MethodName : generateKey
     * @param key
     * @return
     */
    byte[] generateKey(String key)
    {
    	byte[] desKey = new byte[8];
    	byte[] bkey = key.getBytes();

    	if (bkey.length < desKey.length)
    	{
    		System.arraycopy(bkey, 0, desKey, 0, bkey.length);

    		for (int i = bkey.length; i < desKey.length; i++)
    			desKey[i] = 0;
    	}
    	else
    		System.arraycopy(bkey, 0, desKey, 0, desKey.length);

    	return desKey;
    }


    /**
     *
     * @MethodName : fileCopy
     * @param srcFolder 파일이 위치한 폴더
     * @param targetFolder 복사할 폴더
     * @param fileName 파일 이름
     */
    public static void fileCopy(String srcFolder, String targetFolder, String fileName) throws Exception{
    	String inFileName = srcFolder+"\\"+fileName;
    	String outFileName = targetFolder+"\\"+fileName;
    	
    	File f = new File(targetFolder);
	    f.mkdirs();//파일 저장될 폴더 생성
    	
    	//System.out.println("\n\n"+inFileName+"\n\n"+outFileName+"\n\n\n\n\n");
    	try {
    		FileInputStream fis = new FileInputStream(inFileName);
    		FileOutputStream fos = new FileOutputStream(outFileName);

    		int data = 0;

    		while((data=fis.read())!=-1) {
    			fos.write(data);
    		}

    		fis.close();
    		fos.close();
    	} catch (Exception e) {
    		LOG.error(e);
    		e.printStackTrace();
    	}
    }
    
	/**
	 *
	 * @MethodName : selectWork
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/personnel/management/selectLeft.do")
	public String selectWork(
            ModelMap model) throws Exception{
		
		/*StaffVO staffVO = new StaffVO();
		
		try {
			model.addAttribute("userList", cmm.UserList(staffVO));
		} catch (Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}*/
		//System.out.println("===========selectLeft==============");
    	return "personnel/management/PMleft";
    }
	
	/**
	 * 인사관리 기본화면
	 * @MethodName : index
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/personnel/management/index.do")
	public String index( ManagementVO vo,
			HttpServletRequest request,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		
		if((Integer.parseInt(loginUser.getPermission())<5) & (vo.getUsrId().length()>1)) return "basic/Content";
		if(vo.getUsrId()==null | "".equals(vo.getUsrId()))vo.setUsrId(loginUser.getId());
		
		model.addAttribute("cmmCdFamily", cmm.CommonCdList("00012"));
		
		List<ManagementVO> result = null
						, result1 = null
						, result2 = null
						, result3 = null
						, result4 = null
						, result5 = null
						, result6 = null
						, result7 = null
						, result8 = null
						, result9 = null
						, result10 = null
						, result11 = null
						, result12 = null
						, result13 = null
						, result14 = null
						;
		List<RecommendVO> opinion = null;
		String staffSNB = "";
		FileUpDbVO Filevo = new FileUpDbVO();
		List<FileUpDbVO> imgFile = null
						, imgFile1 = null;
		RecommendVO rcmdVO = new RecommendVO();
		
		try{
			result = managementDAO.selectStaffList(vo); //인사관리 기본정보
			staffSNB = result.get(0).getsNb();
			vo.setStaffSNb(staffSNB);
			rcmdVO.setCategoryCd("00002");
			rcmdVO.setsNb(staffSNB);
			
			Filevo.setSubCd(staffSNB);
			Filevo.setFileCategory("00001");//00000:정보정리, 00001: staff사진 ,  00002: 댓글 첨부파일, 00003: 인사관리->이력서파일
			Filevo.setRecordCountPerPage(0);
			imgFile = workDAO.selectFileInfo(Filevo);//첨부사진
			
			Filevo.setSubCd(null);
			Filevo.setOfferSnb(staffSNB);
			Filevo.setFileCategory("00003");//00000:정보정리, 00001: staff사진 ,  00002: 댓글 첨부파일, 00003: 인사관리->이력서파일
			imgFile1 = workDAO.selectFileInfo(Filevo);//이력서
			
			result1 = managementDAO.selectPmFamily(vo); //가족사항
			result2 = managementDAO.selectPmAcademic(vo); //학력사항
			result3 = managementDAO.selectPmCareer(vo); //경력사항
			result4 = managementDAO.selectPmLicense(vo); //자격증
			opinion = recommendDAO.selectOpinionList(rcmdVO);
			result5 = managementDAO.selectPmInsideCareer(vo); //경력
			result6 = managementDAO.selectPmJustice(vo); //상벌
			result7 = managementDAO.selectPmSalary(vo); //급여
			result8 = managementDAO.selectPmAssessment(vo); //고과
			result9 = managementDAO.selectPmStock(vo); //고과
			result14 = managementDAO.selectPmStockGet(vo); //고과
			
			vo.setDivision("1");
			result10 = managementDAO.selectPmProposal(vo); //애로,희망,긴급,건의사항
			vo.setDivision("2");
			result11 = managementDAO.selectPmProposal(vo); //애로,희망,긴급,건의사항
			vo.setDivision("3");
			result12 = managementDAO.selectPmProposal(vo); //애로,희망,긴급,건의사항
			vo.setDivision("4");
			result13 = managementDAO.selectPmProposal(vo); //애로,희망,긴급,건의사항
/*
			result1 = managementDAO.selectPmStockOption(vo); //스톡옵션
			result1 = managementDAO.selectPmHope(vo); //희망사항
			result1 = managementDAO.selectPmMust(vo); //긴급사항
			result1 = managementDAO.selectPmSuggest(vo); //건의사항
/**/
			if(!imgFile.isEmpty()){
			/*System.out.println("===========================================================\n"
					+request.getRealPath("/data/")+"\n"+imgFile.get(0).getPath()+"\n"+imgFile.get(0).getRealName()
					+"\n===========================================================\n");*/
				fileCopy(imgFile.get(0).getPath(), request.getRealPath("/data/"), imgFile.get(0).getMakeName());
				model.addAttribute("realNm", imgFile.get(0).getRealName());
				model.addAttribute("makeNm", imgFile.get(0).getMakeName());
			}
			/*if(!imgFile1.isEmpty()){
				fileCopy(imgFile1.get(0).getPath(), request.getRealPath("/data/"), imgFile1.get(0).getMakeName());
				model.addAttribute("CVrealNm", imgFile1.get(0).getRealName());
				model.addAttribute("CVmakeNm", imgFile1.get(0).getMakeName());
			}*/
		} catch(Exception e) {
			LOG.error(e);
			e.printStackTrace();
		}
		
		model.addAttribute("staffInfo", 	result);
		model.addAttribute("family", 		result1);
		model.addAttribute("academic", 		result2);
		model.addAttribute("career", 		result3);
		model.addAttribute("license", 		result4);
		model.addAttribute("opinionList", 	opinion);
		model.addAttribute("insideCareer", 	result5);
		model.addAttribute("justice", 		result6);
		model.addAttribute("salary", 		result7);
		model.addAttribute("assessment", 	result8);
		model.addAttribute("stock", 		result9);
		model.addAttribute("stockGet", 		result14);
		model.addAttribute("proposal1", 		result10);
		model.addAttribute("proposal2", 		result11);
		model.addAttribute("proposal3", 		result12);
		model.addAttribute("proposal4", 		result13);
		model.addAttribute("staffSNb", staffSNB);
		model.addAttribute("selectStaffId", vo.getUsrId());
		model.addAttribute("CVlist", imgFile1);
		
    	return "personnel/management/PMmain";
    }
	
	/**
	 * 기본정보 수정
	 * @MethodName : basicInfoProcess
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/management/basicInfoProcess.do")
	public String basicInfoProcess(
			HttpServletRequest request,
			@ModelAttribute("managementVO") ManagementVO vo,
			HttpSession session,
			ModelMap model) throws Exception{
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setUsrId(loginUser.getId());
		int cnt = 0;
		
		if("".equals(vo.getMarriedDt())) vo.setMarriedDt(null);
		
		try{
			cnt = managementDAO.updateStaffInfo(vo);
			LOG.debug(loginUser.getId()+"^_^managementDAO.updateStaffInfo^_^"+vo.getsNb());
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		model.addAttribute("saveCnt", cnt);
//		return "redirect:/personnel/management/Process.do";
		return "personnel/management/PMmain";
	}

	/**
	 * 인사관리 증명사진
	 * @MethodName : basicInfoImg
	 * @param request
	 * @param vo
	 * @param session
	 * @param model
	 * @return 
	 */
	@RequestMapping(value="/personnel/management/basicInfoImg.do")
	public String basicInfoImg(
			HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("managementVO") ManagementVO vo,
			HttpSession session,
			ModelMap model){
		//if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setUsrId(loginUser.getId());
		
		List<FileUpDbVO> fileslist = new ArrayList<FileUpDbVO>();
		
		int cnt = 0;
		String snb = "";
		String fileCate = "00001"; //00000:정보정리, 00001: staff사진 ,  00002: 댓글 첨부파일, 00003: 인사관리->이력서파일
		// 정보 받기
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		snb = (String) multipartRequest.getParameter("sNb");
		// 파일업로드 시키기
		MultiFileUpload mUpload = new MultiFileUpload();
		FileUpDbVO fileVo = new FileUpDbVO();
		
	    try{
			if(snb!=null){
				fileVo.setSubCd(snb);
				fileVo.setFileCategory(fileCate); //00000:정보정리, 00001: staff사진 ,  00002: 댓글 첨부파일, 00003: 인사관리->이력서파일
				//fileslist = workDAO.selectFileInfo(fileVo);
				
				fileVo.setOfferSnb("0");
				fileVo.setReportYN("N");
				fileVo.setRgId(loginUser.getId());
				
				fileVo = mUpload.fileUpload(multipartRequest, fileVo, request, workDAO);
				/*if(fileslist.isEmpty()){
					mUpload.transDB(fileVo, workDAO);
				}else{
					mUpload.uploadDB(fileVo, workDAO);
				}*/
				cnt=1;
			}
			    
	    }catch(Exception e){
	    	LOG.error(e);
	    	e.printStackTrace();
	    }
	    model.addAttribute("saveCnt", cnt);
	    return "personnel/management/data";
//		return "redirect:/basic/mainLogo.do";
	}
	
	/**
	 * 가족사항 저장
	 * @MethodName : familyInfoProcess
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/management/familyInfoProcess.do")
	public String familyInfoProcess( ManagementVO vo,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setUsrId(loginUser.getId());
		
		int cnt = 0;
		
		List<ManagementVO> result = null;
		try{
			result = managementDAO.selectPmFamily(vo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		vo.setListLeng(result.size());
		for(int i=0;i<vo.getRelationUP().length;i++){
/*			
			 if(vo.getFamilyNmUP()!=null){ 		
				 if(vo.getFamilyNmUP()[i]!=null && !"".equals(vo.getFamilyNmUP()[i])) 			
					 vo.setFamilyNm(vo.getFamilyNmUP()[i]); 
				 else {
					 if(vo.getListLeng() <= i) continue; 
					 else vo.setFamilyNm("");
				 }
			 }
			 if(vo.getListLeng()>i){ 			
				 if(null!=vo.getSNbUP()[i] && !"".equals(vo.getSNbUP()[i])) 						
					 vo.setsNb(vo.getSNbUP()[i]); 
			 }
			 if(vo.getFamilyBirthDtUP()!=null){ 
				 if(vo.getFamilyBirthDtUP()[i]!=null && !"".equals(vo.getFamilyBirthDtUP()[i])) 	
					 vo.setFamilyBirthDt(vo.getFamilyBirthDtUP()[i]); 
				 else vo.setFamilyBirthDt(null);
			 }
			 if(vo.getRelationUP()!=null){ 		
				 if(vo.getRelationUP()[i]!=null && !"".equals(vo.getRelationUP()[i])) 			
					 vo.setRelation(vo.getRelationUP()[i]); 
				 else vo.setRelation("0");
			 }
			 if(vo.getJobUP()!=null){ 			
				 if(vo.getJobUP()[i]!=null && !"".equals(vo.getJobUP()[i])) 						
					 vo.setJob(vo.getJobUP()[i]); 
				 else vo.setJob("");
			 }
			 if(vo.getLiveUP()!=null){ 			
				 if(null!=vo.getLiveUP()[i] && !"".equals(vo.getLiveUP()[i])) 					
					 vo.setLive(vo.getLiveUP()[i]); 
				 else vo.setLive("0");
			 }
*/			 
			 
			if(Util.init_array(vo.getFamilyNmUP(),      i, vo, 2000, "")) 				vo.setFamilyNm(vo.getRtnVal()); else continue;
			if(Util.init_array(vo.getSNbUP(),           i, vo, vo.getListLeng(), null)) 	vo.setsNb(vo.getRtnVal());
			if(Util.init_array(vo.getFamilyBirthDtUP(), i, vo, 1000, null)) 				vo.setFamilyBirthDt(vo.getRtnVal());
			if(Util.init_array(vo.getRelationUP(),      i, vo, 1000, "0")) 				vo.setRelation(vo.getRtnVal());
			if(Util.init_array(vo.getJobUP(),           i, vo, 1000, "")) 				vo.setJob(vo.getRtnVal());
			if(Util.init_array(vo.getLiveUP(),          i, vo, 1000, "0")) 				vo.setLive(vo.getRtnVal());

				//System.out.println("------------"+vo.getFamilyNmUP()[i]);
			 
			 
			 
			 
		  	try{
				if(vo.getListLeng()>i) {
					if("".equals(vo.getFamilyNm())) {
						managementDAO.deleteFamilyInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.deleteFamilyInfo");
					}else{
						managementDAO.updateFamilyInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.updateFamilyInfo^_^"+vo.getsNb());
					}
				}else{
					managementDAO.insertFamilyInfo(vo);//insert 
					LOG.debug(loginUser.getId()+"^_^managementDAO.insertFamilyInfo");
				}
				cnt = 1;
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
				cnt = 0;
			}
		}
		
		if(cnt==0) model.addAttribute("error", 1);
//		return "redirect:/personnel/management/Process.do";
		return "personnel/management/PMmain";
	}
	
	/**
	 * 학력사항 저장
	 * @MethodName : schoolInfoProcess
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/management/schoolInfoProcess.do")
	public String schoolInfoProcess( ManagementVO vo,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setUsrId(loginUser.getId());
		
		int cnt = 0;
		
		List<ManagementVO> result = null;
		try{
			result = managementDAO.selectPmAcademic(vo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		vo.setListLeng(result.size());
		for(int i=0;i<vo.getARacademicGd().length;i++){
		
			if(Util.init_array(vo.getARacademicNm(), 	i, vo, 2000, "")) 				vo.setAcademicNm(vo.getRtnVal()); else continue;
			if(Util.init_array(vo.getSNbUP(), 			i, vo, vo.getListLeng(), null)) vo.setsNb(vo.getRtnVal());
			if(Util.init_array(vo.getARjoinSchoolDt(), 	i, vo, 1000, null)) 			vo.setJoinSchoolDt(vo.getRtnVal()+"0101");
			if(Util.init_array(vo.getARacademicGd(), 	i, vo, 1000, "0")) 				vo.setAcademicGd(vo.getRtnVal());
			if(Util.init_array(vo.getARmajor(), 			i, vo, 1000, "")) 				vo.setMajor(vo.getRtnVal());
			if(Util.init_array(vo.getARgraduate(), 		i, vo, 1000, "0")) 				vo.setGraduate(vo.getRtnVal());
			
			//System.out.println("------------"+vo.getARacademicNm()[i]);
			
			
			try{
				if(vo.getListLeng()>i){
					if("".equals(vo.getAcademicNm())){
						managementDAO.deleteAcademicInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.deleteAcademicInfo");
					}else{
						managementDAO.updateAcademicInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.updateAcademicInfo^_^"+vo.getsNb());
					}
				}else{
					managementDAO.insertAcademicInfo(vo);//insert 
					LOG.debug(loginUser.getId()+"^_^managementDAO.insertAcademicInfo");
				}
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
			
		}
		
		if(cnt==0) model.addAttribute("error", 1);
//		return "redirect:/personnel/management/Process.do";
		return "personnel/management/PMmain";
	}
	
	/**
	 *
	 * @MethodName : careerInfoProcess
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/management/careerInfoProcess.do")
	public String careerInfoProcess( ManagementVO vo,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setUsrId(loginUser.getId());
		
		int cnt = 0;
		
		List<ManagementVO> result = null;
		try{
			result = managementDAO.selectPmCareer(vo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		vo.setListLeng(result.size());
		for(int i=0;i<vo.getARcompanyNm().length;i++){
			if(Util.init_array(vo.getARcompanyNm(), 		i, vo, 2000, "")) 				vo.setCompanyNm(vo.getRtnVal()); else continue;
			if(Util.init_array(vo.getSNbUP(), 			i, vo, vo.getListLeng(), null)) vo.setsNb(vo.getRtnVal());
			if(Util.init_array(vo.getARjoinCpnDt(), 		i, vo, 1000, null)) 			vo.setJoinCpnDt(vo.getRtnVal());
			if(Util.init_array(vo.getARresignCpnDt(), 	i, vo, 1000, null)) 			vo.setResignCpnDt(vo.getRtnVal());
			if(Util.init_array(vo.getARposition(), 		i, vo, 1000, "")) 				vo.setPosition(vo.getRtnVal());
			if(Util.init_array(vo.getARjob(), 			i, vo, 1000, "")) 				vo.setJob(vo.getRtnVal());
			
			//System.out.println("------------"+vo.getARcompanyNm()[i]);
			
			try{
				if(vo.getListLeng()>i) {
					if("".equals(vo.getCompanyNm())){
						managementDAO.deleteCareerInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.deleteCareerInfo");
					}else{
						managementDAO.updateCareerInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.updateCareerInfo^_^"+vo.getsNb());
					}
				}else{
					managementDAO.insertCareerInfo(vo);//insert
					LOG.debug(loginUser.getId()+"^_^managementDAO.insertCareerInfo");
				}
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
		}
		
		if(cnt==0) model.addAttribute("error", 1);
//		return "redirect:/personnel/management/Process.do";
		return "personnel/management/PMmain";
	}
	
	/**
	 *
	 * @MethodName : licenseInfoProcess
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/management/licenseInfoProcess.do")
	public String licenseInfoProcess( ManagementVO vo,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setUsrId(loginUser.getId());
		
		int cnt = 0;
		
		List<ManagementVO> result = null;
		try{
			result = managementDAO.selectPmLicense(vo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		vo.setListLeng(result.size());
		for(int i=0;i<vo.getARlicenseNm().length;i++){
			if(Util.init_array(vo.getARlicenseNm(), 		i, vo, 2000, "")) 				vo.setLicenseNm(vo.getRtnVal()); else continue;
			if(Util.init_array(vo.getSNbUP(), 			i, vo, vo.getListLeng(), null)) vo.setsNb(vo.getRtnVal());
			if(Util.init_array(vo.getARissue(), 			i, vo, 1000, "")) 				vo.setIssue(vo.getRtnVal());
			if(Util.init_array(vo.getARobtainDt(), 		i, vo, 1000, null)) 			vo.setObtainDt(vo.getRtnVal());
			
			//System.out.println("------------"+vo.getARlicenseNm()[i]);
			
			try{
				if(vo.getListLeng()>i) {
					if("".equals(vo.getLicenseNm())){
						managementDAO.deleteLicenseInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.deleteLicenseInfo");
					}else{
						managementDAO.updateLicenseInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.updateLicenseInfo^_^"+vo.getsNb());
					}
				}else{
					managementDAO.insertLicenseInfo(vo);//insert 
					LOG.debug(loginUser.getId()+"^_^managementDAO.insertLicenseInfo");
				}
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
		}
		
		if(cnt==0) model.addAttribute("error", 1);
//		return "redirect:/personnel/management/Process.do";
		return "personnel/management/PMmain";
	}
	
	/**
	 *
	 * @MethodName : insideCareerInfoProcess
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/management/insideCareerInfoProcess.do")
	public String insideCareerInfoProcess( ManagementVO vo,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setUsrId(loginUser.getId());
		
		int cnt = 0;
		
		List<ManagementVO> result = null;
		try{
			result = managementDAO.selectPmInsideCareer(vo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		vo.setListLeng(result.size());
		for(int i=0;i<vo.getARposition().length;i++){
			if(Util.init_array(vo.getARposition(), 		i, vo, 2000, "")) 				vo.setPosition(vo.getRtnVal()); else continue;
			if(Util.init_array(vo.getSNbUP(), 			i, vo, vo.getListLeng(), null)) vo.setsNb(vo.getRtnVal());
			if(Util.init_array(vo.getARdivision(), 		i, vo, 1000, "")) 				vo.setDivision(vo.getRtnVal());
			if(Util.init_array(vo.getARpromotionDt(), 	i, vo, 1000, null)) 			vo.setPromotionDt(vo.getRtnVal());
			
			//System.out.println("------------"+vo.getARdivision()[i]);
			
			try{
				if(vo.getListLeng()>i) {
					if("".equals(vo.getPosition())){
						managementDAO.deleteInsideCareerInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.deleteInsideCareerInfo");
					}else{
						managementDAO.updateInsideCareerInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.updateInsideCareerInfo^_^"+vo.getsNb());
					}
				}else{
					managementDAO.insertInsideCareerInfo(vo);//insert
					LOG.debug(loginUser.getId()+"^_^managementDAO.insertInsideCareerInfo");
				}
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
		}
		
		if(cnt==0) model.addAttribute("error", 1);
//		return "redirect:/personnel/management/Process.do";
		return "personnel/management/PMmain";
	}
	/**
	 *
	 * @MethodName : justiceInfoProcess
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/management/justiceInfoProcess.do")
	public String justiceInfoProcess( ManagementVO vo,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setUsrId(loginUser.getId());
		
		int cnt = 0;
		
		List<ManagementVO> result = null;
		try{
			result = managementDAO.selectPmJustice(vo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		vo.setListLeng(result.size());
		for(int i=0;i<vo.getARreason().length;i++){
			if(Util.init_array(vo.getARreason(), 		i, vo, 2000, "")) 				vo.setReason(vo.getRtnVal()); else continue;
			if(Util.init_array(vo.getSNbUP(), 			i, vo, vo.getListLeng(), null)) vo.setsNb(vo.getRtnVal());
			if(Util.init_array(vo.getARjusticeDt(),	 	i, vo, 1000, null)) 			vo.setJusticeDt(vo.getRtnVal());
			if(Util.init_array(vo.getARcomment(), 		i, vo, 1000, "")) 				vo.setComment(vo.getRtnVal());
			
			//System.out.println("------------"+vo.getARdivision()[i]);
			
			try{
				if(vo.getListLeng()>i) {
					if("".equals(vo.getReason())){ 
						managementDAO.deleteJusticeInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.deleteJusticeInfo");
					}else{
						managementDAO.updateJusticeInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.updateJusticeInfo^_^"+vo.getsNb());
					}
				}else{
					managementDAO.insertJusticeInfo(vo);//insert 
					LOG.debug(loginUser.getId()+"^_^managementDAO.insertJusticeInfo");
				}
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
		}
		
		if(cnt==0) model.addAttribute("error", 1);
//		return "redirect:/personnel/management/Process.do";
		return "personnel/management/PMmain";
	}
	/**
	 *
	 * @MethodName : salaryInfoProcess
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/management/salaryInfoProcess.do")
	public String salaryInfoProcess( ManagementVO vo,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setUsrId(loginUser.getId());
		
		int cnt = 0;
		
		List<ManagementVO> result = null;
		try{
			result = managementDAO.selectPmSalary(vo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		vo.setListLeng(result.size());
		for(int i=0;i<vo.getARpay().length;i++){
			if(Util.init_array(vo.getARpay(),	 		i, vo, 2000, "")) 				vo.setPay(vo.getRtnVal()); else continue;
			if(Util.init_array(vo.getSNbUP(), 			i, vo, vo.getListLeng(), null)) vo.setsNb(vo.getRtnVal());
			if(Util.init_array(vo.getARcomment(), 		i, vo, 1000, "")) 				vo.setComment(vo.getRtnVal());
			if(Util.init_array(vo.getARvariableDt(), 	i, vo, 1000, null)) 			vo.setVariableDt(vo.getRtnVal());
			
			//System.out.println("------------"+vo.getARdivision()[i]);
			
			try{
				if(vo.getListLeng()>i) {
					if("".equals(vo.getPay())){ 
						managementDAO.deleteJusticeInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.deleteJusticeInfo");
					}else{
						managementDAO.updateJusticeInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.updateJusticeInfo^_^"+vo.getsNb());
					}
				}else{
					managementDAO.insertJusticeInfo(vo);//insert 
					LOG.debug(loginUser.getId()+"^_^managementDAO.insertJusticeInfo");
				}
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
		}
		
		if(cnt==0) model.addAttribute("error", 1);
//		return "redirect:/personnel/management/Process.do";
		return "personnel/management/PMmain";
	}
	/**
	 *
	 * @MethodName : assessmentInfoProcess
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/management/assessmentInfoProcess.do")
	public String assessmentInfoProcess( ManagementVO vo,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setUsrId(loginUser.getId());
		
		int cnt = 0;
		
		List<ManagementVO> result = null;
		try{
			result = managementDAO.selectPmAssessment(vo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		vo.setListLeng(result.size());
		for(int i=0;i<vo.getARpay().length;i++){
			if(Util.init_array(vo.getARpay(), 			i, vo, 2000, "")) 				vo.setPay(vo.getRtnVal()); else continue;
			if(Util.init_array(vo.getARassessmentScore(),i, vo, 1000, "")) 				vo.setAssessmentScore(vo.getRtnVal());
			if(Util.init_array(vo.getSNbUP(), 			i, vo, vo.getListLeng(), null)) vo.setsNb(vo.getRtnVal());
			if(Util.init_array(vo.getARassessmentDt(), 	i, vo, 1000, null)) 			vo.setAssessmentDt(vo.getRtnVal()+"0101");
			
			//System.out.println("------------"+vo.getARdivision()[i]);
			
			try{
				if(vo.getListLeng()>i) {
					if("".equals(vo.getPay())){
						managementDAO.deleteAssessmentInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.deleteAssessmentInfo"+vo.getsNb());
					}else{
						managementDAO.updateAssessmentInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.updateAssessmentInfo^_^"+vo.getsNb());
					}
				}else{
					managementDAO.insertAssessmentInfo(vo);//insert 
					LOG.debug(loginUser.getId()+"^_^managementDAO.insertAssessmentInfo");
				}
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
		}
		
		if(cnt==0) model.addAttribute("error", 1);
//		return "redirect:/personnel/management/Process.do";
		return "personnel/management/PMmain";
	}
	/**
	 *
	 * @MethodName : stockOptionInfoProcess
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/management/stockOptionInfoProcess.do")
	public String stockOptionInfoProcess( ManagementVO vo,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setUsrId(loginUser.getId());
		
		vo.setFlag("00001");
		vo.setListLeng(vo.getSNbUP().length);
		
		if(vo.getListLeng()<2 & vo.getARquantity()[0].length()<2) return "personnel/management/PMmain";
		
		for(int i=0;i<vo.getARpay().length;i++){
			if(Util.init_array(vo.getARturn(),	 		i, vo, 2000, "")) 				vo.setTurn(vo.getRtnVal());
			else if(Util.init_array(vo.getARquantity(),	i, vo, 2000, "")) 				vo.setQuantity(vo.getRtnVal());  else continue;
			if(Util.init_array(vo.getARquantity(),	 	i, vo, 1000, "")) 				vo.setQuantity(vo.getRtnVal());
			if(Util.init_array(vo.getSNbUP(), 			i, vo, vo.getListLeng(), ""))	vo.setsNb(vo.getRtnVal());
			if(Util.init_array(vo.getARpay(),	 		i, vo, 1000, "")) 				vo.setPay(vo.getRtnVal());
			if(Util.init_array(vo.getARstockDt(),	 	i, vo, 1000, null)) 			vo.setStockDt(vo.getRtnVal());
			
			try{
				if(vo.getsNb().length()>0) {
					if("".equals(vo.getQuantity())){
						managementDAO.deleteStockInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.deleteStockInfo");
					}else{
						managementDAO.updateStockInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.updateStockInfo^_^"+vo.getsNb());
					}
				}else {
					int turn = vo.getTurn().length()==0?0:Integer.parseInt(vo.getTurn());
					vo.setTurn(Integer.toString(turn+1));
					managementDAO.insertStockInfo(vo);//insert 
					LOG.debug(loginUser.getId()+"^_^managementDAO.insertStockInfo");
				}
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
			System.out.println("\n\n1111\n"+vo.getPay()+"::::"+vo.getsNb()+"\n"+vo.getQuantity()+"\n"+vo.getStaffSNb()+"\n\n");
		}
		
		vo.setFlag("00002");
		vo.setPay("0");
		vo.setListLeng(vo.getARGsNb().length);
		for(int i=0;i<vo.getARGturn().length;i++){
			if(Util.init_array(vo.getARGturn(),	 		i, vo, 2000, null)) 			vo.setTurn(vo.getRtnVal());
			else if(Util.init_array(vo.getARGquantity(),	i, vo, 2000, "")) 				vo.setQuantity(vo.getRtnVal()); 
			else {
				int turn = vo.getTurn().length()==0?0:Integer.parseInt(vo.getTurn());
				vo.setTurn(Integer.toString(turn+1));
				continue;
			}
			if(Util.init_array(vo.getARGquantity(),		i, vo, 1000, "")) 				vo.setQuantity(vo.getRtnVal());
			if(Util.init_array(vo.getARGsNb(), 			i, vo, vo.getListLeng(), ""))	vo.setsNb(vo.getRtnVal());
			if(Util.init_array(vo.getARGstockDt(),	 	i, vo, 1000, null)) 			vo.setStockDt(vo.getRtnVal());
			
			try{
				if(vo.getsNb().length()>0) {
					if("".equals(vo.getQuantity())){
						managementDAO.deleteStockInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.deleteStockInfo");
					}else{
						managementDAO.updateStockInfo(vo); //update
						LOG.debug(loginUser.getId()+"^_^managementDAO.updateStockInfo^_^"+vo.getsNb());
					}
				}else{
					managementDAO.insertStockInfo(vo);//insert 
					LOG.debug(loginUser.getId()+"^_^managementDAO.insertStockInfo");
				}
			}catch(Exception e){
				LOG.error(e);
				e.printStackTrace();
			}
			System.out.println("\n\n22222\n"+vo.getPay()+"::::"+vo.getsNb()+"["+vo.getsNb().length()+"]"+"\n"+vo.getQuantity()+"\n"+vo.getStaffSNb()+"\n\n");
		}
		
		return "personnel/management/PMmain";
	}
	/**
	 * 애로사항,희망사항,시급사항,건의사항
	 * @MethodName : problemInfoProcess
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/management/problemInfoProcess.do")
	public String problemInfoProcess( ManagementVO vo,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		vo.setUsrId(loginUser.getId());
		
		int cnt = 0;
		
		List<ManagementVO> result = null;
		try{
			result = managementDAO.selectPmProposal(vo);
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		vo.setListLeng(result.size());
		try{
			if(vo.getListLeng()>0) {
				if("".equals(vo.getContents())){
					managementDAO.deletePmProposal(vo); //update
					LOG.debug(loginUser.getId()+"^_^managementDAO.deletePmProposal");
				}else{
					managementDAO.updatePmProposal(vo); //update
					LOG.debug(loginUser.getId()+"^_^managementDAO.updatePmProposal^_^"+vo.getsNb());
				}
			}else if(!"".equals(vo.getContents())){
				managementDAO.insertPmProposal(vo);//insert 
				LOG.debug(loginUser.getId()+"^_^managementDAO.insertPmProposal");
			}
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		
		if(cnt==0) model.addAttribute("error", 1);
//		return "redirect:/personnel/management/Process.do";
		return "personnel/management/PMmain";
	}
	
	/**
	 * 이력서 업로드
	 * @MethodName : uploadCV
	 * @param request
	 * @param response
	 * @param rcmdVO
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/personnel/management/uploadCV.do")
	public String uploadCV( 
			HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("rcmdVO") RecommendVO rcmdVO,
			HttpSession session,
			ModelMap model){
		if(session.getAttribute("userLoginInfo")==null) return "basic/Content";
		LoginVO loginUser = (LoginVO) session.getAttribute("userLoginInfo");
		LOG.info(loginUser.getId());
		
		String snb = "";
		String usrid = "";
		try{
			// 정보 받기
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			snb = (String) multipartRequest.getParameter("tmpNum1");
			usrid = (String) multipartRequest.getParameter("usrId");
			// 파일업로드 시키기
			MultiFileUpload mUpload = new MultiFileUpload();
			FileUpDbVO fileVo = new FileUpDbVO();
			
			fileVo.setOfferSnb(snb);
			fileVo.setReportYN("N");
			fileVo.setFileCategory("00003"); //00000:정보정리, 00001: staff사진 ,  00002: 댓글 첨부파일, 00003: 인사관리->이력서파일
			fileVo.setRgId(loginUser.getId());
			
			mUpload.fileUpload(multipartRequest, fileVo, request, workDAO);
			
		}catch(Exception e){
			LOG.error(e);
			e.printStackTrace();
		}
		return "redirect:/personnel/management/index.do?usrId="+ usrid;
	}
}