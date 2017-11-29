<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file ="../includeJSP/header.jsp" %> 
<%@ include file ="../includeJSP/commonPopAll.jsp" %> 

<body>
<!-- 상세검색 팝업 리턴 값 -->
<input type="hidden" id="dealSearchStartDate" value=""/>		<!-- 딜검색 시작기간 -->
<input type="hidden" id="dealSearchEndDate" value=""/>		<!-- 딜검색 종료기간 -->
<input type="hidden" id="dealSearchStatus" value="00001,00002"/>							<!-- 딜 진행상태 -->
<input type="hidden" id="dealMNASearchStatus" value="00001,00002,00003,00004,00005"/>		<!-- 딜(M&A) 진행상태 -->
<input type="hidden" id="dealSearchPerson" value=""/>		<!-- 딜 등록자 -->
<input type="hidden" id="dealAnalStartPrice" value=""/>		<!-- 딜 투자심의 -->
<input type="hidden" id="dealAnalEndPrice" value=""/>		<!-- 딜 투자심의 -->
<!-- <input type="hidden" id="dealInvestStartPrice"/>	딜 투자금액 
<input type="hidden" id="dealInvestEndPrice"/>		딜 투자금액  -->
<!-- //상세검색 팝업 리턴 값// -->


<div id="wrap">
	
	<div class="mb_sub_location">
		<button type="button" class="back" onclick='location.href="${pageContext.request.contextPath}/m/main.do"'><em>이전</em></button>
		<a href="${pageContext.request.contextPath}/m/deal/dealMain.do" class="depth01">Deal</a>
		<span id="regTxtSpan" onclick="dealListObj.openDetailDealSetPop();"  class="btn_filter"></span>
	</div> 
	
	<div class="containerWrap">
		<section class="contentsWrap">
			<!--검색 -->
			<div id="wholePanel" class="memo_srch_Input">
				<div class="tabBoxWrap">
					<div class="fl_block">
						<div id="dealSearchYearArea"></div>
					</div>
		  	  		<div class="fr_block">
			  	  		<input type="text" id="searchCompanyTxt" class="" placeholder="회사명 or 내용을 입력하세요"  title="검색어입력"  onchange="dealListObj.doSearch();"/>
			  	  		<button type="button" class=""><em>검색</em></button>
					</div>
		  	  	</div>
		  	</div>
		  	<!--//검색// --> 
		  	
		  	<!-- 탭 -->
		    <div id="centered" class="scroll_tapMenu" style="overflow: hidden; "></div>  
	    	
			
	    	<!-- 리스트 -->
	    	<div  class="contentsWrap scrollArea dealWrap">
	  			
	  			<div id="dealDataList" class="deal_listWrap">
	  				<div class="no_content">딜 목록이 없습니다.</div>
	  			</div>	
	  		</div>
		    <!-- //리스트// -->
	 
		</section>
	</div><!-- containerWrap -->
	
	<div id="divTabar">
		<%@ include file ="../includeJSP/quickmenu.jsp" %> 
	</div>
	
	<div id="wrapper" onclick="commonPopAllObj.dealProc(0);"></div>
</div><!-- Wrap -->
</body>
</html>



<script type="text/javascript">

//Global variables :S ---------------

//공통코드

var g_sabun ="${userLoginInfo.sabun}";					//로그인유저사번
var g_loginId ="${userLoginInfo.id}";					//로그인유저아이디

var g_workOpenType = 'deal';
var g_selectUserList = new Array();
var g_selectTabValue = '';
var g_mnaStatusCodeList;								//mna 진행상태
var g_statusCodeList;									//진행상태
var g_mezzLYn = 'N';
var g_mezzNYn = 'N';

