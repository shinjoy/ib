<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script>
 $(document).ready(function(){
	 $(".t_skinR00 tbody tr:odd").css("background-color", "#F6F9FB");
	 $('.tabUnderBar').css('width','calc(100% - '+ parseInt(10 + 68*($('.1st').length)) +'px)');
	 remake('TBLaudit', 1,1);
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

<input type="hidden" id="SendReceive" value="audit">
<form id="modifyRec" name="modifyRec" action="<c:url value='/work/audit.do' />" method="post"><input type="hidden" name="sorting" id="sorting"><input type="hidden" name="page" id="page" value="${page}"></form>

	<section>
		<article>
		<div class="fixed-top" style="z-index:10;">
			<header>
				<h2 class="headerTitle">심사역</h2>
			</header>
	<div class="clear" style="width:10px;float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
	<div class="1st subTab<c:if test="${empty page}">on</c:if>" onclick="viewPer(this)">기본화면</div>
	<div class="1st subTab<c:if test="${page == '1'}">on</c:if>" onclick="viewPer(this,1)">딜경력 상세</div>
	<div class="tabUnderBar" style="float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
			<table class="t_skinR00" style="padding-top:5px;">
				<thead>
					<tr>
						<th onclick="sortTable();" class="hand bgYlw w80p">심사역<br/>▼</th>
						<th onclick="sortTable(1);" class="hand bgYlw personName">입력자<br/>▼</th>
						<th onclick="sortTable(2);" class="hand bgYlw companyName">회사명<br/>▼</th>
						<th class="bgYlw">내용</th>
						<th class="bgYlw pd0" style="width:6px"></th>
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
			</table>
		</div>
		<div style="padding-top:111px;">
			<table class="t_skinR00" id="TBLaudit">
				<tbody>
					<c:forEach var="financ" items="${financingList}" varStatus="financStatus">
					<tr>
						<td class="cent w80p hand navy bold hov" onclick="popUp('','rcmdCst','','${financ.sNb}');">${financ.cstNm}</td>
						<td class="cent personName">${financ.rgNm}</td>
					<input type="hidden" id="snb${financStatus.count}" value="${financ.sNb }"/>
						<td class="cent companyName">${financ.cpnNm}</td>
						<td class=""><b>${financ.note}</b></td>
						<td class="cent pd0" style="width:1px"></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</article>
	</section>
</div>
</body>
</html>