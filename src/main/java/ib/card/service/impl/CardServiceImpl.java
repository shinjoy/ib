package ib.card.service.impl;

import ib.basic.web.UtilReplaceTag;
import ib.card.service.CardService;
import ib.card.service.CardVO;
import ib.cmm.service.impl.CommonDAO;
import ib.crm.admin.service.impl.AdminDAO;
import ib.schedule.service.impl.LoginDAO;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.baroservice.ws.BaroService_CARDSoap;
import com.baroservice.ws.BaroService_CARDSoapProxy;
import com.baroservice.ws.CardLog;
import com.baroservice.ws.PagedCardLog;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("cardService")
public class CardServiceImpl extends AbstractServiceImpl implements CardService {
	
	@Resource(name="cardDAO")
	CardDAO cardDao;
	
	@Resource(name="commonDAO")
	CommonDAO commonDao;
	
	@Resource(name="loginDAO2")
	LoginDAO loginDao;
	
	//최초 데이터 년도 조회
	public String selectMinYear(Map<String, Object> map) throws Exception {
		return cardDao.selectMinYear(map);
	}
	//지출 조회
	public List<Map> selectCardList(Map<String, Object> map) throws Exception {
		List<Map> cardList = new ArrayList();
		List<Map> list = (List<Map>) new ArrayList();  // return map
		cardList = cardDao.selectCardList(map);
		if(cardList.size() > 0){  // 데이터가 있는 경우 실행
			Integer chkEtcNum;  // 외 n명
			String chkExtraName = "";  // 외 text 
			Integer sNb ;
			Map<String,Object> pMap = new HashMap <String, Object>();  // 조회할 param map
			Map<String,Object> map2 = new HashMap <String, Object>();
			Integer reEtcNum = 0;
			
			for(int i = 0; i < cardList.size(); i++){
				chkEtcNum = Integer.parseInt(cardList.get(i).get("etcNum").toString());
				map2 = cardList.get(i);
				// excNum or extraName null 인경우 > IB_CARD_USED_CUSTOMER 에 들어있는 데이터 가져오기
				if( chkEtcNum == 0 || chkEtcNum == null || chkExtraName == null ){
					sNb =  Integer.parseInt(cardList.get(i).get("sNb").toString());
					pMap.put("sNb", sNb);
					list = selectCardUsedCustomerList(pMap);
					if(list.size() > 0){  // IB_CARD_USED_CUSTOMER에 데이터 있는 경우 etcNum, extraName input
						String reExtraName = "";
						String reCstSnbStr = "";
						String reCpnNm = "";
						int reCstSnb = 0;
						for(int j = 0; j<list.size(); j++){  // str 
							reExtraName = reExtraName + (String) list.get(j).get("cstNm");
							reCpnNm = (String) list.get(0).get("cpnNm");    //  회사 이름
							reCstSnb = Integer.parseInt(list.get(j).get("cstSnb").toString()); //  고객 snb
							reCstSnbStr = reCstSnbStr + reCstSnb;
							if(j != list.size()-1){
								reExtraName = reExtraName + ",";
								reCstSnbStr = reCstSnbStr + ",";
							}
						}
						reEtcNum = list.size()-1;
						map2.put("etcNum", reEtcNum);  //
						map2.put("extraName", reExtraName);
						map2.put("cpnNm", reCpnNm);
						//map2.put("cstSnb", reCstSnb);
						map2.put("cstSnb", reCstSnbStr);
					}
				}
			}
		}
		return cardList;
	}
	//지출 참가자 조회
	public List<Map> selectCardUserList(Map<String, Object> map)throws Exception {
		return cardDao.selectCardUserList(map);
	}
	//지출 소모품 조회
	public List<Map> selectCardMro(Map<String, Object> map) throws Exception {
		return cardDao.selectCardMro(map);
	}
	//지출 등록
	public int regCardUse(Map<String, Object> map) throws Exception {
		int sNb = Integer.parseInt(map.get("sNb").toString());	  //지출 등록 후 시퀀스
		
		String chk ="";		
		if(sNb == 0){							//지출 등록 -> 신규
			chk = "add";
			sNb = cardDao.insertCardUse(map);  // ib_card_used insert
			
			/*==================================법인카드사용내역 업데이트  : S================================*/
			// 법인카드내역 등록건일 경우 지출등록 시퀀스값을 법인카드내역에 함께 등록한다.
			if( !map.get("cardCorpSnb").equals("0") ){
				map.put("sNb", sNb);
				cardDao.updateCardCorpUse(map);
			}
			/*==================================법인카드사용내역 업데이트: E================================*/
		}else{								//수정
			updateCardUse(map);
		}
		/*지출에 포함된 직원 등록 - IB_CARD_USED_STAFF */
		if(sNb > 0){							//정상등록
			map.put("sNb", sNb);
			deleteCardUsedStaffList(map);	// 삭제후 (IB_CARD_USED_STAFF delete)
			String userListStr = (String)map.get("userListStr");
			if(!userListStr.equals("")){
				String [] userListArr = userListStr.split(",");
				for(int i = 0; i < userListArr.length; i++){
					try{
						map.put("cstSabun", userListArr[i]);
						insertCardUsedStaffListBysabun(map);  // 재등록 (IB_CARD_USED_STAFF insert)
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}
		}
		
		// 지출에 포함된 회사/고객 등록 - IB_CARD_USED_CUSTOMER
		if(sNb > 0){
			map.put("sNb", sNb);
			deleteCardUsedCustomerList(map);			// IB_CARD_USED_CUSTOMER delete
			String selCstListStr = (String)map.get("selCstListStr");   // card_s_nb str
			
			if(!selCstListStr.equals("")){
				String [] cstListArr = selCstListStr.split(",");
				for(int i = 0; i < cstListArr.length; i++){
					try{
						map.put("cstSnb", cstListArr[i]);
						insertCardUsedCustomer(map);  // 재등록 (IB_CARD_USED_CUSTOMER insert)
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}
		}
		
		/*==================================feedback 입력 : S============================*/
		String memo = "";
		if(chk.equals("add")){							//신규 등록일때만 feedback 입력
			map.put("cardSnb", map.get("sNb"));
			map.put("useDate", map.get("tmDt"));
			List<Map>userList = selectCardUserList(map);
			//등록된 참가자가 있고, 야근 혹은 점심 직원일때
			if(userList !=null && userList.size()>0 && (map.get("dv").equals("60") || map.get("dv").equals("55"))){			
				if(map.get("dv").equals("60")){			//야근 등록일때
					for(int i=0;i<userList.size();i++){
		    			String leaveTime = (userList.get(i).get("leaveWorkTime")).toString();
		    			if(leaveTime.equals("")){											//퇴근기록이없거나
		    				memo +=userList.get(i).get("cstNm")+", ";
		    			}else if(Integer.parseInt(leaveTime.replaceAll(":",""))<210000){	//9시이전 퇴근
		    				memo +=userList.get(i).get("cstNm")+", ";
		    			}
					}
				}
				if(!memo.equals("")){														//야근일때만...
					memo +=" 퇴근시간 미준수(9시 이전)";
				}
				if(Integer.parseInt(map.get("price").toString())/userList.size()>10000){ 	//금액초과
	    			memo +=" 1인 식대초과(1인당 1만원 지원)";
	    		}
			}
			if(!memo.equals("")){
	    		CardVO cardVO= new CardVO(); 
	    		cardVO.setFeedback("S : "+memo);
	    		cardVO.setsNb(map.get("sNb").toString());
	    		cardDao.updateCardFeedback(cardVO);			//feedback 입력
    		}
		}
		/*==================================feedback 입력 : E============================*/
		
		/*==================================소모품 입력  : S================================*/
		delectCardMro(map);	//삭제 후
		if(!map.get("supplies").equals("") && map.get("dv2").equals("6000") && sNb>0){	//구매내역이 있고, 소모품비 일때,정상등록일때
			
			JSONObject suppliesObj = JSONObject.fromObject(map.get("supplies"));		//supplies 라는 파라미터로 넘어온 소모품 str 를 obj로
			JSONArray suppliesObjList = suppliesObj.getJSONArray("items");				//obj 에 키(items) 을 array로
			Map<String,Object>suppliedMap = new HashMap();
			suppliedMap.put("sNb", sNb);
			for(int i=0;i<suppliesObjList.size();i++){
				JSONObject supplies=(JSONObject)suppliesObjList.get(i);
				String code = supplies.getString("code");
				String name = supplies.getString("name");
				String count = supplies.getString("count");
				String price = supplies.getString("price");
				suppliedMap.put("mroCode", code);	//현재 사용하지 않음.
				suppliedMap.put("mroName", name);
				suppliedMap.put("qty", count);
				suppliedMap.put("price", price);
				try{
					sNb=insertCardMro(suppliedMap);	//등록
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		
		/*==================================소모품 입력  : E================================*/
		
		
		
		return sNb;
	}
	//지출 수정
	public void updateCardUse(Map<String, Object> map) throws Exception {
		cardDao.updateCardUse(map);
	}
	//피드백 수정
	public int updateCardFeedback(CardVO cardVO) throws Exception {
		return cardDao.updateCardFeedback(cardVO);
	}
	//지출 삭제
	public void deleteCardUse(Map<String, Object> map) throws Exception {
		cardDao.deleteCardUse(map);
	}
	//지출 참가자 등록
	public int insertCardUsedStaffListBysabun(Map<String, Object> map)throws Exception {
		return cardDao.insertCardUsedStaffListBysabun(map);  //등록;
	}
	//지출 참가자 삭제
	public void deleteCardUsedStaffList(Map<String, Object> map)throws Exception {
		 cardDao.deleteCardUsedStaffList(map);  //등록;
	}
	
	
	//지출 회사/고객 등록
	public int insertCardUsedCustomer(Map<String, Object> map)throws Exception {
		return cardDao.insertCardUsedCustomer(map);  // ib_card_used_customer
	}
	// 지출 회사/고객 조회
	public List<Map> selectCardUsedCustomerList(Map<String, Object> map) throws Exception{
		return cardDao.selectCardUsedCustomerList(map);
	}
	//지출 회사/고객 삭제
	public void deleteCardUsedCustomerList(Map<String, Object> map)throws Exception {
		 cardDao.deleteCardUsedCustomerList(map);  //등록;
	}
	
	
	
	
	//지출 소모품 등록
	public int insertCardMro(Map<String, Object> map) throws Exception {
		return cardDao.insertCardMro(map);
	}
	//지출 소모품 삭제
	public void delectCardMro(Map<String, Object> map) throws Exception {
		cardDao.delectCardMro(map);
	}
	//통계 dv
	public List<Map> selectDvCardStatistics(Map<String, String> map) throws Exception {
		return cardDao.selectDvCardStatistics(map);
	}
	//통계 dv2
	public List<Map> selectDv2CardStatistics(Map<String, String> map) throws Exception {
		return cardDao.selectDv2CardStatistics(map);
	}
	//통계 월별
	public List<Map> selectMonthCardStatistics(Map<String, String> map) throws Exception {
		return cardDao.selectMonthCardStatistics(map);
	}
	
	// 바로빌 법인카드 서비스 
	
	// 법인카드 사용내역 등록
	public int insertCardCorpUsed(String baseDate) throws Exception{
		
		// 법인카드 정보 조회 - 개발		
		/*
		String CERTKEY = "31A762E6-717A-49E1-BA8E-095E52AB6F0C";			//개발 인증키
		String CERTKEY = "A34D1994-FB10-43FF-A4DD-08DA06829220"; //운영 인증키
		String CorpNum = "2648132143";			//연계사업자 사업자번호 ('-' 제외, 10자리)
		String ID = "synergyib";					//연계사업자 아이디
		String CardNum = "5585269202584838";			//카드번호
		*/
		
		// 법인카드 정보 조회 - 운영(DB로 뺌. 기록차 남겨둠)		
		//String CERTKEY = "A34D1994-FB10-43FF-A4DD-08DA06829220"; //운영 인증키
		//String CorpNum = "2648132143";			//연계사업자 사업자번호 ('-' 제외, 10자리)
		//String ID = "synerib";					//연계사업자 아이디
		//String CardNum = "5585269202584838";			//카드번호	
				
		int CountPerPage = 50;			//페이지당 갯수
		int CurrentPage = 1;			//현재페이지

		try{	
			// DB에 등록되어 있는 법인카드 정보 리스트
			// 카드번호, 사업자번호, 인증키, 로그인ID 등
			List<Map> cardInfoList = cardDao.selectCardCorpInfoList();
			
			// 카드 승인/취소에 대한 판별을 하는 문자셋
			// 바로빌에서 넘어오는 데이타가 규칙적이지 못하고 카드승인건에 대해 승인 or 정상 과 같이 
			// 다르게 데이타가 넘어오는 경우가 있어서 규칙을 만들기 위한 과정중 하나로 보면 됨
			List<Map> cardCorpStatusCode = cardDao.selectCardCorpStatusCode(); 
			Map<String,String> statusCodeMap = new HashMap<String,String>();
			for (Map<String, String> vMap : cardCorpStatusCode) {
				statusCodeMap.put(vMap.get("statusMsg"),vMap.get("statusCode"));
			}
			
			for(int cardIdx = 0; cardIdx < cardInfoList.size(); cardIdx++){
				Map<String, String> cardInfo = cardInfoList.get(cardIdx);

				// 바로빌로부터 법인카드 사용내역 조회하기
				BaroService_CARDSoap BS_CARD = new BaroService_CARDSoapProxy();
				
				// 카드정보 조회해서 승인내역 조회할 카드만큼 반복처리				
				PagedCardLog cardLog = BS_CARD.getCardLog(
						cardInfo.get("certKey"), 	// 인증키
						cardInfo.get("corpNum"), 	// 사업자번호
						cardInfo.get("loginId"),	// 바로빌 로그인 ID
						cardInfo.get("cardNum"), 	// 카드번호
						baseDate, CountPerPage , CurrentPage);				
		
				int errorCode = cardLog.getCurrentPage();
				Map<String,Object> logMap = new HashMap<String, Object>();
				
				if (errorCode < 0) { //실패
					logMap.put("cardNum", cardInfo.get("cardNum"));
					logMap.put("usedCount", 0);
					logMap.put("approvalDate", 0);
					logMap.put("successFlag", "N");
					logMap.put("errorCode", errorCode); 
					
					cardDao.insertCardCorpLog(logMap);
					System.out.println("## Fail Code : " + errorCode);
					// 실패시 DB에 로그 남기기
				} else { //성공
					
					System.out.println("## *********PageInfo********* ##");
					System.out.println("## MaxPageNum : " + cardLog.getMaxPageNum());
					System.out.println("## MaxIndex : " + cardLog.getMaxIndex());
								
					int maxPageNum = cardLog.getMaxPageNum();
					int nTotalCount = 0;
					
					// 페이지 정보를 먼저 가져온 다음 페이지수만큼 루프를 돌면서 처리함
					for(int pageIdx = 0; pageIdx < maxPageNum; pageIdx++ ){
						
						cardLog = BS_CARD.getCardLog(
								cardInfo.get("certKey"), 
								cardInfo.get("corpNum"), 
								cardInfo.get("loginId"),
								cardInfo.get("cardNum"), 
								baseDate, CountPerPage , pageIdx+1);
						
						CardLog[] cardLogList = cardLog.getCardLogList();
						System.out.println("## LogList : " + cardLogList.length);
						
						for(CardLog log : cardLogList){
							// 테이블에 카드 사용내역 Insert 구문 넣기							
							Calendar dt = Calendar.getInstance();
														
					        SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMddHHmmss");
					        Date to = transFormat.parse(log.getUseDT()); 
							dt.setTime(to);
							
							/*
							System.out.println("## ************************* ##");
							System.out.println("## 카드번호 : " + log.getCardNum());
							
							System.out.println("## 사용시간 : " + log.getUseDT());
							
							System.out.println("## 년 : " + dt.get(Calendar.YEAR));
							System.out.println("## 월 : " + (dt.get(Calendar.MONTH) + 1));
							System.out.println("## 일 : " + dt.get(Calendar.DATE));
							System.out.println("## 시각 : " + dt.getTime());
							
							System.out.println("## 공급가액 : " + log.getAmount());
							System.out.println("## 부가세 : " + log.getTax());
							System.out.println("## 봉사료 : " + log.getServiceCharge());							
							System.out.println("## 합계금액: " + log.getTotalAmount());
							System.out.println("## 카드승인금액 : " + log.getCardApprovalCost());
							
							System.out.println("## 가맹점 : " + log.getUseStoreName());
							System.out.println("## 가맹점번호 : " + log.getUseStoreNum());
							System.out.println("## 카드승인번호 : " + log.getCardApprovalNum());
							System.out.println("## 카드승인형태 : " + log.getCardApprovalType());
							*/
							
							Map<String, Object > map = new HashMap<String, Object>();
							map.put("cardCorpId", log.getCardNum() + "_" + log.getCardApprovalNum());
							map.put("corpNum", log.getCorpNum());
							map.put("cardNum", log.getCardNum());
							map.put("year", dt.get(Calendar.YEAR));
							map.put("month", dt.get(Calendar.MONTH) + 1);
							map.put("tmDt", log.getUseDT());
							
							// IB_CARD_CORP_STATUS_CODE 코드값 조회해 상태값 맵핑
							// 승인에 대한 코드값 존재하지 않는 경우 무조건 Y로 등록
							if( statusCodeMap.containsKey(log.getCardApprovalType())){
								map.put("approvalYn", statusCodeMap.get(log.getCardApprovalType()));
							}
							else{
								map.put("approvalYn", "Y");
							}
							
							map.put("approvalType", log.getCardApprovalType());
							map.put("approvalCost", log.getCardApprovalCost());
							map.put("approvalNum", log.getCardApprovalNum());							
							map.put("placeNum", log.getUseStoreNum());
							map.put("placeName", log.getUseStoreName());						
							map.put("statusFlag", "N");					
							
							cardDao.insertCardCorpUsed(map);
							nTotalCount++;
						}
					}
					
					logMap.put("cardNum", cardInfo.get("cardNum"));
					logMap.put("usedCount", nTotalCount);
					logMap.put("successFlag", "Y");
					logMap.put("errorCode", 0);
					cardDao.insertCardCorpLog(logMap);					
				}				
			}			
		} 
	
		catch(Exception ex){
			System.out.println(ex.getMessage());
			System.out.println(ex.getStackTrace());
		}
		finally{
			
		}
		
		return CurrentPage;
	}
	
	// 법인카드 등록정보 조회
	public List<Map> selectCardCorpInfoList() throws Exception{
		return cardDao.selectCardCorpInfoList();
	}	

	// 법인 정보 조회
	public List<Map> selectCorpInfoList() throws Exception{
		return cardDao.selectCorpInfoList();
	}

	// 법인카드 사용내역 리스트 조회
	public Map<String, Object> selectCardCorpUsedList(Map<String, Object> map) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try{
			List<Map> resultList = cardDao.selectCardCorpUsedList(map);
			int resultVal = resultList.size();
			
			resultMap.put("resultVal", resultVal);		
			resultMap.put("resultList", resultList);
			resultMap.put("pageNo", "1");
			resultMap.put("pageCount", "1");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultMap;
	}
	
	// 법인카드 내역 삭제
	public void deleteCardCorpUsed(Map<String, Object> map) throws Exception{
		cardDao.deleteCardCorpUsed(map); 
	}
	
	
	//일정 조회 (법인카드 사용내역 지출 등록)
	public List<Map> selectScheList(Map<String, Object> map) throws Exception {		
		return cardDao.selectScheList(map);
	}
	
	/**
	 * 처리되지 않은 법인카드 사용내역을 조회/처리	
	 * @param 
	 * @return 
	 */	
	public void checkCardCorpUnregList() throws Exception{
		
		try{
			Calendar oCalendar = Calendar.getInstance( );  // 현재 날짜/시간 등의 각종 정보 얻기
			
			// 월요일(2) 혹은 휴일일 경우 Skip
			if( oCalendar.get(Calendar.DAY_OF_WEEK) == 2 || isHolidayToday()) {
				System.out.println("## Today is Monday or holiday!!");
				return;
			}
						
			// 처리되지 않은 법인카드 사용내역 조회
			List<Map> resultList = cardDao.getCardCorpUnregList();
			
			// 휴가자 목록 조회
			List holiPerList = loginDao.GetHoliPerList();
			
			StringBuilder phoneList = new StringBuilder();		
			for(int idx = 0; idx < resultList.size(); idx++ ){
				Map result = resultList.get(idx);
				
				// 휴가자일경우 Skip
				if( isHoliPer(holiPerList, result.get("sabun").toString())) {
					System.out.println("## HoliPerson!!");
					continue;				
				}
				
				// 화, 수요일 체크해서 미등록건에 대해 SMS 전송 번호 등록				
				// 휴일 껴있는 경우 그 다음 워킹데이에 SMS 전송
				int cnt = Integer.parseInt(result.get("cnt").toString());
				//휴대폰번호 조회, '-' 없애기
				String phoneNumber = result.get("cellphone").toString().replaceAll("-", "");
				boolean bSended = checkSmsSendToday(phoneNumber);
				String userId = result.get("usrid").toString();
				
				if( cnt < 2 ){
					// 기록						
					cardDao.insertCardCorpUsedStatus(result);
					
					// 오늘 SMS 발송된 내역이 있는 경우 Skip					
					if( bSended == false && phoneList.indexOf(phoneNumber) < 0 ){						
						// 폰번호 Insert
						phoneList.append(phoneNumber);
						phoneList.append(",");
						
						// SMS 전송 로그 기록
						HashMap<String, String> smsLogParam = new HashMap<String, String>();
						smsLogParam.put("sendNumber", "025865981");
						smsLogParam.put("recvNumber", phoneNumber);
						smsLogParam.put("usrId", userId);
						
						smsLogParam.put("smsContent", "[시너지]법인카드 미등록건 처리 부탁드립니다!");
						cardDao.insertCardCorpSmsLog(smsLogParam);
					}
				}
				
				// 만료일 이후 지연입력 2회일 경우 지연입력 페널티 처리
				if( cnt == 2 && bSended == true ){
					cardDao.updateCardCorpRegLateFlag(result);
				}
			}
			
			if( phoneList.length() > 0 ){
				String phoneNums = phoneList.toString();
				phoneNums = phoneNums.substring(0, phoneNums.length() - 1);	
				System.out.println("## PhoneNumbers : " + phoneNums);
				
				// SMS 전송
				System.out.println("## SMS Send Start ##");
				sendSmsCardCorpUnreg(phoneNums);
				System.out.println("## SMS Send End ##");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	// 당일 법인카드 사용내역 등록 권고 SMS 발신여부 체크
	boolean checkSmsSendToday(String phoneNumber){
		boolean bSended = false;
		
		try {
			Map result = cardDao.getCardCorpSmsLog(phoneNumber);
			int sendCount = Integer.parseInt(result.get("sendCount").toString());
			if( sendCount > 0 ) bSended = true; 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return bSended;
	}
	
	// 법인카드 미등록자에게 SMS 문자 메시지 일괄 전송
	public void sendSmsCardCorpUnreg(String phoneNums) throws Exception{
		try{
			
			String startTime = "", indexCode = "", returnUrl ="";
			
			// ID, PASSWORD
			String uid ="synergy";
			String pwd ="00synergy00";
			
			// 전송타입
			String sendType = "3";
			
			// 수발신 번호등록
			String toNumber = phoneNums;			
			String fromNumber = "025865981";
			
			UtilReplaceTag rpTag = new UtilReplaceTag();
			String contents = URLEncoder.encode(rpTag.ReplaceTag("[시너지]법인카드 미등록건 처리 부탁드립니다!", "decode"), "UTF-8");			
			
			String returnType="1";
			String nType="2";
			
			String url = "https://biz.moashot.com/EXT/URLASP/mssendUTF.asp";

			URL obj = new URL(url);

			URLConnection conn = obj.openConnection();
			conn.setDoOutput(true);
			
			String urlParameters = "uid="+uid+"&pwd="+pwd+"&sendType="+sendType+"&toNumber="+toNumber+"&contents="+contents+"&fromNumber="+fromNumber;
		    urlParameters+="&startTime="+startTime+"&indexCode="+indexCode+"&returnType="+returnType+"&nType="+nType+"&returnUrl="+returnUrl;
		    
		    // 파라미터를 wr에 넣어주고 flush
		    OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		    wr.write(urlParameters);
		    wr.flush();
		    
		    // in에 readLine이 null이 아닐때까지 StringBuffer에 append
		    BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		    StringBuffer buffer = new StringBuffer();
		    String inputLine;
		    while ((inputLine = in.readLine()) != null) {
		         buffer.append(inputLine);
		    }
		    
		    in.close();
		    wr.close();
			

		}catch(Exception e){
			e.printStackTrace();
		}		
	}
	
	// 공휴일인지 체크 - 필요에 따라 공통유틸로 전환
	@SuppressWarnings("rawtypes")
	private boolean isHolidayToday() {
		try {
			Date d = new Date();	        
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Map result = cardDao.getHolidayStatus(sdf.format(d));
			
			// 휴일이거나 주말이거나
			if( result.get("holiflag").equals("Y") ||
				result.get("holiflag").equals("W")) return true;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	// 휴가 직원 리스트 조회 
	@SuppressWarnings({ "rawtypes", "unused" })
	private boolean isHoliPer(List holiPerList, String sabun){
		
		// 동일사번, 종일휴가(all) 조건일 경우에만 처리
		for(int idx = 0; idx < holiPerList.size(); idx++ ){
			Map holiPer = (Map) holiPerList.get(idx);
			if( holiPer.get("persabun").equals(sabun) && holiPer.get("holiflag").equals("all")){
				return true;
			}			
		}
		
		return false;
	}
	
}
