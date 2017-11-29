package ib.google.service.impl;

import ib.basic.web.Util;
import ib.dart.service.DartService;
import ib.google.service.GoogleCalendarService;
import ib.schedule.service.LoginVO;
import ib.schedule.service.impl.LoginDAO;
import ib.schedule.service.impl.ScheduleDAO;
import ib.schedule.service.impl.ScheduleVO;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.auth.oauth2.TokenResponse;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.auth.oauth2.GoogleRefreshTokenRequest;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.DateTime;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.CalendarScopes;
import com.google.api.services.calendar.model.CalendarList;
import com.google.api.services.calendar.model.CalendarListEntry;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventDateTime;
import com.google.api.services.plus.Plus;
import com.google.api.services.plus.model.Person;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("googleCalendarService")
public class GoogleCalendarServiceImpl extends AbstractServiceImpl implements GoogleCalendarService{ 
	@Resource(name = "loginDAO2") 
	private LoginDAO loginDAO;
	
	@Resource(name = "scheDAO")
	private ScheduleDAO scheduleDAO;
	
	protected static final Log logger = LogFactory.getLog(GoogleCalendarServiceImpl.class);
	
	private HttpTransport HTTP_TRANSPORT;
	private FileDataStoreFactory DATA_STORE_FACTORY;
	private JsonFactory JSON_FACTORY;
		 
	// 애플리케이션 이름
	private static final String APPLICATION_NAME = "Inside Google Calendar";

	// DB데이타로 이동 필요
	private String token_uri = "https://www.googleapis.com/oauth2/v4/token";
	private String client_id = "918864136875-pbl61quid1jmagffu2oor9dn28gknd4d.apps.googleusercontent.com";
	private String client_secret = "tl2qhDtCqJIdKo6mQaj4Zk1y";
	private String redirect_uri = "http://ib.synergynet.co.kr:8180/IBsystem/AuthGoogleRedirect.do";		
	
	// 
	/*
	 * 사용자별 인증정보 획득
	 * @parameter
	 * PerSabun : 사번
	 * @see sp.crm.admin.service.GoogleCalendarService#doUserAuthentication(java.util.Map)
	 */
	public boolean doAuthWithCode(Map param) throws IOException { 
		
		try {
			// synergyict001@gmail.com / tooza!@34 계정 google dev console
			// redirect URL 도메인 셋팅 필요
			Util.d("RedirectURI", redirect_uri);			
			GoogleTokenResponse tokenResponse =
		          new GoogleAuthorizationCodeTokenRequest(
		              new NetHttpTransport(),
		              JacksonFactory.getDefaultInstance(),
		              token_uri,
		              client_id,
		              client_secret,
		              param.get("code").toString(),
		              redirect_uri).execute();
			
			param.put("accessToken", tokenResponse.getAccessToken());			
			param.put("refreshToken", tokenResponse.getRefreshToken());
			param.put("authFlag", "Y");
			
			// 사용자 access token, refresh token 저장하기
			loginDAO.InsertGoogleTokenInfo(param);
			
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
		}

		return false;
	}
	
