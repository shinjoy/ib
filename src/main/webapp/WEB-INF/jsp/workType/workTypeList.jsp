<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메모함</title>

<link href="<c:url value='/css/new_style.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/favicon.ico' />" rel="shortcut icon" type="image/x-icon">

<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">

<!-- ============== style css :S ============== -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">				<!-- jquery-ui -->
<!-- ============== style css :E ============== -->

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<%--<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script> --%>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js?ver=0.1"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>

<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/part/memo.js?ver=2.0" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/process.js?ver=1.0" ></script>


<%--<script type="text/JavaScript" src="<c:url value='/js/splitter.js'/>"></script> --%>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->

<!-- 파일업로드 -->
<script type="text/JavaScript" src="<c:url value='/js/multiFileUpload.js'/>" ></script>


<style>
.gtabZone {
    border-left: #bababa solid 0px;
}

.state_icon_clear{
	/* background:url(../images/work/icon_check.gif) no-repeat 0 0; */ 
	padding-left:16px; font-size:12px; font-family:"돋움"; color:#252525;
}

.btn_push_order a.on {
    background: url(../images/work/bg_btn_push_all_on.gif) repeat-x;
    line-height: 14px;
    height: 14px;
    padding: 4px 0px 4px;
    font-size: 11px;
    vertical-align: middle;
    font-weight: normal;
    /*border-left: #b3b3b3 solid 1px;*/
    display: inline-block;
    text-align:center;
    width:89px;
}
.btn_push_order a {
    background: url(../images/work/bg_btn_push_all_off.gif) repeat-x;
    line-height: 14px;
    height: 14px;
    padding: 4px 0px 4px;
    font-size: 11px;
    vertical-align: middle;
    font-weight: normal;
    /*border-left: #b3b3b3 solid 1px;*/
    display: inline-block;
    text-align:center;
    width:89px;
}
.btn_push_order {
	padding-left: 10px;
}


.num_msg {	
	background: #6287bd;
    color: #FFF;
    border: 1px solid #5e83ba;
    border-radius: 8px;
    height: 6px;
    line-height: 1;
    padding: 0px 2px 0px 3px;
    font-family: Tahoma, Geneva, sans-serif;
    font-size: 8px;
    vertical-align: middle;
    text-align: center;
    font-weight: normal;
    letter-spacing: -0.05px;    
}
.num_msg_wrap{
	float:right;
}
</style>



<style type="text/css" >
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.1); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
    z-index: 1000000;
}
.wrap-loading div{ /*로딩 이미지*/
    position: fixed;
    top:50%;
    left:50%;
    margin-left: -21px;
    margin-top: -21px;
    z-index: 1000000;
}
.display-none{ /*감추기*/
    display:none;
}

.memo_list_tb thead th {
    font-weight: bold;
    color: #3b4354;
    line-height: 15px;
    padding: 3px 0px 3px;
    text-align: center;
    border-bottom: #b9c1ce solid 1px;
    border-left: #b9c1ce solid 1px;
    background: #d8dce3;
}

.chat_flow {
    overflow-y: scroll;
    max-height: 430px;
    height: 430px;
    padding: 15px;
    border-right: #c7cdd8 solid 1px;
    background: #f5f6f8;
    border-left: #c7cdd8 solid 1px;
}
#LeftPane {
	border-left:0px;
	border-top:1px solid #cccccc;
	width:52%;
}
#RightPane {
    min-height: 620px;
    width: auto;
    min-width: 200px;
    overflow: hidden;
    background: url(../images/work/bg_right_block.gif) repeat-y right 0 #fff;
    padding-left:7px;
}
#MySplitter {
    min-height: 620px;
    border-bottom: #b9c1ce solid 0px;
}
.communi_inputBox {
    border-right: #c7cdd8 solid 1px;
    border-left: #c7cdd8 solid 1px;
    border-bottom: #c7cdd8 solid 1px;
}

.txtArea_b {
    border-left: #9fa8b3 solid 1px;
    border-right: #9fa8b3 solid 1px;
    border-top: #9fa8b3 solid 1px;
    border-bottom: #9fa8b3 solid 1px;
    
    height: 40px;
    width: 800px;
    padding: 5px 70px 5px 5px;
    box-sizing: border-box;
    color:black;
}

