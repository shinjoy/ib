package ib.crm.admin.service.impl;

import ib.crm.admin.service.AdminService;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service("adminService")
public class AdminServiceImpl extends AbstractServiceImpl implements AdminService {
	
	@Resource(name = "adminDAO")
	private AdminDAO adminDAO;
	
	
	protected static final Log logger = LogFactory.getLog(AdminServiceImpl.class);
	
	
	//시가 업로드
	public void PriceAddEnd(List list) throws Exception {
		
		try{
		
			for(int i=0; i<list.size(); i++){
				adminDAO.PriceAddEnd((Map)list.get(i));
			}
			
		}catch(Exception e){
			e.printStackTrace();
			logger.error("시가입력 에러!", e);
			throw e;
		}
	}
	
	
}