<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/JavaScript" src="<c:url value='/js/part/stats.js'/>" ></script>
<script>
$(document).ready(function(){
	$(".t_skin05 ul li:first-child").css("background-color", "#E0F8F7");
	$(".t_skin05 ul li p:even").css("background-color", "#E0F8F7");
	$(".t_skin05 ul li p:even").css("border-bottom", "1px solid #75C5DE");
	//$("li").filter('.bgWt').css("background-color", "#fff");
	var tempX=0;
	var tempY=0;
	window.onscroll = function(){//alert($("#fixedTop").attr('class'));
	var scrollX = window.scrollX || document.documentElement.scrollLeft;
	var scrollY = window.scrollY || document.documentElement.scrollTop;
	var w=window.innerWidth
	|| document.documentElement.clientWidth
	|| document.body.clientWidth;
		if(tempX != scrollX){
			//alert("좌우스크롤");
			$(".fixed-top").css('right',scrollX);
			$("#title0").css('width',w+scrollX);
		}else if(tempY != scrollY){//alert(scrollY/40)
			//alert("상하스크롤");
			$(".fixed-left").css('top',134-scrollY);
		}
	    tempX = scrollX;
	    tempY = scrollY;
	};
});
</script>
<style>.year {padding-left: 10px;}</style>
</head>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<body>
<div id="wrap" class="content_box" style="height:100%;">

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
			<li class="c_title">${fn:substring(offer.tmDt,0,10)}&nbsp;:&nbsp;${offer.cstCpnNm}:${offer.cstNm}&nbsp;&nbsp;${offer.offerNm}<c:if test="${not empty offer.price && offer.price!='발행규모'}"><li>${offer.categoryNm}&nbsp;&nbsp;&nbsp;&nbsp;발행규모: ${offer.price}</li></c:if></li><c:if test="${not empty offer.financing or not empty offer.management or not empty offer.mna or not empty offer.etc}">
			<li style="padding-top:5px;"><b>핵심체크사항</b></li>
			<li style="border:2px dotted navy;margin-bottom:5px;">
				<ul style="width:465px; padding: 2px;font-family: 맑은 고딕, Trebuchet MS, Verdana, Geneva, sans-serif;">
					<li><c:if test="${not empty offer.financing }">&nbsp;&nbsp;<b>자금조달: </b>${offer.financing}</c:if>
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
			</li></c:if>
			<li class="m_note">&nbsp;${fn:replace(offer.memo, lf,"<br/>")}</li>
		</ul>
		</c:forEach>
	</div>
</div>

<!-- offer 목록 -->
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<div id="fixedTop" class="fixed-top" style="z-index:9999;">
	<header>
		<div class="cent">
			<h2 id="title0" class="h_divTitle">
			<%-- <c:if test="${choice_month < 7}"><font color="red">상반기</font></c:if>
			<c:if test="${choice_month > 6}"><font color="red">하반기</font></c:if> --%>
			 개인별 실적 현황
			</h2>
		</div>
	</header>

	<div class="year_wrap" style="padding-top:15px;">
		<c:set var="now" value="<%= new java.util.Date() %>"/>
		<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
		<fmt:formatDate var="cur_month" value='${now}' pattern='MM'/>
		<input type="hidden" id="choice_month" name="choice_month" value="${workVO.choice_month}">

	<form id="dayForm" name="dayForm" action="<c:url value='/stats/index.do' />" method="post">
		<input type="hidden" name="total" id="total">
		<span class="year">
			<select id='choice_yearS' name='choice_year' onchange="submitLH();">
				<c:forEach var="year" begin="2010" end="${cur_year+1}">
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

		<!-- <span class="btn s blue"><a onclick="submitLH('high')">상반기</a></span>
		<span class="btn s blue"><a onclick="submitLH('low')">하반기</a></span> -->
	</form>
	</div>

	<div>
		<table class="t_skinR00" style="width:1701px/* 47px */;margin-left:10px;">
		<thead>
			<tr>
				<th rowspan="4" class="bgYlw w50 pd0">활동<br/>내용</th>
				<th rowspan="4" class="bgYlw w50 pd0">업무</th>
				<th colspan="12" class="bgGrn w50">딜</th>
				<th colspan="8" class="bgPich w50">자금</th>
				<th colspan="2" class="bgSky w50 pd0">추천</th>
				<th rowspan="4" class="bgSky w50 pd0">딜<br/>분석</th>
				<th rowspan="4" class="bgSky w50 pd0">탐방</th>
				<th rowspan="4" class="bgSky w50 pd0">리포트</th>
				<th rowspan="4" class="bgSky w50 pd0">제안서</th>
				<th colspan="4" class="bgYlw w50">정보등록</th>
				<th rowspan="4" class="bgYlw w50 pd0">네트<br/>워크<br/>등록</th>
				<th rowspan="4" class="bgYlw w50 pd0">외부인<br/>소개</th>
				<th colspan="4" class="bgYlw w50 pd0">Idea</th>
				<!-- <th rowspan="4" class="bgYlw w50 pd0">공동<br/>진행</th> -->
				<%-- <th class="bgYlw w50">합계</th> --%>
			</tr>
			<tr>
				<th colspan="6" class="bgGrn w50">중개</th>
				<th colspan="6" class="bgGrn w50">직접발굴</th>
				<th colspan="3" class="bgPich w50">일임</th>
				<th colspan="2" class="bgPich w50">펀드</th>
				<th colspan="2" class="bgPich w50">재매각</th>
				<th rowspan="3" class="bgPich w50 pd0">총<br/>규모</th>

				<th rowspan="3" class="bgSky w50 pd0">종목<br/>추천</th>
				<th rowspan="3" class="bgSky w50 pd0">추천<br/>의견</th>

				<th rowspan="3" class="bgYlw w50 pd0">횟수</th>
				<th colspan="3" class="bgYlw w50 pd0">중요도</th>
				
				<th rowspan="3" class="bgYlw w50 pd0">건수</th>
				<th rowspan="3" class="bgYlw w50 pd0">평점</th>
				<th colspan="2" class="bgYlw w50 pd0">코멘트</th>
			</tr>
			<tr>
				<c:forEach begin="1" end="2">
				<th rowspan="2" class="bgGrn w50 pd0">제안</th>
				<th colspan="2" class="bgGrn w50 pd0">단독</th>
				<th colspan="2" class="bgGrn w50 pd0">공동</th>
				<th rowspan="2" class="bgGrn w50 pd0">총<br/>규모</th>
				</c:forEach>
				<th rowspan="2" class="bgPich w50 pd0" title="ib시스템->일임->성사">쿼터</th>
				<th rowspan="2" class="bgPich w50 pd0" title="고객시스템의 일임금액">단독<br/>성사</th>
				<th rowspan="2" class="bgPich w50 pd0" title="고객시스템의 일임금액">공동<br/>성사</th>
				<th rowspan="2" class="bgPich w50 pd0">단독<br/>성사</th>
				<th rowspan="2" class="bgPich w50 pd0">공동<br/>성사</th>
				<th rowspan="2" class="bgPich w50 pd0">단독<br/>성사</th>
				<th rowspan="2" class="bgPich w50 pd0">공동<br/>성사</th>
				<%-- <c:forEach begin="1" end="2"> --%>

				<th rowspan="2" class="bgYlw">5</th>
				<th rowspan="2" class="bgYlw">4</th>
				<th rowspan="2" class="bgYlw">3</th>
				
				<th rowspan="2" class="bgYlw w50 pd0">건수</th>
				<th rowspan="2" class="bgYlw w50 pd0">평점</th>
				<!-- <th class="bgYlw w50">횟수</th>
				<th class="bgYlw w50">성과</th> -->
				<%-- </c:forEach> --%>
			</tr>
			<tr><c:forEach begin="1" end="4">
				<th class="bgGrn w50 pd0">성사</th>
				<th class="bgGrn w50 pd0">규모</th>
				</c:forEach>
			</tr>
		</thead>
		</table>
	</div>
