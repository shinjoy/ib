package ib.dart.service.impl;

import ib.dart.service.DartService;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.Map;

import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("dartService")
public class DartServiceImpl extends AbstractServiceImpl implements DartService{

	
	
	/**
	 * 공시문서 리스트 조회
	 *
	 * @param		: 
	 * @return		: 
	 * @exception	: 
	 * @author		: oys
	 * @date		: 2017. 6. 5.
	 */
	public String getOfficialNoticeList(Map map) throws Exception{
		
		StringBuffer buffer = new StringBuffer();
		
		try{
			
			String auth = map.get("auth").toString();					//: '5f9cfe3e3a9309d678e7f5b99cc74cfb968daf6d',	//인증키
			String crp_cd = map.get("crp_cd").toString();				//: g_cpnId,									//상장사 코드
			String start_dt = map.get("start_dt").toString();			//: '19990101',									//정보검색 시작일
			String[] dsp_tp = map.get("dsp_tp").toString().split(",");	//: 'A','B', ...								//정기공시 'A', 외부감사관련 'F', ...
			String page_no = map.get("page_no").toString();				//: page,										//페이지 번호
			String page_set = map.get("page_set").toString();			//: 100											//한페이지 글수
			

			String url = "http://dart.fss.or.kr/api/search.json";					//DART

			URL obj = new URL(url);

			URLConnection conn = obj.openConnection();

			String urlParameters = "auth="+auth+"&crp_cd="+crp_cd+"&start_dt="+start_dt;
			
			for(int i=0; i<dsp_tp.length; i++){
				urlParameters += "&dsp_tp="+dsp_tp[i];		//검색조건 추가
			}
		    
			urlParameters+="&page_no="+page_no+"&page_set="+page_set;
		    conn.setDoOutput(true);
		    OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
		    // 파라미터를 wr에 넣어주고 flush
		    wr.write(urlParameters);
		    wr.flush();
		    // in에 readLine이 null이 아닐때까지 StringBuffer에 append
		    BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		    String inputLine;
		    while ((inputLine = in.readLine()) != null) {
		         buffer.append(inputLine);
		    }
		    in.close();
		    wr.close();
			

		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		
		return buffer.toString();
	}
	
	

}
