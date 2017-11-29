package ib.selfImprovement.service.impl;

import ib.cmm.service.impl.ComAbstractDAO;
import ib.person.service.PersonVO;
import ib.personnel.service.PersonnelVO;
import ib.selfImprovement.service.SelfImprovementVO;
import ib.work.service.WorkVO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package  : ib.selfImprovement.service.impl
 * filename : SelfImprovementDAO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2013. 7. 1.
 * @version : 1.0.0
 */
@Repository("selfImprovementDAO")
public class SelfImprovementDAO extends ComAbstractDAO{

	/**
	 *
	 * @MethodName : selectPrivateResult
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<SelfImprovementVO> selectSelfImprovementList(SelfImprovementVO VO) throws Exception {
		return list("selfImprovementDAO.selectSelfImprovementList", VO);
	}

	/**
	 *
	 * @MethodName : insertList
	 * @param selfVO
	 * @return
	 * @throws Exception
	 */
	public Integer insertList(SelfImprovementVO selfVO) throws Exception { 
		return (Integer)update("selfImprovementDAO.insertList", selfVO);
	}

	
	/**
	 *
	 * @MethodName : deletePersonnel
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int deleteSelf(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.deleteSelf", vo);
    }

	/**
	 *
	 * @MethodName : insertNote
	 * @param selfVO
	 * @return
	 */
	public int insertNote(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.insertNote", vo);
    }

	/**
	 *
	 * @MethodName : selectBookList
	 * @param selfVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SelfImprovementVO> selectBookList(SelfImprovementVO VO) throws Exception {
		return list("selfImprovementDAO.selectBookList", VO);
	}

	/**
	 *
	 * @MethodName : selectEpilogueList
	 * @param selfVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SelfImprovementVO> selectEpilogueList(SelfImprovementVO VO) throws Exception {
		return list("selfImprovementDAO.selectEpilogueList", VO);
	}

	/**
	 *
	 * @MethodName : insertBook
	 * @param selfVO
	 * @return
	 */
	public int insertBook(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.insertBook", vo);
    }

	/**
	 *
	 * @MethodName : insertEpilogue
	 * @param selfVO
	 * @return
	 */
	public int insertEpilogue(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.insertEpilogue", vo);
    }

	/**
	 *
	 * @MethodName : deleteBook
	 * @param selfVO
	 * @return
	 */
	public int deleteBook(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.deleteBook", vo);
    }

	/**
	 *
	 * @MethodName : deleteEpilogue
	 * @param selfVO
	 * @return
	 */
	public int deleteEpilogue(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.deleteEpilogue", vo);
    }

	/**
	 *
	 * @MethodName : modifyRent
	 * @param selfVO
	 * @return
	 */
	public int modifyRent(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.modifyRent", vo);
    }

	/**
	 *
	 * @MethodName : updateBook
	 * @param selfVO
	 * @return
	 */
	public int updateBook(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.updateBook", vo);
    }

	/**
	 *
	 * @MethodName : saveReader
	 * @param selfVO
	 * @return
	 */
	public int saveReader(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.saveReader", vo);
    }

	/**
	 *
	 * @MethodName : selectReaderList
	 * @param selfVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SelfImprovementVO> selectReaderList(SelfImprovementVO VO) throws Exception {
		return list("selfImprovementDAO.selectReaderList", VO);
	}

	/**
	 *
	 * @MethodName : deleteReader
	 * @param selfVO
	 */
	public int deleteReader(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.deleteReader", vo);
    }

	/**
	 *
	 * @MethodName : selectReaderListMain
	 * @param w2vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SelfImprovementVO> selectReaderListMain(SelfImprovementVO VO) throws Exception {
		return list("selfImprovementDAO.selectReaderListMain", VO);
	}

	/**
	 *
	 * @MethodName : updateReader
	 * @param selfVO
	 * @return
	 */
	public int updateReader(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.updateReader", vo);
    }

	/**
	 *
	 * @MethodName : selectIdeaList
	 * @param selfVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SelfImprovementVO> selectIdeaList(SelfImprovementVO VO) throws Exception {
		return list("selfImprovementDAO.selectIdeaListMain", VO);
	}

	/**
	 *
	 * @MethodName : saveIdea
	 * @param selfVO
	 * @return
	 */
	public int saveIdea(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.saveIdea", vo);
    }

	/**
	 *
	 * @MethodName : updateIdea
	 * @param selfVO
	 * @return
	 */
	public int updateIdea(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.updateIdea", vo);
    }

	/**
	 *
	 * @MethodName : deleteIdea
	 * @param selfVO
	 * @return
	 */
	public int deleteIdea(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.deleteIdea", vo);
    }

	/**
	 *
	 * @MethodName : selectRcmdList
	 * @param selfVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SelfImprovementVO> selectRcmdList(SelfImprovementVO VO) throws Exception {
		return list("selfImprovementDAO.selectIdeaRcmdListMain", VO);
	}

	/**
	 *
	 * @MethodName : saveRcmd
	 * @param selfVO
	 * @return
	 */
	public int saveRcmd(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.saveRcmd", vo);
    }

	/**
	 *
	 * @MethodName : updateRcmd
	 * @param selfVO
	 * @return
	 */
	public int updateRcmd(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.updateRcmd", vo);
    }

	/**
	 *
	 * @MethodName : deleteRcmd
	 * @param selfVO
	 * @return
	 */
	public int deleteRcmd(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.deleteRcmd", vo);
    }

	/**
	 *
	 * @MethodName : deleteSelfFile
	 * @param selfVO
	 */
	public int deleteSelfFile(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.deleteSelfFile", vo);
    }

	/**
	 *
	 * @MethodName : selectTempFile
	 * @param selfVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SelfImprovementVO> selectTempFile(SelfImprovementVO VO) throws Exception {
		return list("selfImprovementDAO.selectTempFile", VO);
	}

	/**
	 *
	 * @MethodName : updateEval
	 * @param selfVO
	 * @return
	 */
	public int updateEval(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.updateEval", vo);
    }

	/**
	 *
	 * @MethodName : selectIdeaCheck
	 * @param w1vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SelfImprovementVO> selectIdeaCheckList(SelfImprovementVO VO) throws Exception {
		return list("selfImprovementDAO.selectIdeaCheckList", VO);
	}

	/**
	 *
	 * @MethodName : updateProcess
	 * @param selfVO
	 * @return
	 */
	public int updateProcess(SelfImprovementVO vo) throws Exception {
    	return (Integer)update("selfImprovementDAO.updateProcess", vo);
    }

}
