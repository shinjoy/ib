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

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>
<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="<c:url value='/js/sys/utils.js?ver=0.1'/>" ></script><!-- 20160108 -->

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

<script>
function linkPage(pageNo){
	//location.href = "<c:url value='/person/popUpCst.do'/>?pageIndex="+pageNo;
	var frm = document.searchCpn;
	$('#pageIndex').val(pageNo);
	//frm.action = "<c:url value='/person/popUpCst.do'/>";
	frm.submit();
}
$(document).ready(function(){
	//if(null != Request("nm" )&&0!=Request("nm" )) {$("#TMname").val(Request("nm")); $("#resultarea0").html($("#TMname").val()+'의 관계메모');}
	if(null != Request("nm" )&&0!=Request("nm" )) {$("#TMname").val(Request("nm"));}
	if(null != Request("snb")&&0!=Request("snb")) $("#TMsnb").val(Request("snb"));
	if(null != Request("f"  )&&0!=Request("f"  )) $("#TMf").val(Request("f"));
	if(null != Request("n"  )&&0!=Request("n"  )) $("#TMn").val(Request("n"));
	
	//$("tr:even").css("background-color", "#E0F8F7");
	$("#nameSearch").focus();
 });
 
 
//검색시 영문 한글 변환검색 추가
function doSearch(){
	$('#cstNmKor').val(engTypeToKor($('#nameSearch').val()));
	document.searchCpn.submit();
}
function trySearch(event){
	if(event.keyCode != 13)
		return;
	else
		doSearch();
}
 
</script>
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

<!-- 네트워크 div 팝업 -->
		<div class="popUpMenu popUpTitle_area" id="popUpCstPr0" name="textR">
			<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
			<ul>
				<li><textarea id="resultarea0" class="pop_note" placeholder="관계 메모.."></textarea></li>
			</ul>
			<p class="bsnsR_btn">
				<span class="btn s green" onclick="ntwk_btnOK('cst');"><a>저장</a></span>&nbsp;&nbsp;&nbsp;
				<!-- <span class="dealResult_btnDel">완전삭제</span> -->
			</p>
		
		</div>
<!-- 네트워크 div 팝업 -->

<input type="hidden" id="sNb2nd" value="">
<input type="hidden" id="name2nd" value="">
<form id="insertCst" name="insertCst" method="post"><input type="hidden" name="searchCstNm" value="${searchName}"></form>

			<%-- <form name="pagenation" action="<c:url value='/person/popUpCst.do' />" method="post">
			<input type="hidden" id="pageIndex" name="pageIndex">
			</form> --%>
			
			<form name="searchCpn" action="<c:url value='/person/popUpCst.do' />" method="post" onkeypress="return event.keyCode != 13;">
			
			<div class="pool_seachZone">
				<input type="hidden" id="TMf" name="modalFlag" value="${MDf}">
				<input type="hidden" id="TMn" name="modalNum" value="${MDn}">
				<input type="hidden" id="TMname" name="TMname" value="${TempName}">
				<input type="hidden" id="TMsnb" name="TMsnb" value="${TempSnb}">
				<input type="hidden" id="cpnNm" name="cpnNm">
				<input type="hidden" id="pageIndex" name="pageIndex" value="1">
				
				<input type="hidden" id="cstNmKor" name="cstNmKor" value="${searchName}">
				
				<input type="search" id="nameSearch" name="cstNm" onkeyup="javascript:trySearch(event);" placeholder="이름/회사" autofocus="autofocus" value="${searchName}">
				<button onclick="doSearch();"><em>검색</em></button>
			</div>
			</form>

			<div class="_popUpWidth">
				<table class="pop_tb_basic">
					<thead>
						<tr>
							<th scope="col">이름</th>
							<th scope="col">회사</th>
							<th scope="col">직급</th>
						</tr>
					</thead>
										
					<tbody>
					<c:forEach var="cst" items="${cstList}" varStatus="status">
						<input type="hidden" id="sNb2_${status.count}" value="${cst.sNb}"/>
						<input type="hidden" id="name2_${status.count}" value="${cst.cpnNm } : ${cst.cstNm}"/>
						<%-- <td><a href="#" id="cstNm_0_${status.count}" class="popUpCstNm">${cst.cstNm }</a></td>
						<td class="cent">${cst.cpnNm }</td>
						<td class="cent">${cst.position }</td> --%>
						
						<tr id="cstNm_0_${status.count}" class="popUpCstNm">
							<td class="cent"><b>${cst.cstNm }</b></td>
							<td class="cent">${cst.cpnNm }</td>
							<td class="cent">${cst.position }</td>
						</tr>

					</c:forEach>
					</tbody>
					
				</table>
				
	<c:if test="${not empty cstList }">
	<div align="center"><br/>
		<ui:pagination type="image" paginationInfo = "${paginationInfo}" jsFunction="linkPage" />
	</div>
	</c:if>

	<c:if test="${fn:length(cstList) <= 5}">
	<div class="cent">
		<spring:message code="info.nodata.msg" /><br/><br/>
		<span class="btn black s"><a onclick="popRgstCst();">사람 등록하기</a></span>
	</div>
	</c:if>
</div>

</body>
</html>