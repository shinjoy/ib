<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script>
function linkPage(pageNo){
	//location.href = "<c:url value='/person/popUpCpn.do'/>?pageIndex="+pageNo;
	var frm = document.searchCpn;
	$('#pageIndex').val(pageNo);
	//frm.action = "<c:url value='/person/popUpCpn.do'/>";
	frm.submit();
}
$(document).ready(function(){
	var arg = window.dialogArguments;
	if(arg!=null){
		$("#TMname").val(arg.nm);
		$("#TMsnb").val(arg.snb);
		$("#netYN").val(arg.net);
	}else{
		if(null != Request("nm" )&&0!=Request("nm" )) $("#TMname").val(Request('nm'));
		if(null != Request("snb")&&0!=Request("snb")) $("#TMsnb").val(Request('snb'));
		if(null != Request("n2t")&&0!=Request("n2t")) $("#netYN").val(Request('n2t'));
		if(null != Request("f"  )&&0!=Request("f"  )) $("#TMf").val(Request("f"));
	}
 });
</script>
 <base target="_self">
</head>
<body>
	<div id="wrap">

		<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">

<!-- 네트워크 -->
		<div class="popUpMenu popUpTitle_area" id="popUpCstPr0" name="textR">
			<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
			<ul>
				<li><textarea id="resultarea0" class="pop_note" placeholder="메모사항.."></textarea></li>
			</ul>
			<p class="bsnsR_btn">
				<span class="btn s green" onclick="ntwk_btnOK('cpn');"><a>저장</a></span>&nbsp;&nbsp;&nbsp;
				<!-- <span class="dealResult_btnDel">완전삭제</span> -->
			</p>
		
		</div>
<!-- 네트워크 -->

<input type="hidden" id="sNb2nd" value="">
<input type="hidden" id="name2nd" value="">
<form id="insertCst" name="insertCst" method="post"><input type="hidden" name="searchCstNm" value="${searchName}"></form>
<%-- 			<form name="pagenation" action="<c:url value='/person/popUpCpn.do' />" method="post">
			<input type="hidden" id="pageIndex" name="pageIndex">
			</form>
 --%>
 			<form name="searchCpn" action="<c:url value='/person/popUpCpn.do' />" method="post">
			
			<div style="width:200px;padding:20px 10px 10px 11px;">
				<input type="hidden" id="TMf" name="modalFlag" value="${MDf}">
				<input type="hidden" id="TMname" name="TMname" value="${TempName}">
				<input type="hidden" id="TMsnb" name="TMsnb" value="${TempSnb}">
				<input type="hidden" id="netYN" name="netYN" value="${TempNet}">
				
				<input type="hidden" id="idchk_commit" value="">
				<input type="hidden" id="pageIndex" name="pageIndex" value="1">
				<input class="nameSearch textSearch" type="search" id="nameSearch" name="cpnNm" placeholder="회사이름" autofocus="autofocus" value="${searchName}">
				<input class="btnSearch" type="submit" value="검색">
			</div>
			</form>
			<div class="_popUpWidth">
				<table class="t_skin04_left">
					<thead>
						<tr>
							<th class="bgYlw">법인명</th>
							<th class="bgYlw">코드</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="cpn" items="${companyList}" varStatus="status">
						<input type="hidden" id="sNb2_${status.count}" value="${cpn.sNb}"/>
						<input type="hidden" id="name2_${status.count}" value="${cpn.cpnNm}"/>
						
						<%-- <tr onclick="End('${cpn.cpnId}','${cpn.cpnNm }');"> --%>
						<tr id="cstNm_0_${status.count}" class="popUpCstNm">
							<td class="cent">${cpn.cpnNm }</td>
							<td class="cent">${cpn.cpnId}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
<c:if test="${not empty companyList }">
<div align="center">
	<ui:pagination type="image" paginationInfo = "${paginationInfo}" jsFunction="linkPage" />
</div>
</c:if>

	<c:if test="${fn:length(companyList) == 0}">
	<div class="cent">
		<spring:message code="info.nodata.msg" /><br/><br/>
		<span class="btn black s"><a onclick="popRgstCpn();">등록하기</a></span>
	</div>
	</c:if>
			</div>

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