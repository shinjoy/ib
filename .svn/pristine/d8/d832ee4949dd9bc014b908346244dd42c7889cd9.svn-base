package ib.work.service.impl;

import ib.basic.service.CpnExcelVO;
import ib.cmm.FileUpDbVO;
import ib.cmm.service.impl.ComAbstractDAO;
import ib.login.service.StaffVO;
import ib.person.service.PersonVO;
import ib.recommend.service.RecommendVO;
import ib.reply.service.ReplyVO;
import ib.work.service.CusBasicConnectVO;
import ib.work.service.WorkVO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * <pre>
 * package  : ib.work.service.impl
 * filename : WorkDAO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2012. 8. 28.
 * @version : 1.0.0
 */
@Repository("workDAO")
public class WorkDAO extends ComAbstractDAO{
	
	/**
	 *
	 * @MethodName : selectStaffList
	 * @param staffVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectStaffList(StaffVO staffVO) throws Exception{
		return list("workDAO.selectStaffList", staffVO);
	}
	
	/**
	 *
	 * @MethodName : selectBusinessRecordList
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectBusinessRecordList(WorkVO workVO) throws Exception{
		return list("workDAO.selectBusinessRecordList", workVO);
	}
	
    /**
     *
     * @MethodName : updateBusinessRecord
     * @param workVO
     * @throws Exception
     */
    public int updateBusinessRecord(WorkVO workVO) throws Exception {
    	return (Integer)update("workDAO.updateBusinessRecord", workVO);
    }
    
	/**
	 *
	 * @MethodName : deleteBusinessRecord
	 * @param workVO
	 * @throws Exception
	 */
	public int deleteBusinessRecord(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.deleteBusinessRecord",workVO);
	}

	/**
	 *
	 * @MethodName : selectMemoList
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectMemoList(WorkVO workVO) throws Exception {
		return list("workDAO.selectMemoList", workVO);
	}
	/**
	 *
	 * @MethodName : selectReplyList
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectReplyList(WorkVO workVO) throws Exception {
		return list("reply.selectReplyList", workVO);
	}
	
	
	/**
	 *
	 * @MethodName : selectMemoListGrp
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectMemoListGrp(WorkVO workVO) throws Exception {
		return list("workDAO.selectMemoListGrp", workVO);
	}
	
	
    /**
     *
     * @MethodName : insertMemo
     * @param workVO
     * @return
     * @throws Exception
     */
    public int insertMemo(WorkVO workVO) throws Exception {
    	int already = Integer.parseInt((String)selectByPk("workDAO.selectAlreadySend", workVO));
    	
    	if(already == 0){
    		return (Integer)update("workDAO.insertMemo", workVO);
    	}else{
    		return 0;
    	}
    }
    
    /**
     *
     * @MethodName : checkMemo
     * @param workVO
     * @return
     * @throws Exception
     */
    public int checkMemo(WorkVO workVO) throws Exception {
    	return (Integer)update("workDAO.checkMemo", workVO);
    }

    /**
     *
     * @MethodName : updateMemo
     * @param workVO
     * @return
     * @throws Exception
     */
    public int updateMemo(WorkVO workVO) throws Exception {
    	return (Integer)update("workDAO.updateMemo", workVO);
    }

    /**
     *
     * @MethodName : selectOfferList
     * @param workVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	public List<WorkVO> selectOfferList(WorkVO workVO) throws Exception {
    	return list("workDAO.selectOfferList", workVO);
	}

    /**
     *
     * @MethodName : selectOfferListNfile
     * @param workVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<WorkVO> selectOfferListNfile(WorkVO workVO) throws Exception {
    	return list("workDAO.selectOfferListNfile", workVO);
    }
    
	/**
	 *
	 * @MethodName : updateFeedback
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int updateFeedback(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.updateFeedback", workVO);
	}

	/**
	 *
	 * @MethodName : updateprogressCd
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int updateprogressCd(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.updateprogressCd", workVO);
	}

	/**
	 *
	 * @MethodName : deleteMemo
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int deleteMemo(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.deleteMemo",workVO);
	}

	/**
	 *
	 * @MethodName : updateDealMemo
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int updateDealMemo(WorkVO workVO) throws Exception {
    	return (Integer)update("workDAO.updateDealMemo", workVO);
	}

	/**
	 *
	 * @MethodName : updateDueDate
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int updateDueDate(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.updateDueDate", workVO);
	}

	/**
	 *
	 * @MethodName : updateDealResult
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int updateDealResult(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.updateDealResult", workVO);
	}

	/**
	 *
	 * @MethodName : selectCommentMnaList
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectCommentMnaList(WorkVO workVO) throws Exception {
    	return list("workDAO.selectCommentMnaList", workVO);
	}

	/**
	 *
	 * @MethodName : selectOfferMainList
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectOfferMainList(WorkVO workVO) throws Exception {
    	return list("workDAO.selectOfferMainList", workVO);
	}

	/**
	 *
	 * @MethodName : selectOfferCpnList
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectOfferCpnList(WorkVO workVO) throws Exception {
    	return list("workDAO.selectOfferCpnList", workVO);
	}

	/**
	 *
	 * @MethodName : insertBusinessRecord
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int insertBusinessRecord(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.insertBusinessRecord", workVO);
	}

	/**
	 *
	 * @MethodName : updateDeal
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int updateDeal(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.updateDeal", workVO);
	}

	/**
	 *
	 * @MethodName : selectOffercontactPoint
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectOffercontactPoint(WorkVO workVO) throws Exception {
    	return list("workDAO.selectOffercontactPoint", workVO);
	}

	/**
	 *
	 * @MethodName : insertDeal
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int insertDeal(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.insertDeal", workVO);
	}

	/**
	 *
	 * @MethodName : insertCommentMna
	 * @param companyVO
	 * @return
	 * @throws Exception
	 */
	public int insertCommentMna(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.insertCommentMna", workVO);
	}

