package ib.company.service;

import ib.cmm.LoginVO;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * <pre>
 * package	: 
 * filename	: 
 * </pre>
 * 
 * 
 * 
 * @author	: oys
 * @date	: 2016. 01. 15.
 * @version : 
 *
 */
public interface CompanyService {

	//회사 일괄 업로드 - CSV
	//Map regCustomer(Map<String, Object> map) throws Exception;
	Map uploadCompanyProcess(LoginVO loginUser, File fNewname1) throws Exception;
	
}
