package ib.person.service.impl;

import ib.basic.service.CpnExcelVO;
import ib.cmm.service.impl.ComAbstractDAO;
import ib.company.service.CompanyVO;
import ib.login.service.StaffVO;
import ib.person.service.PersonVO;
import ib.work.service.CusBasicConnectVO;
import ib.work.service.WorkVO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package  : ib.person.service.impl
 * filename : PersonDAO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 9. 6.
 * @version : 1.0.0
 */
@Repository("personDAO")
public class PersonDAO extends ComAbstractDAO{
	
	/**
	 *
	 * @MethodName : selectPersonList
	 * @param personVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PersonVO> selectPersonList(PersonVO personVO) throws Exception{
		return list("personDAO.selectPersonList", personVO);
	}

	/**
	 *
	 * @MethodName : selectMainPersonList
	 * @param personVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PersonVO> selectMainPersonList(PersonVO personVO) throws Exception{
		return list("personDAO.selectMainPersonList", personVO);
	}

	/**
	 *
	 * @MethodName : insertCustomer
	 * @param personVO
	 * @return
	 * @throws Exception
	 */
	public int insertCustomer(PersonVO personVO) throws Exception {
		return Integer.parseInt(insert("personDAO.insertCustomer", personVO).toString());
	}

	/**
	 *
	 * @MethodName : regCustomer
	 * @param Map<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int regCustomer(Map<String,Object> map) throws Exception {
		return Integer.parseInt(insert("personDAO.insertCustomer", map).toString());
	}
	
	/**
	 *
	 * @MethodName : selectMainPersonList2
	 * @param personVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PersonVO> selectMainPersonList2(PersonVO personVO) throws Exception{
		return list("personDAO.selectMainPersonList2", personVO);
	}

	/**
	 *
	 * @MethodName : insertNetworkCst
	 * @param personVO
	 * @return
	 * @throws Exception
	 */
	public int insertNetworkCst(PersonVO personVO) throws Exception {
		return (Integer)update("personDAO.insertNetworkCst", personVO);
	}

	/**
	 *
	 * @MethodName : insertNote
	 * @param personVO
	 * @return
	 * @throws Exception
	 */
	public int insertNote(PersonVO personVO) throws Exception {
		return (Integer)update("personDAO.insertNote", personVO);
	}

	/**
	 *
	 * @MethodName : updateCustomer
	 * @param personVO
	 * @return
	 * @throws Exception
	 */
	public int updateCustomer(PersonVO personVO) throws Exception {
		return (Integer)update("personDAO.updateCustomer", personVO);
	}

	/**
	 *
	 * @MethodName : checkStaff
	 * @param loginVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<StaffVO> checkStaff(StaffVO staffVO) throws Exception{
		return list("personDAO.selectCheckStaff", staffVO);
	}

	/**
	 *
	 * @MethodName : checkStaffCnt
	 * @param staffVO
	 * @return
	 */
	public int checkStaffCnt(StaffVO staffVO) throws Exception {
    	return (Integer)getSqlMapClientTemplate().queryForObject("personDAO.selectCheckStaffCnt", staffVO);
    }

	/**
	 *
	 * @MethodName : selectCheckIdCnt
	 * @param staffVO
	 * @return
	 */
	public int selectCheckIdCnt(StaffVO staffVO) throws Exception {
    	return (Integer)getSqlMapClientTemplate().queryForObject("personDAO.selectCheckIdCnt", staffVO);
    }

	/**
	 *
	 * @MethodName : updateStaffInfo
	 * @param staffVO
	 * @return
	 */
	public int updateStaffInfo(StaffVO staffVO) throws Exception {
		return (Integer)update("personDAO.updateStaffInfo", staffVO);
	}
	
	// 사원리스트 받아오기
	@SuppressWarnings("rawtypes")
	public List GetPerList(Map<String,Object> map) throws Exception {
		return list("personDAO.GetPerList", map);
	}
	