	/**
	 *
	 * @MethodName : updateCommentMna
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int updateCommentMna(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.updateCommentMna", workVO);
	}

	/**
	 *
	 * @MethodName : updatePrecessResult
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int updatePrecessResult(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.updatePrecessResult", workVO);
	}

	/**
	 *
	 * @MethodName : selectBusinessRecordStaffList
	 * @param staffVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectBusinessRecordStaffList(WorkVO VO) throws Exception {
    	return list("workDAO.selectBusinessRecordStaffList", VO);
	}

	/**
	 *
	 * @MethodName : selectMaxSnb
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectMaxSnb(WorkVO VO) throws Exception {
    	return list("workDAO.selectMaxSnb", VO);
	}

	/**
	 *
	 * @MethodName : insertFileInfo
	 * @param fileVo
	 * @return
	 */
	public int insertFileInfo(FileUpDbVO VO) throws Exception {
		return (Integer)update("workDAO.insertFileInfo", VO);
	}

	/**
	 *
	 * @MethodName : selectofferKeyPoint
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PersonVO> selectofferKeyPoint(WorkVO VO) throws Exception {
    	return list("workDAO.selectofferKeyPoint", VO);
	}

	/**
	 *
	 * @MethodName : selectOfferCpnList2
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectOfferCpnList2(WorkVO VO) throws Exception {
    	return list("workDAO.selectOfferCpnList2", VO);
	}
	
	/**
	 *
	 * @MethodName : selectOfferCpnList2
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectOffercontactPoint2(WorkVO VO) throws Exception {
		return list("workDAO.selectOffercontactPoint2", VO);
	}

	/**
	 *
	 * @MethodName : selectOutStaffList
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectOutStaffList(StaffVO staffVO) throws Exception {
		return list("workDAO.selectOutStaffList", staffVO);
	}

	/**
	 *
	 * @MethodName : selectFileInfo
	 * @param fileVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<FileUpDbVO> selectFileInfo(FileUpDbVO VO) throws Exception {
		return list("workDAO.selectFileInfo", VO);
	}

	/**
	 *
	 * @MethodName : updateOfferCoworker
	 * @param workVO
	 * @return
	 */
	public int updateOfferCoworker(WorkVO VO) throws Exception {
		return (Integer)update("workDAO.updateOfferCoworker", VO);
	}

	/**
	 *
	 * @MethodName : updateOfferProcess
	 * @param workVO
	 * @return
	 */
	public int updateOfferProcess(WorkVO VO) throws Exception {
		return (Integer)update("workDAO.updateOfferProcess", VO);
	}

	/**
	 *
	 * @MethodName : updateSendedMemo
	 * @param workVO
	 * @return
	 */
	public int updateSendedMemo(WorkVO workVO) throws Exception {
    	return (Integer)update("workDAO.updateSendedMemo", workVO);
    }

	/**
	 *
	 * @MethodName : deleteOffer
	 * @param workVO
	 * @return
	 */
	public int deleteOffer(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.deleteOffer",workVO);
	}

	/**
	 *
	 * @MethodName : selectCusBasicConnet
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CusBasicConnectVO> selectCusBasicConnet(CusBasicConnectVO VO) throws Exception {
		return list("workDAO.selectCusBasicConnet", VO);
	}

	/**
	 *
	 * @MethodName : insertCusBasic
	 * @param VO
	 * @return
	 * @throws Exception
	 */
	public int insertCusBasic(CusBasicConnectVO VO) throws Exception {
		return (Integer)update("workDAO.insertCusBasic", VO);
	}

	/**
	 *
	 * @MethodName : updateCusBasic
	 * @param cusVO
	 * @return
	 */
	public int updateCusBasic(CusBasicConnectVO VO) throws Exception {
    	return (Integer)update("workDAO.updateCusBasic", VO);
    }

	/**
	 *
	 * @MethodName : updateFileInfo
	 * @param fileVo1
	 * @return
	 */
	public int updateFileInfo(FileUpDbVO VO) throws Exception {
    	return (Integer)update("workDAO.updateFileInfo", VO);
    }

	/**
	 *
	 * @MethodName : insertSMS
	 * @param workVO
	 * @return
	 */
	public int insertSMS(WorkVO VO) throws Exception {
    	return (Integer)update("workDAO.insertSMS", VO);
    }

