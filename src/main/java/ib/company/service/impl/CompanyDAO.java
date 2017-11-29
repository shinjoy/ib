package ib.company.service.impl;

import ib.basic.service.CpnExcelVO;
import ib.cmm.service.impl.ComAbstractDAO;
import ib.company.service.CompanyVO;
import ib.work.service.WorkVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package  : ib.company.service.impl
 * filename : CompanyDAO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 8. 28.
 * @version : 1.0.0
 */
@Repository("companyDAO")
public class CompanyDAO extends ComAbstractDAO{
	
	/**
	 *
	 * @MethodName : selectMainCompanyList
	 * @param companyVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CompanyVO> selectMainCompanyList(CompanyVO companyVO) throws Exception{
		return list("companyDAO.selectMainCompanyList", companyVO);
	}
	/**
	 *
	 * @MethodName : selectCompanyList
	 * @param companyVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CompanyVO> selectCompanyList(CompanyVO companyVO) throws Exception{
		return list("companyDAO.selectCompanyList", companyVO);
	}
	/**
	 *
	 * @MethodName : selectNoteList
	 * @param companyVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CompanyVO> selectNoteList(CompanyVO companyVO) throws Exception{
		return list("companyDAO.selectNoteList", companyVO);
	}
	/**
	 *
	 * @MethodName : selectNetPointList
	 * @param companyVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CompanyVO> selectNetPointList(CompanyVO companyVO) throws Exception{
		return list("companyDAO.selectNetPointList", companyVO);
	}
	/**
	 *
	 * @MethodName : selectMaxCpnId
	 * @param companyVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CompanyVO> selectMaxCpnId(CompanyVO companyVO) throws Exception{
		return list("companyDAO.selectMaxCpnId", companyVO);
	}
	
	/**
	 *
	 * @MethodName : selectMaxCpnIds
	 * @param companyVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectMaxCpnIds(Map map) throws Exception{
		return list("companyDAO.selectMaxCpnIds", map);
	}
	
	
	/**
	 *
	 * @MethodName : selectMaxCpnIdForUpload
	 * @param companyVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map> selectMaxCpnIdForUpload(Map map) throws Exception{
		return list("companyDAO.selectMaxCpnIdForUpload", map);
	}
	
	
	/**
	 *
	 * @MethodName : insertCompany
	 * @param companyVO
	 * @return
	 * @throws Exception
	 */
	public int insertCompany(CompanyVO companyVO) throws Exception {
		List<Map> result = selectMaxCpnIds(null);
		companyVO.setSeq(result.get(0).get("seq").toString());
		companyVO.setaSeq(result.get(0).get("aSeq").toString());
		insert("companyDAO.insertCompany", companyVO);
		return Integer.parseInt(result.get(0).get("seq").toString());
	}
	/**
	 *
	 * @MethodName : selectMainCompanyList2
	 * @param companyVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CompanyVO> selectMainCompanyList2(CompanyVO companyVO) throws Exception{
		return list("companyDAO.selectMainCompanyList2", companyVO);
	}
	/**
	 *
	 * @MethodName : selectNoteList2
	 * @param companyVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CompanyVO> selectNoteList2(CompanyVO companyVO) throws Exception{
		return list("companyDAO.selectNoteList2", companyVO);
	}
	/**
	 *
	 * @MethodName : updateCompany
	 * @param companyVO
	 * @return
	 * @throws Exception
	 */
	public int updateCompany(CompanyVO companyVO) throws Exception {
		return (Integer)update("companyDAO.updateCompany", companyVO);
	}
	/**
	 *
	 * @MethodName : selectCompanyListCnt
	 * @param companyVO
	 * @return
	 */
	public int selectCompanyListCnt(CompanyVO companyVO) throws Exception {
    	return (Integer)getSqlMapClientTemplate().queryForObject("personDAO.selectCompanyListCnt", companyVO);
    }
	/**
	 *
	 * @MethodName : insertNupdateCompanyExel
	 * @param vo
	 * @return 
	 */
	public Integer insertNupdateCompanyExel(CpnExcelVO vo) throws Exception {
		return (Integer)update("companyDAO.updateCompanyExcel", vo);
	}
	/**
	 *
	 * @MethodName : updateCEO
	 * @return
	 */
	public int updateCEO() throws Exception {
		return (Integer)update("companyDAO.updateCEO", null);
	}

