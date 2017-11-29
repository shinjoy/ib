<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>인수자 선택</title>
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">

<link href="<c:url value='/css_m/default.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css_m/layout.css'/>" rel="stylesheet" type="text/css">

<style type="text/css">
.tr_selected {
	background:#ffdcc4!important;
	font-weight:bold;
}
.pop_tb_basic tbody td {
    font-size: 0.8rem;
    padding: 0.45em 0.0em;
}
.pageBtn{
	cursor:pointer;
	margin-left:5px;
	vertical-align:top;
}
.pageIdx{
	cursor:pointer;
	margin-left:5px;
	vertical-align:top;
}
.btn_mobile_blue01 {
    width: 30%;
    background: #59647a;
    border: #4b566b solid 1px;
    border-radius: 0.2em;
    font-size: 1.3rem;
    color: #fff!important;
    letter-spacing: -0.1em;
    display: block;
    text-align: center;
    padding: 0.6em 0.7em;
    box-sizing: border-box;
    line-height: 1;
    font-weight: bold;
}
.btn_finish_ok {
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial;
    height: 21px;
    min-width: 30px;
    font-size: 11px;
    font-weight: normal;
    display: inline-block;
    vertical-align: middle;
    line-height: 21px;
    letter-spacing: -0.5px;
    color: rgb(255, 255, 255);
    background: rgb(38, 126, 188);
    border-width: 1px;
    border-style: solid;
    border-color: rgb(30, 116, 177);
    border-radius: 3px;
    padding: 0px 10px;
}
.pool_seachZone{
	padding-top:10px;
}
</style>

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js?ver=1.5'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery-ui.js'/>" ></script>
<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<script>
function linkPage(pageNo){
	//location.href = "<c:url value='/work/popUpCpn.do'/>?pageIndex="+pageNo;
	var frm = document.searchCpn;
	$('#pageIndex').val(pageNo);
	//frm.action = "<c:url value='/work/popUpCpn.do'/>";
	frm.submit();
}
End = function(cpnId,cpnNm,cpnSnb,listed,investorId){
	var rVal = new Object();
	
	rVal.f = <c:if test="${empty MDf}">Request('f')</c:if><c:if test="${not empty MDf}">'${MDf}'</c:if>;
	rVal.n = <c:if test="${empty MDn}">Request('n')</c:if><c:if test="${not empty MDn}">'${MDn}'</c:if>;
	rVal.nm = cpnNm;
	rVal.snb = cpnId;
	rVal.cpnSnb = cpnSnb;
	rVal.listed = listed;
	rVal.i = investorId;
	rVal.k = <c:if test="${empty kind}">Request('k')</c:if><c:if test="${not empty kind}">'${kind}'</c:if>;
	rVal.t = <c:if test="${empty tblCnt}">Request('t')</c:if><c:if test="${not empty tblCnt}">'${tblCnt}'</c:if>;
	//rVal.cur = arg;
	
	if(rVal.k != 'MNG'){
		/* if (window.opener) window.opener.returnPopUp(rVal);
		window.close(); */
		if (window.opener){
			
			opener.postMessage(JSON.stringify(rVal), "*");
			//window.close();
			window.opener.returnPopUpInvestor(rVal);
			
		}		
	}
};

function ajaxSearching(){
	var url = 'ajaxPopUpInvestorSearchName.do'
		,data = { 
			pageIndex: $('#pageIndex').val()
			,cpnNm: $('#nameSearch').val()
			,kind: $('#kind').val()
		},fn = function(arg){
		console.log(arg.length);
		if(arg.length>500) $('#icd').html(arg);
	};
	ajaxModule(data,url,fn);
}

//담당자명 수정폼 20170823 ksm
function editInvestorManager(idx, flag){
	if(flag == 'EDIT'){
		$("#edit_"+idx).show();
		$("#view_"+idx).hide();
	}else{
		$("#edit_"+idx).hide();		
		$("#view_"+idx).show();
	}		
}

function modifyInvestorManager(idx){
	if($.trim($("#managerNm"+idx).val()) == ''){
		alert("담당자명을 입력하세요.");
		$("#managerNm"+idx).focus();
		return;
	}
	
	var data = {
			investorId : idx
		,	managerNm : $("#managerNm"+idx).val()
	}
	
	var url = "<c:url value='/work/modifyInvestorManager.do'/>";
	
	var fn = function(result){
		var obj = JSON.parse(result);
		var chk = obj.resultVal;
		if(chk>0){
			alert("수정되었습니다.");
			$("#insertCpn").attr('action', "<c:url value='/work/popUpInvestor.do'/>").submit();
			//window.location.reload(true);
		}else{
			alert("서버오류!!!.");
		}
	};
	
	commonAjax("POST", url, data, fn, false, null, null);		
}

function delInvestorCompany(idx){
	if(confirm('삭제하시겠습니까?')){
		var data = {investorId : idx}
		
		var url = "<c:url value='/work/delInvestorCompany.do' />";
		
		var fn = function(result){
			var obj = JSON.parse(result);
			var chk = obj.resultVal;
			if(chk>0){
				alert("삭제되었습니다.");
				$("#insertCpn").attr('action', "<c:url value='/work/popUpInvestor.do'/>").submit();
			}else{
				alert("서버오류!!!.")
			}
		};
		
		commonAjax("POST", url, data, fn, false, null, null);
	}else{
		return;
	}
	
}