	/**
	 *
	 * @MethodName : selectSMS
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectSMS(WorkVO VO) throws Exception {
		return list("workDAO.selectSMS", VO);
	}

	/**
	 *
	 * @MethodName : selectSMSReply
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectSMSReply(WorkVO VO) throws Exception {
		return list("workDAO.selectSMSReply", VO);
	}
	
	/**
	 *
	 * @MethodName : insertReply
	 * @param workVO
	 * @return
	 */
	public int insertReply(WorkVO VO) throws Exception {    	
		return Integer.parseInt(insert("reply.insertReply", VO).toString());
    }

	
	/**
	 *
	 * @MethodName : checkReply
	 * @param workVO
	 * @return
	 */
	public int checkReply(WorkVO VO) throws Exception {
    	return (Integer)update("reply.checkReply", VO);
    }

	/**
	 *
	 * @MethodName : updateReply
	 * @param workVO
	 * @return
	 */
	public int updateReply(WorkVO VO) throws Exception {
    	return (Integer)update("reply.updateReply", VO);
    }

	/**
	 *
	 * @MethodName : deleteReply
	 * @param workVO
	 * @return
	 */
	public int deleteReply(WorkVO VO) throws Exception {
		return (Integer)update("reply.deleteReply",VO);
	}

	/**
	 *
	 * @MethodName : updateCusTrade
	 * @param cusVO
	 * @return
	 */
	public int updateCusTrade(CusBasicConnectVO VO) throws Exception {
		return (Integer)update("workDAO.updateCusTrade",VO);
	}

	/**
	 *
	 * @MethodName : insertCusTrade
	 * @param cusVO
	 * @return
	 */
	public int insertCusTrade(CusBasicConnectVO VO) throws Exception {
		return (Integer)update("workDAO.insertCusTrade",VO);
	}

	/**
	 *
	 * @MethodName : insertCusWorkPer
	 * @param cusVO
	 * @return
	 */
	public int insertCusWorkPer(CusBasicConnectVO VO) throws Exception {
		return (Integer)update("workDAO.insertCusWorkPer",VO);
	}

	/**
	 *
	 * @MethodName : selectOfferPrice
	 * @param cusVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CusBasicConnectVO> selectTotalOfferPrice(CusBasicConnectVO VO) throws Exception {
		return list("workDAO.selectTotalOfferPrice", VO);
	}

	/**
	 *
	 * @MethodName : updateOfferInfoProcess
	 * @param workVO
	 * @return
	 */
	public int updateOfferInfoProcess(WorkVO VO) throws Exception {
		return (Integer)update("workDAO.updateOfferInfoProcess",VO);
	}

	/**
	 *
	 * @MethodName : selectOfferInfo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectOfferInfo(WorkVO VO) throws Exception {
		return list("workDAO.selectOfferInfo", VO);
	}

	/**
	 *
	 * @MethodName : insertOfferInfo
	 * @param workVO
	 * @return
	 */
	public int insertOfferInfo(WorkVO VO) throws Exception {
		return (Integer)update("workDAO.insertOfferInfo",VO);
	}

	/**
	 *
	 * @MethodName : updateOfferInfo
	 * @param workVO
	 * @return 
	 */
	public Integer updateOfferInfo(WorkVO VO) throws Exception {
		return (Integer)update("workDAO.updateOfferInfo",VO);
	}

	/**
	 *
	 * @MethodName : updateOfferInfoLv
	 * @param wVO
	 * @return
	 */
	public int updateOfferInfoLv(WorkVO VO) throws Exception {
		return (Integer)update("workDAO.updateOfferInfoLv",VO);
	}

	/**
	 *
	 * @MethodName : selectComment
	 * @param wVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectComment(WorkVO VO) throws Exception {
		return list("workDAO.selectComment", VO);
	}

	/**
	 *
	 * @MethodName : insertMemoOfDealResult
	 * @param workVO
	 * @return 
	 */
	public Integer insertMemoOfDealResult(WorkVO param) throws Exception {
		param.setSttsCd("");
		insert("workDAO.insertMemoOfDealResult", param);
		
		param.setSttsCd("00001");
		param.setName("");
		return (Integer)update("workDAO.insertMemoOfDealResult", param);
	}

	/**
	 *
	 * @MethodName : selectNetPoint
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectNetPoint(WorkVO VO) throws Exception {
		return list("workDAO.selectNetPoint", VO);
	}

	/**
	 *
	 * @MethodName : selectCstDealInfo
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectCstDealInfo(WorkVO VO) throws Exception {
		return list("workDAO.selectCstDealInfo", VO);
	}

	/**
	 *
	 * @MethodName : selectRecommendOne
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectRecommendOne(WorkVO VO) throws Exception {
		return list("workDAO.selectRecommendOne", VO);
	}

	/**
	 *
	 * @MethodName : selectBusinessTmdt
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectBusinessTmdt(WorkVO VO) throws Exception {
		return list("workDAO.selectBusinessTmdt", VO);
	}

	/**
	 *
	 * @MethodName : updateBusinessTmdt
	 * @param workVO
	 * @return 
	 */
	public Integer updateBusinessTmdt(WorkVO VO) throws Exception {
		return (Integer)update("workDAO.updateBusinessTmdt",VO);
	}

