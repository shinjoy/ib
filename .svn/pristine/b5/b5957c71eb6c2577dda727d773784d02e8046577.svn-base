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
<title>Main</title>
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
<script>
function linkPage(pageNo){
	//location.href = "<c:url value='/work/popUpCpn.do'/>?pageIndex="+pageNo;
	var frm = document.searchCpn;
	$('#pageIndex').val(pageNo);
	//frm.action = "<c:url value='/work/popUpCpn.do'/>";
	frm.submit();
}
End = function(cpnId,cpnNm,cpnSnb,listed){
	var rVal = new Object();
	
	rVal.f = <c:if test="${empty MDf}">Request('f')</c:if><c:if test="${not empty MDf}">'${MDf}'</c:if>;
	rVal.n = <c:if test="${empty MDn}">Request('n')</c:if><c:if test="${not empty MDn}">'${MDn}'</c:if>;
	rVal.nm = cpnNm;
	rVal.snb = cpnId;
	rVal.cpnSnb = cpnSnb;
	rVal.listed = listed;
	//rVal.cur = arg;
	
	/* if (window.opener) window.opener.returnPopUp(rVal);
	window.close(); */
	if (window.opener){
		
		opener.postMessage(JSON.stringify(rVal), "*");
		window.close();
		window.opener.returnPopUp(rVal);
		
	}
};

function ajaxSearching(){
	var url = 'ajaxPopUpCpnSearchName.do'
		,data = { 
			pageIndex: $('#pageIndex').val()
			,cpnNm: $('#nameSearch').val()
		},fn = function(arg){
		console.log(arg.length);
		if(arg.length>500) $('#icd').html(arg);
	};
	ajaxModule(data,url,fn);
}

$(document).ready(function(){
	if(null != Request("f"  )&&''!=Request("f"  ))$("#flag").val(Request('f'));
	if(null != Request("f"  )&&''!=Request("f"  ))$("#flag1").val(Request('f'));
	if(null != Request("n"  )&&''!=Request("n"  ))$("#num").val(Request('n'));
	if(null != Request("n"  )&&''!=Request("n"  ))$("#num1").val(Request('n'));
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
		</form>
		
		<form name="searchCpn" action="<c:url value='/work/popUpCpn.do' />" method="post">
			<div class="pool_seachZone">
				<input type="hidden" id="flag" name="modalFlag" value="${MDf}">
				<input type="hidden" id="num" name="modalNum" value="${MDn}">
				<input type="hidden" id="idchk_commit" value="">
				<input type="hidden" id="pageIndex" name="pageIndex" value="1">
				<input type="search" id="nameSearch" name="cpnNm" onkeyup="javascript:ajaxSearching();" placeholder="법인명/코드" autofocus="autofocus" value="${searchName}">
				<!-- <input class="btnSearch" type="submit" value="검색"> -->
				<button onclick="doSearch();"><em>검색</em></button>
			</div>
		</form>
		<div id="icd"><%@include file="../../includeJSP/PopUpCpn.jsp" %></div>
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