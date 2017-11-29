<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file ="../includeJSP/header.jsp" %> 
<%@ include file ="../includeJSP/commonPopAll.jsp" %> 
<style>
.highlight_dealCommentView {
    background-color: orange;
}

</style>
<body>

<div id="wrap">
	
	<div class="mb_sub_location">
		<button type="button" class="back" onclick='location.href="${pageContext.request.contextPath}/m/main.do"'><em>이전</em></button>
		<a href="${pageContext.request.contextPath}/m/deal/dealMain.do" class="depth03">코멘트 목록 </a>
	</div> 
	
	<div class="containerWrap">
		<section class="contentsWrap">
			
			<!--검색 -->
			<div id="wholePanel" >
				<div class="memo_srch_Period">
				    <label><input type="checkbox" disabled="disabled"><span>기간</span></label>
					<span><input type="date" id="dealCommentSearchStartDate" onchange="dealCommentListObj.doSearch();"/></span>
					<span class="dash">~</span>
					<span><input type="date" id="dealCommentSearchEndDate" onchange="dealCommentListObj.doSearch();"/></span>
				</div>
				<div class="memo_srch_Input">
					<div class="fl_block">
						<select class="select_custom" id="dealCommentSearchType" onchange="dealCommentListObj.doSearch();">
							<option value="">전체</option>
							<option value="cpnNm">회사명</option>
							<option value="memo">내용</option>
							<option value="rgNm">등록자</option>
							<option value="commentFileNm">파일명</option>
						</select>
					</div>
					<div class="fr_block">
			  	  		<input type="text" id="dealCommentSearchTxt" class="" placeholder="전체 검색어를 입력하세요"  title="검색어입력"  onchange="dealCommentListObj.doSearch();"/>
			  	  		<button type="button" class=""><em>검색</em></button>
					</div>
		  	  	</div>
		  	</div>
		  	<!--//검색// --> 
		  	
		  	<!-- 탭 -->
		    <div id="centered" class="scroll_tapMenu" style="overflow: hidden; "></div>  
	    	
	    	<!-- 리스트 -->
	    	<div  class="contentsWrap scrollArea  commentWrap" >
	    	
	    		
	  			<div id="dealCommentDataList" class="comment_listWrap"><div class="no_content">코멘트 목록이 없습니다.</div></div>	
	  		</div>
		    <!-- //리스트// -->
		    
		</section>
	</div><!-- containerWrap -->
	
	<div id="divTabar">
		<%@ include file ="../includeJSP/quickmenu.jsp" %> 
	</div>
	
</div><!-- Wrap -->
</body>
</html>



<script type="text/javascript">

//Global variables :S ---------------

//공통코드

var g_sabun ="${userLoginInfo.sabun}";					//로그인유저사번
var g_loginId ="${userLoginInfo.id}";					//로그인유저아이디

var g_mnaStatusCodeList;								//mna 진행상태
var g_statusCodeList;									//진행상태
var g_mezzLYn = 'N';
var g_mezzNYn = 'N';

var g_workOpenType = 'dealComment';
var g_dealCommentTab ='00000';