//------------------------------------- 회사 선택 팝업용 :S -------------------------------------
var mnaPopup;
function openPopUp(num,flag,nm,snb){

	// popUp 규격
	var w = '740';
	var h = '740';
	var ah = screen.availHeight - 30;
	var aw = screen.availWidth - 10;

	var val = new Object();
	var sUrl = '';

	if(flag=='c') {
		sUrl = "../work/popUpCpn.do";
		sUrl+='?f='+flag+'&n='+num;
		w='500',h='600';	
	}
	
	h = (ah-40>h?h:ah-40);
	var xc = (aw - w) / 2;
	var yc = (ah - h) / 2;
	var option = "left=" + xc
				+",top=" + yc
				+",width=" + w
				+",height=" + h
				+",menubar=no"
				+",status=no"
				+",toolbar=no"
				+",location=no"
				+",scrollbars=yes"
				+",resizable=no"
				;

	mnaPopup = window.open(sUrl, "_blank", option);			
}

//회사 선택 된것 화면에 추가
function returnPopUp(rVal){
	var flag = rVal.f
	var nm = rVal.nm
	var num = rVal.n;
	var cpnSnb = rVal.cpnSnb;
	
	if(flag=='c'){
		var tmpSpan = document.createElement("span");
		tmpSpan.innerHTML = rVal.nm;
		
		var cpnNm = $(tmpSpan).text();		//위에서 임시로  span 을 만들어 내부에 테그를포함한 회사명을 넣어놓고 text()로 텍스트만 뽑아낸다.
		var cpnId = rVal.snb;
		
		var data = {cpnId:	cpnId}
		
		var url = "<c:url value='/work/insertInvestorCompany.do'/>";
		var fn = function(result){
			var obj = JSON.parse(result);
	   		var chk = obj.resultVal;
	   		if(chk>0){
	   			if(chk==2)	alert("이미 등록된 법인명입니다!");
				$("#insertCpn").attr('action', "<c:url value='/work/popUpInvestor.do'/>").submit();
		   		//window.location.reload(true);
	   		}else{
	   			alert("서버오류!!!.");
	   		}
		};
		
    	commonAjax("POST", url, data, fn, false, null, null);	
	}
	mnaPopup.close();	//팝업닫기
}

//------------------------------------- 회사 선택 팝업용 :E -------------------------------------

$(document).ready(function(){
	if(null != Request("f"  )&&''!=Request("f"  ))$("#flag").val(Request('f'));
	if(null != Request("f"  )&&''!=Request("f"  ))$("#flag1").val(Request('f'));
	if(null != Request("n"  )&&''!=Request("n"  ))$("#num").val(Request('n'));
	if(null != Request("n"  )&&''!=Request("n"  ))$("#num1").val(Request('n'));
	//20170825 ksm
	if(null != Request("k"  )&&''!=Request("k"  ))$("#kind").val(Request('k'));
	if(null != Request("k"  )&&''!=Request("k"  ))$("#kind1").val(Request('k'));
	if(null != Request("t"  )&&''!=Request("t"  ))$("#tblCnt").val(Request('t'));
	if(null != Request("t"  )&&''!=Request("t"  ))$("#tblCnt1").val(Request('t'));
 });
</script>
<style>*{font-family: 맑은 고딕, Trebuchet MS, Verdana, Geneva, sans-serif;}.t_skinR00 tbody td{padding:0 !important;}</style>
 <base target="_self">
</head>
<body>
	<div id="popconWrap">

		<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

		<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">

		<form id="insertCpn" name="insertCpn" action="" method="post">
			<input type="hidden" id="flag1" name="modalFlag" value="${MDf}">
			<input type="hidden" id="num1" name="modalNum" value="${MDn}">
			<input type="hidden" name="searchCpnNm" value="${searchName}">
			<input type="hidden" id="searchCpnNm4Reg" name="searchCpnNm4Reg" value="">
			<input type="hidden" id="kind1" name="type" value="${kind}">
			<input type="hidden" id="tblCnt1" name="rtnVal" value="${tblCnt}">
		</form>
		
		<form name="searchCpn" action="<c:url value='/work/popUpInvestor.do' />" method="post">
			<div class="pool_seachZone">
				<input type="hidden" id="flag" name="modalFlag" value="${MDf}">
				<input type="hidden" id="num" name="modalNum" value="${MDn}">
				<input type="hidden" id="idchk_commit" value="">
				<input type="hidden" id="pageIndex" name="pageIndex" value="1">
				<input type="search" id="nameSearch" name="cpnNm" onkeyup="javascript:ajaxSearching();" placeholder="법인명" autofocus="autofocus" value="${searchName}">
				<!-- <input class="btnSearch" type="submit" value="검색"> -->
				<button onclick="doSearch();"><em>검색</em></button>
				<input type="hidden" id="kind" name="type" value="${kind}">
				<input type="hidden" id="tblCnt" name="rtnVal" value="${tblCnt}">
			</div>
		</form>
		<div id="icd"><%@include file="../../includeJSP/popUpInvestor.jsp" %></div>
<%-- 
			<table>
				<c:if test="${fn:length(companyList) == 0}">
				<tr>
					<td><spring:message code="info.nodata.msg" /></td>
				</tr>
				</c:if>
			</table>
 --%>
	</div>
</body>
</html>