</div>

<c:set var="mdDeal" value="0"/><c:set var="drGood" value="0"/><c:set var="mdDealpriceG" value="0"/><c:set var="drDeal" value="0"/><c:set var="dsGood" value="0"/><c:set var="drDealpriceG" value="0"/><c:set var="etGood" value="0"/><c:set var="crMoney" value="0"/><c:set var="rsGood" value="0"/><c:set var="crsMoney" value="0"/><c:set var="fnc" value="0"/><c:set var="ipt5" value="0"/><c:set var="ipt4" value="0"/><c:set var="ipt3" value="0"/><c:set var="rcmd" value="0"/><c:set var="opnn" value="0"/><c:set var="ivt" value="0"/><c:set var="rpt" value="0"/><c:set var="pps" value="0"/><c:set var="ann" value="0"/><c:set var="ifPv" value="0"/><c:set var="nwCst" value="0"/><c:set var="idc" value="0"/><c:set var="ids" value="0"/><c:set var="idrc" value="0"/><c:set var="idrs" value="0"/>

	<div id="nfixedMain" class="t_skin05" style="width:1709px/* 47px */;height:100%;padding-top:133px;border-left:0;border-bottom:0;display:inline-block;">
		<div id="fixedLeft" class="fixed-left" style="float:left;width:94px;padding-left:10px;background-color:white;border-right:1px solid #75c5de;">
		<tbody class="bgOdd">
			<c:set var="sumTeam" value="0"/>
			<c:forEach var="stats" items="${statsList}" varStatus="status">
			<c:if test="${sumTeam != stats.team}">
			<ul><li class="cent bgYlw" style="width:91px"><nobr><b>팀 합계</b></nobr></li></ul>
			</c:if>
			<c:set var="sumTeam" value="${stats.team}"/>
			<ul><input type="hidden" id="statsSNb${status.count}" value="${stats.sNb}">
				<li class="cent"><nobr><b>${stats.staffNm}</b></nobr></li>
				<li class="cent insideP"><p class="mg0">목표</p><p class="mg0">결과</p></li>
			</ul>
			</c:forEach>
			<ul><li class="cent" style="width:88px"><nobr><b>총 합계</b></nobr></li></ul>
		</tbody>
		</div>
		<div id="nfixedRight" style="padding-left:10px !important">
		<tbody class="bgOdd">
		<c:set var="sumTeam2" value="0"/>
		<c:forEach var="stats" items="${statsList}" varStatus="status">
			<!-- 공동규모 소수점이하 3자리 넣어서 에러 발생-->
			<fmt:formatNumber var="MediateDealpriceGood" value="${stats.mediateDealpriceGood}" pattern="0.0"/>
			<!-- 공동규모 소수점이하 3자리 넣어서 에러 발생-->
