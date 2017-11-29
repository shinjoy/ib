<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/management.css'/>" rel="stylesheet" type="text/css"/>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/keyPointChk.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/calendar_beans_v2.0.js'/>" ></script>
<script>
 $(document).ready(function(){
	 $(".t_skinR00 tbody tr:odd").css("background-color", "#F6F9FB");
	 $('.tabUnderBar').css('width','calc(100% - '+ parseInt(10 + 68*($('.1st').length)) +'px)');
	 remake('TBLrsrc',2,2);
 });

 function viewPer(th,sep){
 	$("#page").val(sep);
 	document.modifyRec.submit();
 }
</script>
<style>tbody tr:hover{background-color: moccasin !important;}</style>
</head>
<body>
<div id="wrap">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">	
<input type="hidden" id="SendReceive" value="resource">
<form id="modifyRec" name="modifyRec" action="<c:url value='/work/resource.do' />" method="post"><input type="hidden" name="sorting" id="sorting"><input type="hidden" name="page" id="page" value="${page}"></form>

	<section>
		<article>
		<div class="fixed-top" style="z-index:10;">
			<header>
				<h2 class="headerTitle">운용인재</h2>
			</header>
	<div class="clear" style="width:10px;float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
	<div class="1st subTab<c:if test="${empty page}">on</c:if>" onclick="viewPer(this)">기본화면</div>
	<div class="1st subTab<c:if test="${page == '1'}">on</c:if>" onclick="viewPer(this,1)">상세화면</div>
	<div class="tabUnderBar" style="float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
			<table class="t_skinR00" style="padding-top:5px;">
				<colgroup>
					<col width="80">
					<col width="78">
					<col width="57">
					<col width="112">
					<col width="200">
					<col width="72">
					<col width="72">
					<col width="72">
					<col width="72">
					<col width="72">
					<col width="72">
					<col width="72">
				</colgroup>
				<thead>
					<tr>
						<th onclick="sortTable(1);" class="hand bgYlw">일자<br/>▼</th>
						<th onclick="sortTable();" class="hand bgYlw">운용인재<br/>▼</th>
						<th onclick="sortTable(2);" class="hand bgYlw personName">입력자<br/>▼</th>
						<th onclick="sortTable(3);" class="hand bgYlw companyName">회사명<br/>▼</th>
						<th class="bgYlw">내용</th>
						<th class="bgYlw">추천일<br/>주가</th>
						<th class="bgYlw">현재가</th>
						<th class="bgYlw">현재<br/>상승률<small> (%)</small></th>
						<th class="bgYlw">최저가</th>
						<th class="bgYlw">최저<br/>상승률<small> (%)</small></th>
						<th class="bgYlw">최고가</th>
						<th class="bgYlw" style="width:65px">최고<br/>상승률<small> (%)</small></th>
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
			</table>
		</div>
		<div style="padding-top:114px;">
			<table class="t_skinR00" id="TBLrsrc">
				<colgroup>
					<col width="80">
					<col width="78">
					<col width="57">
					<col width="112">
					<col width="200">
					<col width="72">
					<col width="72">
					<col width="72">
					<col width="72">
					<col width="72">
					<col width="72">
					<col width="72">
				</colgroup>
				<tbody>
					<c:forEach var="financ" items="${financingList}" varStatus="financStatus">
					<tr>
						<td class="cent">${financ.tmDt}</td>
						<td class="cent w80p hand navy bold hov" onclick="popUp('','rcmdCst','','${financ.sNb}');">${financ.cstNm}</td>
						<td class="cent">${financ.rgNm}</td>
					<input type="hidden" id="snb${financStatus.count}" value="${financ.sNb }"/>
						<td class="cent">${financ.cpnNm}</td>
						<td class="">${financ.note}</td>
						<td class="cent"><fmt:formatNumber value="${financ.regPrice}" type="currency" currencySymbol=""/></td>
						<td class="cent"><fmt:formatNumber value="${financ.curPrice}" type="currency" currencySymbol=""/></td>
						<td class="cent <c:if test="${(financ.curPrice-financ.regPrice)>0}">red</c:if> <c:if test="${(financ.curPrice-financ.regPrice)<0}">blue</c:if>" style="width:60px"><c:if test="${not empty financ.curPrice}"><fmt:formatNumber value="${(financ.curPrice-financ.regPrice)/financ.regPrice *100}" pattern="0.00"/>%</c:if></td>
						<td class="cent"><fmt:formatNumber value="${financ.minPrice}" type="currency" currencySymbol=""/></td>
						<td class="cent <c:if test="${(financ.minPrice-financ.regPrice)>0}">red</c:if> <c:if test="${(financ.minPrice-financ.regPrice)<0}">blue</c:if>"><c:if test="${not empty financ.regPrice}"><fmt:formatNumber value="${(financ.minPrice-financ.regPrice)/financ.regPrice *100}" pattern="0.00"/>%</c:if></td>
						<td class="cent"><fmt:formatNumber value="${financ.maxPrice}" type="currency" currencySymbol=""/></td>
						<td class="cent <c:if test="${(financ.maxPrice-financ.regPrice)>0}">red</c:if> <c:if test="${(financ.maxPrice-financ.regPrice)<0}">blue</c:if>"><c:if test="${not empty financ.regPrice}"><fmt:formatNumber value="${(financ.maxPrice-financ.regPrice)/financ.regPrice *100}" pattern="0.00"/>%</c:if></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</article>
	</section>
</div>
</body>
</html>