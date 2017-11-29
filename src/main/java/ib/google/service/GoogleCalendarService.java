package ib.google.service;

import ib.schedule.service.LoginVO;
import ib.schedule.service.impl.ScheduleVO;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.google.api.client.auth.oauth2.Credential;

public interface GoogleCalendarService {
	// 첫 사용자 인증시 AccessToken 및 RefreshToken 획득 with code
	public boolean doAuthWithCode(Map param) throws IOException;
	
	// 사용자 인증관련 정보 조회
	public Map GetGoogleAuthInfo(Map param) throws Exception;
	
	// 사용자 인증여부 체크
	public boolean GetUserAuthStatus(Map map) throws Exception;  
		
	// 사용자 인증 진행 with accessToken
	public Credential GetCredential(Map map) throws Exception;
	
	// 사용자 메일 계정 획득 및 업데이트
	public void UpdateGoogleEmail(Map map) throws Exception;
	
	// 사용자 캘린더 리스트 조회
	public List GetGoogleCalendarList(Map map) throws Exception;
	
	// 일정 등록
	public boolean InsertSchedule(ScheduleVO vo, LoginVO loginVO) throws Exception;
	
	// 일정 수정
	public boolean UpdateSchedule(ScheduleVO vo, LoginVO loginVO) throws Exception;
	
	// 일정 삭제
	public boolean DeleteSchedule(ScheduleVO vo, LoginVO loginVO) throws Exception;
	
	// 구글계정 연동정보 삭제
	public void UnlinkGoogleAccount(Map map) throws Exception;

	//구글 일정연동할 달력ID 저장
	public void UpdateGoogleCalendarInfo(Map<String, Object> map);
}
