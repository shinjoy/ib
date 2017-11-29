package ib.batch.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ib.batch.service.BatchService;
import ib.work.service.WorkMemoService;
import ib.work.service.WorkVO;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service("batchService")
public class BatchServiceImpl extends AbstractServiceImpl implements BatchService {

	
    @Resource(name="batchDAO")
    private BatchDAO batchDAO;
    
	/*@Value("${Globals.fileStorePath2}")
	private String folderPath;*/
	
    protected static final Log logger = LogFactory.getLog(BatchServiceImpl.class);

    

	
	//등용문 회사정보 일배치
	public List<Map> getCompanyList(Map<String, Object> map) throws Exception {
		
		return batchDAO.getCompanyList(map);
	}

	
	//등용문 인물(직원)정보 일배치
	public List<Map> getCustomerList(Map<String, Object> map) throws Exception {
		return batchDAO.getCustomerList(map);
	}

	
	//등용문 주가정보
	public List<Map> getStockPriceList(Map<String, Object> map) throws Exception {
		return batchDAO.getStockPriceList(map);
	}


	//등용문 기업탐방정보
	public List<Map> getCpnVisitList(Map<String, Object> map) throws Exception {
		return batchDAO.getCpnVisitList(map);
	}
	
	//등용문 리포트 임시저장
	public int insertReportIf(Map<String, Object> map) throws Exception {
		
		return batchDAO.insertReportIf(map);
	}
	
	//등용문 파일 IF테이블 저장
	public List<Map> insertFileIf(String fileList) throws Exception {
		
		TypeReference<List<Map>> mapType = new TypeReference<List<Map>>() {};
	 	List<Map> fileListArr = new ObjectMapper().readValue(fileList, mapType);
	 	
	 	List<Map> newfileList = new ArrayList();
	 	
		int chk =0;
		
		//파일 데이터 
	 	for(int i=0;i<fileListArr.size();i++){
	 		chk = batchDAO.insertFileIf(fileListArr.get(i));					//IF테이블 저장.
	 		
			if(chk>0){
				logger.debug("################ insertFileIf 내 fileCopy 호출 ################");
				Map fileMap = fileCopy(fileListArr.get(i), "");					//IF테이블 저장 성공 파일 복사.
				chk = Integer.parseInt(fileMap.get("result").toString());
				
				if(chk>0){
					newfileList.add(fileMap);									//저장 파일정보 담아
				}
	
			}
	
		}
	 	
	 	return newfileList;			//파일 데이터 반환
	}
	
	
	//IB_OFFER 등록
	public int saveIb(Map<String, Object> rePortMap, List<Map> newfileList) throws Exception {
		
		int offerSnb = Integer.parseInt(rePortMap.get("offerId").toString());	//신규면 0 , 아니면 ib_offer에 이미저장된  offerId 값
		
	 	//ib_file_info 및 ib_offer 저장
	 	
		offerSnb = saveIbOffer(rePortMap);										//ib_offer 등록  chk = 최종 offer 저장 Id
		
		if(offerSnb>0) saveIbOfferInfo(rePortMap, offerSnb);					//offer_info 저장
		
		if(offerSnb>0 && newfileList.size()>0){
			deleteIbFileInfo(offerSnb);							//삭제후 재 저장.
			saveIbFileInfo(newfileList,offerSnb,rePortMap);		//ib_file_info 저장
		}
		
		return offerSnb;
	}
	