	/*
	 *  Credentail 획득
	 */
	public Credential GetCredential(Map map) throws Exception {
		/********************* GetCredential Start ***************************/
		Util.d("Log", "********************* GetCredential AccessToken Start ***************************");
		Map authInfo = loginDAO.GetGoogleAuthInfo(map);
		
		String accessToken = authInfo.get("accessToken").toString();		
		String refreshToken = authInfo.get("refreshToken").toString();
		
		boolean result = true;
		try{
			GoogleCredential credential = new GoogleCredential.
					Builder()
					.setTransport(new NetHttpTransport())
					.setJsonFactory(new JacksonFactory())
					.setClientSecrets(client_id, client_secret).build();		
					
			credential.setAccessToken(accessToken);
			credential.setRefreshToken(refreshToken);
			Util.d("Log", "********************* GetCredential AccessToken End ***************************");	
			return credential;
		}catch(Exception e){
			result = false;			
			e.printStackTrace();
		}
		
		if( result == false ){
			try{
				Util.d("Log", "********************* GetCredential RefershToken Start ***************************");
				TokenResponse response = new GoogleRefreshTokenRequest(new NetHttpTransport(), new JacksonFactory(),
						refreshToken,
						client_id,
			            client_secret).execute();
				
				// token 정보 갱신하기
				String token = response.getAccessToken();
				map.put("accessToken", token);				
				loginDAO.InsertGoogleTokenInfo(map);				
				GoogleCredential credential = new GoogleCredential().setAccessToken(response.getAccessToken());
				
				Util.d("Log", "********************* GetCredential RefershToken End ***************************");
				return credential;
			}catch(Exception e){
				e.printStackTrace();				
			}
		}
		
		return null;
	}
		

	
	/*
	 * 구글 사용자 oAuth 인증여부 조회
	 */	
	public boolean GetUserAuthStatus(Map param){
		// TODO Auto-generated method stub
		Map resultMap = null;
		
		try {
			resultMap = loginDAO.GetGoogleAuthInfo(param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return resultMap.get("authFlag").equals("Y") ? true : false;
	}
	
	
	/*
	 * 구글 사용자 인증정보 및 캘린더 정보 조회
	 */	
	public Map GetGoogleAuthInfo(Map param){  
		// TODO Auto-generated method stub
		Map resultMap = null;
		try {
			resultMap = loginDAO.GetGoogleAuthInfo(param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return resultMap;
	}

	/*
	 * 구글 이메일 정보를 조회해서 가져온다
	 * @see ib.google.service.GoogleCalendarService#UpdateGoogleEmail(java.util.Map)
	 */
	public void UpdateGoogleEmail(Map map) throws Exception {
		// TODO Auto-generated method stub
		Credential credential = GetCredential(map);
		
		try{
			/************************* email 조회 및 데이타 생성 : START ***************************/		
			Plus plusService = new Plus.Builder(new NetHttpTransport(), new JacksonFactory(), credential)
			.setApplicationName(APPLICATION_NAME).build();
			
			Person person = plusService.people().get("me").execute();
			Util.d("Person", person.toPrettyString());
			String email = person.getEmails().get(0).getValue();
			
			map.put("emailAddr", email);
			loginDAO.InsertGoogleEmail(map);
		
		}catch(Exception e){
			e.printStackTrace();
		}		
	}

	/*
	 *  구글캘린더 리스트를 조회해서 가져온다(non-Javadoc)
	 * @see ib.google.service.GoogleCalendarService#GetGoogleCalendarList(java.util.Map)
	 */
	public List GetGoogleCalendarList(Map map) throws Exception { 
		
		// TODO Auto-generated method stub
		Credential credential = GetCredential(map);
		
		/************************* 캘린더 조회 및 데이타 생성 : START ***************************/
		Calendar calendarService = 
				new Calendar.Builder(new NetHttpTransport(), new JacksonFactory(), credential)
				.setApplicationName(APPLICATION_NAME).build();
		
		List resultList = new ArrayList();		
		
		String pageToken = null;
		do {
		  CalendarList calendarList = calendarService.calendarList().list().setPageToken(pageToken).execute();
		  List<CalendarListEntry> items1 = calendarList.getItems();
		  
		  for (CalendarListEntry calendarListEntry : items1) {
			  // summary, id 맵 생성		
			  Map resultMap = new HashMap();
			  resultMap.put("gcal_id", calendarListEntry.getId());
			  resultMap.put("gcal_name", calendarListEntry.getSummary());			  
			  
			  resultList.add(resultMap);
		  }
		  
		  pageToken = calendarList.getNextPageToken();
		} while (pageToken != null);
		/************************* 캘린더 조회 및 데이타 생성 : END ***************************/
				
		return resultList;
	}

	/*
	 * 구글캘린더 일정 등록
	 * 인사이드 일정 등록시 정보를 이용해 구글캘린더에 등록한다
	 * @param
	 * loginVO : 사번, 로그인ID 필요
	 *   PerSabun : 사번
	 *   PerId : 로그인ID
	 * ScheduleVO : 스케쥴 정보 필요
	 * @see sp.crm.admin.service.GoogleCalendarService#InsertSchedule(sp.erp.schedule.service.impl.ScheduleVO)
	 */
	public boolean InsertSchedule(ScheduleVO vo, LoginVO loginVO) throws Exception {
		try{
			Map param = new HashMap();
			param.put("PerSabun", vo.getPerSabun());
			param.put("PerId", loginVO.getPerId());
			
			Map googleAuthInfo = GetGoogleAuthInfo(param);
			
			// 구글캘린더 연동 계정이 아니라면 Skip
			if( googleAuthInfo.get("authFlag").equals("N")) return false;
			
			/********************************* Google Logic ************************************/
			Util.d("Log", "********************* InsertSchedule Start ***************************");
			Credential credential = GetCredential(param);
			Calendar calendarService = 
					new Calendar.Builder(new NetHttpTransport(), new JacksonFactory(), credential)
					.setApplicationName(APPLICATION_NAME).build();		
			
			// 등록된 CalendarID 정보 조회 - 없으면 primary 설정			
			String calendarId = getCalendarId(googleAuthInfo);
			
			// 종일 일정 여부
			boolean allDayFlag = vo.getScheAllTime().equals("Y") ? true : false;
			
			// 제목, 내용, 시간 설정
			Event event = new Event().
					setSummary(vo.getScheTitle()).
					setDescription(vo.getScheCon()).
					setStart(GetEventDateTime(vo.getScheSDate(), vo.getScheSTime(), vo.getScheSTimeAMPM(), allDayFlag)).
					setEnd(GetEventDateTime(vo.getScheEDate(), vo.getScheETime(), vo.getScheETimeAMPM(), allDayFlag));
			     
	        // 일정 이벤트 등록 진행
	        event = calendarService.events().insert(calendarId, event).execute();
	
	        // 생성된 ID값을 스케쥴ID에 매핑시켜주기
	        // eventId, seq        
	        param.put("eventId", event.getId());
	        param.put("seq", vo.getScheSeq());
	
	        scheduleDAO.UpdateScheduleCalendarEventId(param);
	        Util.d("Log", "********************* InsertSchedule End ***************************");
	        
	        return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}	
	
	
	/*
	 * 구글캘린더 일정 수정
	 * 등록되어 있는 구글 EventId가 존재한다면 업데이트 한다.
	 * @param
	 * loginVO : 사번, 로그인ID 필요
	 *   PerSabun : 사번
	 *   PerId : 로그인ID
	 * ScheduleVO : 스케쥴 정보 필요
	 * @see sp.crm.admin.service.GoogleCalendarService#UpdateSchedule(sp.erp.schedule.service.impl.ScheduleVO)
	 */
	public boolean UpdateSchedule(ScheduleVO vo, LoginVO loginVO) throws Exception { 
		try{		
			Map param = new HashMap();
			param.put("PerSabun", vo.getPerSabun());	
			param.put("PerId", loginVO.getPerId());
			param.put("seq", vo.getScheSeq());
			Map googleAuthInfo = GetGoogleAuthInfo(param);
			
			// 구글캘린더 연동 계정이 아니라면 Skip
			if( googleAuthInfo.get("authFlag").equals("N")) return false;
			
			// 업데이트 된 이벤트 ID를 조회
			String eventId = scheduleDAO.GetScheEventId(param);
			System.out.println("## EventId : " + eventId);
			
			// eventId 가 존재하지 않을 경우 신규로 등록
			if( eventId.equals("NONE")) { return InsertSchedule(vo, loginVO); }			
			
			// ID가 존재하면 수정된 스케쥴 정보로 업데이트
			/********************************* Google Logic ************************************/
			Util.d("Log", "********************* UpdateSchedule Start ***************************");
			Credential credential = GetCredential(param);
			Calendar calendarService = 
					new Calendar.Builder(new NetHttpTransport(), new JacksonFactory(), credential)
					.setApplicationName(APPLICATION_NAME).build();		
				
			// 등록된 CalendarID 정보 조회 - 없으면 primary 설정			
			String calendarId = getCalendarId(googleAuthInfo);
			
			// 해당 EventId로 등록되어 있는 이벤트 조회
			Event event = calendarService.events().get(calendarId, eventId).execute();
			
			// 종일 일정 여부
			boolean allDayFlag = vo.getScheAllTime().equals("Y") ? true : false;
						
			// 수정
			event.setSummary(vo.getScheTitle()).
				setDescription(vo.getScheCon()).
				setStart(GetEventDateTime(vo.getScheSDate(), vo.getScheSTime(), vo.getScheSTimeAMPM(), allDayFlag)).
				setEnd(GetEventDateTime(vo.getScheEDate(), vo.getScheETime(), vo.getScheETimeAMPM(), allDayFlag));
	        
	        // 수정된 일정으로 이벤트 업데이트
	        Event updatedEvent = calendarService.events().update(calendarId, event.getId(), event).execute();	        
	        Util.d("Log", "********************* UpdateSchedule End ***************************");
	        
	        return true;
		}catch(Exception e){
			e.printStackTrace();
		}	 
		return false;
	}	
	
	/*
	 * 구글캘린더 일정 수정
	 * 등록되어 있는 구글 EventId가 존재한다면 업데이트 한다.
	 * @param
	 * loginVO : 사번, 로그인ID 필요
	 *   PerSabun : 사번
	 *   PerId : 로그인ID
	 * ScheduleVO : 스케쥴 정보 필요
	 * @see sp.crm.admin.service.GoogleCalendarService#DeleteSchedule(sp.erp.schedule.service.impl.ScheduleVO)
	 */
	public boolean DeleteSchedule(ScheduleVO vo, LoginVO loginVO) throws Exception { 

		Map param = new HashMap();
		param.put("PerSabun", vo.getPerSabun());
		param.put("PerId", loginVO.getPerId());
		param.put("seq", vo.getScheSeq());
		Map googleAuthInfo = GetGoogleAuthInfo(param);
		
		// 구글캘린더 연동 계정이 아니라면 Skip
		if( googleAuthInfo.get("authFlag").equals("N")) return false;
		
		// 업데이트 된 이벤트 ID를 조회 - 연동 EVENTID 존재하지 않으면(NONE) Skip
		String eventId = scheduleDAO.GetScheEventId(param);
		if( eventId.equals("NONE")) return false;
				
		// ID가 존재하면 수정된 스케쥴 정보로 업데이트
		/********************************* Google Logic ************************************/
		Credential credential = GetCredential(param);
		Calendar calendarService = 
				new Calendar.Builder(new NetHttpTransport(), new JacksonFactory(), credential)
				.setApplicationName(APPLICATION_NAME).build();		
		
		// 등록된 CalendarID 정보 조회 - 없으면 primary 설정			
		String calendarId = getCalendarId(googleAuthInfo);
		
		// Delete an event
		calendarService.events().delete(calendarId, eventId).execute();	
		
		return true;
	}	
	
	/*
	 *  calendarId 조회
	 */
	private String getCalendarId(Map map){
		String calendarId = "primary";
		
		if( !map.containsKey("calendarId") ) return calendarId;
		
		if( !map.get("calendarId").equals("NONE") ){
			calendarId = map.get("calendarId").toString();
		}
		
		return calendarId;
		
	}
	private String GetGoogleDateTime(String dateValue, String timeValue, String ampm){
		
		String vNewTimeValue = timeValue;
    	if( ampm.equals("PM") ){
    		String[] hours = vNewTimeValue.split(":");
    		int hourValue = Integer.parseInt(hours[0].toString());
    		if( hourValue != 12 ) hourValue += 12;
    		
    		vNewTimeValue = String.valueOf(hourValue) + ":" + hours[1];
    	}
    	
    	return dateValue+ "T" + vNewTimeValue + ":00+09:00";		
	}

	/*
	 * 이벤트 시각 생성함수
	 * dateValue : 날짜 0000-00-00
	 * timeValue : 시각 00:00 
	 * ampm : 오전,오후
	 * allDay : 종일여부
	 */ 
	private EventDateTime GetEventDateTime(
			String sDate,
			String sTime,
			String ampm,
			boolean allDay){
		
		String dateTime = GetGoogleDateTime(sDate, sTime, ampm);		
		EventDateTime eventDateTime = null;
		
		if( allDay ){
			eventDateTime = new EventDateTime().setDate(new DateTime(sDate)).setTimeZone("Asia/Seoul");
		}
		else{
			eventDateTime = new EventDateTime().setDateTime(new DateTime(dateTime)).setTimeZone("Asia/Seoul");
		}
		
		return eventDateTime; 
	}
	
	
    
    
	/*
	 * 구글계정 연동정보 삭제
	 * @see sp.crm.admin.service.GoogleCalendarService#UnlinkGoogleAccount(java.util.Map)
	 */
	public void UnlinkGoogleAccount(Map map) throws Exception {
		// TODO Auto-generated method stub
		loginDAO.UnlinkGoogleAccount(map);  
	}

	public void UpdateGoogleCalendarInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		loginDAO.UpdateGoogleCalendarInfo(map);
	}
	
	
}