<c:set var="mdDeal" value="${stats.mediateDeal+mdDeal}"/><c:set var="drGood" value="${stats.dealRgood+drGood}"/><!--<c:set var="mdDealprice" value="${stats.mediateDealprice+mdDealprice}"/>--><c:set var="mdDealpriceG" value="${MediateDealpriceGood+mdDealpriceG}"/><c:set var="mdDealJoint" value="${stats.jointMediate+mdDealJoint}"/><c:set var="mdDealJointPrice" value="${stats.supPriceMedi + stats.jointMediateDealpriceGood+mdDealJointPrice}"/><c:set var="drDeal" value="${stats.directDeal+drDeal}"/><c:set var="dsGood" value="${stats.dealSgood+dsGood}"/><!--<c:set var="drDealprice" value="${stats.directDealprice+drDealprice}"/>--><c:set var="drDealpriceG" value="${stats.directDealpriceGood+drDealpriceG}"/><c:set var="drDealJoint" value="${stats.jointDirect+drDealJoint}"/><c:set var="drDealJointPrice" value="${stats.supPriceDire + stats.jointDirectDealpriceGood+drDealJointPrice}"/><c:set var="etGood" value="${stats.entrustGood+etGood}"/><c:set var="crMoney" value="${stats.cusRealMoney+crMoney}"/><c:set var="crJointMoney" value="${stats.cusRealJointMine+stats.supPriceCusJointMine+crJointMoney}"/><c:set var="rsGood" value="${stats.reSaleGood+rsGood}"/><c:set var="rsMoneyJoint" value="${stats.supPriceResa+stats.jointResaleDealpriceGood+rsMoneyJoint}"/><c:set var="fdGood" value="${stats.fundGood+fdGood}"/><c:set var="fdMoneyJoint" value="${stats.supPriceFund+stats.jointFundDealpriceGood+fdMoneyJoint}"/><c:set var="crsMoney" value="${stats.cusReSaleMoney+crsMoney}"/><c:set var="fnc" value="${stats.financing+fnc}"/><c:set var="fnS" value="${stats.financingSuccess+fnS}"/><c:set var="ipt5" value="${stats.importance5+ipt5}"/><c:set var="ipt4" value="${stats.importance4+ipt4}"/><c:set var="ipt3" value="${stats.importance3+ipt3}"/><c:set var="rcmd" value="${stats.recommend+rcmd}"/><c:set var="opnn" value="${stats.opinion+opnn}"/><c:set var="ivt" value="${stats.invite+ivt}"/><c:set var="rpt" value="${stats.report+rpt}"/><c:set var="pps" value="${stats.proposal+pps}"/><c:set var="ann" value="${stats.anner+ann}"/><c:set var="ifPv" value="${stats.introducer+ifPv}"/><c:set var="nwCst" value="${stats.networkCst+stats.networkCpn+nwCst}"/><c:set var="idc" value="${idc+stats.ideaCnt}"/><c:set var="ids" value="${ids+stats.ideaScore}"/><c:set var="idrc" value="${idrc+stats.ideaRcmdCnt}"/><c:set var="idrs" value="${idrs+stats.ideaRcmdScore}"/>

			<c:if test="${sumTeam2 != stats.team}">
			<ul>
				<li class="cent bgYlw hoverTd"></li>
				<li class="cent bgYlw hoverTd"></li>
			<!-- 딜 -->
				<li class="cent bgYlw hoverTd"><c:if test="${not empty TeaMmdDeal and TeaMmdDeal != 0}"><nobr><b>${TeaMmdDeal} 딜</b></nobr></c:if></li>
				<li class="cent bgYlw hoverTd"><c:if test="${not empty TeaMdrGood and TeaMdrGood != 0}"><nobr><b>${TeaMdrGood} 딜</b></nobr></c:if></li>
				<li class="cent bgYlw hoverTd"><fmt:parseNumber var="intMdDealpriceG" integerOnly="true" value="${TeaMmdDealpriceG}"/><c:if test="${not empty intMdDealpriceG and intMdDealpriceG != 0}"><nobr><b>${intMdDealpriceG}억</b></nobr></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 중개 공동성사 --><c:if test="${not empty TeaMmdDealJoint and TeaMmdDealJoint != 0}"><nobr><b>${TeaMmdDealJoint} 딜</b></nobr></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 중개 공동규모 --><c:if test="${not empty TeaMmdDealJointPrice and TeaMmdDealJointPrice != 0}"><nobr><b><fmt:formatNumber value="${TeaMmdDealJointPrice}" pattern="0.0"/>억</b></nobr></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 중개 총규모 --><fmt:parseNumber var="intTotalDeal" integerOnly="true" value="${intMdDealpriceG+TeaMmdDealJointPrice}"/><c:if test="${not empty intTotalDeal and intTotalDeal != 0}"><nobr><b><fmt:formatNumber value="${intMdDealpriceG+TeaMmdDealJointPrice}" pattern="0.0"/>억</b></nobr></c:if></li>

				<li class="cent bgYlw hoverTd"><!-- 직접발굴 제안 --><c:if test="${not empty TeaMdrDeal and TeaMdrDeal != 0}"><nobr><b>${TeaMdrDeal} 딜</b></nobr></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 직접발굴 단독성사 --><c:if test="${not empty TeaMdsGood and TeaMdsGood != 0}"><nobr><b>${TeaMdsGood} 딜</b></nobr></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 직접발굴 단독규모 --><c:if test="${not empty TeaMdrDealpriceG and TeaMdrDealpriceG != 0}"><nobr><b>${TeaMdrDealpriceG}억</b></nobr></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 직접발굴 공동성사 --><c:if test="${not empty TeaMdrDealJoint and TeaMdrDealJoint != 0}"><nobr><b>${TeaMdrDealJoint} 딜</b></nobr></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 직접발굴 공동규모 --><c:if test="${not empty TeaMdrDealJointPrice and TeaMdrDealJointPrice != 0}"><nobr><b><fmt:formatNumber value="${TeaMdrDealJointPrice}" pattern="0.0"/>억</b></nobr></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 직접발굴 총규모 --><c:if test="${not empty (TeaMdrDealpriceG+TeaMdrDealJointPrice) and (TeaMdrDealpriceG+TeaMdrDealJointPrice) != 0}"><nobr><b><fmt:formatNumber value="${TeaMdrDealpriceG+TeaMdrDealJointPrice}" pattern="0.0"/>억</b></nobr></c:if></li>

			<!-- 자금 -->
				<li class="cent bgYlw hoverTd"><c:if test="${not empty TeaMetGood and TeaMetGood != 0}"><nobr><b>${TeaMetGood}억</b></nobr></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 일임 성사 --><c:if test="${not empty TeaMcrMoney and TeaMcrMoney != 0}"><nobr><b>${TeaMcrMoney}억</b></nobr></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 일임 공동성사 --><c:if test="${not empty TeaMcrJointMoney and TeaMcrJointMoney != 0}"><nobr><b>${TeaMcrJointMoney}억</b></nobr></c:if></li>

				<li class="cent bgYlw hoverTd"><!-- 펀드 단독성사 --><c:if test="${not empty TeaMfdGood and TeaMfdGood != 0}"><nobr><b>${TeaMfdGood}억</b></nobr></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 펀드 공동성사 --><c:if test="${not empty TeaMfdMoneyJoint and TeaMfdMoneyJoint != 0}"><nobr><b>${TeaMfdMoneyJoint}억</b></nobr></c:if></li>

				<li class="cent bgYlw hoverTd"><!-- 재매각 단독성사 --><c:if test="${not empty TeaMrsGood and TeaMrsGood != 0}"><nobr><b>${TeaMrsGood}억</b></nobr></nobr></c:if></li>
				<%-- <li class="cent bgWt hoverTd"><!-- 재매각 성사 --><b>${TeaMcrsMoney}억</b></li> --%>
				<li class="cent bgYlw hoverTd"><!-- 재매각 공동성사 --><c:if test="${not empty TeaMrsMoneyJoint and TeaMrsMoneyJoint != 0}"><nobr><b>${TeaMrsMoneyJoint}억</b></nobr></nobr></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 자금 총규모 --><fmt:formatNumber var="tttSum" value="${TeaMcrMoney+TeaMcrJointMoney+TeaMfdGood+TeaMfdMoneyJoint+TeaMrsGood+TeaMrsMoneyJoint}" pattern="0.0"/><c:if test="${tttSum > 0.0}"><nobr><b>${tttSum}억</b></nobr></c:if></li>

			<!-- 정보 -->
				<li class="cent bgYlw hoverTd"><!-- 추천 --><c:if test="${not empty TeaMrcmd and TeaMrcmd != 0}"><b>${TeaMrcmd}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 추천종목의견 --><c:if test="${not empty TeaMopnn and TeaMopnn != 0}"><b>${TeaMopnn}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 분석 --><c:if test="${not empty TeaMann and TeaMann != 0}"><b>${TeaMann}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 탐방 --><c:if test="${not empty TeaMivt and TeaMivt != 0}"><b>${TeaMivt}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 리포트 --><c:if test="${not empty TeaMrpt and TeaMrpt != 0}"><b>${TeaMrpt}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 제안서 --><c:if test="${not empty TeaMpps and TeaMpps != 0}"><b>${TeaMpps}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 정보등록 --><c:if test="${not empty TeaMfnc and TeaMfnc != 0}"><b>${TeaMfnc}</b></c:if></li>
				<li class="cent bgYlw hoverTd" style="width:15px;"><!-- 정보등록 중요도 --><c:if test="${not empty TeaMfnS and TeaMipt5 != 0}"><b>${TeaMipt5}</b></c:if></li>
				<li class="cent bgYlw hoverTd" style="width:15px;"><!-- 정보등록 중요도 --><c:if test="${not empty TeaMfnS and TeaMipt4 != 0}"><b>${TeaMipt4}</b></c:if></li>
				<li class="cent bgYlw hoverTd" style="width:15px;"><!-- 정보등록 중요도 --><c:if test="${not empty TeaMfnS and TeaMipt3 != 0}"><b>${TeaMipt3}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 네트워크 등록 --><c:if test="${(not empty TeaMnwCst)and(TeaMnwCst != 0 )}"><b>${TeaMnwCst}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 외부인 소개 --><c:if test="${not empty TeaMifPv and TeaMifPv != 0}"><b>${TeaMifPv}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- idea 건수 --><c:if test="${not empty TeaMideaCnt and TeaMideaCnt != 0}"><b>${TeaMideaCnt}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- idea 평점 --><c:if test="${not empty TeaMideaScore and TeaMideaScore != 0}"><b>${TeaMideaScore}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- idea 코멘트 건수 --><c:if test="${not empty TeaMideaRcmdCnt and TeaMideaRcmdCnt != 0}"><b>${TeaMideaRcmdCnt}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- idea 코멘트 평점 --><c:if test="${not empty TeaMideaRcmdScore and TeaMideaRcmdScore != 0}"><b>${TeaMideaRcmdScore}</b></c:if></li>
			</ul>
