<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	 <div id="wrap">
	 	<!-- 고정서브navi -->
	 	<div class="sub_fixWrap">
			<div class="mb_sub_location"><button type="button" class="back" id="memoMoreViewPopCanBtn" onclick="closeRightBox('memoMoreViewPop','');"><em>이전</em></button><a href="javascript:;" class="depth03">메모설정화면</a></div>
			<div class="tab_flatst">
				<ul class="tab_flatst_list n03">
					<li id="userTab" class="moveTab current" onclick="popMemoMoreFnObj.popMoreTabClick('user');"><a href="javascript:;" class="icon_addpeople">업무대상</a></li>
					<li id="fileTab" class="moveTab" onclick="popMemoMoreFnObj.popMoreTabClick('file');"><a href="javascript:;" class="icon_filebox">파일함</a></li>
					<li id="readTab" class="moveTab" onclick="popMemoMoreFnObj.popMoreTabClick('read');"><a href="javascript:;" class="icon_checklist">수신확인</a></li>
				</ul>
			</div>
		</div>
		<!-- //고정서브navi// -->
		
		<!-- 서브컨텐츠 -->
		<section class="contentsWrap topnavi addtab">
			<!-- 업무대상 -->
			<div id="tabSub_user" class="innerContent">
				<div class="con_pdst02" >
					<button type="button" id="addJoinUserBtn" class="btn_addMember" onclick="popMemoMoreFnObj.userCommonSelectPop();">업무대상추가</button>
				</div>
				<h3 class="tab_titleZone addline">업무대상</h3>
				<div class="con_pdst01 scrollArea" id ="entryListArea"></div>
			</div>
			<!-- //업무대상// -->
			<!-- 파일함 -->
			<div id="tabSub_file" class="innerContent" style="display:none;">
				<div class="file_searchbox">
					<div class="fl_block">
						<select id="fileSearchType" class="select_basic w100pro">
							<option value="">전체</option>
							<option value="sendNm">보낸사람</option>
							<option value="sendFile">첨부파일</option>
						</select>
					</div>
					<div class="fr_block">
						<input type="text"  class="input_basic w100pro" id="fileSearchNm" placeholder="이름 또는 파일명 입력" onkeyup="popMemoMoreFnObj.doFileSearch();"/>
					</div>
				</div>
				<div id="memoFileListArea" class="scrollArea"></div>	
			</div>
			<!-- //파일함// -->
			<!-- 참가자 수신확인 -->
			<div id="tabSub_read" class="innerContent scrollArea" style="display:none;">
				<h3 class="tab_titleZone">참가자 수신확인 목록</h3>
				<div class="memo_setting con_pdst01">
					<table class="tb_list_basic3" id="SGridTarget">
						<colgroup>
						<col width="30">
						<col width="*">
						<col width="26%" span="2">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" colspan="2">이름</th>
								<th scope="col">첫글확인</th>
								<th scope="col">전체확인</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
					<!-- //수신확인 목록// -->
					<!-- 수신확인 아이콘설명 -->
					<ul class="list_st_dot mgt08rem">
						<li><span class="state_icon_no_check"><em>첫글</em></span> : 첫글 미확인</li>
						<li><span class="state_icon_check"><em>첫글</em></span> : 첫글 확인</li>
						<li><span class="icon_comment n_read"></span> <span class="font_n_read">(no)</span> : 미확인 댓글이 있을때</li>
						<li><span class="icon_comment"></span> <span class="font_all_read">(ok)</span> : 미확인 댓글이 없을때</li>
					</ul>
					<!-- //수신확인 아이콘설명// -->
				</div>				
			</div>
			<!-- //참가자 수신확인// -->
		</section>
		<!-- //서브컨텐츠// -->
		
    </div>
	

<script>

var g_popFileList = [];	//file List

