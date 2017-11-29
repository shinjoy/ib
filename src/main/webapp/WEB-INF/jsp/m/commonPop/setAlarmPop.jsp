<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    	<!-- 고정서브navi -->
	 	<div class="sub_fixWrap">
	    	<div class="memo_search_Wrap">
				<div class="mb_sub_location">
					<button type="button" class="back" id="setAlarmPopCanBtn" onclick="closeRightBox('setAlarmInnerPop','setAlarmInnerArea');"><em>취소</em></button>
					<a href="javascript:;" class="depth03">알림셋팅 화면</a>
				</div>
			</div>
		</div>
		<!--//고정서브navi//-->
		
		<!--서브컨텐츠-->
		<section class="contentsWrap scrollArea alarmsetWrap" >
			<article class="alarm_setwrap">
				<!--일정알림-->
				<h3 class="alarm_title"><span class="icon_sche">일정알림</span></h3>
				<ul class="alarmset_ck">
					<li>
						<span class="alarmset_con">신규일정 등록시</span>
						<label for="schedulePushYn"><input id="schedulePushYn" type="checkbox" value="Y" class="alarm_ck" onclick="setAlarmObj.savePushInfo();"><span class="toggle_icon"></span></label>
					</li>
				</ul> 
				<!--//일정알림//-->
				
				<!--메모알림-->
				<h3 class="alarm_title"><span class="icon_memo">메모알림</span></h3>
				<ul class="alarmset_ck">
					<li>
						<span class="alarmset_con">신규메모 등록시</span>
						<label for="memoPushYn"><input id="memoPushYn" type="checkbox" value="Y" class="alarm_ck" onclick="setAlarmObj.savePushInfo();"><span class="toggle_icon"></span></label>
					</li>
					<li>
						<span class="alarmset_con">이전메모에 추가댓글 등록시</span>
						<label for="memoCommentPushYn"><input id="memoCommentPushYn" type="checkbox" value="Y" class="alarm_ck" onclick="setAlarmObj.savePushInfo();"><span class="toggle_icon"></span></label>
					</li>
				</ul>
				<!--//메모알림//-->
				
				<!--딜알림-->
				<h3 class="alarm_title"><span class="icon_deal">딜알림</span></h3>
				<ul class="alarmset_ck">
					<li>
						<span class="alarmset_con">모든 신규딜 등록시</span>
						<label for="dealPushYn"><input id="dealPushYn" type="checkbox" value="Y" class="alarm_ck" onclick="setAlarmObj.savePushInfo();"><span class="toggle_icon"></span></label>
					</li>
					<li>
						<span class="alarmset_con">신규 코멘트 등록시(본인작성)</span>
						<label for="dealCommentPushYn"><input id="dealCommentPushYn" type="checkbox" value="Y" class="alarm_ck" onclick="setAlarmObj.savePushInfo();"><span class="toggle_icon"></span></label>
					</li>
					<li>
						<span class="alarmset_con">진행상태 변경시(본인작성)</span>
						<label for="dealStatusPushYn"><input id="dealStatusPushYn" type="checkbox" value="Y" class="alarm_ck" onclick="setAlarmObj.savePushInfo();"><span class="toggle_icon"></span></label>
					</li>
					<li>
						<span class="alarmset_con">분석자 지정시</span>
						<label for="dealAnalPushYn"><input id="dealAnalPushYn" type="checkbox" value="Y" class="alarm_ck" onclick="setAlarmObj.savePushInfo();"><span class="toggle_icon"></span></label>
					</li>
				</ul>
				<!--//딜알림//-->
				
			</article>
			
			<!--//업무내용//-->			
		</section>
		<!--//서브컨텐츠//-->

<script>

var setAlarmObj = {
		
		 preloadCode : function(){
			

		 },
		 
		 //검색
		 doSearch : function(){
			
			 var url = contextRoot+"/common/getStaffListNameSort.do";
			 
			
			 var param = { userId : '${userLoginInfo.staffSnb}'};
			 
			 var callback = function(result){
				 var obj = JSON.parse(result);
				 var list = obj.resultList;
				 
				 if(list.length == 0){
					 
					 swal("사용자 정보 조회에 실패했습니다.");
					 return false;
					 
				 }else{
					 var userObj = list[0];
						
					
					 if(userObj.schedulePushYn == 'Y') 	  $("#schedulePushYn").prop("checked",true);
					 
					 //메모
					 if(userObj.memoPushYn == 'Y') 		  $("#memoPushYn").prop("checked",true);
					 if(userObj.memoCommentPushYn == 'Y') $("#memoCommentPushYn").prop("checked",true);
					 if(userObj.memoPushYn == 'Y' && userObj.memoCommentPushYn == 'Y') $("#memoAllPushYn").prop("checked",true);
					 
					 //딜
					 if(userObj.dealPushYn == 'Y') 		  $("#dealPushYn").prop("checked",true);
					 if(userObj.dealCommentPushYn == 'Y') $("#dealCommentPushYn").prop("checked",true);
					 if(userObj.dealStatusPushYn == 'Y')  $("#dealStatusPushYn").prop("checked",true);
					 /* if(userObj.dealPushYn == 'Y' &&  userObj.dealCommentPushYn == 'Y' && userObj.dealStatusPushYn == 'Y') $("#dealAllPushYn").prop("checked",true);  */
					 if(userObj.dealAnalPushYn == 'Y')  $("#dealAnalPushYn").prop("checked",true);
				 }
				
				
			
			 };
			
			 commonAjax("POST", url, param, callback, false);
			 
		 },
		 
		 //상위 그룹 
		 topCheck : function(obj,relType){
			
			 if($(obj).is(':checked')) $('input[type="checkbox"][rel-type="'+relType+'"]').prop("checked",true);
			 else $('input[type="checkbox"][rel-type="'+relType+'"]').prop("checked",false);
			 
			 setAlarmObj.savePushInfo();
			 
		 },
		 
		 //푸쉬 정보 변경 저장
		 savePushInfo : function(){
			 
			 var url = contextRoot+"/m/alarm/updateUserProfileToPushInfo.do";
			 
				
			 var param = { 
					 userId 			: '${userLoginInfo.staffSnb}',
					 schedulePushYn 	: $("#schedulePushYn").is(":checked") ? 'Y' : 'N',
					 memoPushYn 		: $("#memoPushYn").is(":checked") ? 'Y' : 'N',
					 memoCommentPushYn 	: $("#memoCommentPushYn").is(":checked") ? 'Y' : 'N',
					 dealPushYn 		: $("#dealPushYn").is(":checked") ? 'Y' : 'N',
					 dealCommentPushYn 	: $("#dealCommentPushYn").is(":checked") ? 'Y' : 'N',
					 dealStatusPushYn 	: $("#dealStatusPushYn").is(":checked") ? 'Y' : 'N',
					 dealAnalPushYn		: $("#dealAnalPushYn").is(":checked") ? 'Y' : 'N'
			 };
			 
			 var callback = function(result){
				 
				 var obj = JSON.parse(result);
				 var cnt = obj.resultVal;
				 
				 if(cnt == -8){
					 
					 alert("로그인 후 이용해주세요.");
					 location.href = "${pageContext.request.contextPath}/m/login.do";
				 }else{
					 setAlarmObj.doSearch();
					 
				 }
				 
			 };
			 
			 commonAjax("POST", url, param, callback, false);
			 
			 
		 }
		 
		
};


$(function(){
	
	setAlarmObj.preloadCode();
	setAlarmObj.doSearch();

});


</script>