	/**
	 *
	 * @MethodName : selectFileInfoList
	 * @param vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<FileUpDbVO> selectFileInfoList(FileUpDbVO vo) throws Exception {
		return list("workDAO.selectFileInfoList", vo);
	}

	/**
	 *
	 * @param vo 
	 * @MethodName : selectFileInfoListCnt
	 * @param vo
	 * @return
	 */
	public int selectFileInfoListCnt(FileUpDbVO vo) throws Exception {
    	return (Integer)getSqlMapClientTemplate().queryForObject("workDAO.selectFileInfoListCnt",vo);
    }

	/**
	 *
	 * @MethodName : deleteFileInfo
	 * @param vo
	 */
	public int deleteFileInfo(FileUpDbVO VO) throws Exception {
		return (Integer)update("workDAO.deleteFileInfo",VO);
	}

	/**
	 *
	 * @MethodName : selectSameCommentStaffName
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectSameCommentStaffName(WorkVO vo) throws Exception {
		return list("workDAO.selectSameCommentStaffName", vo);
	}

	
	/**
	 *
	 * @MethodName : selectSameCommentStaffNameEach
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectSameCommentStaffNameEach(WorkVO vo) throws Exception {
		return list("workDAO.selectSameCommentStaffNameEach", vo);
	}
	

	/**
	 *
	 * @MethodName : selectSameCommentStaffNameForSms
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String selectSameCommentStaffNameForSms(WorkVO vo) throws Exception {
		return (String)selectByPk("workDAO.selectSameCommentStaffNameForSms", vo);
	}

	/**
	 *
	 * @MethodName : selectStaffList4ib
	 * @param staffVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<StaffVO> selectStaffList4ib(StaffVO vo) throws Exception {
		return list("workDAO.selectStaffList4ib", vo);
	}

	/**
	 *
	 * @MethodName : selectInsideSystemInfo
	 * @param stVo
	 */
	@SuppressWarnings("unchecked")
	public List<StaffVO> selectInsideSystemInfo(StaffVO vo) throws Exception {
		return list("workDAO.selectInsideSystemInfo",vo);
    }

	/**
	 *
	 * @MethodName : selectOfferJointProgress
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectOfferJointProgress(WorkVO vo) throws Exception {
		return list("workDAO.selectOfferJointProgress",vo);
    }

	/**
	 *
	 * @MethodName : updateOfferJointProgress
	 * @param workVO
	 * @return
	 */
	public int updateOfferJointProgress(WorkVO VO) throws Exception {
		return (Integer)update("workDAO.updateOfferJointProgress",VO);
	}

	/**
	 *
	 * @MethodName : insertOfferJointProgress
	 * @param workVO
	 * @return
	 */
	public int insertOfferJointProgress(WorkVO VO) throws Exception {
		return (Integer)update("workDAO.insertOfferJointProgress",VO);
	}

	/**
	 *
	 * @MethodName : deleteOfferJointProgress
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int deleteOfferJointProgress(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.deleteOfferJointProgress",workVO);
	}

	/**
	 *
	 * @MethodName : insertIntroducer
	 * @param workVO
	 * @return
	 */
	public int insertIntroducer(WorkVO VO) throws Exception {
		return (Integer)update("workDAO.insertIntroducer",VO);
	}

	/**
	 *
	 * @MethodName : selectIntroducer
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectIntroducer(WorkVO vo) throws Exception {
		return list("workDAO.selectIntroducer",vo);
    }

	/**
	 *
	 * @MethodName : selectIntroducerOne
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectIntroducerOne(WorkVO vo) throws Exception {
		return list("workDAO.selectIntroducerOne",vo);
    }

	/**
	 *
	 * @MethodName : updateIntroducer
	 * @param workVO
	 * @return
	 */
	public int updateIntroducer(WorkVO VO) throws Exception {
		return (Integer)update("workDAO.updateIntroducer",VO);
	}

	/**
	 *
	 * @MethodName : deleteIntroducer
	 * @param workVO
	 */
	public int deleteIntroducer(WorkVO VO) throws Exception {
		return (Integer)update("workDAO.deleteIntroducer",VO);
	}

	/**
	 *
	 * @MethodName : selectInsideList
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectInsideList(WorkVO vo) throws Exception {
		return list("workDAO.selectInsideList",vo);
    }

	/**
	 *
	 * @MethodName : selectCompanyExploring
	 * @param vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CpnExcelVO> selectCompanyExploring(CpnExcelVO vo) throws Exception {
		return list("workDAO.selectCompanyExploring",vo);
    }

	/**
	 *
	 * @MethodName : updateCompanyExloring
	 * @param vo
	 */
	public int updateCompanyExloring(CpnExcelVO vo) throws Exception {
		return (Integer)update("workDAO.updateCompanyExloring",vo);
	}

	/**
	 *
	 * @MethodName : updateCompanyPbr
	 * @param vo
	 */
	public int updateCompanyPbr(CpnExcelVO vo) throws Exception {
		return (Integer)update("workDAO.updateCompanyPbr",vo);
	}

	/**
	 *
	 * @MethodName : updateCompanyOpinion
	 * @param vo
	 */
	public int updateCompanyOpinion(CpnExcelVO vo) throws Exception {
		return (Integer)update("workDAO.updateCompanyOpinion",vo);
	}

