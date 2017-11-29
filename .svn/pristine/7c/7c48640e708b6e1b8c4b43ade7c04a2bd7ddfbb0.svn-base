package ib.company.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ib.cmm.LoginVO;
import ib.company.service.CompanyService;
import ib.person.service.PersonMgmtService;
import ib.person.service.PersonVO;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import au.com.bytecode.opencsv.CSVReader;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service("companyService")
public class CompanyServiceImpl extends AbstractServiceImpl implements CompanyService {

    @Resource(name="companyDAO")
    private CompanyDAO companyDAO;
    
    
    @Autowired
    private DataSourceTransactionManager transactionManager;
    
    
    
    protected static final Log logger = LogFactory.getLog(CompanyServiceImpl.class);

    
    
    //회사 일괄 업로드 - CSV
  	public Map uploadCompanyProcess(LoginVO loginUser, File fNewname1) throws Exception {
  		
  		
  		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
  		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

  		TransactionStatus status = transactionManager.getTransaction(def);
  		
  		
  		FileInputStream is = new FileInputStream(fNewname1);
  		InputStreamReader isr = new InputStreamReader(is, "EUC-KR");

  		CSVReader reader = new CSVReader(isr);
  		List myEntries = reader.readAll();				//전체 row 읽어
  		
  		
  		boolean isComplete = true;
  		String failMsg = "";			//실패시 전달할 메세지
  		
  		try{
  		
	  		//----------------------------------- 등록 :S -----------------------------------
	      	
	  		for(int m = 1; m < myEntries.size(); m++) {		//index 1(2번째 row...실제 데이터) 부터 등록해준다.
	  			String[] arr = (String[]) myEntries.get(m);	//한개 row
	  			
	  			Map<String, Object> tmpMap = new HashMap<String, Object>();
	  			
	  			//tmpMap.put("cpnId", 			arr[0].toString().trim());		// 회사코드
	  			tmpMap.put("aCpnId", 			arr[0].toString().trim());		// 상장사코드
	  			tmpMap.put("cpnNm", 			arr[1].toString().trim());		// 회사명
	  			tmpMap.put("categoryBusiness", 	arr[2].toString().trim());		// 업종
	  			tmpMap.put("listedDt", 			arr[3].toString().trim());		// 상장일자
	  			//tmpMap.put("종업원수", 		arr[4].toString().trim());		// 종업원수
	  			tmpMap.put("majorProduct", 		arr[5].toString().trim());		// 주요품목
	  			
	  			tmpMap.put("rgId", 				loginUser.getId());				// 등록자 id
	  			tmpMap.put("upId", 				loginUser.getId());				// 수정자 id
	  				  			
	  			
	  			//1.a_cpn_id 가 기존에 있는 건의 갯수
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("aCpnId", tmpMap.get("aCpnId"));
				List<Map> list = companyDAO.selectCompanyForChk(param);
								
				int cnt = list.size();		//aCpnId 로 검색한 결과수
				if(cnt > 0){				//있는 상장코드
		  			companyDAO.updateCompanyList(tmpMap);			//수정
				}else{
					companyDAO.insertCompanyList(tmpMap);			//등록
				}
	  			
	  		}//for 
	  	
  		}catch(Exception e){
  			e.printStackTrace();
  			logger.error("회사업로드 에러!", e);
  			
  			//오류를 보낸다.
  			isComplete = false;
  			failMsg = "FAIL";
  		}
  		
  		
  		//reader closing
  		reader.close();
  		isr.close();
  		is.close();
  		
  		Map rMap = new HashMap<String, Object>();
  		
  		if(isComplete){
  			rMap.put("upload", 1);			//업로드 success
  			rMap.put("failMsg", "");
  			
  			transactionManager.commit(status);			//■■■■■■ commit ■■■■■■
  			
  		}else{
  			rMap.put("upload", 0);			//업로드 fail
  			rMap.put("failMsg", failMsg);
  			
  			System.out.println(failMsg);
  			
  			transactionManager.rollback(status);		//■■■■■■ rollback ■■■■■■
  			//throw new Exception(failMsg);
  		}
  		
  		
  		//----------------------------------- 등록 :E -----------------------------------
  		
  		return rMap;
  	}
    
    
	//회사 일괄 업로드 - CSV	00000000000000000000000000000000000
	public Map uploadCompanyProcess00000000000000000000(LoginVO loginUser, File fNewname1) throws Exception {
		
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

		TransactionStatus status = transactionManager.getTransaction(def);
		
		
		
		//----------------------------------- 등록 :S -----------------------------------
    	
    	FileInputStream is = new FileInputStream(fNewname1);
		InputStreamReader isr = new InputStreamReader(is, "EUC-KR");

		CSVReader reader = new CSVReader(isr);
		List myEntries = reader.readAll();				//전체 row 읽어

		//List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		boolean isComplete = true;
		String failMsg = "";			//실패시 전달할 메세지
		for(int m = 1; m < myEntries.size(); m++) {		//index 1(2번째 row...실제 데이터) 부터 등록해준다.
			String[] arr = (String[]) myEntries.get(m);	//한개 row
			//String data = "";
			
			//CpnExcelVO tmpVO = new CpnExcelVO();
			Map<String, Object> tmpMap = new HashMap<String, Object>();
			
			/*
			tmpVO.setCpnId(				arr[0].toString().trim());		// 회사코드
			tmpVO.setCpnNm(				arr[1].toString().trim());		// 회사명 
			tmpVO.setCategoryBusiness(	arr[2].toString().trim());		// 업종  
			tmpVO.setListedDt(			arr[3].toString().trim());		// 상장일자
			tmpVO.setMajorProduct(		arr[4].toString().trim());		// 주요품목
			*/
			/*
			for(int k = 0; k < arr.length; k++) {		//한개 row(arr) 안의 데이터를 뽑아서 
				data = arr[k].toString().trim();
				
				if(k == 0) 		tmpVO.setCpnId(data);					// 회사코드
				else if(k == 1) tmpVO.setCpnNm(data);					// 회사명
				else if(k == 2) tmpVO.setCategoryBusiness(data);		// 업종
				else if(k == 3) tmpVO.setListedDt(data);				// 상장일자
				else if(k == 4) tmpVO.setMajorProduct(data);			// 주요품목
			}*/
			/*
			tmpMap.put("cpnId", 			tmpVO.getCpnId());					// 회사코드
			tmpMap.put("cpnNm", 			tmpVO.getCpnNm());					// 회사명 
			tmpMap.put("categoryBusiness", 	tmpVO.getCategoryBusiness());		// 업종  
			tmpMap.put("listedDt", 			tmpVO.getListedDt());				// 상장일자
			tmpMap.put("majorProduct", 		tmpVO.getMajorProduct());			// 주요품목
			*/
			tmpMap.put("cpnId", 			arr[0].toString().trim());		// 회사코드
			tmpMap.put("aCpnId", 			arr[0].toString().trim());		// 상장사코드
			tmpMap.put("cpnNm", 			arr[1].toString().trim());		// 회사명
			tmpMap.put("categoryBusiness", 	arr[2].toString().trim());		// 업종
			tmpMap.put("listedDt", 			arr[3].toString().trim());		// 상장일자
			tmpMap.put("majorProduct", 		arr[4].toString().trim());		// 주요품목
			
			tmpMap.put("rgId", 				loginUser.getId());				// 등록자 id
			tmpMap.put("upId", 				loginUser.getId());				// 수정자 id
			
			//list.add(tmpMap);
			
			
			//1.cpn_id, a_cpn_id 가 기존에 있는 건의 갯수
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("cpnId", tmpMap.get("cpnId"));
			List<Map> list = companyDAO.selectCompanyForChk(param);
			List<Map> list2 = null;
			
			int cnt = list.size();		//cpnId 로 검색한 결과수
			int upCnt = 0;				//저장갯수(및 임시변수)
			
			if(cnt == 1){				//있는 법인코드					//■■■ CASE.1 ■■■
				
				param.put("cpnId", null);
				param.put("cpnNm", tmpMap.get("cpnNm"));
				
				list2 = companyDAO.selectCompanyForChk(param);
				if(list2.size() > 0){	//동일 사명이 있다				//■■■ CASE.2-1 ■■■
					
					if(list.get(0).get("cpnId").toString().equals(list2.get(0).get("cpnId").toString())){
						//update
						upCnt = companyDAO.saveCompanyList(tmpMap);
					}else{
						isComplete = false;
						failMsg = "-cpnId:" + tmpMap.get("cpnId") + "\n-cpnNm:" + tmpMap.get("cpnNm") + "\n\n :::동일 사명이 이미 존재한다, 데이터를 체크해봐야할때!!";
						break;
					}
					
				}else if(list.size() == 0){								//■■■ CASE.2-2 ■■■
					//update
					upCnt = companyDAO.saveCompanyList(tmpMap);
				}
				
				
				//업데이트 실행
				upCnt = companyDAO.saveCompanyList(tmpMap);
				
			}else if(cnt == 0){			//신규 법인코드					//■■■ CASE.2 ■■■
				param.put("cpnId", null);
				param.put("cpnNm", tmpMap.get("cpnNm"));
				
				list = companyDAO.selectCompanyForChk(param);
				if(list.size() > 0){	//동일 사명이 있다				//■■■ CASE.2-1 ■■■
					
					if(list.get(0).get("aCpnId") == null){				//■■■ CASE.2-1-1 ■■■
						upCnt = companyDAO.saveCompanyList(tmpMap);		//비상장에서 상장으로 바뀐케이스로 보고 update
					}else{												//■■■ CASE.2-1-2 ■■■
						//사명이 통폐합 등으로 cpn_id 가 새로 따지거나, 데이터를 체크해봐야할때
						//오류를 보내서 고치도록 한다.
						isComplete = false;
						failMsg = "-cpnId:" + tmpMap.get("cpnId") + "\n-cpnNm:" + tmpMap.get("cpnNm") + "\n\n :::사명이 통폐합 등으로 cpn_id 가 새로 따지거나, 데이터를 체크해봐야할때!!";
						break;
					}
				}else if(list.size() == 0){								//■■■ CASE.2-2 ■■■
					//insert
					upCnt = companyDAO.saveCompanyList(tmpMap);
				}
				
			}else if(cnt > 1){		//기존 법인코드에 중복이 있는 경우		//■■■ CASE.3 ■■■
				//오류를 보내서 고치도록 한다.
				isComplete = false;
				failMsg = "-cpnId:" + tmpMap.get("cpnId") + "\n-cpnNm:" + tmpMap.get("cpnNm") + "\n\n :::기존 법인코드에 중복이 있는 경우!!";
				break;
			}else{														//■■■ CASE else ■■■
				//오류를 보낸다.
				isComplete = false;
				failMsg = "-cpnId:" + tmpMap.get("cpnId") + "\n-cpnNm:" + tmpMap.get("cpnNm") + "\n\n :::확인 체크!!";
				break;
			}
			
		}//for
		
		
		//reader closing
		reader.close();
		isr.close();
		is.close();
		
		Map rMap = new HashMap<String, Object>();
		
		if(isComplete){
			rMap.put("upload", 1);			//업로드 success
			rMap.put("failMsg", "");
			
			transactionManager.commit(status);			//■■■■■■ commit ■■■■■■
			
		}else{
			rMap.put("upload", 0);			//업로드 fail
			rMap.put("failMsg", failMsg);
			
			System.out.println(failMsg);
			
			transactionManager.rollback(status);		//■■■■■■ rollback ■■■■■■
			//throw new Exception(failMsg);
		}
		
		
		//----------------------------------- 등록 :E -----------------------------------
		
		return rMap;
	}
	
}