//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var dealListObj = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		
		//탭세팅
		if('${userLoginInfo.division}' != 'SYNERGY') g_selectTabValue = '00002';			//시너지가 아닐때 딜제안중
		else if('${userLoginInfo.mezzN}' == 'N') g_selectTabValue = '00005';				//메자닌 비상장 권한 없을때 프리 IPO
		else g_selectTabValue = '00001';
		
		//년도 세팅 
		var str = '<select class="select_custom" id="dealChoiceYear" onchange="dealListObj.changeYear();">';
		var nowYear =  new Date().yyyy_mm_dd().substring(0,4);
		
		for(var i=2010; i<=nowYear; i++){
			str +='<option value="'+i+'">'+i+'</option>';
		}
		str += '<select>';
		
		$("#dealSearchYearArea").html(str);
		
		//날짜세팅
		$("#dealChoiceYear").val(nowYear);
		dealListObj.setSearchDate();
		
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
			
			var str ='<ul class="clearfix_tapMenu" style="transform: translateZ(0px);"><li id="dealTab_00000" onclick="dealListObj.selectTab(\'00000\');">전체<span class="icon_new">N</span></li>';
		
			for(var i=0; i<list.length; i++){
				
				
				// 메자닌 상장이나 M&A 일때 => 메자닌 비상장 권한이 있는 사람 and 시너지
				if((list[i].dTailCd == '00001' || list[i].dTailCd == '00004') && g_mezzNYn == 'Y' && "${userLoginInfo.division}" == 'SYNERGY' ){
					
					str += '<li id="dealTab_'+list[i].dTailCd+'" onclick="dealListObj.selectTab(\''+list[i].dTailCd+'\');">'+list[i].temp+'<span class="icon_new">N</span></li>' ;
				
				// 프리IPO 벤처 일때 => 메자닌 비상장 권한이 있는 사람 
				}else if((list[i].dTailCd == '00005' || list[i].dTailCd == '00006') || g_mezzNYn == 'Y'){
					
					str += '<li id="dealTab_'+list[i].dTailCd+'" onclick="dealListObj.selectTab(\''+list[i].dTailCd+'\');">'+list[i].temp+'<span class="icon_new">N</span></li>' ;
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
    	
    	var choiceYear = $("#dealChoiceYear").val();
 
		var url = contextRoot + "/m/deal/getDealList.do";
    	var param = {
    					dealSearchStartDate : $("#dealSearchStartDate").val(),
    					dealSearchEndDate 	: $("#dealSearchEndDate").val(),
    					sorting				: g_selectTabValue,
    					search				: $("#searchCompanyTxt").val(),
    					selectUser			: $("#dealSearchPerson").val(),
    					dealSearchStatus	: $("#dealSearchStatus").val(),
    					dealMNASearchStatus	: $("#dealMNASearchStatus").val(),
    					dealAnalStartPrice	: $("#dealAnalStartPrice").val(),
    					dealAnalEndPrice	: $("#dealAnalEndPrice").val(),
    					allDealYn			: g_mezzNYn
    				};
    	
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var resultObj = obj.resultObject;
    		
    		var list = resultObj.dealList;
    		var todayList = resultObj.todayDeal;
			
    		var str = '';
    		
    		if(list.length > 0){
    			
	    		for(var i=0; i<list.length; i++){
	    			
	    			var dealObj = list[i];
	    		
	    			if(dealObj.rgId != '${userLoginInfo.id}' 
	    					&& ((dealObj.categoryCd != '00008' && dealObj.infoLevel < '${userLoginInfo.infoLevel}')
	    							||(dealObj.categoryCd == '00008' && dealObj.infoLevel < '${userLoginInfo.mnaLevel}'))){
	    				continue;
	    			}
	    			
	    			str += '<dl class="deal_list_Box">';
	    			str += '<dt class="deal_info">';
	    			str += '<div class="date">'+(dealObj.tmDt).replace(/-/gi,'.')
	    			if(new Date().yyyy_mm_dd() == dealObj.tmDt) str +='<span class="new">N</span>';
	    			
	    			str += '</div><div class="fr_block"><span class="writer">'+dealObj.rgNm+'</span>';
	    			
	    			//-----------------중개인
	    			if(dealObj.cstNm != null){
	    				str += '<em></em><span class="mediation"> '+dealObj.cstNm+'</span><em></em>';
	    			}
	    			
	    			//-----------------진행 상태
	    			// 00001, 진행중 /  00002, 보류 / 00003, 투자결정 / 10000, DROP / 10001, 타사투자 / 10002, 발행취소
	    			// 00001, 대기 /  00002, si추천 / 00003, 미팅 / 00004 계약 / 00005 실사 / 00006 성사 / 10000, 폐기 (MNA)
	    			
	    			var statusIng = false;	//진행중인지
	    			var statusNm = '';		//상태값
	    			
	    			var statusObj;
	    		
	    			//MNA 일때
	    			if(dealObj.categoryCd == '00008'){
	    				
	    				statusObj = getRowObjectWithValue(g_mnaStatusCodeList, 'code', dealObj.progressCd);	//상태값 가져오기
	    				
	    				if(dealObj.progressCd != '00006' && dealObj.progressCd != '10000' ){ //MNA 일때 성사 폐기 이외의 것을 진행중으로 봄
	    					statusIng = true;
	    				}
	    				
	    				statusNm = statusObj.cdNm;
	    			}else{	//MNA 아닐떄
	    				
	    				if(dealObj.progressCd == 00001){
	    					statusIng = true;
	    					
	    				}
	    			
	    				statusNm = dealObj.progressNm;
	    			}
	    			
	    			if(dealObj.categoryCd == '00008') str += '<span class="dealMNAStatus_'+dealObj.progressCd+' d_state">'+statusNm+'</span>';
    				else str += '<span class="dealStatus_'+dealObj.progressCd+' d_state">'+statusNm+'</span>';
    				
	    			str += '</dt>';
	    			
	    			//-----------------회사명 금액
	    			str += '<dd class="deal_maincon">';
	    			str += '<div class="fl_block"  onclick="commonPopAllObj.dealDetail('+dealObj.sNb+',0,\'\');">';
	    			//내가 등록한 딜이 아니면서  상장사 이고	메자닌 (CB, EB, BW, RCPS) 이고	진행중 인 건  제안중이 아니고 메자닌 상장 보기 불가면
	    			if((dealObj.rgId != '${userLoginInfo.id}' && (dealObj.cpnStts == 'A' || dealObj.cpnStts == 'Q' )
	    					&& (dealObj.categoryCd == '00001' || dealObj.categoryCd == '00002' || dealObj.categoryCd == '00003' || dealObj.categoryCd == '00015')
	    					&& (dealObj.progressCd == '00001' || dealObj.progressCd == '00002')) && g_mezzLYn == 'N'){
	    				
	    				str += '<div class="d_title"> *** </div>';
	    			}else{
					   var strInsert ='';
					
	    			   if (dealObj.categoryNm == null) strInsert = '';
	    			   else    strInsert ='<span class="d_state_com">'+dealObj.categoryNm+'</span>';
	    			   
	    			   str += '<div class="d_title"><span>'+(dealObj.cpnStts != 'A' && dealObj.cpnStts != 'Q' ? '(비)' : '')+dealObj.cpnNm+'</span>'+strInsert+' </div>';
	    			}
	    			
	    			
	    			str += '<div class="d_rate">';
	    			str += '<span>규모</strong><em>(</em><span class="ntxt divline">발행</span><span class="ntxt">투자</span><em>)</em>';
	    			
	    			var displayClass ="";
	    			
	    			if(dealObj.price =='' && dealObj.investPrice =='' ) displayClass='style="display:none;"';
	    			
	    			str += '<span class="ntxt2 divline" '+displayClass+'>'+(dealObj.price == '' ? '-':dealObj.price)+'</span><span class="ntxt3" '+displayClass+'>'+(dealObj.investPrice == '' ? '-':dealObj.investPrice)+'</span>';
	    			str += '</div></div>';
	    			
	    			//-----------------상태 및 투자심의 점수 명수 분석자
	    			str += '<div class="fr_block">';
	    			str += '<div class="anal_state"';		//openDealOpinion
	    			
	    			var analVal = dealObj.analVal.split("|");
	    			
	    			//투자심의 있을때 클릭
	    			if(analVal.length >0 && analVal[0] != 0 && dealObj.categoryCd != '00008') {
	    				
	    				str += ' onclick="dealListObj.openDealOpinion('+dealObj.sNb+',\''+dealObj.cpnNm+'\',\''+analVal[0]+'\');">';
	    				
	    				//분석자
	    				str += '<div class="analing3">';
	    				
	    				if(dealObj.analUserCount == 0) str += ' 분석요청';
	    				else  str += dealObj.analUserFirst;
	    				
	    				str += '</div>';
	    				
	    				//분석 갯수
    					str += '<div class="anal_sum">'+analVal[0]+'</div><span class="grade">(';
    					
    					
    					//투자심의 점수
    					if(analVal.length >1){
    						var firstPoint = analVal[1]/analVal[0];
    						
        					if(firstPoint>0){
        						if(analVal.length >0) str += firstPoint.toFixed(1);
        						else str += firstPoint.toFixed(1);
        					}else{
        						str += '0.0';
        					}
        					
    					}else{
    						str += '0.0';
    						
    					}
    					
    					str += ')</span>';
    					
					}else{
						
		    			if(dealObj.analUserCount == 0) str += '><div class="request">분석요청</div>';
		    			else str += '><div class="request">'+dealObj.analUserFirst+'</div>';
		    			
					}
	    			
	    			str += '</div></div></dd>';
	    			
	    			
	    			//-----------------투자의견 분석 파일 댓글 수
	    			str += '<dd class="deal_subcon">';
	    			
	    			str += '<div class="fl_block"><em>투자의견 : </em>'+(dealObj.investOpinion!= null ? dealObj.investOpinion :'')+'</div>';							//투자의견
	    			str += '<div class="fr_block">';
	    			str += '<span class="deal_clip"><em>첨부</em></span><span class="countnum">(<strong>'+(dealObj.fileCnt*1+dealObj.commentFileCnt*1)+'</strong>)</span>';		//파일수
	    			str += '<span class="deal_file"><em>분석</em></span><span class="countnum">(<strong>'+dealObj.analysis+'</strong>)</span>';									//분석수
	    			str += '<span class="deal_comment"><em>댓글</em></span><span class="countnum">(<strong>'+dealObj.opinion+'</strong>)</span>';									//댓글수
	    			
	    			str += '</div></dd>';
	    			
	    			str += '</dl>';
	    			
	    		}
	    		
	    	}else{
    			
    			str += '<div class="no_content">딜 목록이 없습니다.</div>';
        	}
    		
    		$("#dealDataList").html(str);
    		
    		
    		//---------------탭 new 아이콘 세팅
    		$("li[class*=new]").removeClass('new');
    		
    		
    		for(var i=0; i<todayList.length; i++){
    			var dealObj = todayList[i];
    			
    			//제안중
    			if(dealObj.middleOfferCd == '00004' || dealObj.middleOfferCd == '00005'){
    				
    				$("#dealTab_00002").addClass('new');
    				
    			}else{
    				//메자닌
    				if(dealObj.categoryCd == '00001' || dealObj.categoryCd == '00002' || dealObj.categoryCd == '00003' || dealObj.categoryCd == '00004'){
    					//상장
    					if(dealObj.cpnId != null && ((dealObj.cpnId).indexOf('A') || (dealObj.cpnId).indexOf('Q'))){
    						$("#dealTab_00001").addClass('new');
    						
    					}else{//비상장
    						$("#dealTab_00004").addClass('new');
    					}
    				}else{
    					//유증 블록딜 실권주 워런트
    					if(dealObj.categoryCd == '00004' || dealObj.categoryCd == '00005' || dealObj.categoryCd == '00006' || dealObj.categoryCd == '00007'){
    						$("#dealTab_00003").addClass('new');
    					}else{
    						if(dealObj.categoryCd == '00008') $("#dealTab_00007").addClass('new');		//M&A
    						else if(dealObj.categoryCd == '00012') $("#dealTab_00005").addClass('new');	//프리 IPO
    						else if(dealObj.categoryCd == '00016') $("#dealTab_00006").addClass('new');	//벤처
    						else if(dealObj.categoryCd == '00017') $("#dealTab_00009").addClass('new');	//바이오
    						else if(dealObj.categoryCd == '00013') $("#dealTab_00008").addClass('new');	//shell
    						
    					}
    				}
    				
    			}
    			
    		}
    		
    		//전체
    		if(todayList.length>0 && $("li[class*=new]").length > 0) $("#dealTab_00000").addClass('new');
    		
    		endLoadingBar();
    		
    	};
   
    	commonAjax("POST", url, param, callback, false);
    	
    },//end doSearch
    
    //---------------팝업
    
    //딜 상세검색 팝업
    openDetailDealSetPop : function(){
    	
		var url =  "/m/deal/openDetailDealSetPop.do";
    	var param = {};
    	
    	var callback = function(result){
    		
    		modal({
	            type: 'customer',
	            title: '딜 검색 상세옵션',
	            text: result,
	        })
	        
    	};
    		
    	commonAjaxTohtml( contextRoot+url, param, callback);
    	
    },
    
    //투자심의 팝업
    openDealOpinion : function(sNb,cpnNm,personCnt){
    	
		var url =  "/m/deal/openDealOpinion.do";
    	var param = {
    			
    			searchDealOpinionSnb : sNb,
    			cpnNm				 : cpnNm,
    			personCnt			 : personCnt
    	};
    	
    	var callback = function(result){
    		
    		modal({
	            type: 'customer',
	            title: '투자심의',
	            text: result,
	        })
	        
    	};
    		
    	commonAjaxTohtml( contextRoot+url, param, callback);
    	
    },
    
    //------------------- 선택 및 데이터 세팅 함수
    
    //탭선택
    selectTab : function(code){

    	g_selectTabValue = code;
    	dealListObj.doSearch();
    },
    
    //년도 변경
    changeYear : function(){
    	dealListObj.setSearchDate();
    	dealListObj.doSearch();
    },
    
   	//날짜세팅 
    setSearchDate : function(){
    	
    	var year = $("#dealChoiceYear").val();
    	$("#dealSearchStartDate").val(year+'-01-01');
    	$("#dealSearchEndDate").val(year+'-12-31');
    }
   
    
 
}


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	dealListObj.preloadCode();	//공통코드 or 각종선로딩코드
	dealListObj.getTabList();
	dealListObj.doSearch();
   

	/* $(".scroll_tapMenu ul li ").click(function(e) {

	  if ($(this).hasClass('tapMenu_slider')) {
	    return;
	  }
	  var whatTab = $(this).index();
	  var howFar = 93 * whatTab;
	  $(".tapMenu_slider").css({
	    left: howFar + "px"
	  });

	}); */
	
	var options = { rotate: false };  
    $('#wrapper').jqueryFab([{}], options);
	
   

});
</script>