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
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css?ver=0.1'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/new_style.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/management.css'/>" rel="stylesheet" type="text/css"/>

<style>
div.manageTabon, div.subTabon {
    cursor: pointer;
    background: url(../images/cssimg/malis5tabon.gif) no-repeat;
    color: #535353;
    font-weight: bold;
    float: left;
    width: 90px;
    height: 26px;
    line-height: 29px;
    text-align: center;
    display: block;
    position: relative;
    z-index: 1;
}
div.manageTab, div.subTab {
    background: url(../images/cssimg/malis5tab.gif) no-repeat;
    color: #888;
    float: left;
    width: 90px;
    height: 26px;
    line-height: 29px;
    text-align: center;
    display: block;
    position: relative;
    z-index: 1;
}
div.manageTab:hover,div.subTab:hover {
	cursor: pointer;
	color: orange !important;
	background: url(../images/cssimg/malis5tabon.gif) no-repeat;
}
.title_icon_count {    
    padding: 0px 4px 0px 4px;
    border: #c0c5c9 solid 1px;
    border-radius: 2px;
    font-size: 11px!important;
    color: gray;
    vertical-align: middle;
    overflow: hidden;
    display: inline-block;
    margin-right: 0px;
    line-height: 15px;
    font-style:normal;
}
.investClick{
	background-color: #75c5de!important;
}

/* .sub_00000, .sub_00003, .sub_00009{
	margin-right:3px;
} */
.sub_00000, .sub_00006, .sub_00007{
	margin-right:3px;
}


.select_user_class{
	height:23px;
}

.btn_b_navy {
    background: #2963ad;
    font-weight: bold;
    color: #fff;
    border: #0b57a2 solid 1px;
    height: 24px;
    box-sizing: border-box;
    display: inline-block;
    font-size: 12px;
    min-width: 40px;
    border-radius: 2px;
}

.btn_b_red {
    background: red;
    font-weight: bold;
    color: #fff;
    border: #0b57a2 solid 1px;
    height: 24px;
    box-sizing: border-box;
    display: inline-block;
    font-size: 12px;
    min-width: 40px;
    border-radius: 2px;
}


.t_skinR00 > thead > tr:first-child > th:last-child {
    border-right: 0px;    
    border-top-right-radius: 10px;
}
.t_skinR00 > thead > tr:first-child > th:first-child {
    border-left: 0px;    
}
.t_skinR00 > tbody > tr:last-child > td:last-child {
    border-right: 0px;    
    border-bottom-right-radius: 10px;
}
.t_skinR00 > tbody > tr:last-child > td:first-child {
    border-left: 0px;    
}
.t_skinR00 > tbody > tr:last-child > td {
    border-bottom: 0px;    
}
.t_skinR00{
    border-bottom: 0px!important;    
}

.t_skinR00 > thead th {
    background-color: #43668e;
    border-top: 0px solid #102b33;
    border-left: 1px solid #3DACCD;
    border-right: 1px solid #13536d;
    border-bottom: 1px solid #3e6371;
    color: white;
}

.t_skinR00 > tbody > tr > td {
    border-right: 1px solid rgb(218, 227, 230);
    border-left: 1px solid #EBEDF1;
    border-bottom: 1px solid #EBEDF1;
}


.user_detail_table {
    letter-spacing: -0.1px;
    width: 100%;
    overflow: auto;
    border-top: #b1b5ba solid 1px;
    
}