.p_blueblack_btn {
    background: #59647a;
    border: #4f5a6f solid 1px;
    border-radius: 2px;
    color: #ffffff!important;
    padding: 24px 20px 25px;
    min-width: 56px;
    margin-left: 5px;
}
.p_withelin_btn {
    background: #fff;
    border: #bdc3d1 solid 1px;
    color: #232c3f!important;
    border-radius: 2px;
    padding: 24px 20px 25px;
    min-width: 56px;
}

.memo_searchBox2 {    
    border: #b8bfcc solid 1px;
    box-shadow: 0px 1px 0px #eceef1;
    padding: 12px 15px 12px 15px;
    vertical-align: middle;
}

.btn_push_order2 a {
    /* background: url(../images/work/bg_btn_push_all_off.gif) repeat-x; */
    border: #b8bfcc solid 1px;
    border-radius: 5px;
    line-height: 14px;
    height: 14px;
    padding: 4px 4px 3px;
    margin-top: 5px;
    margin-right: 5px;
    font-size: 12px;
    vertical-align: middle;
    font-weight: normal;
    /* border-left: #b3b3b3 solid 1px; */
    display: inline-block;
    text-align: center;
    min-width: 89px;
}


.communi_inputBox .file_list {
    vertical-align: middle;
    padding: 7px 15px 8px;
    border-top: #9ea6b5 solid 1px;
    border-bottom: #c7cdd8 dashed 1px;
    text-overflow: ellipsis;
    -o-text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    word-wrap: normal !important;
    display: block;
}


.btn_modify_con {
    background: url(../images/work/btn_modify.gif) no-repeat center center;
    width: 16px;
    height: 14px;
    line-height: 14px;
    vertical-align: middle;
    overflow: hidden;
    margin-left:20px;
    cursor:pointer;
}

.btn_select_employee {
    background: url(../images/common/board/btn_board_collection.gif) no-repeat;
    width: 72px;
    height: 23px;
    display: inline-block;
    vertical-align: middle;
    background-position: 0px -28px;
    margin-right: 5px;
    margin-left: 10px;
}

.btn_delete_employee {
    background: url(../images/common/board/btn_board_collection.gif) no-repeat;
    width: 13px;
    height: 13px;
    line-height: 13px;
    display: inline-block;
    vertical-align: middle;
    background-position: 5px 5px;
    padding: 5px 4px;
    cursor:pointer;
}

.btn_delete_con {
    background: url(../images/work/btn_delete.gif) no-repeat center center;
    width: 16px;
    height: 14px;
    line-height: 14px;
    vertical-align: middle;
    overflow: hidden;
    margin-left: 3px;
    cursor:pointer;
}


.work_staff{
	cursor:pointer;
}
.work_staff:hover{
	font-weight:bold;
}

.popUpMenu .closePopUpMenu{
    font-weight: bold;
	padding:0 !important;
}
.popUpMenu #closeTab{
	margin: 0;
	text-align: right;
	
	background-color: #323232;
    border-bottom: 1px solid hsl(0, 0%, 95%);
    color: hsl(0, 0%, 100%);
	border-radius: 4px 4px 0 0;
    font-weight: bold;
    padding: 7px 12px 7px 15px;
    position: relative;
}

.popUpMenu {
/* 
	background-color: #ECEADF;
	border-style:solid;
	border-width:2px;
	border-color: white #a4a4a4 #a4a4a4 white;
	padding: 2px;
 */	
	display: none;
	position: absolute;
	z-index: 9999;
	
    background-color: #ECEADF;
    border: 1px solid hsl(0, 0%, 79%);
    border-radius: 4px;
    box-shadow: 0 2px 6px hsla(0, 0%, 0%, 0.25);
    color: hsl(0, 0%, 20%);
	/* font-size: 0.95em; */
}

.popUpMenu .closePopUpMenu{
	margin: 0;
	text-align: right;
	
	background-color: #323232;
    border-bottom: 1px solid hsl(0, 0%, 95%);
    color: hsl(0, 0%, 100%);
	border-radius: 4px 4px 0 0;
    font-weight: bold;
    padding: 7px 12px 7px 15px;
    position: relative;
}

.popUpMenu .closePopUpMenu:hover{
	margin: 0;
	text-align: left;
	cursor: pointer;
	
	background-color: #666666;
}

.popUpMenu select, .popUpMenu input, .popUpMenu textarea {
	border: 1px solid gray;
	border-radius: 2px;
}
.popUpMenu input, .popUpMenu textarea {
	/* font-size: 0.95em; */
	padding: 2px 1px 2px 2px;
}

