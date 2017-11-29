package ib.stats.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ib.recommend.service.RecommendVO;
import ib.stats.service.StatsService;
import ib.work.service.WorkVO;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service("statsService")
public class StatsServiceImpl extends AbstractServiceImpl implements StatsService {

    @Resource(name="statsDAO")
    private StatsDAO statsDAO;
    
    protected static final Log logger = LogFactory.getLog(StatsServiceImpl.class);

    //offer 정보
    public List<WorkVO> selectPrivateOffer(WorkVO workVO) throws Exception {
    	
    	return statsDAO.selectPrivateOffer(workVO);
    }

	
}
