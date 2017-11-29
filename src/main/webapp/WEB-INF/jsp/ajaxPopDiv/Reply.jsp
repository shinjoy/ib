<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- <meta http-equiv="X-UA-Compatible" content="IE=11"> -->
<title>Main</title>
<link href="<c:url value='/css/comment.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">

<%-- 투자결정일(통계일)
<!-- ============== style css :S ============== -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">				<!-- jquery-ui -->
<!-- ============== style css :E ============== -->
--%>
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js?ver=0.4'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/changePage.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/multiFileUpload.js?ver=0.1'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/multiFileUpload2.js'/>" ></script>	<!-- 20160531 의견수정시 파일첨부도 가능하도록 -->
<script type="text/JavaScript" src="<c:url value='/js/work.js?ver=0.2'/>" ></script>		<!-- 20160106 -->
<script type="text/JavaScript" src="<c:url value='/js/calendar_beans_v2.0.js'/>" ></script>

<!------ 20150518 :S ------>
<script type="text/javascript" src="<c:url value='/js/sys/jquery.blockUI.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/sys/deal.js'/>" ></script>
<!------ 20150518 :E ------>


<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 



<style>
a:hover,.hov:hover {background-color: moccasin !important;cursor:pointer;}
.inboxcontents,.inboxText{
	max-width:140px;
	padding: 2px 5px;
	border-radius: 5px;
	background-color: white;
}
.inboxcontents{
	border: 1px solid gray;
	box-shadow: 2px 2px 5px #888;
	margin-right: 5px;
}
.midboxcontents{
	display:flex;
	padding:5px;
	border: 2px dotted gray;
	border-bottom: 0;
	border-radius: 5px;
}
.midboxcontents:after {content:""; display:block; clear:both;}.midboxcontents>div{float:left;}
.boxBottom{
	display:flex;
	padding:0;
	border:0;
	border-top: 2px dotted gray;
	border-radius: 5px;
	height:2px;
}
.inboxTextTop,.inboxTextBottom {padding-left: 5px;}
.inboxTextTop {border-bottom:1px solid;}
.arrowBar {padding-top:23px;}
.title{color:navy;}


/* ----------- 중개인, 회사기본정보 추가 20150703 :S ----------- */
.broker_box{
	border: 1px solid #DFDFDF;
	background-color: white;
    height: 100%;
	margin: 5px;
	
    padding: 5px 8px;
    padding-top: 2px;
	border-radius: 5px;
	
	float: right;
	margin-top: 18px;
	font-size:10pt;
}
.official_notice{
	border: 1px solid #DFDFDF;
	background-color: white;
    height: 100%;
	margin: 1px;
	
    padding: 5px 5px;
    padding-top: 2px;
	border-radius: 5px;
	
	margin-top: 18px;
	font-size:10pt;
}
.simple_cpn_box {
    border: 1px solid #DFDFDF;
	background-color: white;
    height: 100%;
	margin: 5px;
    /* margin: 10px 5px 5px 0; */
    
    padding: 7px 15px;
	border-radius: 5px;
}
.registed{
    position: absolute;
    right: 10px;
    top: 93px;
}
/* ----------- 중개인, 회사기본정보 추가 20150703 :E ----------- */

/* ----------- 딜 내용 폰트 사이즈 변경기능 추가 20150922 :S ----------- */
.fontResizable{
	font-size: 1em;
}
/* ----------- 딜 내용 폰트 사이즈 변경기능 추가 20150922 :E ----------- */

.analist{
	float:right;
	padding-right:70px;
	padding-top:0px;
}
.post_data{
	padding-top:20px;
}

.h3_title_basic {
    background: url(../images/common/bu_h3_title.gif) no-repeat 0 3px;
    color: #2a3a5b;
    font-family: 'NanumBarunL';
    font-weight: bold;
    font-size: 16px;
    letter-spacing: -0.04em;
    padding-left: 12px;
    margin-bottom: 10px;
}

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
.selectHeight{height:25px;}
.btn_b_skyblue {
    background: url(../images/work/bg_btn_skyblue.gif) repeat-x;
    font-weight: bold;
    color: #fff;
    border: #a1a6ac solid 1px;
    height: 24px;
    padding: 0 5px;
    box-sizing: border-box;
    display: inline-block;
    font-size: 11px;
    border-radius: 2px;
}