.icon_count_em {
    background: url(../images/work/icon_count_em.gif) no-repeat 2px center;
    padding: 0px 2px 0px 9px;
    border: #c0c5c9 solid 1px;
    border-radius: 2px;
    height: 11px;
    margin-left: 5px;
    font-size: 10px;
    font-family: Tahoma, Geneva, sans-serif;
    line-height: 11px;
    color: #a6adb3;
    vertical-align: middle;
    overflow: hidden;
    display: inline-block;
}
.division_area{
	margin:0px;
	padding:6px;
	border-top:1px solid #bfc9de;
	background: url(../images_m/work/bg_workbtn2.gif) repeat-x 0 0 #dcdcdc;
}
#divisionDivPop div dl dd label {
    display: inline-block;
    padding-left: 5px;
    color: #838383;
}
.user_dl{
	margin:0px;
}
.user_dt{
	padding:3px;
	border-bottom:1px dotted #859bca;
	border-top:1px dotted #859bca;
	background:#d6d5d2;
}
.user_dd{
	padding:3px;
}
#divisionDiv{
	border-bottom:1px solid #bfc9de;
}
#divisionDiv div dl dd label {
    display: inline-block;
    margin-left: 4px;
   	color: #838383;
}
.user_p{
	border-bottom:1px dotted #8a8daf;
}

.btn_tab{
	text-align: left;
	border-bottom:1px solid #838588;
}
button {
  color: #FFF;
  background-color: #838588;
  border:0px;
  border-top-left-radius:3px;
  border-top-right-radius:3px;
}
.click_tab{
	background-color: #403333;
}
.click_tab_pop{
	background-color: #403333;
}

.no_read{
	border-bottom:#F69999 dashed 1px;
}

.first_contact_from {
    background: url(../images/work/icon_recive2.gif) no-repeat left center;
    /* position: absolute; */
    left: 3px;
    top: 3px\0/IE8+9;
    padding-left: 15px;
    font-size: 11px;
    font-weight: bold;
    font-family: "돋움";
    color: #252525;
    display: inline-block;
    height: 12px;

}

.first_contact_to {
    background: url(../images/work/icon_send2.gif) no-repeat left center;
    /* position: absolute; */
    left: 3px;
    top: 3px\0/IE8+9;
    padding-left: 15px;
    font-size: 11px;
    font-weight: bold;
    font-family: "돋움";
    color: #252525;
    display: inline-block;
    height: 12px;

}
.fold_down {
    background: url(../images/system/sys_tb_open.png) no-repeat;
    width: 60px;
    height: 21px;
}
.fold_up {
    background: url(../images/system/sys_tb_close.png) no-repeat;
    width: 83px;
    height: 21px;
}
.popUpMenu .closePopUpMenu{
    font-weight: bold;
	padding:0 !important;
}
.popUpMenu #closeTab{
	margin: 0;
	text-align: right;
	
	background-color: #323232;
    border-bottom: 1px solid hsl(0, 0%, 95%);
    color: hsl(0, 0%, 100%);
	border-radius: 4px 4px 0 0;
    font-weight: bold;
    padding: 7px 12px 7px 15px;
    position: relative;
}
.popUpMenu input, .popUpMenu textarea {    
    padding: 2px 1px 2px 2px;
}

.search_btn{
	padding: 3px 20px 5px;
}

.text-highlight{
	color:#FF5555;
}

</style>
 
 
<%-- 수정 권한자와 읽기 권한자 구분 (업무요청 메뉴 수정권한 : 경영지원팀, 개발자) --%>
<c:set var="writer" value="N" />
<c:if test="${userLoginInfo.deptId eq '3' or userLoginInfo.permission > '00020'}">
<c:set var="writer" value="Y" />
</c:if>


 
 
<div class="wrap-loading display-none">
    <div><img src="<c:url value='/images/ajax_loading.gif'/>" /></div>
</div>


</head>

<body>
<div id="offerDiv"><div id="offerPr" style="display: none;"></div></div>
<input type="hidden" id="am_Name" value="${name}">
<input type="hidden" id="am_SMSTitle">
<input type="hidden" id="staffNmForSms">

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<input type="hidden" id="loginName" value="${userLoginInfo.name}">
<input type="hidden" id="choice_year" name="choice_year">
<input type="hidden" id="choice_month" name="choice_month">
<input type="hidden" id="choice_day" name="choice_day">

