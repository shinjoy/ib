<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/management.css'/>" rel="stylesheet" type="text/css"/>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/popUp.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/changePage.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/calendar_beans_v2.0.js'/>" ></script>
<script>
 $(document).ready(function(){
	 $(".t_skinR00 tbody tr.bgOdd:odd").css("background-color", "#F6F9FB");
	 $('.tabUnderBar').css('width','calc(100% - '+ parseInt(10 + 68*($('.1st').length)) +'px)');
	 var ttl = $('#total');
	 if(ttl.val()=='sellBuy') ttl.val('');
 });

function popUpStaffTable(divId, e, cnt){
	$('#TofferSnb').val($('#offerSnb'+cnt).val());
	$('#TstCnt').val(cnt);
	$('#test').find('input[name=memoSndName]:checked').each(function(){
		this.checked = false;
	});
	view(divId,e);
}
function pickStaff(){
	var names = '';
	$('#test').find('input[name=memoSndName]:checked').each(function(){
		if(names.length>0) names+=',';
		names+=this.value;
	});
	var data = {
			offerSnb : $('#TofferSnb').val()
			,memoSndName : names
	}, fn = function(arg){
		$('#staffsBtn'+$('#TstCnt').val()).children().html(arg);
		$(".popUpMenu").hide();
	}
	ajaxModule(data,"../work/mnaMatchingStaffs.do",fn);
}
</script>
</head>
<style>
tbody tr:hover{background-color: moccasin !important;}
</style>
<body>
<div id="wrap" class="content_box">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

	<%@include file="includeTab.jsp"%>
		<table class="t_skinR00">
			<colgroup>
				<col width="77">
				<%-- <col width="140">
				<col width="80"> --%>
				<col width="80">
				<col width="80">
				<col width="200">
				<col width="300">
				<col width="80">
				<col width="63">
			</colgroup>
			<thead>
				<tr>
					<th style="height:20px"<%-- onclick="sortTable(1);" --%> class="bgYlw">제안일자</th>
					<%-- <th class="bgYlw pd0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="hand" onclick="sortTable('sellBuy','${TAB}');">▼</span></th>
					<th class="bgYlw pd0">업종</th> --%>
					<th class="bgYlw pd0">발행규모</th>
					<th class="bgYlw pd0">투자규모</th>
					<th class="bgYlw pd0">딜제목</th>
					<th class="bgYlw pd0">코멘트 내용</th>
					<th class="bgYlw pd0">진행사항</th>
					<th class="bgYlw pd0">입력자</th>
				</tr>
				<tr style="height:1px;"></tr>
			</thead>
			</table></div>
	<div style="padding-top:105px;">
		<table class="t_skinR00" style="table-layout:fixed;">
			<colgroup>
				<col width="77">
				<%-- <col width="80">
				<col width="60">
				<col width="80"> --%>
				<col width="80">
				<col width="80">
				<col width="200">
				<col width="300">
				<col width="80">
				<col width="60">
			</colgroup>
		<tbody>
		<%-- 입력한 당일만 삭제 가능하게 작업 --%>
			<c:forEach var="offer" items="${offerList}" varStatus="status">
				<c:set var="mnaYN" value="N"/><c:if test="${offer.categoryCd eq '00008'}"><c:set var="mnaYN" value="Y"/></c:if>
				<fmt:formatDate var="dueDate" value="${offer.dueDt}" pattern="yyyy-MM-dd" scope="page"/>
				<tr class="hov hand<c:if test="${dueDate <= curDate}"> red</c:if>
					<c:if test="${mnaYN eq 'Y'}">
						<c:if test="${offer.progressCd == '00001'}"> bgOdd</c:if>"
						<c:choose>
							<c:when test="${offer.progressCd == '10000'}"> style="height:40px;background-color:#B9B9B9" </c:when>
							<c:otherwise>  <c:if test="${offer.progressCd ne '00002' and offer.progressCd ne '00004' and offer.progressCd ne '00006'}">style="height:40px;"</c:if><c:if test="${offer.progressCd eq '00002'}">style="height:40px;background-color:#E7E7E7"</c:if><c:if test="${offer.progressCd eq '00004'}">style="height:40px;background-color:#DCEACE"</c:if><c:if test="${offer.progressCd == '00006'}">style="height:40px;background-color:#A9F5BC"</c:if><%-- <c:if test="${fn:length(offer.cpnId) == 7}"> style="background-color:#CEF6EC"</c:if> --%></c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${mnaYN eq 'N'}">
						<c:if test="${offer.progressCd == '00001'}"> bgOdd</c:if>"
						<c:choose>
							<c:when test="${offer.progressCd == '10000'}"> style="height:40px;background-color:#B9B9B9" </c:when>
							<c:otherwise>  <c:if test="${offer.progressCd ne '00002' and offer.progressCd ne '00003'}">style="height:40px;"</c:if><c:if test="${offer.progressCd == '00002'}">style="height:40px;background-color:#E7E7E7"</c:if><c:if test="${offer.progressCd == '00003'}">style="height:40px;background-color:#A9F5BC"</c:if><%-- <c:if test="${fn:length(offer.cpnId) == 7}"> style="background-color:#CEF6EC"</c:if> --%></c:otherwise>
						</c:choose>
					</c:if>
				 onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');">
					<td class="cent pd0" style="width:74px;color:black;">${offer.tmDt}</td>
				<input type="hidden" id="offerSnb${status.count}" value="${offer.sNb}">
					<td class="cent pd0">${offer.price}</td>
					<td class="cent pd0">${offer.investPrice}</td><%-- popUp 함수 오류나면 changePage 함수로 --%>
					<td class="pd0">&nbsp;&nbsp;
						<c:if test="${not empty offer.tmpNum1 or not empty offer.tmpNum2}"><img class="filePosition" id="fileNew${status.count}" src="../images/file/new0.gif" style="width:23px;height:11px"/></c:if>
						<b>${offer.cpnNm}<c:if test="${not empty offer.categoryCd}"><c:forEach var="cmmCd" items="${cmmCdCategoryList}"><c:if test="${offer.categoryCd == cmmCd.dTailCd}"> - ${cmmCd.cdNm}<span style="display:inline-block;width:20px;"></c:if></c:forEach></c:if></b>&nbsp;
						<c:if test="${offer.fileCnt != 0}"><span style="color:#89A0DA">
							<img class="filePosition" id="file${status.count}" src="../images/file/files.png" style="width:16px;height:16px"/><b>[${offer.fileCnt + offer.commentFileCnt}]</b></span></c:if>
						<c:if test="${offer.analysis != 0}"><span style="color:mediumvioletred">
							<img class="filePosition" id="fileAn${status.count}" src="../images/recommend/analy.png" style="width:16px;height:16px"/><b>[${offer.analysis}]</b></span></c:if>
						<c:if test="${offer.opinion != 0}"><span style="color:darkgoldenrod">
							<img class="filePosition" id="fileOp${status.count}" src="../images/recommend/comment1.png" style="width:16px;height:16px"/><b>[${offer.opinion}]</b></span></c:if>&nbsp;</nobr>
					</td>
					<td>${offer.memo}</td>
					<td class="cent pd0">${offer.progressNm}</td>
					<td class="cent pd0">${offer.rgNm}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
		
	<div>
	<!-- 의견 -->
		<c:forEach var="offer" items="${offerList}" varStatus="status">
		<div class="popUpMenu title_area" id="opinionPr${offer.sNb}" name="textR">
		<c:choose><c:when test="${userLoginInfo.permission > '00019' or userLoginInfo.permission == '00014'  or  userLoginInfo.name==offer.rgNm}"> 
				<input type="hidden" id="dealOpinionSNb${offer.sNb}" value="${offer.sNb }">
				<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
				<ul><c:choose>
					<c:when test="${empty offer.investOpinion}"><li class="c_note"><textarea id="opinionarea0" placeholder="투자의견을 입력하세요."></textarea></li></c:when>
					<c:otherwise><li class="c_note"><textarea id="opinionarea${offer.sNb}">${offer.investOpinion}</textarea></li></c:otherwise></c:choose>
					<p class="bsnsR_btn">
						<span class="dealResult_btnOk btn s green"><a><spring:message code="button.save" /></a></span>&nbsp;&nbsp;&nbsp;
						<!-- <span class="dealResult_btnDel">완전삭제</span> -->
					</p>
				</ul>
			</c:when><c:otherwise>
				<input type="hidden" id="opinionSNb${offer.sNb}" value="${offer.sNb }">
				<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
				<ul>
					<li class="c_note v-textarea">${fn:replace(offer.investOpinion, lf,"<br/>")}</li>
				</ul></c:otherwise>
		</c:choose>
		</div>
		</c:forEach>
	<!-- 의견 -->
	
	<c:if test="${TAB eq '00008'}">
	<%-- 직원 플로팅 div --%>
		<div class="popUpMenu" id="test" >
			<p class="closePopUpMenu" title="닫기">ⅹ닫기</p>
				<input type="hidden" id="TofferSnb"/>
				<input type="hidden" id="TstCnt"/>
			<c:forEach var="staff" items="${userList}" varStatus="tttStatus">
				<c:if test="${staff.srtCd != '00000'}">
				<p class="pd0 mg0"><label for="chbox${tttStatus.count}" class="checkR"><input type="checkbox" name="memoSndName" id="chbox${tttStatus.count}" value="${staff.usrNm}" >${staff.usrNm}</label></p>
				</c:if>
			</c:forEach>
			<p class="bsnsR_btn"><span class="btn s green" onclick="javascript:pickStaff('insertMemo.do',this)"><a>&nbsp;&nbsp;&nbsp;선정&nbsp;&nbsp;&nbsp;</a></span></p>
		</div>
	<%-- 직원 플로팅 div --%>
	</c:if>
	</div>
</div>
</body>
</html>