<c:set var="TeaMmdDeal" value="0"/><c:set var="TeaMdrGood" value="0"/><c:set var="TeaMmdDealpriceG" value="0"/><c:set var="TeaMmdDealJoint" value="0"/><c:set var="TeaMmdDealJointPrice" value="0"/><c:set var="TeaMdrDeal" value="0"/><c:set var="TeaMdsGood" value="0"/><c:set var="TeaMdrDealpriceG" value="0"/><c:set var="TeaMdrDealJoint" value="0"/><c:set var="TeaMdrDealJointPrice" value="0"/><c:set var="TeaMetGood" value="0"/><c:set var="TeaMcrMoney" value="0"/><c:set var="TeaMcrJointMoney" value="0"/><c:set var="TeaMfdGood" value="0"/><c:set var="TeaMfdMoneyJoint" value="0"/><c:set var="TeaMrsGood" value="0"/><c:set var="TeaMrsMoneyJoint" value="0"/><c:set var="TeaMcrsMoney" value="0"/><c:set var="TeaMfnc" value="0"/><c:set var="TeaMfnS" value="0"/><c:set var="TeaMipt5" value="0"/><c:set var="TeaMipt4" value="0"/><c:set var="TeaMipt3" value="0"/><c:set var="TeaMrcmd" value="0"/><c:set var="TeaMopnn" value="0"/><c:set var="TeaMivt" value="0"/><c:set var="TeaMrpt" value="0"/><c:set var="TeaMpps" value="0"/><c:set var="TeaMann" value="0"/><c:set var="TeaMifPv" value="0"/><c:set var="TeaMnwCst" value="0"/><c:set var="TeaMideaCnt" value="0"/><c:set var="TeaMideaScore" value="0"/><c:set var="TeaMideaRcmdCnt" value="0"/><c:set var="TeaMideaRcmdScore" value="0"/>
			</c:if>

