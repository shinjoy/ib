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

<%-- <link href="<c:url value='/css/jquery.jqplot.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/jquery.jqplot.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/excanvas.min.js'/>"></script> --%>

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script>
$(document).ready(function(){
	$("tr:even").css("background-color", "#E0F8F7");
	$("td").filter('.bgWt').css("background-color", "#fff");

/* 	
		var userPoints = [10, 23, 28, 50]; //임시 데이타 
		var jobPoints = [2, 5, 6, 18]; //임시 데이타 
		//var userPoints = [];//실제 데이타는 아래와 같이 처리하세요. 
		//for (var i=0; i<2*Math.PI; i+=0.1){ 
			// cosPoints.push([i, Math.cos(i)]); 
		//} 
		plot = $.jqplot('chart', [userPoints, jobPoints], { legend:{show:true, location:'ne'}, title:'Activity', series:[{label:'사용자'},{label:'직업'}], axes:{ xaxis:{ label:'date', autoscale: true }, yaxis:{ label:'count', autoscale: true } } }); 
 */
		
});
</script>
</head>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<body>
<div id="wrap">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

	
	
<!-- offer 목록 -->		
<div id="offerDiv"><div id="offerPr" style="display: none;"></div></div>
<div z-index="100">
	<div class="popUpMenu title_area offerL" id="${staff1_7 + 1}offerPr${offer1_7}">
		<p class="closePopUpMenu">ⅹ닫기</p>
		<c:forEach var="offer" items="${list}">
			<ul>
				<li class="c_title">${fn:substring(offer.tmDt,0,10)}&nbsp;:&nbsp;${offer.cstCpnNm}:${offer.cstNm}&nbsp;&nbsp;${offer.offerNm}
				<c:if test="${not empty offer.price && offer.price!='발행규모'}">
				<li>${offer.categoryNm}&nbsp;&nbsp;&nbsp;&nbsp;발행규모: ${offer.price}</li>
				</c:if>
				</li>
					<c:if test="${not empty offer.financing or not empty offer.management or not empty offer.mna or not empty offer.etc}">
					<li style="padding-top:5px;"><b>핵심체크사항</b></li>
					<li style="border:2px dotted navy;margin-bottom:5px;">
						<ul style="width:465px; padding: 2px;font-family: 맑은 고딕, Trebuchet MS, Verdana, Geneva, sans-serif;">
							<li>
							<c:if test="${not empty offer.financing }">&nbsp;&nbsp;<b>자금조달: </b>${offer.financing}</c:if>
							<c:if test="${not empty offer.management }">&nbsp;&nbsp;<b>자산운용: </b>${offer.management}</c:if>
							<c:if test="${not empty offer.mna }">&nbsp;&nbsp;<b>M&A: </b>${offer.mna}</c:if>
							<c:if test="${not empty offer.etc }">&nbsp;&nbsp;<b>실적: </b>${offer.etc}</c:if>
							<c:if test="${not empty offer.share }">&nbsp;&nbsp;<b>공유: </b>${offer.share}</c:if>
							<c:if test="${not empty offer.resource }">&nbsp;&nbsp;<b>인재: </b>${offer.resource}</c:if>
							<c:if test="${not empty offer.humanNet }">&nbsp;&nbsp;<b>인맥: </b>${offer.humanNet}</c:if>
							<c:if test="${not empty offer.audit }">&nbsp;&nbsp;<b>심사역: </b>${offer.audit}</c:if>
							<c:if test="${not empty offer.investInte }">&nbsp;&nbsp;<b>투자관심: </b>${offer.investInte}</c:if>
							</li>
						</ul>
					</li>
					</c:if>

				<li class="m_note">&nbsp;${fn:replace(offer.memo, lf,"<br/>")}</li>
			</ul>
		</c:forEach>
	</div>
</div>


