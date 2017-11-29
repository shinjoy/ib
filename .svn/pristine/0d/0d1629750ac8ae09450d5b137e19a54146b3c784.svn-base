package ib.schedule.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ib.schedule.service.LoginService;
import ib.schedule.service.LoginVO;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service("loginService2")
public class LoginServiceImpl extends AbstractServiceImpl implements LoginService {
	
	@Resource(name="loginDAO2")
	private LoginDAO loginDAO;
	
//	// 로그인 완료
//	public LoginVO LoginEnd(LoginVO vo) throws Exception {
//		LoginVO loginVO = loginDAO.LoginEnd(vo);
//		
//		if(loginVO != null && !loginVO.getPerId().equals("") && !loginVO.getPerPW().equals("")) {
//    		return loginVO;
//    	}
//		else {
//    		loginVO = new LoginVO();
//    	}
//		return loginVO;
//	}
	
	// 로그인 완료
	public LoginVO LoginEnd(Map<String, Object> vo) throws Exception {
		LoginVO loginVO = loginDAO.LoginEnd(vo);
		
		if(loginVO != null && !loginVO.getPerId().equals("") && !loginVO.getPerPW().equals("")) {
    		return loginVO;
    	}
		else {
    		loginVO = new LoginVO();
    	}
		return loginVO;
	}
	
	
	
	// 로그인자에게 온 결재 및 요청문서
	// 로그인자 오늘 일정
	@SuppressWarnings("rawtypes")
	public List GetTodayScheduleList(LoginVO vo) throws Exception {
		return loginDAO.GetTodayScheduleList(vo);
	}
	
	// 오늘 생일자
	@SuppressWarnings("rawtypes")
	public List GetPerBirthdayList() throws Exception {
		return loginDAO.GetPerBirthdayList();
	}
	
	
	// 오늘 부재중인 사원
	@SuppressWarnings("rawtypes")
	public List GetHoliPerList() throws Exception {
		return loginDAO.GetHoliPerList();
	}
		
	// 내정보 수정완료
	public void MyInfoEditEnd(LoginVO vo) throws Exception {
		loginDAO.MyInfoEditEnd(vo);
	}
	
	// 명함 파일 코드 받아오기
	public int GetEmployeeCardFileCd(LoginVO vo) throws Exception {
		return loginDAO.GetEmployeeCardFileCd(vo);
	}
	
	// 명함 파일 등록 완료
	@SuppressWarnings("rawtypes")
	public void EmployeeCardFileAddEnd(List list) throws Exception {
		log.debug(list.toString());
		loginDAO.EmployeeCardFileAddEnd(list);
	}
	
	// 명함 파일 삭제 완료
	public void EmployeeCardFileDelEnd(LoginVO vo) throws Exception {
		loginDAO.EmployeeCardFileDelEnd(vo);
	}
	
	// 비밀번호 수정완료
	public void MyPWEditEnd(LoginVO vo) throws Exception {
		loginDAO.MyPWEditEnd(vo);
	}
	
	// 아이디/비밀번호 찾기 완료
	@SuppressWarnings("null")
	public LoginVO SearchEnd(LoginVO vo) throws Exception {
		LoginVO loginVO = loginDAO.SearchEnd(vo);
		
//		if(loginVO != null && !loginVO.getPerId().equals("") && !loginVO.getPerPW().equals("")) {
//			return loginVO;
//		}
//		else loginVO = new LoginVO();
		
		if(loginVO == null && loginVO.getPerId().equals("") && loginVO.getPerPW().equals("")) loginVO = new LoginVO();
		return loginVO;
	}
}