<c:set var="TeaMmdDeal" value="${stats.mediateDeal+TeaMmdDeal}"/><c:set var="TeaMdrGood" value="${stats.dealRgood+TeaMdrGood}"/><c:set var="TeaMmdDealpriceG" value="${MediateDealpriceGood+TeaMmdDealpriceG}"/><c:set var="TeaMmdDealJoint" value="${stats.jointMediate+TeaMmdDealJoint}"/><c:set var="TeaMmdDealJointPrice" value="${stats.supPriceMedi + stats.jointMediateDealpriceGood+TeaMmdDealJointPrice}"/><c:set var="TeaMdrDeal" value="${stats.directDeal+TeaMdrDeal}"/><c:set var="TeaMdsGood" value="${stats.dealSgood+TeaMdsGood}"/><c:set var="TeaMdrDealpriceG" value="${stats.directDealpriceGood+TeaMdrDealpriceG}"/><c:set var="TeaMdrDealJoint" value="${stats.jointDirect+TeaMdrDealJoint}"/><c:set var="TeaMdrDealJointPrice" value="${stats.supPriceDire + stats.jointDirectDealpriceGood+TeaMdrDealJointPrice}"/><c:set var="TeaMetGood" value="${stats.entrustGood+TeaMetGood}"/><c:set var="TeaMcrMoney" value="${stats.cusRealMoney+TeaMcrMoney}"/><c:set var="TeaMcrJointMoney" value="${stats.supPriceCusJointMine+stats.cusRealJointMine+TeaMcrJointMoney}"/><c:set var="TeaMfdGood" value="${stats.fundGood+TeaMfdGood}"/><c:set var="TeaMfdMoneyJoint" value="${stats.supPriceFund+stats.jointFundDealpriceGood+TeaMfdMoneyJoint}"/><c:set var="TeaMrsGood" value="${stats.reSaleGood+TeaMrsGood}"/><c:set var="TeaMrsMoneyJoint" value="${stats.supPriceResa+stats.jointResaleDealpriceGood+TeaMrsMoneyJoint}"/><c:set var="TeaMcrsMoney" value="${stats.cusReSaleMoney+TeaMcrsMoney}"/><c:set var="TeaMfnc" value="${stats.financing+TeaMfnc}"/><c:set var="TeaMfnS" value="${stats.financingSuccess+TeaMfnS}"/><c:set var="TeaMipt5" value="${stats.importance5+TeaMipt5}"/><c:set var="TeaMipt4" value="${stats.importance4+TeaMipt4}"/><c:set var="TeaMipt3" value="${stats.importance3+TeaMipt3}"/><c:set var="TeaMrcmd" value="${stats.recommend+TeaMrcmd}"/><c:set var="TeaMopnn" value="${stats.opinion+TeaMopnn}"/><c:set var="TeaMivt" value="${stats.invite+TeaMivt}"/><c:set var="TeaMrpt" value="${stats.report+TeaMrpt}"/><c:set var="TeaMpps" value="${stats.proposal+TeaMpps}"/><c:set var="TeaMann" value="${stats.anner+TeaMann}"/><c:set var="TeaMifPv" value="${stats.introducer+TeaMifPv}"/><c:set var="TeaMnwCst" value="${stats.networkCst+stats.networkCpn+TeaMnwCst}"/><c:set var="TeaMideaCnt" value="${TeaMideaCnt+stats.ideaCnt}"/><c:set var="TeaMideaScore" value="${TeaMideaScore+stats.ideaScore}"/><c:set var="TeaMideaRcmdCnt" value="${TeaMideaRcmdCnt+stats.ideaRcmdCnt}"/><c:set var="TeaMideaRcmdScore" value="${TeaMideaRcmdScore+stats.ideaRcmdScore}"/>
			<c:set var="sumTeam2" value="${stats.team}"/>
			<ul>
				<li class="cent"><nobr><b>${stats.staffNm}</b></nobr></li>
				<li class="cent insideP"><p class="mg0">목표</p><p class="mg0">결과</p></li>
			<!-- 딜 -->
				<li class="cent insideP"><!-- 중개 제안 -->
					<p class="mg0"><c:if test="${not empty stats.planMediateDeal and stats.planMediateDeal != 0}"><b>${stats.planMediateDeal} 딜</b></c:if></p>
					<p class="mg0"><c:if test="${stats.mediateDeal != 0}"><a class="offerCnt pd0" id="midiateDeal${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00001', this);"><font color="navy">${stats.mediateDeal} 딜</font></a></c:if></p>
				</li>
				<li class="cent insideP"><!-- 중개 단독성사 -->
					<p class="mg0"><c:if test="${not empty stats.planMediateDealSuccess and stats.planMediateDealSuccess != 0}"><b>${stats.planMediateDealSuccess} 딜</b></c:if></p>
					<p class="mg0"><c:if test="${stats.dealRgood != 0}"><a class="offerCnt pd0" id="dealRgood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00001', this, '00003', '', '', '', 'nonjoint');"><font color="navy">${stats.dealRgood} 딜</font></a></c:if></p>
				</li>
				<li class="cent insideP"><!-- 중개 단독규모 -->
					<p class="mg0"></p>
					<%-- <p class="mg0"><c:if test="${not empty stats.mediateDealprice and stats.mediateDealprice != 0}"><a class="offerCnt pd0" id="mediateDealprice${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00001', this, '','','','','101');"><font color="navy">${stats.mediateDealprice}억</font></a></c:if></p> --%>
					<p class="mg0"><c:if test="${!(MediateDealpriceGood == 0.0 or empty MediateDealpriceGood)}"><a class="offerCnt pd0" id="mediateDealpriceGood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00001', this, '00003','','','','101');"><font color="navy">${MediateDealpriceGood}억</font></a></c:if></p>
				</li>
				<li class="cent insideP"><!-- 중개 공동성사 --><c:if test="${stats.jointMediate != 0}"><a class="offerCnt pd0" id="jointMediate${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00001', this, '00003', '', '', '', 'joint');"><font color="navy">${stats.jointMediate} 딜</font></a></c:if></li>
				<li class="cent bgWt" style="line-height:22px;"><!-- 중개 공동규모 --><c:if test="${!(stats.supPriceMedi+stats.jointMediateDealpriceGood == 0 or empty stats.supPriceMedi)}"><a class="offerCnt pd0" id="mediateDealpriceGood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00001', this, '00003','','','','102');"><fmt:formatNumber var="intSumDeal" value="${stats.supPriceMedi + stats.jointMediateDealpriceGood}" pattern="0.0"/><font color="navy">${stats.supTotalPriceMedi + stats.jointTotalMediateDealpriceGood}억<br/>(${intSumDeal}억)</font></a></c:if></li>
				<li class="cent bgWt"><!-- 총규모 --><c:if test="${MediateDealpriceGood + stats.supPriceMedi + stats.jointMediateDealpriceGood != 0}"><fmt:formatNumber value="${MediateDealpriceGood + stats.supPriceMedi + stats.jointMediateDealpriceGood}" pattern="0.0"/>억</c:if></li>

				<li class="cent insideP"><!-- 직접발굴 제안 -->
					<p class="mg0"><c:if test="${not empty stats.planDirectDeal and stats.planDirectDeal != 0}"><b>${stats.planDirectDeal} 딜</b></c:if></p>
					<p class="mg0"><c:if test="${stats.directDeal != 0}"><a class="offerCnt pd0" id="directDeal${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00002', this);"><font color="navy">${stats.directDeal} 딜</font></a></c:if></p>
				</li>
				<li class="cent insideP"><!-- 직접발굴 단독성사 -->
					<p class="mg0"><c:if test="${not empty stats.planDirectDealSuccess and stats.planDirectDealSuccess != 0}"><b>${stats.planDirectDealSuccess} 딜</b></c:if></p>
					<p class="mg0"><c:if test="${stats.dealSgood != 0}"><a class="offerCnt pd0" id="dealSgood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00002', this, '00003', '', '', '', 'nonjoint');"><font color="navy">${stats.dealSgood} 딜</font></a></c:if></p>
				</li>
				<li class="cent insideP"><!-- 직접발굴 단독규모 -->
					<p class="mg0"></p>
					<%-- <p class="mg0"><c:if test="${not empty stats.directDealprice and stats.directDealprice != 0}"><a class="offerCnt pd0" id="directDealprice${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00002', this, '','','','','101');"><font color="navy">${stats.directDealprice}억</font></a></c:if></p> --%>
					<p class="mg0"><c:if test="${!(stats.directDealpriceGood == 0 or empty stats.directDealpriceGood)}"><a class="offerCnt pd0" id="directDealpriceGood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00002', this, '00003','','','','101');"><font color="navy">${stats.directDealpriceGood}억</font></a></c:if></p>
				</li>
				<li class="cent bgWt"><!-- 직접발굴 공동성사 --><c:if test="${stats.jointDirect != 0}"><a class="offerCnt pd0" id="jointDirect${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00002', this, '00003', '', '', '', 'joint');"><font color="navy">${stats.jointDirect} 딜</font></a></c:if></li>
				<li class="cent bgWt" style="line-height:22px;"><!-- 직접발굴 공동규모 --><c:if test="${!(stats.supPriceDire+stats.jointDirectDealpriceGood == 0 or empty stats.supPriceDire)}"><a class="offerCnt pd0" id="mediateDealpriceGood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00002', this, '00003','','','','102');"><fmt:formatNumber var="intSumDeal" value="${stats.supPriceDire + stats.jointDirectDealpriceGood}" pattern="0.0"/><font color="navy">${stats.supTotalPriceDire + stats.jointTotalDirectDealpriceGood}억<br/>(${intSumDeal}억)</font></a></c:if></li>
				<li class="cent bgWt"><!-- 총규모 --><c:if test="${stats.directDealpriceGood + stats.supPriceDire + stats.jointDirectDealpriceGood != 0}">${stats.directDealpriceGood + stats.supPriceDire + stats.jointDirectDealpriceGood}억</c:if></li>

			<!-- 자금 -->
				<%-- <li class="cent insideP">
					<p class="mg0"><c:if test="${not empty stats.planEntrust and stats.planEntrust != 0}"><nobr><b>${stats.planEntrust}억</b></nobr></c:if></p>
					<p class="mg0"><c:if test="${!(stats.entrust == 0 or empty stats.entrust)}"><a class="offerCnt pd0" id="entrust${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00011', this);"><nobr><font color="navy">${stats.entrust}억</font></nobr></a></c:if></p>
				</li> --%>
				<li class="cent insideP">
					<p class="mg0"><c:if test="${not empty stats.planEntrustSuccess and stats.planEntrustSuccess != 0}"><nobr><b>${stats.planEntrustSuccess}억</b></nobr></c:if></p>
					<p class="mg0"><c:if test="${stats.entrustGood != 0}"><a class="offerCnt pd0" id="entrustGood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00011', this, '00003', '', '', '');"><nobr><font color="navy">${stats.entrustGood}억</font></nobr></a></c:if></p>
				</li>
				<li class="cent bgWt"><!-- 일임 성사 --><c:if test="${!(empty stats.cusRealMoney or stats.cusRealMoney == 0)}"><fmt:formatNumber var="intSumDealNormal0" value="${stats.cusRealMoney}" pattern="0.0"/><font color="navy">${intSumDealNormal0}억</font></c:if></li>
				<li class="cent insideP"><!-- 일임 공동성사 --><c:if test="${(stats.cusRealJointMine + stats.supPriceCusJointMine) !=0  and (stats.cusRealJointMine + stats.supPriceCusJointMine) != 0}"><fmt:formatNumber var="intSumDealNormal1" value="${stats.cusRealJointMine + stats.supPriceCusJointMine}" pattern="0.0"/><font color="navy">${stats.cusRealJointTotal+stats.supPriceCusJoint}억<br/>(${intSumDealNormal1}억)</font></c:if></li>

				<li class="cent insideP"><!-- 펀드 단독성사 -->
					<p class="mg0"></p>
					<p class="mg0"><c:if test="${not empty stats.fundDealpriceGood and stats.fundDealpriceGood != 0}"><a class="offerCnt pd0" id="reSaleGood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00013', this, '00003','','','','nonjoint');"><fmt:formatNumber var="intSumDealNormal2" value="${stats.fundDealpriceGood}" pattern="0.0"/><nobr><font color="navy">${intSumDealNormal2}억</font></nobr></a></c:if></p>
				</li>
				<li class="cent bgWt" style="line-height:22px;"><!-- 펀드 공동성사 --><c:if test="${stats.supPriceFund+stats.jointFundDealpriceGood != 0}"><a class="offerCnt pd0" id="mediateDealpriceGood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00013', this, '00003','','','','joint');"><fmt:formatNumber var="intSumDeal00" value="${stats.supPriceFund + stats.jointFundDealpriceGood}" pattern="0.0"/><font color="navy">${stats.supTotalPriceFund + stats.jointTotalFundDealpriceGood}억<br/>(${intSumDeal00}억)</font></a></c:if></li>

				<%-- <li class="cent insideP">
					<p class="mg0"><c:if test="${not empty stats.planReSale and stats.planReSale != 0}"><nobr><b>${stats.planReSale}억</b></nobr></c:if></p>
					<p class="mg0"><c:if test="${!(empty stats.reSale)}"><a class="offerCnt pd0" id="reSale${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00012', this);"><nobr><font color="navy">${stats.reSale}억</font></nobr></a></c:if></p>
				</li> --%>
				<li class="cent insideP"><!-- 재매각 단독성사 -->
					<p class="mg0"><c:if test="${not empty stats.planReSaleSuccess and stats.planReSaleSuccess != 0}"><nobr><b>${stats.planReSaleSuccess}억</b></nobr></c:if></p>
					<p class="mg0"><c:if test="${not empty stats.reSaleGood and stats.reSaleGood != 0}"><a class="offerCnt pd0" id="reSaleGood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00012', this, '00003');"><nobr><font color="navy">${stats.reSaleGood}억</font></nobr></a></c:if></p>
				</li>
				<%-- <li class="cent bgWt"><!-- 재매각 고객시스템 성사 -->
					<c:if test="${!(empty stats.cusReSaleMoney or stats.cusReSaleMoney == 0)}"><font color="navy">${stats.cusReSaleMoney}억</font></c:if>
				</li> --%>
				<li class="cent insideP"><!-- 재매각 공동성사 --><c:if test="${stats.supPriceResa+stats.jointResaleDealpriceGood != 0}"><a class="offerCnt pd0" id="mediateDealpriceGood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00012', this, '00003','','','','joint');"><fmt:formatNumber var="intSumDeal01" value="${stats.supPriceResa + stats.jointResaleDealpriceGood}" pattern="0.0"/><font color="navy">${stats.supTotalPriceResa + stats.jointTotalResaleDealpriceGood}억<br/>(${intSumDeal01}억)</font></a></c:if></li>

				<li class="cent bgWt"><!-- 자금 총규모 --><fmt:formatNumber var="ttSum" value="${intSumDealNormal0 + intSumDealNormal1 + intSumDealNormal2 + intSumDeal00 + stats.reSaleGood + intSumDeal01}" pattern="0.0"/><c:if test="${ttSum > 0.0}">${ttSum}억</c:if></li>
			<!-- 정보 -->
				<li class="cent bgWt hoverTd"><!-- 추천 --><c:if test="${not empty stats.recommend and stats.recommend != 0}"><a class="offerCnt pd0" id="recommend${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00000', this, '', '00013');"><font color="navy">${stats.recommend}</font></a></c:if></li>
				<!-- <li class="cent bgWt hoverTd"></li> -->
				<li class="cent bgWt hoverTd"><!-- 추천종목의견 --><c:if test="${not empty stats.opinion and stats.opinion != 0}"><a class="offerCnt pd0" id="opinion${status.count}" onclick="statsOfferdivAjax('${stats.staffId}','', this, '', '','','','100');"><font color="navy">${stats.opinion}</font></a></c:if></li>
				<li class="cent bgWt hoverTd"><!-- 분석 --><c:if test="${not empty stats.anner and stats.anner != 0}"><a class="offerCnt pd0" id="anner${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00000', this, '', '00004');"><font color="navy">${stats.anner}</font></a></c:if></li>
				<li class="cent bgWt hoverTd"><!-- 탐방 --><c:if test="${not empty stats.invite and stats.invite != 0}"><a class="offerCnt pd0" id="invite${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00000', this, '', '00003');"><font color="navy">${stats.invite}</font></a></c:if></li>
				<li class="cent bgWt hoverTd"><!-- 리포트 --><c:if test="${not empty stats.report and stats.report != 0}"><a class="offerCnt pd0" id="report${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00000', this, '', '','', 'Y');"><font color="navy">${stats.report}</font></a></c:if></li>
				<li class="cent bgWt hoverTd"><!-- 제안서 --><c:if test="${not empty stats.proposal and stats.proposal != 0}"><a class="offerCnt pd0" id="report${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00000', this, '', '00005');"><font color="navy">${stats.proposal}</font></a></c:if></li>


				<li class="cent bgWt hoverTd"><!-- 정보등록 --><c:if test="${not empty stats.financing and stats.financing != 0}"><a class="offerCnt pd0" id="financing${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', this, '', '','','','0');"><font color="navy">${stats.financing}</font></a></c:if></li>
				<%-- <li class="cent bgWt hoverTd"><!-- 정보등록 성공 --><c:if test="${not empty stats.financingSuccess and stats.financingSuccess != 0}"><a class="offerCnt pd0" id="financingSuccess${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', this, '', '','','','1');"><font color="navy">${stats.financingSuccess}</font></a></c:if></li> --%>
				<li class="cent bgWt hoverTd" style="width:15px;"><!-- 정보등록 중요도 --><c:if test="${not empty stats.financingSuccess and stats.importance5 != 0}"><a class="offerCnt pd0" id="financingSuccess${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', this, '', '','','','5');"><font color="navy">${stats.importance5}</font></a></c:if></li>
				<li class="cent bgWt hoverTd" style="width:15px;"><!-- 정보등록 중요도 --><c:if test="${not empty stats.financingSuccess and stats.importance4 != 0}"><a class="offerCnt pd0" id="financingSuccess${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', this, '', '','','','4');"><font color="navy">${stats.importance4}</font></a></c:if></li>
				<li class="cent bgWt hoverTd" style="width:15px;"><!-- 정보등록 중요도 --><c:if test="${not empty stats.financingSuccess and stats.importance3 != 0}"><a class="offerCnt pd0" id="financingSuccess${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', this, '', '','','','3');"><font color="navy">${stats.importance3}</font></a></c:if></li>
				<li class="cent bgWt hoverTd"><!-- 네트워크 등록 --><c:if test="${(not empty stats.networkCst or not empty stats.networkCpn)and(stats.networkCst != 0 or stats.networkCpn != 0)}"><a class="offerCnt pd0" id="network${status.count}" onclick="statsNetworkAjax(this,'${stats.networkCst}','${stats.networkCpn}','${stats.staffId}');"><font color="navy">${stats.networkCst + stats.networkCpn}</font></a></c:if></li>
				<li class="cent bgWt hoverTd"><!-- 외부인 소개 --><c:if test="${not empty stats.introducer and stats.introducer != 0}"><a class="offerCnt pd0" id="infoProvider${status.count}" onclick="statsNetworkAjax(this,'introducer','','${stats.staffId}');""><font color="navy">${stats.introducer}</font></a></c:if></li>
				<li class="cent bgWt hoverTd"><!-- idea 건수 --><c:if test="${not empty stats.ideaCnt and stats.ideaCnt != 0}">${stats.ideaCnt}</c:if></li>
				<li class="cent bgWt hoverTd"><!-- idea 평점 --><c:if test="${not empty stats.ideaScore and stats.ideaScore != 0}">${stats.ideaScore}</c:if></li>
				<li class="cent bgWt hoverTd"><!-- idea 코멘트 건수 --><c:if test="${not empty stats.ideaRcmdCnt and stats.ideaRcmdCnt != 0}">${stats.ideaRcmdCnt}</c:if></li>
				<li class="cent bgWt hoverTd"><!-- idea 코멘트 평점 --><c:if test="${not empty stats.ideaRcmdScore and stats.ideaRcmdScore != 0}">${stats.ideaRcmdScore}</c:if></li>
				<%-- <li class="cent bgWt hoverTd"><!-- 공동진행 --><c:if test="${not empty stats.supporter and stats.supporter != 0}"><a class="offerCnt pd0" id="supporter${status.count}" onclick="statsOfferdivAjax('','', this, '', '', '', '', '','${stats.supporterCd}');"><font color="navy">${stats.supporter}</font></a></c:if></li> --%>
			</ul>
			<fmt:formatNumber var="intSumDealNormal0" value="0"/>
			<fmt:formatNumber var="intSumDealNormal1" value="0"/>
			<fmt:formatNumber var="intSumDealNormal2" value="0"/>
			<fmt:formatNumber var="intSumDeal00" value="0"/>
			<fmt:formatNumber var="intSumDeal01" value="0"/>
		</c:forEach>

			<ul>
				<li class="cent"><nobr><b>총 합계</b></nobr></li>
				<li class="cent insideP"><p class="mg0">목표</p><p class="mg0">결과</p></li>
			<!-- 딜 -->
				<li class="cent bgGrn hoverTd"><c:if test="${mdDeal != 0}"><nobr><b>${mdDeal} 딜</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd"><c:if test="${drGood != 0}"><nobr><b>${drGood} 딜</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd" title="${mdDealpriceG}억"><fmt:parseNumber var="intMdDealpriceG" integerOnly="true" value="${mdDealpriceG}"/><c:if test="${intMdDealpriceG != 0}"><nobr><b>${intMdDealpriceG}억</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd"><!-- 공동성사 --><c:if test="${mdDealJoint != 0}"><nobr><b>${mdDealJoint} 딜</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd"><!-- 공동규모 --><c:if test="${mdDealJointPrice != 0}"><nobr><b>${mdDealJointPrice}억</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd"><nobr><b>${intMdDealpriceG+mdDealJointPrice}억</b></nobr></li>

				<li class="cent bgGrn hoverTd"><!-- 직접발굴 제안 --><c:if test="${drDeal != 0}"><nobr><b>${drDeal} 딜</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd"><!-- 직접발굴 단독성사 --><c:if test="${dsGood != 0}"><nobr><b>${dsGood} 딜</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd"><!-- 직접발굴 단독규모 --><c:if test="${drDealpriceG != 0}"><nobr><b>${drDealpriceG}억</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd"><!-- 직접발굴 공동성사 --><c:if test="${drDealJoint != 0}"><nobr><b>${drDealJoint} 딜</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd"><!-- 직접발굴 공동규모 --><c:if test="${drDealJointPrice != 0}"><nobr><b>${drDealJointPrice}억</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd"><nobr><b>${drDealpriceG+drDealJointPrice}억</b></nobr></li>
			<!-- 자금 -->
				<li class="cent bgPich hoverTd"><c:if test="${etGood != 0}"><nobr><b>${etGood}억</b></nobr></c:if></li>
				<li class="cent bgPich hoverTd"><!-- 일임 성사 --><c:if test="${crMoney != 0}"><nobr><b>${crMoney}억</b></nobr></c:if></li>
				<li class="cent bgPich hoverTd"><!-- 일임 공동성사 --><c:if test="${crJointMoney != 0}"><nobr><b>${crJointMoney}억</b></nobr></c:if></li>

				<li class="cent bgPich hoverTd"><!-- 펀드 단독성사 --><c:if test="${fdGood != 0}"><nobr><b>${fdGood}억</b></nobr></c:if></li>
				<li class="cent bgPich hoverTd"><!-- 펀드 공동성사 --><c:if test="${fdMoneyJoint != 0}"><nobr><b>${fdMoneyJoint}억</b></nobr></c:if></li>

				<li class="cent bgPich hoverTd"><!-- 재매각 단독성사 --><c:if test="${rsGood != 0}"><nobr><b>${rsGood}억</b></nobr></nobr></c:if></li>
				<%-- <li class="cent bgPich hoverTd"><!-- 재매각 성사 --><b>${crsMoney}억</b></li> --%>
				<li class="cent bgPich hoverTd"><!-- 재매각 공동성사 --><c:if test="${rsMoneyJoint != 0}"><nobr><b>${rsMoneyJoint}억</b></nobr></nobr></c:if></li>
				<li class="cent bgPich hoverTd"><!-- 자금 총규모 --><nobr><b>${crMoney+crJointMoney+fdGood+fdMoneyJoint+rsGood+rsMoneyJoint}억</b></nobr></nobr></li>
			<!-- 정보 -->
				<li class="cent bgSky hoverTd"><!-- 추천 --><c:if test="${not empty rcmd and rcmd != 0}"><b>${rcmd}</b></c:if></li>
				<li class="cent bgSky hoverTd"><!-- 추천종목의견 --><c:if test="${not empty opnn and opnn != 0}"><b>${opnn}</b></c:if></li>
				<li class="cent bgSky hoverTd"><!-- 분석 --><c:if test="${not empty ann and ann != 0}"><b>${ann}</b></c:if></li>
				<li class="cent bgSky hoverTd"><!-- 탐방 --><c:if test="${not empty ivt and ivt != 0}"><b>${ivt}</b></c:if></li>
				<li class="cent bgSky hoverTd"><!-- 리포트 --><c:if test="${not empty rpt and rpt != 0}"><b>${rpt}</b></c:if></li>
				<li class="cent bgSky hoverTd"><!-- 제안서 --><c:if test="${not empty pps and pps != 0}"><b>${pps}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 정보등록 --><c:if test="${not empty fnc and fnc != 0}"><b>${fnc}</b></c:if></li>
				<li class="cent bgYlw hoverTd" style="width:15px;"><!-- 정보등록 중요도 --><c:if test="${not empty fnS and ipt5 != 0}"><b>${ipt5}</b></c:if></li>
				<li class="cent bgYlw hoverTd" style="width:15px;"><!-- 정보등록 중요도 --><c:if test="${not empty fnS and ipt4 != 0}"><b>${ipt4}</b></c:if></li>
				<li class="cent bgYlw hoverTd" style="width:15px;"><!-- 정보등록 중요도 --><c:if test="${not empty fnS and ipt3 != 0}"><b>${ipt3}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 네트워크 등록 --><c:if test="${(not empty nwCst)and(nwCst != 0 )}"><b>${nwCst}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- 외부인 소개 --><c:if test="${not empty ifPv and ifPv != 0}"><b>${ifPv}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- idea 건수 --><c:if test="${not empty idc and idc != 0}"><b>${idc}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- idea 평점 --><c:if test="${not empty ids and ids != 0}"><b>${ids}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- idea 코멘트 건수 --><c:if test="${not empty idrc and idrc != 0}"><b>${idrc}</b></c:if></li>
				<li class="cent bgYlw hoverTd"><!-- idea 코멘트 평점 --><c:if test="${not empty idrs and idrs != 0}"><b>${idrs}</b></c:if></li>
			</ul>
		</tbody><!-- </div> -->
	</div>
</div>
<div class="clear"></div>
</body>
</html>