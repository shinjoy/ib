package ib.schedule.service.impl;

import ib.cmm.service.impl.ComAbstractDAO;
import ib.schedule.service.LoginVO;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;


@Repository("loginDAO2")
public class LoginDAO extends ComAbstractDAO {
	
	protected static final Log LOG = LogFactory.getLog(LoginDAO.class);
	
//	// 로그인 완료
//	public LoginVO LoginEnd(LoginVO vo) throws Exception {
//		return (LoginVO)selectByPk("loginDAO.LoginEnd", vo);
//	}
	
	// 로그인 완료
	public LoginVO LoginEnd(Map<String, Object> vo) throws Exception {
		return (LoginVO)selectByPk("loginDAO.LoginEnd", vo);
	}
	
	// 로그인자에게 온 결재 및 요청문서
	// 로그인자 오늘 일정
	@SuppressWarnings("rawtypes")
	public List GetTodayScheduleList(LoginVO vo) throws Exception {
		return list("loginDAO.GetTodayScheduleList", vo);
	}
	
	// 오늘 생일자
	@SuppressWarnings("rawtypes")
	public List GetPerBirthdayList() throws Exception {
		return list("loginDAO.GetPerBirthdayList", "");
	}
		
	// 오늘 부재중인 사원
	@SuppressWarnings("rawtypes")
	public List GetHoliPerList() throws Exception {
		return list("loginDAO.GetHoliPerList", "");
	}
	
	
	// 내정보 수정완료
	public void MyInfoEditEnd(LoginVO vo) throws Exception {
		update("loginDAO.MyInfoEditEnd", vo);
//		update("loginDAO.MyInfoPermiEditEnd", vo);
	}
	
	// 명함 파일 코드 받아오기
	public int GetEmployeeCardFileCd(LoginVO vo) throws Exception {
		return (Integer)selectByPk("loginDAO.GetEmployeeCardFileCd", vo);
	}
	
	// 명함 파일 등록 완료
	@SuppressWarnings("rawtypes")
	public void EmployeeCardFileAddEnd(List list) throws Exception {
		insert("loginDAO.EmployeeCardFileAddEnd", list);
	}
	
	// 명함 파일 삭제 완료
	public void EmployeeCardFileDelEnd(LoginVO vo) throws Exception {
		update("loginDAO.EmployeeCardFileDelEnd", vo);
	}
	
	// 비밀번호 수정완료
	public void MyPWEditEnd(LoginVO vo) throws Exception {
		update("loginDAO.MyPWEditEnd", vo);
	}
	
	// 아이디/비밀번호 찾기 완료
	public LoginVO SearchEnd(LoginVO vo) throws Exception {
		return (LoginVO)selectByPk("loginDAO.SearchEnd", vo);
	}

	/***********************************************************************/
	
	// 구글 캘린더 정보 & 인증정보 가져오기
	public Map GetGoogleAuthInfo(Map param) throws Exception {
		return (Map)selectByPk("loginDAO.GetGoogleAuthInfo", param);
	}
	
	// 구글 캘린더 사용자 email 정보 업데이트하기
	public void InsertGoogleEmail(Map param) throws Exception {
		update("loginDAO.InsertGoogleEmail", param);
	}
	
	// 구글 캘린더 사용자 토큰 정보 업데이트하기
	public void InsertGoogleTokenInfo(Map param) throws Exception {
		update("loginDAO.InsertGoogleTokenInfo", param);
	}

	public void UnlinkGoogleAccount(Map map) {
		// TODO Auto-generated method stub
		update("loginDAO.UnlinkGoogleAccount", map);
	}

	public void UpdateGoogleCalendarInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("loginDAO.UpdateGoogleCalendarInfo", map);
	}
}