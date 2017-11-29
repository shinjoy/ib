<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.highlight_memoSearch { background-color: orange;}

</style>

    	<!-- 고정서브navi -->
	 	<div class="sub_fixWrap">
	    	<div class="memo_search_Wrap">
				<div class="mb_sub_location">
					<button type="button" class="back" id="memoSearchViewPopCanBtn" onclick="closeBottomBox('memoSearchViewPop','memoSearchViewArea','first');"><em>이전</em></button>
					<a href="javascript:;" class="depth03">업무메모검색</a>
				</div>
				<div class="memo_srch_Period">
					<label><input type="checkbox" disabled="disabled"><span>기간</span></label>
					<input type="date" id="memoSearchStartDate" onchange="javascript:memoSearchViewObj.doSearch(1);"/>
					<span class="dash">~</span>
					<input type="date" id="memoSearchEndDate" onchange="javascript:memoSearchViewObj.doSearch(1);"/>
				</div>
				<div class="memo_srch_Input">
					<div class="fl_block">
						<select class="" id="srchTxtType" title="업무메모 구분선택">   
							<option value="" selected>전체</option>
							<option value="CONT">내용</option>
							<option value="SEND">보낸사람</option>
							<option value="RECV">받는사람</option>
							<option value="FILE">첨부파일</option>
						</select>
					</div>
					<div class="fr_block">
						<input type="text" id="srchTxt" placeholder="전체 검색어를 입력하세요" value="" title="검색어입력" onchange="javascript:memoSearchViewObj.doSearch(1);"/>
						<button type="button" class="" onclick="javascript:memoSearchViewObj.doSearch(1);" ><em>검색</em></button>
					</div>
				</div>
				<div class="tab_flatst">
					<ul class="tab_flatst_list n04">
						<li id="memoTab" class="memSearchTab current"><a href="javascript:memoSearchViewObj.searchTabType('');" >전체</a></li>
						<li id="memoTabSEND"  class="memSearchTab"><a href="javascript:memoSearchViewObj.searchTabType('SEND');" >수신</a></li>
						<li id="memoTabREV" class="memSearchTab"><a href="javascript:memoSearchViewObj.searchTabType('REV');">발신</a></li>
						<li id="memoTabMEMO" class="memSearchTab"><a href="javascript:memoSearchViewObj.searchTabType('MEMO');">내메모</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!--//고정서브navi//-->
		
		<!--서브컨텐츠-->
		<div class="contentsWrap scrollArea memoresultWrap" id="searchViewListArea_wrap">
			<!--업무내용-->
			<div class="memo_srch_Result">
				<div id="memo_seacrh_Result"></div>	
				<div class="bottom_plus_show">
					<button type="button" class="back"  onclick="javascript:memoSearchViewObj.nextPageGo();">더 보기 </button>
				</div>
			</div>
			<!--//업무내용//-->			
		</div>
	
		<!--//서브컨텐츠//-->
		
<!-- 메모 뷰 -->
<div class="rightBox disPlayNone" id="memoViewInnerPop">
	<div class="rightBox-inner">
      <div id="memoViewInnerArea"></div>
  	</div>
</div> 
<!--// 메모 뷰 //-->		
		

<script>

var g_memoSearchTab ='';
var g_memoCurPageNo = 1;				//현재페이지번호
var g_memoPageSize = 10;				//페이지크기(상수 설정)
var g_pageCount="";
var g_currentMemoId = 0;