	//파트너 회원정보
	public List<Map> getPartnerList(Map<String, Object> map) throws Exception {
		return batchDAO.getPartnerList(map);
	}
	
	
	//ib_offer 저장.
	public int saveIbOffer(Map<String, Object> map) throws Exception {
		
		Map<String, Object> offerMap = new HashMap();
		
		offerMap.put("offerId", map.get("offerId"));
		offerMap.put("middleOfferCd", "00000");
		offerMap.put("offerCd", map.get("offerCd"));	//00003 탐방 건.
		offerMap.put("tmDt", map.get("visitDt"));		//탐방일
		offerMap.put("rgNm", map.get("userNm"));
		offerMap.put("cpnCst", map.get("empMstrSeq") == null ? "0" : map.get("empMstrSeq"));	//고객 아이디 ib_customer : s_nb
		offerMap.put("cstId", "0");
		offerMap.put("cpnId", map.get("corpInfoSeq"));	//회사 아이디 ib_company : cpn_id
		offerMap.put("categoryCd", "");
		offerMap.put("price", "");
		offerMap.put("investPrice", "");
		offerMap.put("memo", map.get("content"));
		
		offerMap.put("financing", "");
		offerMap.put("management", "");
		offerMap.put("mna", "");
		offerMap.put("etc", "");
		offerMap.put("share", "");
		offerMap.put("resource", "");
		offerMap.put("humanNet", "");
		offerMap.put("audit", "");
		offerMap.put("investInte", "");
		offerMap.put("servey", "");
		offerMap.put("supporter", "0");
		offerMap.put("recommendSnb", "0");
		offerMap.put("cpnTypeCd", "00000");
		offerMap.put("infoLevel", "9");
		
		offerMap.put("coworker", "");
		offerMap.put("supporterText", "");
		offerMap.put("sellBuy", "0");
		
		if(map.get("offerCd").equals("00013")){			//추천종목
			offerMap.put("sellBuy", "1");				
		}
		
		offerMap.put("ibUserId", map.get("ibUserId"));
		
		//이미 등록 되어 있는지 판별.
		int count = batchDAO.chkIbOffer(offerMap);
		
		if(count > 0){
			batchDAO.updateIbOffer(offerMap);
			return Integer.parseInt(map.get("offerId").toString());	//업데이트 
		}
		else 
			return batchDAO.insertIbOffer(offerMap);
		
	}
	
	//ib_offer_info 저장.
	public void saveIbOfferInfo(Map<String, Object> map,int offerSnb) throws Exception {
		
		Map<String, Object> offerInfoMap = new HashMap();
		
		String star = "";
		String expirationDt = "";
		
		String analCommentCd =map.get("analCommentCd").toString();		//등용문에서 넘어온 별표
		String analValidTermCd =map.get("analValidTermCd").toString();	//등용문에서 넘어온 분석유효기간
		
		String category = map.get("infoCategory").toString();
		
		//분석의견 별표 
		if(analCommentCd.equals("POSITIVE")) 		star = "5";
		else if(analCommentCd.equals("NEUTRAL")) 	star = "3";
		else if(analCommentCd.equals("NEGATIVE")) 	star = "1";
		
		//분석유효기간
		if(analValidTermCd.equals("MONTH_3")) 	   expirationDt = "3";
		else if(analValidTermCd.equals("MONTH_6")) expirationDt = "6";
		else if(analValidTermCd.equals("MONTH_9")) expirationDt = "9";
		else if(analValidTermCd.equals("YEAR_1"))  expirationDt = "12";
		else if(analValidTermCd.equals("YEAR_2"))  expirationDt = "24";
		
		
		offerInfoMap.put("offerSnb", offerSnb);			
		offerInfoMap.put("category", category);			//00008 분석의견.
		offerInfoMap.put("progressCd", "00000");
		offerInfoMap.put("lvCd", "00000");
		
		if(category.equals("00008")){					//00008 분석의견.
			offerInfoMap.put("comment", map.get("content"));
			offerInfoMap.put("star", star);
			offerInfoMap.put("expirationDt", expirationDt);
		}else{											//빈값 추천종목
			offerInfoMap.put("star", "");
			offerInfoMap.put("expirationDt", "");
		}
		
		offerInfoMap.put("ibUserId", map.get("ibUserId"));
		
		//이미 등록 되어 있는지 판별.
		int count = batchDAO.chkIbOfferInfo(offerInfoMap);
		
		if(count > 0)  batchDAO.updateIbOfferInfo(offerInfoMap);		//업데이트
		else batchDAO.insertIbOfferInfo(offerInfoMap);	//신규등록
		
		
		
	}
	
