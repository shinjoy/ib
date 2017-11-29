<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.highlight_memoView { background-color: greenyellow;}

</style>
	<!--고정서브navi-->
	<div class="sub_fixWrap"  style="position:absolute;" >
		<div class="mb_sub_location">
			<c:choose>
				<c:when test="${openType eq 'inner' }">
					<button type="button" id="memoViewPopCanBtn" class="back" onclick="closeRightBox('memoViewInnerPop','memoViewInnerArea');"><em>이전</em></button>	
				</c:when>
				<c:otherwise>
					<button type="button" id="memoViewPopCanBtn" class="back" onclick="closeBottomBox('memoViewPop','memoViewArea','first');"><em>이전</em></button>
				</c:otherwise>
			</c:choose>
			<span class="join_mb_count" id="entryCnt">1</span><span class="join_mb_listellip" id="entryName">나</span>
			<a href="javascript:workMemoFnObj.clickSearchMemo('Y');" class="btn_memo_search"><em>검색</em></a>
			<a href="javascript:workMemoFnObj.popMoreView();" class="btn_add_menu"><em>더보기</em></a>
		</div>
		<div class="search_inputZone" id="memoSearchArea" style="display:none;">
			<input placeholder="메모내용 검색" type="text" id="searchKeyWord" onchange="workMemoFnObj.searchMemo(0);"/>
			<button type="button" class="closed" onclick="workMemoFnObj.clickSearchMemo('N');"><em>검색창 닫기</em></button>
		</div>
		<div class="workDirectDay">
			<span class="icon_clock">업무지정일 : </span><strong id="workTmdtArea"><input type="date" id="memoTmDt" onchange="workMemoFnObj.changeDate(this.value);"/></strong><span id="memoDateNameArea">(월)</span>
		</div>
	</div>
	<!--//고정서브navi//-->
	
	<!--서브컨텐츠-->
	<section class="contentsWrap">
		<!--채팅전체-->
		<a href="javascript:workMemoFnObj.doSaveLastReadDate();" id="readChekBtn" style="position: absolute;" class="btn_readcheck "><em>메모확인</em></a>
		<div class="scrollArea chat_window" id="scrollChatArea" onclick ="workMemoFnObj.clickChatArea();">
			<!--업무내용-->			
			<div class="chat_flow" id="chatContent" ></div>
			<!--//업무내용//-->
			<!--업무입력창-->
			
			<!--//업무입력창//-->
		</div>
		<!--//채팅전체//-->
		
		<div class="communi_inputBox" id="memoInputArea" style="position: absolute;" >
			<!--내용검색박스-->
			<div class="memo_searchZone" id="memoSearchArrowArea" style="display:none;">
				<button type="button" class="btn_memo_up " onclick="workMemoFnObj.searchMemo_m(-1);"></button>
				<button type="button" class="btn_memo_down " onclick="workMemoFnObj.searchMemo_p(1);"></button>
			</div>
			<!--//내용검색박스//-->
			<!--메모타입선택-->
			<div class="memotypeZone noSearch" >
				<span id="memoTypeArea"></span>
				<span id="sendWorkDiaryChkArea" style="display:none;">
					<input type="checkbox" checked="checked" id="sendWorkDiaryChk">참조인 업무등록
				</span>
			</div>
			<!--//메모타입선택//-->
			<!--중요도체크-->
			<div class="option_list noSearch">
				<span id="importantArea" class="mgr05rem" style="display:none;">	
					<span>중요체크</span>
					<ul class="relationGrade">
						<li><a href="javascript:workMemoFnObj.setImportant(1);" name="important" id="important_1"><em>+1</em></a></li>
						<li><a href="javascript:workMemoFnObj.setImportant(2);" name="important" id="important_2"><em>+2</em></a></li>
						<li><a href="javascript:workMemoFnObj.setImportant(3);" name="important" id="important_3"><em>+3</em></a></li>
					</ul>
				</span>
				<label id="secretArea" style="display:none;">
					<input type="checkbox" id="roomType" value="S" /><span>비밀</span>
				</label>
				<label><input type="checkbox" id="sendSmsChk"/><span>SMS알림</span></label>
			</div>
			<!--//중요도체크//-->
			<!--파일선택-->
			<p class="file_list noSearch">
				<span class="btn_file">
					<span class="icon_fileclip">파일선택</span>
					<span id="fileInputArea">
						<input name="upFile" type="file" multiple onchange="workMemoFnObj.newFileUpload();" class="file_upload" />
					</span>
				</span>
				<span  id="uploadFileList"></span>
			</p>
			<!--//파일선택//-->
			<!--내용입력-->
			<div class="txtArea noSearch">
				<textarea id="comment" class="txtArea_b" placeholder="내용을 입력하세요" onclick="workMemoFnObj.resizeText();"></textarea>
				<a href="javascript:workMemoFnObj.doSaveBtn();" id="sendMemoBtn" class="btn_send">보내기</a>
            </div>
            <!--//내용입력//-->
            <span class="btnzone" id="modifyCancel" style="display:none;">
				<span><a href="javascript:;" onclick="workMemoFnObj.initArea();" class="btn_re_modi_cancel"><em>수정취소</em></a></span>
			</span>
		</div>
	</section>
	<!--//서브컨텐츠//-->


