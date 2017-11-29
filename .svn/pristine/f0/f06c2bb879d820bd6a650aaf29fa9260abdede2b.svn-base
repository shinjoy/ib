package ib.batch.web;

import ib.batch.service.BatchService;

import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * <pre>
 * package	: ib.batch.web 
 * filename	: BatchController.java
 * </pre>
 * 
 * 
 * 
 * @author	: oys
 * @date	: 2016. 8. 18.
 * @version : 
 *
 */
@Controller
public class BatchController {


    @Resource(name = "batchService")
    BatchService batchService;



	/** log */
    protected static final Log logger = LogFactory.getLog(BatchController.class);

	protected static final Calendar cal = Calendar.getInstance();

	
	
	
	/**
	 * 등용문 연계 배치 통합 컨트럴
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 18.
	 */
	@RequestMapping(value = "/rest/api.do", method = {RequestMethod.POST})	//, headers="Accept=application/json"
	@ResponseBody
	public Map<String,String> getCompanyList(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestBody Map<String,Object> map) throws Exception {
	

		String apiKey = map.get("apiKey").toString();				//서비스 종류
		//String searchDate = null;									//정보날짜



		//System.out.println("apiKey:::" + apiKey + "\nsearchDate:::" + searchDate);
		
		List<Map> list = null;		
		HashMap result = new HashMap();

		
		try{
		
			if("REQ_IB_COMPANY_INFO".equals(apiKey)){			//========================= 주는 프로세스 ==========================
				
				list = batchService.getCompanyList(map);		//회사정보
				result.put("ibCompanyInfoList", list);
				
				
			}else if("REQ_IB_CUSTOMER".equals(apiKey)){
					
				list = batchService.getCustomerList(map);		//인물(직원)정보
				result.put("ibCustomerList", list);
				
			}else if("REQ_IB_COMPANY_STOCK_HIST".equals(apiKey)){
				
				list = batchService.getStockPriceList(map);		//주가정보
				result.put("ibStockHistList", list);
				
			}else if("REQ_IB_COMPANY_VISIT_INFO".equals(apiKey)){
				
				list = batchService.getCpnVisitList(map);		//기업탐방정보
				result.put("ibCompanyVisitList", list);
				
			}else if("REQ_IB_PARTNER_INFO".equals(apiKey)){
				
				list = batchService.getPartnerList(map);		//파트너 회원정보
				result.put("ibPartnerList", list);
				
				
				
			}else if("REQ_RP_REPORT_REG".equals(apiKey)){		//========================= 받는 프로세스 ==========================
				
				//searchDate = map.get("searchDate").toString();			//정보날짜
				//list = batchService.getCpnVisitList(map);		//등용문리포트
			
				String report = map.get("report").toString();			//리포트 정보
				String fileList = map.get("fileList").toString();		//파일 리스트
				
				System.out.println("############report#########:::\n" + report);
				System.out.println("\n############fileList#########:::\n" + fileList);
				
				
				//report IF테이블 저장.
				Map<String, Object> reportMap = new ObjectMapper().readValue(report, Map.class);	//report 객체
				
				int ifReportId = batchService.insertReportIf(reportMap);
				
				int offerId =0;						//offerID
				int recommendId =0;					//만약 추천일때, 추천종목으로 등록된 offerID
				
				if(ifReportId>0){					//리포트 정상저장
					List<Map> newFileList = batchService.insertFileIf(fileList);
					
					//-------등용문 측 결과 전송 : report_if 와 file_if 저장 직후.
					
					result.put("successYN", 		"Y");
					result.put("failureMsg",		"");
					
					
					//--------------------- IF정보를 통해 IB 에 탐방리포트 등록 :S ----------------------
					try{
						//report_if 에 같은 report_seq로 저장된 가장 최근 데이터 가져오기
						reportMap.put("ifReportId", ifReportId);
						Map reportInfo = batchService.getBeforeIfInfo(reportMap);
						
						if(reportInfo != null && Integer.parseInt(reportInfo.get("offerId").toString())>0){		//등록된 건이 있다!
							
							reportMap.put("regYn", "Y");		//기 존재 여부('Y' : 수정건)
							reportMap.put("offerId", reportInfo.get("offerId")); 
						
						}else{	//등록 건이 없으면 신규 등록으로
							reportMap.put("regYn", "N");		//기 존재 여부('N' : 신규등록건)
							reportMap.put("offerId", "-1");
						}
						
						//---- 탐방
						
						reportMap.put("offerCd", "00003");				//탐방   00003
						reportMap.put("infoCategory", "00008");			//분석의견 00008	
						
						offerId = batchService.saveIb(reportMap, newFileList);
						
						
						//-----추천종목 세팅
						
						reportMap.put("offerCd", "00013");				//추천종목   00013
						reportMap.put("infoCategory", "");
						
						if(reportInfo != null && !reportInfo.get("recommendId").equals("0")){	//이미 추천종목으로 등록되있고
							reportMap.put("regYn", "Y");
							reportMap.put("offerId", reportInfo.get("recommendId"));
							
							if(reportMap.get("investRecommendYn").equals("Y")){					//투자추천임
								//업데이트
								recommendId = batchService.saveIb(reportMap, newFileList);
							}else{																//투자추천이아니면
								//삭제
								batchService.deleteIb(reportMap);
								recommendId=0;
							}
						}else{																	//등록되있지않음.
							if(reportMap.get("investRecommendYn").equals("Y")){					//투자추천임
								reportMap.put("offerId", "-1");
								//등록
								reportMap.put("regYn", "N");
								recommendId = batchService.saveIb(reportMap, newFileList);
							}
						}
						
					
						
						//리포트 IF 테이블에 저장한 아이디값 기록 
						Map resultUpdateMap = new HashMap();
						resultUpdateMap.put("offerId", offerId);
						resultUpdateMap.put("recommendId", recommendId);
						resultUpdateMap.put("reportSeq", reportMap.get("reportSeq"));
						resultUpdateMap.put("ifReportId", ifReportId);
						
						batchService.updateReportIf(resultUpdateMap);
						
						
					}catch(Exception e){
						e.printStackTrace();
						logger.debug("Fail IB_OFFER SAVE!!");
					}
					//--------------------- IF정보를 통해 IB 에 탐방리포트 등록 :E ----------------------
					
					
				}else{					//리포트 저장 실패
					result.put("successYN", 		"N");
					result.put("failureMsg",		"Report Save Fail!");
				}
				
				
			}else{
				
				System.out.println("!!!!!!!!222222!!!!!!");
			}
	
	
			//AjaxResponse.responseAjaxSelect(response, list);	//결과전송
			//response.setContentType("text/html;charset=UTF-8");
			//PrintWriter out = response.getWriter();
			
			
			//Gson gson = new GsonBuilder().serializeNulls().create();
			
			result.put("successYN", 		"Y");
			result.put("failureMsg",		"");
			
		
			//out.print(gson.toJson(result));
			return result;
				
		}catch(Exception e){
			
			logger.error("등용문 연계 에러", e);
			
			result.put("successYN", 		"N");
			result.put("failureMsg",		"ERROR");
			return result;
			
		}

	}
	
	
	
	
	
