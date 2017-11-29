package ib.schedule.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import ib.schedule.service.FormDocService;
import ib.schedule.service.FormDocVO;

@Service("formService")
public class FormDocServiceImpl extends AbstractServiceImpl implements FormDocService {
	
	@Resource(name = "formDAO")
	private FormDocDAO formDAO;

	// 증명서 종류 받아오기
	@SuppressWarnings("rawtypes")
	public List GetFormDocTypeList() throws Exception {
		return formDAO.GetFormDocTypeList();
	}

	// 사원리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetPerList() throws Exception {
		return formDAO.GetPerList();
	}
	// 사원리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetPerList(Map p) throws Exception {
		return formDAO.GetPerList(p);
	}

	// 퇴사자 포함 사원리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetAllPerList() throws Exception {
		return formDAO.GetAllPerList();
	}

	// 선택 사원 정보 받아오기
	public FormDocVO GetPerInfo(FormDocVO vo) throws Exception {
		return formDAO.GetPerInfo(vo);
	}

	// 증명서 발급 요청 완료
	public void FormDocReqEnd(FormDocVO vo) throws Exception {
		formDAO.FormDocReqEnd(vo);
	}

	// 증명서 발급 내역 리스트
	@SuppressWarnings("rawtypes")
	public List GetFormDocReqList(FormDocVO vo) throws Exception {
		return formDAO.GetFormDocReqList(vo);
	}

	// 증명서 정보 받아오기
	public FormDocVO GetFormDocInfo(FormDocVO vo) throws Exception {
		return formDAO.GetFormDocInfo(vo);
	}

	// 증명서 상태 변경 완료
	public void FormDocStatusEditEnd(FormDocVO vo) throws Exception {
		formDAO.FormDocStatusEditEnd(vo);
	}

	// 증명서 요청 취소 완료
	public void FormDocCancelEnd(FormDocVO vo) throws Exception {
		formDAO.FormDocCancelEnd(vo);
	}
}