	/**
	 *
	 * @MethodName : selectStaffOfferList
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectStaffOfferList(WorkVO vo) throws Exception {
		return list("workDAO.selectStaffOfferList",vo);
    }

	/**
	 *
	 * @MethodName : updateKeyPointChkMemo
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateKeyPointChkMemo(WorkVO vo) throws Exception {
		return (Integer)update("workDAO.updateKeyPointChkMemo",vo);
	}

	/**
	 *
	 * @MethodName : updateCompanyRank
	 * @param vo
	 */
	public int updateCompanyRank(CpnExcelVO vo) throws Exception {
		return (Integer)update("workDAO.updateCompanyRank",vo);
	}

	/**
	 *
	 * @MethodName : selectExploringCount
	 * @param vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectExploringCount(CpnExcelVO vo) throws Exception {
		return list("workDAO.selectExploringCount",vo);
    }

	/**
	 *
	 * @MethodName : selectHumanNet
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectHumanNet(WorkVO vo) throws Exception {
		return list("workDAO.selectHumanNet",vo);
    }

	/**
	 *
	 * @MethodName : updateNetPointImportance
	 * @param wVO
	 */
	public int updateNetPointImportance(WorkVO vo) throws Exception {
		return (Integer)update("workDAO.updateNetPointImportance",vo);
	}


	/**
	 *
	 * @MethodName : selectAuditList
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectAuditList(WorkVO vo) throws Exception {
		return list("workDAO.selectAuditList",vo);
    }

	/**
	 *
	 * @MethodName : selectResourceList
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectResourceList(WorkVO vo) throws Exception {
		return list("workDAO.selectResourceList",vo);
	}
	
	/**
	 *
	 * @MethodName : selectAuditResourceDetailList
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectAuditResourceDetailList(WorkVO vo) throws Exception {
		return list("workDAO.selectAuditResourceDetailList",vo);
    }

	/**
	 *
	 * @MethodName : selectAuditDetailList
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectAuditDetailList(WorkVO vo) throws Exception {
		return list("workDAO.selectAuditDetailList",vo);
    }

	/**
	 *
	 * @MethodName : selectResourceDetailList
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectResourceDetailList(WorkVO vo) throws Exception {
		return list("workDAO.selectResourceDetailList",vo);
    }

	/**
	 *
	 * @MethodName : selectStaffListWithoutJoinDt
	 * @param staffVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<StaffVO> selectStaffListWithoutJoinDt(StaffVO vo) throws Exception {
		return list("workDAO.selectStaffListWithoutJoinDt",vo);
    }

	/**
	 *
	 * @MethodName : selectOfferAllDealList
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectOfferAllDealList(WorkVO vo) throws Exception {
		return list("workDAO.selectOfferAllDealList",vo);
    }

	/**
	 *
	 * @MethodName : insertMainTableCheck
	 * @param wvo
	 * @return
	 */
	public int insertMainTableCheck(WorkVO vo) throws Exception {
		return (Integer)update("workDAO.insertMainTableCheck",vo);
	}

	/**
	 *
	 * @MethodName : selectMaxSnbINopinion
	 * @param wvo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectMaxSnbINopinion(WorkVO vo) throws Exception {
		return list("workDAO.selectMaxSnbINopinion",vo);
    }

	/**
	 *
	 * @MethodName : selectCompanyOpinion
	 * @param wvo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectCompanyOpinion(WorkVO wvo) throws Exception {
		return list("workDAO.selectCompanyOpinion",wvo);
    }

	/**
	 *
	 * @MethodName : selectBusinessRecordOne
	 * @param vo
	 * @return
	 */
	public Object selectBusinessRecordOne(WorkVO vo) throws Exception {
		return list("workDAO.selectBusinessRecordOne",vo);
    }

	/**
	 *
	 * @MethodName : selectInsideOne
	 * @param vo
	 * @return
	 */
	public Object selectInsideOne(WorkVO vo) throws Exception {
		return list("workDAO.selectInsideOne",vo);
    }

	/**
	 *
	 * @MethodName : selectAnalysisCommentsList
	 * @param vo
	 * @return
	 */
	public Object selectAnalysisCommentsList(WorkVO vo) throws Exception {
		return list("workDAO.selectAnalysisCommentsList",vo);
    }

	/**
	 *
	 * @MethodName : insertMainMemoNreturnSnb
	 * @param workVO
	 */
	public void insertMainMemoNreturnSnb(WorkVO vo) {
		getSqlMapClientTemplate().insert("workDAO.insertMainMemoNreturnSnb", vo);
	}

	/**
	 *
	 * @MethodName : updateProgressCdNmatchCpn
	 * @param workVO
	 * @return
	 */
	public int updateProgressCdNmatchCpn(WorkVO vo) throws Exception {
		return (Integer)update("workDAO.updateProgressCdNmatchCpn",vo);
	}

	/**
	 *
	 * @MethodName : selectOfferMnaStaff
	 * @param vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectOfferMnaStaff(WorkVO vo) throws Exception {
		return list("workDAO.selectOfferMnaStaff",vo);
    }

	/**
	 *
	 * @MethodName : deleteOfferMnaStaff
	 * @param vo
	 */
	public void deleteOfferMnaStaff(WorkVO vo) throws Exception {
		update("workDAO.deleteOfferMnaStaff",vo);
	}

