package ib.schedule.service.impl;

import ib.cmm.service.impl.ComAbstractDAO;
import ib.schedule.service.FormDocVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository("formDAO")
public class FormDocDAO extends ComAbstractDAO {

	// 증명서 종류 받아오기
	@SuppressWarnings("rawtypes")
	public List GetFormDocTypeList() throws Exception {
		return list("formDAO.GetFormDocTypeList", "");
	}
	
	// 사원리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetPerList() throws Exception {
		return list("formDAO.GetPerList", new HashMap());
	}
	// 사원리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetPerList(Map p) throws Exception {
		return list("formDAO.GetPerList", p);
	}
	
	// 퇴사자 포함 사원리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetAllPerList() throws Exception {
		return list("formDAO.GetAllPerList", "");
	}
	
	// 선택 사원 정보 받아오기
	public FormDocVO GetPerInfo(FormDocVO vo) throws Exception {
		return (FormDocVO)selectByPk("formDAO.GetPerInfo", vo);
	}
	
	// 증명서 발급 요청 완료
	public void FormDocReqEnd(FormDocVO vo) throws Exception {
		insert("formDAO.FormDocReqEnd", vo);
	}
	
	// 증명서 발급 내역 리스트
	@SuppressWarnings("rawtypes")
	public List GetFormDocReqList(FormDocVO vo) throws Exception {
		return list("formDAO.GetFormDocReqList", vo);
	}
	
	// 증명서 정보 받아오기
	public FormDocVO GetFormDocInfo(FormDocVO vo) throws Exception {
		return (FormDocVO)selectByPk("formDAO.GetFormDocInfo", vo);
	}
	
	// 증명서 상태 변경 완료
	public void FormDocStatusEditEnd(FormDocVO vo) throws Exception {
		update("formDAO.FormDocStatusEditEnd", vo);
	}
	
	// 증명서 요청 취소 완료
	public void FormDocCancelEnd(FormDocVO vo) throws Exception {
		update("formDAO.FormDocCancelEnd", vo);
	}
}