<div class="rightBox disPlayNone" id="memoMoreViewPop" style="width:90%;">
	<div class="rightBox-inner">
      <div id="memoMoreViewArea"></div>
   </div>
</div>	

 
<script type="text/javaScript">


var loginUserId = '${userLoginInfo.id}';
var g_staffNm = '${userLoginInfo.name}';		//사원명

var g_memoRoomId ='${memoId}';					//snb or mainSnb
var g_memoSnb = '${memoSnb}'					//snb (고유 키값)



var g_idx =0;
var g_memoCommentId =0;			//수정시 클릭한 메모 아이디

var g_roomObj = new Object;		//방정보

var g_entryUserList = []; 		//db 저장 유저 리스트.(sabun)
var g_entryNameList = []; 		//db 저장 유저 리스트.(name)

var g_entryUserFullList = [];   // db 저장 유저 리스트.(user obj)
var g_newUserList = [] ; 		//새로 선택 리스트 (팝업창 리턴)
var g_fileList = [];			// db 저장 파일리스트 


var delArray = new Array();		//저장된 파일 지운 리스트

var g_noReadYn = 'Y';			//내가 안읽은게 있는지

var g_searchModeYn = 'N';		//검색 모드인지		
var g_nowPosition = 1;			//검색시 현재 포지션

var g_myMemoYn = 'Y'			//내 메모인지
var	g_replyYn  = 'N'			//댓글 인지

var g_searchObjList =[];
var tempCount=0;

//직원 선택 공통 팝업 리턴 함수
function selectUserPopGetResult(resultList){
	
	g_newUserList =[];
	
	var str ='';
	
	for(var i=0;i<resultList.length;i++){
		g_newUserList.push(resultList[i]);
		
		str +=resultList[i].userName;
		
		if(i<resultList.length-1) str+=',';
		
		if(str.length>30) str = str.substring(0,30)+'...';
		
		if(resultList.length == 1) str ='나';
	
		$("#entryName").html(str);			//참가자 이름
		$("#entryCnt").html(resultList.length);	//참가자 수

	}
	
	if(g_memoRoomId >0){					//신규가 아닐때 바로 등록

		workMemoFnObj.doSaveEntry(g_memoRoomId);
		
	}
}

