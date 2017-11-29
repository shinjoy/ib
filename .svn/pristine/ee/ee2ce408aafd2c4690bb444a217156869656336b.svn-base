package ib.schedule.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ib.schedule.service.LoginVO;

public interface LoginService {
	
	//LoginVO LoginEnd(LoginVO vo) throws Exception;											// 로그인 완료
	LoginVO LoginEnd(Map<String,Object> vo) throws Exception;											// 로그인 완료
	
	// 로그인자에게 온 결재 및 요청문서
	@SuppressWarnings("rawtypes")
	List GetTodayScheduleList(LoginVO vo) throws Exception;									// 로그인자 오늘 일정
	@SuppressWarnings("rawtypes")
	List GetPerBirthdayList() throws Exception;												// 오늘 생일자
	
	@SuppressWarnings("rawtypes")
	List GetHoliPerList() throws Exception;													// 오늘 부재중인 사원
	
	void MyInfoEditEnd(LoginVO vo) throws Exception;										// 내정보 수정완료
	
	int GetEmployeeCardFileCd(LoginVO vo) throws Exception;									// 명함 파일 코드 받아오기
	
	@SuppressWarnings("rawtypes")
	void EmployeeCardFileAddEnd(List list) throws Exception;								// 명함 파일 등록 완료
	
	void EmployeeCardFileDelEnd(LoginVO vo) throws Exception;								// 명함 파일 삭제 완료
	
	void MyPWEditEnd(LoginVO vo) throws Exception;											// 비밀번호 수정완료
	
	LoginVO SearchEnd(LoginVO vo) throws Exception;											// 아이디/비밀번호 찾기 완료
}