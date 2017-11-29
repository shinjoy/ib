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
<script type="text/JavaScript" src="<c:url value='/js/work.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/keyPointChk.js'/>" ></script>
<script>
 //$("tr:even").css("background-color", "#E0F8F7");
 $(document).ready(function(){
	 //$(".t_skinR00 tbody tr:odd").css("background-color", "#F6F9FB");
	 remake('TBLmatrix',1,1);
	 remake('TBLmatrix',3,3);
	 remake('TBLmatrix',14,14);
 });

 function viewPer(th,sep){
 	$("#page").val(sep);
 	document.modifyRec.submit();
 }

function bsnsPop(e,th,snb){
	statsOfferdivAjax(e,'',$(th),snb,'');
}
$(document).on('click','#mask',function(){
	$('#offerPr').hide();
	$('#mask').remove();
});

function hid(){
	var colspan = $("#resource").attr('colspan');
	if(colspan<10){
		$("#resource").attr('colspan','10');
		$('.hid').show();
	}else{ 
		$("#resource").attr('colspan','3');
		$('.hid').hide();
	}
}
</script>
<style>tbody tr:hover{background-color: moccasin !important;}
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
.hid{
	display:none;
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
			<form id="modifyRec" name="modifyRec" action="<c:url value='/work/matrix2.do' />" method="post">
			<input type="hidden" name="sorting" id="sorting">
			<h2 class="headerTitle">창투/투자사
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%-- <select class="textSearch" name="tmpNum1">
					<option <c:if test="${tmpNum ne '1'}">selected</c:if>></option>
					<option value="1"<c:if test="${tmpNum eq '1'}">selected</c:if>>NEEDS</option>
				</select> --%>
				<input type="search" class="textSearch" id="nameSearch" name="search" placeholder="회사" autofocus="autofocus" value="${search}">
				<input type="submit" class="btnSearch" value="검색">
			</h2>
			</form>
		</header>

		<table class="t_skinR00" style="padding-top:5px;table-layout:fixed;">
			<colgroup>
				<col width="120">
				
				<col width="280">
				
				<col width="60">
				<col width="100">
				<col width="180">
				
				<col class="hid" width="50">
				<col class="hid" width="50">
				<col class="hid" width="50">
				<col class="hid" width="50">
				<col class="hid" width="50">
				<col class="hid" width="50">
				<col class="hid" width="50">
				
				<col width="60">
				<col width="100">
				<col width="180">
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2" class="hand bgYlw" onclick="sortTable('');">창투/투자자문사<br/>▼</th>
					<th rowspan="2" class="hand bgYlw">기투자내용</th>
					<th colspan="3" class="hand bgGrn" onclick="sortTable('1');" id="resource">운용인재 ▼</th>
					<th colspan="3" class="hand bgSky" onclick="sortTable('2');">심사역 ▼</th>
				</tr>
				<tr style="height:44px">
					<th class="bgGrn">인물명</th>
					<th colspan="2" class="bgGrn">매수추천<span style="float:right;cursor:pointer;" onclick="javascript:hid();">◀▶</span></th>
					
					<th class="hid bgGrn"><nobr>추천일</nobr><br/>주가</th>
					<th class="hid bgGrn"><nobr>현재가</nobr></th>
					<th class="hid bgGrn">현재<br/><nobr>상승률</nobr></th>
					<th class="hid bgGrn"><nobr>최저가</nobr></th>
					<th class="hid bgGrn">최저<br/><nobr>상승률</nobr></th>
					<th class="hid bgGrn"><nobr>최고가</nobr></th>
					<th class="hid bgGrn">최고<br/><nobr>상승률</nobr></th>
					
					<th class="bgSky">인물명</th>
					<th colspan="2" class="bgSky">이력</th>
				</tr>
				<tr style="height:1px;"></tr>
			</thead>
		</table>
	</div>
	<div style="padding-top:120px;">
		<table class="t_skinR00" id="TBLmatrix" style="table-layout:fixed;">
			<colgroup>
				<col width="120">
				
				<col width="280">
				
				<col width="60">
				<col width="100">
				<col width="180">

				<col class="hid" width="50">
				<col class="hid" width="50">
				<col class="hid" width="50">
				<col class="hid" width="50">
				<col class="hid" width="50">
				<col class="hid" width="50">
				<col class="hid" width="50">
				
				<col width="60">
				<col width="100">
				<col width="180">
			</colgroup>
			<tbody>
				<c:forEach var="mtx" items="${matrixList}" varStatus="mtxS">
				<tr>
					<td class="cent bold navy"<c:if test="${not empty mtx.cpnSnb}"> onclick="popUp('','rcmdCpn','','${mtx.cpnSnb}');"</c:if>><a>${mtx.cpnNm}</a></td>
					<td class="cent">
				<c:forEach var="ivm" items="${investMentList}" begin="${cnt}" varStatus="ivmS"><c:if test="${mtx.cpnSnb eq ivm.cpnSnb}"><c:set var="cnt" value="${cnt+1}"/>
					<table><tr>
						<td class="cent bold navy"<c:if test="${not empty ivm.cpnSnb0}"> onclick="popUp('','rcmdCpn','','${ivm.cpnSnb0}');"</c:if>><a>${ivm.cpnNm}</a></td>
						<td class="">${ivm.comment}</td>
					</tr></table>
				</c:if></c:forEach>
					</td>
					<td class="cent bold navy"<c:if test="${not empty mtx.snb1st}"> onclick="popUp('','rcmdCst','','${mtx.snb1st}');"</c:if>><a>${mtx.cstNm1st}</a></td>
					<td class="cent bold navy"<c:if test="${not empty mtx.cpnSnb1st}"> onclick="popUp('','rcmdCpn','','${mtx.cpnSnb1st}');"</c:if>><a>${mtx.cpnNm1st}</a></td>
					<td class=""><span class="red" style="font-size:8px;">${mtx.tmDt}</span> ${mtx.tmpNum1}</td>
				
					<td class="hid cent"><fmt:formatNumber value="${mtx.regPrice}" type="currency" currencySymbol=""/></td>
					<td class="hid cent"><fmt:formatNumber value="${mtx.curPrice}" type="currency" currencySymbol=""/></td>
					<td class="hid cent <c:if test="${(mtx.curPrice-mtx.regPrice)>0}">red</c:if> <c:if test="${(mtx.curPrice-mtx.regPrice)<0}">blue</c:if>" style="width:60px"><c:if test="${not empty mtx.curPrice}"><fmt:formatNumber value="${(mtx.curPrice-mtx.regPrice)/mtx.regPrice *100}" pattern="0.00"/>%</c:if></td>
					<td class="hid cent"><fmt:formatNumber value="${mtx.minPrice}" type="currency" currencySymbol=""/></td>
					<td class="hid cent <c:if test="${(mtx.minPrice-mtx.regPrice)>0}">red</c:if> <c:if test="${(mtx.minPrice-mtx.regPrice)<0}">blue</c:if>"><c:if test="${not empty mtx.regPrice}"><fmt:formatNumber value="${(mtx.minPrice-mtx.regPrice)/mtx.regPrice *100}" pattern="0.00"/>%</c:if></td>
					<td class="hid cent"><fmt:formatNumber value="${mtx.maxPrice}" type="currency" currencySymbol=""/></td>
					<td class="hid cent <c:if test="${(mtx.maxPrice-mtx.regPrice)>0}">red</c:if> <c:if test="${(mtx.maxPrice-mtx.regPrice)<0}">blue</c:if>"><c:if test="${not empty mtx.regPrice}"><fmt:formatNumber value="${(mtx.maxPrice-mtx.regPrice)/mtx.regPrice *100}" pattern="0.00"/>%</c:if></td>
					
					<td class="cent bold navy"<c:if test="${not empty mtx.snb2nd}"> onclick="popUp('','rcmdCst','','${mtx.snb2nd}');"</c:if>><a>${mtx.cstNm2nd}</a></td>
					<td class="cent bold navy"<c:if test="${not empty mtx.cpnSnb2nd}"> onclick="popUp('','rcmdCpn','','${mtx.cpnSnb2nd}');"</c:if>><a>${mtx.cpnNm2nd}</a></td>
					<td class="">${mtx.tmpNum2}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>