	/**
	 *
	 * @MethodName : selectStaff
	 * @param staffVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<StaffVO> selectStaff(StaffVO staffVO) throws Exception{
		return list("personDAO.selectStaff", staffVO);
	}

	/**
	 *
	 * @MethodName : selectPersonListCnt
	 * @param personVO
	 * @return
	 */
	public int selectPersonListCnt(PersonVO personVO) throws Exception {
    	return (Integer)getSqlMapClientTemplate().queryForObject("personDAO.selectPersonListCnt", personVO);
    }

	/**
	 *
	 * @MethodName : selectMaxSnb
	 * @param personVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PersonVO> selectMaxSnb(PersonVO personVO) throws Exception{
		return list("personDAO.selectMaxSnb", personVO);
	}

	/**
	 *
	 * @MethodName : excelInsertCustomer
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int excelInsertCustomer(CpnExcelVO vo) throws Exception {
    	return (Integer)update("personDAO.excelInsertCustomer", vo);
    }

	/**
	 *
	 * @MethodName : excelInsertNote
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int excelInsertNote(CpnExcelVO vo) throws Exception {
    	return (Integer)update("personDAO.excelInsertNote", vo);
    }

	/**
	 *
	 * @MethodName : selectExcelDown
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PersonVO> selectExcelDown(PersonVO VO) throws Exception{
		return list("personDAO.selectExcelDown", VO);
	}

	/**
	 *
	 * @MethodName : insertCstDealInfo
	 * @param personVO
	 * @return
	 */
	public int insertCstDealInfo(PersonVO personVO) throws Exception {
		return (Integer)update("personDAO.insertCstDealInfo", personVO);
	}

	/**
	 *
	 * @MethodName : selectCstDealInfoList
	 * @param companyVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CompanyVO> selectCstDealInfoList(CompanyVO VO) throws Exception{
		return list("personDAO.selectCstDealInfoList", VO);
	}

	/**
	 *
	 * @MethodName : selectResponseStaffList
	 * @param companyVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CompanyVO> selectResponseStaffList(CompanyVO VO) throws Exception{
		return list("personDAO.selectResponseStaffList", VO);
	}

	/**
	 *
	 * @MethodName : selectStockFirmIBsList
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PersonVO> selectStockFirmIBsList(PersonVO VO) throws Exception{
		return list("personDAO.selectStockFirmIBsList", VO);
	}

	/**
	 *
	 * @MethodName : selectStockFirmIBsListNew
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectStockFirmIBsListNew(PersonVO VO) throws Exception{
		return list("personDAO.selectStockFirmIBsListNew", VO);
	}
	
	
	/**
	 *
	 * @MethodName : selectStockFirmIBsListNewNotyet
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectStockFirmIBsListNewNotyet(PersonVO VO) throws Exception{
		return list("personDAO.selectStockFirmIBsListNewNotyet", VO);
	}
	
	
	/**
	 *
	 * @MethodName : deletePersonNetInfo
	 * @param personVO
	 * @return
	 */
	public int deletePersonNetInfo(PersonVO VO) throws Exception {
		return (Integer)update("personDAO.deletePersonNetInfo", VO);
	}

	/**
	 *
	 * @MethodName : modifyPersonNetInfo
	 * @param personVO
	 * @return
	 */
	public int modifyPersonNetInfo(PersonVO VO) throws Exception {
		return (Integer)update("personDAO.modifyPersonNetInfo", VO);
	}

	/**
	 *
	 * @MethodName : saveNetPoionLvCD
	 * @param vo
	 * @return
	 */
	public int saveNetPoionLvCD(PersonVO vo) throws Exception {
		return (Integer)update("personDAO.saveNetPoionLvCD", vo);
	}

	/**
	 *
	 * @MethodName : selectNetPointLatest
	 * @param personVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<PersonVO> selectNetPointLatest(PersonVO VO) throws Exception{
		return list("personDAO.selectNetPointLatest", VO);
	}

	/**
	 *
	 * @MethodName : insertStockFirmIBstar
	 * @param personVO
	 * @return
	 */
	public int insertStockFirmIBstar(PersonVO vo) throws Exception {
		return (Integer)update("personDAO.insertStockFirmIBstar", vo);
	}

