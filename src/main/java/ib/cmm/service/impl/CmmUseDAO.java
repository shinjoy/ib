package ib.cmm.service.impl;

import ib.cmm.ComDefaultCodeVO;
import ib.cmm.service.CmmnDetailCode;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * @Class Name : CmmUseDAO.java
 * @Description : 공통코드등 전체 업무에서 공용해서 사용해야 하는 서비스를 정의하기위한 데이터 접근 클래스
 * @Modification Information
 *
 *    수정일       수정자         수정내용
 *    -------        -------     -------------------
 *    2009. 3. 11.     이삼섭
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 3. 11.
 * @version
 * @see
 *
 */
@Repository("CmmUseDAO")
public class CmmUseDAO extends ComAbstractDAO {

    /**
     * 주어진 조건에 따른 공통코드를 불러온다.
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectCmmCodeDetail(ComDefaultCodeVO vo) throws Exception {
	return list("CmmUseDAO.selectCmmCodeDetail", vo);
    }

    /**
     * 공통코드로 사용할 조직정보를 를 불러온다.
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectOgrnztIdDetail(ComDefaultCodeVO vo) throws Exception {
	return list("CmmUseDAO.selectOgrnztIdDetail", vo);
    }

    /**
     * 공통코드로 사용할그룹정보를 를 불러온다.
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectGroupIdDetail(ComDefaultCodeVO vo) throws Exception {
	return list("CmmUseDAO.selectGroupIdDetail", vo);
    }
    
    
	/**
	 * 시스템 개선요청 안읽은 건수
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 11.
	 */
	public Integer selectSystemReqNoReadCnt(String sabun) throws Exception {
		String cnt = "0";
		List result = (List)list("common.selectSystemReqNoReadCnt", sabun);
		if(result != null && result.size() > 0 && result.get(0) != null){
			cnt = result.get(0).toString();
		}
		
		return Integer.parseInt(cnt);
	}
}