	/**
	 *
	 * @MethodName : insertOfferMnaStaff
	 * @param vo
	 * @return
	 */
	public void insertOfferMnaStaff(WorkVO vo) throws Exception {
		insert("workDAO.insertOfferMnaStaff",vo);
	}

	/**
	 *
	 * @MethodName : selectStaffOfferListCnt
	 * @param workVO
	 * @return
	 */
	public int selectStaffOfferListCnt(WorkVO vo) throws Exception {
    	return (Integer)getSqlMapClientTemplate().queryForObject("workDAO.selectStaffOfferListCnt", vo);
	}

	/**
	 *
	 * @MethodName : selectOpinion
	 * @param w1vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectOpinion(WorkVO vo) throws Exception {
		return list("workDAO.selectOpinion",vo);
    }

	/**
	 *
	 * @MethodName : deleteFileInfoOfOfferSnb
	 * @param fvo
	 */
	public void deleteFileInfoOfOfferSnb(FileUpDbVO vo) throws Exception {
		update("workDAO.deleteFileInfoOfOfferSnb",vo);
	}

	/**
	 *
	 * @MethodName : updateOfferCpnId
	 * @param ofVo
	 */
	public int updateOfferCpnId(WorkVO vo) throws Exception {
		return (Integer)update("workDAO.updateOfferCpnId", vo);
	}

	/**
	 *
	 * @MethodName : selectMainOfferList
	 * @param w3vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectMainOfferList(WorkVO vo) throws Exception {
		return list("workDAO.selectMainOfferList",vo);
    }

	/**
	 *
	 * @MethodName : selectofferInfoInCpnCst
	 * @param workVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectofferInfoInCpnCst(WorkVO vo) throws Exception {
		return list("workDAO.selectofferInfoInCpnCst",vo);
    }

	/**
	 *
	 * @MethodName : selectMemo4insertFile
	 * @return
	 */
	public String selectMemo4insertFile(WorkVO vo) throws Exception {
		return (String)getSqlMapClientTemplate().queryForObject("workDAO.selectMemo4insertFile",vo);
    }

	/**
	 *
	 * @MethodName : getStaffName
	 * @param rgId
	 * @return
	 */
	public String getStaffName(String rgId) {
		return (String)getSqlMapClientTemplate().queryForObject("workDAO.getStaffName",rgId);
	}

	/**
	 *
	 * @MethodName : selectReply4insertFile
	 * @param vo
	 * @return
	 */
	public String selectReply4insertFile(WorkVO vo) throws Exception {
		return (String)getSqlMapClientTemplate().queryForObject("workDAO.selectReply4insertFile",vo);
    }

	/**
	 *
	 * @MethodName : deleteOfferInfo
	 * @param vo
	 */
	public int deleteOfferInfo(WorkVO vo) throws Exception {
		return (Integer)update("workDAO.deleteOfferInfo",vo);
	}

	/**
	 *
	 * @MethodName : deleteSubMemo
	 * @param workVO
	 * @return
	 */
	public int deleteSubMemo(WorkVO vo) throws Exception {
		return (Integer)update("workDAO.deleteSubMemo",vo);
	}

	/**
	 *
	 * @MethodName : selectOpinionNdeal
	 * @param vo
	 * @return
	 */
	public Object selectOpinionNdeal(WorkVO vo) throws Exception {
		return list("workDAO.selectOpinionNdeal",vo);
    }

	/**
	 *
	 * @MethodName : modifySttsCd
	 * @param workVO
	 */
	public int modifySttsCd(WorkVO vo) throws Exception {
		return (Integer)update("workDAO.modifySttsCd",vo);
	}

	/**
	 *
	 * @MethodName : deleteMaintableCheck
	 * @param workVO
	 * @return 
	 */
	public Integer deleteMaintableCheck(WorkVO workVO) throws Exception {
		return (Integer)update("workDAO.deleteMaintableCheck",workVO);
	}

	/**
	 * 
	 * @MethodName : selectDisposalList
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 2. 5.
	 */
	@SuppressWarnings("unchecked")
	public List<ReplyVO> selectDisposalList(ReplyVO vo) throws Exception {
		return list("reply.selectDisposalList",vo);
    }

	/**
	 * 
	 * @MethodName : selectEncrypt
	 * @return
	 * @author : user
	 * @since : 2015. 2. 11.
	 */
	public String selectEncrypt(WorkVO vo) throws Exception {
		return (String)getSqlMapClientTemplate().queryForObject("workDAO.selectEncrypt",vo);
    }

	/**
	 * 
	 * @MethodName : selectSupporterList
	 * @param staffVO
	 * @return
	 * @author : user
	 * @since : 2015. 2. 23.
	 */
	public Object selectSupporterList(ReplyVO vo) throws Exception {
		return list("reply.selectSupporterList",vo);
    }

	/**
	 * 
	 * @MethodName : updateDisposal
	 * @param vo1
	 * @author : user
	 * @return 
	 * @since : 2015. 2. 23.
	 */
	public Integer updateDisposal(ReplyVO vo) throws Exception {
		return (Integer)update("reply.updateDisposal",vo);
	}

