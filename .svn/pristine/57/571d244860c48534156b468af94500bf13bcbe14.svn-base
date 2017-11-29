<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div id="wrap">
	<div class="mb_sub_location">
		<c:choose>
			<c:when test="${openType eq 'inner' }">
				<button type="button" id="workProcPopCanBtn" class="back" onclick="closeRightBox('workProcInnerPop','workProcInnerArea');"><em>이전</em></button>
			</c:when>
			<c:otherwise>
				<button type="button" id="workProcPopCanBtn" class="back" onclick="closeBottomBox('workProcPop','workProcArea','first');"><em>이전</em></button>
			</c:otherwise>
		</c:choose>
		<a href="javascript:;" class="depth01">업무일정</a><a href="javascript:;" class="depth02">업무등록</a>
	</div>
	<!--서브컨텐츠-->
	<section class="contentsWrap con_pdst01">
		<div>
			<table class="tb_input_basic02">
				<colgroup>
					<col width="70"/> 
					<col width="*"/> 
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"  class="valign"><label for="title" >제목 </label></th>
						<td ><input type="text"  id="title" class="input_basic w100pro"  /></td>
					</tr>
					<tr>
						<th scope="row" class="valign"><label for="note">내용</label></th>
						<td class="valign"><textarea id="note" class="textarea_basic2 w100pro"></textarea> </td>
					</tr>
					<tr>
						<th scope="row" class="valign"><label for="ScheduleType">진행상태 </label></th>
						<td class="valign">
							<select id="process" class="select_basic wdate">
								<option value="00001">계획</option>
								<option value="00002">진행</option>
								<option value="00003">완료</option>
								<option value="00004">보류</option>
							</select>
						
						</td>
						
					</tr>
					<tr>
						<th scope="row" class="valign"><label for="stbDate">작성일 </label></th>
						<td class="valign">
							<input type="date" id="stbDate" class="select_basic wdate"/>
					    </td>
					</tr>
				</tbody>
			</table>
		</div>	
		<div class="btn_box_basic">
			<ul class="btn_b_list btn_count2">
				<c:choose>
					<c:when test="${openType eq 'inner' }">
						<li><a class="btn_mobile_gray01" onclick="closeRightBox('workProcInnerPop','workProcInnerArea');" >취소</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="btn_mobile_gray01" onclick="closeBottomBox('workProcPop','workProcArea','first');" >취소</a></li>
					</c:otherwise>
				</c:choose>
				<li><button type="button" id="AddEnd"  onclick="javascript:workDiaryProcObj.workDiarySave();" class="btn_mobile_blue01">저장</a></li>
			</ul>
		</div>
	</section>
	<!--//서브컨텐츠//-->
</div>

<script>

var g_sNb = '${sNb}';	//업무일지 아이디 


var workDiaryProcObj = {
		
		preloadCode : function(){
			
			if(g_sNb == 0) $("#stbDate").val(g_selectDate);
			else workDiaryProcObj.getWorkDiaryInfo();
		    
		},
		
		//수정시 데이터 셋
		getWorkDiaryInfo : function(){
			
			var url = contextRoot + "/m/schedule/getWorkDiaryInfo.do";
			
			var param = {
					workSnb	 : g_sNb,
				
			}
			
		
			var callback = function(result){
				
				var obj = JSON.parse(result);
	    		  
	    		var workDiaryInfo = obj.resultObject;		//결과수

			    var regex = /<br\s*[\/]?>/gi;

	    		if(workDiaryInfo != null){
	    			
	    			$("#title").val(workDiaryInfo.title);
	    			$("#note").val(workDiaryInfo.note.replace(regex, "\n")); 
	    			$("#stbDate").val(workDiaryInfo.tmDt);
	    			$("#process").val(workDiaryInfo.process);  
	    			
	    		}
			}; 
			
		
			commonAjax("POST", url, param, callback, true); 
			
		},
		
		//업무일지 저장&수정 
		workDiarySave : function(){

			   if($("#title").val() =="") {
				   swal('제목을  작성해 주세요 .');
					$('#title').focus();
					return;
			   
			   }
			   
			   if ($("#stbDate").val() ==""){
				   swal('작성일 선택 해주세요 .');
				   $('#stbDate').focus();
				   return;
			   }
		
			var url = contextRoot + "/m/schedule/workDiarySave.do";
			
			var param = {
					sNb				: g_sNb,
					title			: $("#title").val(),
					note			: $('#note').val().replace(/\n/g, "\r\n"),
					tmDt			: ($("#stbDate").val()).replace(/-/gi,''),
					process			: $("#process").val(),
					bsnsRecPrivate  : '1'
			}
			
		
			var callback = function(result){
				
				var obj = JSON.parse(result);
	    		  
	    		var cnt = obj.resultVal;		//결과수
				
				if(cnt > 0){			
					
					if('${openType}' == 'inner'){
						
						closeRightBox('workProcInnerPop','workProcInnerArea');
						closeBottomBox('workViewPop','workViewArea','first');
						
					}else $("#workProcPopCanBtn").trigger("click");
					
			/* 		if(g_workOpenType == 'cal'){
						
						scheCalObj.setSelectList();
					}else{
						scheListObj.searchCalendarDate();
					} */
					
				}else if(cnt == -8){
					
					alert("로그인 후 이용해주세요.");
					location.href = "${pageContext.request.contextPath}/m/login.do";
				}else{
					swal("서버에러!!");
					return;
				}
			}; 
			
		
			commonAjax("POST", url, param, callback, true); 
		},


			


};

$(function() {   
	
	workDiaryProcObj.preloadCode();

	
});	


</script>