package ib.personnel.service.impl;

import ib.cmm.service.impl.ComAbstractDAO;
import ib.personnel.service.ManagementVO;
import java.util.List;
import org.springframework.stereotype.Repository;


/**
 * <pre>
 * package  : ib.personnel.service.impl
 * filename : ManagementDAO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2013. 1. 10.
 * @version : 1.0.0
 */
@Repository("managementDAO")
public class ManagementDAO extends ComAbstractDAO{

	/**
	 *
	 * @MethodName : selectStaffList
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<ManagementVO> selectStaffList(ManagementVO  VO) throws Exception {
		return list("managementDAO.selectStaff", VO);
	}

	/**
	 *
	 * @MethodName : updateStaffInfo
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateStaffInfo(ManagementVO vo) throws Exception {
    	return (Integer)update("managementDAO.updateStaffInfo", vo);
    }

	/**
	 *
	 * @MethodName : selectPersonnelLateList
	 * @param vO
	 * @return
	 */
	public int selectPersonnelLateList(ManagementVO VO) {
		String tmp = (String)getSqlMapClientTemplate().queryForObject("personnelDAO.selectPersonnelLateList", VO);
		if(tmp==null) tmp = "0";
		return Integer.parseInt(tmp);
	}

	
	/**
	 *
	 * @MethodName : selectPmFamily
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<ManagementVO> selectPmFamily(ManagementVO vo) throws Exception {
		return list("managementDAO.selectPmFamily", vo);
	}
	@SuppressWarnings("unchecked")
	public List<ManagementVO> selectPmAcademic(ManagementVO vo) throws Exception {
		return list("managementDAO.selectPmAcademic", vo);
	}
	@SuppressWarnings("unchecked")
	public List<ManagementVO> selectPmCareer(ManagementVO vo) throws Exception {
		return list("managementDAO.selectPmCareer", vo);
	}
	@SuppressWarnings("unchecked")
	public List<ManagementVO> selectPmLicense(ManagementVO vo) throws Exception {
		return list("managementDAO.selectPmLicense", vo);
	}
	@SuppressWarnings("unchecked")
	public List<ManagementVO> selectPmInsideCareer(ManagementVO vo) throws Exception {
		return list("managementDAO.selectPmInsideCareer", vo);
	}
	@SuppressWarnings("unchecked")
	public List<ManagementVO> selectPmJustice(ManagementVO vo) throws Exception {
		return list("managementDAO.selectPmJustice", vo);
	}
	@SuppressWarnings("unchecked")
	public List<ManagementVO> selectPmSalary(ManagementVO vo) throws Exception {
		return list("managementDAO.selectPmSalary", vo);
	}
	@SuppressWarnings("unchecked")
	public List<ManagementVO> selectPmAssessment(ManagementVO vo) throws Exception {
		return list("managementDAO.selectPmAssessment", vo);
	}
	@SuppressWarnings("unchecked")
	public List<ManagementVO> selectPmStock(ManagementVO vo) throws Exception {
		return list("managementDAO.selectPmStock", vo);
	}
	@SuppressWarnings("unchecked")
	public List<ManagementVO> selectPmStockGet(ManagementVO vo) throws Exception {
		return list("managementDAO.selectPmStockGet", vo);
	}
	@SuppressWarnings("unchecked")
	public List<ManagementVO> selectPmProposal(ManagementVO vo) throws Exception {
		return list("managementDAO.selectPmProposal", vo);
	}

	
	/**
	 *
	 * @MethodName : insertFamilyInfo
	 * @param vo
	 */
	public int insertFamilyInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.insertFamilyInfo", vo);
	}
	public int insertAcademicInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.insertAcademicInfo", vo);
	}	
	public int insertCareerInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.insertCareerInfo", vo);
	}
	public int insertLicenseInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.insertLicenseInfo", vo);
	}	
	public int insertInsideCareerInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.insertInsideCareerInfo", vo);
	}	
	public int insertJusticeInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.insertJusticeInfo", vo);
	}	
	public int insertSalaryInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.insertSalaryInfo", vo);
	}	
	public int insertAssessmentInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.insertAssessmentInfo", vo);
	}	
	public int insertPmProposal(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.insertPmProposal", vo);
	}	
	public int insertStockInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.insertStockInfo", vo);
	}	

	/**
	 *
	 * @MethodName : updateFamilyInfo
	 * @param vo
	 */
	public int updateFamilyInfo(ManagementVO vo) throws Exception {
    	return (Integer)update("managementDAO.updateFamilyInfo", vo);
    }
	public int updateAcademicInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.updateAcademicInfo", vo);
	}
	public int updateCareerInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.updateCareerInfo", vo);
	}
	public int updateLicenseInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.updateLicenseInfo", vo);
	}
	public int updateInsideCareerInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.updateInsideCareerInfo", vo);
	}
	public int updateJusticeInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.updateJusticeInfo", vo);
	}
	public int updateSalaryInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.updateSalaryInfo", vo);
	}
	public int updateAssessmentInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.updateAssessmentInfo", vo);
	}
	public int updatePmProposal(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.updatePmProposal", vo);
	}
	public int updateStockInfo(ManagementVO vo) throws Exception {
		return (Integer)update("managementDAO.updateStockInfo", vo);
	}

	/**
	 *
	 * @MethodName : deleteFamilyInfo
	 * @param vo
	 */
	public void deleteFamilyInfo(ManagementVO vo) throws Exception {
    	update("managementDAO.deleteFamilyInfo", vo);
    }
	public void deleteAcademicInfo(ManagementVO vo) throws Exception {
		update("managementDAO.deleteAcademicInfo", vo);
	}
	public void deleteCareerInfo(ManagementVO vo) throws Exception {
		update("managementDAO.deleteCareerInfo", vo);
	}
	public void deleteLicenseInfo(ManagementVO vo) throws Exception {
		update("managementDAO.deleteLicenseInfo", vo);
	}
	public void deleteInsideCareerInfo(ManagementVO vo) throws Exception {
		update("managementDAO.deleteInsideCareerInfo", vo);
	}
	public void deleteJusticeInfo(ManagementVO vo) throws Exception {
		update("managementDAO.deleteJusticeInfo", vo);
	}
	public void deleteSalaryInfo(ManagementVO vo) throws Exception {
		update("managementDAO.deleteSalaryInfo", vo);
	}
	public void deleteAssessmentInfo(ManagementVO vo) throws Exception {
		update("managementDAO.deleteAssessmentInfo", vo);
	}
	public void deletePmProposal(ManagementVO vo) throws Exception {
		update("managementDAO.deletePmProposal", vo);
	}
	public void deleteStockInfo(ManagementVO vo) throws Exception {
		update("managementDAO.deleteStockInfo", vo);
	}


}