	/**
	 * 
	 * @MethodName : insertDisposal
	 * @param vo1
	 * @author : user
	 * @since : 2015. 2. 23.
	 */
	public String insertDisposal(ReplyVO vo) throws Exception {
		return (String)insert("reply.insertDisposal",vo);
	}

	/**
	 * 
	 * @MethodName : insertSupporter
	 * @param vo2
	 * @author : user
	 * @return 
	 * @since : 2015. 2. 23.
	 */
	public Integer insertSupporter(ReplyVO vo) throws Exception {
		return (Integer)insert("reply.insertSupporter",vo);
	}

	/**
	 * 
	 * @MethodName : deleteDisposal
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 2. 24.
	 */
	public Integer deleteDisposal(ReplyVO vo) throws Exception {
		return (Integer)update("reply.deleteDisposal",vo);
	}

	/**
	 * 
	 * @MethodName : deleteSupporter
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 2. 24.
	 */
	public Integer deleteSupporter(ReplyVO vo) throws Exception {
		return (Integer)update("reply.deleteSupporter",vo);
	}

	/**
	 * 
	 * @MethodName : selectOutcomeList
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 2. 25.
	 */
	public Object selectOutcomeList(WorkVO vo) throws Exception {
		return list("workDAO.selectOutcomeList",vo);
    }

	/**
	 * 
	 * @MethodName : selectDisposalList4stats
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 3. 9.
	 */
	@SuppressWarnings("unchecked")
	public List<ReplyVO> selectDisposalList4stats(ReplyVO vo) throws Exception {
		return list("reply.selectDisposalList4stats",vo);
    }

	/**
	 * 
	 * @MethodName : selectStaffList4incharge
	 * @param staffVO
	 * @return
	 * @author : user
	 * @since : 2015. 3. 10.
	 */
	@SuppressWarnings("unchecked")
	public List<StaffVO> selectStaffList4incharge(StaffVO vo) throws Exception {
		return list("workDAO.selectStaffList4incharge",vo);
    }

	/**
	 * 
	 * @MethodName : insertMnaMatchCpn
	 * @author : user
	 * @since : 2015. 3. 25.
	 */
	public Integer insertMnaMatchCpn(WorkVO vo) throws Exception {
		return (Integer)insert("workDAO.insertMnaMatchCpn",vo);
	}

	/**
	 * 
	 * @MethodName : selectMnaMatchCpnList
	 * @param rcmdVO
	 * @return
	 * @author : user
	 * @since : 2015. 3. 26.
	 */
	@SuppressWarnings("unchecked")
	public List<RecommendVO> selectMnaMatchCpnList(RecommendVO vo) throws Exception {
		return list("workDAO.selectMnaMatchCpnList",vo);
    }

	/**
	 * 
	 * @MethodName : deleteMnaMatchCpn
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 3. 31.
	 */
	public int deleteMnaMatchCpn(WorkVO vo) throws Exception {
		return (Integer)update("workDAO.deleteMnaMatchCpn",vo);
	}

	/**
	 * 
	 * @MethodName : selectMatrixList
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 4. 10.
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectMatrixList(WorkVO vo) throws Exception {
		return list("workDAO.selectMatrixList",vo);
    }

	/**
	 * 
	 * @MethodName : updateFileInfoCheckReport
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 4. 23.
	 */
	public int updateFileInfoCheckReport(WorkVO vo) {
		return (Integer)update("workDAO.updateFileInfoCheckReport",vo);
	}

	/**
	 * 
	 * @MethodName : selectMatrix2List
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 5. 8.
	 */
	@SuppressWarnings("unchecked")
	public List<WorkVO> selectMatrix2List(WorkVO vo) throws Exception {
		return list("workDAO.selectMatrix2List",vo);
    }

	/**
	 * 
	 * @MethodName : updateMnaMatchComment
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 5. 15.
	 */
	public int updateMnaMatchComment(WorkVO vo) {
		return (Integer)update("workDAO.updateMnaMatchComment",vo);
	}

	/**
	 * 
	 * @MethodName : selectMatrix3List
	 * @param cmmnMap
	 * @return
	 * @author : user
	 * @since : 2015. 5. 26.
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMatrix3List(
			Map<String, Object> cmmnMap) throws Exception {
				return list("workDAO.selectMatrix3List",cmmnMap);
		    }

	/**
	 * 
	 * @MethodName : updateMiddleOfferCd
	 * @param vo
	 * @return
	 * @author : user
	 * @since : 2015. 6. 9.
	 */
	public int updateMiddleOfferCd(WorkVO vo) {
		return (Integer)update("workDAO.updateMiddleOfferCd",vo);
	}

	
	/**
	 * 
	 * @MethodName : deleteFile
	 * @param
	 * @return
	 * @author : oys
	 * @since : 2015. 10. 1.
	 */
	public int deleteFile(Map<String, String> map) throws Exception {
		return update("workDAO.deleteFile", map);
	}

	
	
