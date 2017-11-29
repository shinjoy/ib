package ib.stats.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ib.stats.service.StatsPsService;
import ib.work.service.WorkMemoService;
import ib.work.service.WorkVO;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service("statsPsService")
public class StatsPsServiceImpl extends AbstractServiceImpl implements StatsPsService {

    @Resource(name="statsPsDAO")
    private StatsPsDAO statsPsDAO;
    
    
    
    protected static final Log logger = LogFactory.getLog(StatsPsServiceImpl.class);


    //메자닌 성과 설정 정보
	public List<Map> getPsMezzConfigInfo(Map map) throws Exception {
		return statsPsDAO.getPsMezzConfigInfo(map);
	}

	//유형정보
	public List<Map> getPsMezzType(Map map) throws Exception {
		return statsPsDAO.getPsMezzType(map);
	}

	//직원정보
	public List<Map> getPsMezzStaff(Map map) throws Exception {
		return statsPsDAO.getPsMezzStaff(map);
	}

	//메자닌 성과 설정정보 저장
	public int doSavePsConfigInfo(Map<String, Object> map) throws Exception {
		return statsPsDAO.doSavePsConfigInfo(map);
	}

	//직원 정보 저장 (연봉, 목표, ROLL RATE)
	public int doSaveStaffInfo(Map<String, Object> map) throws Exception {
		return statsPsDAO.doSaveStaffInfo(map);
	}

	//유형 정보 코드 전체
	public List<Map> getMezzTypeAll(Map map) throws Exception {
		return statsPsDAO.getMezzTypeAll(map);
	}

	//선택 유형 정보 저장
	public int doSaveMezzType(Map<String, Object> map) throws Exception {
		statsPsDAO.deleteMezzType(map);			//해당년도 유형 삭제
		return statsPsDAO.insertMezzType(map);	//해당년도 유형 등록
	}

	//대상자 정보 저장
	public int doSaveMezzStaff(Map<String, Object> map) throws Exception {
		statsPsDAO.deleteMezzStaff(map);			//해당년도 ROLE 대상자 일괄 삭제후 (flag 처리)
		return statsPsDAO.doSaveMezzStaff(map);
	}

	
	
}