var memoSearchViewObj = {
		
		 preloadCode : function(){
			
			 var nowDate = new Date(); 
			 $("#memoSearchEndDate").val(nowDate.yyyy_mm_dd());
			
			 nowDate.setMonth(nowDate.getMonth()-1);
			 $("#memoSearchStartDate").val(nowDate.yyyy_mm_dd());
			 
		 },
		 
		 //검색
		 doSearch : function(type){
			
			 var url = contextRoot+"/m/schedule/getMemoListForPaing.do";
			 
			 if(type == 1) g_memoCurPageNo =1;
			 
			 //초기화
			 if(g_memoCurPageNo == 1){
				 $("#memo_seacrh_Result").empty();
			 }
			  
			 var param = {
					 srchTxtType : $("#srchTxtType").val(),	//select
					 memoKind	 : g_memoSearchTab,			//tab   -send :수
					 srchTxt	 : $("#srchTxt").val(),		//text
					 startDate   : $("#memoSearchStartDate").val(),
					 endDate 	 : $("#memoSearchEndDate").val(),
					 pageNo		 : g_memoCurPageNo,
					 pageSize	 : g_memoPageSize
					 
			 };
			 
			 var callback = function(result){
				 
				endLoadingBar();
				var obj = JSON.parse(result);
				var resultObj = obj.resultObject;
				
		    	var list = resultObj.list;		//결과데이터JSON
		    	
		    	
		    	g_pageCount =resultObj.pageCount;
		    	g_memoCurPageNo = resultObj.pageNo;	//현재페이지
		    
		    	//버튼 감추기
		    	if(g_pageCount == g_memoCurPageNo || g_pageCount == 0) {
		    		
		    		$(".bottom_plus_show").fadeOut();
		    		
		    	}else $(".bottom_plus_show").fadeIn();
		    	
		    	//-- 세팅
		    	if (list.length == 0) {
					
					swal("검색한 메모가 없습니다. ");
			    }else{
			    	
			    	var str='';
	    			

					for(var i = 0; i < list.length; i++){

						
						var memoKind = '';
						var iconClass ='';
						var sendNm = list[i].sendNm;
						var fromTo = 'contact_from';
				
						str += '<dl class="memo_result_Box" id="memoListDl_'+list[i].sNb+'" onclick="memoSearchViewObj.memoViewInnerPop(';
						
						if(list[i].mainSnb == 0) str += list[i].sNb;
						else str += list[i].mainSnb;
						
						str += ','+list[i].sNb+',\'inner\')">';
						
						
						if (list[i].memoKind == 'SEND') {
					   
							memoKind = '수신';
							if(list[i].readStts == '00002') iconClass = 'state_icon_check';
							else iconClass = 'state_icon_order';
							

						}else if (list[i].memoKind == 'REV'){
							
							memoKind = ' 발신';
							if(list[i].readStts == '00002')iconClass = 'state_icon_check';
							else iconClass = 'state_icon_send';
							
							sendNm = list[i].revNm;
							fromTo = 'contact_to';
					
				 		}else {
					
							memoKind = ' 메모';
							sendNm = '나';
							iconClass = 'state_icon_memo';   
		 
					    }
				       
				      
						str += '<dt class="titledate">'+(list[i].calDate).replace(/-/gi,'.')+'</dt>';
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
				  		
					  	str += '<span name="memoCommentAreaTxt"> ';
					  	
					  	var txtColor = '#4d87f5;';
						
						if(list[i].memoType == '00030') txtColor = '#ff4d06;';
						if(list[i].memoTypeNm != '') str += '<strong style="color: '+txtColor+'">['+list[i].memoTypeNm+']</strong>';
					  	
					  	
					  	
					  	str += list[i].comment +' </span>';
					  	str += '</a></dd>';
					  	str += '</dl>';
				      
				     
					}
					
					 
			    }
		        
		    	$("#memo_seacrh_Result").append(str);
		    	
		    	if($("#srchTxt").val() != '') memoSearchViewObj.setSearchText();
		    	
		    	
		    	if($("#memoListDl_"+g_currentMemoId).length > 0) $("#memoListDl_"+g_currentMemoId).get(0).scrollIntoView(true);
		    	
		    	
			 };
			 
			 var beforeSubmit = function(){
				 startLoadingBar();
				
			 };
			
			 commonAjax("POST", url, param, callback, false, beforeSubmit);
			 
		 },
		 
		 //탭타입 선택
		 searchTabType : function(tabType){
			
			 startLoadingBar();
			 
			 $(".memSearchTab").removeClass('current');
			 $("#memoTab"+tabType).addClass('current');
			 
			 g_memoSearchTab = tabType;
			 g_memoCurPageNo = 1;			//현재 페이지 초기화
			 
			 setTimeout(function() {
				 memoSearchViewObj.doSearch();
		        }, 10);
			
 
		 },
		 
		 //메모팝업
		 memoViewInnerPop : function(memoMainSnb,memoSnb,openType){
			
			g_currentMemoId = memoSnb;
			
			var url= "/m/schedule/memoViewPop_openLayer.do";
			
			var searchTxt = '';
			var searchType = '';
			
			if($("#srchTxtType").val() == 'CONT' || $("#srchTxtType").val() == '') searchTxt = $("#srchTxt").val();
			
	  		var params ={	
	  				
	  				memoId 	 : memoMainSnb,
	  				memoSnb	 : memoSnb,
	  				openType : openType,
	  				searchKey : searchTxt
	  		};
	  		
	  		commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  		
	  			
	  			$("#memoViewInnerArea").html(result);  
	  			//시간 차를 두고 호출
	  			//$('#memoViewInnerPop').parent().css('height','100%');
		  		$('#memoViewInnerPop').animate({'right':'0'},300);
		  		$('#memoViewInnerPop').removeClass('disPlayNone');
	  			nowUrl = url;
	  			
	  			window.history.pushState({'url' : url}, 'Title', "#"+url);
	  			
	  			$("#scrollChatArea").animate({ scrollTop: $('#scrollChatArea').eq(0).prop("scrollHeight")}, 50);
			
	      	}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback); 
			
		},
		//다음 페이지
		nextPageGo : function(){
			
			startLoadingBar();
			
			g_memoCurPageNo = (g_memoCurPageNo*1)+1;
			
			 setTimeout(function() {
				 memoSearchViewObj.doSearch();
		        
			 }, 10);
			
			//endLoadingBar();
		},
		
		//자동 페이지 세팅
		autoPageRefreshSet : function(){
			
			var nowPageIdx = g_memoCurPageNo;
	 			
 			g_memoCurPageNo =0;
 			
 			for(var i=0; i<nowPageIdx; i++){
 				
 				g_memoCurPageNo++;
 				memoSearchViewObj.doSearch();
 			}
 			
		},
		//검색 글자 표시
		setSearchText : function(){
			
			var searchType = $("#srchTxtType").val();
			var searchTxt = $("#srchTxt").val();
			
			var commentList = $("span[name='memoCommentAreaTxt']");			//내용 배열
			var sendNameList = $("span[name='memoSENDNameAreaTxt']");		//이름 배열 (받은 ~ 로부터 받음)
			var revNameList = $("span[name='memoREVNameAreaTxt']");			//이름 배열 (보낼 ~ 한테 받음)
			
			
			
			if(searchType == 'CONT' || searchType == ''){
				$(commentList).highlight(searchTxt,'highlight_memoSearch'); 
				
			}
			
			if(searchType == 'SEND' || searchType == ''){
				
				$(sendNameList).highlight(searchTxt,'highlight_memoSearch'); 
			}
			
			if(searchType == 'RECV' || searchType == ''){
				$(revNameList).highlight(searchTxt,'highlight_memoSearch'); 
			}
			
			
	  }
		
		
};


$(function(){
	
	
	
	memoSearchViewObj.preloadCode();
	memoSearchViewObj.doSearch(1);


/* 	
	$('input, textarea').blur(function(){  
		
		if(mobileOsCheck() == "IOS") keypadDown();
		
	});
	 */
	//$('html, body').css({'overflow': 'hidden', 'height': '100%' , 'transform':'translate3d(0,0,0)'});

});


</script>