	/**
	 * 정보등급별 사용자 리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 2.
	 */
	public List<Map> getInfoLevelUser(Map<String, String> map) throws Exception {
		
		return list("work.selectInfoLevelUser", map);
	}

	
	/**
	 * 정보등급별 사용자 리스트(M&A)
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 2.
	 */
	public List<Map> getMnaLevelUser(Map<String, String> map) throws Exception {
		
		return list("work.selectMnaLevelUser", map);
	}

	
	/**
	 * 정보등급 리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 3.
	 */
	public List<String> getInfoLevelList() throws Exception {
	
		return list("work.selectInfoLevelList", null);
	}

		
	/**
	 * 투자심의 정보 리스트
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 25.
	 */
	public List<Map> getInvestInfo(Map<String, String> map) throws Exception {
		return list("work.selectInvestInfo", map);
	}

		
	/**
	 * 투자심의 정보 저장
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 5. 27.
	 */
	public int regMyInvest(Map<String, Object> map) throws Exception {
		return update("work.insertMyInvest", map);
	}

		
	/**
	 * 중개 정보 상세
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2016. 12. 16.
	 */
	public List<Map> mediateInfo(Map map) throws Exception {
		return list("stats.selectMediateInfo", map);
	}

		
	/**
	 * 통계일(투자결정기준일) 저장
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 3. 6.
	 */
	public int doSaveInvestDt(Map<String, Object> map) throws Exception {
		return update("work.doSaveInvestDt", map);
	}

	
	/**
	 * 최근 댓글 등록일 기준 업무보고(메모)
	 *
	 * @MethodName : selectMemoReplyRgDtList
	 * @param workVO
	 * @return
	 * @throws Exception
	 */	
	public List<WorkVO> selectMemoReplyRgDtList(WorkVO workVO) throws Exception {
		return list("workDAO.selectMemoReplyRgDtList", workVO);
	}
	
	
	/**
	 * 내가쓴글 참조인 수신여부
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 7. 18.
	 */
	public WorkVO checkMemoOpened(WorkVO workVO) throws Exception {
		
		return (WorkVO)(list("workDAO.checkMemoOpened", workVO).get(0));
	}
	

	/**
	 * 회사명 수정
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 8. 9.
	 */
	public int modifyCpnNm(Map<String, Object> map) throws Exception {
		return update("work.modifyCpnNm", map);
	}

	
	/**
	 * 회사명 간단 조회
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 8. 9.
	 */
	public List<Map> getSimpleCompanyInfo(Map<String, String> map) throws Exception {
		return list("work.selectSimpleCompanyInfo", map);
	}
	
	/**
	 * 투자사(경쟁사) 등록
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: user
	 * @date		: 2017. 8. 22.
	 */
	public int insertInvestorCompany(Map<String, Object> map) throws Exception{
		return (Integer)update("work.insertInvestorCompany", map);
	}
	/**
	 * 투자사(경쟁사) 등록시 중복 체크
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: user
	 * @date		: 2017. 8. 25.
	 */
	public int selectInvestorCompany(Map<String, Object> map) {
		return (Integer)getSqlMapClientTemplate().queryForObject("work.selectInvestorCompany", map);
	}
	/**
	 * 투자사(경쟁사) 담당자명 수정
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: user
	 * @date		: 2017. 8. 23.
	 */
	public int modifyInvestorManager(Map<String, Object> map) {
		return update("work.modifyInvestorManager", map);
	}
	
	/**
	 * 투자사(경쟁사) 담당자명 검색
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: user
	 * @date		: 2017. 8. 23.
	 */
	public int selectInvestorManager(Map<String, Object> map) {
		return (Integer)getSqlMapClientTemplate().queryForObject("work.selectInvestorManager", map);
	}
	/**
	 * 투자사(경쟁사) 담당자명 등록
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: user
	 * @date		: 2017. 8. 23.
	 */
	public int insertInvestorManager(Map<String, Object> map) throws Exception{
		return (Integer)update("work.insertInvestorManager", map);
	}
	
	/**
	 * 투자사(경쟁사) 삭제
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: user
	 * @date		: 2017. 9. 12.
	 */
	public int delInvestorCompany(Map<String, Object> map) throws Exception{
		return update("work.delInvestorCompany", map);
	}
	 
	 
	//딜리스트  
	@SuppressWarnings("unchecked")
	public List<Map> selectOfferAllDealListForMobile(WorkVO vo) throws Exception {
		return list("work.selectOfferAllDealListForMobile",vo);
    }
	
	//offer 등록 return snb
	public int insertDealReturnSnb(WorkVO workVO) throws Exception {
		return Integer.parseInt(insert("workDAO.insertDeal", workVO).toString());
	}	
	
	//딜 코멘트 리스트
	public List<Map> selectDealCommentList(Map<String, Object> map) throws Exception {
		return list("work.selectDealCommentList", map);
	}

	//딜 & 코멘트 메인 카운트(모바일)
	public Map<String, Object> getMainDealNCommentCount(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>)selectByPk("work.getMainDealNCommentCount", map);
	}
	
	//오늘 등록된 딜
	public List<Map> getTodayDeal(Map<String, Object> map) throws Exception {
		
		return list("work.getTodayDeal", map);
	}
	
	//오늘 등록된 딜 코멘트
	public List<Map> getTodayDealComment(Map<String, Object> map) throws Exception {
		
		return list("work.getTodayDealComment", map);
	}
	
	
}