package ib.address.web;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;



@Controller(value="addressController")
public class AddressController {

	
	/** log */
    protected static final Log LOG = LogFactory.getLog(AddressController.class);
	
	/**
	 * 주소록
	
	 */
	@RequestMapping(value="/m/address/addressMain.do")
	public String address( 
			HttpSession session,
			ModelMap model) throws Exception{
		
		return "/m/address/addressMain";
    }
	
	
	  
}
