package ib.stats.service;


import ib.recommend.service.RecommendVO;
import ib.work.service.WorkVO;

import java.util.List;
import java.util.Map;


/**
 * <pre>
 * package	: ib.stats.service 
 * filename	: StatsService.java
 * </pre>
 * 
 * 
 *
 */
public interface StatsService {

	//offer 정보
	List<WorkVO> selectPrivateOffer(WorkVO workVO) throws Exception;

	
}