	//ib_file_info 저장.
	public int saveIbFileInfo(List<Map> fileList,int offerSnb,Map<String, Object> reportMap) throws Exception {
		
		int Cnt =0;
		for(int i=0;i<fileList.size();i++){
			Map<String, Object> fileMap = fileList.get(i);
			fileMap.put("offerSnb", offerSnb);
			fileMap.put("ibUserId", reportMap.get("ibUserId"));
			batchDAO.insertIbFileInfo(fileMap);
			Cnt ++;
		}
		
		return Cnt;
		
	}
	
	//등용문 임시저장 테이블에 offerId 기록
	public void updateReportIf(Map<String, Object> map) throws Exception {
		
		batchDAO.updateReportIf(map);
	}
	
	//저장 파일건 삭제
	public void deleteIbFileInfo(int offerSnb) throws Exception {
		
		batchDAO.deleteIbFileInfo(offerSnb);
	}
	
	
	
	//파일 복사
	public Map fileCopy(Map fileInfoMap , String newFilePath) {
	    
		Map<String, String> resultMap= new HashMap();
		
		String tOrgFileName = fileInfoMap.get("fileOrgnNm").toString();		//파일 최초 등록이름
		String tPhysFilenm	= fileInfoMap.get("filePhysNm").toString();		//파일 등용문에서 업로드한 이름
		//String tPhysFilenm	= "1484714214345.pdf";	//파일 등용문에서 업로드한 이름
		
		String tPath		= "F:/report_files"+fileInfoMap.get("path").toString();			//파일 등용문 path
		
		//os가 리눅스면 D:를 제거한다
		if(System.getProperty("os.name").toUpperCase().indexOf("WINDOWS") < 0)
        {
			if(tPath.indexOf("F:")>=0){
				tPath = "/home/synergy"+tPath.split("F:")[1];
			}
        }
		
		
		String ext			= fileInfoMap.get("ext").toString();			//확장자
		
		//String tPath	="F:/report_files/REPORT/201701/";
		String ibPath = "D:/UpLoadData/";
		
		//os가 리눅스면 D:를 제거한다
		if(System.getProperty("os.name").toUpperCase().indexOf("WINDOWS") < 0)
        {
			if(ibPath.indexOf("D:")>=0){
				ibPath = "/home/synergy"+ibPath.split("D:")[1];
			}
        }
			
			
		String ibFileName = "" + (System.currentTimeMillis() + 1);			//ib 를 위한 새이름 .. ib 폴더에 저장될 이름
		
		File orgFile = new File(tPath + tPhysFilenm);
		
	    try{	
	        FileInputStream inputStream = new FileInputStream(orgFile);
	        FileOutputStream outputStream = new FileOutputStream(ibPath+ibFileName); 
	        FileChannel fcin =  inputStream.getChannel();
	        FileChannel fcout = outputStream.getChannel(); 
	        
	        long size = fcin.size();
	        fcin.transferTo(0, size, fcout); 
	        
	        fcout.close();
	        fcin.close(); 
	        outputStream.close();
	        inputStream.close();
	        
	        resultMap.put("result", "1");
	        resultMap.put("makeName", ibFileName);
	        resultMap.put("subCd", "0");
	        resultMap.put("reportYn", "N");
	        resultMap.put("realName", tOrgFileName);
	        resultMap.put("path", ibPath);
	        resultMap.put("fileCategory", "00000");			//00000:정보정리
	        
	        return resultMap;
	        
	    }catch(Exception e){
	    	e.printStackTrace();	    	
	    	logger.error("########### FILE COPY" + e.getMessage(), e);	    	
	    	resultMap.put("result", "-2");
	    	return resultMap;
	    }
	}
	
	
	//가장 최근 데이터 내용 가져오기
	public Map getBeforeIfInfo(Map<String, Object> map) throws Exception{
		
		return batchDAO.getBeforeIfInfo(map);
	}
	
	
	public void deleteIb(Map<String, Object> reportMap) throws Exception {
		
		batchDAO.deleteIbOffer(reportMap);				//ib_offer 삭제
		batchDAO.deleteIbOfferInfo(reportMap);			//offer_info 삭제
		deleteIbFileInfo(Integer.parseInt(reportMap.get("offerId").toString()));		//ib_file 삭제.
		
	}


}