	//테스트용
	@RequestMapping(value = "/batch/sendVisitInfo.do")
	public void sendVisitInfo(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,Object> map) throws Exception {

try{
		//Spring Rest Template.....
        RestTemplate restTemplate = new RestTemplate();

        //Ib System 의 api url
        String url = "http://192.168.0.5:8080/IBsystem/rest/api.do";

        
        //등용문에서 요청 정보를 넘기기 위한 맵...
        Map<String,Object> reqMap = new HashMap<String,Object>();
       
        reqMap.put("apiKey",		"REQ_RP_REPORT_REG" );
        reqMap.put("searchDate",	"2016-01-20");

        reqMap.put("reportSeq",		"341");
        String report = "{" +
			"\"reportSeq\":\"341\""					+
			",\"userNm\":\"시스템관리자\""			+
			",\"title\":\"[가온미디어] 234\""			+
			",\"content\":\"리포트 내용입니다.\""		+
			",\"privateInfo\":\"\""					+
			",\"corpNm\":\"가온미디어\""				+
			",\"corpInfoSeq\":\"1380\""				+
			",\"ibUserId\":\"75\""					+
			",\"empNm\":\"\""						+
			",\"empMstrSeq\":\"\""					+
			",\"analDt\":\"2016-08-29\""			+
			",\"analCommentCd\":\"POSITIVE\""		+
			",\"analValidTermCd\":\"MONTH_3\""		+
			",\"appraisalDt\":\"2016-11-29\""		+
			",\"visitDt\":\"\""						+
			",\"visitAreaCd\":\"\""					+
			",\"ibReportSeq\":\"\""					+
			",\"investRecommendYn\":\"N\""			+
			",\"investDecisionYn\":\"N\""			+
			",\"atchFileGrpSeq\":\"\""			+		//",\"atchFileGrpSeq\":\"460\""			+
			",\"cudFlag\":\"U\"}";
        
        reqMap.put("report",	report);
        
        
        String fileList = "["							+
			"{\"atchFileSeq\":\"1691\""					+
			",\"atchFileGrpSeq\":\"460\""				+
			",\"fileTypeCd\":\"REPORT\""				+
			",\"mimeType\":\"application/pdf\""			+
			",\"ext\":\"PDF\""							+
			",\"volume\":\"767231\""					+
			",\"fileOrgnNm\":\"test.pdf\""				+
			",\"filePhysNm\":\"1472462143278.pdf\""		+
			",\"path\":\"D:attchfilereportREPORT201608\""	+
			",\"cudFlag\":\"U\"}"						+
		     "]";
        
        reqMap.put("fileList",	fileList);
        
        
        //application/json ; utf-8;
        HttpHeaders headers = new HttpHeaders();
        //Charset utf8 = Charset.forName("UTF-8");
        //MediaType mediaType = new MediaType("application", "json");
        headers.setContentType(MediaType.APPLICATION_JSON);
        /*List tmp = new ArrayList();
        tmp.add(new MediaType("application", "json", utf8));
        headers.setAccept(tmp);*/
        
        
        
        HttpEntity<Map<String, Object>> entity = new HttpEntity<Map<String, Object>>(reqMap, headers);

        
        //호출 ...리턴 제이슨을 스트링으로 받는다.
        Map returnMap =  restTemplate.postForObject(url, entity, Map.class);
	
        
        System.out.println("ibReportSeq::::" + returnMap.get("ibReportSeq"));
        
        
}catch(Exception e){
	e.printStackTrace();
	throw e;
}
	}
	
	
	
	
	