	/**
	 *
	 * @MethodName : updateStockFirmIBstar
	 * @param personVO
	 * @return 
	 */
	public int updateStockFirmIBstar(PersonVO VO) throws Exception {
		return (Integer)update("personDAO.updateStockFirmIBstar", VO);
	}

	/**
	 *
	 * @MethodName : selectStockFirmBookmarkList
	 * @param personVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<PersonVO> selectStockFirmBookmarkList(WorkVO workVO) throws Exception{
		return list("personDAO.selectStockFirmBookmarkList", workVO);
	}

	/**
	 *
	 * @MethodName : modifyPassword
	 * @param psnVo
	 */
	public int modifyPassword(StaffVO VO) throws Exception {
		return (Integer)update("personDAO.modifyPassword", VO);
	}

	/**
	 *
	 * @MethodName : updateStaffInformation
	 * @param psnVo
	 */
	public int updateStaffInformation(StaffVO VO) throws Exception {
		return (Integer)update("personDAO.updateStaffInformation", VO);
	}

	/**
	 *
	 * @MethodName : insertStaff
	 * @param stVo
	 */
	public int insertStaff(StaffVO VO) throws Exception {
		return (Integer)update("personDAO.insertStaff", VO);
	}

	/**
	 *
	 * @MethodName : selectIntroducerList
	 * @param personVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<PersonVO> selectIntroducerList(PersonVO VO) throws Exception{
		return list("personDAO.selectIntroducerList", VO);
	}

	/**
	 *
	 * @MethodName : updateIBstaffwithInside
	 * @param stVo
	 * @return 
	 */
	public Integer updateIBstaffwithInside(StaffVO VO) throws Exception {
		return (Integer)update("personDAO.updateIBstaffwithInside", VO);
	}

	/**
	 *
	 * @MethodName : selectSearchDuplicateB4excelInsert
	 * @param psnVo
	 * @return
	 */
	public int selectSearchDuplicateB4excelInsert(WorkVO psnVo) {
		return (Integer)getSqlMapClientTemplate().queryForObject("personDAO.selectSearchDuplicateB4excelInsert",psnVo);
	}

	/**
	 *
	 * @MethodName : updateCstPhn
	 * @param personVO
	 * @return
	 */
	public int updateCstPhn(PersonVO VO) throws Exception {
		return (Integer)update("personDAO.updateCstPhn", VO);
	}

	/**
	 *
	 * @MethodName : selectIntroducerListCnt
	 * @param workVO
	 * @return
	 */
	public int selectIntroducerListCnt(PersonVO vo) {
		return (Integer)getSqlMapClientTemplate().queryForObject("personDAO.selectIntroducerListCnt",vo);
	}

	/**
	 *
	 * @MethodName : selectMeetingList
	 * @param vo
	 * @return
	 */
	public Object selectMeetingList(PersonVO vo) throws Exception{
		return list("personDAO.selectMeetingList", vo);
	}

	/**
	 *
	 * @MethodName : updateAttendMeet
	 * @param vo
	 */
	public int updateAttendMeet(PersonVO vo) throws Exception {
		return (Integer)update("personDAO.updateAttendMeet", vo);
	}

	/**
	 *
	 * @MethodName : insertAttendMeet
	 * @param vo
	 */
	public int insertAttendMeet(PersonVO vo) throws Exception {
		return (Integer)update("personDAO.insertAttendMeet", vo);
	}

	/**
	 *
	 * @MethodName : selectAttendMeetingList
	 * @param vo
	 * @return
	 */
	public Object selectAttendMeetingList(PersonVO vo) throws Exception{
		return list("personDAO.selectAttendMeetingList", vo);
	}

	/**
	 *
	 * @MethodName : selectAttendMeetingListCnt
	 * @return
	 */
	public int selectAttendMeetingListCnt(PersonVO vo) {
		return (Integer)getSqlMapClientTemplate().queryForObject("personDAO.selectAttendMeetingListCnt",vo);
	}

