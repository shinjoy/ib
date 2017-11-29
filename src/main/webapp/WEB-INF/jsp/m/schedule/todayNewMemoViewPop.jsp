<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<!-- 고정서브navi -->
	<div class="sub_fixWrap">
		<div class="memo_search_Wrap">
			<div class="mb_sub_location">
				<button type="button" class="back" id="todayNewMemoViewPopCanBtn" onclick="closeBottomBox('todayNewMemoViewPop','todayNewMemoArea','first');"><em>이전</em></button>
				<a href="javascript:;" class="depth01">신규 업데이트</a><a href="javascript:;" class="depth02">업무메모</a>
			</div>
		</div>
	</div>
	<!--//고정서브navi//-->
	<div class="scrollArea newupdateWrap">	
  		<div class="memo_srch_Result" id="newTodayMemoListArea"></div>
  	</div>

<!-- 메모 뷰 -->
<div class="rightBox disPlayNone" id="memoViewInnerPop">
	<div class="rightBox-inner">
      <div id="memoViewInnerArea"></div>
  	</div>
</div> 
<!--// 메모 뷰 //-->  	
	
<script>

var g_currentMemoId = 0;

var todayNewMemoViewObj = {
		
		 preloadCode : function(){
			
			
		 },
		 
		 //검색
		 doSearch : function(type){
			
		 	
			 var url = contextRoot+"/m/schedule/getTodayNewMemoList.do";
			 
			
			 var param = {
				
					 
			 };
			 
			 var callback = function(result){
		
				var obj = JSON.parse(result);
				var list = obj.resultList;
			
				var str='';
				
		    	//-- 세팅
		    	if (list.length == 0) {
					
		    		str='<dl class="memo_result_Box"><dt></dt><class="context">신규 업데이트 메모가 없습니다.<br/>(오늘 이전 글의 신규 댓글 + 오늘 내가 참여된 글)</dd></dl>';
			    }else{
			    	
					for(var i = 0; i < list.length; i++){

						
						var memoKind = '';
						var iconClass ='';
						var sendNm = list[i].sendNm;
						var fromTo = 'contact_from';
				
						str += '<dl class="memo_result_Box" id="memoListDl_'+list[i].sNb+'" onclick="todayNewMemoViewObj.memoViewInnerPop(';
						
						if(list[i].mainSnb == 0) str += list[i].sNb;
						else str += list[i].mainSnb;
						
						str += ','+list[i].sNb+',\'inner\')">';
						
						
						if (list[i].grpMemCnt == 1) {
					   
							memoKind = ' 메모';
							sendNm = '나';
							iconClass = 'state_icon_memo';   
							
						}else if (list[i].mainSnb == '0'){
							
							memoKind = ' 발신';
							
							if(list[i].readStts == '00002')iconClass = 'state_icon_check';
							else iconClass = 'state_icon_send';
							
							sendNm = list[i].revNm;
							fromTo = 'contact_to';
					
				 		}else {
					
				 			memoKind = '수신';
							if(list[i].readStts == '00002') iconClass = 'state_icon_check';
							else iconClass = 'state_icon_order';
		 
					    }
				       
				      
						str += '<dt class="titledate">'+(list[i].tmDt).replace(/-/gi,'.')+'</dt>';
				      	str += '<dd><span class="'+iconClass+'">'+memoKind+'</span><span class="'+fromTo+'" name="memo'+list[i].memoKind+'NameAreaTxt">'+sendNm+' </span>';
				      	str += '<span class="icon_count_em">'+list[i].grpMemCnt+'</span>';
				    	
				    	if(list[i].repCnt >0){
							str += '<span class="icon_comment '+(list[i].sttsCd == '00001' ? 'n_read' : '')+'" >('+list[i].repCnt+')</span>';
						}
						
						if(list[i].fileCount >0){
							str += '<span class="icon_clip">('+list[i].fileCount+')</span>';
						}
				    	
				    	
				      	str += '</dd>';
				      	
				      	str +='<dd class="context"><a href="javascript:;"/>';
				      	
				      	
				      	if (list[i].importance =='1')         str += '<span class="icon_important_L1"><em>!</em></span>';
					 	else if (list[i].importance =='2')    str += '<span class="icon_important_L2"><em>!!</em></span>';
					  	else if (list[i].importance =='3')    str += '<span class="icon_important_L3"><em>!!!</em></span>';
						
					  	if(list[i].private =='Y') str += '<span class="icon_secret"><em>비밀글</em></span>';
				  		
					  	
					  	var txtColor = '#4d87f5;';
						if(list[i].memoType == '00030') txtColor = '#ff4d06;';
						
						str += '<span name="memoCommentAreaTxt">';	
						if(list[i].memoTypeNm != '') str += '<strong style="color: '+txtColor+'">['+list[i].memoTypeNm+']</strong>';
						str +=  list[i].comment + '</span> ';
					  	
					  	str += '</a></dd>';
					  	str += '</dl>';
				      
				     
					}
					
					 
			    }
		    	
		    	$("#newTodayMemoListArea").html(str);
		    	
		   
			 };
			
			 commonAjax("POST", url, param, callback, false);
			 
		 },
		 

		 
		 //메모팝업
		 memoViewInnerPop : function(memoMainSnb,memoSnb,openType){
			
			g_currentMemoId = memoSnb;
			
			var url= "/m/schedule/memoViewPop_openLayer.do";
			
				
	  		var params ={	
	  				
	  				memoId 	 : memoMainSnb,
	  				memoSnb	 : memoSnb,
	  				openType : openType,
	  				searchKey : ''
	  		};
	  		
	  		commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  		
	  			
	  			$("#memoViewInnerArea").html(result);  
	  			//시간 차를 두고 호출
	  			//$('#memoViewInnerPop').parent().css('height','100%');
	  			$('#memoViewInnerPop').removeClass('disPlayNone');
		  		$('#memoViewInnerPop').animate({'right':'0'},300);
		  		
		  		
	  			nowUrl = url;
	  			
	  			window.history.pushState({'url' : url}, 'Title', "#"+url);
	  			
	  			$("#scrollChatArea").animate({ scrollTop: $('#scrollChatArea').eq(0).prop("scrollHeight")}, 50);
	      	}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback); 
			
		}
	
		
};


$(function(){
	
	
	
	//memoSearchViewObj.preloadCode();
	todayNewMemoViewObj.doSearch();

	

});


</script>