.user_detail_table  tbody th {
    background: #dfe3e8;
    font-weight: normal;
    color: #33383f;
    line-height: 1.4;
    padding: 3px 3px 3px  6px;
    border-right: #b9c1ce solid 1px;
    border-bottom: #b1b5ba solid 1px;
    border-left: #b9c1ce solid 1px;
    font-size: 13px;
    vertical-align: middle;
    text-align:center;
    letter-spacing: -0.05em;
    font-weight:bold;
        height: 24px;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
.user_detail_table tbody td{
    border-right: #dadcdd solid 1px;
    border-bottom: #dadada solid 1px;
    border-left: #b9c1ce solid 1px;
    vertical-align: top;
    text-align: center;
    font-size: 12px;
    line-height: 1.4;
    color: #636c7f;
    letter-spacing: 0px;
    text-align:left;
    padding: 6px 8px 8px 10px;
}


.user_detail_table tbody tr:nth-child(2n) { background:#f7f7f7; }

.readyAnal{
 	background: #01bef9;
    font-weight: bold;
    color: #fff;
    border: #4aa1f7 solid 1px;
    /* height: 24px; */
    box-sizing: border-box;
    display: inline-block;
    /* font-size: 12px; */
    /* min-width: 49px; */
    border-radius: 2px;
    padding: 3px;
}

.ingAnal{
 	background: #007cff;
    font-weight: bold;
    color: #fff;
    border: #346da7 solid 1px;
    box-sizing: border-box;
    display: inline-block;
    padding: 3px;
    border-radius: 2px;
}
.finishAnal{
 	background: #33468e;
    font-weight: bold;
    color: #fff;
    border: #1c2563 solid 1px;
    box-sizing: border-box;
    display: inline-block;
    padding: 3px;
    border-radius: 2px;
}


.mgl15 {
    margin-left: 30px;
}


/* 왼족메뉴펼침버튼 */
.btn_leftmn_op1 {
    position: absolute;
    left: 28px;
    top: 8px;
    z-index: 1000;
    display: none;
    width: 55px;
}
.btn_leftmn_op1 a {
    background: url(../images/common/btn_snb_open.png) no-repeat;
    background-position: right;
    width: 25px;
    height: 27px;
    display: inline-block;
}
.btn_leftmn_op1 a em{
	display: none;
}
.btn_leftmn_op2 {
    position: absolute;
    left: 0px;
    top: 6px;
    z-index: 1004;
    width: 28px;
    height: 24px;
    background-color: #f3f3f3;
    border: #cfcfcf solid 1px;
    /* padding-top: 3px; */
    padding-left: 3px;
    margin-top: 2px;
    border-right: 0px;
}
.btn_leftmn_op3 {
	top: 0px;
	left: -10px;
    width: 38px;
    height: 23px;
}

</style>

<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js?ver=0.4'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/popUp.js?ver=0.1'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/changePage.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/calendar_beans_v2.0.js'/>" ></script>


<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 


<!-- 사용자 division -->
<c:set var="division" value="${userLoginInfo.division}"/>


<script>
var division ="${userLoginInfo.division}";

$(document).ready(function(){
	 
	 var divisionList= getCodeInfo(null,null,null,null,null,null,"/common/getDivisionList.do",null);
 	$("#divisionDiv").empty();
 	for(var i=0;i<divisionList.length;i++){
 		var str="";
 		str='<div id="userListDiv'+divisionList[i].divCode+'"></div>'
 		$("#divisionDiv").append(str);
 		getUserList(divisionList[i].divCode,divisionList[i].divName,divisionList.length); 
 	}
	 
	
	 $(".t_skinR00 tbody tr.bgOdd:odd").css("background-color", "#F6F9FB");
	 //$('.tabUnderBar').css('width','calc(100% - '+ parseInt(10 + 90*($('.1st').length)) +'px)');
	 var ttl = $('#total');
	 if(ttl.val()=='sellBuy') ttl.val('');
	 
	
	 //상단 높이에 따라 내용시작 높이 위치를 지정
	 $('#div_content').css('padding-top', $('#div_header').height());
	 
	 
	 
	//분석요청 클릭시 셀렉트 태그 나오고, 버튼없어짐
	$('.requestAnalBtn').click(function(){
	 	var obj = $(this).parent();
	 	obj.next('select').css('display','');
	 	obj.next('select').attr('multiple',true);
	 	obj.next('select').attr('size',10);
	 	obj.parent().children('a[id^=aCloseAnalBtn]').css('display','');	//x 버튼
	 	obj.css('display','none');
	 	
	});

	
	$('.selAnalUser').blur(function(){	
		$(this).css('display','none');
		$(this).parent().children('span').css('display','');
		
		$(this).parent().children('a[id^=aCloseAnalBtn]').css('display','none');	//x 버튼
	});
	 
 });

//분석요청 선택박스 닫기 버튼 클릭
function closeSelAnalUser(selId, aId){
	$('#'+selId).css('display','none');
	$('#'+selId).parent().children('span').css('display','');
	
	$('#'+aId).css('display','none');
}

//분석요청 선택박스 선택 이벤트 핸들러
function selAnalUserChange(th, offerId, cpnNm, cdNm){	
 	var obj = $(th);
 	
 	var userId = obj.val()[0];
	
	if(userId == ''){
		alert('분석 담당자를 선택해 주세요');
		return false;
	}
			
	var url = contextRoot + "/recommend/saveAnalyUser.do";
	
	var param = {
					userId : userId , 
					offerId : offerId,		//$("#offerSNB").val(), 
					cpnNm : cpnNm,			//$("#cpnNm").val(), 
					analyUserName :$("#"+obj.attr('id')+" option:selected").text(),
					cdNm : cdNm				//$("#cdNm").val() 
	};
		
	var callback = function(result){
		
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;		//결과수

		if(cnt>0){
			//alert("지정 완료 되었습니다.");
			//toast.push("지정 완료 되었습니다");
			document.modifyRec.submit();	//reload
		}else{
			alert("지정에 실패 하였습니다.");
			return;
		}
		
	};
	
	commonAjax("POST", url, param, callback, true); 	
};


function getUserList(divCode,divName,count){
		var url = contextRoot + "/work/selectuserList.do";
		var param = {division : divCode };

		    	    	
		var callback = function(result){
			var obj = JSON.parse(result);
			var cnt = obj.resultVal;		//결과수
			var list = obj.resultList;		//결과데이터JSON
			
			if(list.length>0){
				var str='';
				str+='<p class="pd0 mg0">';
				for(var i=0 ; i<list.length ;i++){
					str+=' <label for="chbox'+i+'" class="checkR"> ';
					str+=' <input type="checkbox" name="memoSndName" id="chbox'+i+'" value="'+list[i].usrNm+' " >'+list[i].usrNm+' </label>';
					 if(i%2==1){
						str+='</p><p class="pd0 mg0">';
					} 
				}
		
				str+='</p> ';
				if(count>1){
					str=' <p style="background-color:white;text-align:center;width:100%;"> <b>'+divName+'</b> </p>'+str;
				}
				$("#userListDiv"+divCode).html(str);
				
				
				//등록자별 딜 보기
				if(divCode=='${division}'){
					var newList = [{userName : '', userNm : '전체'}].concat(list);					
					var userSelectTag = createSelectTag('selSelectUser', newList, 'userName', 'userNm', '${selectUser}', 'userChngSelect(this);', [], 80, 'select_user_class');		
					$("#userSelectTag").html(userSelectTag);
				}
			}
		};
		commonAjax("POST", url, param, callback, true, null, null);
}


//등록자 변경
function userChngSelect(th){	
	$("#selectUser").val($(th).val());		//등록자
	document.modifyRec.submit();			//검색
}

//나의딜
function myChngSelect(nm){	
	$("#selectUser").val(nm);		//등록자
	document.modifyRec.submit();			//검색
}

function popUpStaffTable(divId, e, cnt){
	$('#TofferSnb').val($('#offerSnb'+cnt).val());
	$('#TstCnt').val(cnt);
	$('#test').find('input[name=memoSndName]:checked').each(function(){
		this.checked = false;
	});
	view(divId,e);
}
function pickStaff(){
	var names = '';
	$('#test').find('input[name=memoSndName]:checked').each(function(){
		if(names.length>0) names+=',';
		names+=this.value;
	});
	var data = {
			offerSnb : $('#TofferSnb').val()
			,memoSndName : names
	}, fn = function(arg){
		$('#staffsBtn'+$('#TstCnt').val()).children().html(arg);
		$(".popUpMenu").hide();
	};
	ajaxModule(data,"../work/mnaMatchingStaffs.do",fn);
}



//진행단계 리스트
function progressListPop(th, offerId, cpnId, cpnNm, rgId, rgNm, tmDt, dealSms, toNumber, categoryCd, progressCd, middleOfferCd){
	
	var detailStr = '';
	
	detailStr = '<table class="user_detail_table">';
	detailStr+='<colgroup><col width=100></colgroup>';
	detailStr+='<tr><th>진행단계 변경</th></tr>';
	
	
	detailStr+='<tr ';
	
	if(categoryCd != '00008'){		//M&A 가 아닐때	
		if(progressCd == '00001') detailStr+= 'style="background-color:skyblue;"';
		if(progressCd == '00002') detailStr+= 'style="background-color:lightgray;"';
		if(progressCd == '00003') detailStr+= 'style="background-color:#E94F51;"';
		if(progressCd == '10000'||progressCd == '10001'||progressCd == '10002') detailStr+= 'style="background-color:#5C5D5C;color:white;"';
		
	}else{
		if(progressCd == '00001') detailStr+= 'style="background-color:skyblue;"';
		if(progressCd == '00002' || progressCd == '00003' || progressCd == '00004' || progressCd == '00005') detailStr+= 'style="background-color:lightgray;"';
		if(progressCd == '00006') detailStr+= 'style="background-color:#E94F51;"';
		if(progressCd == '10000') detailStr+= 'style="background-color:#5C5D5C;color:white;"';
	}
	
	detailStr+='><td style="text-align:left;">';
	
	
	if(categoryCd != '00008'){		//M&A 가 아닐때
		
		if(middleOfferCd == '00004' || middleOfferCd == '00005')	//제안중
			detailStr+='<span class="btn m red" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'20000\',\'' + offerId + '\',\'' + rgId + '\')">딜이동</a></span>';
				
		if(progressCd != '00001'){
			detailStr+='<span class="btn m blue" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00001\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">';
			if(middleOfferCd == '00004' || middleOfferCd == '00005') detailStr+='딜제안중';		//제안중 일때는 '00001' == 딜제안중
			else detailStr+='진행';																//제안중 아닐때는 '00001' == 진행
			detailStr+='</a></span>';
		}	
			
		if(middleOfferCd != '00004' && middleOfferCd != '00005')	//제안중이 아닐때
			detailStr+='<span class="btn m red" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00003\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">투자결정</a></span>';
		if(progressCd != '00002')
			detailStr+='<span class="btn m gray" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00002\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">보류</a></span>';
		
		detailStr+='<span class="btn m black" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'10000\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">DROP</a></span>';
		detailStr+='<span class="btn m black" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'10001\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">타사투자</a></span>';
		detailStr+='<span class="btn m black" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'10002\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">발행취소</a></span>';
		
	}else{							//M&A 일때
		
		if(progressCd != '00001')
			detailStr+='<span class="btn m blue" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00001\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">대기</a></span>';
		
		detailStr+='<span class="btn m" style="margin-right:10px;"><a onclick="javascript:matchingCpn(\'' + offerId + '\')">SI추천</a></span>';
		detailStr+='<span class="btn m" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00003\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">미팅</a></span><span style="width:1px;display:inline-block"></span>';
		detailStr+='<span class="btn m" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00004\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">계약</a></span><span style="width:1px;display:inline-block"></span>';
		detailStr+='<span class="btn m" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00005\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">실사</a></span><span style="width:1px;display:inline-block"></span>';
		detailStr+='<span class="btn m red" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00006\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">투자결정</a></span><span style="width:1px;display:inline-block"></span>';
		detailStr+='<span class="btn m black" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'10000\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">DROP</a></span>';
		
	}
	
	
	detailStr+='</td></tr>';	
	detailStr += '</table>';

	
	$("#progressArea").html(detailStr);						//상세 팝업 세팅만.
	
	$("#divProgressCpnNm").html(cpnNm);
	
	var left = $(th).parent().offset().left - 340;
	var top = $(th).position().top + $(th).height(); 
	$("#progressFrame").css({display:"",left:left,top:top});
	
}


var gg_offerId = '';	//offerId		...global
function matchingCpn(offerId){
	gg_offerId = offerId;
	
	popUp('mc','c');
}
function afterMatchingCpn(){	
	/* var str = $("#AP_cpnNm_mc").html();
	str = '매칭회사: '+str;	
	$("#AP_cpnNm_mc").html(str);
	$(".match").removeClass('dspN');
	*/
	var DATA = {
			 sNb:		gg_offerId			//$("#offerSNB").val()
			,matchCpn: 	$("#AP_cpnId_mc").val()
			,progressCd: '00002'
			//,rgId: $('#rgstId').val()
		}
	, URL = "<c:url value='/work/changeprogressCdNmatchCpn.do'/>"
	, fn = function(){
			document.modifyRec.submit();
		};
	ajaxModule(DATA,URL,fn);
}

function progressBTN(categoryCd,val,snb,rgId,rgNm,cpnNm,tmDt,dealSms,toNumber,th,e){
	var DATA,URL;
	if(val=='20000'){
		
		if(!confirm("딜이동 하시겠습니까?")) return;			//확인후 진행
		
		DATA = {
				 sNb: snb					//$("#offerSNB").val()
				,middleOfferCd: '00001'
				,offerCd: '00007'
				,rgId: rgId					//$('#rgstId').val()
		};
		URL = "<c:url value='/work/changeMiddleOfferCd.do'/>";
		
	}else{
		
		var progressNm = "";
		if("00001" == val){ 	  progressNm = "진행";
		}else if("00002" == val){ progressNm = "보류";
		}else if("00003" == val){
			progressNm = "투자결정";
			if(categoryCd == '00008') progressNm = "미팅";
			<%--
			<c:if test="${recommendInfo[0].categoryCd == '00008'}">		//M&A
			progressNm = "미팅";
			</c:if>
			--%>	
		}else if("00004" == val){ progressNm = "계약";
		}else if("00005" == val){ progressNm = "실사";
		}else if("00006" == val){ progressNm = "투자결정";
		}else if("10000" == val){ progressNm = "DROP";
		//else if("20000" == val) progressNm = "딜이동";
		}else if("10001" == val){ progressNm = "타사투자";
		}else if("10002" == val){ progressNm = "발행취소";
		}
		
		if(!confirm(progressNm + " 하시겠습니까?")) return;	//확인후 진행
		
		
		var smsMsg = "[딜상태- " + progressNm + "] " + cpnNm;
		<%--smsMsg += '<c:forEach var="cmmCd" items="${cmmCdCategoryList}"><c:if test="${recommendInfo[0].categoryCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach>';--%>
		smsMsg += '(등록일:' + tmDt + ') 의 상태가 ${userLoginInfo.name}님에 의해 ' + progressNm + '(으)로 변경되었습니다.';
		
		
		//--------------------- SMS발송 :S ---------------------- 20160510
		if(rgNm != '${userLoginInfo.name}' && dealSms == 'Y'){			//상태변경자가 딜 등록자 본인인 경우에는 skip 	
			if(getByteLength(smsMsg) > 80){
				document.frmSMS.sendType.value = 5;		//LMS
			}else{
				document.frmSMS.sendType.value = 3;		//SMS
			}
			document.frmSMS.contents.value = smsMsg;
			document.frmSMS.toNumber.value = toNumber;
			document.frmSMS.submit();		//SMS발송(등록자에게)
		}
		//--------------------- SMS발송 :E ----------------------
		
		
		DATA = {
				 sNb: snb		//$("#offerSNB").val()
				,progressCd: val
				,progressNm: progressNm
				,rgId: rgId		//$('#rgstId').val()				
				,cpnNm : cpnNm
				,rgNm: rgNm		//$('#RegName').val()
				,memo: smsMsg
				
				,usrId: rgId	//딜 등록자 usr_id
		};
			
		URL = "<c:url value='/work/changeprogressCd.do'/>";
		
	}
	var fn = function(){
			//if(val=='00003' && categoryCd != '00008') disposalModal(snb,th,e);
			//else 
				document.modifyRec.submit();
		};
	ajaxModule(DATA,URL,fn);
}

//문자열 byte 길이
function getByteLength(str){
	var size = 0;
	for(var i=0; i<str.length; i++){
		size++;
		if(44032 <= str.charCodeAt(i) && str.charCodeAt(i) <= 55203)
			size++;
		if(12593 <= str.charCodeAt(i) && str.charCodeAt(i) <= 12686)
			size++;
	}
	return size;
}


//분석자 리스트
function getAnalyList(th,offerId,companyId,tmDt,cpnNm){
	
	
	var url = contextRoot + "/recommend/getAnalyUserList.do";
	var param = {
				offerId :offerId,
				cpnId : companyId,
				tmDt : tmDt
	
		};
	var callback = function(result){
		
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;		//결과수
		var list = obj.resultList;		//결과데이터JSON
		
		var str = [];
		var detailStr = '';
		
		detailStr = '<table class="user_detail_table">';
		detailStr+='<colgroup>';
		detailStr+='<col width=60>';
		detailStr+='<col width=100>';
		detailStr+='<colgroup>';
		detailStr+='<tr><th>분석자</th>';
		detailStr+='<th>진행상태</th>';
		detailStr+='</tr>';
		
		if(list.length>0){
			
			
		
			for(var i=0;i<list.length;i++){
				var endText = '<span class="ingAnal">분석요청중</span>';
				if(parseInt(list[i].analCount) > 0){
					endText ='<span class="finishAnal">분석완료</span>';
				}
				
				detailStr+='<tr><td><strong>'+list[i].userNm+'</strong></td>';
				detailStr+='<td style="text-align:center;">'+endText+'</td>';
				//detailStr+='<td style="text-align:center;"><input type="button" class="btn_b_skyblue" style="color:black;"  value="삭제" onclick="deleteAnalyUser('+list[i].analUserId+');"/></td><tr>';
				
			}
			
			
		}else{
			detailStr+='<td colspan="3" style="text-align:center;">지정된 담당자가 없습니다.</td>';
		}
		
		detailStr += '</table>';
	
		
		$("#userDtTableArea").html(detailStr);						//상세 팝업 세팅만.
		
		$("#divAnalUserCpnNm").html(cpnNm.substring(0,13));
		
		var left = $(th).parent().offset().left-60;
		var top = $(th).position().top + $(th).height(); 
		$("#userDetailArea").css({display:"",left:left,top:top});
		
	};
	
	commonAjax("POST", url, param, callback, false);		// false (sync 처리)
}




//투자심의 팝업
var myModal = new AXModal();		// instance

function investPopup(count, sNb, cpnNm, progressCd){			//딜 제안중 등록 팝업
	
	//누른 딜 스타일주기
	$('#investTr' + count).addClass('investClick');
	
	
	var url = "<c:url value='/work/investPopup.do'/>";
   	var params = {'sNb':sNb,
   				  'cpnNm': cpnNm,
   				  'progressCd': progressCd
   					};
   	
   	myModal.setConfig({windowID:"myModalCT",
   					   onclose:function(){
   						   	//누른 딜 스타일원복
   							$('#investTr' + count).removeClass('investClick');}});		//close callback.
   	       	
   	myModal.open({
   		url: url,
   		pars: params,
   		titleBarText: ' 투자심의&nbsp; [ ' + cpnNm + ' ]',		//titleBarText 속성 추가하였음.(원 Axisj에는 없었던것)
   		method:"POST",
   		top: 150 + $(document).scrollTop(),
   		width: 700,
   		closeByEscKey: true				//esc 키로 닫기   		
   	});
   	
   	$('#myModalCT').draggable();
	
}


//인물정보 팝업
function slctCst_this(sNb){
	
	window.open("", "popup_window", "width=900, height=700, scrollbars=auto");
	
	if($(".popUpBtn").css("display")=="none") return;
	$('#s_Name').val(sNb);
	var frm = document.getElementById('customerName');//sender form id
	frm.target = "popup_window";//target		
	frm.submit();
}



//유형 변경 팝업
function categoryListPop(th, offerId, cpnId, cpnNm, rgId, rgNm, tmDt, dealSms, toNumber, categoryCd, progressCd, middleOfferCd){
	
	var detailStr = '';
	
	detailStr = '<table class="user_detail_table">';
	detailStr+='<colgroup><col width=100></colgroup>';
	detailStr+='<tr><th>진행단계 변경</th></tr>';
	
	
	detailStr+='<tr ';
	
	if(categoryCd != '00008'){		//M&A 가 아닐때	
		if(progressCd == '00001') detailStr+= 'style="background-color:skyblue;"';
		if(progressCd == '00002') detailStr+= 'style="background-color:lightgray;"';
		if(progressCd == '00003') detailStr+= 'style="background-color:#E94F51;"';
		if(progressCd == '10000'||progressCd == '10001'||progressCd == '10002') detailStr+= 'style="background-color:#5C5D5C;color:white;"';
		
	}else{
		if(progressCd == '00001') detailStr+= 'style="background-color:skyblue;"';
		if(progressCd == '00002' || progressCd == '00003' || progressCd == '00004' || progressCd == '00005') detailStr+= 'style="background-color:lightgray;"';
		if(progressCd == '00006') detailStr+= 'style="background-color:#E94F51;"';
		if(progressCd == '10000') detailStr+= 'style="background-color:#5C5D5C;color:white;"';
	}
	
	detailStr+='><td style="text-align:left;">';
	
	
	if(categoryCd != '00008'){		//M&A 가 아닐때
		
		if(middleOfferCd == '00004' || middleOfferCd == '00005')	//제안중
			detailStr+='<span class="btn m red" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'20000\',\'' + offerId + '\',\'' + rgId + '\')">딜이동</a></span>';
				
		if(progressCd != '00001'){
			detailStr+='<span class="btn m blue" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00001\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">';
			if(middleOfferCd == '00004' || middleOfferCd == '00005') detailStr+='딜제안중';		//제안중 일때는 '00001' == 딜제안중
			else detailStr+='진행';																//제안중 아닐때는 '00001' == 진행
			detailStr+='</a></span>';
		}	
			
		if(middleOfferCd != '00004' && middleOfferCd != '00005')	//제안중이 아닐때
			detailStr+='<span class="btn m red" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00003\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">투자결정</a></span>';
		if(progressCd != '00002')
			detailStr+='<span class="btn m gray" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00002\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">보류</a></span>';
		
		detailStr+='<span class="btn m black" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'10000\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">DROP</a></span>';
		detailStr+='<span class="btn m black" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'10001\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">타사투자</a></span>';
		detailStr+='<span class="btn m black" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'10002\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">발행취소</a></span>';
		
	}else{							//M&A 일때
		
		if(progressCd != '00001')
			detailStr+='<span class="btn m blue" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00001\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">대기</a></span>';
		
		detailStr+='<span class="btn m" style="margin-right:10px;"><a onclick="javascript:matchingCpn(\'' + offerId + '\')">SI추천</a></span>';
		detailStr+='<span class="btn m" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00003\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">미팅</a></span><span style="width:1px;display:inline-block"></span>';
		detailStr+='<span class="btn m" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00004\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">계약</a></span><span style="width:1px;display:inline-block"></span>';
		detailStr+='<span class="btn m" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00005\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">실사</a></span><span style="width:1px;display:inline-block"></span>';
		detailStr+='<span class="btn m red" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'00006\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">투자결정</a></span><span style="width:1px;display:inline-block"></span>';
		detailStr+='<span class="btn m black" style="margin-right:10px;"><a onclick="javascript:progressBTN(\'' + categoryCd + '\',\'10000\',\'' + offerId + '\',\'' + rgId + '\',\'' + rgNm + '\',\'' + cpnNm + '\',\'' + tmDt + '\',\'' + dealSms + '\',\'' + toNumber + '\',this,event)">DROP</a></span>';
		
	}
	
	
	detailStr+='</td></tr>';	
	detailStr += '</table>';

	
	$("#progressArea").html(detailStr);						//상세 팝업 세팅만.
	
	$("#divProgressCpnNm").html(cpnNm);
	
	var left = $(th).parent().offset().left - 340;
	var top = $(th).position().top + $(th).height(); 
	$("#progressFrame").css({display:"",left:left,top:top});
	
}


//왼쪽메뉴 펼침
function viewLeft(){
	parent.leftIframeON();	
	parent.resize_iframe();	
}

</script>

<style>
tbody tr:hover{background-color: moccasin !important;}
</style>

</head>

<input type="hidden" id="AP_cpnId_mc" name="AP_cpnId_mc" value="">

<!-- ---------------------- 문자 발송 관련 :S ------------------------ -->
<iframe id="iframeSMS" name="iframeSMS" style="display:none"></iframe>
<form id="frmSMS" name="frmSMS" action="https://biz.moashot.com/EXT/URLASP/mssendUTF.asp" method="post" target="iframeSMS">	
	<input type="hidden" name="uid" id="uid" value="synergy"/>
	<input type="hidden" name="pwd" id="pwd" value="00synergy00"/>
	<input type="hidden" name="returnUrl" id="returnUrl" value="http://106.250.177.91:8280/SynergyCus/SMSSendResult.do"/>
	<input type="hidden" name="sendType" id="sendType" value="3"/>	<!-- 3:단문, 5:장문 -->
	<input type="hidden" name="toNumber" id="toNumber" value=""/>
	<input type="hidden" name="contents" id="contents" value="테스트문구"/>
	<input type="hidden" name="fromNumber" id="fromNumber" value="025865981"/>
	<input type="hidden" name="startTime" id="startTime" value=""/>
	<input type="hidden" name="indexCode" id="indexCode" value=""/>
	<input type="hidden" name="returnType" id="returnType" value="0"/>
	<input type="hidden" name="nType" id="nType" value="2"/>	
</form>
<!-- ---------------------- 문자 발송 관련 :E ------------------------ -->

<body>


<!-- 진행단계 팝업 -->
<div style="display:none;position:absolute; width: 480px;  height: expression( this.scrollHeight > 99 ? 200px : auto ); border:2px solid #cccccc;  background-color:white; z-index:9;" id="progressFrame">
	<div style="background:#51565f;padding:3px;height:15px;">
		<div id="divProgressCpnNm" style="float:left;color:white;"></div>
		<div class="hov" style="margin-right:10px;color:white;cursor:pointer;float:right;" onclick="$('#progressFrame').hide();"><strong>&nbsp;X</strong></div>
	</div>
	<div id="progressArea" style="width:95%;margin:auto;margin-top:10px;margin-bottom:10px;vertical-align:top;"></div>
</div>
<!-- //진행단계 팝업// -->

<!-- 분석 담당자 상세 팝업 -->
<div style="display:none;position:absolute; width: 180px;  height: expression( this.scrollHeight > 99 ? 200px : auto ); border:2px solid #cccccc;  background-color:white; z-index:9;" id="userDetailArea">
	<div style="background:#51565f;padding:3px;height:15px;">
		<div id="divAnalUserCpnNm" style="float:left;color:white;"></div>
		<div class="hov" style="margin-right:10px;color:white;cursor:pointer;float:right;" onclick="$('#userDetailArea').hide();"><strong>&nbsp;X</strong></div>
	</div>
	<div id="userDtTableArea" style="width:90%;margin:auto;margin-top:10px;margin-bottom:10px;"></div>
</div>
<!-- //분석 담당자 상세 팝업// -->

<!-- 인물정보 팝업위한 폼 -->
<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
	<input type="hidden" name="popupYn" value="Y">
</form>


<div id="wrap" class="content_box">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<c:set var="now" value="<%= new java.util.Date() %>"/>
<fmt:formatDate var="curDate" value='${now}' pattern='yyyy-MM-dd'/>
	<section>
		<article>
		
		<c:set var="now" value="<%= new java.util.Date() %>"/>
		<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
		
		<input type="hidden" id="SendReceive" value="">
		
		<div id="div_header" class="fixed-top" style="z-index:10;">
		
		<!-- 상단 검색 -->
		<form id="modifyRec" name="modifyRec" action="<c:url value='/work/selectWorkAllDeal.do' />" method="post">
			<input type="hidden" name="sorting" id="sorting" value="${TAB}">
			<input type="hidden" name="total" id="total" value="${ttT}">
			<input type="hidden" name="selectUser" id="selectUser" value="${selectUser}">

			
			<header>
			<div class="carSearchBox" style="width:97%; margin:10px 0px 5px 0px; padding: 7px 10px 10px 0px;">
				<form name="dayForm" id="dayForm" method="post" action="<c:url value='/work/selectWorkAllDeal.do' />">
				<div>
					
					<span class="btn_leftmn_op3" style="display:inline;cursor:pointer;" onclick="viewLeft();">
					<span class="btn_leftmn_op2">메뉴</span>
					<span class="btn_leftmn_op1" id="btnLeftMenuShow" style="display:inline;">
						<a href="#" title="왼쪽 메뉴 보기"><em>왼쪽메뉴 보이기</em></a>
					</span>
					</span>
					
					<span class="carSearchtitle" style="padding-left:70px;">기간</span>
			     	<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
			     	<!-- <span> -->
			     		<select name='choice_year' onchange="javascript:document.modifyRec.submit();" class="selUserStyle1" style="height:25px;">
							<c:forEach var="year" begin="2011" end="${cur_year}">
								<option value="${year}"
								<c:choose>
									<c:when test="${choice_year == null}"><c:if test="${year == cur_year}">selected</c:if>></c:when>
									<c:otherwise><c:if test="${year == choice_year}">selected</c:if>></c:otherwise>
								</c:choose> 
								${year-1}~${year}</option>
							</c:forEach>
						</select>
			     	<!-- </span> -->
			        
			        <span class="carSearchtitle mgl15">진행단계</span>
			        <input type="button" class="btn_b_navy mgl5 hand" onclick="sortTable(<c:choose><c:when test="${ttT eq 'total'}">'nototal'</c:when><c:otherwise>'total'</c:otherwise></c:choose><c:if test='${not empty TAB}'>,'${TAB}'</c:if>);" style="color:white;<c:if test="${ttT eq 'total'}">color:orange;</c:if>" value="전체">
			        <span class="carSearchtitle mgl15">회사명</span>
			        <input type="search" class="input_b " id="nameSearch" name="search" autofocus="autofocus" style="width:180px;font-size:13px;padding-left:3px;">
					<input type="submit" class="btn_b_skyblue mgl5" style="color:black;" value="검색">
				
				</div>
				</form>
			</div>	
			
			</header>
		</form>
		<!-- //상단 검색// -->
		
		<c:set var='allDeal' value=""/>
		<div class="clear" style="height:5px;"></div>	
		<div class="clear" style="width:10px;float:left;height:25px;border-bottom:1px solid #CCC;"></div>	
		<%--<c:if test="${catePer.cdSort2=='00006' && catePerS.count==6}"><div class="1st subTab<c:if test="${empty TAB}">on</c:if>" onclick="sortTable()">딜</div></c:if> --%>
		<!-- <c:if test="${userLoginInfo.division eq 'SYNERGY'}">
			<div class="1st subTab<c:if test="${empty TAB}">on</c:if>" onclick="sortTable()">메자닌_상장</div>
		</c:if>
			<div class="1st subTab<c:if test="${TAB eq '00004'}">on</c:if>" onclick="sortTable('00004')">딜제안중</div>
			<div class="1st subTab<c:if test="${TAB eq 'T1'}">on</c:if>" onclick="sortTable('T1')">블록딜(WRT)</div>
		<c:if test="${userLoginInfo.division eq 'SYNERGY'}">
			<div class="1st subTab<c:if test="${TAB eq 'no_listed'}">on</c:if>" onclick="sortTable('no_listed')">메자닌_비상장</div>
		</c:if>-->
			
		<!-- 탭 -->
		<div>
			<c:forEach var="tabPer" items="${cmmCdAllDealTabList}" varStatus="tabPerS">
				<%-- ========== 탭메뉴 권한 : case 1. 비상장 메자닌(mezzN) = 'Y'(허용자) : 모든 탭메뉴 허용
											 case 2. 비상장 메자닌(mezzN) = 'N'(불가자) : 프리IPO('00005'), 벤처('00006') 2가지 메뉴만 허용 ========= --%>
				<c:if test="${mezzN ne 'N' or (tabPer.dTailCd eq '00005' or tabPer.dTailCd eq '00006')}">
				
					<c:choose>
					<%-- ========== 탭메뉴 권한 : 메자닌_상장(00001), 메자닌_비상장(00004)는 시너지(division eq 'SYNERGY')만 허용 ========= --%>
					<c:when test="${tabPer.dTailCd eq '00001' or tabPer.dTailCd eq '00004'}">
						<c:if test="${userLoginInfo.division eq 'SYNERGY'}">
							<div class="1st sub_${tabPer.dTailCd} subTab<c:if test="${TAB eq tabPer.dTailCd}">on</c:if>" onclick="sortTable('${tabPer.dTailCd}')">${tabPer.cdNm}</div>
						</c:if>
					</c:when>
					<c:otherwise>
						<div class="1st sub_${tabPer.dTailCd} subTab<c:if test="${TAB eq tabPer.dTailCd}">on</c:if>" onclick="sortTable('${tabPer.dTailCd}')">${tabPer.cdNm}</div>
					</c:otherwise>
					</c:choose>
				
				</c:if>
			</c:forEach>
		</div>
		<!-- //탭// -->
			
		<!-- 등록자 검색 -->
		<div style="float:right;margin-right: 20px;">
			<div style="display:inline-block;margin-right:5px;font-size:12px;">
				<strong style="color:#0b208c;">등록자</strong> 
				<span id="userSelectTag"></span>
			</div>
			
			
			<div style="display:inline-block;margin-left:10px;" ><input type="button" class="btn_b_skyblue  mgl5" style="color:black;" onclick="javascript:myChngSelect('');" value="전체"/></div>
			<div style="display:inline-block;margin-left:2px;"><input type="button" class="btn_b_skyblue  mgl5" style="color:black;"onclick="javascript:myChngSelect('${userLoginInfo.name}');" value="나의 딜"/></div>
			
		</div>
		<!-- //등록자 검색// -->
			
		<!-- <div class="tabUnderBar" style="height:25px;border-bottom:1px solid #CCC;width:100%;">&nbsp;</div>
		 -->
			 
		<!--table header-->
		 
		<table class="t_skinR00" style="table-layout:fixed;">
			
			
			<colgroup>
				<col width="70">
				<col width="64">
			<c:if test="${TAB ne '00005' and TAB ne '00007'}">
				<col width="80">
			</c:if>
			<c:if test="${TAB eq '00005' or TAB eq '00007'}">
				<col width="100">
				<col width="70">
			</c:if>
				<col width="99">
				<col width="40">
				<col width="250">
			<c:if test="${TAB eq '00007'}">
				<col width="80">
				<col width="80">
				<col width="80">
			</c:if>
				<col width="45">
				<col width="122">
			<c:if test="${TAB ne '00007'}">
				<col width="80">
			</c:if>
			<c:if test="${TAB ne '00007'}">	<%-- and TAB ne '00002' --%>
				<col width="50">
			</c:if>
				<col width="60">
				<col width="45">
			</colgroup>
			
			<thead>
				<tr>
					<th style="height:20px" class="bgYlw">제안일자</th>
					<th class="bgYlw">결정시한</th>
					<th class="bgYlw pd0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${TAB eq '00005' or TAB eq '00007'}"><span class="hand" onclick="sortTable('sellBuy','${TAB}');">▼</span></c:if></th>
					<c:if test="${TAB eq '00005' or TAB eq '00007'}">
					<th class="bgYlw pd0">업종</th>
					</c:if>
					<th class="bgYlw pd0">규모(발행 <b>/</b> 투자)&nbsp;</th>
					<th class="bgYlw pd0">유형</th>
					<th class="bgYlw pd0">업무제목</th>
					<c:if test="${TAB eq '00007'}">
					<th class="bgYlw pd0">진행사항</th>
					<th class="bgYlw pd0">매칭회사</th>
					<th class="bgYlw pd0">진행자</th>
					</c:if>
					<th class="bgYlw pd0">중개인</th>
					
					<th class="bgYlw pd0">투자의견</th>						
					<c:if test="${TAB ne '00007'}">
					<th class="bgYlw pd0">투자심의
					<c:if test="${TAB eq '00000'}">/ 매칭회사</c:if>
					</th>					
					</c:if>
					<c:if test="${TAB ne '00007'}">		<%-- and TAB ne '00002' --%>
					<th class="bgYlw pd0">진행단계</th>
					</c:if>
					<th class="bgYlw pd0">분석자</th>	<%-- style="color: #ffe200;" --%>
					<th class="bgYlw pd0">등록자<c:if test="${TAB eq '00002'}"></br>(딜제안자)</c:if></th>
				</tr>
				<tr style="height:1px;"></tr>
			</thead>
			</table>
		</div>
		<!--// table header //-->
		
		<!-- data table -->	
		<div id="div_content" style="padding-top:105px;">
		<table class="t_skinR00" style="table-layout:fixed;">
			<colgroup>
				<col width="70">
				<col width="64">																			<!-- 제안일자, 결정시한 -->
			<c:if test="${TAB eq '00005' or TAB eq '00007'}">
				<col width="60">
			</c:if>																							<!-- 구분 (프리IPO, M&A) -->
			<c:if test="${TAB ne '00007' and TAB ne '00005'}">
				<col width="80">
			</c:if>																							<!-- 구분 (외,) -->
			<c:if test="${TAB eq '00005' or TAB eq '00007'}">
				<col width="40">
				<col width="70">
			</c:if>																							<!-- 구분일부 와 업종 (프리IPO, M&A) -->
				<col width="99">
				<col width="40">
				<col width="250">																			<!-- 규모, 업무제목 -->
			<c:if test="${TAB eq '00007'}">
				<col width="80">
				<col width="80">
				<col width="80">
			</c:if>																							<!-- 진행사항, 매칭회사, 진행자 (M&A 관련 정보들) -->
				<col width="45">																			<!-- 중개인 -->
				<col width="122">																			<!-- 투자의견 -->
			<c:if test="${TAB ne '00007'}">																	<!-- M&A 외 -->
				<col width="80">																			<!-- 투자심의 -->
				<col width="50">																			<!-- 진행단계 -->
			</c:if>
				<col width="60">																			<!-- 분석자 -->
				<col width="45">																			<!-- 등록자 -->
			</colgroup>
			<tbody>
			<%-- 입력한 당일만 삭제 가능하게 작업 --%>
			
				<c:forEach var="offer" items="${offerList}" varStatus="status">
				
				
					<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :S  ================== --%>
					<c:choose>
					<c:when test="${mezzL eq 'Y'}">
						<c:set var="asterDeal" value="N"/>
					</c:when>		<%-- 내가 등록한 딜이 아니면서 --%>		<%--             상장사 이고			 --%>		<%--						메자닌 (CB, EB, BW, RCPS) 이고																		 --%>	<%--	진행중 인 건		 --%>		<%--						제안중이 아니고					 --%>
					<c:when test="${offer.rgId ne userLoginInfo.id and ('A' eq offer.cpnStts or 'Q' eq offer.cpnStts) and (offer.categoryCd eq '00001' or offer.categoryCd eq '00002' or offer.categoryCd eq '00003' or offer.categoryCd eq '00015')  and (offer.progressCd eq '00001' or offer.progressCd eq '00002')}">	<%-- and (offer.middleOfferCd ne '00004' and offer.middleOfferCd ne '00005') --%>
						<c:set var="asterDeal" value="Y"/>	<%-- 별표시(숨김) --%>
					</c:when>
					<c:otherwise>
						<c:set var="asterDeal" value="N"/>
					</c:otherwise>
					</c:choose>
					<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :E  ================== --%>
				
				
					<c:choose>
					
					
					<c:when test="${offer.rgId ne userLoginInfo.id and ((offer.categoryCd ne '00008' and offer.infoLevel lt userLoginInfo.infoLevel)||(offer.categoryCd eq '00008' and offer.infoLevel lt userLoginInfo.mnaLevel))}">
					<!-- 보안등급이 나의 등급보다 높고 내가 등록한게 아니면 안보인다. -->
					</c:when>
					
					<c:otherwise>
				
				
					<c:set var="mnaYN" value="N"/><c:if test="${offer.categoryCd eq '00008'}"><c:set var="mnaYN" value="Y"/></c:if>
					
					<c:set var="dueDate" value="${offer.dueDt}" scope="page"/>
					<tr id="investTr${status.count}" class="<c:if test="${dueDate <= curDate}"> red</c:if>
						
						<c:if test="${mnaYN eq 'Y'}">
							<c:if test="${offer.progressCd eq '00001' or offer.progressCd eq '00002'}"> bgOdd</c:if>"
							<c:choose>
								<c:when test="${offer.progressCd == '10000'}"> style="height:40px;background-color:#B9B9B9" </c:when>
								<c:otherwise>  <c:if test="${offer.progressCd ne '00004' and offer.progressCd ne '00006'}">style="height:40px;"</c:if><c:if test="${offer.progressCd eq '00004'}">style="height:40px;background-color:#DCEACE"</c:if><c:if test="${offer.progressCd == '00006'}">style="height:40px;background-color:#A9F5BC"</c:if><%-- <c:if test="${fn:length(offer.cpnId) == 7}"> style="background-color:#CEF6EC"</c:if> --%></c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${mnaYN eq 'N'}">
							<c:if test="${offer.progressCd eq '00001'}"> bgOdd</c:if>"
							<c:choose>
								<c:when test="${offer.progressCd == '10000'}"> style="height:40px;background-color:#B9B9B9" </c:when>
								<c:when test="${offer.progressCd == '10001'}"> style="height:40px;background-color:#AAAAAA" </c:when>
								<c:when test="${offer.progressCd == '10002'}"> style="height:40px;background-color:#999999" </c:when>
								<c:otherwise>  <c:if test="${offer.progressCd ne '00002' and offer.progressCd ne '00003'}">style="height:40px;"</c:if><c:if test="${offer.progressCd == '00002'}">style="height:40px;background-color:#E7E7E7"</c:if><c:if test="${offer.progressCd == '00003'}">style="height:40px;background-color:#A9F5BC"</c:if><%-- <c:if test="${fn:length(offer.cpnId) == 7}"> style="background-color:#CEF6EC"</c:if> --%></c:otherwise>
							</c:choose>
						</c:if>
					><%-- tr end --%>
					
						<td class="cent pd0" style="width:74px;color:black;">${offer.tmDt}</td>
					<input type="hidden" id="offerSnb${status.count}" value="${offer.sNb}">
						<td class="cent pd0" style="width:80px">${offer.dueDt}<br/><c:if test="${dueDate <= curDate and offer.progressCd != '10000'}"> <span class="btn s red"><a><font color="yellow">!</font> 지연 : -${offer.diffDt}</a></span></c:if></td>
						<td class="cent pd0">${offer.middleOfferNm}</td>
					<c:if test="${TAB eq '00005' or TAB eq '00007'}">
						<td class="cent pd0">
							<c:if test="${offer.sellBuy eq '0'}"><span class="btn s red"><a>Sell</a></span></c:if>
							<c:if test="${offer.sellBuy eq '1'}"><span class="btn s blue"><a>Buy</a></span></c:if>
							<c:if test="${offer.sellBuy eq '2'}"><span class="btn s"><a>투자유치</a></span></c:if>
						</td>
						<td class="cent pd0">${offer.cpnTypeCdNm}</td>
					</c:if>
						<td class="cent pd0"><table width="100%"><tr><td width="48%" align="right">${offer.price}</td><td width="4%"><b><font color=silver>/</font></b></td><td width="48%" align="left">${offer.investPrice}</td></tr></table></td>
						
						
						<td class="cent pd0">
							<%--<span class="hand hov" onclick="categoryListPop(this,'${offer.sNb}','${offer.cpnId}','${offer.cpnNm} - ${offer.categoryNm}','${offer.rgId}','${offer.rgNm}','${offer.tmDt}','${offer.dealSms}','${offer.rgStaffPhn1}','${offer.categoryCd}','${offer.progressCd}','${offer.middleOfferCd}');" >--%>
							<font color="#0D7AA6">${offer.categoryNm}</font>
							<%--</span>--%>
						</td>
						
						<td class="pd0 hand hov" onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');">&nbsp;&nbsp;
							<c:if test="${not empty offer.tmpNum1 or not empty offer.tmpNum2}"><img class="filePosi" id="fileNew${status.count}" src="../images/file/new0.gif" style="width:23px;height:11px"/></c:if>
							<c:if test="${'A' ne offer.cpnStts and 'Q' ne offer.cpnStts}"><font color="gray">(비상장) </font></c:if><b><c:choose><c:when test="${asterDeal eq 'Y'}">***</c:when><c:otherwise>${offer.cpnNm}</c:otherwise></c:choose><c:if test="${not empty offer.cpnType}">(${offer.cpnType})</c:if></b>&nbsp;
							<%-- <c:forEach var="cmmCd" items="${cmmCdCategoryList}"><c:if test="${offer.categoryCd == cmmCd.dTailCd}">${cmmCd.cdNm}<span style="display:inline-block;width:20px;"></span></c:if></c:forEach> --%>
							<%-- ${offer.categoryNm} --%><span style="display:inline-block;width:20px;"></span>
							<c:if test="${offer.fileCnt != 0}"><span style="color:#89A0DA">
								<img class="filePosi" id="file${status.count}" src="../images/file/files.png" style="width:16px;height:16px"/><b>[${offer.fileCnt + offer.commentFileCnt}]</b></span></c:if>
							<c:if test="${offer.analysis != 0}"><span style="color:mediumvioletred">
								<img class="filePosi" id="fileAn${status.count}" src="../images/recommend/analy.png" style="width:16px;height:16px"/><b>[${offer.analysis}]</b></span></c:if>
							<c:if test="${offer.opinion != 0}"><span style="color:darkgoldenrod">
								<img class="filePosi" id="fileOp${status.count}" src="../images/recommend/comment1.png" style="width:16px;height:16px"/><b>[${offer.opinion}]</b></span></c:if>&nbsp;</nobr>
						</td>
					<c:if test="${TAB eq '00007'}"><!-- M&A 탭 '00008' -->
						<td class="cent pd0" style="overflow:hidden;">
							<font color="<c:choose>
											<c:when test="${offer.progressCd eq '00001' or offer.progressCd eq '00002' or offer.progressCd eq '00003' or offer.progressCd eq '00004' or offer.progressCd eq '00005'}">#0D7AA6</c:when>
											<c:when test="${offer.progressCd eq '00006'}">#FF1111</c:when>
											<c:otherwise>#333333</c:otherwise></c:choose>">
							<span class="hand hov" onclick="progressListPop(this,'${offer.sNb}','${offer.cpnId}','${offer.cpnNm} - ${offer.categoryNm}','${offer.rgId}','${offer.rgNm}','${offer.tmDt}','${offer.dealSms}','${offer.rgStaffPhn1}','${offer.categoryCd}','${offer.progressCd}','${offer.middleOfferCd}');" >
							<c:forEach var="cmmCd" items="${cmmCdMnaPgCdList}"><c:if test="${offer.progressCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach>
							</span>
						</td>
						<td class="cent pd0" style="overflow:hidden;">${offer.matchCpnNm}</td>
						<td class="cent pd0" style="word-break:break-all">${offer.usrNm}
							<c:choose>
								<c:when test="${userLoginInfo.permission > '00019' or userLoginInfo.permission == '00014'}"> 
									<div class="btn s orange" id="staffsBtn${status.count}" onclick="javascript:popUpStaffTable('test',event, ${status.count});"><a>진행자</a></div>
								</c:when><c:otherwise></c:otherwise>
							</c:choose>
						</td>
					</c:if>
						
						<td class="cent pd0 hand hov" onclick="slctCst_this('${offer.cstSnb}');">${offer.cstNm}</td>	<!-- 중개인 -->
						
						<td class="cent pd0" style="text-align:left;overflow:hidden;padding-left:5px!important;">
							<a class="opinion_m" id="opinion_${offer.sNb}" other_option="option_${offer.cpnNm}_${offer.rgId}"><font color="blue">
							<c:choose><c:when test="${empty offer.investOpinion}"><small><font style="color:silver"><i class="axi axi-edit2" style="font-size:15px;"></i></font></small></c:when>
								<c:otherwise>${offer.investOpinion}</c:otherwise></c:choose>
							</font></a>
						</td>
						
						<c:if test="${TAB ne '00007'}"><!-- 투자심의 (M&A 외 건에 보이게)  -->
							<c:if test="${offer.categoryCd ne '00008'}">	<!-- M&A 아닐때(전체 탭일경우) -->
							<td class="cent pd0">	<%--  style="text-align:left;padding-left:15px!important;" --%>								
								<c:choose>
									<c:when test="${asterDeal eq 'Y'}"><a></c:when>
									<c:otherwise>
										<a href="javascript:investPopup(${status.count}, ${offer.sNb}, '${offer.cpnNm}', '${offer.progressCd}');" style="color:silver!important;">
									</c:otherwise>
								</c:choose>							
								
									<span style="font-size:15px;color:gray;">
										<c:choose>
											<c:when test="${fn:split(offer.analVal,'|')[0] gt 0}"><fmt:formatNumber value="${fn:split(offer.analVal,'|')[1] / fn:split(offer.analVal,'|')[0]}" pattern="0.0"></fmt:formatNumber></c:when>
											<c:otherwise><font color="#FFF">0.0</font></c:otherwise>
										</c:choose>
									</span>
									<font color="silver">/5</font>&nbsp;
									<em class="title_icon_count"><i class="axi axi-person"></i>
										<c:choose>
											<c:when test="${fn:split(offer.analVal,'|')[0] gt 0}">${fn:split(offer.analVal,'|')[0]}</c:when>
											<c:otherwise>0</c:otherwise>
										</c:choose>
									</em>
								</a>
							</td>
							
							<td class="cent pd0">								
								<font color="<c:choose>
												<c:when test="${offer.progressCd eq '00001'}">#0D7AA6</c:when>
												<c:when test="${offer.progressCd eq '00003'}">#FF1111</c:when>
												<c:otherwise>#333333</c:otherwise></c:choose>">
												
											<c:choose>
												<c:when test="${TAB eq '00002' and offer.progressCd eq '00001'}">	<%-- 딜제안중 탭 이면서 진행중 일때 --%>
													<span class="hand hov" onclick="progressListPop(this,'${offer.sNb}','${offer.cpnId}','${offer.cpnNm} - ${offer.categoryNm}','${offer.rgId}','${offer.rgNm}','${offer.tmDt}','${offer.dealSms}','${offer.rgStaffPhn1}','${offer.categoryCd}','${offer.progressCd}','${offer.middleOfferCd}');" >
													딜제안중
													</span>
												</c:when>
												<c:otherwise>
													<span class="hand hov" onclick="progressListPop(this,'${offer.sNb}','${offer.cpnId}','${offer.cpnNm} - ${offer.categoryNm}','${offer.rgId}','${offer.rgNm}','${offer.tmDt}','${offer.dealSms}','${offer.rgStaffPhn1}','${offer.categoryCd}','${offer.progressCd}','${offer.middleOfferCd}');" >
													${offer.progressNm}
													</span>
												</c:otherwise>
											</c:choose>
								</font>
							</td>
							</c:if>
							<c:if test="${offer.categoryCd eq '00008'}">	<!-- M&A 일때(전체 탭일경우) -->
								<td class="cent pd0">${offer.matchCpnNm}</td>
								<td class="cent pd0">
									<span class="hand hov" onclick="progressListPop(this,'${offer.sNb}','${offer.cpnId}','${offer.cpnNm} - ${offer.categoryNm}','${offer.rgId}','${offer.rgNm}','${offer.tmDt}','${offer.dealSms}','${offer.rgStaffPhn1}','${offer.categoryCd}','${offer.progressCd}','${offer.middleOfferCd}');" >
									<c:forEach var="cmmCd" items="${cmmCdMnaPgCdList}"><c:if test="${offer.progressCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach>
									</span>
								</td>
							</c:if>
						</c:if>
						
						
						<td class="cent pd0">
						<c:choose>
							<c:when test="${offer.analUserCount > 0}">
								<span onclick="getAnalyList(this,'${offer.sNb}','${offer.cpnId}','${offer.tmDt}','${offer.cpnNm} - ${offer.categoryNm}');" style="cursor:pointer;color:#0808ad;">
									${offer.analUserFirst}<c:if test="${offer.analUserCount >1 }"><font style="font-size:11px;"> <i class="axi axi-person"></i>${offer.analUserCount}</font></c:if>
									<c:choose>
									<c:when test="${offer.analEachCount ge offer.analUserCount}"><span style="font-size:11px;margin-left:0px;border-radius:2px;border:1px solid #33468e;padding:0px 1px 1px 1px;background:#33468e;color:white">完</span></c:when>
									<c:otherwise><span style="font-size:11px;margin-left:0px;border-radius:2px;border:1px solid #007cff;padding:1px 1px 0px 1px;background:#007cff;color:white;margin-top:3px;">進</span></c:otherwise>
									</c:choose>
									<%-- [${offer.analEachCount}][${offer.analUserCount}] --%> 
								</span>
							</c:when>
							<c:otherwise>
								<span class="btn s skyblue">									
									<a class="requestAnalBtn" style="width: 45px;text-align: center;"><label for="selAnalUser_${offer.sNb}">분석요청</label></a>									
								</span>
								<select class="selAnalUser" id="selAnalUser_${offer.sNb}" style="display:none;" onchange="selAnalUserChange(this,${offer.sNb},'${offer.cpnNm}','${offer.categoryNm}');">
									<option value="" selected>선택</option>
									<c:forEach var="user" items="${analUserList}" varStatus="status">
										<option value="${user.staffSnb}">${user.usrNm}</option>
									</c:forEach>
								</select>
								<a id="aCloseAnalBtn_${offer.sNb}" href="javascript:closeSelAnalUser('selAnalUser_${offer.sNb}', 'aCloseAnalBtn_${offer.sNb}');" style="vertical-align:top;display:none;">x</a>
							</c:otherwise>
						</c:choose>
						</td>
						<td class="cent pd0">${offer.rgNm}</td>
						<%-- <td class="cent pd0 personName"><nobr>${offer.rgNm}</nobr></td> --%>
						
					</tr>
					
					
					</c:otherwise>
					</c:choose>
					
				</c:forEach>
			</tbody>
		</table>
		</div>
		<!-- //data table// -->
		
		</article>
	</section>
	
<div>
<!-- 의견 -->
	<c:forEach var="offer" items="${offerList}" varStatus="status">
		<div class="popUpMenu title_area" id="opinionPr${offer.sNb}" name="textR">								<!-- 아래 시너지가 아니면 모두 입력/수정 가능하도록 -->
		<c:choose><c:when test="${userLoginInfo.permission > '00019' or userLoginInfo.permission == '00014' or userLoginInfo.division ne 'SYNERGY'}">		<%-- 20150826   or  userLoginInfo.name==offer.rgNm}"> --%> 
				<input type="hidden" id="dealOpinionSNb${offer.sNb}" value="${offer.sNb }">
				<input type="hidden" id="dealOpinionCpnNm${offer.sNb}" value="${offer.cpnNm}">		<!-- 딜 회사명 -->
				<input type="hidden" id="dealOpinionDealRgId${offer.sNb}" value="${offer.rgId}">	<!-- 딜 등록자 usr_id -->
				
				<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
				<ul><c:choose>
					<c:when test="${empty offer.investOpinion}"><li class="c_note"><textarea id="opinionarea0" placeholder="투자의견을 입력하세요."></textarea></li></c:when>
					<c:otherwise><li class="c_note"><textarea id="opinionarea${offer.sNb}">${offer.investOpinion}</textarea></li></c:otherwise></c:choose>
					<p class="bsnsR_btn">
						<span class="dealResult_btnOk btn s green"><a><spring:message code="button.save" /></a></span>&nbsp;&nbsp;&nbsp;
						<!-- <span class="dealResult_btnDel">완전삭제</span> -->
					</p>
				</ul>
			</c:when><c:otherwise>
				<input type="hidden" id="opinionSNb${offer.sNb}" value="${offer.sNb }">
				<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
				<ul>
					<li class="c_note v-textarea">${fn:replace(offer.investOpinion, lf,"<br/>")}</li>
				</ul></c:otherwise>
		</c:choose>
		</div>
	</c:forEach>
<!-- 의견 -->

<c:if test="${TAB eq '00007'}">
<%-- 직원 플로팅 div --%>
	<div class="popUpMenu" id="test"  >
		<p class="closePopUpMenu" title="닫기">ⅹ닫기</p>
			<input type="hidden" id="TofferSnb"/>
			<input type="hidden" id="TstCnt"/>
			<div id="divisionDiv"></div>
		<p class="bsnsR_btn"><span class="btn s green" onclick="javascript:pickStaff('insertMemo.do',this)"><a>&nbsp;&nbsp;&nbsp;선정&nbsp;&nbsp;&nbsp;</a></span></p>
	</div>
<%-- 직원 플로팅 div --%>
</c:if>
</div>

</div>
</body>
</html>