//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var dealCommentListObj = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		
		var nowDate = new Date().yyyy_mm_dd();
		var nowYear = nowDate.split('-')[0];
		
		//날짜 세팅
		$("#dealCommentSearchStartDate").val(nowYear+'-01-01');
		$("#dealCommentSearchEndDate").val(nowDate);
		
		//탭세팅
		if('${userLoginInfo.division}' != 'SYNERGY') g_dealCommentTab = '00002';			//시너지가 아닐때 딜제안중
		else if('${userLoginInfo.mezzN}' == 'N') g_dealCommentTab = '00005';				//메자닌 비상장 권한 없을때 프리 IPO
		else g_dealCommentTab = '00001';
		
		
		//상태값 코드
		g_mnaStatusCodeList = getCommonCode('00016', 'KOR', 'code', 'cdNm', null, null, null);
		g_statusCodeList = getCommonCode('00004', 'KOR', 'code', 'cdNm', null, null, null);
		
		//메자닌 권한 세팅
		g_mezzLYn = '${userLoginInfo.mezzL}';		//메자닌 상장 권한
		g_mezzNYn = '${userLoginInfo.mezzN}';		//메자닌 비상장 권한
		
		if('${userLoginInfo.permission}' > '00020' || '${userLoginInfo.id}' == 'gjh'){	//개발자 대표님 무조건 Y
			g_mezzLYn = 'Y';
			g_mezzNYn = 'Y';
		}
	},
	
	//화면세팅
    pageStart: function(){
    	
    
    	
    },//end pageStart.
    
    //탭 리스트 
    getTabList : function(){
    	
    	var url = contextRoot + "/m/deal/getDealTabList.do";
    	var param = { menuCd : '00021'};
    	
		var callback = function(result){
			
			var obj = JSON.parse(result);
			var list = obj.resultList;
			
			var str ='<ul class="clearfix_tapMenu" style="transform: translateZ(0px); width: 840px;"><li id="dealCommentTab_00000" onclick="dealCommentListObj.selectTab(\'00000\');">전체<span class="icon_new">N</span></li>';
		
			for(var i=0; i<list.length; i++){
				
				
				// 메자닌 상장이나 M&A 일때 => 메자닌 비상장 권한이 있는 사람 and 시너지
				if((list[i].dTailCd == '00001' || list[i].dTailCd == '00004') && g_mezzNYn == 'Y' && "${userLoginInfo.division}" == 'SYNERGY' ){
					
					str += '<li id="dealCommentTab_'+list[i].dTailCd+'" onclick="dealCommentListObj.selectTab(\''+list[i].dTailCd+'\');">'+list[i].temp+'<span class="icon_new">N</span></li>' ;
				
				// 프리IPO 벤처 일때 => 메자닌 비상장 권한이 있는 사람 
				}else if((list[i].dTailCd == '00005' || list[i].dTailCd == '00006') || g_mezzNYn == 'Y'){
					
					str += '<li id="dealCommentTab_'+list[i].dTailCd+'" onclick="dealCommentListObj.selectTab(\''+list[i].dTailCd+'\');">'+list[i].temp+'<span class="icon_new">N</span></li>' ;
				}
				

			}
			str += '<li></li>';
			str += '</ul><span class="right_box"></span>';
		   $("#centered").html(str); 
			
    	};
    	commonAjax("POST", url, param, callback, false);
    },
    
 	//검색
    doSearch: function(){ 
    	
    	startLoadingBar();
    	
    	var dealCommentSearchStartDate = $("#dealCommentSearchStartDate").val();
    	var dealCommentSearchEndDate = $("#dealCommentSearchEndDate").val();
    	
    	var nowDate = new Date().yyyy_mm_dd();
		var nowYear = nowDate.split('-')[0];
		
		//기간 설정
    	if(dealCommentSearchStartDate == '' && dealCommentSearchEndDate == ''){
    		
    		swal("기간 선택을 해주세요");
    		return false;
    		
    	}else if(dealCommentSearchStartDate == ''){
			
    		dealCommentSearchStartDate = nowYear+'-01'+'-01';
    		$("#dealCommentSearchStartDate").val(dealCommentSearchStartDate);
    		
    	}else if(dealCommentSearchEndDate == ''){
    		
    		dealCommentSearchEndDate = nowDate;
    		$("#dealCommentSearchEndDate").val(dealCommentSearchEndDate);
    	}
    	
    	
		var url = contextRoot + "/m/deal/getDealCommentList.do";
    	var param = {
    					dealCommentSearchStartDate 		: dealCommentSearchStartDate,
    					dealCommentSearchEndDate 		: dealCommentSearchEndDate,
    					dealCommentSearchType			: $("#dealCommentSearchType").val(),
    					dealCommentSearchTxt			: $("#dealCommentSearchTxt").val(),
    					tab								: g_dealCommentTab,
    					allDealYn						: g_mezzNYn
    				};
    	
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var resultObj = obj.resultObject;
    		var list = resultObj.commentList;
    		var todayList = resultObj.todayCommentList;
			
    		var str = '';
    		
    		//sNb, rgNm(등록자), middleOfferCd, middleOfferNm, offerNm, tmDt(등록일), price, 
    		//investPrice, progressCd, categoryCd, categoryNm(CB,EB등), memo(내용), cpnId, 
    		//cpnNm(회사명), commentFileCnt(파일갯수), commentFileNm
    		if(list.length > 0){
    			
	    		for(var i=0; i<list.length; i++){
	    				
		    			var dealCommentObj = list[i];
		    		
		    			var viewYn = 'Y';
		    			
		    			str += '<dl class="comment_list_Box" onclick="commonPopAllObj.dealDetail('+dealCommentObj.sNb+','+dealCommentObj.commentSnb+',\'\');">';
		    			str += '<dt class="comment_info">';
		    			
		    			
		    			//내가 등록한 딜이 아니면서  상장사 이고	메자닌 (CB, EB, BW, RCPS) 이고	진행중 인 건  제안중이 아니고 메자닌 상장 보기 불가면
		    		 	if((dealCommentObj.rgNm != '${userLoginInfo.name}' 
		    		 			&& (dealCommentObj.aCpnId != null && ((dealCommentObj.aCpnId).indexOf('A') != -1 ||(dealCommentObj.aCpnId).indexOf('Q') != -1 ))
		    					&& (dealCommentObj.categoryCd == '00001' || dealCommentObj.categoryCd == '00002' || dealCommentObj.categoryCd == '00003' || dealCommentObj.categoryCd == '00015')
		    					&& (dealCommentObj.progressCd == '00001' || dealCommentObj.progressCd == '00002')) && g_mezzLYn == 'N'){
		    				
		    				 viewYn = 'N';
		    			}
		    			 
		    			//-----------------회사명 
		    			if(dealCommentObj.cpnNm != null){
		    				
		    				str += '<div class="tit"> ';
		    				
		    				if(viewYn == 'N') str += '***';
		    				else str += dealCommentObj.cpnNm;
		    				
		    				str += '</div>';
		    			}
		    			
		    			str += '<div class="d_state_com"> '+dealCommentObj.categoryNm+'</div>';
		    			if(new Date().yyyy_mm_dd() == dealCommentObj.tmDt) str +='<span class="new">N</span>';
		    			
		    			str += '<div class="fr_block"><span class="writer">'+dealCommentObj.rgNm+'</span>';
		    			str += '<span class="mediation"> '+(dealCommentObj.tmDt).replace(/-/gi,'.')+'</span>';
		    			str += '</div></dt>';
		    			str += '<dd class="comment_maincon"><div class="fl_block">';
		    			str += '<div class="d_rate"><p class="text">';
		    			
		    			
		    			if(viewYn == 'N') str += ' *** ';
		    			else str += dealCommentObj.memo;
		    			
		    			str += '</p>';
		    			
		    			str += '</div></dd>';
		    			str += '</dl>';
		    			
		    		}
	
	    		
	    	}else{
    			
    			str += '<div class="no_content">코멘트 목록이 없습니다.</div>';
        	}
    		
    		$("#dealCommentDataList").html(str);
    		
			
			//---------------탭 new 아이콘 세팅
			
			$("li[class*=new]").removeClass('new');
			
    		
    		for(var i=0; i<todayList.length; i++){
    			var dealCommentObj = todayList[i];
    			
    			//제안중
    			if(dealCommentObj.middleOfferCd == '00004' || dealCommentObj.middleOfferCd == '00005'){
    				$("#dealCommentTab_00002").addClass('new');
    			}
    			else{
    				//메자닌
    				if(dealCommentObj.categoryCd == '00001' || dealCommentObj.categoryCd == '00002' || dealCommentObj.categoryCd == '00003' || dealCommentObj.categoryCd == '00004'){
    					//상장
    					if(dealCommentObj.aCpnId != null && ((dealCommentObj.aCpnId).indexOf('A') || (dealCommentObj.aCpnId).indexOf('Q'))){
    						$("#dealCommentTab_00001").addClass('new');
    						
    					}else{//비상장
    						$("#dealCommentTab_00004").addClass('new');
    					}
    				}else{
    					//유증 블록딜 실권주 워런트
    					if(dealCommentObj.categoryCd == '00004' || dealCommentObj.categoryCd == '00005' || dealCommentObj.categoryCd == '00006' || dealCommentObj.categoryCd == '00007'){
    						$("#dealCommentTab_00003").addClass('new');
    					}else{
    						if(dealCommentObj.categoryCd == '00008') $("#dealCommentTab_00007").addClass('new');		//M&A
    						else if(dealCommentObj.categoryCd == '00012') $("#dealCommentTab_00005").addClass('new');	//프리 IPO
    						else if(dealCommentObj.categoryCd == '00016') $("#dealCommentTab_00006").addClass('new');	//벤처
    						else if(dealCommentObj.categoryCd == '00017') $("#dealCommentTab_00009").addClass('new');	//바이오
    						else if(dealCommentObj.categoryCd == '00013') $("#dealCommentTab_00008").addClass('new');	//shell
    					}
    				}
    				
    			}
    			
    				
    		}
    		
			//전체
    		if(todayList.length>0 && $("li[class*=new]").length > 0)  $("#dealCommentTab_00000").addClass('new');
    		
    		endLoadingBar();
    		
    		var key = $("#dealCommentSearchTxt").val();
    		
    		if(key != '') $('.comment_listWrap').highlight(key,'highlight_dealCommentView'); 
    		
    	};
   
    	commonAjax("POST", url, param, callback, false);
    	
    },//end doSearch
    
    
    
    //------------------- 선택 및 데이터 세팅 함수
    
    //탭선택
    selectTab : function(code){

    	g_dealCommentTab = code;
    	dealCommentListObj.doSearch();
    },
    
}


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	dealCommentListObj.preloadCode();	//공통코드 or 각종선로딩코드
	dealCommentListObj.getTabList();
	dealCommentListObj.doSearch();


	$(".scroll_tapMenu ul li ").click(function(e) {

	  if ($(this).hasClass('tapMenu_slider')) {
	    return;
	  }
	  var whatTab = $(this).index();
	  var howFar = 93 * whatTab;
	  $(".tapMenu_slider").css({
	    left: howFar + "px"
	  });
	
	});
	

	
});
</script>