<!-- offer 목록 -->		
	
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
	<div class="fixed-top" style="padding-left:10px;">
	<header>
		<div class="cent t_skin05width">
			<h2 class="h_divTitle">
			<c:if test="${choice_month < 7}"><font color="red">상반기</font></c:if>
			<c:if test="${choice_month > 6}"><font color="red">하반기</font></c:if>
			 개인별 실적 현황
			</h2>
		</div>
	</header>
		
		<div class="year_wrap" style="padding-top:15px;">
		
			<c:set var="now" value="<%= new java.util.Date() %>"/>
			<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
			<fmt:formatDate var="cur_month" value='${now}' pattern='MM'/>
			
			<input type="hidden" id="choice_month" name="choice_month" value="${workVO.choice_month}">
			
		<form id="dayForm" name="dayForm" action="<c:url value='/stats/index.do' />" method="get">
			<input type="hidden" name="total" id="total">
		
			<span class="year">
				<select id='choice_yearS' name='choice_year'>
					<c:forEach var="year" begin="2010" end="${cur_year}">
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

 			<span class="btn s blue"><a onclick="submitLH('high')">상반기</a></span>
			<span class="btn s blue"><a onclick="submitLH('low')">하반기</a></span>
		</form>
		</div>
			<table class="t_skin05 t_skin05width">
				<thead>
					<tr>
 						<th rowspan="3" class="bgYlw w50">활동<br/>내용</th>
 						<th rowspan="3" class="bgYlw w50">업무</th>
						<th colspan="4" class="bgYlw w50">딜</th>
						<th colspan="3" class="bgYlw w50">자금</th>
						<th rowspan="2" colspan="2" class="bgYlw w50">정보등록</th>
						<th rowspan="2" colspan="2" class="bgYlw w50">추천종목</th>
						<th rowspan="3" class="bgYlw w50">추천<br/>의견</th>
						<th rowspan="3" class="bgYlw w50">탐방</th>
						<th rowspan="3" class="bgYlw w50">리포트</th>
						<th rowspan="3" class="bgYlw w50">분석</th>
						<th rowspan="3" class="bgYlw w50">약속자</th>
						<th rowspan="3" class="bgYlw w50">공동<br/>진행</th>
						<th rowspan="3" class="bgYlw w50">네트<br/>워크<br/>등록</th>
						<%-- <th class="bgYlw w50">합계</th> --%>
					</tr>
					<tr>
						<th colspan="2" class="bgYlw w50">중개</th>
						<th colspan="2" class="bgYlw w50">직접발굴</th>
						<th colspan="2" class="bgYlw w50">일임</th>
						<th colspan="1" class="bgYlw w50">재매각</th>
						
					</tr>
					<tr>
						<c:forEach begin="1" end="2">
						<th class="bgYlw w50">제안</th>
						<th class="bgYlw w50">성사</th>
						</c:forEach>
						<th class="bgYlw w50" title="ib시스템->일임->성사">쿼터</th>
						<th class="bgYlw w50" title="고객시스템의 실제금액">성사</th>
						<th class="bgYlw w50">성사</th>
						<c:forEach begin="1" end="2">
						<th class="bgYlw w50">횟수</th>
						<th class="bgYlw w50">성과</th>
						</c:forEach>
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
			</table>
		</div>
		<div style="padding:125px 0 0 10px">
			<table class="t_skin05 t_skin05width">
				<tbody class="bgOdd">
					<c:forEach var="stats" items="${statsList}" varStatus="status">
						<tr>
							<%-- <input type="hidden" id="statsSNb${status.count}" value="${stats.sNb}"> --%>
							<td rowspan="2" class="cent w50"><nobr><b>${stats.staffNm}</b></nobr></td>
						<%-- <c:if test="${status.count == 1 }">
							<td class="cln w1" rowspan="${fn:length(statsList)*4}"></td>
						</c:if> --%>
							<td class="cent w50">목표</td>
							
						<!-- 딜 -->
							<td class="cent w50">
								<c:choose><c:when test="${not empty stats.planMediateDeal and stats.planMediateDeal != 0}"><b>${stats.planMediateDeal} 딜</b></c:when></c:choose>
							</td>
							<td class="cent w50">
								<c:choose><c:when test="${not empty stats.planMediateDealSuccess and stats.planMediateDealSuccess != 0}"><b>${stats.planMediateDealSuccess} 딜</b></c:when></c:choose>
							</td>

							<td class="cent w50">
								<c:choose><c:when test="${not empty stats.planDirectDeal and stats.planDirectDeal != 0}"><b>${stats.planDirectDeal} 딜</b></c:when></c:choose>
							</td>
							<td class="cent w50">
								<c:choose><c:when test="${not empty stats.planDirectDealSuccess and stats.planDirectDealSuccess != 0}"><b>${stats.planDirectDealSuccess} 딜</b></c:when></c:choose>
							</td>

						<!-- 자금 -->
							<td class="cent w50">
								<c:choose><c:when test="${not empty stats.planEntrustSuccess and stats.planEntrustSuccess != 0}"><nobr><b>${stats.planEntrustSuccess} 억</b></nobr></c:when></c:choose>
							</td>
							<td class="cent w50" rowspan="2">
								<c:choose><c:when test="${not empty stats.cusRealMoney and stats.cusRealMoney != 0}"><font color="navy">${stats.cusRealMoney} 억</font></c:when></c:choose>
							</td>
							
							<td class="cent w50">
								<c:choose><c:when test="${not empty stats.planReSaleSuccess and stats.planReSaleSuccess != 0}"><nobr><b>${stats.planReSaleSuccess} 억</b></nobr></c:when></c:choose>
							</td>
							
						<!-- 정보 -->
							<td class="cent w50 bgWt hoverTd" rowspan="2"><!-- 정보 -->
								<c:choose><c:when test="${not empty stats.financing and stats.financing != 0}"><a class="offerCnt" id="financing${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', this, '', '','','','0');"><font color="navy">${stats.financing}</font></a></c:when></c:choose>
							</td>
							<td class="cent w50 bgWt hoverTd" rowspan="2"><!-- 정보 -->
								<c:choose><c:when test="${not empty stats.financingSuccess and stats.financingSuccess != 0}"><a class="offerCnt" id="financingSuccess${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', this, '', '','','','1');"><font color="navy">${stats.financingSuccess}</font></a></c:when></c:choose>
							</td>
							<td class="cent w50 bgWt hoverTd" rowspan="2"><!-- 추천 -->
								<c:choose><c:when test="${not empty stats.recommend and stats.recommend != 0}"><a class="offerCnt" id="recommend${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00000', this, '', '00013');"><font color="navy">${stats.recommend}</font></a></c:when></c:choose>
							</td>
							<td class="cent w50 bgWt hoverTd" rowspan="2"></td>
							<td class="cent w50 bgWt hoverTd" rowspan="2"><!-- 추천종목의견 -->
								<c:choose><c:when test="${not empty stats.opinion and stats.opinion != 0}"><a class="offerCnt" id="opinion${status.count}" onclick="statsOfferdivAjax('${stats.staffId}','', this, '', '','','','100');"><font color="navy">${stats.opinion}</font></a></c:when></c:choose>
							</td>
							<td class="cent w50 bgWt hoverTd" rowspan="2"><!-- 탐방 -->
								<c:choose><c:when test="${not empty stats.invite and stats.invite != 0}"><a class="offerCnt" id="invite${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00000', this, '', '00003');"><font color="navy">${stats.invite}</font></a></c:when></c:choose>
							</td>
							<td class="cent w50 bgWt hoverTd" rowspan="2"><!-- 리포트 -->
								<c:choose><c:when test="${not empty stats.report and stats.report != 0}"><a class="offerCnt" id="report${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00000', this, '', '','', 'Y');"><font color="navy">${stats.report}</font></a></c:when></c:choose>
							</td>
							<td class="cent w50 bgWt hoverTd" rowspan="2"><!-- 분석 -->
								<c:choose><c:when test="${not empty stats.anner and stats.anner != 0}"><a class="offerCnt" id="anner${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00000', this, '', '00004');"><font color="navy">${stats.anner}</font></a></c:when></c:choose>
							</td>
							<td class="cent w50 bgWt hoverTd" rowspan="2"><!-- 약속자 -->
								<c:choose><c:when test="${not empty stats.infoProvider and stats.infoProvider != 0}"><a class="offerCnt" id="infoProvider${status.count}" onclick="statsOfferdivAjax('','', this, '', '','${stats.infoProviderCd}');"><font color="navy">${stats.infoProvider}</font></a></c:when></c:choose>
							</td>
							<td class="cent w50 bgWt hoverTd" rowspan="2"><!-- 공동진행 -->
								<c:choose><c:when test="${not empty stats.supporter and stats.supporter != 0}"><a class="offerCnt" id="supporter${status.count}" onclick="statsOfferdivAjax('','', this, '', '', '', '', '','${stats.supporterCd}');"><font color="navy">${stats.supporter}</font></a></c:when></c:choose>
							</td>
							<td class="cent w50 bgWt hoverTd" rowspan="2"><!-- 네트워크 -->
								<c:choose><c:when test="${(not empty stats.networkCst or not empty stats.networkCpn)and(stats.networkCst != 0 or stats.networkCpn != 0)}"><a class="offerCnt" id="network${status.count}" onclick="statsNetworkAjax(this,'${stats.networkCst}','${stats.networkCpn}','${stats.staffId}');"><font color="navy">${stats.networkCst + stats.networkCpn}</font></a></c:when></c:choose>
							</td>


							<%-- <td class="cent">${stats.sum}</td> --%>
						</tr>
						
						<tr>
							<td class="cent">결과</td>
						<!-- 딜 -->
							<td class="cent hoverTd">
								<c:choose><c:when test="${stats.mediateDeal != 0}"><a class="offerCnt" id="midiateDeal${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00001', this);"><font color="navy">${stats.mediateDeal} 딜</font></a></c:when></c:choose>
							</td>
							<td class="cent hoverTd">
								<c:choose><c:when test="${stats.dealRgood != 0}"><a class="offerCnt" id="dealRgood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00001', this, '00003');"><font color="navy">${stats.dealRgood} 딜</font></a></c:when></c:choose>
							</td>
							<td class="cent hoverTd">
								<c:choose><c:when test="${stats.directDeal != 0}"><a class="offerCnt" id="directDeal${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00002', this);"><font color="navy">${stats.directDeal} 딜</font></a></c:when></c:choose>
							</td>
							<td class="cent hoverTd">
								<c:choose><c:when test="${stats.dealSgood != 0}"><a class="offerCnt" id="dealSgood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00002', this, '00003');"><font color="navy">${stats.dealSgood} 딜</font></a></c:when></c:choose>
							</td>
							
						<!-- 자금 -->
							<td class="cent hoverTd">
								<c:choose><c:when test="${!(stats.entrustGood == 0 or empty stats.entrustGood)}"><a class="offerCnt" id="entrustGood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00011', this, '00003');"><nobr><font color="navy">${stats.entrustGood} 억</font></nobr></a></c:when></c:choose>
							</td>
							<td class="cent hoverTd">
								<c:choose><c:when test="${!(stats.reSaleGood == 0 or empty stats.reSaleGood)}"><a class="offerCnt" id="reSaleGood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00012', this, '00003');"><nobr><font color="navy">${stats.reSaleGood} 억</font></nobr></a></c:when></c:choose>
							</td>
						</tr>
						<tr style="height:0.5px;"></tr><tr style="height:0.5px;"></tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</article>
	</section>
<div class="clear"></div>
</body>
</html>