	@RequestMapping(value = "/batch/getCpn.do")
	public void getCpn(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, ModelMap model,
			@RequestParam Map<String,Object> map) throws Exception {

try{
		//Spring Rest Template.....
        RestTemplate restTemplate = new RestTemplate();

        //Ib System 의 api url
        String url = "http://192.168.0.91:8080/IBsystem/batch/getCompanyInfo.do";

        
        //등용문에서 요청 정보를 넘기기 위한 맵...
        Map<String,Object> reqMap = new HashMap<String,Object>();
       
        reqMap.put("apiKey",	"REQ_IB_CORP_INFO" );
        reqMap.put("searchDate","2016-01-20");

        
        //application/json ; utf-8;
        HttpHeaders headers = new HttpHeaders();
        //Charset utf8 = Charset.forName("UTF-8");
        //MediaType mediaType = new MediaType("application", "json");
        headers.setContentType(MediaType.APPLICATION_JSON);
        /*List tmp = new ArrayList();
        tmp.add(new MediaType("application", "json", utf8));
        headers.setAccept(tmp);*/
        
        
        
        HttpEntity<Map<String, Object>> entity = new HttpEntity<Map<String, Object>>(reqMap, headers);

        
        //호출 ...리턴 제이슨을 스트링으로 받는다.
        Map returnMap =  restTemplate.postForObject(url, entity, Map.class);
	
        
        System.out.println("ibCompanyInfoList::::" + returnMap.get("ibCompanyInfoList"));
        
        
}catch(Exception e){
	e.printStackTrace();
	throw e;
}
	}
	
	
}