	/**
	 *
	 * @MethodName : insertMeeting
	 * @param vo
	 * @return 
	 */
	public int insertMeeting(PersonVO vo) throws Exception {
		return (Integer)update("personDAO.insertMeeting", vo);
	}

	
	
	
	//회사별 부서 리스트
	public List<Map> getCpnDeptList(Map map) throws Exception {
		return list("personDAO.selectCpnDeptList", map);
	}

	
	
	/**
	 * 부서코드 반환(신규면 등록하고 코드 반환)
	 * 
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 01. 18
	 */
	public Map getDeptCodeByCallProcedure(Map map) throws Exception{
		
		update("personDAO.getDeptCodeByCallProcedure", map);
		
		return map;  
		
	}


	/**
	 * 증권사 IB 고객 담당자 등록
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 2. 19.
	 */
	public int doSaveCstManager(Map<String, Object> map) throws Exception{
		insert("personDAO.doSaveCstManager", map);
		return 1;
	}

	
	/**
	 * 고객리스트 카운트 
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 3. 10.
	 */
	public int getCustListCount(Map<String, Object> map) {
		return (Integer)selectByPk("person.selectCustListCount", map);
	}
	
	
	/**
	 * 고객리스트 
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 3. 10.
	 */
	public List<Map> getCustList(Map<String, String> map) {
		return list("person.selectCustList", map);
	}

	
	/**
	 * 신규할당 고객 
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 3. 15.
	 */
	public List<Map> getCustListNewInCharge(Map<String, String> param) {
		return list("person.selectCustListNewInCharge", param);
	}

	
	
	/**
	 * 신규할당 고객 수락
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 3. 16.
	 */
	public int doAcceptCstManager(Map<String, Object> param) {
		
		update("person.updateCstManager", param);					//// *** 1. 기존 담당자 상태코드 'Y' >> 'T'
		
		return update("person.updateAcceptCstManager", param);		//// *** 2. 신규 담당자 상태코드 'A' >> 'Y'
	}

	
	/**
	 * 담당자 바로 등록 (상태값 'Y')
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 3. 16.
	 */
	public int doSaveCstManagerDirect(Map<String, Object> map) {
		insert("person.doSaveCstManagerDirect", map);
		return 1;
	}

	

	/**
	 *
	 * @MethodName : regNetworkCst
	 * @param Map<String, Object>
	 * @return
	 * @throws Exception
	 */
	public int regNetworkCst(Map<String, Object> map) throws Exception {
		return (Integer)update("personDAO.insertNetworkCst", map);
	}

	
	/**
	 * 고객 정보 (1명)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 3. 16.
	 */
	public Map getCustomer(int cstId) throws Exception {
		
		return (Map)selectByPk("person.selectCustomer", "" + cstId);
	}
	
	
	/**
	 * 고객 정보 (1명) ... 이름으로 찾기
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 3. 23.
	 */
	public Map getCustomerByName(Map<String, Object> map) throws Exception {

		return (Map)selectByPk("person.selectCustomerByName", map);
	}

	
	
	/**
	 * 고객구분 변경
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 7.
	 */
	public int doSaveCstType(Map<String, Object> map) throws Exception {
		
		return update("person.updateCustomerType", map);
	}

	
	
	/**
	 * 고객 삭제
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 4. 8.
	 */
	public int doDelCst(Map<String, Object> map) throws Exception {
		
		return update("person.deleteCustomer", map);
	}


	/**
	 *
	 * @MethodName : selectStaff
	 * @param staffVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectStaffList(StaffVO staffVO) throws Exception{
		return list("personDAO.selectStaffList", staffVO);
	}
	
	/**
	 *
	 * @MethodName : user_profile update
	 * @param 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public void updateUserProfile(StaffVO staffVO) throws Exception{
		 update("personDAO.updateUserProfile", staffVO);
	}
}