<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
response.setHeader("Access-Control-Max-Age", "3600");
response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/base.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/work.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script>
 $("tr:even").css("background-color", "#E0F8F7");
 $(document).ready(function(){
	 $(".t_skinR00 tbody tr:odd").css("background-color", "#F6F9FB");
	 $('.tabUnderBar').css('width','calc(100% - '+ parseInt(10 + 68*($('.1st').length)) +'px)');
	 $('.tabUnderBar2').css('width','calc(100% - '+ parseInt(10 + 68*($('.2nd').length)) +'px)');
 });

 function viewPer(th,sep){
 	$("#page").val(sep);
 	document.modifyRec.submit();
 }
function bsnsPop(e,th,snb){
	statsOfferdivAjax(e,'',$(th),snb,'');
}
function closePopUpMenu(th){
	$('#offerPr').hide();
}
$(document).on('click','#mask',function(){
	$('#offerPr').hide();
	$('#mask').remove();
});

</script>
<style>tbody tr:hover{background-color: moccasin !important;}
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
#mask {
    display: none;
    background: none repeat scroll 0% 0% #000;
    position: fixed;
    left: 0px;
    top: 0px;
    z-index: 10;
    width: 100%;
    height: 100%;
    opacity: 0.8;
}
.headerTitle select,.headerTitle input:not(.btnSearch){
	height:27px;
	padding:2px;
}
</style>
</head>
<body>
<div id="offerDiv"><div id="offerPr" name="offerPr" style="display: none;"></div></div>
<div id="wrap">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">	
	<div class="fixed-top" style="z-index:10;">
		<header>
			<form id="modifyRec" name="modifyRec" action="<c:url value='/work/matrix.do' />" method="post">
			<input type="hidden" name="sorting" id="sorting">
			<h2 class="headerTitle">Matrix
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select class="textSearch" name="tmpNum1">
					<option <c:if test="${tmpNum ne '1'}">selected</c:if>>업종</option>
					<option value="1"<c:if test="${tmpNum eq '1'}">selected</c:if>>NEEDS</option>
				</select>
				<input type="search" class="textSearch" id="nameSearch" name="search" placeholder="검색" autofocus="autofocus" value="${search}">
				<input type="submit" class="btnSearch" value="검색">
			</h2>
			</form>
		</header>

		<table class="t_skinR00" style="padding-top:5px;table-layout:fixed;">
			<colgroup>
				<col width="120">
				<col width="100">
				<col width="180">
				<col width="180">
				<col width="180">
				<col width="180">
				<col width="72">
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2" onclick="sortTable('1');" class="hand bgYlw">회사<br/>▲</th>
					<th rowspan="2" onclick="sortTable('2');" class="hand bgYlw">업종 WICS<br/>▲</th>
					<th colspan="4" class="bgYlw">NEEDS</th>
					<th rowspan="2" class="hand bgYlw">etc.</th>
				</tr>
				<tr>
					<th class="hand bgYlw">메자닌딜</th>
					<th class="hand bgYlw">자산운용</th>
					<th class="hand bgYlw">M&A</th>
					<th class="hand bgYlw">기타</th>
				</tr>
				<tr style="height:1px;"></tr>
			</thead>
		</table>
	</div>
	<div style="padding-top:105px;">
		<table class="t_skinR00" style="table-layout:fixed;">
			<colgroup>
				<col width="120">
				<col width="100">
				<col width="180">
				<col width="180">
				<col width="180">
				<col width="180">
				<col width="72">
			</colgroup>
			<tbody>
				<c:forEach var="mtx" items="${matrixList}" varStatus="mtxS">
				<tr>
					<td class="cent bold navy" onclick="popUp('','rcmdCpn','','${mtx.cpnSnb}');"><a>${mtx.cpnNm}</a></td>
				<input type="hidden" id="snb${mtxS.count}" value="${mtx.sNb }"/>
					<td class="cent">${mtx.categoryNm}</td>
					<td class="">${mtx.financing}</td>
					<td class="">${mtx.management}</td>
					<td class="">${mtx.mna}</td>
					<td class="">${mtx.etc}</td>
					<td class="cent">${mtx.tmpNum1}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>