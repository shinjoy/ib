/**
 * 
 */
package ib.network.service.impl;

import ib.cmm.service.impl.ComAbstractDAO;
import ib.person.service.PersonVO;
import ib.work.service.WorkVO;

import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package  : ib.network.web
 * filename : networkDAO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2014. 2. 27.
 * @version : 1.0.0
 */
@Repository("networkDAO")
public class NetworkDAO extends ComAbstractDAO{

	/**
	 *
	 * @MethodName : selectNetworkList
	 * @param wVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectNetworkList(WorkVO VO) throws Exception{
		return list("networkDAO.selectNetworkList", VO);
	}

	/**
	 *
	 * @MethodName : selectIntegrateSearchList
	 * @param wVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectIntegrateSearchList(WorkVO VO) throws Exception{
		return list("networkDAO.selectIntegrateSearchList", VO);
	}

	/**
	 *
	 * @MethodName : selectStaffNetList
	 * @param wVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectStaffNetList(WorkVO VO) throws Exception{
		return list("networkDAO.selectStaffNetList", VO);
	}

	/**
	 *
	 * @MethodName : selectStaffNetListCnt
	 * @param wVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectStaffNetListCnt(WorkVO VO) throws Exception{
		return list("networkDAO.selectStaffNetListCnt", VO);
	}

	/**
	 *
	 * @MethodName : insertStaffNetwork
	 * @param wVO
	 * @return
	 */
	public int insertStaffNetwork(WorkVO VO) throws Exception{
		return (Integer)update("networkDAO.insertStaffNetwork", VO);
	}

	/**
	 *
	 * @MethodName : updateStaffNetwork
	 * @param wVO
	 * @return
	 */
	public int updateStaffNetwork(WorkVO VO) throws Exception{
		return (Integer)update("networkDAO.updateStaffNetwork", VO);
	}

	/**
	 *
	 * @MethodName : deleteStaffNetwork
	 * @param wVO
	 * @return
	 */
	public int deleteStaffNetwork(WorkVO VO) throws Exception{
		return (Integer)update("networkDAO.deleteStaffNetwork", VO);
	}

	/**
	 *
	 * @MethodName : selectNetworkCnt
	 * @param workVO
	 * @return
	 */
	public int selectNetworkCnt(WorkVO vo) {
		return (Integer)getSqlMapClientTemplate().queryForObject("networkDAO.selectNetworkCnt",vo);
	}

	/**
	 *
	 * @MethodName : selectStaffInNetworkCnt
	 * @param vo
	 * @return
	 */
	public int selectStaffInNetworkCnt(WorkVO vo) {
		return (Integer)getSqlMapClientTemplate().queryForObject("networkDAO.selectStaffInNetworkCnt",vo);
	}

	/**
	 *
	 * @MethodName : selectDuplicateCheckStaffNetworkCnt
	 * @param wVO
	 * @return 
	 */
	public int selectDuplicateCheckStaffNetworkCnt(WorkVO vo) {
		return (Integer)getSqlMapClientTemplate().queryForObject("networkDAO.selectDuplicateCheckStaffNetworkCnt",vo);
	}

	/**
	 * 
	 * @MethodName : selectStaffInchargeList
	 * @param wVO
	 * @return
	 * @author : user
	 * @since : 2015. 3. 10.
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectStaffInchargeList(WorkVO VO) throws Exception{
		return list("networkDAO.selectStaffInchargeList", VO);
	}

}
