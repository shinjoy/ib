<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script>
$(document).ready(function(){
	$(".t_skin05 tbody tr.bgOdd:even").css("background-color", "#E0F8F7");
	$(".t_skin05 tbody tr.gray").css("background-color", "#B9B9B9");
	$(".t_skin05 tbody tr.hold").css("background-color", "#E7E7E7");
	$(".t_skin05 tbody tr.success").css("background-color", "#A9F5BC");
	//$("li").filter('.bgWt').css("background-color", "#fff");
});
</script>
</head>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<body>
<div id="wrap" style="height:100%;">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

	
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<form id="companyName" name="companyName" action="<c:url value='/company/main.do' />" method="post">
	<input type="hidden" id="c_Name" name="sNb">
</form>
<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
</form>

	<header>
		<div class="cent t_skin05width">
			<h2>
			 추천종목
			</h2>
		</div>
	</header>
	<section>
		
		<div class="year_wrap" style="padding-top:15px;">
		
			<c:set var="now" value="<%= new java.util.Date() %>"/>
			<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
			<fmt:formatDate var="cur_month" value='${now}' pattern='MM'/>
			
			<%-- <input type="hidden" id="choice_month" name="choice_month" value="${OPlist.choice_month}"> --%>
			
		<form name="modifyRec" id="dayForm" method="post">
		<div class="year_wrap">
		
			<c:set var="now" value="<%= new java.util.Date() %>"/>
			<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
			<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
						
			<input type="hidden" id="choice_month" name="choice_month" value="${choice_month }"/>
			<input type="hidden" id="total" name="total"/>
			<input type="hidden" id="carNum" name="carNum" value="${carNumber }"/>
			
			<span class="year">
				<select id='select_year' name='choice_year'>
					<c:forEach var="year" begin="2013" end="${cur_year}">
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
		</div>
		</form>
		</div>

			<table class="t_skin05 t_skin05width">
				<thead>
					<tr>
 						<th class="bgYlw w50">일자</th>
 						<th class="bgYlw">종목</th>
 						<th class="bgYlw">유형</th>
 						<th class="bgYlw w50">추천인</th>
 						<th class="bgYlw">증권사IB<br/><small>(과거 거래이력이 있는  증권사IB)</small></th>
 						<th class="bgYlw w50">의견</th>
 						<th class="bgYlw w50">결과</th>
 						<th class="bgYlw w50">딜제안자</th>
 						<th class="bgYlw w50">규모</th>
 						<th class="bgYlw w50">진행사항</th>
 						<th class="bgYlw">메모</th>
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
				<tbody>
					<c:forEach var="rcmd" items="${recommendList}" varStatus="status"><c:set var="cnt" value="${status.count }"/>
						<tr class="bgOdd <c:if test="${rcmd.progressCd=='10000'}">gray</c:if> <c:if test="${rcmd.progressCd=='00003'}">success</c:if>  <c:if test="${rcmd.progressCd=='00002'}">hold</c:if>">
							<td class="cent"><nobr>${rcmd.tmDt}</nobr></td>
							<td class="cent navy bold pd0"><nobr><a onclick="popUp('','rcmdCpn','','${rcmd.sNb}')">${rcmd.cpnNm}</a></nobr></td>
							<td class="cent"><nobr><c:forEach var="cmmCd" items="${cmmCdCategoryList}"><c:if test="${rcmd.categoryCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach></nobr></td>
							<td class="cent"><nobr>${rcmd.rgNm}</nobr></td>
							<td class="cent navy bold pd0"><c:if test="${not empty rcmd.ibInfo or not empty rcmd.ibInfoDealNet}">
								<table style="margin:1px;float:left"><tr><c:if test="${not empty rcmd.ibInfo}">
									<c:set var="eachIB" value="${fn:split(rcmd.ibInfo, ',')}"/>
									<c:forEach var="IBs" items="${eachIB}" varStatus="imSt">
										<c:set var="IBinfo" value="${fn:split(IBs, '^')}"/>
										<td class="" title="${IBinfo[2]}"><a onclick="popUp('','rcmdCst','','${IBinfo[0]}')">
											<nobr>${IBinfo[4]}</nobr><br/>
											${IBinfo[1]}
										</a></td>
									</c:forEach>
								</c:if><c:if test="${not empty rcmd.ibInfoDealNet}">
									<c:set var="eachIBdealNet" value="${fn:split(rcmd.ibInfoDealNet, ',')}"/>
									<c:forEach var="IBs2" items="${eachIBdealNet}" varStatus="imSt">
										<c:set var="IBinfoDealNet" value="${fn:split(IBs2, '^')}"/>
										<td class="" title="${IBinfoDealNet[2]}"><a onclick="popUp('','rcmdCst','','${IBinfoDealNet[0]}')">
											<nobr>${IBinfoDealNet[4]}</nobr><br/>
											${IBinfoDealNet[1]}
										</a></td>
									</c:forEach>
								</c:if>
								</tr></table></c:if>
							</td>
							
							<td class="pd0"><nobr>
								&nbsp;<span class="btn s gold"><a id="opinionBtn${cnt }" onclick="popUp('','rcmdComment','','${rcmd.offerSnb}');">의견</a></span>
								<c:if test="${rcmd.analysis != 0}"><span style="color:mediumvioletred">&nbsp;<b>[${rcmd.analysis}]</b></span></c:if><c:if test="${rcmd.opinion != 0}"><span style="color:darkgoldenrod">&nbsp;<b>[${rcmd.opinion}]</b></span></c:if>&nbsp;</nobr>
							</td>
							<td class="cent pd0"><c:if test="${userLoginInfo.permission > '00019'}">
								<span class="btn s <c:if test="${rcmd.result == '00001'}">red</c:if>"><a onclick="updateRCMD('rslt','00001','${rcmd.offerSnb}');">&nbsp;적격&nbsp;</a></span><br/>
								<span class="btn s <c:if test="${rcmd.result == '00002'}">red</c:if>"><a onclick="updateRCMD('rslt','00002','${rcmd.offerSnb}');">부적격</a></span></c:if>
								
								<c:if test="${userLoginInfo.permission < '00020'}"><c:if test="${rcmd.result!='00000'}">
										<c:if test="${rcmd.result=='00001'}"><b>적격</b></c:if>
										<c:if test="${rcmd.result=='00002'}"><b>부적격</b></c:if>
								</c:if></c:if>
							</td>
							<td class="cent"><c:if test="${userLoginInfo.permission > '00019'}">
									<c:if test="${empty rcmd.rcmdProposer}"><span class="btn s"><a id="staffID${cnt }" onclick="staffDiv(this,'test','${rcmd.offerSnb}','${rcmd.cpnNm}');">지정</a></span></c:if>
									<c:if test="${not empty rcmd.rcmdProposer}"><span class="btn s navy"><a id="updateStaff${cnt }" onclick="staffDiv(this,'test','${rcmd.offerSnb}','${rcmd.cpnNm}');">${rcmd.rcmdProposer}</a></span></c:if>
								</c:if><c:if test="${userLoginInfo.permission < '00020'}">
									<nobr>${rcmd.rcmdProposer}</nobr></c:if>
							</td>
							<td class="cent">
								<c:if test="${userLoginInfo.permission < '00020'}"><nobr>${rcmd.price}</nobr></c:if>
								<c:if test="${userLoginInfo.permission > '00019'}">
								<input type="text" id="price${cnt}" value="${rcmd.price}" style="width:50px;text-align:right;">
								<span class="btn s green"><a onclick="updateRCMD('price',$('#price${cnt}').val(),'${rcmd.offerSnb}');">수정</a></span><br/>
								</c:if>
							</td>
							<td class="cent">
								<select onchange="updateRCMD('progress',this.value,'${rcmd.offerSnb}');">
									<option value="00001" <c:if test="${rcmd.progressCd =='00001'}">selected</c:if>>진행중</option>
									<option value="00003" <c:if test="${rcmd.progressCd =='00003'}">selected</c:if>>성사</option>
									<option value="00002" <c:if test="${rcmd.progressCd =='00002'}">selected</c:if>>미성사</option>
									<option value="10000" <c:if test="${rcmd.progressCd =='10000'}">selected</c:if>>drop</option>
								</select>
							</td>
							<td>
								<a class="memo_m" id="memo_${rcmd.offerSnb}">
								<c:choose>
									<c:when test="${empty rcmd.subMemo}"><font style="color:burlywood"><nobr><small>메모</small></nobr></font></c:when>
									<c:otherwise><small><b>${fn:substring(rcmd.subMemo,0,16)}<c:if test="${fn:length(rcmd.subMemo) > 16}">...</c:if></b></small></c:otherwise>
								</c:choose>
								</a>
							</td>


						</tr>
					</c:forEach>
				</tbody>
			</table>
	</section>
</div>
<div class="clear"></div>
</body>
</html>