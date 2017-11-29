package ib.cmm.service;

import ib.cmm.ComCodeVO;
import ib.cmm.ComDefaultCodeVO;
import ib.cmm.LoginVO;
import ib.login.service.StaffVO;

import java.util.List;
import java.util.Map;


/**
 * <pre>
 * package  : ib.cmm.service
 * filename : CmmUseService.java
 * </pre>
 * 
 * @author  : user
 * @since   : 2014. 5. 21.
 * @version : 1.0.0
 */
public interface CmmUseService {
	
    /**
     * 공통코드를 조회한다.
     * 
     * @param vo
     * @return List(코드)
     * @throws Exception
     */
    public List<CmmnDetailCode> selectCmmCodeDetail(ComDefaultCodeVO vo) throws Exception;

    /**
     * ComDefaultCodeVO의 리스트를 받아서 여러개의 코드 리스트를 맵에 담아서 리턴한다.
     * 
     * @param voList
     * @return Map(코드)
     * @throws Exception
     */
    @SuppressWarnings("rawtypes")
	public Map<String, List<CmmnDetailCode>> selectCmmCodeDetails(List voList) throws Exception;

    /**
     * 조직정보를 코드형태로 리턴한다.
     * 
     * @param 조회조건정보 vo
     * @return 조직정보 List
     * @throws Exception
     */
    public List<CmmnDetailCode> selectOgrnztIdDetail(ComDefaultCodeVO vo) throws Exception;

    /**
     * 그룹정보를 코드형태로 리턴한다.
     * 
     * @param 조회조건정보 vo
     * @return 그룹정보 List
     * @throws Exception
     */
    public List<CmmnDetailCode> selectGroupIdDetail(ComDefaultCodeVO vo) throws Exception;
    
    /**
     *
     * @MethodName : CommonCdList
     * @param menuCd
     * @param id
     * @return
     * @throws Exception
     */
    public List<ComCodeVO> CommonCdList(String menuCd,String id) throws Exception;
    /**
     *
     * @MethodName : CommonCdListAll
     * @param menuCd
     * @return
     * @throws Exception
     */
    public List<ComCodeVO> CommonCdList(String menuCd) throws Exception;
    /**
     *
     * @param staffVO 
     * @MethodName : UserList
     * @return
     * @throws Exception
     */
    public Object UserList(StaffVO staffVO) throws Exception;

    
	/**
	 * 시스템 개선요청 안읽은 건수
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 11.
	 */
	public Integer selectSystemReqNoReadCnt(String sabun) throws Exception;
}
