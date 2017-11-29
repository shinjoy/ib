package ib.work.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ib.file.service.FileService;
import ib.push.service.PushService;
import ib.push.service.PushVO;
import ib.sms.service.SmsService;
import ib.work.service.WorkMemoService;
import ib.work.service.WorkVO;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service("workMemoService")
public class WorkMemoServiceImpl extends AbstractServiceImpl implements WorkMemoService {

    @Resource(name="workMemoDAO")
    private WorkMemoDAO workMemoDAO;
    
    @Resource(name = "workDAO")
    private WorkDAO workDAO;
    
    @Resource(name = "workDiaryDAO")
    private WorkDiaryDAO workDiaryDAO;
    
    @Resource(name = "fileService")
	private FileService fileService;
    
	@Resource(name = "smsService")
    private SmsService smsService;	
	
	@Resource(name = "pushService")
    private PushService pushService;
	
	private PushVO pushVO = new PushVO();
    
    
    protected static final Log logger = LogFactory.getLog(WorkMemoServiceImpl.class);

    


	//메모리스트
	public Map<String, Object> getMemoList(Map<String, Object> param) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		//parameter
		int pageSize = Integer.parseInt(param.get("pageSize").toString());
		int pageNo 	 = Integer.parseInt(param.get("pageNo").toString());
		
		map.put("pageNo", param.get("pageNo"));							//넘어온 검색페이지번호도 세팅해서 그대로 반환해준다.
		
		int totalCount = workMemoDAO.getMemoListCount(param);				//총 건수
		map.put("totalCount", totalCount);
		
		int pageCount = (totalCount/Integer.parseInt(param.get("pageSize").toString()));
		pageCount = (totalCount>pageCount*pageSize)?pageCount+1:pageCount;		//총 페이지수 ... (총수/페이지크기)떨어지는지, 절삭하는지 확인하여 총페이지크기를 (+1)여부결정
		map.put("pageCount", pageCount);										//총 페이지수
		
		param.put("offset", (pageNo-1) * pageSize);
		param.put("limit", Integer.parseInt(param.get("pageSize").toString()));	//페이지크기 pageSize
		
		map.put("list", workMemoDAO.getMemoList(param));				//목록리스트
		
