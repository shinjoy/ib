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
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/keyPointChk.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/calendar_beans_v2.0.js'/>" ></script>
<script>
 $(document).ready(function(){
	 $(".t_skinR00 tbody tr:odd").css("background-color", "#F6F9FB");
 });

 function selectLevelCD(lv, snb, frmNm, tmp){
 	var DATA = {sNb:snb, importance:"0000"+lv, tmpNum1: tmp};
 	var url = "../work/saveImportance.do";
 	var fn = function(){
 		$("#"+frmNm).submit();
 	};
 	ajaxModule(DATA,url,fn);
 }
 function excelDownload(){
		$('body').append('<iframe id="excelDown" style="display:none;"></iframe><form id="excelform"></form>');
		$('#excelform').attr('action',"../work/excelNetwork.do");
		$('#excelform').attr('target','excelDown');
		$('#excelform').submit();
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
<input type="hidden" id="SendReceive" value="humanNet">
<form id="modifyRec" name="modifyRec" action="<c:url value='/work/network.do' />" method="post"><input type="hidden" name="sorting" id="sorting"><input type="hidden" name="choice_year" value="${choice_year}"></form>

<!-- 인물>인맥네트워크 내용 & 인물>인물소개 내용 -->
	<section>
		<article>
		<div class="fixed-top" style="z-index:10;">
			<header>
				<form name="dayForm" id="dayForm" method="post" action="<c:url value='/work/network.do' />">
				<input type="hidden" name="total" id="total">
				<div class="year_wrap" style="top:0px"><h2 class="headerTitle">
				
					<c:set var="now" value="<%= new java.util.Date() %>"/>
					<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
								
					<span class="year">
						<select id='deal_select_year' name='choice_year'>
							<c:forEach var="year" begin="2011" end="${cur_year}">
								<option value="${year}"
								<c:choose>
									<c:when test="${choice_year == null}">
										<c:if test="${year == cur_year}">selected</c:if>>
									</c:when>
									<c:otherwise>
										<c:if test="${year == choice_year}">selected</c:if>>
									</c:otherwise>
								</c:choose> 
								${year}</option>
							</c:forEach>
						</select>
					</span>
					인맥<c:if test="${userLoginInfo.id == 'gjh' or userLoginInfo.permission == '00021'}">&nbsp;&nbsp;<span class="btn s"><a onclick="javascript:excelDownload(this,event);">엑셀 다운로드</a></span></c:if></h2>
				</div>
				</form>
				<h2 class="headerTitle">&nbsp;</h2>
			</header>
			
			<%@include file="../../includeJSP/Network.jsp" %>
		</article>
	</section>
</div>
</body>
</html>