var workMemoFnObj = {
	
	preloadCode	: function(){
		
		//처음 글 작성시
		if(g_memoRoomId == 0){
			
			$("#importantArea").show();
			$("#secretArea").show();
			g_replyYn = 'N';
			
			//날짜 및 요일 세팅
			$("#memoTmDt").val(g_selectDate);
			
			workMemoFnObj.changeDate(g_selectDate);
			
		}else g_replyYn = 'Y';
		
		//메모 유형 추가
		var typeList = getCommonCode('00026', 'KOR', 'memoType', 'memoTypeNm');
		
		var str ='<ul class="memotype_list"><li>메모타입</li>';
		for(var i=0; i<typeList.length; i++){
			str +='<li name="memoType" class="memoTypeBtn" id="memoType_'+typeList[i].memoType+'" memoType-val="'+typeList[i].memoType+'" onclick="workMemoFnObj.selectMemoType(\''+typeList[i].memoType+'\');">'+typeList[i].cdDc+'</li>';
		}
		str +='</ul>';
		$("#memoTypeArea").html(str);
	},
	
	//검색
    doSearch: function(){

    	workMemoFnObj.initArea();			//전부 초기화
    	workMemoFnObj.getRoomInfo();		//방 정보 
    	workMemoFnObj.getRoomEntry();		//방 참가자 
    	workMemoFnObj.getRoomComment();		//방 글 리스트 
    	
    },//end doSearch
    
  	//입력창 및 변수 초기화
    initArea : function(){
    	/* 초기화 */
    	g_memoCommentId =0 ;
    	g_idx =0;
    	g_roomObj =new Object;			//방정보
    	
    	g_entryUserList = []; 			//db 저장 유저 리스트.(id)
    	g_entryUserFullList = []; 		//db 저장 유저 리스트.(user obj)
    	g_newUserList = [] ; 			//새로 선택 리스트
    	
    	g_replyYn = '';
    	
    	delArray = new Array();			//저장된 파일 지운 리스트
    	$("#uploadFileList").empty();	//파일리스트비우고
    	$("#comment").val('');			//내용지우고
    	$("#btnName").html("보내기");
    	$("#checkMemo").show();
    	$("#modifyCancel").hide();
    	
    	if(g_myMemoYn == 'Y') $("#importantArea").show();
    	else $("#importantArea").hide();
    	
    	$("#secretArea").hide();
    	$("#sendWorkDiaryChkArea").hide();

    },
    
    //==================================세팅 : S ================================//
	
    //방정보 가져오기
    getRoomInfo : function(){

    	var url = contextRoot + "/m/schedule/getFirstCommentInfo.do";
    	var param = { sNb : g_memoRoomId };

    	var callback = function(result){
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;
    		var resultObj = obj.resultObject;
    
    		g_roomObj = resultObj;

    		//비밀글 중요도 display설정
    		workMemoFnObj.setImportant(g_roomObj.importance);
    		
    		//비밀글 체크 
    		if(g_roomObj.private == 'Y')$("#roomType").prop("checked",true);
			
    		//내가 쓴 메모인지 
    		if(g_roomObj.rgId != loginUserId){
    			
    			g_myMemoYn = 'N';
    		}else $("#importantArea").show();
    		
    		$("#memoType_"+g_roomObj.memoType).addClass('current');
    		
    		$("#workTmdtArea").html((g_roomObj.tmDt).replace(/-/gi,'.'));
    		workMemoFnObj.changeDate(g_roomObj.tmDt);
    		
    	};
    	commonAjax("POST", url, param, callback, false);
    },

  	//참가자 정보 가져오기
    getRoomEntry : function(){
    	
    	var url = contextRoot + "/work/getMemoRecvInfo.do";
    	var param = {mainSnb: g_memoRoomId};
    
    	var callback = function(result){
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;
    		var list = obj.resultList;
			
    		g_entryUserFullList =list;		//참가자 정보
    		
    		var str ='';
    		
    		g_noReadYn = 'Y';				//내가 안 읽은게 있는지
    		
    		for(var i=0; i<list.length;i++){
    			
    			if(list[i].name == g_staffNm){
    				
    				if(list[i].readStts =='00002') g_noReadYn = 'N';	//안읽은게 없음
    			}
    			
    			g_entryUserList.push(list[i].sabun);
    			g_entryNameList.push(list[i].name);
    			
    			if(list.length == 1 && list[i].name == g_staffNm){				//나만등록한 메모
						str='나';

				}else{
					
					str+=list[i].name;
	        		if(i < (list.length-1)) str+=',';
	        		
				}

    		}
			
    		
    		$("#inputDiv1").show();
			$("#inputDiv2").show();
				
    		
    		if(str.length>40){
    			str = str.substring(0,40)+'...';
    		}
    		
    		$("#entryName").html(str);			//참가자 이름
    		$("#entryCnt").html(list.length);	//참가자 수

    	};
    	commonAjax("POST", url, param, callback, false);
    },

  	//글 리스트 (대화창 세팅)
    getRoomComment : function(){
    	
    	g_fileList = [];		//초기화
    	
    	var url = contextRoot + "/m/schedule/getMemoDetail.do";
    	var param = { mainSnb : g_memoRoomId };

    	var callback = function(result){
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;
    		var list = obj.resultList;
    		
    		var oneChat = '';
 	        var preUserId = '';
 	        var timeLineDay = '';
 	      
 	        var firstUserId ='';
 	         
 	        //채팅창 초기화
 	        var chatObj = $('#chatContent');
	        chatObj.html('');
	       
	        if(list.length == 0){
	        	chatObj.append('<div>이미 삭제된 글 입니다.</div>');
	        
	        }else{
	        	//메모확인
		        //chatObj.append('<a href="javascript:workMemoFnObj.doSaveLastReadDate();" id="readChekBtn" style="position: absolute;" class="btn_readcheck '+(g_noReadYn =='N' ? 'on' : '')+'"><em>메모확인</em></a>');
	 	        if(g_noReadYn =='N')  $('#readChekBtn').addClass('on');
	 	        else  $('#readChekBtn').removeClass('on');
	        }
	        
	       
	        for(var i=0; i<list.length; i++){

 	        	if(list[i].dt.substr(0,10) != timeLineDay && list[i].isFile != 'Y'){			//새로운 날일때 날짜 추가
 	        		
 	        		timeLineDay = list[i].dt.substr(0,10);
 	        		
 	        		//time line 추가
 	        		var timeArr = timeLineDay.split("-");
 	        		chatObj.append('<p class="flow_date"><span>' + timeArr[0]+'년 '+timeArr[1]+'월 '+timeArr[2]+'일 '+(timeLineDay==new Date().yyyy_mm_dd()?' (오늘)': getWeekName(timeArr[0],timeArr[1],timeArr[2])+'요일')  + '</span></p>');		

 	        		preNm = '';		//이름 초기화 (날이 달라져서 타임라인이 찍히면 무조건 이름을 찍어준다.)
 	        		
 	        	}

 	        

 	        	if(list[i].isFile != 'Y'){	// 메모 ----------------------

 	        		oneChat = '<div class="communiBox';
 		        	if(list[i].name == g_staffNm)
 						oneChat += 'Rignt">';				//내가 쓴글(오른쪽)
 					else
 						oneChat += '">';					//다른이 글(왼쪽)
 					
 						
 					if(preNm != list[i].name && list[i].name != g_staffNm ){
 						
 						oneChat += '<div class="pic"></div>';
 					}


 					oneChat += '<ul class="conBox"><li class="nametime">';
 					
 					if(preNm != list[i].name && list[i].name != g_staffNm){
 						oneChat += '<strong>' + list[i].name + '</strong>';
 	 					
 					}

 					oneChat += '<span>' + list[i].dt.substring(10,16) + '</span><span class="count"></span></li>';
 					oneChat += '<li class="bubble" '+(list[i].name == g_staffNm ? 'onclick="workMemoFnObj.openEditBtn(this,event);"' : '')+'><span class="arrow"></span>';
 					oneChat += '<p class="memoCommentBubbleArea searchHtmlArea">'+list[i].comment.replace(/(?:\r\n|\r|\n)/g, '<br />') + '</p>';
 					
 					

 					if(g_staffNm == list[i].name){
 						
 						
 						oneChat += '<span class="btnzone" name="editBtnArea"><a href="javascript:workMemoFnObj.getCommentInfo('+list[i].id+',\''+(i ==0 ? 'N' : 'Y')+'\');" class="btn_re_edit"><em>수정</em></a>';
 						oneChat += '<a href="javascript:workMemoFnObj.doDeleteComment('+list[i].id+',\''+(i ==0 ? 'N' : 'Y')+'\');" class="btn_re_delete"><em>삭제</em></a></span>';

 					}

 					oneChat +='</li></ul></div>';
 					

 	        	}else{		// 파일 ---------------------------------------

 	        		oneChat = '<p class="flow_filedown">' + list[i].name + '님이 <a class="searchHtmlArea" href="javascript:workMemoFnObj.fileDownComment(\''+list[i].fileCategory+'\',\'';
 	        		oneChat += list[i].fileSnb + '\' ,\''+list[i].comment+'\');">' + list[i].comment + '</a> 파일을 보냈습니다.</p>';
 	        		
 	        		g_fileList.push(list[i]);	//파일 내역 담음.
 	        		
 	        	}

 	        	preNm = list[i].name;


 				chatObj.append(oneChat);					//한건의 채팅 메모 추가  
 				
 	        }
	       // chatObj.append('<div id="lastScrollArea"></div>');					//한건의 채팅 메모 추가  
	       // endLoadingBar();
	       
	      // $("#scrollChatArea").animate({ scrollTop: $('#scrollChatArea').eq(0).prop("scrollHeight")}, 100);
    	};
    	
    	/* 
    	var beforeSubmit = function(){
    		startLoadingBar();
    	};
    	 */
    	 
    	commonAjax("POST", url, param, callback, false);

    },

    //글 하나의 정보
    getCommentInfo : function(memoCommentId,replyYn){
    	
    	workMemoFnObj.clickSearchMemo('N');		//검색창 돌려놓고
    	
    	$("#btnName").html("수정");
    	
    	var url = contextRoot + "/m/schedule/getCommentInfo.do";					//본글일때		
    	
    	if(replyYn == 'Y') url = contextRoot + "/m/schedule/getReplyInfo.do";		//댓글일때
    	
    	var param = { mainSnb : memoCommentId };

    	var callback = function(result){
    		
    		g_replyYn = replyYn;
    		
    		
    		var obj = JSON.parse(result);
    		var commentObj = obj.resultObject;

    		$("#comment").val(commentObj.comment);
    		
    		workMemoFnObj.getFileList(memoCommentId,replyYn);	//파일 리스트 세팅
    		g_memoCommentId = memoCommentId;
    		
    		
    		if(replyYn != 'Y'){
    			$("#secretArea").show();	//본글일때 (비밀글)
    			$("#importantArea").show();	//중요도 
    		}
    		
    		
    		
    		$("#modifyCancel").show();					//수정취소 버튼 표시
    		$("#comment").focus();
    		
    	};
    	commonAjax("POST", url, param, callback, false);

    },

 
    
   //==================================세팅 : E ================================//
  
   //==================================파일 : S ================================//
  
   
    //첨부파일 리스트
    getFileList : function(memoCommentId, replyYn){
    	
    	var url = contextRoot + "/file/getFileList.do";
    	var param = {
    					offerSnb 		: memoCommentId,
    					fileCategory    : replyYn == 'Y' ? '00005' : '00004'
    				}

    	var callback = function(result){
    		var obj = JSON.parse(result);
    		var list = obj.resultList;
    		var str = '';
    		saveFileList = list;
    		
    		
    	 	if(list.length>0){
	    		for(var i=0;i<list.length;i++){

	    			var fileObj = list[i];
	    			str +='<span class="file_name" id="li_'+g_idx+'">' + fileObj.realName ;
	    			str +='<input type="hidden" name="offerSnb" value="'+fileObj.offerSnb+'">' ;
	    			str +='<input type="hidden" name="realName" value="'+fileObj.realName+'">' ;
	    			str +='<input type="hidden" name="makeName" value="'+fileObj.makeName+'">' ;
	    			str +='<input type="hidden" name="path" value="'+fileObj.path+'">' ;
	    			str +='<a href="javascript:workMemoFnObj.setDelFile('+fileObj.sNb+','+g_idx+');" class="btn_delete_employee"><em>삭제</em></a>,</span>';
	    			g_idx++;
				}
	    		$('#uploadFileList').html(str);
    		} 
    	
    	}
    	commonAjax("POST", url, param, callback, false);
    },

  	//신규 파일 등록시
  	newFileUpload : function(){

  		
  		var url = contextRoot+"/file/uploadFiles.do"
  		
  		
		var callback = function(result){

   			var list = result.resultList;
   			var str='';
   			for(var i=0;i<list.length;i++){
   				
   				var fileObj = list[i];
    			str +='<span class="file_name" id="li_'+g_idx+'">' + fileObj.realName ;
    			str +='<input type="hidden" name="offerSnb" value="0">' ;
    			str +='<input type="hidden" name="realName" value="'+fileObj.realName+'">' ;
    			str +='<input type="hidden" name="makeName" value="'+fileObj.makeName+'">' ;
    			str +='<input type="hidden" name="path" value="'+fileObj.path+'">' ;
    			
   				str +='<a href="javascript:workMemoFnObj.newFileDelete(\''+fileObj.makeName+'\',\''+fileObj.path+'\','+g_idx+');" class="btn_delete_employee"><em>삭제</em></a>,</span>';
   				g_idx++;


   			}

   			//파일 태그 재 생성.
   			$('#fileInputArea').append('<input name="upFile" type="file" multiple class="file_upload"  onchange="workMemoFnObj.newFileUpload();"/>');


   			$('#uploadFileList').append(str);
   		 	
   		}
  		
   		commonAjaxForFileCreateForm(url,"","upFile","","fileSize", callback , "",'','');

  	},

    //파일 바로 삭제
    newFileDelete : function(makeName,path,idx){
    	
    	var url = contextRoot + "/file/deleteFile.do";
    	var param = { makeName : makeName , path : path};
    	var callback = function(result){
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;
    		if(cnt>0){
    			$("#li_"+idx).remove();
    		}
    		
    	
    	};
    	commonAjax("POST", url, param, callback, false);
    },

    //수정시 db 에 이미 저장된 파일삭제 할땐. 바로삭제하지않고 리스트를 만든다.
    setDelFile: function(fileSeq,idx){

    	delArray.push(fileSeq);
    	$("#li_"+idx).remove();
    	
    },//end setDelFile

  	//댓글 파일 다운로드
    fileDownComment : function(category,fileSnb,filename){
    	
    	url = contextRoot + "/file/downFile.do?fileCategory="+category+"&downFileList="+fileSnb;
    	
    	if(mobileOsCheck() == "IOS"){
    		
    		location.href="app://"+filename+"/schema/"+url;   //   send ios native 
    	
    	}else{
    		location.href=url;
    	}
    	
    },
    
    //==================================파일 : E ================================//
    
    //==================================저장 : S ================================//      
    
     //보내기 버튼 클릭
     doSaveBtn : function(){
    	 
    	 workMemoFnObj.doSaveComment(g_replyYn);		//본글 
    
     },
     
     //글저장
     doSaveComment : function(g_replyYn){
   
    	 
    	 var url ='';
    	 
    	 if(g_replyYn != 'N'){	//댓글이면
    		 
    		 url =  contextRoot + "/m/schedule/doSaveReply.do";
    		 
    	 }else{					//본글이면
    		 
    		 url =  contextRoot + "/m/schedule/doSaveMemo.do";
    	 }
    	 
    	 var entryUserList =[];		//유저 등록 리스트(사번)
    	 var entryNameList =[];		//유저 등록 리스트(이름)
    	 
    	 
    	 //-- 본글일때면 처음 등록시 참조인 추가 
    	 if(g_replyYn == 'N'){
    	 
	   		
			 for(var i=0 ; i<g_newUserList.length; i++){
				if(getArrayIndexWithValue(g_entryUserList, g_newUserList[i].sabun)<0){				//참가자 리스트에 신규로 등록한 사람이 없으면, 등록
					
					entryNameList.push(g_newUserList[i].userName);
					entryUserList.push(g_newUserList[i].sabun);
				 }
			 }
			
			 g_entryUserList = entryUserList;
			 g_entryNameList = entryNameList;
    	 }
		 
		 var important =0;
    	 var starList = $("a[name=important]");
			
    	 for(var i=0;i<starList.length;i++){
    		if($(starList[i]).hasClass("on")){
    			important++;
    		}
    	 }
		 
    	 var comment = $("#comment").val();
    	 if(comment == ''){
    		
    		swal("내용을 입력해 주세요.");
      		return false;
      	 }
    	 
    	 var roomType = ($("#roomType").is(":checked") ? 'Y' : 'N');		//비밀 여부
    	 
    	 var fileList ='';
     	 var delFileList='';
     


     	/*=========== 첨부파일 : S =========== */
     	
      	var offerSnbList 	= $("input[name=offerSnb]");			//시퀀스 리스트
      	var realNameList 	= $("input[name=realName]");			//파일명 리스트
      	var makeNameList 	= $("input[name=makeName]");			//새로운 저장 파일명 리스트
      	var pathList 		= $("input[name=path]");				//경로 리스트
      
      	var jArray = new Array();

      	for(var i=0;i<offerSnbList.length;i++){

      		var offerSnb	 = offerSnbList[i].value;
      		var realName 	 = realNameList[i].value;
      		var makeName  	 = makeNameList[i].value;
      		var path 	 	 = pathList[i].value;
      		
      		if(offerSnb == 0){								//신규 등록건만 추가
  	    		var jobj = new Object();
  				jobj.offerSnb=offerSnb;
  				jobj.realName=realName;
  				jobj.makeName=makeName;
  				jobj.path=path;
  				
  				jobj.fileCategory=  (g_replyYn == 'N' ? '00004' : '00005' );
  				jobj.subCd='0';
  				jArray.push(jobj);
      		}
      	}

      	var totalObj = new Object();
  		totalObj.items=jArray;											//items 란 키값으로 totalObj에 jobj를 담은 jArray를 세팅
  		
  		fileList = JSON.stringify(totalObj);							//totalObj 를 string 변환

  		if(jArray.length ==0) fileList = '';							//파일이 없을때는 빈값

  		if(delArray.length !=0) delFileList = delArray.join(",");		//수정시 삭제한 파일들의 리스트
  		
  		var memoType = $("li[name=memoType][class*=current]").attr('memoType-val');
  		
  		
  		/*=========== 첨부파일 : E =========== */
		
    	var param = {
    			 memoRoomId 	: g_memoRoomId ,		//snb 혹은 mainSnb 
    			 myMemoYn 		: g_myMemoYn ,
    			 comment 		: comment ,
    			 importance 	: important,
    			 priv			: roomType,
    			 tmDt			: g_memoRoomId == 0 ?  $("#memoTmDt").val() : '',
    			 smsYn			: $("#sendSmsChk").is(':checked') ? 'Y' :'N',
    			 memoType		: (memoType == undefined ? '00010' : memoType),		 //메모 유형 추가
    			 sendWorkDiaryChk : ($("#sendWorkDiaryChk").is(':checked') ? 'Y' : 'N'),
    			 entryUserList  : entryUserList.join(','),
    			 fileList 		: fileList,
    			 delFileList	: delFileList				//수정시 삭제한 파일들의 시퀀스 리스트
    			 
    	};
    	
  		
  		//-- 댓글일때만 추가로 메모 번호 param 
  		 
    	if(g_replyYn != 'N'){
    		
    		param.memoCommentId = g_memoCommentId;			 //ib_reply snb 
    		
    		
   			if(g_memoRoomId == g_memoSnb) param.repSnb = 0;	 //같다면 작성자 댓글 repSnb = 0;(본인이 첫글)
       		else param.repSnb = g_memoSnb;					 //ib_comment 고유 키값
    		
    			
    	}
    	 
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		
    		endLoadingBar();
    		
    		if(cnt == -8){
    			
    			alert("로그인 후 이용해주세요.");
				location.href = "${pageContext.request.contextPath}/m/login.do";
    		}else if(cnt > 0){
    			
				if(g_memoRoomId ==0) g_memoRoomId = cnt;
     	 		toast.push("등록되었습니다.");
     	 		
     	 		workMemoFnObj.doSearch();	//목록화면 재조회 호출.
     	 		
     	 		$("#scrollChatArea").animate({ scrollTop: $('#scrollChatArea').prop("scrollHeight")}, 100);
     	 		//$("#scrollChatArea").get(0).scrollIntoView();
  
    		
    		}else{
    			alert("서버오류!!");
    		}
    		
    		
    	
    	};
    	
    	var beforeSubmit = function(){
    		
    		startLoadingBar();
    	};
    

     	commonAjax("POST", url, param, callback, false, beforeSubmit);
		 
     	
     },

     //글 삭제
     doDeleteComment : function(memoCommentId,replyYn){
    	
    	var url = contextRoot + "/m/schedule/doDeleteReply.do";
    	 
    	//본글일때
    	if(replyYn == 'N'){
    		 if(!confirm("해당 글을 삭제하면 목록에서 삭제됩니다. 삭제하시겠습니까?")){
    	    		return false;
    	     }
    		 
    		 url = contextRoot + "/m/schedule/doDeleteFirstComment.do";
    	}
    	
    		
      	var param = {
      			 memoSNb		: memoCommentId,
      			
      	}
      	var callback = function(result){

      		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		
    		if(cnt == -8){
    			
    			alert("로그인 후 이용해주세요.");
				location.href = "${pageContext.request.contextPath}/m/login.do";
				
    		}else{
    			
      			
      			
      			/* if('${openType}' == 'inner'){
  					memoSearchViewObj.autoPageRefreshSet();		//페이지 refresh
  				} */
      			
      			if(replyYn == 'N'){
      				
      				
      				if(cnt == -5){
      					swal("이미 확인한 참가자가 있어 삭제할 수 없습니다.");
      					
      				}else{
      					toast.push("삭제되었습니다.");
      					$("#memoViewPopCanBtn").trigger("click");
      				}
      				
      			}else{
      				toast.push("삭제되었습니다.");
      				workMemoFnObj.doSearch();	//목록화면 재조회 호출.
      			}
      			
      			
      			
      			
      		}

      	};

      	commonAjax("POST", url, param, callback);

     },
     
     //참가자 추가 
     doSaveEntry : function(g_memoRoomId){
    	
    	var url =contextRoot + "/m/schedule/doSaveEntry.do";
    	

		var entryUserList =[];		//유저 등록 리스트(사번)
   	 	var entryNameList =[];		//유저 등록 리스트(이름)
   	 
   
   	
	 	for(var i=0 ; i<g_newUserList.length; i++){
			if(getArrayIndexWithValue(g_entryUserList, g_newUserList[i].sabun) <0 && g_newUserList[i].sabun != '${userLoginInfo.sabun}' ){				//참가자 리스트에 신규로 등록한 사람이 없으면, 등록
				
				entryNameList.push(g_newUserList[i].usrNm);
				entryUserList.push(g_newUserList[i].sabun);
			
			 }
	 	}
   	 
   	 	if(entryUserList.length == 0) return false;
	
     	var param = {
     			 mainSnb  		: g_memoRoomId,
     			 entryUserList  : entryUserList.join(',')	 
     	};

     	var callback = function(result){
     		
     		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		
    		if(cnt == -8){
    			
    			alert("로그인 후 이용해주세요.");
				location.href = "${pageContext.request.contextPath}/m/login.do";
    		}else if(cnt >0){
    			
    			endLoadingBar();
         		toast.push(" 완료되었습니다.");
         		g_entryUserList = entryUserList;
        		g_entryNameList = entryNameList;
        	/* 	
        		if('${openType}' == 'inner'){
  					memoSearchViewObj.autoPageRefreshSet();		//페이지 refresh
  				}
        		 */
        		workMemoFnObj.doSearch();
    		}else{
    			
    			alert("서버오류");
    		}
     		
     		
     	};
     	
     	/* var beforeSubmit = function(){
    		startLoadingBar();
    	}; */
    	 
     	commonAjax("POST", url, param, callback, false); 
     },


   	 //읽음 업데이트
     doSaveLastReadDate : function(){
		
    	 //이미 읽음 확인 상태면 false
    	if($("#readChekBtn").hasClass('on') || g_memoRoomId == 0){
    		return false;
    	}
 		var url =contextRoot + "/m/schedule/saveLastReadDate.do";

    	var param = {
    			 mainSnb	 	: g_memoRoomId ,		//snb 혹은 mainSnb 
    			 snb 			: g_memoSnb ,			//snb 
    			 myMemoYn 		: g_myMemoYn 
    	};

    	var callback = function(result){
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		
    		if(cnt == -8){
    			
    			alert("로그인 후 이용해주세요.");
				location.href = "${pageContext.request.contextPath}/m/login.do";
    		
    		}else{
    			/* 
    			if('${openType}' == 'inner'){
  					memoSearchViewObj.autoPageRefreshSet();		//페이지 refresh
  				} */
    	 		workMemoFnObj.doSearch();	//목록화면 재조회 호출.
    	 	
    	 	}

    	 }

    	 commonAjax("POST", url, param, callback, false);

     },
     
     //메모 타입 변경
     changeMemoType : function(){

    		var url = contextRoot + "/work/updateMemoType.do";
    		
    		var memoType = $("li[name=memoType][class*=current]").attr('memoType-val');
    		
    		var param = {
    						memoType : (memoType == undefined ? '00010' : memoType),
    						memoSnb	 : g_memoRoomId
    					};

    		var callback = function(result){
    			
    			toast.push("변경되었습니다.");
    		};
    		
    		commonAjax("POST", url, param, callback, false);
     },
     
     //별표세팅
     setImportant : function(val){
    	var starList = $("a[name=important][class=on]").length;
    	
     	$("a[name=important]").removeClass("on");

     	 for(var i=1; i<=val; i++){
     		 $("#important_"+i).addClass("on");
     	 }
     
     	

     	 if(val == 1 && starList == 1){
 			 $("#important_1").removeClass("on");
 		 } 

      },

      //메모 검색 버튼 누름
      clickSearchMemo : function(searchYn){
    		//검색모드
    		if(searchYn == 'Y'){
    			
    			workMemoFnObj.initArea();
    			$(".noSearch").hide();
    			$("#memoSearchArea").show();
    			$("#memoSearchArrowArea").show();
    			//$("#searchKeyWord").focus();
    			
    		}else{
    			
    			$("#searchKeyWord").val("") ;
    			$(".searchHtmlArea").removeHighlight('highlight_memoView'); 
    			$(".noSearch").show();
    			$("#memoSearchArea").hide();
    			$("#memoSearchArrowArea").hide();
    			$('.selectTxt').removeClass('selectTxt');
    		
    			
    		}
    	},
    	
  		
  		//메모검색
    	searchMemo : function (searchNum,noAlert){
    		
    		g_searchObjList=[];
    		
			$(".searchHtmlArea").removeHighlight('highlight_memoView'); 
    		var key = $("#searchKeyWord").val();
    		var objList = $(".searchHtmlArea");
 
    		 for(var i=0; i<objList.length; i++){
    			
    			 commentTxt = ($(objList[i]).html()).toUpperCase();
    			if(commentTxt.indexOf(key.toUpperCase()) > -1)  g_searchObjList.push(objList[i]);
    			
    		} 
    		
    	    if(g_searchObjList.length == 0 || key =="") {
  				 if(noAlert != 'false') swal("검색 내용이 없습니다.");
  				
  				 $(".btn_memo_up").addClass('off');
  	  	    	 $(".btn_memo_down").addClass('off');
  		    	 return;
    	    }else if (g_searchObjList.length == 1){
    	    	
    	    	$(".btn_memo_up").addClass('off');
    	    	$(".btn_memo_down").addClass('off');    
    	    	
    	    }else{
    	    	
    	    	$(".btn_memo_down").addClass('off');
  				$(".btn_memo_up").removeClass('off');
    	    }
    		
    		tempCount =g_searchObjList.length-1;
    		
    	
    		g_searchObjList[tempCount].scrollIntoView(true);
    		$(g_searchObjList).highlight(key,'highlight_memoView'); 
    		
    	 		
    	},
  	
	  	searchMemo_m  : function(searchNum){  
	  		
	  		if(tempCount == 0) {
	  			swal("더 이상 검색할  단어가 없습니다 "); 
	  			$(".btn_memo_up").addClass('off');
	  			return;
	  		}else if(g_searchObjList.length-1 == tempCount){
	  			$(".btn_memo_up").addClass('off');
				
			}else{
				
				$(".btn_memo_up").removeClass('off');
				
			}
	  		
	  		var key = $("#searchKeyWord").val(); 
			count =tempCount-1;
			tempCount=count;
			
		   
			
			$(".btn_memo_down").removeClass('off');
			g_searchObjList[tempCount].scrollIntoView();
			
			
	  	},
	  	
		searchMemo_p  : function(searchNum){
			
			if( g_searchObjList.length-1 == tempCount){
				swal("더 이상 검색할  단어가 없습니다 ");
				$(".btn_memo_down").addClass('off');
				return;
				
			}else if(g_searchObjList.length-2 == tempCount){
				$(".btn_memo_down").addClass('off');
				
			}else{
				
				$(".btn_memo_down").removeClass('off');
			}
			
	  		var key = $("#searchKeyWord").val();
	
			count =tempCount+1;
			tempCount=count;
			
			$(".btn_memo_up").removeClass('off');
			g_searchObjList[tempCount].scrollIntoView();
	  		
	  	},
  	
	  	//메모타입 선택
	  	selectMemoType : function(memoType){
	  		
	  		$("#sendWorkDiaryChkArea").hide();
	  		
	  		//내 메모일때만 유형 변경 가능
	  		if(g_myMemoYn == 'Y'){
	  			var objList = $("li[name=memoType]");
	  	  		
	  	  		for(var i=0; i<objList.length; i++){
	  	  			
	  	  			if($(objList[i]).attr('id') == 'memoType_'+memoType){
	  	  				if($(objList[i]).hasClass('current')){
	  	  					
	  	  					$(objList[i]).removeClass('current');
	  	  					
	  	  				}else{
	  	  					
	  	  					$(objList[i]).addClass('current');
	  	  					if(memoType != '00020' && g_memoRoomId == 0){
	  	  						
	  	  						$("#sendWorkDiaryChkArea").show();
	  	  						if(memoType == '00030') $("#sendSmsChk").prop("checked",true);	//sms 보내기 체크
	  	  					}
	  	  				}
	  	  			}else $(objList[i]).removeClass('current');
	  	  				
	  	  		}
	  	  		
	  	  		if(g_memoRoomId != 0){
	  	  			
	  	  			workMemoFnObj.changeMemoType();
	  	  		}
	  		}
  		
	
  	},
  	
  	//========================팝업 : S =========================//
  	
  	//더보기
  	popMoreView : function(){
  		//$('div#memoViewPop.bottomBox').css('top', '0');
  		
  		var url= "/m/schedule/memoMoreViewPop_openLayer.do";
  		
  		var params ={};
  		
  		commonPopAllObj.pushBeforeUrl();
  		
  		var callback = function(result){
  			
  			$("#memoMoreViewArea").html(result);
  		
  		
  	  	 	if(!$('.memoMore_bg_layer').length) $('#memoMoreViewPop').before('<div class="memoMore_bg_layer" onclick="closeRightBox(\'memoMoreViewPop\',\'\');"></div>');
  	  		$('#memoMoreViewPop').removeClass('disPlayNone');
  	  		$('#memoMoreViewPop').animate({ 'right' : '0'},300);
  			
  	  		nowUrl = url;
			
			window.history.pushState({'url' : url}, 'Title', "#"+url);
  	  
      	}
      	
  		commonAjaxTohtml( contextRoot+url, params, callback);
  	},
  	
  	//날짜 변경시 요일변경 
  	changeDate : function(selectDate){
  		
  		var date =  selectDate;
  		var dateArr = date.split('-');
  		$("#memoDateNameArea").html('('+getWeekName(dateArr[0],dateArr[1],dateArr[2])+')');
  	},
  	
  	//메모 수정 모드
  	openEditBtn : function(th,event){
	
  		$('span[name=editBtnArea]').removeClass('show');
  		$(th).find('span[name=editBtnArea]').addClass('show');
  		event.stopPropagation();
  		
  		$("#comment").addClass("focus");
  		
  	},
  	
	//내용입력 란 키우기
   	resizeText : function(){
  		$("#comment").addClass("focus");
  		
  	},
  	
  	//채팅 란 클릭 일때 
   	clickChatArea : function(){
  		
  		$("#comment").removeClass("focus");
  		$('span[name=editBtnArea]').removeClass('show');
  	}
		
};

$(function(){
	
	workMemoFnObj.preloadCode();		//선코딩
	
	if('${memoId}'>0){		//메모 방 정보
		workMemoFnObj.getRoomInfo();
		workMemoFnObj.getRoomEntry();
		workMemoFnObj.getRoomComment();
		
		if('${searchKey}' !='' && '${searchKey}' !=null){
			
			workMemoFnObj.clickSearchMemo('Y');
			$("#searchKeyWord").val('${searchKey}');
			workMemoFnObj.searchMemo(0,'false');
			
			
		}
	}
	
 
});

</script>