<div id="wrap"> 
	<div class="container">
	
        <div id="containerWrap">
        	
        	<!-- 업무등록 -->
            <div id="workTypeRegist" class="memo_searchBox" style="<c:if test="${writer ne 'Y'}">display:none;</c:if> margin-bottom:7px;">            	
            	<input type="hidden" id="inputWorkTypeId" value=""/>
            	<table>
            	<tr>
            		<td><input id="workTypeNm" tabindex=1 style="margin-left:0px;margin-bottom:3px;width:90%;" class="applyinput_B mgl6 f12" placeholder="업무종류를 입력하세요" /></td>
            		<td><input id="companyNm" tabindex=2 style="margin-left:0px;margin-bottom:3px;width:100%;" class="applyinput_B mgl6 f12" placeholder="법인을 입력하세요" /></td>
            		<td><a href="javascript:fnObj.userPop();" class="btn_select_employee" id="IDNAME05">&nbsp;</a></td>
            		<td rowspan=2>
		                <a href="javascript:fnObj.doSave();" class="p_blueblack_btn">등록</a>
		                <a href="javascript:fnObj.doRegCancel();" class="p_withelin_btn cancel_btn" style="display:none;">취소</a>		        
            		</td>
            	</tr>
            	<tr>
            		<td colspan=2><textarea id="memo" tabindex=3 class="txtArea_b" placeholder="업무내용을 입력하세요"></textarea></td>
            		<td><span id="userSelectArea" style="margin-left:10px;"></span></td>
            	</tr>
            	</table>
            	
            </div>
        
        	<!-- 업무검색 -->
            <div id="workTypeSearch" class="memo_searchBox">            	
            	<span class="div_line">
            	* 검색
            	<input id="searchText" class="applyinput_B mgl6 f12" onkeyup="fnObj.doEnterSrchInput(event);" style="width:30%;" placeholder="검색어를 입력하세요" />
                <a href="javascript:fnObj.doSearch();" class="p_blueblack_btn search_btn">검색</a>
                <a href="javascript:fnObj.doInitSrch();" class="p_withelin_btn search_btn">취소</a>
				<span style="margin-left:30px;">예)투자자문&nbsp; 인감증명서 (한칸 띄운다)</span>
                </span>
            </div>
        
        	<!-- 업무종류명 가로 -->
        	<div style="margin-top:5px;margin-left:10px;color:gray;">* 정렬 : ㄱ→ㅎ <font color="silver">(검색어 검색시에는 유력 결과 정렬)</font></div> 
        	<div id="workTypeNmList" class="memo_searchBox2">        		
            </div>
            
            <!-- 업무리스트 -->
            <div>
            	<span id="workTypeList"></span>
				<%-- <span id="workTypeNmListLeft" style="float:left;display:inline-block;width:15%;"></span>
	        	<span id="workTypeList" style="float:right;display:inline-block;width:85%;"></span> --%>
            </div>
    	</div>
        
    </div>

</div>
</body>
</html>







<script type="text/javascript">

//Global variables :S ---------------

//공통코드

var myModal = new AXModal();		// instance

var userList = [];				//선택한 유저리스트
var userListStr = '';			//선택한 유저리스트String

var g_list = [];				//업무유형 리스트
	

var g_staffNm = '${userLoginInfo.name}';		//사원명
var g_mainSnb = '';								//ib_comment.main_snb		(메모 건의 대표 row 데이터 ... 0 이면 내가최초등록자)   
var g_sNb = '';									//ib_comment.s_nb			(메모 건의 대표 row 데이터 ... ib_comment 의 시퀀스)


