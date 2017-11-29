<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>


<%-- ======================= 세션 정보에 따른 변수 선언 (간단한 이름으로 재정의 사용) :S  ======================== --%>
<c:set var="mezzL" value="${userLoginInfo.mezzL}"/>		<%-- 메자닌 상장 권한 --%>
<c:set var="mezzN" value="${userLoginInfo.mezzN}"/>		<%-- 메자닌 비상장 권한 --%>

<c:if test="${userLoginInfo.permission > '00020'  or  userLoginInfo.id eq 'gjh'}">	<%-- 개발자 or 대표님 은 무조건 'Y' --%>
<c:set var="mezzL" value="Y"/>
<c:set var="mezzN" value="Y"/>
</c:if>
<%-- ======================= 세션 정보에 따른 변수 선언 (간단한 이름으로 재정의 사용) :E  ======================== --%>


<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>

<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/management.css'/>" rel="stylesheet" type="text/css"/>

<style>.active{background:#558755;/* border:1px solid #558755; */} </style>
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js?ver=1.0'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/work.js?ver=1.2'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/memo.js?ver=3.4'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/calendar_beans_v2.0.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.event.drag-1.5.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.event.drop-1.2.min.js'/>" ></script>
<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 
<script>

CalAddCss();
$(document).ready(function(){
	
	
	//읽지않은 이전글 접기 기본 세팅
	foldNoRead('${userLoginInfo.noReadAllYn}');		//하단 함수 호출(화면 로딩후)
	
	
	
	$("td.day font[color=blue]").parent().parent().addClass('bgGry');
	$("td.day font[color=red]").parent().parent().addClass('bgGry');
	$("td.business a").each(function(){
		var arr = ['연휴','휴가','설날','추석'];
		for(var i in arr){
			if($(this).html().indexOf(arr[i])!=-1) $(this).parent().parent().parent().addClass('bgGry');
		}
	});
	
	getDivList('1');	//탭 - 1 부서별 2 직원별
	
	
	/* var divisionList= getCodeInfo(null,null,null,null,null,null,"/common/getDivisionList.do",null);
	$("#divisionDiv").empty();
	for(var i=0;i<divisionList.length;i++){
		var str="";
		str='<div id="'+divisionList[i].divCode+'List"></div>'
		$("#divisionDiv").append(str);
		getUserList(divisionList[i].divCode,divisionList[i].divName); 
		
	}  */
	
	$('.content_box').css('visibility','');
	
	
	
	var today = new Date();
	var m = today.getMonth()+1;
	var d = today.getDate();
	
	var focusNum = d;
	
	/* var focN = $('#focusNumber').val();

	if(m != $("#choice_month").val()){
		d = 1;
	}
	if(focN!='' && focN!=undefined) {
		d = parseInt(focN);
	}
	if(d>3){
		var focusNum=1;

		for(var i=0,_fcsB = 0,_fcsD = 0,_fcsM = 0,tmp=0, _fcsT=0;d>i && _fcsT<13;i++){
			_fcsB = $('tr.day'+(d-i)+' td.business a').length;
			_fcsD = $('tr.day'+(d-i)+' td.data a.cpnNm').length;
			_fcsM = $('tr.day'+(d-i)+' td.memo a').length;
			tmp = _fcsB>_fcsD?_fcsB:_fcsD;
			tmp = _fcsM>tmp?_fcsM:tmp;
			_fcsT+= tmp;
		}
		if(d>i)focusNum = d -i;
	} */
	
	
	var _focusElement = $('tr.day'+focusNum);			//+' td.business a:last');
	if(_focusElement[0]==undefined){
		/*
		_focusElement.each(function(){
			$(this).scrollIntoView(false);
		});
		*/
		
		$('tr.day'+'${last_day}')[0].scrollIntoView(false);		//말일 중에 없는 날을 검색하려 할때, 해당월의 마지막일로 가도록
		
	}else{
		//_focusElement[0].scrollIntoView(false);
		parent.mainFrame.scrollTo(0, _focusElement[0].offsetTop);
	}

	
	
	if(${not empty resultSMS}){
		$("#frmSMS").submit();
		//send_AJAX_SMS();
	}
	if($(window).width()<1010){
		$("#wrap").css("min-width","98%");
		parent.widthAuto('600px');
	}
	
	if( "${userLoginInfo.permission}" != 1 )
		switchIbIns();
	else
		switchIbIns('ib');
	//window.parent.delMask();
	
	
});


function getDivList(ver){		//ver : 탭종류 - 1 부서별 2 직원별
	$(".click_tab").removeClass();
	$("#btn_"+ver).addClass("click_tab");
	var divisionList= getCodeInfo(null,null,null,null,null,null,"/common/getDivisionList.do",{enable :'Y',userCountChk:'Y'});
	$("#divisionDiv").empty();
	for(var i=0;i<divisionList.length;i++){
		var str="";
		str='<div id="'+divisionList[i].divCode+'List"></div>'
		$("#divisionDiv").append(str);
		if(ver == '1') getUserListVer1(divisionList[i].divCode,divisionList[i].divName,i); 
		else getUserListVer2(divisionList[i].divCode,divisionList[i].divName); 
		
	}
}


//부서별
function getUserListVer1(divCode,divName,idx){ 
  
	var url = contextRoot+"/work/selectuserList.do";
	var param = {
			division : divCode,
			deptOrder: 'Y'
		};
	var callback = function(result){
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;		//결과수
		var list = obj.resultList;		//결과데이터JSON
		var PerCnt=0;
		var dept = ''; 	  //부서명 변수
		var deptSeq = ''; //부서시퀀스 변수
		var classSet = '';
		var styleDisplay='';
		if(divCode == "${userLoginInfo.division}" ){
			onclickSet= 'hiddenDiv(\''+divCode+'\')' ;
			classSet  = 'axi-keyboard-arrow-up';
		}else{
		
			onclickSet= 'openDiv(\''+divCode+'\')' ;
			styleDisplay = ' style="display:none;" ' ;
			classSet  = 'axi-keyboard-arrow-down';
		}
		if(list.length>0){
			var str=''; 
			/* ========회사선택 체크박스======== */
			str+='<p class="division_area"> <label for="Entry'+idx+'"><input type="checkbox" name="Entry" id="Entry'+idx+'" class="Entry_'+divCode+'" onclick="selCompany(this.name, ' + idx + ', \'' + divCode + '\');"><b>전체선택('+divName+')</b></label>'; //
			str += '<span id="span_'+divCode+'" style="float:right;cursor:pointer;" onclick="'+onclickSet+'"><i id="btn_'+divCode+'" class="axi '+classSet+'" style="font-size:20px;"></i></span></p>'; 
			str+= '<dl class="user_dl" id="dl_'+divCode+'" '+ styleDisplay +'>';
			for(var i=0 ; i<list.length ;i++){
	    		deptSeq = list[i].deptSeq;
	    		if(list[i].deptNm != dept){	//새로운 부서 인원
	    			/* ========부서선택 체크박스======== */
	    			str+= '<dt class="user_dt"><label for="'+divCode+'_deptAry'+deptSeq+'"><input type="checkbox" name="'+divCode+'deptAry" id="'+divCode+'_deptAry'+deptSeq+'" class="'+divCode+'"  onclick="selDept(this.id);"><b>'+list[i].deptNm+'</b></label></dt>' ;		//줄바꾸고
    				dept = list[i].deptNm;		//담아둔다
    				str += '<dd class="user_dd">';		//줄바꾸고
    				PerCnt=0;
	    		}
    			str+='<label for="EntryAry'+i+'"><input type="checkbox" name="memoSndName" id="EntryAry'+i+'" class="'+divCode+'_deptAry'+deptSeq+'" value="'+list[i].usrNm+'" >' ;
	    		str+=list[i].usrNm+'</label>';
	    		PerCnt++;
	    		/* if(PerCnt%3 == 0){
				str += '<br/>';
				} */
	    		if(list[i].deptNm != dept){
					str += '</dd>';
				}
	    	}	
	    	str += '</dl>';
	    	$("#"+divCode+"List").html(str); 
		}
	};
	commonAjax("POST", url, param, callback, false, null, null);
	
}

//직원별
function getUserListVer2(divCode,divName){ 
  
	var url = contextRoot + "/work/selectuserList.do";
	var param = {division : divCode};

	var callback = function(result){
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;		//결과수
		var list = obj.resultList;		//결과데이터JSON
		var styleDisplay='';
		if(divCode == "${userLoginInfo.division}" ){	//login유저의  division일때 div세팅
			onclickSet= 'hiddenDiv(\''+divCode+'\')' ;
			classSet  = 'axi-keyboard-arrow-up';
		}else{
			onclickSet= 'openDiv(\''+divCode+'\')' ;
			styleDisplay = ' style="display:none;" ' ;
			classSet  = 'axi-keyboard-arrow-down';
		}
		if(list.length>0){
			var str='<p class="division_area">';
			str+='<label><input type="checkbox" onclick="selectAll(this,0,\''+divCode+'List\');"><b>전체선택('+divName+')</b></label>';
			str += '<span id="span_'+divCode+'" style="float:right;cursor:pointer;" onclick="'+onclickSet+'"><i id="btn_'+divCode+'" class="axi '+classSet+'" style="font-size:20px;"></i></span></p>'; 
			str+= '<dl class="user_dl" id="dl_'+divCode+'" '+ styleDisplay +'>';
			str+='<dt class="user_dt" style="border-bottom:0px;background:#eceadf;">';
			for(var i=0 ; i<list.length ;i++){
	    		str+='<span style="width:155px;display:inline-block;"><label for="'+divCode+'chbox'+i+'" class="checkR"><input type="checkbox" name="memoSndName" id="'+divCode+'chbox'+i+'" value="'+list[i].usrNm+'" >' ;
	    		str+='<span style="width:45px;display:inline-block;"><b>'+list[i].usrNm+'</b></span>('+list[i].deptNm+')</label></span>';
	    		//str+='</dt>';
	    		if(i%2 == 1){
					str+='</dt>';
					str+='<dt class="user_dt" style="border-bottom:0px;background:#eceadf;">';
				} 
	    	}	
	    	str+='</dl>';
	    	$("#"+divCode+"List").html(str);
		}
	};
	commonAjax("POST", url, param, callback, false, null, null);
}



//회사 선택 
function selCompany(Obj, idx, divCd) {			//idx ... division list index ... 0:'SYNERGY', 1:'FIDES'		divCd...  'SYNERGY', 'FIDES'
	
	var All = $($('input:checkbox[name='+Obj+']')[idx]); //회사선택 체크박스
	var ChkList = $('input[name='+divCd+'deptAry]'); //부서선택 체크박스
	if(!All.is(':checked')) {// 전체선택 체크박스가 해제되었다면
		for(var i=0; i<ChkList.length; i++) {
			ChkList[i].checked = false;
			selDept($(ChkList[i]).attr('id')); //부서선택으로
		}
	}
	else { // 그게 아니라면
		for(var i=0; i<ChkList.length; i++) {
			ChkList[i].checked = true;
			selDept($(ChkList[i]).attr('id'));//부서선택으로
		}
	}
}
//부서선택 
function selDept(obj) {		
	var All = $("#"+obj);
	var ChkList = $("."+obj); ///해당 부서를 class 로 가지고 있는 사원의 체크박스 리스트
	if(!All.is(':checked')) {// 전체선택 체크박스가 해제되었다면
		for(var i=0; i<ChkList.length; i++) {
			ChkList[i].checked = false;
		}
	}
	else { // 그게 아니라면
		for(var i=0; i<ChkList.length; i++) {
			ChkList[i].checked = true;		
		}
	}
}	
	



//메모에서 전체체크
function selectAll(obj,num,divName){
	
	var checkboxs = $('#'+divName+' input:checkbox');
	var allCheck = $(obj);
	if(num==0) {
		checkboxs.attr('checked',true);
		allCheck.attr('onclick','selectAll(this,1,\''+divName+'\')');
	} else if(num==1) {
		checkboxs.attr('checked',false);
		allCheck.attr('onclick','selectAll(this,0,\''+divName+'\')');
	}
}


function alertBTN(){alert("해당인물을 먼저 선택해 주세요.");}
function hideView(th){
	var dsp = parent.dispLeft()
		,arrow = $(th).children();
	if(dsp==''||dsp=='block'){
		parent.leftIframeOFF();
		// arrow.html('▶');
	}else{
		parent.leftIframeON();
		// arrow.html('◀');
	}
}
function viewPer(th,tab){
	var obj = $(th);
	$('.subTabon').addClass('subTab');
	$('.subTabon').removeClass('subTabon');
	obj.addClass('subTabon');
	switch(tab){
		case 1:
			$('.business').show();
			$('.result').hide();
			$('.data').hide();
			$('.memo').hide();
			$('#topTh').attr('colspan','3');
		break;
		case 2:
			$('.business').hide();
			$('.result').hide();
			$('.data').show();
			$('.memo').hide();
			$('#topTh').attr('colspan','3');
		break;
		case 3:
			$('.business').hide();
			$('.result').hide();
			$('.data').hide();
			$('.memo').show();
			$('#topTh').attr('colspan','3');
		break;
		case 4:
			parent.slctMainMenu('00101');		//메뉴검색 페이지 오픈
		break;
		default:
			$('.business').show();
			$('.result').show();
			$('.data').show();
			$('.memo').show();
			$('#topTh').attr('colspan','6');
		break;
	}
	
}


//메모 검색 화면 팝업
function openMemoSearchPop(){
	
	var url = "${pageContext.request.contextPath}/work/memoBox.do";
	var option = "left=" + (screen.width > 1400?"200":"0") + ", top=" + (screen.height > 810?"100":"0") + ", width=1400, height=810, menubar=no, status=no, toolbar=no, location=no, scrollbars=auto, resizable=no";
	
	window.open(url, "_blank", option);
	
}



//읽지않은 이전 업무보고 전체보기, 접기 toggle (세션사용)
var g_noReadAllYn = '${userLoginInfo.noReadAllYn}';
function foldNoRead(val){
	if($('.frt_body').length > 0){
		if(val == 'Y'){		//펼침
			$('.frt_body').css('height', $('.frt_body')[0].scrollHeight + 'px');		//'300px');
			
			$('.fold_down').addClass('fold_up');
			$('.fold_down').removeClass('fold_down');		
		}else{				//접기
			
			var thisHeight = $('.frt_body')[0].scrollHeight;
			
			$('.frt_body').css('height', (thisHeight < 113 ? thisHeight : 113) + 'px');
			
			$('.fold_up').addClass('fold_down');
			$('.fold_up').removeClass('fold_up');
		}
	}
	
	g_noReadAllYn = val;					//전역변수 세팅
}
//읽지않은 이전 업무보고 전체보기, 세션 세팅
function setNoReadAllYn(){
	var val = (g_noReadAllYn=='N'?'Y':'N');
	var url = contextRoot + "/work/setNoReadAllYn.do";
	var param = {
			noReadAllYn : val
		};
	var callback = function(result){
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;		//결과수
		var list = obj.resultList;		//결과데이터JSON
		
		foldNoRead(val);
		
	};
	commonAjax("POST", url, param, callback, false, null, null);	
} 




</script>
<style>
* {-webkit-text-size-adjust:none;}​
.date, .day{text-align: center;}
/* .date{width:70px;} .day{width:24px;} .result{width:60px;} */
.business a, .data a, .memo a{display: inline-block;padding: 1px 2px 0px 2px;margin:3px 0 0 0;}
.t_skinR00 tbody tr .business,.t_skinR00 tbody tr .result,.t_skinR00 tbody tr .data,.t_skinR00 tbody tr .memo{vertical-align:top;}
.overflow{overflow: hidden;}
.t_skinR00 *{font-family: 맑은 고딕, Trebuchet MS, Verdana, Geneva, sans-serif;}
.clr1{color:green;}.clr2{color:blue;}.clr3{color:red;}
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
.year_wrap>a{font-size:11px;height:15px;line-height:15px;}
.busiRed{background-color:#FF7575 !important;border-radius:3px;padding:0px 2px;}

.bgRed {
    /* border-left: 1px solid #CCCCFF!important;
    border-bottom: 1px solid #9999FF!important;
    border-top: 1px solid #9999FF!important;
    
    background-color: #DDDDFF !important; */
    
    border-left: 1px solid #F6bEbE!important;
    border-bottom: 1px solid #F69999!important;
    border-top: 1px solid #F69999!important;
    
    background-color: #F6CECE !important;
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
	margin:2px;
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

.repleR{
	font-size:11px;
}

</style>
</head>


<body>
<input type="hidden" id="pageName" value="PrivateWorkVeiw"/>
<input type="hidden" id="focusNumber" value="${focus}"/>
<c:set var="now" value="<%= new java.util.Date() %>"/>
<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
<div id="moveBtn" style="position:absolute;display:none;"><span class="btn s green"><a onclick="event.parent().parent().fadeOut();">이동</a></span><span class="btn s blue"><a onclick="this.parent().parent().fadeOut();">복사</a></span></div>
<div id="wrap" style="padding-left:5px;">
<div id="moveDiv" style="position:absolute;display:none;"><nobr id="moveTable" class="business"></nobr></div>
<div id="offerDiv"><div id="offerPr" style="display: none;"></div></div>
	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<input type="hidden" id="loginName" value="${userLoginInfo.name}">

<iframe id="iframeSMS" name="iframeSMS" style="display:none"></iframe>

<form id="frmSMS" name="frmSMS" action="https://biz.moashot.com/EXT/URLASP/mssendUTF.asp" method="post" target="iframeSMS">
	<c:forEach var="sms" items="${resultSMS}" varStatus="OPst">
	<input type="hidden" name="uid" id="uid" value="synergy"/>
	<input type="hidden" name="pwd" id="pwd" value="00synergy00"/>
	<input type="hidden" name="returnUrl" id="returnUrl" value="http://106.250.177.91:8280/SynergyCus/SMSSendResult.do"/>
	<input type="hidden" name="sendType" id="sendType" value="${sms.SMSType}"/>
	<input type="hidden" name="toNumber" id="toNumber" value="${sms.SMSToNum}"/>
	<input type="hidden" name="contents" id="contents" value="${sms.SMSContent}"/>
	<input type="hidden" name="fromNumber" id="fromNumber" value="${sms.SMSFromNum}"/>
	<input type="hidden" name="startTime" id="startTime" value="${sms.SMSReserTime}"/>
	<input type="hidden" name="indexCode" id="indexCode" value="${sms.SMSSeq}"/>
	<input type="hidden" name="returnType" id="returnType" value="1"/>
	<input type="hidden" name="nType" id="nType" value="2"/>
	</c:forEach>
</form>

<form id="downName" name="downName" action="<c:url value='/work/downloadProcess.do' />" method="post">
	<input type="hidden" name="makeName" id="makeName"/>
	<input type="hidden" name="recordCountPerPage" value="0"/>
</form>
<form name="modifyRec" action="<c:url value='/work/selectPrivateWorkV.do' />" method="post" onSubmit="chkval(this)">
	<input type="hidden" name="focus" id="focus" value="${focus}">
	<input type="hidden" name="tmpId" value="${tmpId}">
	<input type="hidden" name="name" id="name" value="${name}">
	<input type="hidden" name="comment" id="comment">
	<input type="hidden" name="day" id="memoDay">
	<input type="hidden" name="sttsCd" id="sttsCd">
	<input type="hidden" name="SMSTitle" id="SMSTitle">
	<input type="hidden" name="priv" id="privateYN" value="N">
	<input type="hidden" id="choice_month" name="choice_month" value="${choice_month}">
	<input type="hidden" id="cc_year" name="choice_year" value="${choice_year}">
	<%-- 직원 플로팅 div --%>
		<div class="popUpMenu" id="test" style="width:330px;">
			<div style="padding-left:310px;cursor:pointer;" onclick="javascript:$('#test').hide();" ><i class="axi axi-close2" style="font-size:17px;"></i></div>
			<div class="btn_tab" >
				<button id="btn_1" type="button" class="btn_click" style="cursor:pointer;margin-left:3px;" onclick="getDivList('1');"><i class="axi axi-sitemap"></i> 부서별</button>
				<button id="btn_2" type="button" style="cursor:pointer;" onclick="getDivList('2');"><i class="axi axi-ion-person-stalker"></i> 직원별</button>
			</div>	
			<div id="divisionDiv"></div> 
	
			<p class="bsnsR_btn" style="padding:0 0 3px 2px;"><span class="btn s green" onclick="memoSnd('insertMemo.do',this)"><a>&nbsp;&nbsp;&nbsp;메모&nbsp;&nbsp;&nbsp;</a></span>
				<input type="text" style="height:0.5px;width:0.5px;border:0px none;padding:0;vertical-align:bottom;">
				<span class="memo_btnSnd btn s blue" onclick="memoSnd('insertMemo.do',this,'sms')"><a>문자,메모</a></span>
				<input type="text" id="PM_0" style="height:0.5px;width:0.5px;border:0px none;padding:0;vertical-align:bottom;">
			</p>
		</div>
	<%-- 직원 플로팅 div --%>
</form>
<input type="hidden" id="am_Name" value="${name}">
<input type="hidden" id="sabunList">
<input type="hidden" id="am_SMSTitle">
<input type="hidden" id="staffNmForSms">

<form id="staffName" name="staffName" action="<c:url value='/work/exSelectPrivateWorkV.do' />" method="post">
	<input type="hidden" id="s_id" name="tmpId" value="${tmpId}">
	<input type="hidden" id="s_Name" name="name" value="${name}">
	<input type="hidden" id="s_month" name="choice_month">
	<input type="hidden" id="s_year" name="choice_year">
</form>

<div class="fixed-top" style="z-index:10;">

	<div class="year_wrap">
		<span class="btn s red" onclick="javscript:hideView(this);" style="color:white;"><a>◀▶</a></span>

		<%--
		<span class="btn s navy"><a onclick="switchIbIns()">전체</a></span>
		<span class="btn s blue"><a onclick="switchIbIns('ib')">ib</a></span>
		<span class="btn s orange"><a onclick="switchIbIns('ins')">InSide</a></span>
		 --%>
		<span class="year">
			<select id='choice_year' name='choice_year' onchange="javascript:$('#cc_year').val(this.value);document.modifyRec.submit();">
			<c:forEach var="year" begin="2010" end="${cur_year+2}">
				<option value="${year}"
					<c:choose>
						<c:when test="${choice_year == null}"><c:if test="${year == cur_year}">selected</c:if>></c:when>
						<c:otherwise><c:if test="${year == choice_year}">selected</c:if>></c:otherwise>
					</c:choose>
				${year}</option>
			</c:forEach>
			</select>
		</span>
		<a <c:if test="${choice_month == '01' }">class="red bold"</c:if> onclick="month('01','selectPrivateWorkV.do')">1월</a><span> | </span>
		<a <c:if test="${choice_month == '02' }">class="red bold"</c:if> onclick="month('02','selectPrivateWorkV.do')">2월</a><span> | </span>
		<a <c:if test="${choice_month == '03' }">class="red bold"</c:if> onclick="month('03','selectPrivateWorkV.do')">3월</a><span> | </span>
		<a <c:if test="${choice_month == '04' }">class="red bold"</c:if> onclick="month('04','selectPrivateWorkV.do')">4월</a><span> | </span>
		<a <c:if test="${choice_month == '05' }">class="red bold"</c:if> onclick="month('05','selectPrivateWorkV.do')">5월</a><span> | </span>
		<a <c:if test="${choice_month == '06' }">class="red bold"</c:if> onclick="month('06','selectPrivateWorkV.do')">6월</a><span> | </span>
		<a <c:if test="${choice_month == '07' }">class="red bold"</c:if> onclick="month('07','selectPrivateWorkV.do')">7월</a><span> | </span>
		<a <c:if test="${choice_month == '08' }">class="red bold"</c:if> onclick="month('08','selectPrivateWorkV.do')">8월</a><span> | </span>
		<a <c:if test="${choice_month == '09' }">class="red bold"</c:if> onclick="month('09','selectPrivateWorkV.do')">9월</a><span> | </span>
		<a <c:if test="${choice_month == '10' }">class="red bold"</c:if> onclick="month('10','selectPrivateWorkV.do')">10월</a><span> | </span>
		<a <c:if test="${choice_month == '11' }">class="red bold"</c:if> onclick="month('11','selectPrivateWorkV.do')">11월</a><span> | </span>
		<a <c:if test="${choice_month == '12' }">class="red bold"</c:if> onclick="month('12','selectPrivateWorkV.do')">12월</a>
	</div>
	
	<div style="margin-top:35px;position:absolute;">
		<div class="clear" style="float:left;width:10px;height:15px;">&nbsp;</div>
		<div style="height:16px;line-height:15px;"class="1st subTabon" onclick="viewPer(this)">전체</div>
		<div style="height:16px;line-height:15px;"class="1st subTab" onclick="viewPer(this,1)">업무등록</div>
		<div style="height:16px;line-height:15px;"class="1st subTab" onclick="viewPer(this,2)">정보등록</div>
		<div style="height:16px;line-height:15px;"class="1st subTab" onclick="viewPer(this,3)">업무보고</div>
		<%--<div style="height:16px;line-height:15px;"class="1st subTab" onclick="viewPer(this,4)">메모검색</div> --%>
		<div class="tabUnderBar" style="float:left;height:15px;">&nbsp;</div>
		<div class="clear" style="height:4px;"></div>
	</div>

	<table class="t_skinR00" style="padding-top:51px;table-layout:fixed">
		<colgroup>
	        <col class="date" width="82">
	        <col class="day" width="36">
	        <col class="result" width="72">
	        <col class="business" width="calc(30% - 57px)">	        
	        <col class="data" width="calc(40% - 76px)">
	        <col class="memo" width="calc(30% - 57px)">
		</colgroup>
		<thead>
			<tr>
				<th id="topTh" colspan="6" style="font-size:20px;"><font style="color:navy">${workVO.name}</font> <font style="color:firebrick"><c:choose><c:when test="${choice_month<10}">${fn:replace(choice_month,'0','')}</c:when><c:otherwise>${choice_month}</c:otherwise></c:choose>월</font> 업무일지</th>
			</tr>
			<tr>
				<th class="T date">일자</th>
				<th class="T day">요일</th>
				<th class="T result">진행상태</th>
				<th class="T business">업무등록</th>				
				<th class="T data">정보등록 (딜)</th>
				<th class="T memo" style="padding-top:0px!important;">업무보고&nbsp;&nbsp;&nbsp;<a href="javascript:openMemoSearchPop();"><img src="<c:url value='/images/work/btn_memo_search.jpg' />"  style="vertical-align:bottom;" title="상세보기"></a></th>
					<%--<a href="javascript:parent.slctMainMenu('00101');" class="T">검색</a> --%>
					
			</tr>
		</thead>
	</table>
</div>

<div id="divContent" style="padding-top:118px;">
	<table class="t_skinR00" style="table-layout:fixed">
		<colgroup>
	        <col class="date" width="82">
	        <col class="day" width="36">
	        <col class="result" width="72">
	        <col class="business" width="calc(30% - 57px)">	        
	        <col class="data" width="calc(40% - 76px)">
	        <col class="memo" width="calc(30% - 57px)">
	    </colgroup>
		<tbody>
		<c:forEach var="cnt" begin="1" end="${last_day}">
			<c:set var="choiceDay"><c:if test="${cnt < 10}">0</c:if>${cnt}</c:set>
			<c:set var="date_cnt" value="${workVO.choice_year}-${workVO.choice_month}-${choiceDay}"/>
			<tr class="day${cnt}">
				<td class="T date<c:if test="${date_cnt==cur_day}"> bgRed</c:if>" align="center">
					<nobr>
					<script>
						var weekends = getWeekday('${date_cnt}');
						/* if(weekends == '토') 		weekends = "<font color='blue'>${date_cnt}</font>";
						else if(weekends == '일') 	weekends = "<font color='red'>${date_cnt}</font>";
						else 						weekends = "${date_cnt}"; */						
						var dt = "${date_cnt}";
						
						<c:if test="${date_cnt==cur_day}">dt = "<b>TODAY<br/> " + dt + "</b>";</c:if>
						
						if(weekends == '토') 		dt = "<font color='blue'>" + dt + "</font>";
						else if(weekends == '일') 	dt = "<font color='red'>" + dt + "</font>";
						else 						dt = "<font>" + dt + "</font>";
						
						document.write(dt);
					</script>
					</nobr>
				</td>
				<td class="T day<c:if test="${date_cnt==cur_day}"> bgRed</c:if>">
					<script>
						var weekends = getWeekday('${date_cnt}');
						if(weekends == '토') 	weekends = "<font color='blue'>"+weekends+"</font>";
						else if(weekends == '일') 	weekends = "<font color='red'>"+weekends+"</font>";
						document.write(weekends);
					</script>
				</td>
				<td class="T result<c:if test="${date_cnt==cur_day}"> bgRed</c:if>">
					<c:if test="${userLoginInfo.id eq tmpId}">
					<span style="display:inline-block;width:16px;height:16px;padding:3px 0 2px 0;"></span>
					</c:if>
					<c:forEach var="bsns" items="${resultList}" varStatus="bsnsS"> <c:set var="Day_tmDt">${fn:substring(bsns.tmDt, 8,10)}</c:set>
						<c:if test="${fn:contains(Day_tmDt, choiceDay)}">
							<p class="cent pd0 mg0" style="margin-top:1px!important;">
								<span class="btn s<c:if test="${bsns.process == '00001'}"> orange</c:if><c:if test="${bsns.process == '00002'}"> blue</c:if><c:if test="${bsns.process == '00004'}"> black</c:if>">
									<c:if test="${userLoginInfo.permission > '00019'  or  userLoginInfo.id==tmpId}">
									<a class="processResultBtn"style="width: 45px;text-align: center;"><label for="processResult_${bsns.sNb}">${bsns.processNm}</label></a>
									</c:if><c:if test="${userLoginInfo.permission < '00020' and userLoginInfo.id!=tmpId}">
									<a>${bsns.processNm}</a>
									</c:if>
								</span>
								<select class="processResult" id="processResult_${bsns.sNb}" style="display:none;">
									<c:forEach var="cmmCd" items="${cmmCdResultList}" varStatus="status">
										<option value="${cmmCd.dTailCd}"<c:if test="${bsns.process == cmmCd.dTailCd}"> selected</c:if>>${cmmCd.cdNm}</option>
									</c:forEach>
								</select>
							</p>
						</c:if>
					</c:forEach>
				</td>
				<td class="T overflow business<c:if test="${date_cnt==cur_day}"> bgRed</c:if>">
					<c:if test="${userLoginInfo.id eq tmpId}"> <%-- userLoginInfo.permission > '00019' --%>
						<a class="title" name="${choiceDay}" id="title_n" onmouseup="clkBusiness(event,this);" style="width:16px;height:16px">
							<img src="<c:url value='/images/edit-5-icon.png'/>" title="일지 입력">
						</a><br/>
					</c:if>

					<c:forEach var="bsns" items="${resultList}" varStatus="bsnsS">
						<c:set var="Day_tmDt">${fn:substring(bsns.tmDt, 8,10)}</c:set>
						<c:if test="${fn:contains(Day_tmDt, choiceDay)}"><nobr><a class="title bsns<c:if test="${bsns.bsnsRecPrivate == '2'}"> busiGrn</c:if>" name="${choiceDay}" id="title_${bsns.sNb}" onmouseup="clkBusiness(event,this);">${bsns.title}<c:if test="${fn:length(bsns.title) < 1}">...</c:if></a></nobr><br/></c:if>
					</c:forEach>

					<c:forEach var="inside" items="${insideList}" varStatus="inS">
						<c:set var="Day_tmDt">${fn:substring(inside.tmDt, 8,10)}</c:set>
						<c:if test="${fn:contains(Day_tmDt, choiceDay)}">
							<c:if test="${inside.schePublicFlag eq 'Y' or (inside.schePublicFlag eq 'N' and inside.name eq userLoginInfo.name)}">
							<script>
							var reTitle = '${inside.title}';
							reTitle = reTitle.replace(/\s\|A?[0-9]+\|/gi, '');	//회사코드 제거
							reTitle = reTitle.replace(/\s\([0-9]+\)/gi, ' ');		//인물id sequence 제거
							reTitle = reTitle.replace(/\/\sM&A\s\//gi, '<span style="font-size:11px;font-weight:bold;">M&A</span>');		//M&A여부 폰트변경
							<c:if test="${userLoginInfo.division ne 'SYNERGY'}">
							reTitle = reTitle.replace('[InS]', '');		//[InS] 제거
							</c:if>
							</script>
							<nobr><a class="bsns bold inside<c:if test="${inside.type == 'Invest'}"> busiRed</c:if><c:if test="${inside.type != 'invest' and inside.bsnsRecPrivate == '2'}"> busiGrn</c:if>" id="titleI_${inside.sNb}" onmouseup="clkBusiness(event,this);"><script>document.write(reTitle);</script><c:if test="${fn:length(inside.title) < 1}">...</c:if></a>
							</nobr><br/>
							</c:if>
						</c:if>
					</c:forEach>
				</td>
				
				<td class="T overflow data<c:if test="${date_cnt==cur_day}"> bgRed</c:if>">
					<c:if test="${userLoginInfo.id eq tmpId}">	<%-- userLoginInfo.permission > '00019'  or   --%>
						<a class="cpnNm" name="${choiceDay}" id="cpnNm_${cnt}_n" style="width:16px;height:16px;" onmouseup="statsOfferdivAjax(event,'${of.rgNm}',this,'${of.sNb}','${of.reportYN}')">
							<img src="<c:url value='/images/edit-5-icon.png'/>" title="정보 입력">
						</a><br/>
					</c:if>

					<c:forEach var="of" items="${offerList}" varStatus="status">
					
					
						<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :S  ================== --%>
						<c:choose>
						<c:when test="${mezzL eq 'Y'}">
							<c:set var="asterDeal" value="N"/>
						</c:when>		<%-- 내가 등록한 딜이 아니면서 --%>		<%--             상장사 이고			 --%>		<%--						메자닌 (CB, EB, BW, RCPS) 이고								 					--%> <%--	진행중 인 건		 --%>		<%--						제안중이 아니고					 --%>
						<c:when test="${of.rgId ne userLoginInfo.id and ('A' eq of.cpnStts or 'Q' eq of.cpnStts) and (of.categoryCd eq '00001' or of.categoryCd eq '00002' or of.categoryCd eq '00003' or of.categoryCd eq '00015') and of.progressCd eq '00001'}">		<%--  and (of.middleOfferCd ne '00004' and of.middleOfferCd ne '00005') --%>
							<c:set var="asterDeal" value="Y"/>	<%-- 별표시(숨김) --%>
						</c:when>
						<c:otherwise>
							<c:set var="asterDeal" value="N"/>
						</c:otherwise>
						</c:choose>
						<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :E  ================== --%>
					
					
						<c:choose>
						<c:when test="${of.rgId ne userLoginInfo.id and ((of.categoryCd ne '00008' and of.infoLevel lt userLoginInfo.infoLevel)||(of.categoryCd eq '00008' and of.infoLevel lt userLoginInfo.mnaLevel))}">	<%--of.secretYn eq 'Y' and of.rgId ne userLoginInfo.id --%>
						<!-- 보안등급이 나의 등급보다 높고 내가 등록한게 아니면 안보인다. -->
						</c:when>
						<c:otherwise>
						
						<!-- ------------------------------------ 정보정리 뿌리기 :S ------------------------------------- -->
						<c:set var="Day_tmDt">${fn:substring(of.tmDt, 8,10)}</c:set>
						<c:if test="${fn:contains(Day_tmDt, choiceDay)}"><c:set var="tb_title" value="${of.cpnNm}"/>
							<nobr>
							
							
							<c:choose>
								<c:when test="${asterDeal eq 'Y'}"><a class="cpnNm">***</c:when>
								<c:otherwise>
								
							
							<a class="cpnNm" name="${choiceDay}" id="cpnNm_${of.sNb}" onmouseup="statsOfferdivAjax(event,'${of.rgNm}',this,'${of.sNb}','${of.reportYN}')"<%--  onmouseup="clkBusiness(this)" --%>>
							<font <c:if test="${((fn:length(of.aCpnId)!=0) and (fn:length(of.aCpnId)!=7)) or ((fn:length(of.aCpnId)==0) and (fn:length(of.cstAcpnId)!=7))}">color="#084B8A"</c:if>>
								${tb_title} ${of.cstNm}
								<c:if test="${empty tb_title and empty of.cstCpnNm}"><c:forEach var="cmmCd" items="${cmmCdanalysisCpnList}"><c:if test="${cmmCd.dTailCd eq of.cpnTypeCd}">${cmmCd.cdNm}</c:if></c:forEach></c:if>
								<c:if test="${empty tb_title and not empty of.cstCpnNm}">(${of.cstCpnNm})</c:if>
								<c:if test="${not empty tb_title and not empty of.cstCpnNm and (tb_title != of.cstCpnNm)}">(${of.cstCpnNm})</c:if>
							</font>
							
								</c:otherwise>
							</c:choose>
							
							<c:if test="${not empty of.categoryNm}"><font color="green">[${of.categoryNm }]</font></c:if>
							<font color="green"><c:if test="${not empty of.middleOfferNm}">${of.middleOfferNm }</c:if> ${of.offerNm}</font>
							<c:if test="${of.infoLevel lt 9}"><font color="red">[보${of.infoLevel}]</font></c:if>
							<c:if test="${not empty of.realNm}">
								<c:choose>
									<c:when test="${fn:indexOf(of.realNm,'^^^') > 0}">
										<c:set var="imgNm" value="${fn:split(of.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(of.makeNm, '^^^')}"/>
										<c:forEach var="im" items="${imgNm}" varStatus="imSt">
											<c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/>
											<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
											&nbsp;<img class="mail_send filePosi" id="file${imSt.count}" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}">
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:set var="extension" value="${fn:split(of.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/>
										<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
										&nbsp;<img class="mail_send filePosi" id="file1" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${of.realNm}">
									</c:otherwise>
								</c:choose>
							</c:if>

							<c:if test="${not empty of.servey or not empty of.financing or not empty of.humanNet or not empty of.audit or not empty of.management or not empty of.mna or not empty of.etc or not empty of.share or not empty of.resource or not empty of.investInte}"><br/>
								<font color="#B45F04">
									<c:if test="${not empty of.financing }"	>&nbsp;&nbsp;· 상장CB/EB: ${of.financing}&nbsp;&nbsp;</c:if>
									<c:if test="${not empty of.humanNet }"	>&nbsp;&nbsp;· 워런트/블록딜: ${of.humanNet}&nbsp;&nbsp;</c:if>
									<c:if test="${not empty of.audit }"		>&nbsp;&nbsp;· 분석의견: ${of.audit}&nbsp;&nbsp;</c:if>
									<c:if test="${not empty of.management }">&nbsp;&nbsp;· 투자/자산운용관심: ${of.management}&nbsp;&nbsp;</c:if>
									<c:if test="${not empty of.etc }"		>&nbsp;&nbsp;· 실적: ${of.etc}&nbsp;&nbsp;</c:if>
									<c:if test="${not empty of.investInte }">&nbsp;&nbsp;· 투자관심: ${of.investInte}&nbsp;&nbsp;</c:if>	<%-- 없어짐 20160525 --%>
									<c:if test="${not empty of.resource }"	>&nbsp;&nbsp;· 매수추천: ${of.resource}&nbsp;&nbsp;</c:if>	<%-- 없어짐 20160525 --%>
									<c:if test="${not empty of.mna }"		>&nbsp;&nbsp;· M&A: ${of.mna}&nbsp;&nbsp;</c:if>
									<c:if test="${not empty of.share }"		>&nbsp;&nbsp;· 공유/협업: ${of.share}&nbsp;&nbsp;</c:if>
									<c:if test="${not empty of.servey }"	>&nbsp;&nbsp;· 업황정보: ${of.servey}&nbsp;&nbsp;</c:if>
								</font>
							</c:if>
							</a>
																					
							</nobr><br/>
						</c:if>
						<c:set var="Day_tmDt">${fn:substring(of.tmDt, 8,10)}</c:set>
						<!-- ------------------------------------ 정보정리 뿌리기 :E ------------------------------------- -->
						
						</c:otherwise>
						</c:choose>
						
					</c:forEach>

					<c:set var='tmp_cc' value="0"/><c:set var='tm_ct' value="0"/>
					<c:forEach var="dealIn" items="${dealInfoList}" varStatus="SdealIn"><c:set var="tmStr">${fn:substring(dealIn.tmDt, 8,10)}</c:set>
						<c:if test="${fn:contains(tmStr, choiceDay)}"><c:set var='tm_ct' value="${tm_ct+1 }"/>
							<c:if test="${tmp_cc == 0}"><span class="bold"><a><font color="gray" onclick="prsnInfo(this,'1');">+ 펼침</font></a> <font color="green">인물정보</font></span><c:set var='tmp_cc' value="1"/><div class="prsnInfo" style="display:none;"></c:if>
							<nobr><a class="netPnt" id="${cnt}_dealIn_${SdealIn.count}_${tm_count+tm_ct}">
							${dealIn.cpnNm1st} ${dealIn.cstNm}<c:if test="${not empty dealIn.cpnNm}">↔${dealIn.cpnNm}</c:if> <font color="green">인물정보</font>
							</a></nobr><br/>
						</c:if>
					</c:forEach></div>

					<c:set var='tm_ct2' value="0"/>
					<c:forEach var="dealIn" items="${netpList}" varStatus="SdealIn"><c:set var="tmStr">${fn:substring(dealIn.tmDt, 8,10)}</c:set>
						<c:if test="${fn:contains(tmStr, choiceDay)}"><c:set var='tm_ct2' value="${tm_ct2+1 }"/>
							<c:if test="${tmp_cc == 0}"><span class="bold"><a><font color="gray" onclick="prsnInfo(this,'1');">+ 펼침</font></a> <font color="green">인물정보</font></span><c:set var='tmp_cc' value="1"/><div class="prsnInfo" style="display:none;"></c:if>
							<nobr class="prsnInfo" style="display:none;"><a class="netPnt" id="${cnt}_netP_${SdealIn.count}_${tm_count+tm_ct+tm_ct2}">
							${dealIn.cpnNm1st} ${dealIn.cstNm1st}↔${dealIn.cpnNm2nd} ${dealIn.cstNm2nd} <font color="green">인물정보</font>
							</a></nobr></div>
						</c:if>
					</c:forEach>

					<c:forEach var="idc" items="${introducerList}" varStatus="Sidc"><c:set var="tmStr">${fn:substring(idc.tmDt, 8,10)}</c:set>
						<c:if test="${fn:contains(tmStr, choiceDay)}"><c:set var='tm_ct2' value="${tm_ct2+1 }"/>
							<nobr class=""><a class="introducer" onmouseup="popUp('','introducer','','${idc.sNb}')" id="${cnt}_introd_${Sidc.count}_${tm_count+tm_ct2}">
							${idc.text}
							</a></nobr><br/>
						</c:if>
					</c:forEach>
				</td>
				
				<td class="T overflow memo<c:if test="${date_cnt==cur_day}"> bgRed</c:if>">
					<!-- ===================== 읽지 않은 업무보고 :S ===================== -->
					<c:if test="${date_cnt eq cur_day and fn:length(memoListNoRead) gt 0}">
						<div class="frt_majorMemo no_read" style="margin:0px 0px 5px 0px;padding:5px 10px 5px 0px;">
					        <div class="mainBoxTitle" style="height:25px;">
					        	<span class="title" style="color:#8d92a5;">읽지않은 이전 업무보고</span>					        	
					        	<span style="float:right;color:#8d92a5;padding-right:20px;"><%-- 전체 ${fn:length(memoListNoRead)} 건 --%></span>
					        </div>
							<div class="frt_body" style="overflow:hidden;text-overflow:ellipsis;">
								<c:set var="totCnt" value="0"/>
								
								<c:forEach var="memo" items="${memoListNoRead}" varStatus="memoS">
								<c:if test="${cur_day ne memo.lastReplyDt}">
								<!-- 볼 수 있는 권한 : 내 메모, 다른사람의 메모중 비밀이 아니면서 특수권한자들만(개발자, 대표님2분, 팀장) -->
								<c:if test="${userLoginInfo.name eq memo.name or (memo.priv ne 'Y' and (userLoginInfo.permission gt '00020' or (userLoginInfo.id eq memo.rgId) or (userLoginInfo.id eq 'gjh') or (userLoginInfo.id eq 'mclee') or (memo.memoDeptId eq userLoginInfo.deptId and userLoginInfo.sabun eq userLoginInfo.deptMngr)) )}">								
								<a class="mg0 pd0" style="width:100%;cursor:pointer;">
									<nobr>
										<div class="mg0 clr${memo.importance}" style="width:65%;overflow:hidden!important;float:left;padding:0 0 0 5px;" onclick="memoDivAjax(this,event,'${memo.sNb}','${memo.mainSnb}');" >
											
											<c:if test="${memo.sttsCd eq '00001'}">
												<!-- <span class="first_contact_from"></span> -->
												<img class="memoChkIcon" src="<c:url value='/images/warning.png'/>" title="미확인">
											</c:if>
											<c:if test="${memo.sttsCd ne '00001'}">
												<!-- <span class="first_contact_to"></span> -->
												<c:if test="${userLoginInfo.name eq memo.name}">
													<img class="memoChkIcon" src="<c:url value='/images/mail.png'/>" title="미확인">
												</c:if>
												<c:if test="${userLoginInfo.name ne memo.name}">
													<img class="memoChkIcon" src="<c:url value='/images/memo.png'/>" title="미확인">
												</c:if>
											</c:if>
											
											<c:choose>
											<c:when test="${fn:substring(memo.tmDt,0,10) eq cur_day or fn:substring(memo.rgDt,0,10) eq cur_day}">
												<img src="<c:url value='/images/n.gif'/>">
											</c:when>
											<c:otherwise></c:otherwise>
											</c:choose>
											<c:if test="${memo.priv eq 'Y'}"><b><font style="background:#FAAC58;">[S]</font></b> ******</c:if>
											<c:if test="${memo.priv ne 'Y'}"><c:if test="${memo.memoType ne '00010'}"><font color="#FF8888">[${memo.memoTypeNm}] </font></c:if>${memo.comment}</c:if>
										</div>
										
										<div class="mg0 pd0" style="width:30px;float:left;color:#5A5A66;"><c:if test="${fn:length(memo.comment)>=20}">&nbsp;...</c:if></div>						
										
										<div class="nameNdate" style="width:120px;float:right;" onclick="memoDivAjax(this,event,'${memo.sNb}','${memo.mainSnb}');">
											<c:if test="${memo.sttsCd eq '00001'}"><span class="first_contact_from"></span></c:if>
											<c:if test="${memo.sttsCd ne '00001'}"><span class="first_contact_to"></span></c:if>
											${memo.cstNm} | '${fn:replace(fn:substring(memo.tmDt,2,10),'-','.')}
										</div>
									</nobr>
								</a>
								<c:set var="totCnt" value="${totCnt+1}"/>
								</c:if>
								</c:if>
								</c:forEach>
								
							</div>
 							<c:if test="${fn:length(memoListNoRead) gt 5}">	<!-- 읽지않은 이전 업무보고 5건보다 많을경우 버튼 생성 -->
							<div class="" style="display:inline-block;text-align:center;width:100%;">
								<a href="javascript:setNoReadAllYn();" class="fold_down"><em>&nbsp;</em></a>
								<span style="color:#8d92a5;">전체 ${totCnt} 건</span>
							</div>
							</c:if>							
						</div>
						
					</c:if>
					<!-- ===================== 읽지 않은 업무보고 :E ===================== -->
				
					<c:if test="${userLoginInfo.permission gt '00019'  or  userLoginInfo.id eq tmpId}">
						<a onmouseup="memoDivAjax(this,event,'0','0');" style="display:inline-block;width:16px;height:16px;">
						
							 <img src="<c:url value='/images/edit-5-icon.png'/>" title="메모 입력"> 
						</a><br/>
					</c:if>


					<!-- ===================== 기존 최초작성 TM_DT 기준 (업무보고) :S ===================== -->
					<c:forEach var="memo" items="${memoList}" varStatus="status">
						<c:set var="Day_tmDt">${fn:substring(memo.tmDt, 8,10)}</c:set>
						<c:if test="${fn:contains(Day_tmDt, choiceDay)}">				<!-- 해당 일에 -->
							<c:set var="tb_note" value="${memo.comment}"/>
							<c:set var="memoView" value=""/>
							
							<c:choose>
								<c:when test="${userLoginInfo.name eq memo.name}">
									<c:choose>
									<%-- login한 사람 메모 --%>
										<c:when test="${(userLoginInfo.id eq memo.rgId) and ((memo.sttsCd eq null) or (memo.sttsCd eq ''))}">
											<span class="spanWidth">
												<input type="hidden" id="${cnt}priv${status.count}_${tm_count}" value="${memo.priv }"/>
												<!-- pass2P work.js 에 이벤트설정 -->
												<img class="pass2P memoChkIcon mail_send" id="${cnt}_btnPass_${status.count}_${tm_count}" src="<c:url value='/images/mail.png'/>" title="전달">
												<input type="hidden" value="${tb_note}"/>
											</span>
											
											<a class="clr${memo.importance}" onmouseup="memoDivAjax(this,event,'${memo.sNb}','${memo.mainSnb}');"<c:if test="${memo.priv == 'Y'}"> style="background:#FAAC58;border-radius:3px;"</c:if>>
												<c:if test="${memo.priv eq 'Y'}"><b>[S]</b> ******</c:if>
												<c:if test="${memo.priv ne 'Y'}"><c:if test="${memo.memoType ne '00010'}"><font color="#FF8888">[${memo.memoTypeNm}] </font></c:if>${fn:substring(tb_note,0,23)}<c:if test="${fn:length(tb_note) > 23}">...</c:if><c:if test="${fn:length(tb_note) < 1}">...</c:if></c:if>
												<!-- 댓글수 -->
												<c:set var="maxRP" value="0"/><c:set var="newReply" value="N"/>
												<c:forEach var="replyCmt" items="${replyList}" varStatus="rpS">
													<c:if test="${memo.sNb eq replyCmt.mainSnb}"><c:set var="maxRP" value="${maxRP+1}"/>
														<c:if test="${replyCmt.sttsCd eq '00001'}"><c:set var="newReply" value="Y"/></c:if>
													</c:if>
												</c:forEach><c:if test="${maxRP>0}">
												<span class="repleR">[<c:if test="${newReply eq 'Y'}"><img src="<c:url value='/images/n.gif'/>"></c:if>${maxRP}]</span></c:if>
												&nbsp;(t.${memo.grpMemOne}<c:if test="${memo.grpMemCnt gt 1}"> 외${memo.grpMemCnt-1}</c:if>)
											</a><br/>
										</c:when>
									<%-- login한 사람 메모 --%>
									<%-- 타인에게 받은 메모 --%>
										<c:otherwise>
											<span class="spanWidth">
												<c:if test="${memo.sttsCd=='00001'}"><img class="memoChkIcon" id="${cnt}image${status.count}" src="<c:url value='/images/warning.png'/>" title="미확인"></c:if>
												<c:if test="${memo.sttsCd=='00002'}"><img class="memoChkIcon" id="${cnt}image${status.count}" src="<c:url value='/images/accept.png' />" title="확인"></c:if>
											</span>
											
											<a class="clr${memo.importance}" class="clr${memo.importance}" onmouseup="memoDivAjax(this,event,'${memo.sNb}','${memo.mainSnb}');"<c:if test="${memo.priv == 'Y'}"> style="background:#FAAC58;"</c:if>>
												<c:if test="${memo.priv eq 'Y'}"><b>[S]</b> ******</c:if>
												<c:if test="${memo.priv ne 'Y'}"><c:if test="${memo.memoType ne '00010'}"><font color="#FF8888">[${memo.memoTypeNm}] </font></c:if>${fn:substring(tb_note,0,23)}<c:if test="${fn:length(tb_note) > 23}">..</c:if></c:if>
												<!-- 댓글수 -->
												<c:set var="rpyCnt" value="0"/>
												<c:forEach var="replyCmt" items="${replyList}" varStatus="rpS">
													<c:if test="${memo.mainSnb eq replyCmt.mainSnb}"><c:set var="rpyCnt" value="${rpyCnt +1}"/></c:if>	<%--  && replyCmt.sttsCd!='00002' --%>
												</c:forEach>
												<span class="repleR"><c:if test="${rpyCnt>0}">[</c:if><c:if test="${memo.sttsCd=='00001'}"><img src="<c:url value='/images/n.gif'/>"></c:if><c:if test="${rpyCnt>0}">${rpyCnt}]</c:if></span>
												&nbsp;(f.${memo.rgNm})
											</a><br/>
										</c:otherwise>
									<%-- 타인에게 받은 메모 --%>
									</c:choose>
								</c:when>

								<%-- 다른 사람의 메모 --%>
								<c:otherwise>
								<%-- 권한자 보이도록 (개발자, 내가 등록자, 대표, 동일부서장) --%>
								<c:if test="${userLoginInfo.permission gt '00020' or (userLoginInfo.id eq memo.rgId) or (userLoginInfo.id eq 'gjh') or (userLoginInfo.id eq 'mclee') or (memo.memoDeptId eq userLoginInfo.deptId and userLoginInfo.sabun eq userLoginInfo.deptMngr)}">
								
								<c:if test="${memo.priv eq 'N' or userLoginInfo.id eq memo.rgId}"><c:set var="memoView" value="memoV"/></c:if>
								<c:if test="${memoView eq 'memoV' }">
									<span class="spanWidth">
										<c:if test="${memo.sttsCd=='00001'}"><img class="memoChkIcon" id="${cnt}image${status.count}" src="<c:url value='/images/warning.png'/>" title="미확인"></c:if>
										<c:if test="${memo.sttsCd=='00002'}"><img class="memoChkIcon" id="${cnt}image${status.count}" src="<c:url value='/images/accept.png' />" title="확인"></c:if>
										<c:if test="${memo.sttsCd ne '00001' and memo.sttsCd ne '00002'}"><img class="memoChkIcon" id="${cnt}image${status.count}" src="<c:url value='/images/memo.png' />" ></c:if>
									</span>
									<a class="clr${memo.importance}" onmouseup="memoDivAjax(this,event,'${memo.sNb}','${memo.mainSnb}');"<c:if test="${memo.priv == 'Y'}"> style="background:#FAAC58;"</c:if>>
										<c:if test="${memo.priv eq 'Y'}"><b>[S]</b> ******</c:if>
										<c:if test="${memo.priv ne 'Y'}"><c:if test="${memo.memoType ne '00010'}"><font color="#FF8888">[${memo.memoTypeNm}] </font></c:if>${fn:substring(tb_note,0,23)}<c:if test="${fn:length(tb_note) > 23}">..</c:if></c:if>
										<%--${fn:substring(tb_note,0,23)}<c:if test="${fn:length(tb_note) > 23}">..</c:if> --%>
																				
										<!-- 댓글수 -->
										<c:set var="rpyCnt" value="0"/>
										<c:forEach var="replyCmt" items="${replyList}" varStatus="rpS">											
											<c:if test="${memo.name ne memo.rgNm}">
												<c:if test="${memo.mainSnb eq replyCmt.mainSnb}"><c:set var="rpyCnt" value="${rpyCnt +1}"/></c:if>	<%--  && replyCmt.sttsCd!='00002' --%>
											</c:if>
											<c:if test="${memo.name eq memo.rgNm}">
												<c:if test="${memo.sNb eq replyCmt.mainSnb}"><c:set var="rpyCnt" value="${rpyCnt +1}"/></c:if>
											</c:if>
										</c:forEach>
										<span class="repleR"><c:if test="${rpyCnt>0}">[</c:if><c:if test="${memo.sttsCd=='00001'}"><img src="<c:url value='/images/n.gif'/>"></c:if><c:if test="${rpyCnt>0}">${rpyCnt}]</c:if></span>
										<c:if test="${memo.name ne memo.rgNm}">
										&nbsp;(f.${memo.rgNm})
										</c:if>
										<c:if test="${memo.name eq memo.rgNm}">
										&nbsp;(t.${memo.grpMemOne}<c:if test="${memo.grpMemCnt gt 1}"> 외${memo.grpMemCnt-1}</c:if>
										</c:if>
										
									</a><br/>
								</c:if>
								
								</c:if>
								</c:otherwise>
								<%-- 다른 사람의 메모 --%>
							</c:choose>
						</c:if>
					</c:forEach>
					<!-- ===================== 기존 최초작성 TM_DT 기준 (업무보고) :E ===================== -->
					
					
					<!-- ===================== 댓글 RG_DT 기준 (업무보고)(최신댓글 일자에도 추가) :S ======== -->		<!-- 20170714 추가 -->
					<c:forEach var="memo" items="${memoReplyRgDtList}" varStatus="status">
						<c:set var="Day_tmDt">${fn:substring(memo.tmDt, 8,10)}</c:set>
						<c:if test="${fn:contains(Day_tmDt, choiceDay)}">				<!-- 해당 일에 -->
							<c:set var="tb_note" value="${memo.comment}"/>
							<c:set var="memoView" value=""/>
							
							<c:choose>
								<c:when test="${userLoginInfo.name eq memo.name}">
									<c:choose>
									<%-- login한 사람 메모 --%>
										<c:when test="${(userLoginInfo.id eq memo.rgId) and ((memo.sttsCd eq null) or (memo.sttsCd eq ''))}">
											<span class="spanWidth">
												<input type="hidden" id="${cnt}priv${status.count}_${tm_count}" value="${memo.priv }"/>
												<img class="pass2P memoChkIcon mail_send" id="${cnt}_btnPass_${status.count}_${tm_count}" src="<c:url value='/images/mail.png'/>" title="전달">
												<input type="hidden" value="${tb_note}"/>
											</span>
											
											<a class="clr${memo.importance}" onmouseup="memoDivAjax(this,event,'${memo.sNb}','${memo.mainSnb}');"<c:if test="${memo.priv == 'Y'}"> style="background:#FAAC58;border-radius:3px;"</c:if>>
												<c:if test="${memo.priv eq 'Y'}"><b>[S]</b> ******</c:if>
												<c:if test="${memo.priv ne 'Y'}"><c:if test="${memo.memoType ne '00010'}"><font color="#FF8888">[${memo.memoTypeNm}] </font></c:if>${fn:substring(tb_note,0,23)}<c:if test="${fn:length(tb_note) > 23}">...</c:if><c:if test="${fn:length(tb_note) < 1}">...</c:if></c:if>
												<!-- 댓글수 -->
												<c:set var="maxRP" value="0"/><c:set var="newReply" value="N"/>
												<c:forEach var="replyCmt" items="${replyList}" varStatus="rpS">
													<c:if test="${memo.sNb eq replyCmt.mainSnb}"><c:set var="maxRP" value="${maxRP+1}"/><!--  && replyCmt.sttsCd == '00001' -->
														<c:if test="${replyCmt.sttsCd eq '00001'}"><c:set var="newReply" value="Y"/></c:if>
													</c:if>													
												</c:forEach><c:if test="${maxRP>0}">
												<span class="repleR">[<c:if test="${newReply eq 'Y'}"><img src="<c:url value='/images/n.gif'/>"></c:if>${maxRP}]</span></c:if>
												&nbsp;(t.${memo.grpMemOne}<c:if test="${memo.grpMemCnt gt 1}"> 외${memo.grpMemCnt-1}</c:if>)
											</a><br/>
										</c:when>
									<%-- login한 사람 메모 --%>
									<%-- 타인에게 받은 메모 --%>
										<c:otherwise>
											<span class="spanWidth">
												<c:if test="${memo.sttsCd=='00001'}"><img class="memoChkIcon" id="${cnt}image${status.count}" src="<c:url value='/images/warning.png'/>" title="미확인"></c:if>
												<c:if test="${memo.sttsCd=='00002'}"><img class="memoChkIcon" id="${cnt}image${status.count}" src="<c:url value='/images/accept.png' />" title="확인"></c:if>
											</span>
											
											<a class="clr${memo.importance}" class="clr${memo.importance}" onmouseup="memoDivAjax(this,event,'${memo.sNb}','${memo.mainSnb}');"<c:if test="${memo.priv == 'Y'}"> style="background:#FAAC58;"</c:if>>
												<c:if test="${memo.priv eq 'Y'}"><b>[S]</b> ******</c:if>
												<c:if test="${memo.priv ne 'Y'}"><c:if test="${memo.memoType ne '00010'}"><font color="#FF8888">[${memo.memoTypeNm}] </font></c:if>${fn:substring(tb_note,0,23)}<c:if test="${fn:length(tb_note) > 23}">..</c:if></c:if>
												<!-- 댓글수 -->
												<c:set var="rpyCnt" value="0"/>
												<c:forEach var="replyCmt" items="${replyList}" varStatus="rpS">
													<c:if test="${memo.mainSnb eq replyCmt.mainSnb}"><c:set var="rpyCnt" value="${rpyCnt +1}"/></c:if>	<%--  && replyCmt.sttsCd!='00002' --%>
												</c:forEach><c:if test="${rpyCnt>0}">
												<span class="repleR">[<c:if test="${memo.sttsCd eq '00001'}"><img src="<c:url value='/images/n.gif'/>"></c:if>${rpyCnt}]</span></c:if>
												<c:if test="${memo.sttsCd=='00001'}"></c:if>												
												&nbsp;(f.${memo.rgNm})
											</a><br/>
										</c:otherwise>
									<%-- 타인에게 받은 메모 --%>
									</c:choose>
								</c:when>

								<%-- 다른 사람의 메모 --%>
								<c:otherwise>
								<%-- 권한자 보이도록 (개발자, 내가 등록자, 대표, 동일부서장) --%>
								<c:if test="${userLoginInfo.permission gt '00020' or (userLoginInfo.id eq memo.rgId) or (userLoginInfo.id eq 'gjh') or (userLoginInfo.id eq 'mclee') or (memo.memoDeptId eq userLoginInfo.deptId and userLoginInfo.sabun eq userLoginInfo.deptMngr)}">
								
								<c:if test="${memo.priv eq 'N' or userLoginInfo.id eq memo.rgId}"><c:set var="memoView" value="memoV"/></c:if>
								<c:if test="${memoView eq 'memoV' }">
									<span class="spanWidth">
										<c:if test="${memo.sttsCd=='00001'}"><img class="memoChkIcon" id="${cnt}image${status.count}" src="<c:url value='/images/warning.png'/>" title="미확인"></c:if>
										<c:if test="${memo.sttsCd=='00002'}"><img class="memoChkIcon" id="${cnt}image${status.count}" src="<c:url value='/images/accept.png' />" title="확인"></c:if>
										<c:if test="${memo.sttsCd!='00001' && memo.sttsCd!='00002'}"><img class="memoChkIcon" id="${cnt}image${status.count}" src="<c:url value='/images/memo.png' />" ></c:if>
									</span>
									<a class="clr${memo.importance}" onmouseup="memoDivAjax(this,event,'${memo.sNb}','${memo.mainSnb}');"<c:if test="${memo.priv == 'Y'}"> style="background:#FAAC58;"</c:if>>
										<c:if test="${memo.priv eq 'Y'}"><b>[S]</b> ******</c:if>
										<c:if test="${memo.priv ne 'Y'}"><c:if test="${memo.memoType ne '00010'}"><font color="#FF8888">[${memo.memoTypeNm}] </font></c:if>${fn:substring(tb_note,0,23)}<c:if test="${fn:length(tb_note) > 23}">..</c:if></c:if>
										<%--${fn:substring(tb_note,0,23)}<c:if test="${fn:length(tb_note) > 23}">..</c:if> --%>
										
										<!-- 댓글수 -->
										<c:set var="rpyCnt" value="0"/>
										<c:forEach var="replyCmt" items="${replyList}" varStatus="rpS">
											<c:if test="${memo.name ne memo.rgNm}">
												<c:if test="${memo.mainSnb eq replyCmt.mainSnb}"><c:set var="rpyCnt" value="${rpyCnt +1}"/></c:if>	<%--  && replyCmt.sttsCd!='00002' --%>
											</c:if>
											<c:if test="${memo.name eq memo.rgNm}">
												<c:if test="${memo.sNb eq replyCmt.mainSnb}"><c:set var="rpyCnt" value="${rpyCnt +1}"/></c:if>
											</c:if>
										</c:forEach>
										<span class="repleR"><c:if test="${rpyCnt>0}">[</c:if><c:if test="${memo.sttsCd=='00001'}"><img src="<c:url value='/images/n.gif'/>"></c:if><c:if test="${rpyCnt>0}">${rpyCnt}]</c:if></span>
										<c:if test="${memo.name ne memo.rgNm}">
										&nbsp;(f.${memo.rgNm})
										</c:if>
										<c:if test="${memo.name eq memo.rgNm}">
										&nbsp;(t.${memo.grpMemOne}<c:if test="${memo.grpMemCnt gt 1}"> 외${memo.grpMemCnt-1}</c:if>
										</c:if>
										
									</a><br/>
								</c:if>
								
								</c:if>
								</c:otherwise>
								<%-- 다른 사람의 메모 --%>
							</c:choose>
						</c:if>
					</c:forEach>
					<!-- ===================== 댓글 RG_DT 기준 (업무보고)(최신댓글 일자에도 추가) :E ======== -->		<!-- 20170714 추가 -->
					
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>


<!-- 약속자/공동진행 -->
	<div class="popUpMenu" id="selectstaffname" style="z-index:111;">
		<p class="closePopUpMenu" title="닫기">ⅹ닫기</p>

		<input type="hidden" id="infoDivCnt" value="">
		<div class="cent" id="slctStaffRdo" style="float:left">
		<c:forEach var="staff" items="${userList}" varStatus="ttStatus">
		<c:if test="${userLoginInfo.name!=staff.usrNm}">
			<input type="hidden" id="staffCstId${ttStatus.count }" value="${staff.cstId}">
			<span class="pd0 mg0 cent"><input type="radio" class="chbox0" id="chbox0_${ttStatus.count}" name="sndStaffName" value="${staff.usrNm}" ><label for="chbox0_${ttStatus.count}" class="checkR">${staff.usrNm}</label><br/></span>
		</c:if>
		</c:forEach>
		</div>
		<div class="bsnsR_btn" style="float:both;/* padding-left:64px; */">
			<span class="btn s green bold"><a id="saveBTN" onclick="saveStaffName()">선택</a></span>
			<span class="btn s  bold"><a id="cancleBTN" onclick="cancleStaffName()">취소</a></span><span style="display:inline-block;width:30px;"></span>
			<input type="text" id="SSN_0" style="height:0.5px;width:0.5px;border:0px none;padding:0;vertical-align:bottom;">
		</div>
	</div>
<!-- 약속자/공동진행 -->
<!-- 네트워크 -->
	<div>
		<c:forEach var="netP" items="${netpList}" varStatus="SnetP">
			<div class="popUpMenu title_area" id="${fn:substring(netP.tmDt, 8,10)}netP${SnetP.count}">
				<p class="closePopUpMenu" title="닫기">ⅹ닫기</p>
				<ul>
					<li class="c_note v-textarea">${fn:replace(netP.note, lf,"<br/>&nbsp;&nbsp;")}</li>
				</ul>
			</div>
		</c:forEach>
	</div>
	<div>
		<c:forEach var="dealIn" items="${dealInfoList}" varStatus="SdealIn">
			<div class="popUpMenu title_area" id="${fn:substring(dealIn.tmDt, 8,10)}dealIn${SdealIn.count}">
				<p class="closePopUpMenu" title="닫기">ⅹ닫기</p>
				<ul>
					<li class="c_note v-textarea">${fn:replace(dealIn.note, lf,"<br/>&nbsp;&nbsp;")}</li>
				</ul>
			</div>
		</c:forEach>
	</div>
<!-- 네트워크 -->

</div>
</body>
</html>