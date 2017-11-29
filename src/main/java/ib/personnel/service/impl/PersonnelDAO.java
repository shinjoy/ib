/**
 * 
 */
package ib.personnel.service.impl;

import ib.personnel.service.PersonnelVO;

import ib.basic.service.CpnExcelVO;
import ib.cmm.service.impl.ComAbstractDAO;

import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package  : ib.personnel.service.impl
 * filename : personnelDAO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 12. 10.
 * @version : 1.0.0
 */
@Repository("personnelDAO")
public class PersonnelDAO extends ComAbstractDAO{

	/**
	 *
	 * @MethodName : selectPersonnelYearList
	 * @param personnelVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<PersonnelVO> selectPersonnelYearList(PersonnelVO  VO) throws Exception {
		return list("personnelDAO.selectPersonnelYearList", VO);
	}

	@SuppressWarnings("unchecked")
	public List<PersonnelVO> selectPersonnelYearList1(PersonnelVO  VO) throws Exception {
		return list("personnelDAO.selectPersonnelYearList1", VO);
	}
	
	/**
	 *
	 * @MethodName : selectPersonnelMonthList
	 * @param personnelVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<PersonnelVO> selectPersonnelMonthList(PersonnelVO  VO) throws Exception {
		return list("personnelDAO.selectPersonnelMonthList", VO);
	}
	@SuppressWarnings("unchecked")
	public List<PersonnelVO> selectPersonnelMonthList1(PersonnelVO  VO) throws Exception {
		return list("personnelDAO.selectPersonnelMonthList1", VO);
	}

	/**
	 *
	 * @MethodName : selectCheckPersonnel
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	public int selectCheckPersonnel(PersonnelVO VO) throws Exception { 
		return (Integer)getSqlMapClientTemplate().queryForObject("personnelDAO.selectCheckPersonnel", VO);
	}

	/**
	 *
	 * @MethodName : insertPersonnel
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertPersonnel(PersonnelVO vo) throws Exception {
    	return (Integer)update("personnelDAO.insertPersonnel", vo);
    }
	
	/**
	 *
	 * @MethodName : updatePersonnel
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updatePersonnel(PersonnelVO vo) throws Exception {
    	return (Integer)update("personnelDAO.updatePersonnel", vo);
    }

	/**
	 *
	 * @MethodName : selectPersonnelYearPassList
	 * @param personnelVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<PersonnelVO> selectPersonnelYearPassList(PersonnelVO  VO) throws Exception {
		return list("personnelDAO.selectPersonnelYearPassList", VO);
	}

	/**
	 *
	 * @MethodName : deletePersonnel
	 * @param vO
	 * @return
	 */
	public int deletePersonnel(PersonnelVO vo) throws Exception {
    	return (Integer)update("personnelDAO.deletePersonnel", vo);
    }

	/**
	 *
	 * @MethodName : selectPersonnelLateList
	 * @param vO
	 * @return
	 */
	public int selectPersonnelLateList(PersonnelVO VO) {
		String tmp = (String)getSqlMapClientTemplate().queryForObject("personnelDAO.selectPersonnelLateList", VO);
		if(tmp==null) tmp = "0";
		return Integer.parseInt(tmp);
	}

	/**
	 *
	 * @MethodName : selectTardinessList
	 * @param personnelVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<PersonnelVO> selectTardinessList(PersonnelVO VO) throws Exception {
		return list("personnelDAO.selectTardinessList", VO);
	}

	/**
	 *
	 * @MethodName : selectTotalTradiness
	 * @param personnelVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<PersonnelVO> selectTotalTradiness(PersonnelVO VO) throws Exception {
		return list("personnelDAO.selectTotalTradiness", VO);
	}

	/**
	 *
	 * @MethodName : selectPenaltyList
	 * @param personnelVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<PersonnelVO> selectPenaltyList(PersonnelVO VO) throws Exception {
		return list("personnelDAO.selectPenaltyList", VO);
	}

}
