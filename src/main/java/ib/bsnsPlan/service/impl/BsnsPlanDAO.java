/**
 * 
 */
package ib.bsnsPlan.service.impl;

import ib.bsnsPlan.service.BsnsPlanVO;
import ib.cmm.service.impl.ComAbstractDAO;

import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package  : ib.bsnsPlan.service.impl
 * filename : bsnsPlanDAO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 12. 26.
 * @version : 1.0.0
 */
@Repository("bsnsPlanDAO")
public class BsnsPlanDAO extends ComAbstractDAO{

	/**
	 *
	 * @MethodName : selectBsnsPlanList
	 * @param bsnsPlanVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<BsnsPlanVO> selectBsnsPlanList(BsnsPlanVO VO) {
		return list("bsnsPlanDAO.selectBsnsPlanList", VO);
	}

	/**
	 *
	 * @MethodName : updateBsnsPlan
	 * @param bsnsPlanVO
	 */
	public int updateBsnsPlan(BsnsPlanVO vo) throws Exception {
    	return (Integer)update("bsnsPlanDAO.updateBsnsPlan", vo);
    }

	/**
	 *
	 * @MethodName : insertBsnsPlan
	 * @param bsnsPlanVO
	 */
	public int insertBsnsPlan(BsnsPlanVO vo) throws Exception {
    	return (Integer)update("bsnsPlanDAO.insertBsnsPlan", vo);
    }

	/**
	 *
	 * @MethodName : updateBsnsPlanNote
	 * @param vo
	 */
	public int updateBsnsPlanNote(BsnsPlanVO vo) throws Exception {
    	return (Integer)update("bsnsPlanDAO.updateBsnsPlanNote", vo);
    }

	/**
	 *
	 * @MethodName : deleteBsnsPlan
	 * @param vo
	 */
	public void deleteBsnsPlan(BsnsPlanVO vo) throws Exception {
    	update("bsnsPlanDAO.deleteBsnsPlan", vo);
    }

	/**
	 *
	 * @MethodName : updateBusinessPlanTmdt
	 * @param vo
	 * @return
	 */
	public int updateBusinessPlanTmdt(BsnsPlanVO vo) throws Exception {
    	return update("bsnsPlanDAO.updateBusinessPlanTmdt", vo);
    }



}