	/**
	 *
	 * @MethodName : selectEmployeeList
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectEmployeeList(WorkVO VO) throws Exception {
		return list("companyDAO.selectEmployeeList", VO);
	}
	/**
	 *
	 * @MethodName : selectCpnCstInfoList
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CompanyVO> selectCpnCstInfoList(CompanyVO companyVO) throws Exception {
		return list("companyDAO.selectCpnCstInfoList", companyVO);
	}
	/**
	 *
	 * @MethodName : selectCpnNetList
	 * @param companyVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectCpnNetList(WorkVO workVO) throws Exception {
		return list("companyDAO.selectCpnNetList", workVO);
	}
	/**
	 *
	 * @MethodName : selectOpinionListCnt
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int selectOpinionListCnt(WorkVO workVO) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject("personDAO.selectOpinionListCnt", workVO);
	}
	/**
	 *
	 * @MethodName : selectNetPointListCnt
	 * @param companyVO
	 * @return
	 */
	public int selectNetPointListCnt(CompanyVO companyVO) throws Exception {
    	return (Integer)getSqlMapClientTemplate().queryForObject("companyDAO.selectNetPointListCnt", companyVO);
	}
	/**
	 *
	 * @MethodName : selectCpnIdNewNold
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectCpnIdNewNold() throws Exception {
		WorkVO vo = new WorkVO();
		return list("companyDAO.selectCpnIdNewNold",vo);
	}
	/**
	 *
	 * @MethodName : updateCompanyCpnId
	 */
	public int updateCompanyCpnId() {
		WorkVO vo = new WorkVO();
		//return (Integer)update("companyDAO.updateCompanyCpnId", vo);			사용하지 않도록 20160720
		return 0;
	}
	/**
	 * 
	 * @MethodName : insertIncharge
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 3. 3.
	 */
	public int insertIncharge(CompanyVO vo) throws Exception {
		return (Integer)update("companyDAO.insertIncharge", vo);
	}
	/**
	 * 
	 * @MethodName : updateIncharge
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 3. 3.
	 */
	public int updateIncharge(CompanyVO vo) throws Exception {
		return (Integer)update("companyDAO.updateIncharge", vo);
	}
	/**
	 * 
	 * @MethodName : selectDefaultCompanyList
	 * @param companyVO
	 * @return
	 * @author : user
	 * @since : 2015. 3. 18.
	 */
	@SuppressWarnings("unchecked")
	public List<CompanyVO> selectDefaultCompanyList(CompanyVO companyVO) throws Exception{
		return list("companyDAO.selectDefaultCompanyList", companyVO);
	}
	/**
	 * 
	 * @MethodName : selectInvestmentList
	 * @param cmmnMap
	 * @return
	 * @author : user
	 * @since : 2015. 6. 2.
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectInvestmentList(
			Map<String, Object> cmmnMap) throws Exception {
		return list("companyDAO.selectInvestmentList",cmmnMap);
	}
	/**
	 * 
	 * @MethodName : updateInvestmentList
	 * @param cmmnMap
	 * @return
	 * @author : user
	 * @since : 2015. 6. 3.
	 */
	public int updateInvestmentList(Map<String, Object> cmmnMap) throws Exception {
		return (Integer)update("companyDAO.updateInvestmentList", cmmnMap);
	}
	/**
	 * 
	 * @MethodName : insertInvestmentList
	 * @param cmmnMap
	 * @return
	 * @author : user
	 * @since : 2015. 6. 3.
	 */
	public int insertInvestmentList(Map<String, Object> cmmnMap) throws Exception {
		return (Integer)update("companyDAO.insertInvestmentList", cmmnMap);
	}
	/**
	 * 
	 * @MethodName : deleteInvestmentList
	 * @param cmmnMap
	 * @return
	 * @author : user
	 * @since : 2015. 6. 3.
	 */
	public int deleteInvestmentList(Map<String, Object> cmmnMap) throws Exception {
		return (Integer)update("companyDAO.deleteInvestmentList", cmmnMap);
	}
	
	
	//기존 회사 리스트 중에서 select 체크 (회사 일괄 업로드 프로세스)
	public List<Map> selectCompanyForChk(Map<String, Object> param) throws Exception {
		return list("companyDAO.selectCompanyForChk", param);
	}
	
	
	//회사 업데이트 (회사 일괄 업로드 프로세스)
	public int saveCompanyList(Map<String, Object> param) throws Exception {
		return (Integer)update("companyDAO.saveCompanyList", param);
	}
	
	//회사 업데이트 (회사 일괄 업로드 프로세스) - 수정
	public void updateCompanyList(Map<String, Object> tmpMap) throws Exception {
		update("companyDAO.updateCompanyList", tmpMap);
	}
	
	//회사 업데이트 (회사 일괄 업로드 프로세스) - 등록
	public void insertCompanyList(Map<String, Object> tmpMap) throws Exception {
		
		List<Map> result = null;
		try{
			result = selectMaxCpnIdForUpload(null);
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		
		tmpMap.put("cpnId", result.get(0).get("seq").toString());
		
		update("companyDAO.insertCompanyList", tmpMap);
	}
	
	//투자사(경쟁사) 리스트 20170804 ksm
	@SuppressWarnings("unchecked")
	public List<CompanyVO> selectInvestorCompanyList(CompanyVO companyVO) throws Exception {
		return list("companyDAO.selectInvestorCompanyList", companyVO);
	}
	
	public int selectInvestorCompanyListCnt(CompanyVO companyVO) throws Exception {
    	return (Integer)getSqlMapClientTemplate().queryForObject("companyDAO.selectInvestorCompanyListCnt", companyVO);
    }
}