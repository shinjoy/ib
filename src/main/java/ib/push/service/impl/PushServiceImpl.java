package ib.push.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import ib.basic.web.UtilReplaceTag;
import ib.cmm.service.CommonService;
import ib.push.service.PushService;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;



@Service("pushService")
public class PushServiceImpl implements PushService{ 
	
	@Resource(name="pushDAO")
    private PushDAO pushDAO;
	
	@Resource(name="commonService")
    private CommonService commonService;
	
	//push 정보 업데이트 bs_user_profile
	public int updateUserProfileToPushInfo(Map<String, Object> map)throws Exception {
		
		int cnt =0;
		pushDAO.updateUserProfileToPushInfo(map);
		cnt =1;
		
		return cnt;
	}
	
	//push 받을 유저 정보 리스트
	public int insertPushLogSearchSabunList(Map<String, Object> map) throws Exception {
		
		
		/*
		 * param 
		 * 
		 * 유저 :  다중 사번 보낼때 sabunList / 단일 유저아이디 : usrId 로그인아이디.
		 * 필수 파라미터 (rgUserId : 보낸이, pushType : 푸시타입, pushTypeId : 푸시 보낸 글의 키값 )
		 *  
		 *  
		*/
		
		
		Integer returnInt = -9;
		
		try{
			
			map.put("forPush", "Y");
			map.put("pushType", map.get("pushType").toString());
			
			List userList = commonService.getStaffListNameSortForObjectMap(map);
			map.put("userList", userList);
			returnInt=insertPush(map);
			
			
		}catch(Exception e){
			System.out.println(e.getMessage());
			
		}
		
		return returnInt;
		
	}
	
	//DB LOG 기록 및 발송 
	public int insertPush(Map<String, Object> map) throws Exception {
		
		int cnt = 0;
		List <Map<String, Object>>userList = (List) map.get("userList");
		
		Map param = new HashMap();
		
		param.put("pushType", map.get("pushType").toString());
		param.put("pushTypeId", map.get("pushTypeId").toString());
		param.put("content", map.get("content").toString());
		param.put("sendId", map.get("rgUserId").toString());
	
		
		for(int i=0; i<userList.size(); i++){
			Map objMap = userList.get(i);
			
			String userId = objMap.get("userId").toString();
			
			//본인아닐때만
			if(map.get("sendMeYn")==null && userId.equals(map.get("rgUserId").toString())) continue;
			else{
				
			
				param.put("recvId", userId);
				JSONObject resultObj = null;
				//발송
				int sndPushChk =0;		//보낸 결과값
				String errMsg = "";		//exception 시 내용 
				
				try{
					resultObj = pushFCMNotification(objMap.get("deviceToken").toString(),objMap.get("deviceType").toString(), 
							map.get("content").toString(),map.get("pushTypeId").toString(),Integer.parseInt(objMap.get("badgeCnt").toString()));
					
					if(resultObj != null){
						sndPushChk = Integer.parseInt(resultObj.get("success").toString());
						
						int fail = Integer.parseInt(resultObj.get("failure").toString());
						
						//실패시 
						if(fail > 0){
							String err = resultObj.get("results").toString(); 
							errMsg = err;
						}
					}
				
				}catch(Exception e){
					errMsg = e.getMessage().toString();
					System.out.println(e.getMessage());
				}
				
				param.put("sendResult", sndPushChk);
				param.put("errMsg", errMsg);
				
				cnt = pushDAO.insertPushLog(param);
			}
		
		}
	
		return cnt;
	}
	
	//나의 알림 리스트 
	public List<Map> getAlarmList(Map<String, Object> map) throws Exception {
		
		return pushDAO.getAlarmList(map);
	}
	
	//알람 상태 업데이트
	public int updateAlarmReadStatus(Map<String, Object> map) throws Exception {
		
		return pushDAO.updateAlarmReadStatus(map);
	}
	
	//발송 
	public JSONObject pushFCMNotification(String userDeviceIdKey,String userDeviceType,String content,String key,int badgeCnt)throws Exception {
		
		
		int result = 0;
		
		String authKey ="";
		if(userDeviceType.equals("IOS")){
			 
			authKey ="AAAAyQoaHcg:APA91bGmnk7auEPvQqf_Lxfasz_IN67HupJ6t6cWrEz8cUnWalr9on0vcBzVUMVSvZXHqRyvC0ZY4e_eAgB03DgtjVFvObu2_AfREGM7iCQFkIA3Sm9dk1xiI9cdwqTYY3WkAs7z2niq";
		}else{
			authKey ="AAAAN2_lsJE:APA91bFGMpCMt4w4wiUy6XSXDEX3ID8ojKMU6ehPlSDLJZq3Kv2I-6TM51L93kIyJxVinyDcrI6FEhS2qOCX9t8TnRTrevlnKykKE7wlokd0AhsgjYg8IcmPaQalascLAR6g3LymO3Gk";
		}
		
		// You FCM AUTH key
        String FMCurl = "https://fcm.googleapis.com/fcm/send";

        URL url = new URL(FMCurl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        conn.setUseCaches(false);
        conn.setDoInput(true);
        conn.setDoOutput(true);
        conn.setRequestMethod("POST");
        
        conn.setRequestProperty("Authorization", "key=" + authKey);
        conn.setRequestProperty("Content-Type", "application/json;charset=utf-8");

        JSONObject json = new JSONObject();
        JSONObject info = new JSONObject();
     
        info.put("content_available", true); 	// Notification body --  ios  background 호출   
        info.put("body", content); 				// Notification body
        info.put("message_body", content); 		// Notification body
        info.put("badge", badgeCnt+1); 			// 뱃지 카운트
        info.put("key", key); 					// Notification body
        info.put("sound", true); 					// Notification body

        //IOS 면 notification 으로 and 면 data
        if(!(userDeviceType.toUpperCase()).equals("IOS")) json.put("data", info);
        else json.put("notification", info);
        
        json.put("to", userDeviceIdKey.trim()); // deviceID
        System.out.println(json.toString());
        OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream(),"UTF-8");
        // 파라미터를 wr에 넣어주고 flush
	    wr.write(json.toString());
	    wr.flush();
	    
        if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
            throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
        }

        BufferedReader br = new BufferedReader(new InputStreamReader(
                (conn.getInputStream())));

        String output;
        JSONObject jsonObj = null;
        
        while ((output = br.readLine()) != null) {
        
        	jsonObj = JSONObject.fromObject(output);
        	System.out.println(jsonObj.toString());
        	//result = Integer.parseInt(jsonObj.get("success").toString());
        	
        }

        conn.disconnect();
        
        return jsonObj;
    }

	//안읽은 푸시 갯수
	public int getBadgeCount(Map<String, Object> map) throws Exception {
		
		return pushDAO.getBadgeCount(map);
	}
	
	
	
	
	
	
	
	
	
	
}
