package ib.sms.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;













import ib.basic.web.UtilReplaceTag;
import ib.cmm.util.fcc.service.StringUtil;
import ib.sms.service.SmsService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("smsService")
public class SmsServiceImpl extends AbstractServiceImpl implements SmsService {

	 @Resource(name="smsDAO")
	 private SmsDAO smsDAO;

	public int insertSmsLog(Map<String, Object> map) throws Exception {

		int saveCnt =0;
		int smsId =0;	//sms id
		String content = map.get("content").toString();		//내용
	//	String type = map.get("type").toString();			//특별한 케이스인 경우 처리를 위해사용
		String strTemp = "";


		/*  SMSType				: 문자전송 타입
		 *  content				: 내용
		 *	userSabunList		: 받는이(직원) -여러명일경우 , 구분
		 *  recieveCustomerId	: 받는이(고객) -여러명일경우 , 구분
		 *  rgSabun				: 작성자
		 *  reserveDate			: 발송시간
		 *
		*/
		//sms.insertSms
		Map smsMap = new HashMap();
		smsMap.put("rgSabun",map.get("sabun")); 				//작성자(userId)
		smsMap.put("categoryType",map.get("categoryType").toString()); 	//카테고리 기존 0 업무일지 1
		
		String smsEndTelNo = "025865981";
		
		smsMap.put("smsEndTelNo", smsEndTelNo);

		if(content.length() > 80) smsMap.put("smsType","5");//문자전송 타입 : 3-단문문자, 5-LMS(장문문자), 6-MMS(이미지포함문자)
		else smsMap.put("smsType","3");
			
		strTemp +=content;
		strTemp = strTemp.replace("\r", "");
			
		smsMap.put("content",strTemp);						//문자 내용
		//smsMap.put("reserveDate",map.get("reserveDate"));	//문자발송시간

		String userSabunStr = (map.get("userSabunStr") == null ? "" :  map.get("userSabunStr").toString());
		String customerIdStr = (map.get("customerList") == null ? "" :  map.get("customerList").toString());
		
		String phoneNumberStr = (map.get("phoneNumberStr") == null ? "" :  map.get("phoneNumberStr").toString());

		String [] userSabunList = (userSabunStr.equals("") ? null : userSabunStr.split(","));								//sms 받을 사람들..(직원)
		String [] customerArr = (customerIdStr.equals("") ? null : (map.get("customerList").toString()).split(",")); 		//sms 받을 사람들..(고객)
		String [] phoneNumberList = (phoneNumberStr.equals("") ? null : (map.get("phoneNumberStr").toString()).split(",")); //sms 받을 사람들..(번호)
		
		//직원
		if(userSabunList !=null){
			for(int i=0;i<userSabunList.length;i++){
				if(!userSabunList[i].equals("")){
					
					smsMap.put("recieveSabun",userSabunList[i]);		//받는이
					
					try{

						smsId = smsDAO.insertSMS(smsMap);
						smsMap.put("smsId", smsId);
						sendSms(smsMap);


					}catch(Exception e){

						e.printStackTrace();
					}
				}
			}
		}
		
		//전화번호
		if(phoneNumberList !=null){
			for(int i=0;i<phoneNumberList.length;i++){
				if(!phoneNumberList[i].equals("")){
					
					smsMap.put("phoneNumber",phoneNumberList[i]);		//받는이
					
					try{

						smsId = smsDAO.insertSMS(smsMap);
						smsMap.put("smsId", smsId);
						sendSms(smsMap);


					}catch(Exception e){

						e.printStackTrace();
					}
				}
			}
		}

		//고객
		if(customerArr !=null){
			for(int i=0;i<customerArr.length;i++){
				if(!customerArr[i].equals("")){
					smsMap.put("recieveCustomerId",customerArr[i]);		//받는이
					try{
						smsId = smsDAO.insertSMS(smsMap);
						smsMap.put("smsId", smsId);
						sendSms(smsMap);

					}catch(Exception e){

						e.printStackTrace();
					}
				}
			}
		}
		

		return smsId;
	}

	//log 조회
	public List<Map> getSmsLogList(Map<String, Object> map) throws Exception{

		return smsDAO.getSmsLogList(map);
	}

	public int sendSms(Map<String, Object> smsMap){
		int chk=0;

		try{
			List<Map>list = getSmsLogList(smsMap);

			for(int i=0;i<list.size();i++){

					UtilReplaceTag rpTag = new UtilReplaceTag();
					StringBuffer buffer = new StringBuffer();
					String uid ="synergy";
					String pwd ="00synergy00";
					String sendType=list.get(i).get("smsType").toString();
					String toNumber=list.get(i).get("smsToNum").toString();
					String contents=rpTag.ReplaceTag(list.get(i).get("smsContent").toString(),"decode");
					contents=URLEncoder.encode(contents, "UTF-8");	//인코딩.
					String fromNumber=list.get(i).get("smsFromNum").toString();
					String startTime=list.get(i).get("smsReserTime").toString();
					String indexCode=list.get(i).get("smsSeq").toString();

					String returnType="1";
					String nType="2";


					String returnUrl ="";
					String url = "https://biz.moashot.com/EXT/URLASP/mssendUTF.asp";

					URL obj = new URL(url);

					URLConnection conn = obj.openConnection();

					String urlParameters = "uid="+uid+"&pwd="+pwd+"&sendType="+sendType+"&toNumber="+toNumber+"&contents="+contents+"&fromNumber="+fromNumber;
				    urlParameters+="&startTime="+startTime+"&indexCode="+indexCode+"&returnType="+returnType+"&nType="+nType+"&returnUrl="+returnUrl;
				    conn.setDoOutput(true);
				    OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
				    // 파라미터를 wr에 넣어주고 flush
				    wr.write(urlParameters);
				    wr.flush();
				    // in에 readLine이 null이 아닐때까지 StringBuffer에 append
				    BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				    String inputLine;
				    while ((inputLine = in.readLine()) != null) {
				         buffer.append(inputLine);
				    }
				    in.close();
				    wr.close();
			}

		}catch(Exception e){
			chk =-1;
		}
		return chk;
	}

	//sms 결과
	public void smsSendResult(HttpServletRequest req) throws Exception{

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		String Data = req.getParameter("data");				// 인덱스코드,전송결과값
		String SeqTemp = "";

		for(int i = 0; i < Data.split(",").length; i++) {
			Map<String, Object> paramTemp = new HashMap<String, Object>();

			if((i%2) == 0) SeqTemp = Data.split(",")[i];
			else {
				paramTemp.put("smsSeq", SeqTemp);
				paramTemp.put("smsSendFlag", Data.split(",")[i]);
			}
			paramTemp.put("smsSendTime", req.getParameter("send_start"));
			paramTemp.put("smsEndTime", req.getParameter("send_end"));
			if((i%2) == 1) smsDAO.smsSendResult(paramTemp);
		}


	}

}