var popMemoMoreFnObj = {
		
		//탭 액션
		popMoreTabClick : function(type){
			
			$(".moveTab").removeClass('current');
			$("#"+type+"Tab").addClass('current');
			$(".innerContent").hide();
			$("#tabSub_"+type).show();
			
			if(type == 'file') popMemoMoreFnObj.doFileSearch();
			if(type == 'read') popMemoMoreFnObj.setReadBox();
		},
	
		//참가자 세팅
		setUserList : function(){
			var str ='';
			
			workMemoFnObj.getRoomEntry();
			
			for(var i=0;i<g_entryUserFullList.length;i++){
				str+='<dl class="work_mb_list">';
				str+='<dt class="mb_photo"></dt>';
				str+='<dd><span class="mb_name">'+g_entryUserFullList[i].name+'</span><span class="mb_grade">'+g_entryUserFullList[i].position+'</span>';
				if(g_entryUserFullList[i].isMaster == 'Y') str+='<span class="mb_leader">방장</span>';
				str+='</dd>';
				str+='</dl>';
			}
			
			
			$("#entryListArea").html(str);
			
		},
	
		//파일 리스트 세팅 및 검색 
		doFileSearch : function(){
		
			var key = $("#fileSearchNm").val();
			var searchType = $("#fileSearchType").val();
			
			var objList = $(".fileNmArea:contains('"+key+"')");
			
			var str ='';
			var currentDate = '';
			
			
			for(var i=0;i<g_fileList.length;i++){
				
				var dateStr = (g_fileList[i].dt).substring(0,10);
				var createdNm = g_fileList[i].name;
				var fileNm = g_fileList[i].comment;
				
				if(currentDate != dateStr){
					
					if( i>0 ) str +='</ul></article>'; 
					
					var dateArr = dateStr.split('-');
					str +='<article class="file_resultBox">';
					str +='<h4 class="title">'+dateStr.replace(/-/gi, '.')+' ('+getWeekName(dateArr[0],dateArr[1],dateArr[2])+'요일'+')</h4>';	
					str +='<ul class="list_st_bluedot">';
				}
				
				str+='<li><a href="javascript:workMemoFnObj.fileDownComment(\''+g_fileList[i].fileCategory+'\',\'';
				str += g_fileList[i].fileSnb + '\',\''+g_fileList[i].comment+'\');" class="fileNmArea">';
				
				//파일명
				if(key != '' && searchType != 'sendNm'){
					str +=fileNm.replace(new RegExp(key,"gi"),'<em class="mark_St">'+key+'</em>');
						
				}else{
					str +=fileNm;
				}
				
				str +='</a><span class="file_agent">';
				
				//보낸사람
				if(key != '' && searchType != 'sendFile'){
					str += createdNm.replace(new RegExp(key,"gi"),'<em class="mark_St">'+key+'</em>');
						
				}else{
					str += createdNm;
				
				}
				
				str +='</span>';
				str +='<span class="time">'+(g_fileList[i].dt).substring(10,16)+'</span></li>';
				
				currentDate = dateStr;
				
			}
			
			
			$("#memoFileListArea").html(str);
			
		},
		
		//수신확인
		setReadBox : function(){
			
			var str ='';
			
			for(var i=0; i< g_entryUserFullList.length; i++){
				str +='<tr id="tr_'+(g_entryUserFullList[i].isMaster == 'Y' ? 'roommaker' : '')+'">';
				str +='<td>'+(g_entryUserFullList[i].isMaster == 'Y' ? '<span class="state_icon_send"></span>' : '')+'</td>';
				str +='<td class="joinmember"><strong>'+g_entryUserFullList[i].name+'</strong>'+(g_entryUserFullList[i].isMaster == 'Y' ? '<em>방장</em>' : '')+'</td>';
				str +='<td><span class="'+(g_entryUserFullList[i].frstReadStts == '00002' ? 'state_icon_check' : 'state_icon_no_check' )+'"><em>첫글</em></span></td>';
				
				if(g_entryUserFullList[i].readStts == '00001'){	//안읽은게 있을때
					
					str +='<td><span class="icon_comment n_read"></span> <span class="font_n_read">(no)</span></td>';
				}else{	//안읽은게 없을때
					
					str +='<td><span class="icon_comment"></span> <span class="font_all_read">(ok)</span></td>';
				}
				
				
				str +='</tr>';
				
			}
			
			$('#SGridTarget tbody').html(str);
		
		},
		
		//직원선택 팝업 
		userCommonSelectPop : function(){
			
			var loginUserId = '${userLoginInfo.sabun}';
			var selectUserList = [];
		    var disabledList =[];
		   
			if(g_memoRoomId == 0){				//신규등록시
				
		    	
				for(var i=0;i<g_newUserList.length;i++){
					selectUserList.push(g_newUserList[i].sabun);
				}
			
				if(getRowIndexWithValue(g_newUserList,'sabun',loginUserId) <0){
			    		  
			    	selectUserList.push(loginUserId);    //나 무조건
			           
			    }
				disabledList.push(loginUserId);
		    	   
		    }else{
		    	selectUserList = g_entryUserList ;
		    	disabledList  = g_entryUserList ;
		    	
		    }
			
			//더보기 닫고
			closeRightBox('memoMoreViewPop','');
			
			
			
	  		var params ={	
	  				
	  				userList 	 : 	selectUserList.join(','),
	  				disabledList : 	disabledList.join(','),
	  				isCheckDisable : 'N',		//disable 상위 부서에 조작에 따른 선택여부
	  				isAllOrgSelect : 'Y',		//org간 선택가능
	  				isAllOrg	   : 'Y',
	  				isUserGroup	   : 'Y',
	  				hasDeptTopLevel: 'Y'
	  		};
	  		
	  		//시간 차를 두고 호출
	  		setTimeout(function() {
	  			
	  			commonPopAllObj.openUserSelectPop(params);   //commonPopAll.jsp 
	  		}, 200); 
	
		}
		
		
};


$(function(){
	if(g_memoRoomId > 0) popMemoMoreFnObj.setUserList();
	popMemoMoreFnObj.popMoreTabClick('user');

});


</script>