		return map;		//Map map: pageNo(페이지번호), totalCount(총 건수), pageCount(총 페이지수), list(리스트)
			
	}


	//메모 상세
	public List<Map> getMemoDetail(Map<String, String> map) throws Exception {
		
		return workMemoDAO.getMemoDetail(map);
	}


	//메모 읽음 상태 업데이트
	public int updateMemoStatus(Map<String, Object> map) throws Exception {

		int upCnt = 0;
		
		if("0".equals(map.get("mainSnb").toString())){		//최초작성자가 나 
			upCnt = workMemoDAO.updateMemoReplyStatus(map);	//ib_reply 를 모두 바꿈으로 상태 저장
			
		}else{												//최초작성자가 다른이 
			upCnt = workMemoDAO.updateMemoMainStatus(map);	//ib_comment 에 상태 저장
			
		}
		
		return upCnt;
	}


	//메모 답글 달기
	public int insertMemoReply(Map<String, Object> map) throws Exception {

		WorkVO workVO = new WorkVO();
		
		workVO.setRgId(map.get("rgId").toString());
		
				
		workVO.setMemoSndName(map.get("memoSndName").toString());
		
		if("0".equals(map.get("mainSnb").toString())){			//최초작성자가 나
			workVO.setMainSnb(map.get("sNb").toString());
			workVO.setRepSnb("0");
		}else{													//최초작성자가 다른이
			workVO.setMainSnb(map.get("mainSnb").toString());
			workVO.setRepSnb(map.get("sNb").toString());
		}
		
		workVO.setComment(map.get("comment").toString());
		workVO.setSttsCd("00001");
		
		
		workDAO.insertReply(workVO);			//---- 1

		workDAO.modifySttsCd(workVO);			//---- 2

		workVO.setCategoryCd("00005");
		workDAO.deleteMaintableCheck(workVO);	//---- 3
				
		return 1;
	}


	//메모 참여자 수신 확인 정보
	public List<Map> getMemoRecvInfo(Map<String, String> map) throws Exception {

		return workMemoDAO.getMemoRecvInfo(map);
	}

	
	//메모 내용
	public List<Map> getMemoCntnt(Map<String, Object> map) throws Exception {
		
		return workMemoDAO.getMemoCntnt(map);
	}

	//메모 재발송
	public int memoResend(Map<String, Object> map) throws Exception {
		
		int upCnt = 0;
		
		
		//main 등록
		int mainSnb = workMemoDAO.cloneResendMemoMain(map);
		map.put("mainSnb", mainSnb + "");
		//sub 등록
		upCnt = workMemoDAO.cloneResendMemoSub(map);
		
		//파일 등록
		map.put("offerSnb", mainSnb + "");	//새로운 메모 키
		workMemoDAO.cloneResendFile(map);
		
		
		return upCnt;
	}


	//메모유형변경
	public int updateMemoType(Map<String, Object> map) throws Exception {
		return workMemoDAO.updateMemoType(map);
	}


	//메모참조인삭제
	public int delMemoStaff(Map<String, Object> map) throws Exception {
		workMemoDAO.delMemoStaffReply(map);				//IB_COMMENT 삭제
		return workMemoDAO.delMemoStaffComment(map);	//IB_REPLY 삭제
	}


	//메모 해당 사용자 댓글 존재 여부
	public Map checkMemoReplyExist(Map<String, Object> map) throws Exception {
		
		return workMemoDAO.checkMemoReplyExist(map);
	}
	
	/*==============모바일 신규구현============*/
	
	//메모리스트
	public List getMemoListForMobile(Map<String, Object> map) throws Exception {
		return workMemoDAO.getMemoListForMobile(map);
	}
	
	//메모리스트
	public Map<String, Object> getMemoListForMobilePaging(Map<String, Object> param) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		//parameter
		int pageSize = Integer.parseInt(param.get("pageSize").toString());
		int pageNo 	 = Integer.parseInt(param.get("pageNo").toString());
		
		map.put("pageNo", param.get("pageNo"));							//넘어온 검색페이지번호도 세팅해서 그대로 반환해준다.
		
		int totalCount = workMemoDAO.getMemoListForMobileCount(param);				//총 건수
		map.put("totalCount", totalCount);
		
		int pageCount = (totalCount/Integer.parseInt(param.get("pageSize").toString()));
		pageCount = (totalCount>pageCount*pageSize)?pageCount+1:pageCount;		//총 페이지수 ... (총수/페이지크기)떨어지는지, 절삭하는지 확인하여 총페이지크기를 (+1)여부결정
		map.put("pageCount", pageCount);										//총 페이지수
		System.out.println(Integer.parseInt(param.get("pageSize").toString()));
		param.put("offset", (pageNo-1) * pageSize);
		param.put("limit", Integer.parseInt(param.get("pageSize").toString()));	//페이지크기 pageSize
		
		map.put("list", workMemoDAO.getMemoListForMobile(param));				//목록리스트
		
		return map;		//Map map: pageNo(페이지번호), totalCount(총 건수), pageCount(총 페이지수), list(리스트)
			
	}
	
	

	
	//메모 상세
	public List getMemoMobileDetail(Map<String, Object> map) throws Exception {
		
		return workMemoDAO.getMemoMobileDetail(map);
	}
	
	//본글 정보
	public Map<String, Object> getCommentInfo(Map<String, Object> map)
			throws Exception {
		
		return workMemoDAO.getCommentInfo(map);
	}
	
	//댓글 정보
	public Map<String, Object> getReplyInfo(Map<String, Object> map)
			throws Exception {
		
		return workMemoDAO.getReplyInfo(map);
	}
	
	//메모 저장
	public int doSaveMemo(Map<String, Object> map) throws Exception {
		
		String memoId = map.get("memoRoomId").toString();
		
		int memoSnb =0;
		//신규
		if(memoId.equals("0")){
			
			memoSnb = insertMemoToMobile(map);
			
		}else{
			
			updateMemoToMobile(map);
			memoSnb = Integer.parseInt(map.get("memoRoomId").toString());
		}
		

		if(memoSnb !=0 && !map.get("fileList").toString().equals("")){		//정상저장 이고 파일이 있을때
			
			map.put("offerSnb",memoSnb);
			map.put("reportYn", "N");
			
    		fileService.insertFileListJson(map);				//파일 db저장
    		
		}
		
		return memoSnb;
	}
	
	//메모 첫글 보내기
	public int insertMemoToMobile(Map<String, Object> map) throws Exception {
		
		int mainSnb = 0;
		
		WorkVO workVO = new WorkVO();
		
		map.put("mainSnb", mainSnb);
		map.put("memoSndSabun", map.get("sabun").toString());
		map.put("sttsCd", "");				//첫글(본글) 등록시 sttsCd 빈값
		map.put("firSttsCd", "00002");
		
		workVO.setRgId(map.get("rgId").toString());
		
		
		
		String commentReal = map.get("comment").toString();
		
		map.put("commentReal", commentReal);
		
		//암호화
		if(map.get("priv").equals("Y")){
			
			workVO.setComment(map.get("comment").toString());
			map.put("comment", (String) workDAO.selectEncrypt(workVO)); //암호화 시키기 
			map.put("commentReal", "비밀글이 등록되었습니다.");
			
		}
		
		mainSnb = workMemoDAO.insertMemo(map);		//첫글 등록하고
		
		
		map.put("mainSnb", mainSnb);
		map.put("sttsCd", "00001");
		map.put("firSttsCd", "00001");
		
	
	
		workVO.setComment(map.get("comment").toString());
		workVO.setMainSnb(map.get("mainSnb").toString());
		workVO.setImportance(map.get("importance").toString());
		workVO.setPriv(map.get("priv").toString());
		workVO.setSttsCd("00001");
		workVO.setFirSttsCd("00001");
		workVO.setTmDt(map.get("tmDt").toString());
		
		String entryStr = map.get("entryUserList").toString();
		String entryArr [] =entryStr.split(",");
		
		//참가자 등록
		
		int cnt=0;		
		List userList = new ArrayList();
		for(int i=0; i< entryArr.length; i++){
			
			if(!entryArr[i].equals("")){
				
				if(map.get("sabun").equals(entryArr[i])) continue;
				workVO.setMemoSndSabun(entryArr[i]);
				workVO.setMemoType(map.get("memoType").toString());
				cnt = workMemoDAO.insertEntryMemo(workVO);
				
				// 업무요청 승인요청시 업무일지 등록 로직
				if(((map.get("memoType").toString()).equals("00030") ||(map.get("memoType").toString()).equals("00040")) 
					&&  map.get("sendWorkDiaryChk").equals("Y")	
				){
					Map workDiaryMap = new HashMap();
					
					workDiaryMap.put("sabunForName", entryArr[i]);
					workDiaryMap.put("sNb", "0");
					
					String comment = map.get("comment").toString(); //commentReal;//
					String ttl = "[";
					
					if((map.get("memoType").toString()).equals("00030")) ttl += "승인요청-";
					if((map.get("memoType").toString()).equals("00040")) ttl += "업무요청-";
					
					ttl += map.get("name").toString()+']' +  ( comment.length() >26 ? comment.substring(0,26) : comment);
					
					
					workDiaryMap.put("title", ttl);
					workDiaryMap.put("memoType", map.get("memoType").toString());
					workDiaryMap.put("note", map.get("comment").toString());
					workDiaryMap.put("bsnsRecPrivate", "1");
					workDiaryMap.put("tmDt", map.get("tmDt").toString().replaceAll("-", ""));
					
					workDiaryDAO.insertWorkDiary(workDiaryMap);
					
				}
			}
			
		}
		
		//sms 보내기
		if(map.get("smsYn").equals("Y")) sendToSmsSet(map);
		
		//----------------푸쉬 추가 로직 
		
		try{
			
			if(!entryStr.equals("") && entryArr.length > 0){
				
				Map pushMap = new HashMap();
				
				String memoTypeNm = "";
				
				if((map.get("memoType").toString()).equals("00030")) memoTypeNm += "승인요청-";
				if((map.get("memoType").toString()).equals("00040")) memoTypeNm += "업무요청-";
				
				pushMap.put("pushType", pushVO.ptMemo);
				pushMap.put("sabunList", map.get("entryUserList").toString());
				pushMap.put("pushTypeId", mainSnb);
				pushMap.put("content", "[업무메모]"+memoTypeNm+map.get("rgNm").toString()+":"+( commentReal.length() >70 ? commentReal.substring(0,70) : commentReal));
				pushMap.put("rgUserId", map.get("rgUserId").toString());
				
				pushService.insertPushLogSearchSabunList(pushMap);
			
			}
			
		}catch(Exception e){
			
		}
		
		return mainSnb;
		
	}
	
	//메모 첫글 수정
	public int updateMemoToMobile(Map<String, Object> map) throws Exception {
		
		WorkVO workVO = new WorkVO();
		
		workVO.setComment(map.get("comment").toString());
		workVO.setMemoSNb(map.get("memoRoomId").toString());
		workVO.setImportance(map.get("importance").toString());
		workVO.setPriv(map.get("priv").toString());
		workVO.setSttsCd("");
		workVO.setRgId(map.get("rgId").toString());
		
		
		String commentReal = map.get("comment").toString();
		
		workDAO.updateMemo(workVO);				//메모수정
		
		if(!workVO.getMemoSNb().equals("0") && !workVO.getMemoSNb().equals("")) workDAO.updateSendedMemo(workVO);		//서브글 수정
		
		if(!map.get("delFileList").toString().equals("")){		//정상저장 이고 파일이 있을때
   			 String [] arr = map.get("delFileList").toString().split(",");
   			 map.put("fileArr", arr);
   			 fileService.fileDeleteDbAndPhy(map);						//파일 db저장 & 물리 삭제
		}
		
		//sms 보내기
		if(map.get("smsYn").equals("Y")){
			
			map.put("memoSnb", map.get("memoRoomId").toString());
			Map commentInfo = getInfoForSendSms(map);
			map.put("entryUserList",commentInfo.get("entryUserList").toString());
			map.put("tmDt",commentInfo.get("tmDt").toString());
			
			if(!commentInfo.get("entryUserList").toString().equals("")){
				map.put("commentReal", commentReal);
				sendToSmsSet(map);
			}
		}
		
		
		
		
		return Integer.parseInt(map.get("memoRoomId").toString());
	}
	
	
	//메모 댓글 저장
	public int doSaveReply(Map<String, Object> map) throws Exception {
		
		String memoCommentId = map.get("memoCommentId").toString();
		
		int memoCommentSnb =0;
		
		WorkVO workVO = new WorkVO();
		
		workVO.setRgId(map.get("rgId").toString());
		workVO.setMemoSndName(map.get("rgNm").toString());
		workVO.setRepSnb(map.get("repSnb").toString());
		workVO.setComment(map.get("comment").toString());
		workVO.setSttsCd("00001");
		workVO.setMainSnb(map.get("memoRoomId").toString());
		
		if(map.get("memoRoomId").toString().equals("0")  || map.get("memoRoomId").equals("") || map.get("memoRoomId").toString().equals("null")) return -8;
		
		//중요도 수정
		if(map.get("myMemoYn").toString().equals("Y") && !map.get("memoRoomId").toString().equals("0")){
			//ib_comment 수정
			Map updateMap =  new HashMap();
			updateMap.put("memoSnb", map.get("memoRoomId").toString());
			updateMap.put("importance", map.get("importance").toString());
			
			workMemoDAO.updateImportance(updateMap);	
		}
		
		//신규
		if(memoCommentId.equals("0") && !workVO.getMainSnb().equals("0") && !workVO.getMainSnb().equals("")){
			
			memoCommentSnb = workMemoDAO.insertReplyReturnKey(workVO);		//ib_reply 댓글 등록
			
			workDAO.modifySttsCd(workVO);									//그 외 직원들 읽지않음 상태로 변경
			
			//내가 방장이면 
			if(map.get("myMemoYn").toString().equals("Y")){
				
				workDAO.checkReply(workVO); //댓글(ib_reply)들 다읽음 처리 
				
				
			}else{	//방장이 아니면 ib_comment 만 업데이트 
				workVO.setMemoSNb(map.get("repSnb").toString());
				workVO.setSttsCd("00002");
				
				workDAO.checkMemo(workVO);										//나는 다읽음 변경
			}
			
			
		//수정
		}else if(!memoCommentId.equals("0")){
			
			memoCommentSnb = Integer.parseInt(map.get("memoCommentId").toString());
			
			workVO.setMemoSNb(map.get("memoCommentId").toString());
			workDAO.updateReply(workVO);									//ib_reply 댓글 수정
			
			//파일 삭제건 존재시
			if(!map.get("delFileList").toString().equals("")){				//정상저장 이고 파일이 있을때
	   			 String [] arr = map.get("delFileList").toString().split(",");
	   			 map.put("fileArr", arr);
	   			 fileService.fileDeleteDbAndPhy(map);						//파일 db저장 & 물리 삭제
			}
		
		}
		
		//파일로직
		if(memoCommentSnb !=0 && !map.get("fileList").toString().equals("")){		//정상저장 이고 파일이 있을때
			
			map.put("offerSnb",memoCommentSnb);
			map.put("reportYn", "N");
			
    		fileService.insertFileListJson(map);				//파일 db저장
    		
		}
		
		//-- sms / 푸쉬
		map.put("memoSnb", map.get("memoRoomId").toString());
		map.put("all", "Y");
		
		Map commentInfo = getInfoForSendSms(map);
		String entryUserStr = commentInfo.get("entryUserList").toString();
		
		//sms 보내기
		if(map.get("smsYn").equals("Y")){
			
		
			map.put("entryUserList",commentInfo.get("entryUserList").toString());
			map.put("tmDt",commentInfo.get("tmDt").toString());
			
			if(!commentInfo.get("entryUserList").toString().equals("")){
				map.put("commentReal", map.get("comment").toString());
				sendToSmsSet(map);
			}
		}
		
		//-------------푸쉬 추가 로직 (신규일때만)
		
		try{
			
			
			if(!entryUserStr.equals("") && memoCommentId.equals("0")){
				
				String orgComment = commentInfo.get("orgComment").toString();
				String commentReal = map.get("comment").toString();
				
				String content = "[메모댓글]"+(orgComment.length() >10 ? orgComment.substring(0,10)+".." : orgComment)+"("+(commentInfo.get("tmDt").toString()).replaceAll("-", ".")+")의 댓글 "+map.get("rgNm").toString()+":"+ ( commentReal.length() >40 ? commentReal.substring(0,40) : commentReal);
				
				Map pushMap = new HashMap();
				
				pushMap.put("pushType", pushVO.ptMemoComment);
				pushMap.put("sabunList", entryUserStr);
				pushMap.put("pushTypeId", memoCommentSnb);
				pushMap.put("content", content);
				pushMap.put("rgUserId", map.get("rgUserId").toString());
				
				
				pushService.insertPushLogSearchSabunList(pushMap);
			}
			
		}catch(Exception e){
			
			
		}
		
		return Integer.parseInt(map.get("memoRoomId").toString());
		
	}

	//메모 본글 삭제 (일단 파일삭제는 두자..기존 안지우는것으로 보임)
	public int doDeleteMemoFirst(WorkVO vo) throws Exception {
		
		int cnt = 0;
		if(!vo.getMemoSNb().equals("0")){
			
			//읽은사람 있는지 체크 
			Map map = new HashMap();
			
			map.put("sNb", vo.getMemoSNb());
			
			int readChk = workMemoDAO.getCommentFirstReadCount(map);	//읽은 갯수 체크 
			
			if(readChk  == 0 && !vo.getMemoSNb().equals("")){
				cnt = workDAO.deleteMemo(vo);
				workDAO.deleteSubMemo(vo);
				
			}else cnt = -5;
			
			
			
		}
		
		return cnt;
	}

	//메모 댓글 삭제 (일단 파일삭제는 두자..기존 안지우는것으로 보임)
	public int doDeleteReply(WorkVO vo) throws Exception {
		
		int cnt = 0;
		if(!vo.getMemoSNb().equals("")) workDAO.deleteReply(vo);
		
		return cnt;
	}
	
	//sms 전송을 위한 메모 참가자 정보받기
	public Map getInfoForSendSms(Map map) throws Exception{
		
		return workMemoDAO.getInfoForSendSms(map);
	}
	
	//sms 보내기
	public void sendToSmsSet(Map map) throws Exception{
		
		
		String comment = map.get("commentReal").toString();
		if(comment.length() >60) comment = comment.substring(0,60)+"...";
		
		map.put("userSabunStr", map.get("entryUserList").toString());
		map.put("content", "["+map.get("rgNm").toString()+"님의 메모("+map.get("tmDt").toString()+")] "+comment);
		map.put("categoryType", "1");
		
		smsService.insertSmsLog(map);	
		
	}
	
	//참가자 추가 등록
	public int doSaveEntry(Map<String, Object> map) throws Exception {
		
		String entryStr = map.get("entryUserList").toString();
		String entryArr [] =entryStr.split(",");
		
		WorkVO workVO = new WorkVO();
		
		workVO.setMainSnb(map.get("mainSnb").toString());
		workVO.setRgId(map.get("rgId").toString());
		
		//참가자 등록
		int cnt=0;		
		
		if(!workVO.getMainSnb().equals("0") && !workVO.getMainSnb().equals("")){
			for(int i=0; i< entryArr.length; i++){
				
				
				if(!entryArr[i].equals("")){
					
					if(map.get("sabun").equals(entryArr[i])) continue;
					workVO.setMemoSndSabun(entryArr[i]);
					cnt = workMemoDAO.insertAddEntryMemo(workVO);
				}
				
			}
		}
		
		return cnt;
		
	}
	
	//메모 읽음 확인
	public int saveLastReadDate(Map<String, Object> map) throws Exception {
		int cnt=0;	
		
		WorkVO workVO = new WorkVO();
		workVO.setMainSnb(map.get("mainSnb").toString());
		workVO.setSttsCd("00002");
		workVO.setRgId(map.get("rgId").toString());
		
		//내가 방장이면
		if(map.get("myMemoYn").toString().equals("Y")){
			
			//reply update
			workDAO.checkReply(workVO);
		}else{
			
			//comment update
			workVO.setMemoSNb(map.get("snb").toString());
			workDAO.checkMemo(workVO);
		}
		cnt=1;
		
		return cnt;
		
	}
	
	//메모 첫글 조회
	public Map<String, Object> getFirstCommentInfo(Map<String, Object> map)throws Exception {
		
		return workMemoDAO.getFirstCommentInfo(map);
	}
	
	//오늘 신규메모
	public List getTodayNewMemoList(Map<String, Object> map) throws Exception {
		
		return workMemoDAO.getTodayNewMemoList(map);
	}
	

	
}
