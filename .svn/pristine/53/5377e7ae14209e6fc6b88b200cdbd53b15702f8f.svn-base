<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="wrap">
	<div class="mb_sub_location">
		<button type="button" class="back" id="workViewPopCanBtn" onclick="closeBottomBox('workViewPop','workViewArea','first');"><em>이전</em></button>
		<a href="javascript:;" class="depth01">업무일정</a><a href="javascript:;" class="depth02">업무상세보기</a>
	</div>
	<section class="contentsWrap con_pdst01">
		<!--서브컨텐츠-->
		<div>
			<table class="tb_view_basic02">
				<colgroup>
					<col width="70"/> 
					<col width="*"/> 
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="valign">제목 </th>
						<td class="contxt_title" id="titleArea"></td>
					</tr>
					<tr>
						<th scope="row" class="valign">내용  </th>
						<td class="contxt_area" id="noteArea"></td>
					</tr>
					<tr>
						<th scope="row" class="valign">진행상태</th>
						<td class="contxt_line" id="processArea"></td>
					</tr>
					<tr>
						<th scope="row" class="valign">작성일  </th>
						<td class="contxt_line" id="tmDtArea"></td>
					</tr>
				</tbody>
			</table>
		</div>	
		<div class="btn_box_basic">
			<ul class="btn_b_list btn_count3"> 
				<li><button type="button" onclick="javascript:workDiaryObj.deleteWorkDiary();" class="btn_mobile_white01">삭제</button></li>
				<li><button type="button" class="btn_mobile_gray01" onclick="closeBottomBox('workViewPop','workViewArea','first');" >닫기</button></li>
				<li><button type="button" onclick="workDiaryObj.workProcInnerPop('${sNb}','inner');" class="btn_mobile_blue01">수정</button></li>
			</ul>
		</div>
	</section>
	<!--//서브컨텐츠//-->
		
		
	<div class="rightBox disPlayNone" id="workProcInnerPop">
		<div class="rightBox-inner">
	       <div id="workProcInnerArea"></div>
	   </div>
	</div>	
</div>


<script>

var g_sNb = '${sNb}';	//업무일지 아이디 

var workDiaryObj = {
		
		
		//데이터 세팅
		getWorkDiaryInfo : function(){
			
			var url = contextRoot + "/m/schedule/getWorkDiaryInfo.do";
			
			var param = {
					workSnb	 : g_sNb,
				
			};
			
		
			var callback = function(result){
				
				var obj = JSON.parse(result);
	    		  
	    		var workDiaryInfo = obj.resultObject;		//결과수
	    		var regex = /<br\s*[\/]?>/gi;
	    		if(workDiaryInfo != null){
	    			
	    			$("#titleArea").html(workDiaryInfo.title);
	    			$("#noteArea").html((workDiaryInfo.note).replace(/\r\n/gi,'</br>'));
	    			$("#tmDtArea").html((workDiaryInfo.tmDt).replace(/-/gi,'/'));
	    			
	    			var processTxt = '계획';
	    			if(workDiaryInfo.process == '00002')		processTxt = '진행';
	    			else if(workDiaryInfo.process == '00003')	processTxt = '완료';
	    			else if(workDiaryInfo.process == '00004')	processTxt = '보류';
	    						
	    			
	    			$("#processArea").html(processTxt);
	    			
	    		}
			}; 
			
		
			commonAjax("POST", url, param, callback, true); 
			
		},
		
		//업무일지 삭제
		deleteWorkDiary : function(){
			

			swal({
				  title: "",
				  text: "업무를 삭제 하시겠습니까?",
				  
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  
				  cancelButtonText: '취소',
				  confirmButtonText: '삭제'
			  },
			  function(isConfirm){
				  
			    if (isConfirm) {
			    	var url = contextRoot + "/m/schedule/deleteWorkDiary.do";   
					
					var param = {
							sNb	 : g_sNb,
						
					};
					
					var callback = function(result){
						var obj = JSON.parse(result);
						var cnt = obj.resultVal;		//결과수
			    		
			    		if(cnt == -8){
			    			
			    			alert("로그인 후 이용해주세요.");
							location.href = "${pageContext.request.contextPath}/m/login.do";
							
			    		}else{
							$("#workViewPopCanBtn").trigger("click");
							
							if(workDiaryObj.getWorkDiaryInfo() != 'undefined'){
								workDiaryObj.getWorkDiaryInfo();
							}
			    		}
					};
					
					commonAjax("POST", url, param, callback, true); 
			    }
			  });
	
			
		},
		
		//업무일지 수정
		workProcInnerPop : function(sNb,openType){
			
			var url= "/m/schedule/workProcPop_openLayer.do";
			
	  		var params ={	
	  				
	  				sNb  		: sNb,
	  				openType	: openType
	  		};
	  		
	  		commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  		
	  			$("#workProcInnerArea").html(result);  
	  		//	$('#workProcInnerPop').removeClass('disPlayNone');
	  			
	  			$('#workProcInnerPop').animate({'right':'0'},300);
	  			$('#workProcInnerPop').removeClass('disPlayNone');
				window.history.pushState({'url' : url}, 'Title', "#"+url);
				nowUrl = url;
	
	      	}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback); 
			
		},   
	

};

$(function() {   
	
	workDiaryObj.getWorkDiaryInfo();
	
});	


</script>