//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		/* 
		//기간
		var periodObj = [{CD:'', NM:'기간'}, {CD:'7', NM:'1주일'}, {CD:'30', NM:'1개월'}, {CD:'90', NM:'3개월'}, {CD:'180', NM:'6개월'}];
		var colorObj = {};	//{'IT':'#F15F5F', 'ADMIN':'#F2CB61', 'WORK':'#BCE55C', 'USER':'#B2CCFF'};
		var periodSelectTag = createSelectTag('selPeriod', periodObj, 'CD', 'NM', '90', 'fnObj.chngPeriod();', colorObj, 60, 'sel_basic w_st06');	//select tag creator 함수 호출 (common.js)
		$("#periodSelectTag").html(periodSelectTag);
		
		//검색어 타입
		var srchTxtTypeObj = [{CD:'', NM:'전체'}, {CD:'CONT', NM:'내용'}, {CD:'SEND', NM:'보낸사람'}, {CD:'RECV', NM:'받는사람'}, {CD:'FILE', NM:'첨부파일'}];
		var colorObj = {};	//{'IT':'#F15F5F', 'ADMIN':'#F2CB61', 'WORK':'#BCE55C', 'USER':'#B2CCFF'};
		var srchTxtTypeSelectTag = createSelectTag('selSrchTxtType', srchTxtTypeObj, 'CD', 'NM', '', null, colorObj, 80, 'sel_basic w_st06');	//select tag creator 함수 호출 (common.js)
		$("#srchTxtTypeSelectTag").html(srchTxtTypeSelectTag);
		*/
		var dateStrArr = (new Date().yyyy_mm_dd()).split('-');
		$('#choice_year').val(dateStrArr[0]);
		$('#choice_month').val(dateStrArr[1]);
		$('#choice_day').val(1 * dateStrArr[2]);
		 
	},
	
	
	//화면세팅
    pageStart: function(){
    	
    	 
    },//end pageStart.
  	//################# init function :E #################
    
    
    //################# else function :S #################
    
  	//검색
    doSearch: function(){ 
    	
    	var url = contextRoot + "/workType/getWorkTypeList.do";
    	var param = {
		    			searchText: $('#searchText').val()
		    		};
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		  
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON

    		g_list = list;					//전역변수에 담아둔다.
    		
    		//업무종류명 리스트 세팅
    		fnObj.doSearchWorkTypeNmList(list);
    		
    		//업무종류 리스트 세팅
    		fnObj.doSearchWorkTypeList(list);
    		
			
    		//검색어 하이라이트
    		fnObj.doHighLightSrchTxt();
    		
    		
    		
			//전체 건수 세팅
			//$('#total_count').html(obj.totalCount);
    		
    	};
    	
    	
    	//로딩 이미지 보여주기 위한 리스너 함수 :S -----------
    	var beforeFn = function(){
    		// 로딩 이미지 보여주기 처리
    		$('.wrap-loading', document).removeClass('display-none');
    	};
    	var completeFn = function(){
    		// 로딩 이미지 감추기 처리
	        $('.wrap-loading', document).addClass('display-none');
    	};
    	//로딩 이미지 보여주기 위한 리스너 함수 :E -----------
    	
    	
    	commonAjax("POST", url, param, callback, true, beforeFn, completeFn);
    	
    	
    },//end doSearch
    
    
  	//업무종류명 리스트 세팅
	doSearchWorkTypeNmList: function(list){		
		var str = "";
		//var strLeft = "";
		
		for(var i=0; i<list.length; i++){  			
  			str += '<span class="btn_push_order2">';
  			str += '<a href="#workTypeNmGo' + list[i].workTypeId + '" class="highLightText" onclick="fnObj.srchWorkTypeNm(' + list[i].workTypeId + ');">' + list[i].workTypeNm + '</a>';
  			str += '</span>';
  			
  			//strLeft += '<p class="btn_push_order2">';
  			//strLeft += '<a href="javascript:fnObj.goWorkType(' + list[i].workTypeId + ');">' + list[i].workTypeNm + '</a>';
  			//strLeft += '</p>';
    	}
		
  		$("#workTypeNmList").html(str);				//업무종류명 리스트
  		  		
  		//$("#workTypeNmListLeft").html(strLeft);		//업무종류명 리스트(왼쪽)
	},
	
	
	//업무종류 리스트 세팅
	doSearchWorkTypeList: function(list){
		var str = "";
		
		for(var i=0; i<list.length; i++){  			
  			str += '<div class="gtabZone2" style="border-top:#c7cdd8 dashed 1px; margin-top:20px;">';  			
  			str += '<ul>';
  			str += '<li id="liTypeALL" class="on">';
  			str += '<a name="workTypeNmGo' + list[i].workTypeId + '" class="highLightText" href="#">' + list[i].workTypeNm + '</a>';
  			str += '</li>';
  			str += '<li style="padding-left:15px;max-width:700px;background:none;"><a style="background:none;color:#aaa;" class="highLightText">' + list[i].companyNm + '</a>';
  			str += '</li>';
  			if(list[i].matchCnt > 0){
	  			str += '<li style="padding-left:100px;background:none;"><a style="background:none;color:pink;">매칭수: ' + list[i].matchCnt + '</a>';
	  			str += '</li>';
  			}
  			str += '</ul>';
  			str += '</div>';
  			
  			str += '<p id="editWorkTypeMv' + list[i].workTypeId + '" class="search_result">';
  			str += '<span class="highLightText">' + list[i].memo.replace(new RegExp('\r?\n','g'), '<br/>') + '</span>';
  			  			
  			str += '<font color="' + (isEmpty(list[i].userNmList)?'red':'blue') + '" style="margin-left:60px;">[';
  			
  			var userNmListArr = (isEmpty(list[i].userNmList)?[]:list[i].userNmList.split(','));		//직원명 배열
  			if(userNmListArr.length == 0){
  				str += '미지정';
  			}else{
  				for(var m=0; m<userNmListArr.length; m++){
  					if(m>0) str += ', ';
  					str += '<span class="work_staff" onclick="fnObj.memoDivAjax(this, event, \'' + userNmListArr[m] + '\');" >';
  					str += userNmListArr[m];
  					str += '</span>';  					
  				}
  			}
  			
  			//str += (isEmpty(list[i].userNmList)?'미지정':list[i].userNmList);
  			
  			str += ']</font>';
  			
  			<c:if test="${writer eq 'Y'}">
  			str += '<a href="javascript:fnObj.editWorkType(' + i + ',' + list[i].workTypeId + ');" class="btn_modify_con" title="수정">&nbsp;&nbsp;&nbsp;</a>';
  			str += '<a href="javascript:fnObj.deleteWorkType(' + list[i].workTypeId + ');" class="btn_delete_con" title="삭제">&nbsp;&nbsp;&nbsp;</a>';
  			</c:if>
  			
  			str += '</p>';
  			
    	}
		
  		$("#workTypeList").html(str);			//업무종류 리스트		
	},
    
    
  	//등록
    doSave: function(){
    	//편집중이라면 편집중인 업무유형id ('':신규 or 편집)
    	var inputWorkTypeId = $('#inputWorkTypeId').val();
    	
    	
    	//업무종류
    	var workTypeNmObj = $('#workTypeNm');
    	if(isEmpty(workTypeNmObj.val().trim())){	//업무종류 미입력
    		alert('업무종류를 입력하시기 바랍니다!');
    		workTypeNmObj.focus();
			return;
    	}
    	
    	//법인종류
    	var companyNmObj = $('#companyNm');
    	if(isEmpty(companyNmObj.val().trim())){		//법인종류 미입력
    		alert('법인을 입력하시기 바랍니다!');
    		companyNmObj.focus();
			return;
    	}
    	
    	
    	//업무내용
    	var memoObj = $('#memo');
    	if(isEmpty(memoObj.val().trim())){	//업무종류 미입력
    		alert('업무내용을 입력하시기 바랍니다!');
    		memoObj.focus();
			return;
    	}
    	
    	
    	//유저리스트
    	userList = [];	//초기화
	    $('input[name="selectUserId"]').each(function(){
	    	userList.push($(this).val());
		});
	    userListStr = '';
	    if(userList.length>0 ){
	    	userListStr = userList.join(',');
	    }

    	
    	if(confirm("등록 하시겠습니까?")){
    		
			var url = contextRoot + "/workType/doSaveWorkType.do";
	    	var param = {
		    		mode		: isEmpty(inputWorkTypeId)?'new':'update',		//신규 or 수정
		    		workTypeId	: inputWorkTypeId,
	    			workTypeNm	: workTypeNmObj.val().trim(),	//업무종류
	    			companyNm	: companyNmObj.val().trim(),	//법인종류
	    			memo		: memoObj.val().trim(),			//업무내용
	    			userListStr : userListStr					//선택 유저 리스트 (userId 리스트 ','구분자'  ex) 34,56,22 )
	    	};
	    	
	    	//alert(JSON.stringify(param));
	    	//return;
	    	
	    	var callback = function(result){
	    		
	    		var obj = JSON.parse(result);
        		
        		var rsltObj = obj.resultObject;	//결과
        		
        		if(obj.result == "SUCCESS"){
					
        			if(isEmpty(inputWorkTypeId)){		//신규 등록 일때
        				toast.push("등록 되었습니다!");
            			fnObj.doSearch();
            			
            			//초기화
            			workTypeNmObj.val('');
            			companyNmObj.val('');
            			memoObj.val('');
            			//$("#userSelectArea").html('');
            			fnObj.setDefaultWorkTypeStaffAlone();
            			
        			}else{								//수정 일때        			
        				fnObj.doRegCancel();	//편집모드취소 함수로 초기화
        				fnObj.doSearch();		//검색
        				
        				toast.push("수정 되었습니다!");
        			}
        			
        		}else{
        			//alertMsg();
        		}
        		
        	};
	    	
	    	commonAjax("POST", url, param, callback);
		}//if
    	    	 
    },//end doSave
    
    
	/*=======================================================사원선택 관련 func : S ============================================== */
 	
    //유저선택 공통 팝업
    userPop : function(){
    	
    	var userStr ='';
    	var arr = [];
    	var selectUserList = $("input[name=selectUserId]");
    	
    	for(var i=0;i<selectUserList.length;i++){
    		arr.push(selectUserList[i].value);
  		}
    	
    	if(arr.length == 0) arr.push('${userLoginInfo.staffSnb}');
    		
    	userStr = arr.join(',');
    	
    	var paramList = [];
        var paramObj ={ name : 'userList'   ,value : userStr};
        paramList.push(paramObj);
        paramObj ={ name : 'isOneOrg' ,value : 'Y'};
        paramList.push(paramObj);
        paramObj ={ name : 'isAllOrgSelect' ,value : 'N'};
        paramList.push(paramObj);
    
        userSelectPopCall(paramList);		//공통 선택 팝업 호출 
    	
 	},
 	
 	
 	//직원 선택 
  	getResult : function(resultList){
  		
  		var str ='';
  		var seqArr =[];
  		var selectList = [];
  	
		var brCnt = 1;
  		
  		for(var i=0;i<resultList.length;i++){
  			
  			str +='<span class="employee_list" id="userOneArea_'+resultList[i].userId+'" ><span>'+resultList[i].userName+'</span><em>(';
  			str +=resultList[i].position+')</em><a onclick="javascript:fnObj.deleteUser('+resultList[i].userId+');" class="btn_delete_employee">&nbsp;</a>';
  			str +='<input type="hidden" name="selectUserId" value="'+resultList[i].userId+'"/>';
  			str +='<input type="hidden" name="selectUserSabun" value="'+resultList[i].sabun+'"/>';
  			if(i<resultList.length-1){
    				str+=',';
    		}
  			str+='</span>';
  			brCnt++;
  			
    	}
  		$("#userSelectArea").html(str);					//업무담당자
  		
  	},
  	
  	
 	//삭제버튼 클릭
 	deleteUser : function(userId){
 		$("#userOneArea_"+userId).remove();
 	},
 
	/* =====================================================사원선택 관련 func : E ============================================== */	
    
    
	//업무명 클릭 검색
    srchWorkTypeNm: function(workTypeId){
    	$('a[name^=workTypeNmGo]').css('color', '#202020');						//전체초기화
    	$('a[name=workTypeNmGo' + workTypeId + ']').css('color', '#FF0000');	//해당 하이라이트    	
    },
    
    
    //업무유형 편집모드
    editWorkType: function(idx, workTypeId){
    	//편집중인 업무유형 id 세팅
    	$('#inputWorkTypeId').val(workTypeId);
    	
    	//수정등록기 이동
    	$('#workTypeRegist').insertAfter($('#editWorkTypeMv'+workTypeId));
    	
    	
    	//업무종류
    	$('#workTypeNm').val(g_list[idx].workTypeNm);
    	
    	//법인종류
    	$('#companyNm').val(g_list[idx].companyNm);
    	
    	//업무내용
    	$('#memo').val(g_list[idx].memo);
    	
    	if(!isEmpty(g_list[idx].userList)){
	    	var userList = g_list[idx].userList.split(',');		//ex)'홍길동|32,홍당무|56'
	    	var str = '';
	    	var userId = '';
	    	var userNm = '';
	    	for(var i=0; i<userList.length; i++){
	    		userId = userList[i].split('|')[1];
	    		userNm = userList[i].split('|')[0];
	    		str += '<span class="employee_list" id="userOneArea_'+userId+'"><span>'+userNm+'</span>';
				str += '<a onclick="javascript:fnObj.deleteUser('+userId+');" class="btn_delete_employee">&nbsp;</a>';
				str += '<input type="hidden" name="selectUserId" value="'+userId+'"/>';
				if(i<userList.length-1) str+=',';		
				str += '</span>';
	    	}
	    	$("#userSelectArea").html(str);					//업무담당자
    	}
    	
    	//취소버튼 활성화
    	$('.cancel_btn').show();
    	
    },
    
    
    //편집모드 취소
    doRegCancel: function(){
    	//수정등록기 원위치
    	$('#workTypeRegist').prependTo('#containerWrap');
    
    	//편집중인 업무유형 id 초기화
    	$('#inputWorkTypeId').val('');
    	
    	//초기화
		$('#workTypeNm').val('');
		$('#companyNm').val('');
		$('#memo').val('');
		//$("#userSelectArea").html('');
		fnObj.setDefaultWorkTypeStaffAlone();
		
		//취소버튼 비활성화
    	$('.cancel_btn').hide();
    },
    
    
    //등록기 기본담당자를 나(사용자)로 세팅
    setDefaultWorkTypeStaffAlone: function(){
    	var userId = '${userLoginInfo.staffSnb}';
    	var userNm = '${userLoginInfo.name}';
    		
    	var str = '';
	    str += '<span class="employee_list" id="userOneArea_'+userId+'" ><span>'+userNm+'</span>';
		str += '<a onclick="javascript:fnObj.deleteUser('+userId+');" class="btn_delete_employee">&nbsp;</a>';
		str += '<input type="hidden" name="selectUserId" value="'+userId+'"/>';				
		str += '</span>';
		
		$("#userSelectArea").html(str);
    },
    
    
    //업무유형 삭제
    deleteWorkType: function(workTypeId){
		if(confirm("[주의!!] 삭제 하시겠습니까?")){
    		
			var url = contextRoot + "/workType/deleteWorkType.do";
	    	var param = {
		    		workTypeId	: workTypeId
	    	};
	    		    	
	    	var callback = function(result){
	    		
	    		var obj = JSON.parse(result);
        		
        		var rsltObj = obj.resultObject;	//결과
        		
        		if(obj.result == "SUCCESS"){
				
       				fnObj.doRegCancel();	//편집모드취소 함수로 초기화
       				fnObj.doSearch();		//검색
       				toast.push("삭제 OK!");
       				
        		}else{
        			//alertMsg();
        		}
        		
        	};
	    	
	    	commonAjax("POST", url, param, callback);
		}//if
    },//deleteWorkType
    
    
    //업무보고 발송div팝업
    memoDivAjax: function(th, e, names){
    	var param = {sNb: '0', mainSnb: '0'};
    	var callback = function(arg){
    		$("#offerDiv").html(arg);    		
    		$("#offerDiv").find('[id^=memoSNb]').attr('id', 'memoSNb'+$('#choice_day').val());
    		
    		view("offerPr",th,e);
    		
    		$('input[name=memoSndName][value=' + names + ']').attr('checked',true);
    		putStaffNames($('#btnStaffAdd').get(0));
    	};
    	ajaxModule(param ,"../main/privateMemo.do", callback);
    },
    
    
    //검색 취소
    doInitSrch: function(){
    	$('#searchText').val('');
    	fnObj.doSearch();
    },
    
    
    //검색 입력란 엔터
    doEnterSrchInput: function(e){    	
    	if(e.keyCode == 13){
    		fnObj.doSearch();
    	}
    },
    
    
    //검색어 하이라이트
    doHighLightSrchTxt: function(){
    	var searchText = $('#searchText').val();
    	searchText = searchText.replace(" +", " ");
    	var searchTextList = searchText.split(" ");
    	
    	for(var i=0; i<searchTextList.length; i++){
    		$(".highLightText:contains('"+searchTextList[i]+"')").each(function () {
        		var regex = new RegExp(searchTextList[i], 'gi');
                $(this).html( $(this).html().replace(regex, "<span class='text-highlight'>"+searchTextList[i]+"</span>") );
            });
    	}
    }
    
    
    
  	//################# else function :E #################
  	
  	
    
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();		//공통코드 or 각종선로딩코드
	//fnObj.pageStart();		//화면세팅
	fnObj.doSearch();						//검색
	fnObj.setDefaultWorkTypeStaffAlone();	//등록기 기본담당자를 나(사용자)로 세팅
});
</script>