.btn_b_edit {
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


.btn_official_notice{
	font-size:13px!important;
}

</style>
<script>
g_analyList = [];
$(document).ready(function(){
	$(".t_skin05 tbody tr.bgOdd:even").css("background-color", "#E0F8F7");
	if($(window).width()<700){
		$('.btn').removeClass('m').addClass('s');
	}
	
	
	//딜 내용 폰트 사이즈 변경	20150922
	resizeFont();
	getuserListByAnalYn();
	getAnalyList();
	<%-- 투자결정일(통계일)
	//투자결정일 :S ----------------------------------
	<c:if test="${recommendInfo[0].progressCd eq '00003' or recommendInfo[0].progressCd eq '00006'}">
	$("#investDate").datepicker({
		dateFormat: 'yy-mm-dd',
		changeMonth: true, 
		changeYear: true,
		yearRange: 'c-7:c+7'
		//maxDate: '+1m',
		//minDate: '-7d'
	});	
	var nDate = makeDate(3, "${recommendInfo[0].investDt}", 0, 0, 0);
	$("#investDate").datepicker('setDate', nDate);
	</c:if>
	//투자결정일 :E ----------------------------------
	--%>
});

<%-- 투자결정일(통계일)
//칼렌다 버튼
function popCalendar(k){
	$('#investDate').datepicker('show');	
}

//투자결정일(통계일) 저장
function doSaveInvestDt(){
	
	var	url = contextRoot + "/work/doSaveInvestDt.do";
	
	var	params = {
				sNb: '${recommendInfo[0].sNb}',
				investDt: $('#investDate').val()
			};	
	var fn = function(arg){
		toast.push("통계일이 저장 되었습니다!");
	};
	commonAjax("POST", url, params, fn);
}
--%>

function delMnaMatchCpn(snb){
	var data = {sNb:snb}
		,url = "<c:url value='/work/delMnaMatchCpn.do' />"
		,fn = function(arg){
			document.location.reload();
		};
	ajaxModule(data, url, fn);
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


//분석자 권한 직원 리스트
function getuserListByAnalYn(){
	
	var param = {
					searchType 		: 'analYn',
					division 		: 'SYNERGY',
					deptOrder		: 'N'
				};
	
	analyUserList = getCodeInfo('KOR', 'staffSnb', 'usrNm', '', '담당자지정', '담당자지정', "/common/getStaffListNameSort.do", param);
	analyUserList = addToArray(analyUserList, 1, {'staffSnb':'${userLoginInfo.staffSnb}', 'usrNm':'★MY'});		//내가찜 추가
	tagStr = createSelectTag('analUserId', analyUserList, 'staffSnb', 'usrNm', '','',{},'100','selectHeight');
	$("#userSelectArea").html(tagStr);
		
	
}

//분석자 저장 
function doSaveAnalyUser(){
	var userId = $("#analUserId").val();
	
	if(userId == ''){
		alert('분석 담당자를 선택해 주세요');
		return false;
	}
	
	if(getCountWithValue(g_analyList, 'userId', userId)!=0){
		alert('이미 지정된 분석 담당자입니다.');
		return false;
	}
	
	var url = contextRoot + "/recommend/saveAnalyUser.do";
	
	var param = {
					userId : userId , 
					offerId : $("#offerSNB").val(), 
					cpnNm :$("#cpnNm").val(), 
					analyUserName :$("#analUserId option:selected").text(),
					cdNm : $("#cdNm").val() 
	};
	
	var callback = function(result){
		
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;		//결과수

		if(cnt>0){
			//alert("지정 완료 되었습니다.");
			toast.push("지정 완료 되었습니다");
			getAnalyList();
		}else{
			alert("지정에 실패 하였 습니다.");
			return;
		}
		
	};
	
	commonAjax("POST", url, param, callback, false);		// false (sync 처리)
}


//분석자 리스트
function getAnalyList(){
	
	
	var url = contextRoot + "/recommend/getAnalyUserList.do";
	var param = {
				offerId : $("#offerSNB").val(),
				cpnId : $("#companyId").val(),
				tmDt : $("#tmDt").val()
	
		};
	var callback = function(result){
		
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;		//결과수
		var list = obj.resultList;		//결과데이터JSON
		
		g_analyList = list;
		
		var str = [];
		var progressCount =0;
		var detailStr = '';
		
		detailStr = '<table class="user_detail_table">';
		detailStr+='<colgroup>';
		detailStr+='<col width=100>';
		detailStr+='<col width=60>';
		detailStr+='<col width=60>';
		detailStr+='<colgroup>';
		detailStr+='<tr><th>분석자</th>';
		detailStr+='<th>진행상태</th>';
		detailStr+='<th></th></tr>';
		
		if(list.length>0){
			
			for(var i=0;i<list.length;i++){
				var endIcon ='';
				var endText = '<span class="ingAnal">분석중</span>';
				if(parseInt(list[i].analCount) > 0){
					endIcon ='<span style="margin-left:3px;border-radius:2px;border:1px solid black;padding:0px 1px 0px 1px;background:#33468e;color:white"><strong>完</strong></span>';
					endText ='<span class="finishAnal">분석완료</span>';
					
					progressCount ++;
				}
				str.push(' <span><strong>'+list[i].userNm+'</strong>'+endIcon+'</span>');
				
				detailStr+='<tr><td><strong>'+list[i].userNm+'</strong></td>';
				detailStr+='<td style="text-align:center;">'+endText+'</td>';
				detailStr+='<td style="text-align:center;"><input type="button" class="btn_b_skyblue" style="color:black;"  value="삭제" onclick="deleteAnalyUser('+list[i].analUserId+', \''+list[i].userNm+'\');"/></td><tr>';
				
			}
			
		}else{
			detailStr+='<td colspan="3" style="text-align:center;">지정된 담당자가 없습니다.</td>';
		}
		
		detailStr += '</table>';
		$('#analyUserArea').html((str.length>0 ? '<i class="axi axi-ion-android-contact" style="font-size: 15px;"></i> :' : '')+ str.join(','));			//담당자 리스트 표시 
		
		var progressStr='<span class="readyAnal">분석미지정</span>';
		
		//모두다 의견을 썻다 완료로 봄 
		if(progressCount > 0 && progressCount == list.length) progressStr='<span class="finishAnal">분석완료</span>';
		else if(progressCount > 0) progressStr='<span class="ingAnal">분석중</span>';
		else if(list.length > 0) progressStr='<span class="ingAnal">분석요청중</span>';
		
		$("#progressArea").html(progressStr);						//진행상태 버튼 
		
		
		$("#userDtTableArea").html(detailStr);						//상세 팝업 세팅만.
		
	};
	
	commonAjax("POST", url, param, callback, false);		// false (sync 처리)
}


//담당자 상세 팝업 
function showPopup(th){
	
	
	var left = $("#analUserId").offset().left -150;
	var top = $(th).position().top + $(th).height(); 
	$("#userDetailArea").css({display:"",left : left,top:top});
	
}

//담당자 삭제
function deleteAnalyUser(analUserId, userNm){
	
	if(confirm("담당자를 삭제하시겠습니까?")){
		var url = contextRoot + "/recommend/deleteAnalyUser.do";
		
		var param = {
				analUserId : analUserId,
				offerId : $("#offerSNB").val(), 
				cpnNm :$("#cpnNm").val(), 
				analyUserName : userNm,			//$("#analUserId option:selected").text(),
				cdNm : $("#cdNm").val() 
		};
		
		
		var callback = function(result){
			toast.push("삭제하였습니다!");
			$("#userDetailArea").hide();
			getAnalyList();
		};
		
		commonAjax("POST", url, param, callback, true);		// false (sync 처리)
	}
}



</script>


<base target="_self">
</head>

<!-- ---------------------- 문자 발송 관련 :S ------------------------ -->
<iframe id="iframeSMS" name="iframeSMS" style="display:none"></iframe>
<form id="frmSMS" name="frmSMS" action="https://biz.moashot.com/EXT/URLASP/mssendUTF.asp" method="post" target="iframeSMS">	
	<input type="hidden" name="uid" id="uid" value="synergy"/>
	<input type="hidden" name="pwd" id="pwd" value="00synergy00"/>
	<input type="hidden" name="returnUrl" id="returnUrl" value="http://106.250.177.91:8280/SynergyCus/SMSSendResult.do"/>
	<input type="hidden" name="sendType" id="sendType" value="3"/>	<!-- 3:단문, 5:장문 -->
	<input type="hidden" name="toNumber" id="toNumber" value="${recommendInfo[0].rgStaffPhn1}"/>
	<input type="hidden" name="contents" id="contents" value="테스트문구"/>
	<input type="hidden" name="fromNumber" id="fromNumber" value="025865981"/>
	<input type="hidden" name="startTime" id="startTime" value=""/>
	<input type="hidden" name="indexCode" id="indexCode" value=""/>
	<input type="hidden" name="returnType" id="returnType" value="0"/>
	<input type="hidden" name="nType" id="nType" value="2"/>	
</form>
<!-- ---------------------- 문자 발송 관련 :E ------------------------ -->

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<input type="hidden" id="pageName" value="reply">
<body>
<div id="offerDiv"><div id="offerPr" style="display: none;"></div></div>

<div id="wrap" style="height:100%;background-color: #EFF4FF">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
		pageContext.setAttribute("sp", "  ");
	</jsp:scriptlet>

<form id="multiFile_N_comment" name="fileNcomment" action="<c:url value='/recommend/saveOpinion.do' />" method="post" encType="multipart/form-data">
	<input type="hidden" id="m_categoryCd" name="categoryCd" value="00001">
	<input type="hidden" id="m_offerSnb" name="offerSnb">
	<input type="hidden" id="m_comment" name="comment">
	<input type="hidden" id="m_opinion" name="opinion">
	<input type="hidden" name="tmpNum1" value="${offerSNB}">
	<input id="files-upload" name="files-upload" type="file" multiple style="display:none;">

	<c:if test="${fn:length(recommendInfo) gt 0}">
	<input type="hidden" name="cpnNm" value="${recommendInfo[0].cpnNm}">	<!-- 딜 회사 -->
	<input type="hidden" name="usrId" value="${recommendInfo[0].rgId}">		<!-- 딜 등록자 usr_id -->
	</c:if>
</form>
<!-- 의견 수정 -->
<form id="multiFile_N_comment2" name="fileNcomment2" action="<c:url value='/recommend/saveOpinion2.do' />" method="post" encType="multipart/form-data">
	<input type="hidden" id="m_categoryCd2" name="categoryCd" value="00001">
	<input type="hidden" id="m_offerSnb2" name="offerSnb">
	<input type="hidden" id="m_comment2" name="comment">
	<input type="hidden" id="m_opinion2" name="opinion">
	<input type="hidden" name="tmpNum1" value="${offerSNB}">
	<input id="files-upload2" name="files-upload" type="file" multiple style="display:none;">
	
	<input type="hidden" id="m_sNb" name="sNb">
</form>

<form id="multiFile_N_Deal" name="fileNcomment" action="<c:url value='/work/insertDealINallDeal.do' />" method="post" encType="multipart/form-data">
	<input type="hidden" id="d_cpnId" name="cpnId">
	<input type="hidden" id="d_offerCd" name="offerCd">
	<input type="hidden" id="d_memo" name="memo">
	<input type="hidden" name="tmpNum1" value="${offerSNB}">
	<div id="addInput"></div>
	<input type="hidden" id="d_star" name="star">
	<input type="hidden" id="d_exDt" name="exDt">
	<input type="hidden" id="d_anal" name="anal">
</form>
<form id="comment" name="comment" action="<c:url value='/recommend/comment.do' />" method="post">
	<input type="hidden" id="offerSNB" name="sNb" value="${offerSNB}">
	<input type="hidden" id="choiceYear" name="choice_year" value="${choice_year}">
	<input type="hidden" id="choiceMonth" name="choice_monthS" value="${choice_monthS}">
</form>
<form id="downName" name="downName" action="<c:url value='/work/downloadProcess.do' />" method="post">
	<input type="hidden" name="makeName" id="makeName"/>
	<input type="hidden" name="recordCountPerPage" value="0"/>
</form>



<input type="hidden" id="tmDt" name="tmDt" value="${tmDt}">


<script>
if(${empty recommendInfo}) {
	$("#offerSNB").val(Request("snb"));
	$("#choiceYear").val(Request("year"));
	$("#choiceMonth").val(Request("mon"));
	$("#comment").submit();
};
function matchingCpn(){
	popUp('mc','c');
}
function afterMatchingCpn(){	
	var str = $("#AP_cpnNm_mc").html();
	str = '매칭회사: '+str;
	$("#AP_cpnNm_mc").html(str);
	$(".match").removeClass('dspN');

	var DATA = {
			sNb: $("#offerSNB").val()
			,matchCpn: $("#AP_cpnId_mc").val()
			,progressCd: '00002'
			,rgId: $('#rgstId').val()
		}
	, URL = "<c:url value='/work/changeprogressCdNmatchCpn.do'/>"
	, fn = function(){
			document.comment.submit();
		};
	ajaxModule(DATA,URL,fn);
}
function progressBTN(val,snb,th,e){
	var DATA,URL;
	if(val=='20000'){
		
		if(!confirm("딜이동 하시겠습니까?")) return;			//확인후 진행
		
		DATA = {
				sNb: $("#offerSNB").val()
				,middleOfferCd: '00001'
				,offerCd: '00007'
				,rgId: $('#rgstId').val()
		};
		URL = "<c:url value='/work/changeMiddleOfferCd.do'/>";
		
	}else{		
		
		//--------------------- SMS발송 :S ---------------------- 20160510		
		var progressNm = "";
		if("00001" == val){ 	  progressNm = "진행";
		}else if("00002" == val){ progressNm = "보류";
		}else if("00003" == val){
			progressNm = "투자결정";
			<c:if test="${recommendInfo[0].categoryCd == '00008'}">		//M&A
			progressNm = "미팅";
			</c:if>	
		}else if("00004" == val){ progressNm = "계약";
		}else if("00005" == val){ progressNm = "실사";
		}else if("00006" == val){ progressNm = "투자결정";
		}else if("10000" == val){ progressNm = "DROP";
		//else if("20000" == val) progressNm = "딜이동";
		}else if("10001" == val){ progressNm = "타사투자";
		}else if("10002" == val){ progressNm = "발행취소";
		}
		
		if(!confirm(progressNm + " 하시겠습니까?")) return;	//확인후 진행
		
		
		var smsMsg = "[딜상태- " + progressNm + "] <c:out value="${recommendInfo[0].cpnNm}" />-";
		smsMsg += '<c:forEach var="cmmCd" items="${cmmCdCategoryList}"><c:if test="${recommendInfo[0].categoryCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach>';
		smsMsg += '(등록일:<c:out value="${fn:substring(recommendInfo[0].rgDt,0,10)}" />) 의 상태가 ${userLoginInfo.name}님에 의해 ' + progressNm + '(으)로 변경되었습니다.';
		
		
		if($('#RegName').val() != '${userLoginInfo.name}' && '${recommendInfo[0].dealSms}' == 'Y'){			//상태변경자가 딜 등록자 본인인 경우에는 skip 	
			if(getByteLength(smsMsg) > 80){
				document.frmSMS.sendType.value = 5;		//LMS
			}else{
				document.frmSMS.sendType.value = 3;		//SMS
			}
			document.frmSMS.contents.value = smsMsg;
			document.frmSMS.submit();		//SMS발송(등록자에게)
		}
		//--------------------- SMS발송 :E ----------------------
		
		
		DATA = {
				sNb: $("#offerSNB").val()
				,progressCd: val
				
				,progressNm: progressNm
				
				,rgId: $('#rgstId').val()				
				,cpnNm : "${recommendInfo[0].cpnNm}"
				,rgNm: $('#RegName').val()
				,memo: smsMsg
				
				,usrId: $('input[name=usrId]').val()		//딜 등록자 usr_id
				
				//,cpnNm: '<c:out value="${recommendInfo[0].cpnNm}" />'
				//,categoryNm: '<c:forEach var="cmmCd" items="${cmmCdCategoryList}"><c:if test="${recommendInfo[0].categoryCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach>'
				//,rgDt: '<c:out value="${fn:substring(recommendInfo[0].rgDt,0,10)}" />'
		};
		URL = "<c:url value='/work/changeprogressCd.do'/>";
		
	}
	var fn = function(){
			if(val=='00003' && '${recommendInfo[0].categoryCd}' != '00008') disposalModal(snb,th,e);
			else document.comment.submit();
		};
	ajaxModule(DATA,URL,fn);
}


function saveDeal(ofCd){
		
	//분석일때 추가사항
	var star = '';
	var exDt = '';
	var cntnt = '';
	
	
	//내용
	var analCont = $('#toast_comment_text');
	if(analCont.val().trim().length == 0){
		alert("내용을 입력하세요!");
		analCont.focus();
		return;
	}
	
	
	if(ofCd == '00004'){	//분석 이면
		
		var obj = $('#divAnalysis');
		
		star = obj.find('[id=chkStar]').val();
		if(star.length == 0){		//별 선택을 안했을 경우
			alert("분석의견의 별을 입력하세요!");
			return;
		}
		
		exDt = obj.find('[name=expirationDate]:checked').val(); 
		if(exDt==undefined){	//분석 유효기간 입력을 안했을 경우
			alert("분석 유효기간을 선택하세요!");
			return;
		}
		
		cntnt = obj.find('[id=kyPoint]').val().trim();
		if(cntnt==''){		//분석내용 입력을 안했을 경우
			alert("분석의견을 입력하세요!");
			obj.find('[id=kyPoint]').focus();
			return;
		}
	}
	
	
	$("#d_memo").val(analCont.val());
	$("#d_offerCd").val(ofCd);
	$("#d_cpnId").val($("#companyId").val());
	$("#addInput").append($("#files-upload"));
	
	$("#d_star").val(star);
	$("#d_exDt").val(exDt);
	$("#d_anal").val(cntnt.replace(/,/g,"，"));	
	
	
	if(confirm("적용하시겠습니까?")){
		$("#multiFile_N_Deal").submit();
	}
	
}

function changeDealCate(cate,snb){
	if(cate==='1') $("#insertBtnA").attr('href',"javascript:saveComment('','"+snb+"')");
	else if(cate==='2') $("#insertBtnA").attr('href',"javascript:saveDeal('00004')");
	else if(cate==='3') $("#insertBtnA").attr('href',"javascript:saveDeal('00005')");
	else if(cate==='4') $("#insertBtnA").attr('href',"javascript:saveDeal('00002')");
	
	
	//분석의견 
	if(cate==='2'){		//분석을 눌렀을때
		$('#divAnalysis').show();		//보이게
	}else{
		$('#divAnalysis').hide();		//숨기기
	}
	
}
function resizeTextarea(th){
	var obj=$(th);
	obj.css('height','115px');
	obj.css('height',(th.scrollHeight)+'px');
}
function disposalModal(snb,th,e){
	var url = "<c:url value='/reply/PopUpReplyDisposal.do'/>"
	, data = {sNb:snb}
	, fn = function(arg){
		$('#tbl00').html(arg);
		view('workPr',th,e);
	};
	ajaxModule(data,url,fn);
}

//딜 내용 폰트 사이즈 변경	20150922
function resizeFont(knd){
	
	var fSize = $('.fontResizable').css('font-size').replace('px','');
	
	if(knd == 1){
		fSize = 1*fSize + 1;
	}else if(knd == 0){
		if(1*fSize > 12){
			fSize = 1*fSize - 1;
		}
	}else{
		if(opener.window.sessionStorage['fontResizable'] != undefined && opener.window.sessionStorage['fontResizable'] != null){
			fSize = opener.window.sessionStorage['fontResizable'];
		}
	}
	
	opener.window.sessionStorage['fontResizable'] = fSize;
	
	$('.fontResizable').css('font-size', 1*fSize);	
}

//파일삭제 기능 추가 20151001
function deleteFileOne(offerSNb, makeName){
	//alert(offerSNb + ',' + makeName);
	//return;
	
	if(confirm('삭제하시겠습니까?')){
		
		$.ajax({
			type:"POST",        					//POST GET
			url:"../work/deleteFileOne.do",     	//PAGEURL
			//  dataType: "html",       			//HTML XML SCRIPT JSON
			data : {offerSNb: offerSNb,
					makeName: makeName},
			timeout : 30000,       					//제한시간 지정
			cache : false,        					//true, false
			success: function whenSuccess(arg){  	//SUCCESS FUNCTION
				location.reload();
			},
			error: function whenError(x,e){    		//ERROR FUNCTION
				alert('error!');
			}
		});
		
	}
	
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


//공시문서 팝업
function officialNotice(e, cpnId, knd){	
	var options = "width=800, height=650, scrollbars=auto";
	options += ",left=" + (e.screenX - 200);
	options += ",top=" + (e.screenY + 20);
	
	window.open("../dart/officialNotice.do?cpnId="+cpnId+"&knd="+knd, "new_win", options);
}

</script>


<!-- 인물정보 팝업위한 폼 -->
<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
	<input type="hidden" name="popupYn" value="Y">
</form>


<div id="tbl00"></div>
	<input type="hidden" id="AP_cpnId_mc"/>

	<header>
		<div class="cent t_skin05width"></div>
	</header>
	
			<c:forEach var="info" items="${recommendInfo}" varStatus="OPst">
			
			
			<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :S  ================== --%>
			<c:choose>
			<c:when test="${mezzL eq 'Y'}">
				<c:set var="asterDeal" value="N"/>
			</c:when>	<%-- 내가 등록한 딜이 아니면서 --%>		  <%--             상장사 이고			 --%>		<%--						메자닌 (CB, EB, BW, RCPS) 이고														--%>	<%--	진행중 인 건		 --%>		<%--						제안중이 아니고					 --%>	
			<c:when test="${info.rgId ne userLoginInfo.id and ('A' eq info.cpnStts or 'Q' eq info.cpnStts) and (info.categoryCd eq '00001' or info.categoryCd eq '00002' or info.categoryCd eq '00003' or info.categoryCd eq '00015') and (info.progressCd eq '00001' or info.progressCd eq '00002')}">		<%-- and (info.middleOfferCd ne '00004' and info.middleOfferCd ne '00005') --%>
				<c:set var="asterDeal" value="Y"/>
			</c:when>
			<c:otherwise>
				<c:set var="asterDeal" value="N"/>
			</c:otherwise>
			</c:choose>
			<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :E  ================== --%>
			
			
			<c:set var="offerCode" value="${info.offerCd}"/>
			<c:set var="progressCode" value="${info.progressCd}"/>
			<c:set var="matchCpn" value="${info.matchCpnNm}"/>
			<c:set var="rgName" value="${info.rgNm}"/>
			<c:set var="mnaYN" value="N"/>
			<c:if test="${info.categoryCd eq '00008'}"><c:set var="mnaYN" value="Y"/></c:if>
			<c:set var="projectYN" value="N"/>
			<c:if test="${info.categoryCd eq '00011' or info.categoryCd eq '00014'}"><c:set var="projectYN" value="Y"/></c:if>
			<c:set var="CstCpnNm" value="${info.cstCpnNm}"/>
			<c:set var="CstNm" value="${info.cstNm}"/>
			<c:set var="readyDealYN" value="N"/>
			<c:if test="${info.middleOfferCd eq '00004' or info.middleOfferCd eq '00005'}"><c:set var="readyDealYN" value="Y"/></c:if>
			
			<c:if test="${asterDeal eq 'N'}">	<!-- 비권한자일때 소스보기로도 비노출되도록 -->
			<input type="hidden" id="CstCpnNm" value="${CstCpnNm}<br/><nobr>${CstNm}</nobr>"/>
			<input type="hidden" id="RegName" value="${rgName}"/>
			<input type="hidden" id="companyId" value="${info.cpnId}"/>
			</c:if>
			
			
			<!-- -------------- 중개인 정보 :S ----------------- -->
			<c:if test="${not empty info.cstNm}">
			<div class="broker_box">
				<b>중개인 : </b> <c:choose><c:when test="${asterDeal eq 'Y'}">***</c:when><c:otherwise>${info.cstCpnNm} <a href="javascript:slctCst_this('${info.cstId}');">${info.cstNm}</a></c:otherwise></c:choose>
			</div>
			</c:if>
			<!-- -------------- 중개인 정보 :E ----------------- -->
			
			<h2 class="top<c:if test="${d_day <= 0}"> red</c:if><c:if test="${d_day > 0}"> blue</c:if>">
				<c:if test="${d_day <= 0}"> <span class="btn m red"><a><font color="yellow">!</font> 지연 : ${d_day}</a></span></c:if>
				<span class="btn xl">
					<c:choose>
					<c:when test="${asterDeal eq 'Y'}"><a>&nbsp;&nbsp;&nbsp;***&nbsp;&nbsp;&nbsp;</a></c:when>
					<c:otherwise>
						
						<a onclick="popUp('','rcmdCpn','','${info.cpnSnb}')" style="cursor:pointer;">${info.cpnNm}</a><input type="hidden" id="cpnNm" value="${info.cpnNm}"/>						
					</c:otherwise>
					</c:choose>
					
				</span>
				<c:if test="${not empty info.cpnType}">(${info.cpnType})</c:if>
				<c:forEach var="cmmCd" items="${cmmCdCategoryList}">
					<c:if test="${info.categoryCd == cmmCd.dTailCd}"> 
						- ${cmmCd.cdNm}
					<input type="hidden" id="cdNm" value="${cmmCd.cdNm}"/>
					</c:if>
				</c:forEach>
				
				<c:if test="${info.infoLevel lt 9}"><b><font color=red>[보${info.infoLevel}]</font></b></c:if>

				<c:if test="${fn:length(info.aCpnId) gt 0 and asterDeal eq 'N'}">	<!-- 상장사 이고, 볼수있는 권한자 일때 -->
				<span class="official_notice">
					<a onclick="officialNotice(event,'${info.aCpnId}', 'ALL');" class="btn_official_notice" ><i class="axi axi-ion-android-search"></i>전자공시</a>
				</span>
				<span class="official_notice">
					<a onclick="officialNotice(event,'${info.aCpnId}', '');" class="btn_official_notice" ><i class="axi axi-ion-android-search"></i>보고서</a>
				</span>
				</c:if>
			</h2>			
			<c:set var="disposalTitle">${info.cpnNm}<c:if test="${not empty info.cpnType}">(${info.cpnType})</c:if><c:forEach var="cmmCd" items="${cmmCdCategoryList}"><c:if test="${info.categoryCd == cmmCd.dTailCd}"> - ${cmmCd.cdNm}</c:if></c:forEach></c:set>
			
			<!-- -------------- 기본 회사 정보 :S -------------- -->
			<div class="simple_cpn_box">
				<c:choose>
					<c:when test="${asterDeal eq 'Y'}"><b>업종: </b>***<b> &nbsp;&nbsp;&nbsp;품목: </b>***<b> &nbsp;&nbsp;&nbsp;CEO: </b>***<b> &nbsp;&nbsp;&nbsp;시총: </b>***억원<b> &nbsp;&nbsp;&nbsp;주가: </b>***원</c:when>
					<c:otherwise><b>업종: </b>${info.categoryBusiness}<b> &nbsp;&nbsp;&nbsp;품목: </b><span title="${info.majorProductFull}">${info.majorProduct}</span><b> &nbsp;&nbsp;&nbsp;CEO: </b>${info.ceo}<b> &nbsp;&nbsp;&nbsp;시총: </b>${info.stockValue}억원<b> &nbsp;&nbsp;&nbsp;주가: </b>${info.unitPrice}원</c:otherwise>
				</c:choose>
			</div> 
			<!-- -------------- 기본 회사 정보 :E -------------- -->
			
			<div class="cmt_box boxcontents">
				<c:if test="${not empty info.price}"><c:set var="Price" value="${info.price}"/>
				<div class="midTitle"<c:if test="${not empty info.investPrice}"> style="float:left;"</c:if>><b>발행규모 : </b> ${info.price}</div>
				</c:if>
				<c:if test="${not empty info.investPrice}"><c:set var="InvestPrice" value="${info.investPrice}"/>
				<div class="midTitle" <c:if test="${not empty info.price}">style="padding-left:150px;"</c:if>><b>투자규모 : </b> ${info.investPrice}</div>
				</c:if>
				<c:if test="${not empty info.cstNm}"><!-- div class="midTitle"><b>중개인 : </b> ${info.cstCpnNm} ${info.cstNm}</div> --></c:if>
				
				<c:if test="${asterDeal ne 'Y'}">
				<!-- ----- 제안중 딜 인데 추천종목을 통해 등록되어서 추천정보가 있으면 뿌려준다 :S ----- -->
				<c:if test="${not empty rcmdDealInfo[0].rgNm}">
				<br/>
				<div style="border:2px dotted #CCCCCC; background-color:#F1F1F1;padding-left:3px;">
				<div class="post_info" style="float:right;padding-right:15px;padding-top:2px;"><span style="">추천인 : <b>${rcmdDealInfo[0].rgNm}</b></span> <span class="date">${fn:substring(rcmdDealInfo[0].rgDt,0,16)}</span></div>
				<div class="midTitle"><b><font color="#AAA">[ 추천종목 - ${rcmdDealInfo[0].cpnNm} ]</font></b></div>
				
				<div class="midTitle"><b>내용</b></div>
				<div class="fontResizable">${fn:replace(rcmdDealInfo[0].memo, lf,"<br/>")}</div>
				<br/>
				<div class="midTitle"><b>투자의견</b></div>
				<div class="fontResizable">${fn:replace(rcmdDealInfo[0].opinion, lf,"<br/>")}</div>
				<br/>
				
				<c:if test="${not empty rcmdDealInfo[0].realNm}">
					<div class="midTitle"><br/><b>첨부파일</b></div>
					<c:set var="eachFile" value="${fn:split(rcmdDealInfo[0].realNm, ',')}"/>
					<c:forEach var="Files" items="${eachFile}" varStatus="imStT">
						<c:set var="FileInfo" value="${fn:split(Files, '^')}"/>
						<c:set var="extension" value="${fn:split(FileInfo[1],'.')}"/>
						<c:set var="lastDot" value="${fn:length(extension)-1}"/>
						<input type="hidden"  id="mkNames${imStT.count}" value="${FileInfo[2]}"/>
						<c:set var="ext" value=""/>
						<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
						<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
						<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
						<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
						&nbsp;<img class="mail_send filePosition" id="o_file${imStT.count}"<c:choose><c:when test="${empty ext or ext == ''}">src="<c:url value='/images/file/files.png'/>"</c:when><c:otherwise>src="<c:url value='/images/file/${ext}.png'/>"</c:otherwise></c:choose>title="${FileInfo[1]}">${FileInfo[1]}
						<%--<a href="#" onclick="deleteFileOne(${FileInfo[0]}, '${FileInfo[2]}');"> <font color=red>x</font></a> --%><br/>
					</c:forEach>
				</c:if>
				
				<br/>
				
				</div>
				<br/>
				</c:if>
				<!-- ----- 제안중 딜 인데 추천종목을 통해 등록되어서 추천정보가 있으면 뿌려준다 :E ----- -->
				</c:if>
				
				
				<div class="midTitle"><b>내용</b></div>
				<div class="post_info registed"><c:if test="${userLoginInfo.permission > '00019'  or  userLoginInfo.name eq rgName}"><span class="btn s orange" onclick="statsOfferdivAjax(event,'${info.rgNm}',this,'${info.sNb}','')"><a>수정</a></span> </c:if><span class="by">등록 :</span> <span class="user"><a>${info.rgNm}</a></span> <span class="date">${fn:substring(info.rgDt,0,16)}</span>
					<a href="#" onclick="resizeFont(1);">▲</a><a href="#" onclick="resizeFont(0);">▼</a>
				</div>
				<div class="fontResizable"><c:choose><c:when test="${asterDeal eq 'Y'}">***</c:when><c:otherwise>${fn:replace(info.memo, lf,"<br/>")}</c:otherwise></c:choose></div>
				
				<c:if test="${asterDeal ne 'Y'}">
				<!-- 첨부파일 -->
				<c:if test="${not empty info.realNm}">
					<div class="midTitle"><br/><b>첨부파일</b></div>
					<c:set var="eachFile" value="${fn:split(info.realNm, ',')}"/>
					<c:forEach var="Files" items="${eachFile}" varStatus="imStT">
						<c:set var="FileInfo" value="${fn:split(Files, '^')}"/>
						<c:set var="extension" value="${fn:split(FileInfo[1],'.')}"/>
						<c:set var="lastDot" value="${fn:length(extension)-1}"/>
						<input type="hidden"  id="mkNames${imStT.count}" value="${FileInfo[2]}"/>
						<c:set var="ext" value=""/>
						<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
						<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
						<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
						<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
						&nbsp;<img class="mail_send filePosition" id="o_file${imStT.count}"<c:choose><c:when test="${empty ext or ext == ''}">src="<c:url value='/images/file/files.png'/>"</c:when><c:otherwise>src="<c:url value='/images/file/${ext}.png'/>"</c:otherwise></c:choose>title="${FileInfo[1]}">${FileInfo[1]}
						<%--<a href="#" onclick="deleteFileOne(${FileInfo[0]}, '${FileInfo[2]}');"> <font color=red>x</font></a> --%><br/>
					</c:forEach>
				</c:if>
				<!-- 첨부파일 -->
				</c:if>
			</div>
			</c:forEach>
			
			
<!-- 딜과정 -->
			<div class="cmt_box boxcontents">
				<div style="margin-bottom:10px;"><b><c:choose><c:when test="${asterDeal eq 'Y'}">***</c:when><c:otherwise>${disposalTitle}</c:otherwise></c:choose> 딜과정</b></div>
				<div class="midboxcontents">
					<c:if test="${not empty CstNm}">
					<div>
						<div class="inboxcontents">
							<c:choose>
								<c:when test="${asterDeal eq 'Y'}"><b>중개인</b><br/>***<br/><br/></c:when>
								<c:otherwise><div class="midTitle"><b>중개인</b><br/>${CstCpnNm}<br/><nobr>${CstNm}</nobr></div></c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="" style="float:left;width:60px;">
						<div class="inboxTextTop"<c:if test="${empty Price}"> style="margin-top:32px;"</c:if>><c:if test="${not empty Price}"><b>발행규모</b><br/>${Price}</c:if></div>
						<c:if test="${not empty InvestPrice}"><div class="inboxTextBottom"><b>투자규모</b><br/>${InvestPrice}</div></c:if>
					</div>
					<div class="arrowBar">▶</div>
					</c:if>
					<div>
						<div class="inboxcontents">
							<div class="midTitle"><b>소싱자</b><br/><div id="stfWr0"></div></div>
						</div>
						<c:forEach var="spt" items="${supportList}" varStatus="sptS"><c:if test="${spt.cate eq 1 and spt.offerSnb eq offerSNB}"><c:set var="sumRspt" value="${spt.ratio + sumRspt}"/>
						<div class="inboxcontents">
							<div class="midTitle"><nobr>${spt.usrNm} ${spt.ratio}%</nobr></div>
						</div>
						</c:if></c:forEach>
						<script>$('#stfWr0').html('<nobr>${rgName} ${100-(sumRspt)}'+'%</nobr>');
						//$('#stfWr0').html('<nobr>${rgName}</nobr>');
						</script>
					</div>
				<c:if test="${not empty disposalList}">
					<div style="margin-top:32px;width:20px;border-top:1px solid;"></div><div class="arrowBar">▶</div>
					<div>
						<!--매각-->
						<c:forEach var="dsps" items="${disposalList}" varStatus="dspsS"><c:set var="sumRspt1" value="0"/>
						<fmt:parseNumber var="intMargin" integerOnly="false" value="${dsps.margin}"/><c:set var="sumMargin" value="${intMargin+sumMargin}"/>
						<fmt:parseNumber var="intPrice" integerOnly="false" value="${dsps.price}"/><c:set var="sumPrice" value="${intPrice+sumPrice}"/>
						<div class="midboxcontents">
							<div>
								<div class="inboxcontents">
									<div class="midTitle"><b>매각인</b><br/><div id="stfWrk${dspsS.count}"></div></div>
								</div>
								<c:forEach var="spt" items="${supportList}" varStatus="sptS"><c:if test="${spt.cate eq 2 and spt.offerSnb eq dsps.sNb}"><c:set var="sumRspt1" value="${spt.ratio + sumRspt1}"/>
								<div class="inboxcontents">
									<div class="midTitle"><nobr>${spt.usrNm} ${spt.ratio}%</nobr></div>
								</div>
								</c:if></c:forEach>
								<script>$('#stfWrk${dspsS.count}').html('<nobr>${dsps.rgNm} ${100-(sumRspt1)}'+'%</nobr>');</script>
							</div>

							<div class="" style="float:left;width:50px;">
								<div class="inboxTextTop"><b>규모</b><br/>${dsps.price}</div>
								<div class="inboxTextBottom"><b>매각금</b><br/>${dsps.margin}</div>
							</div>
							<div class="arrowBar">▶</div>
							<div>
								<div class="inboxcontents hov" style="float:left;" onclick="popUp('','rcmdCst','','${dsps.snb2nd}');">
									<div class="midTitle"><b>거래상대방</b><br/>${dsps.cpnNm2nd}<br/><nobr>${dsps.cstNm2nd}</nobr></div>
								</div>
							</div>
							<div>
								<b>수익<br/> : <fmt:formatNumber value="${intMargin-intPrice}"/>억</b>
							</div>
						</div>
						</c:forEach>
						<!--매각-->
						
						<div class="boxBottom"></div>
					</div>
					<c:if test="${userLoginInfo.permission > '00019'}">
					<div style="margin-top:32px;width:20px;border-top:1px solid;"></div><div class="arrowBar">▶</div>
					<div>
						<b>수익<br/> : <fmt:formatNumber value="${sumMargin-sumPrice}"/>억</b>
					</div>
					</c:if>
				</c:if>
				</div>
				
				<div class="boxBottom clear"></div>
			</div>
<!-- 딜과정 -->


<!-- 버튼 -->
			<!-- 제안중일때 -->
			<c:if test="${readyDealYN eq 'Y'}">
					<div class="cmt_box boxcontents"
						<c:if test="${progressCode eq '00001'}">style="height:20px;background-color:skyblue;"</c:if>
						<c:if test="${progressCode eq '00002' or progressCode eq '00003' or progressCode eq '00004' or progressCode eq '00005'}">style="height:20px;background-color:lightgray;"</c:if>
						<c:if test="${progressCode eq '00006'}">style="height:20px;background-color:#E94F51;"</c:if>
						<c:if test="${progressCode eq '10000' or progressCode eq '10001' or progressCode eq '10002'}">style="height:20px;background-color:#5C5D5C;color:white;"</c:if>
				 	>
					<div style="float:left;font-size:14px;font-weight:bold;<c:if test="${progressCode == '10000' or progressCode eq '10001' or progressCode eq '10002'}">color:white;</c:if>">
					<c:if test="${offerCode == '00006' or offerCode == '00007'}">딜제안이 </c:if>
					<c:forEach var="cmmCd" items="${cmmCdProgressList}"><c:if test="${progressCode == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach>
					<c:if test="${progressCode == '00001'}"> 입니다.</c:if>
					<c:if test="${progressCode != '00001'}"> 되었습니다.</c:if></div>
					
					<c:if test="${asterDeal ne 'Y'}">	<!-- ================================== 권한별 *** 표기 :S =================================== -->
					<div style="text-align:right;">
						<c:if test="${userLoginInfo.permission > '00010'  or  userLoginInfo.name eq rgName}">
							<c:if test="${progressCode != '00001'}"><span class="btn m blue"><a onclick="javascript:progressBTN('00001')">진행</a></span></c:if>
							<span class="btn m red"><a onclick="javascript:progressBTN('20000')">딜이동</a></span>
							<c:if test="${progressCode != '00002'}"><span class="btn m gray"><a onclick="javascript:progressBTN('00002')">보류</a></span></c:if>
							<span class="btn m black"><a onclick="javascript:progressBTN('10000')">DROP</a></span>
							<span class="btn m black"><a onclick="javascript:progressBTN('10001')">타사투자</a></span>
							<span class="btn m black"><a onclick="javascript:progressBTN('10002')">발행취소</a></span>
						</c:if>
					</div>
					</c:if>	<!-- ================================== 권한별 *** 표기 :E =================================== -->
			</c:if>
			
			<!-- 제안중이 아닌 진행건 -->
			<c:if test="${readyDealYN eq 'N'}">
				<!-- M&A 건 -->
				<c:if test="${mnaYN eq 'Y'}">
					<div class="cmt_box boxcontents"
						<c:if test="${progressCode eq '00001'}">style="height:20px;background-color:skyblue;"</c:if>
						<c:if test="${progressCode eq '00002' or progressCode eq '00003' or progressCode eq '00004' or progressCode eq '00005'}">style="height:20px;background-color:lightgray;"</c:if>
						<c:if test="${progressCode eq '00006'}">style="height:20px;background-color:#E94F51;"</c:if>
						<c:if test="${progressCode eq '10000'}">style="height:20px;background-color:#5C5D5C;color:white;"</c:if>
				 	>
					<div style="float:left;font-size:14px;font-weight:bold;<c:if test="${progressCode == '10000'}">color:white;</c:if>">
					딜이
					<c:forEach var="cmmCd" items="${cmmCdProgressList}"><c:if test="${progressCode == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach>
					<c:if test="${progressCode eq '00001'}"> 입니다.</c:if>
					<c:if test="${progressCode ne '10000' and progressCode ne '00006' and progressCode ne '00001'}"> 상태입니다.</c:if>
					<c:if test="${progressCode eq '10000' or  progressCode eq '00006'}"> 되었습니다.</c:if>
					<%-- 투자결정일(통계일)
					<c:if test="${asterDeal ne 'Y'}">	<!-- ================================== 권한별 *** 표기 :S =================================== -->
					<!-- 투자결정일 -->
					<c:if test="${progressCode == '00006'}">
						<span style="padding-bottom:5px;padding-top:2px;border-radius: 5px 5px 5px; border: 1px dotted pink;">
						<a href="javascript:popCalendar();" class="btn_calendar" title="통계의 기준이 되는 년월일"><font color=white style="font-size:12px;">&nbsp;통계일</font></a><input type="text" id="investDate" style="padding-left:2px;width:65px;" title="통계의 기준이 되는 년월일" /><span class="btn s orange" style="padding-bottom:2px;" title="통계의 기준이 되는 년월일 저장"><a href="javascript:doSaveInvestDt();">저장</a></span>&nbsp;
						</span>						
					</c:if>
					</c:if>
					--%>
					</div>
					
					<c:if test="${asterDeal ne 'Y'}">	<!-- ================================== 권한별 *** 표기 :S =================================== -->
					<div style="text-align:right;">
						<c:if test="${progressCode != '00001'}">
						<span class="btn m blue<c:if test="${userLoginInfo.permission < '00013'  and  userLoginInfo.name!=rgName}"> dspN</c:if>"><a onclick="javascript:progressBTN('00001')">대기</a></span><span style="width:1px;display:inline-block"></span>
						</c:if>
						<%--<span>
						<div style="display:inline-table;">
						<c:forEach var="match" items="${mnaMatchList}" varStatus="mtchS"><c:if test="${mtchS.count>1}"><br/></c:if>
							<span class="btn m orange match"><a id="AP_cpnNm_mc">매칭회사: ${match.cpnNm} <span style="color:navy;font-weight:bold;" onclick="javascript:delMnaMatchCpn('${match.sNb}');">x</span></a></span><span style="width:10px;display:inline-block"></span>
						</c:forEach>
						</div>
						</span>--%>
						<c:if test="${userLoginInfo.permission > '00010'  or  userLoginInfo.name eq rgName}">
						<span class="btn m"><a onclick="javascript:matchingCpn()">SI추천</a></span><span style="width:1px;display:inline-block"></span>
						<span class="btn m"><a onclick="javascript:progressBTN('00003')">미팅</a></span><span style="width:1px;display:inline-block"></span>
						<span class="btn m"><a onclick="javascript:progressBTN('00004')">계약</a></span><span style="width:1px;display:inline-block"></span>
						<span class="btn m"><a onclick="javascript:progressBTN('00005')">실사</a></span><span style="width:1px;display:inline-block"></span>
						<span class="btn m red"><a onclick="javascript:progressBTN('00006')">투자결정</a></span><span style="width:1px;display:inline-block"></span>
						<span class="btn m black"><a onclick="javascript:progressBTN('10000')">DROP</a></span>
						</c:if>
					</div>
					</c:if>	<!-- ================================== 권한별 *** 표기 :E =================================== -->
				</c:if>
				
				<!-- M&A 아닌 모든 건 -->
				<c:if test="${mnaYN eq 'N'}">
					<div class="cmt_box boxcontents"
						<c:if test="${progressCode == '00001'}">style="height:20px;background-color:skyblue;"</c:if>
						<c:if test="${progressCode == '00002'}">style="height:20px;background-color:lightgray;"</c:if>
						<c:if test="${progressCode == '00003'}">style="height:20px;background-color:#E94F51;"</c:if>
						<c:if test="${progressCode == '10000' or progressCode == '10001' or progressCode == '10002'}">style="height:20px;background-color:#5C5D5C;color:white;"</c:if>
						
				 	>
					<div style="float:left;font-size:14px;font-weight:bold;<c:if test="${progressCode == '10000' or progressCode == '10001' or progressCode == '10002'}">color:white;</c:if>">
					<c:if test="${offerCode == '00013'}">추천종목이 </c:if>
					<c:if test="${offerCode == '00006' or offerCode == '00007'}">딜이 </c:if>
					<c:forEach var="cmmCd" items="${cmmCdProgressList}"><c:if test="${progressCode == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach>
					<c:if test="${progressCode == '00001'}"> 입니다.</c:if>
					<c:if test="${progressCode != '00001'}"> 되었습니다.</c:if>
					
					<%-- 투자결정일(통계일)
					<c:if test="${asterDeal ne 'Y'}">	<!-- ================================== 권한별 *** 표기 :S =================================== -->
					<!-- 투자결정일 -->
					<c:if test="${progressCode == '00003'}">
						<span style="padding-bottom:5px;padding-top:2px;border-radius: 5px 5px 5px; border: 1px dotted pink;">
						<a href="javascript:popCalendar();" class="btn_calendar" title="통계의 기준이 되는 년월일"><font color=white style="font-size:12px;">&nbsp;통계일</font></a><input type="text" id="investDate" style="padding-left:2px;width:65px;" title="통계의 기준이 되는 년월일" /><span class="btn s orange" style="padding-bottom:2px;" title="통계의 기준이 되는 년월일 저장"><a href="javascript:doSaveInvestDt();">저장</a></span>&nbsp;
						</span>						
					</c:if>
					</c:if>
					--%>
					</div>
					
					<c:if test="${asterDeal ne 'Y'}">	<!-- ================================== 권한별 *** 표기 :S =================================== -->
					<div style="text-align:right;">
						<c:if test="${userLoginInfo.permission > '00010'  or  userLoginInfo.name eq rgName}">
							<c:if test="${progressCode != '00001'}"><span class="btn m blue"><a onclick="javascript:progressBTN('00001')">진행</a></span></c:if>
						<%--<span class="btn m orange"><a onclick="javascript:disposalModal('${offerSNB}',this,event);">매각</a></span>--%>
							<span class="btn m red"><a onclick="javascript:progressBTN('00003','${offerSNB}',this,event)">투자결정</a></span>
							<c:if test="${progressCode != '00002'}"><span class="btn m gray"><a onclick="javascript:progressBTN('00002')">보류</a></span></c:if>
							<span class="btn m black"><a onclick="javascript:progressBTN('10000')">DROP</a></span>
							<span class="btn m black"><a onclick="javascript:progressBTN('10001')">타사투자</a></span>
							<span class="btn m black"><a onclick="javascript:progressBTN('10002')">발행취소</a></span>
						</c:if>
					</div>
					</c:if>	<!-- ================================== 권한별 *** 표기 :E =================================== -->
					
				</c:if>
			</c:if>
		
<!-- 버튼 -->

</div>

<div style="display:none;position:absolute; width: 350px;  height: expression( this.scrollHeight > 99 ? 200px : auto ); border:2px solid #cccccc;  background-color:white; z-index:10000;" id="userDetailArea">
	<div style="background:#51565f;padding:7px; text-align: right;">
		<div style="margin-right:10px;color:white;cursor:pointer;" onclick="$('#userDetailArea').hide();"><strong>X</strong></div>
	</div>
	<div id="userDtTableArea" style="width:90%;margin:auto;margin-top:30px;margin-bottom:30px;"></div>
</div>

<div class="cmt_box boxcontents" style="border: 2px solid #42a2ca;padding: 9px 15px;height:25px; ">
	<div style="float:left;">
		<span class="h3_title_basic" >분석 진행상황  :</span>
		<span class="count new">
			<span id="progressArea" style="margin-left:10px;"></span>
		</span>
	</div>
	<c:if test="${asterDeal ne 'Y'}">	<!-- ================================== 권한별 *** 표기 :S =================================== -->
	<div style="width:auto;">
		<div style="text-align: right;">
			<span id="userSelectArea" style="margin-left:15px;"></span>
			<input type="button" class="btn_b_skyblue mgl5" style="color:black;" value="지정" onclick="doSaveAnalyUser();"/>
			<span>
				<input type="button" class="btn_b_skyblue mgl5" style="color:black;" value="수정" onclick="showPopup(this);"/>
			</span>
		
			<span id="analyUserArea" style="margin-left:20px;"></span>
		</div>	
	</div>
	</c:if>	<!-- ================================== 권한별 *** 표기 :E =================================== -->
</div>
		
		<c:if test="${asterDeal ne 'Y'}">	<!-- ================================== 권한별 *** 표기 :S =================================== -->

			<c:if test="${not empty mnaMatchList}">
			<div class="cmt_box boxcontents">
				<table>
					<colgroup>
						<col width="60">
						<col width="120">
						<col width="">
						<col width="30">
					</colgroup>
					<tr style="font-weight:bold;"><td>담당자</td><td>SI추천 회사</td><td>의견</td></tr>
				<c:forEach var="match" items="${mnaMatchList}" varStatus="mtchS">
					<tr>
						<td>${match.usrNm}</td>
						<td><a style="cursor:pointer;color:navy;font-weight:bold;" onclick="javascript:popUp('','rcmdCpn','','${match.cpnSnb}');">${match.cpnNm}</a></td>
						<td class="hov" onclick="javascript:view('matchPr${match.sNb}',this,event);"><c:choose><c:when test="${empty match.comment}"><span style="color:lightgray">의견 입력</span></c:when><c:otherwise>${match.comment}</c:otherwise></c:choose></td>
						<td><a style="cursor:pointer;color:navy;font-weight:bold;" onclick="javascript:delMnaMatchCpn('${match.sNb}');">x</a></td>
					</tr>
				</c:forEach>
				</table>
			</div>
			
<script>
	$(document).on("click",".matchComment_btnOk", function(){
		var obj = $(this).parent().parent().parent();
		var DATA = null
			, upId = $('#rgstId').val()
			,url = "<c:url value='/work/matchComment.do' />"
			,fn = function(){
				location.reload(true);
			};

		// if(!confirm("적용하시겠습니까?")){ return; }
		DATA = {
			sNb: obj.find('[id^=matchSNb]').val()
			,comment: obj.find('[id^=matcharea]').val()
			,rgId: upId
		};
		ajaxModule(DATA,url,fn);
	});
</script>
			</c:if>
	<c:forEach var="match" items="${mnaMatchList}" varStatus="status">
<!-- 매칭회사 의견 -->
		<div class="popUpMenu title_area" id="matchPr${match.sNb}" name="textR">
			<input type="hidden" id="matchSNb${match.sNb}" value="${match.sNb }">
			<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
			<ul><c:choose>
				<c:when test="${empty match.comment}"><li class="c_note"><textarea id="matcharea0" placeholder="의견을 입력하세요."></textarea></li></c:when>
				<c:otherwise><li class="c_note"><textarea id="matcharea${match.sNb}">${match.comment}</textarea></li></c:otherwise></c:choose>
				<p class="bsnsR_btn">
					<span class="matchComment_btnOk btn s green"><a>입력</a></span>&nbsp;&nbsp;&nbsp;
					<!-- <span class="dealResult_btnDel">완전삭제</span> -->
				</p>
			</ul>
		</div>
<!-- 매칭회사 의견 -->
	</c:forEach>
<!-- 분석 -->
			<c:if test="${not empty analysisList}">
			<div class="cmt_box boxcontents">
				<p class="title"><b>분석</b></p>
				<c:forEach var="analysis" items="${analysisList}" varStatus="ANSst">
				<c:if test="${ANSst.count>1}"><p class="hr"></p><br/></c:if>
				<div class="cmt">
					<div id="" class="message">
						<div class="post_info">
						
						<span class="analist"><span class="user"><a>${analysis.rgNm}</a></span> <span class="date">${fn:substring(analysis.tmDt,0,16)}</span></span>
						
						<!-- 분석의견 :S -->
						<c:if test="${not empty analysis.star}"><br/>
						<div class="post_analysis">
							<b>-&nbsp;분석의견</b>							
							<c:forEach var="starC" begin="1" end="${analysis.star}"><img class="hand" id="file${starC}" src="../images/figure/star_y.png" style="width:16px;height:16px;vertical-align:middle;" /></c:forEach>
							<c:forEach var="starC" begin="${analysis.star+1}" end="5"><img class="hand" id="file${starC}" src="../images/figure/star_g.png" style="width:16px;height:16px;vertical-align:middle;" /></c:forEach>
							
							<span>&nbsp;
							(
								<c:if test="${analysis.expirationDt lt 12 }">${analysis.expirationDt }개월</c:if>
								<c:if test="${analysis.expirationDt ge 12 }"><fmt:formatNumber value="${analysis.expirationDt / 12}" minFractionDigits="0" maxFractionDigits="0"/>년</c:if>
							)
							</span><br/>
							<span>${fn:replace(analysis.comment, lf,"<br/>")}</span>
						</div>
						</c:if>
						<!-- 분석의견 :E -->
						
	<!--  -->
						<c:if test="${not empty analysis.realNm}"><br/>
							<b>첨부파일</b><br/>
							<c:choose>
							<c:when test="${fn:indexOf(analysis.realNm,'^^^') > 0}">
								<c:set var="imgNm" value="${fn:split(analysis.realNm, '^^^')}"/>
								<c:set var="makeNm" value="${fn:split(analysis.makeNm, '^^^')}"/>
								<c:forEach var="mkNm" items="${makeNm}" varStatus="mkSt">
									<input type="hidden" id="mkNames${mkSt.count}" value="${mkNm}"/>
								</c:forEach>
								<c:forEach var="im" items="${imgNm}" varStatus="imSt">
									<c:set var="extension" value="${fn:split(im,'.')}"/>
									<c:set var="lastDot" value="${fn:length(extension)-1}"/>
									<c:set var="ext" value=""/>
									<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
									<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
									<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
									<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
									&nbsp;<img class="mail_send filePosition" id="a_file${imSt.count}"<c:choose><c:when test="${empty ext or ext == ''}">src="<c:url value='/images/file/files.png'/>"</c:when><c:otherwise>src="<c:url value='/images/file/${ext}.png'/>"</c:otherwise></c:choose>title="${im}">
									${im}<%--<a href="#" onclick="deleteFileOne(${analysis.sNb}, '${makeNm[imSt.count-1]}');return false;"> <font color=red>x</font></a> --%><br/>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:set var="extension" value="${fn:split(analysis.realNm,'.')}"/>
								<c:set var="lastDot" value="${fn:length(extension)-1}"/>
								<input type="hidden"  id="mkNames1" value="${analysis.makeNm}"/>
								<c:set var="ext" value=""/>
								<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
								<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
								<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
								<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
								&nbsp;<img class="mail_send filePosition" id="a_file1"<c:choose><c:when test="${empty ext or ext == ''}">src="<c:url value='/images/file/files.png'/>"</c:when><c:otherwise>src="<c:url value='/images/file/${ext}.png'/>"</c:otherwise></c:choose>title="${analysis.realNm}">
								${analysis.realNm}<%--<a href="#" onclick="deleteFileOne(${analysis.sNb}, '${analysis.makeNm}');return false;"> <font color=red>x</font></a> --%><br/>
							</c:otherwise>
							</c:choose>
						</c:if>
	<!--  -->
	
						</div>
						<div class="post_data">
							<div id="user_adv${ANSst.count}" class="user_text">${fn:replace(analysis.memo, lf,"<br/>")}</div>
						</div>
						
					</div>
				</div>
				</c:forEach>
			</div>
			</c:if>
<!-- 분석 -->
<!-- 제안서 -->
			<c:if test="${not empty proposalList}">
			<div class="cmt_box boxcontents">
				<p class="title"><b>제안서</b></p>
				<c:forEach var="prpsl" items="${proposalList}" varStatus="ANSst">
				<c:if test="${ANSst.count>1}"><p class="hr"></p><br/></c:if>
				<div class="cmt">
					<div id="" class="message">
						<div class="post_info">
						
						<span class="analist"><span class="user"><a>${prpsl.rgNm}</a></span> <span class="date">${fn:substring(prpsl.tmDt,0,16)}</span></span>
	<!--  -->
						<c:if test="${not empty prpsl.realNm}"><br/>
							<b>첨부파일</b><br/>
							<c:choose>
							<c:when test="${fn:indexOf(prpsl.realNm,'^^^') > 0}">
								<c:set var="imgNm" value="${fn:split(prpsl.realNm, '^^^')}"/>
								<c:set var="makeNm" value="${fn:split(prpsl.makeNm, '^^^')}"/>
								<c:forEach var="mkNm" items="${makeNm}" varStatus="mkSt">
									<input type="hidden" id="mkNames${mkSt.count}" value="${mkNm}"/>
								</c:forEach>
								<c:forEach var="im" items="${imgNm}" varStatus="imSt">
									<c:set var="extension" value="${fn:split(im,'.')}"/>
									<c:set var="lastDot" value="${fn:length(extension)-1}"/>
									<c:set var="ext" value=""/>
									<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
									<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
									<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
									<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
									&nbsp;<img class="mail_send filePosition" id="p_file${imSt.count}"<c:choose><c:when test="${empty ext or ext == ''}">src="<c:url value='/images/file/files.png'/>"</c:when><c:otherwise>src="<c:url value='/images/file/${ext}.png'/>"</c:otherwise></c:choose>title="${im}">
									${im}<%--<a href="#" onclick="deleteFileOne(${prpsl.sNb}, '${makeNm[imSt.count-1]}');return false;"> <font color=red>x</font></a> --%><br/>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:set var="extension" value="${fn:split(prpsl.realNm,'.')}"/>
								<c:set var="lastDot" value="${fn:length(extension)-1}"/>
								<input type="hidden"  id="mkNames1" value="${prpsl.makeNm}"/>
								<c:set var="ext" value=""/>
								<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
								<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
								<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
								<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
								&nbsp;<img class="mail_send filePosition" id="p_file1"<c:choose><c:when test="${empty ext or ext == ''}">src="<c:url value='/images/file/files.png'/>"</c:when><c:otherwise>src="<c:url value='/images/file/${ext}.png'/>"</c:otherwise></c:choose>title="${prpsl.realNm}">
								${prpsl.realNm}<%--<a href="#" onclick="deleteFileOne(${prpsl.sNb}, '${prpsl.makeNm}');return false;"> <font color=red>x</font></a> --%><br/>
							</c:otherwise>
							</c:choose>
						</c:if>
	<!--  -->
						</div>
						<div class="post_data">
							<div id="user_pps${ANSst.count}" class="user_text">${fn:replace(prpsl.memo, lf,"<br/>")}</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			</c:if>
<!-- 제안서 -->
<!-- IR -->
			<c:if test="${not empty irList}">
			<div class="cmt_box boxcontents">
				<p class="title"><b>IR</b></p>
				<c:forEach var="ir" items="${irList}" varStatus="irS">
				<c:if test="${irS.count>1}"><p class="hr"></p><br/></c:if>
				<div class="cmt">
					<div id="" class="message">
						<div class="post_info">
						
						<span class="analist"><span class="user"><a>${ir.rgNm}</a></span> <span class="date">${fn:substring(ir.tmDt,0,16)}</span></span>
						
						<!-- 분석의견 :S -->
						<c:if test="${not empty ir.star}"><br/>
						<div class="post_analysis">
							<b>-&nbsp;분석의견</b>							
							<c:forEach var="starC1" begin="1" end="${ir.star}"><img class="hand" id="file${starC}" src="../images/figure/star_y.png" style="width:16px;height:16px;vertical-align:middle;" /></c:forEach>
							<c:forEach var="starC1" begin="${ir.star+1}" end="5"><img class="hand" id="file${starC}" src="../images/figure/star_g.png" style="width:16px;height:16px;vertical-align:middle;" /></c:forEach>
							
							<span>&nbsp;
							(
								<c:if test="${ir.expirationDt lt 12 }">${ir.expirationDt }개월</c:if>
								<c:if test="${ir.expirationDt ge 12 }"><fmt:formatNumber value="${ir.expirationDt / 12}" minFractionDigits="0" maxFractionDigits="0"/>년</c:if>
							)
							</span><br/>
							<span>${ir.comment }</span>
						</div>
						</c:if>
						<!-- 분석의견 :E -->
	
						<c:if test="${not empty ir.realNm}"><br/>
							<b>첨부파일</b><br/>
							<c:choose>
							<c:when test="${fn:indexOf(ir.realNm,'^^^') > 0}">
								<c:set var="imgNm" value="${fn:split(ir.realNm, '^^^')}"/>
								<c:set var="makeNm" value="${fn:split(ir.makeNm, '^^^')}"/>
								<c:forEach var="mkNm" items="${makeNm}" varStatus="mkSt">
									<input type="hidden" id="mkNames${mkSt.count}" value="${mkNm}"/>
								</c:forEach>
								<c:forEach var="im" items="${imgNm}" varStatus="imSt">
									<c:set var="extension" value="${fn:split(im,'.')}"/>
									<c:set var="lastDot" value="${fn:length(extension)-1}"/>
									<c:set var="ext" value=""/>
									<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
									<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
									<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
									<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
									&nbsp;<img class="mail_send filePosition" id="p_file${imSt.count}"<c:choose><c:when test="${empty ext or ext == ''}">src="<c:url value='/images/file/files.png'/>"</c:when><c:otherwise>src="<c:url value='/images/file/${ext}.png'/>"</c:otherwise></c:choose>title="${im}">
									${im}<%--<a href="#" onclick="deleteFileOne(${ir.sNb}, '${makeNm[imSt.count-1]}');return false;"> <font color=red>x</font></a> --%><br/>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:set var="extension" value="${fn:split(ir.realNm,'.')}"/>
								<c:set var="lastDot" value="${fn:length(extension)-1}"/>
								<input type="hidden"  id="mkNames1" value="${ir.makeNm}"/>
								<c:set var="ext" value=""/>
								<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
								<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
								<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
								<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
								&nbsp;<img class="mail_send filePosition" id="p_file1"<c:choose><c:when test="${empty ext or ext == ''}">src="<c:url value='/images/file/files.png'/>"</c:when><c:otherwise>src="<c:url value='/images/file/${ext}.png'/>"</c:otherwise></c:choose>title="${ir.realNm}">
								${ir.realNm}<%--<a href="#" onclick="deleteFileOne(${ir.sNb}, '${ir.makeNm}');return false;"> <font color=red>x</font></a> --%><br/>
							</c:otherwise>
							</c:choose>
						</c:if>
	<!--  -->
						</div>
						<div class="post_data">
							<div id="user_pps${irS.count}" class="user_text">${fn:replace(ir.memo, lf,"<br/>")}</div>
						</div>
						
					</div>
				</div>
				</c:forEach>
			</div>
			</c:if>
<!-- IR -->
		
<!-- 탐방(visit) -->
			<c:if test="${not empty visitList}">
			<div class="cmt_box boxcontents">
				<p class="title"><b>탐방</b></p>
				<c:forEach var="visit" items="${visitList}" varStatus="visitS">
				<c:if test="${visitS.count>1}"><p class="hr"></p><br/></c:if>
				<div class="cmt">
					<div id="" class="message">
						<div class="post_info">
						
						<span class="analist"><span class="user"><a>${visit.rgNm}</a></span> <span class="date">${fn:substring(visit.tmDt,0,16)}</span></span>
						
						<!-- 분석의견 :S -->
						<c:if test="${not empty visit.star}"><br/>
						<div class="post_analysis">
							<b>-&nbsp;분석의견</b>							
							<c:forEach var="starC1" begin="1" end="${visit.star}"><img class="hand" id="file${starC}" src="../images/figure/star_y.png" style="width:16px;height:16px;vertical-align:middle;" /></c:forEach>
							<c:forEach var="starC1" begin="${visit.star+1}" end="5"><img class="hand" id="file${starC}" src="../images/figure/star_g.png" style="width:16px;height:16px;vertical-align:middle;" /></c:forEach>
							
							<span>&nbsp;
							(
								<c:if test="${visit.expirationDt lt 12 }">${visit.expirationDt }개월</c:if>
								<c:if test="${visit.expirationDt ge 12 }"><fmt:formatNumber value="${visit.expirationDt / 12}" minFractionDigits="0" maxFractionDigits="0"/>년</c:if>
							)
							</span><br/>
							<span>${visit.comment }</span>
						</div>
						</c:if>
						<!-- 분석의견 :E -->
	
						<c:if test="${not empty visit.realNm}"><br/>
							<b>첨부파일</b><br/>
							<c:choose>
							<c:when test="${fn:indexOf(visit.realNm,'^^^') > 0}">
								<c:set var="imgNm" value="${fn:split(visit.realNm, '^^^')}"/>
								<c:set var="makeNm" value="${fn:split(visit.makeNm, '^^^')}"/>
								<c:forEach var="mkNm" items="${makeNm}" varStatus="mkSt">
									<input type="hidden" id="mkNames${mkSt.count}" value="${mkNm}"/>
								</c:forEach>
								<c:forEach var="im" items="${imgNm}" varStatus="imSt">
									<c:set var="extension" value="${fn:split(im,'.')}"/>
									<c:set var="lastDot" value="${fn:length(extension)-1}"/>
									<c:set var="ext" value=""/>
									<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
									<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
									<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
									<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
									&nbsp;<img class="mail_send filePosition" id="p_file${imSt.count}"<c:choose><c:when test="${empty ext or ext == ''}">src="<c:url value='/images/file/files.png'/>"</c:when><c:otherwise>src="<c:url value='/images/file/${ext}.png'/>"</c:otherwise></c:choose>title="${im}">
									${im}<%--<a href="#" onclick="deleteFileOne(${ir.sNb}, '${makeNm[imSt.count-1]}');return false;"> <font color=red>x</font></a> --%><br/>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:set var="extension" value="${fn:split(visit.realNm,'.')}"/>
								<c:set var="lastDot" value="${fn:length(extension)-1}"/>
								<input type="hidden"  id="mkNames1" value="${visit.makeNm}"/>
								<c:set var="ext" value=""/>
								<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
								<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
								<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
								<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
								&nbsp;<img class="mail_send filePosition" id="p_file1"<c:choose><c:when test="${empty ext or ext == ''}">src="<c:url value='/images/file/files.png'/>"</c:when><c:otherwise>src="<c:url value='/images/file/${ext}.png'/>"</c:otherwise></c:choose>title="${visit.realNm}">
								${visit.realNm}<%--<a href="#" onclick="deleteFileOne(${ir.sNb}, '${ir.makeNm}');return false;"> <font color=red>x</font></a> --%><br/>
							</c:otherwise>
							</c:choose>
						</c:if>
	<!--  -->
						</div>
						<div class="post_data">
							<div id="user_pps${visitS.count}" class="user_text">${fn:replace(visit.memo, lf,"<br/>")}</div>
						</div>
						
					</div>
				</div>
				</c:forEach>
			</div>
			</c:if>
<!-- 탐방(visit) -->



<!-- 의견쓰기 -->
			<div class="cmt_box">
				<div class="cmt_top">
					<p class="count new"><span class="btn s red" onclick="comment_open(this)" style="color:white;margin-right:10px;"><a><c:if test="${empty opinionList}">▲</c:if><c:if test="${not empty opinionList}">▼</c:if></a></span>
						<span style="color:navy;pointer:none;">의견쓰기</span>
						<span style="margin-left:10px;"><label onclick="changeDealCate('1','${offerSNB}');"><input type="radio" name="rdoS" value="" align="absmiddle" checked="checked"/>의견</label></span>
						<span><label onclick="changeDealCate('2','');"><input type="radio" name="rdoS" value="" align="absmiddle"/>분석</label></span>
						<span><label onclick="changeDealCate('3','');"><input type="radio" name="rdoS" value="" align="absmiddle"/>제안서</label></span>
						<span><label onclick="changeDealCate('4','');"><input type="radio" name="rdoS" value="" align="absmiddle"/>IR</label></span>
					</p>
					<!-- <a onclick="comment_open()" class="new">코멘트 쓰기</a> -->
				</div>
				
				<div class="new_cmt"<c:if test="${not empty opinionList}">style="display: none;"</c:if>>
				<c:if test="${projectYN == 'Y'}">
					<div style="margin-bottom:5px;"><b>추천회사: </b><input type="text" id="toast_recom_cpn" placeholder="회사명 1개"/> <span style="color:red;font-weight:bold;">* 여러회사를 입력시 각각을 따로 입력하세요.</span></div>
				</c:if>
					<div class="form"><div class="textwrap"><div>
						<textarea <%--  onkeyup="resizeTextarea(this)"  --%>id="toast_comment_text" toast="required:true,maxLength:5000" style="width: 100%;margin-bottom:3px; height:115px;min-height:0;"<c:if test="${projectYN == 'Y'}">placeholder="추천회사 내용입력"</c:if>></textarea>
						
						<div id="divAnalysis" style="margin-left:10px;margin-bottom:3px;display:none;">
							<input type="hidden" id="chkStar" value=""/>
							
							<b>*분석의견</b>
							<c:forEach var="starC" begin="0" end="4" varStatus="starCS">
								<img class="hand" id="file${starCS.count}" src="../images/figure/star_g.png" style="width:16px;height:16px;vertical-align:middle;" onmousedown="javascript:slctStar(this);" />
							</c:forEach>
							&nbsp;&nbsp;(※분석 유효기간 : 
							<label><input type="radio" name="expirationDate" value="3">3개월</label>
							<label><input type="radio" name="expirationDate" value="6">6개월</label>
							<label><input type="radio" name="expirationDate" value="9">9개월</label>
							<label><input type="radio" name="expirationDate" value="12">1년 </label>
							<label><input type="radio" name="expirationDate" value="24">2년 </label>
							)
							<br>
							<textarea id="kyPoint" class="d_note" style="margin-top:5px;width:500px;font-size:12px;" placeholder="분석의견을 입력하세요"></textarea>
						</div>
						
					</div></div></div>
					<div class="action">
						<!-- <input id="files-upload" name="files-upload" type="file" multiple accept="" style="display:none;"> -->
						<a class="btn glass s" onclick="$('#files-upload').click();" style="color:blue;width:60px;font-weight:bold;"><img src="<c:url value='/images/file/fileDisk.png' />" align="absmiddle">File</a>
						<span class="btn s green"><a id="insertBtnA" href="javascript:saveComment('','${offerSNB}')">저장</a></span>
						<span class="btn s red"><a href="javascript:write_cancle('ist')">취소</a></span></div>
					<div><table id="file_list"></table></div>
				</div>
				
<!-- 의견 -->
				<c:forEach var="opinion" items="${opinionList}" varStatus="OPst">
				<c:if test="${OPst.count>1}">
					<p class="hr clear"<c:if test="${projectYN == 'Y' and opinion.opinion eq CompanyName }"> style="margin-left:100px;"</c:if>></p>
				</c:if>
				<div class="cmt" style="overflow:hidden;">
					<c:if test="${projectYN == 'Y'}">
					<div style="float:left;width:100px;">&nbsp;<c:if test="${opinion.opinion ne CompanyName}"><c:if test="${empty opinion.opinion}">무제</c:if>${opinion.opinion}</c:if></div>
					<c:set var="CompanyName" value="${opinion.opinion}"/>
					</c:if>
					<div class="message"<c:if test="${projectYN == 'Y'}"> style="float:left;width:calc(100% - 105px);"</c:if>>
						<input type="hidden" id="OPsNb${OPst.count}" value="${opinion.sNb}">
						<div class="post_info">
							<span class="user">${opinion.cstNm}</span> <span class="date">${fn:substring(opinion.rgDt,0,16)}</span>
							<c:if test="${userLoginInfo.permission > '00019'  or  userLoginInfo.name==opinion.cstNm}">
							<span class="cur" onclick="javascript:modify_comment(${OPst.count})"><img src="<c:url value='/images/recommend/modify.png'/>" title="수정"/></span>&nbsp;<span class="cur" onclick="javascript:saveComment('${OPst.count}')"><img src="<c:url value='/images/recommend/delete.png'/>" title="삭제"/></span>
							</c:if>
						</div>
						<div class="post_data">
							<div id="user_text${OPst.count}" class="user_text">${fn:replace(fn:replace(opinion.comment, sp,"&nbsp; "),lf,"<br/>")}</div>
							<div id="modi_textarea${OPst.count}" style="display:none">
								<c:if test="${projectYN == 'Y'}">
								<div style="margin-bottom:5px;"><b>추천회사: </b><input type="text" id="toast_recom_cpn${OPst.count}" value="${opinion.opinion}" placeholder="회사명 1개"/> <span style="color:red;font-weight:bold;">* 여러회사를 입력시 각각을 따로 입력하세요.</span></div>
								</c:if>
								<textarea onclick="resizeTextarea(this)" id="toast_comment_text${OPst.count}" toast="required:true,maxLength:5000" style="width: 100%; height: 115px;">${opinion.comment}</textarea>
								
								<a class="btn glass s" onclick="$('#files-upload2').click();g_upIdx=${OPst.count}" style="color:blue;width:60px;font-weight:bold;"><img src="<c:url value='/images/file/fileDisk.png' />" align="absmiddle">File</a>
								
								<span class="btn s green"><a onclick="javascript:saveComment2('${OPst.count}','${offerSNB}')">저장</a></span>
								<span class="btn s red"><a href="javascript:write_cancle('mdf','${OPst.count}')">취소</a></span>
								<div><table id="file_list2_${OPst.count}"></table></div>
							</div>
						</div>
						<div>
							<c:if test="${not empty opinion.realNm}"><br/>
								<c:set var="eachFile" value="${fn:split(opinion.realNm, ',')}"/>
								<c:forEach var="Files" items="${eachFile}" varStatus="imStT">
									<c:set var="FileInfo" value="${fn:split(Files, '^')}"/>
									<c:set var="extension" value="${fn:split(FileInfo[1],'.')}"/>
									<c:set var="lastDot" value="${fn:length(extension)-1}"/>
									<input type="hidden"  id="mkNames${imStT.count}" value="${FileInfo[2]}"/>
									<c:set var="ext" value=""/>
									<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
									<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
									<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
									<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
									<img class="mail_send filePosition" id="o_file${imStT.count}"<c:choose><c:when test="${empty ext or ext == ''}">src="<c:url value='/images/file/files.png'/>"</c:when><c:otherwise>src="<c:url value='/images/file/${ext}.png'/>"</c:otherwise></c:choose>title="${FileInfo[1]}" align="absmiddle"> <a id="ffile${imStT.count}" class="hand filePosition" style="color:navy;"></a>${FileInfo[1]}
									<c:if test="${userLoginInfo.permission > '00019'  or  userLoginInfo.name==opinion.cstNm}">
									<a href="#" onclick="deleteFileOne(${FileInfo[0]}, '${FileInfo[2]}');return false;"> <font color=red>x</font></a>
									</c:if>
									<br/>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>

	</c:if>	<!-- ================================== 권한별 *** 표기 :S =================================== -->

<div class="clear"></div>
</body>
</html>