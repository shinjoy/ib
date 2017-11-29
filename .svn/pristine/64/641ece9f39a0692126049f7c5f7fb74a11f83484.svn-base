<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PRIVATE STATS</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">

<style type="text/css">
/* 하단 직접>규모 2줄 표현위해 임시 class 명 추가 하고 강제 스타일링 */
.temp_class{
	line-height:24px!important;
	text-align:center!important;
}

.t_skinR0077 thead th, .t_skinR0077 tbody td {
    padding:0px 0px 0px 0px!important;
}

.count_style{
	width:54px!important;
}
.money_style{
	width:72px!important; text-align:right!important;
}
.count_style_brdr{
	width:53px!important;
}
.money_style_brdr{
	width:71px!important; text-align:right!important;
}


.t_skinR0077{
	table-layout:fixed!important;
	/* width:100%; */
	border-spacing: 0;
	border-bottom: 1px solid #EBEDF1 !important;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 0px;
	/* border-collapse: collapse; */
	/* border: 1px solid #75c5de; */
}

.t_skinR0077 thead th,.t_skinR0077 tbody td {
	padding: 5px;
	/* border: 1px solid #EBEDF1; */
	font-size: 12px;
}
.t_skinR0077 > thead  th{
	background-color: #2B9ABF;
	border-top: 1px solid #3DACCD;
	border-left: 1px solid #3DACCD;
	border-right: 1px solid #0D7AA6;
	border-bottom: 1px solid #0D7AA6;
	color: white;
}
.t_skinR0077 > thead > tr:first-child > th:first-child{
	/* border-left: 1px solid #DFE0E6; */
	border-left: 1px solid #3DACCD;
	border-top-left-radius: 10px;
}
.t_skinR0077 > thead > tr:first-child > th:last-child{
	/* border-right: 1px solid #DFE0E6; */
	border-left: 1px solid #3DACCD;
	/* border-top-right-radius: 10px; */
}
.t_skinR0077 > tbody > tr:hover {
	background-color: moccasin !important;
}
.t_skinR0077 > tbody > tr > td{
	border-right: 1px solid transparent;
	border-left: 1px solid #EBEDF1;
	border-bottom: 1px solid #EBEDF1;
	/* border-top: 1px solid #ffffff; */
}
.t_skinR0077 > tbody > tr > td:first-child{
	border-left: 1px solid #DFE0E6;
}
.t_skinR0077 > tbody > tr > td:last-child{
	border-right: 1px solid #DFE0E6;
}
.t_skinR0077 > tbody > tr:last-child > td:first-child{
	border-bottom-left-radius: 10px;
}
.t_skinR0077 > tbody > tr:last-child > td:last-child{
	border-bottom-right-radius: 10px;
}


.fixed-top00 {
	position:fixed;
	bottom:auto; 
	/* width:100%; */
	background-color:white;
}
</style>

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/stats.js'/>" ></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<script>
$(document).ready(function(){
	/* 
	$(".t_skin05 ul li:first-child").css("background-color", "#E0F8F7");
	$(".t_skin05 ul li p:even").css("background-color", "#E0F8F7");
	$(".t_skin05 ul li p:even").css("border-bottom", "1px solid #75C5DE");
	
	var tempX=0;
	var tempY=0;
	window.onscroll = function(){//alert($("#fixedTop").attr('class'));
		var scrollX = window.scrollX;	// || document.documentElement.scrollLeft;
		var scrollY = window.scrollY || document.documentElement.scrollTop;
		var w=window.innerWidth
		|| document.documentElement.clientWidth
		|| document.body.clientWidth;
		if(tempX != scrollX){
			
			$("#fixedTop").offset({'left': $('#nfixedRight').offset().left});
			
		}else if(tempY != scrollY){
			
			$(".fixed-left").css('top',$("#nfixedMain").css('padding-top').split('px')[0]-(scrollY-1));
		}
	    tempX = scrollX;
	    tempY = scrollY;
	};


	$("li").on({
		mouseover:function(){
			var lineul = $(this).parent('ul')
				,lineli = lineul.find('li, p')
				,staffNmli = $("#fixedLeft").find('ul:eq('+lineul.index()+')').find('li, p');
			staffNmli.addClass('bgLightOrange');
			lineli.addClass('bgLightOrange');
		},
		mouseout:function(){
			var lineul = $(this).parent('ul')
			,lineli = lineul.find('li, p')
			,staffNmli = $("#fixedLeft").find('ul:eq('+lineul.index()+')').find('li, p');
			staffNmli.removeClass('bgLightOrange');
			lineli.removeClass('bgLightOrange');
		}
	});
 */
});

function privateList(nm){
	$('#dayForm').append('<input type="hidden" name="tmpNum1" value="'+nm+'"/>');
	document.dayForm.action = "<c:url value='/stats/selectPrivateList.do' />";
	document.dayForm.submit();

}
function excel(){
	document.frm.action = "printExcel.do";
	//document.frm.excel_data.value = document.getElementById("nfixedMain").outerHTML;
	var str = '<table>'+$('#TiTle').html()+$('#nfixedRight').html().replace(/ul/gi,'tr').replace(/li/gi,'td')+'</table>';
	$('#excel_data').val(str);
	document.frm.submit();

	}
function disposalModal(nm,e){
	var url = "<c:url value='/reply/PopUpReplyDisposal.do'/>"
	, data = {choice_year:$("#choice_yearS").val()
			,tmpNum1:nm,tmpNum2:'stats'}
	, fn = function(arg){
		$('#offerDiv').html(arg);
		view('workPr',e);
	};
	ajaxModule(data,url,fn);
}

//중개건 세부 정보
function mediateInfo(nm, e, category){
	var url = "<c:url value='/stats/mediateInfo.do'/>"
	, data = {
			choice_year : $("#choice_yearS").val(),
			tmpNum1 : nm,
			tmpNum2 : 'stats',
			category : category
	}
	, fn = function(arg){
		$('#offerDiv').html(arg);
		view('workPr',e);
	};
	ajaxModule(data,url,fn);
}

function Go_InvestList(CusInviteSabun, CusStatus) {
	window.open('', 'InvestList', 'width=870, height=800');
	
	$('#CusInviteSabun').val(CusInviteSabun);
	$('#CusStatus').val(CusStatus);
	$('#SearchSDate').val('${choice_year}-01-01');
	$('#SearchEDate').val('${choice_year}-12-31');
 	$('#dayForm').attr('target', 'InvestList').attr('action', "http://106.250.177.91:8280/SynergyCus/InviteCusList.do").submit();
}


//퇴사자 보기
function showAll(){
	//퇴사자보기 토글	
	if('' == $('#showAll').val()){
		$('#showAll').val('Y');
	}else{
		$('#showAll').val('');
	}
	
	$('#dayForm').submit();
}
</script>

<style>.year {padding-left: 10px;}li>a,li>p>a{width:100%;height:100%;display:inline-block !important;}.bgLightOrange{background-color: #FFECCA/*#FFE4B5*/ !important;}</style>
</head>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<body>



<!-- ================================================= M&A 이외 부분 :S =================================================== -->

<div id="wrap" class="content_box" style="height:100%;float:left;">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

	<form name="frm" method="post"><input type="hidden" name="tmpNum1" id="excel_data" /></form>

	<!-- offer 목록 -->
	<div id="offerDiv"><div id="offerPr" style="display: none;"></div></div>
	<div id="offerDiv2"><div id="offerPr2" style="display: none;"></div></div>
	<div z-index="100">
		<div class="popUpMenu title_area offerL" id="${staff1_7 + 1}offerPr${offer1_7}">
			<p class="closePopUpMenu">ⅹ닫기</p>
			<c:forEach var="offer" items="${list}">
			<ul>
				<li class="c_title">${fn:substring(offer.tmDt,0,10)}&nbsp;:&nbsp;${offer.cstCpnNm}:${offer.cstNm}&nbsp;&nbsp;${offer.offerNm}<c:if test="${not empty offer.price && offer.price!='발행규모'}"><li>${offer.categoryNm}&nbsp;&nbsp;&nbsp;&nbsp;발행규모: ${offer.price}</li></c:if></li>
				
				<c:if test="${not empty offer.financing or not empty offer.management or not empty offer.mna or not empty offer.etc}">
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
				</li>
				</c:if>
				
				<li class="m_note">&nbsp;${fn:replace(offer.memo, lf,"<br/>")}</li>
			</ul>
			</c:forEach>
		</div>
	</div>

	<!-- offer 목록 -->
	<div class="year_wrap" style="position: fixed;z-index:1000;padding-top:15px;">
		<c:set var="now" value="<%= new java.util.Date() %>"/>
		<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
		<fmt:formatDate var="cur_month" value='${now}' pattern='MM'/>
		<input type="hidden" id="choice_month" name="choice_month" value="${workVO.choice_month}">
	
		<form id="dayForm" name="dayForm" action="<c:url value='/stats/index.do' />" method="post">
			<input type="hidden" name="CusInviteSabun" id="CusInviteSabun"/>
			<input type="hidden" name="CusStatus" id="CusStatus"/>
			<input type="hidden" name="SearchSDate" id="SearchSDate"/>
			<input type="hidden" name="SearchEDate" id="SearchEDate"/>
			<input type="hidden" name="EventFlag" id="EventFlag" value="IB"/>
			<input type="hidden" name="total" id="total">
			
			<input type="hidden" name="showAll" id="showAll" value="${showAll}" />	<!-- 퇴사자보기 -->
			
			<span class="year" style="display:none;">
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
			
		</form>
	</div>
	<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">


	<div id="fixedTop" class="fixed-top00" style="z-index:99;">
		<header>
			<div id="title0" class="cent" style="height:50px;display:inline-block;background-color:white;width:100%;">
				<h2 class="h_divTitle">
				 개인별 실적 현황
				</h2>
			</div>
		</header>


		<div>
			<table class="t_skinR0077" style="margin-left:10px;">
			<colgroup>
				<col width="93">
				<col width="58">
				<col class="count_style">
				<col class="money_style">
				
				<col class="count_style">
				<col class="money_style">
				<col class="money_style">
				<col class="money_style">
				
				<col class="count_style">
				<col class="money_style">
				<col class="money_style">
				
				<col class="">
				<col class="">
				
			</colgroup>
			<thead id="TiTle">
				<tr>
					<th colspan="2" rowspan="3" class="bgYlw pd0" style="height:70px;">구분</th>
					
				</tr>
				<tr>
					<th colspan="2" class="bgGrn pd0">소싱</th>
					
					<th colspan="4" class="bgGrn pd0">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						투자					<!-- <font style="color:gray;font-weight:normal;">(직접+중개)</font> -->
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						직접
						&nbsp;&nbsp;&nbsp; + &nbsp;&nbsp;
						중개<font color="#893BFF">①</font>
					</th>
					
					<th colspan="3" class="bgGrn pd0">중개<font color="#893BFF">②</font></th>
					<%-- <br/><font style="color:gray;font-weight:normal;">(매각인 : <c:if test="${not empty statsList}"><c:out value="${statsList[0].staffNm}"/></c:if>)</font> --%>
					
					<th rowspan="3" class="bgYlw pd0" style="height:70px;width:100px;">확인</th>
					<th rowspan="3" class="bgYlw pd0" style="height:70px;width:400px;border-top-right-radius: 10px;">의견</th>
				</tr>
				<tr>
					<th class="bgGrn pd0">건수<br/><font style="color:gray;font-weight:normal;">(딜)</font></th>
					<th class="bgGrn pd0">규모<br/><font style="color:gray;font-weight:normal;">(억)</font></th>
					
					<th class="bgGrn pd0">건수<br/><font style="color:gray;font-weight:normal;">(딜)</font></th>
					<th class="bgGrn pd0">규모<br/><font style="color:gray;font-weight:normal;">(억)</font></th>
					
					<th class="bgGrn pd0">규모<br/><font style="color:gray;font-weight:normal;">(억)</font></th>
					<th class="bgGrn pd0">규모<br/><font style="color:gray;font-weight:normal;">(억)</font></th>
					
					<th class="bgGrn pd0">성사<br/><font style="color:gray;font-weight:normal;">(딜)</font></th>
					<th class="bgGrn pd0">규모<br/><font style="color:gray;font-weight:normal;">(억)</font></th>
					<th class="bgGrn pd0">이익<br/><font style="color:gray;font-weight:normal;">(억)</font></th>
					
				</tr>
				
			</thead>
			</table>
		</div>
			
	</div>



<c:set var="mdDeal" value="0"/>
<c:set var="drGood" value="0"/>
<c:set var="mdDealprice" value="0"/>
<c:set var="drDealprice" value="0"/>
<c:set var="mdDealpriceG" value="0"/>
<c:set var="drDeal" value="0"/>
<c:set var="dsGood" value="0"/>
<c:set var="drDealpriceG" value="0"/>

<c:set var="ma" value="0"/>
<c:set var="maGood" value="0"/>
<c:set var="ip" value="0"/>
<c:set var="ipGood" value="0"/>
<c:set var="sp" value="0"/>
<c:set var="spGood" value="0"/>


	<div id="nfixedMain" class="t_skin05" style="height:100%;padding-top:122px;border-left:0;border-bottom:0;display:inline-block;">
		
		<div id="nfixedRight" style="padding-left:10px !important">
		
		<tbody class="bgOdd">
		
		<!-- 합계를 위한 변수 선언 20151211 :S -->
		<c:set var="achiTotalAmountTotal" value="0.0"/>
		<c:set var="achiDirectInvestTotal" value="0.0"/>
		<!-- 합계를 위한 변수 선언 20151211 :E -->
		
		
		<%-- ------------------------------------------------- 개인별 실적 :S ------------------------------------------------------ --%>
		
		
		<!-- 공동규모 소수점이하 3자리 넣어서 에러 발생-->
		<fmt:formatNumber var="MediateDealpriceGood" value="${stats.mediateDealpriceGood}" pattern="0.0"/>
		<!-- 공동규모 소수점이하 3자리 넣어서 에러 발생-->
		<fmt:parseNumber var="DisposalPrice" value="${stats.disposalPrice/1000}" type="number"/>
		<fmt:parseNumber var="DisposalMargin" value="${stats.disposalMargin/1000}" type="number"/>
		
		
		
		<c:set var="mdDeal" value="${stats.mediateDeal+mdDeal}"/>
		<c:set var="drGood" value="${stats.dealRgood+drGood}"/>
		<c:set var="mdDealprice" value="${stats.mediateDealprice+mdDealprice}"/>
		<c:set var="mdDealpriceG" value="${MediateDealpriceGood+mdDealpriceG}"/>
		<c:set var="mdDealJoint" value="${stats.jointMediate+mdDealJoint}"/>
		<c:set var="mdDealJointPrice" value="${stats.supPriceMedi + stats.jointMediateDealpriceGood+mdDealJointPrice}"/>
		<c:set var="drDeal" value="${stats.directDeal+drDeal}"/>
		<c:set var="dsGood" value="${stats.dealSgood+dsGood}"/>
		<c:set var="drDealprice" value="${stats.directDealprice+drDealprice}"/>
		<c:set var="drDealpriceG" value="${stats.directDealpriceGood+drDealpriceG}"/>
		<c:set var="drDealJointPrice" value="${stats.supPriceDire + stats.jointDirectDealpriceGood+drDealJointPrice}"/>
		<c:set var="ma" value="${stats.mna+ma}"/>
		<c:set var="maMc" value="${stats.mnaMcpn+maMc}"/>
		<c:set var="maGood" value="${stats.mnaGood+maGood}"/>
		<c:set var="ip" value="${stats.ipo+ip}"/>
		<c:set var="ipGood" value="${stats.ipoGood+ipGood}"/>
		<c:set var="sp" value="${stats.spac+sp}"/>
		<c:set var="spGood" value="${stats.spacGood+spGood}"/>
		
		
		
		<c:set var="rsMoneyJoint" value="${stats.supPriceResa+stats.jointResaleDealpriceGood+rsMoneyJoint}"/>
		
		<c:set var="fdMoneyJoint" value="${stats.supPriceFund+stats.jointFundDealpriceGood+fdMoneyJoint}"/>
		
		
		<c:set var="dsps" value="${dsps+stats.disposal}"/>
		<c:set var="dspsP" value="${(dspsP+stats.disposalPrice)}"/>
					
		<c:set var="dspsG" value="${(dspsG + (stats.disposalMargin-stats.disposalPrice))}"/>
		
		
		<!-- ■■■■■■■■■■■■ 기존 한줄 :S ■■■■■■■■■■■■ -->
		<ul>
		
			<li class="cent" style="width:91px;"><nobr><b>${stats.staffNm} (구)</b></nobr></li>
			<li class="cent insideP" style="width:57px;"><p class="mg0">단독</p><p class="mg0">공동</p></li>
			
		
			<!-- 소싱 > 건수 (중개+직접발굴) -->
			<li class="cent insideP count_style_brdr">
				<p class="mg0">
					<fmt:formatNumber var="intSumDealCnt" value="${stats.mediateDeal + stats.directDeal}" pattern="0.0"/>
					<c:if test="${intSumDealCnt * 1 gt 0}">
						<a class="offerCnt pd0" id="midiateDeal${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00001', event);"><font color="navy">${stats.mediateDeal + stats.directDeal}</font></a>
					</c:if>
				</p>
				<p class="mg0"></p>
			</li>
			
			<!-- 소싱 > 규모 (중개+직접발굴) -->
			<li class="cent insideP money_style_brdr">
				<p class="mg0">
					<fmt:formatNumber var="intSumIntDeal" value="${stats.mediateDealprice + stats.directDealprice}" pattern="0.0"/>
					<c:if test="${intSumIntDeal * 1 gt 0}">
						<a class="offerCnt pd0" id="mediateDealprice${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00001', event);"><font color="navy">${intSumIntDeal}</font>&nbsp;</a>
					</c:if>
				</p>
				<p class="mg0"></p>					
			</li>
			
			<!-- 투자 > 건수 -->						<%-- 투자 (건수, 금액) 추가 :S 20151211 --%>
			<li class="cent count_style_brdr" style="line-height:23px;"><!-- 투자: 중개+직접발굴 단독성사 -->					
				<c:if test="${stats.dealRgood != 0 or stats.dealSgood != 0 or stats.jointMediate != 0}">
					<a class="offerCnt pd0" id="dealRgood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00001', event, '00003', '', '', '', 'joint');">
					<c:if test="${stats.dealRgood != 0 or stats.dealSgood != 0}"><p class="mg0"><font color="navy">${stats.dealRgood + stats.dealSgood}(${stats.dealRgood}+${stats.dealSgood})</font></p></c:if>
					<c:if test="${stats.jointMediate != 0 }"><p class="mg0"><font color="navy"><small>공동진행&nbsp;${stats.jointMediate}</small></font></p></c:if>
					</a>
				</c:if>
			</li>
			
			<!-- 투자 > 규모 -->
			<li class="temp_class cent money_style_brdr">
				<c:if test="${stats.achiTotalAmount != 0.0}">
				<a class="offerCnt pd0" id="mediateDealpriceGood${status.count}" title="단독진행, 공동진행 합" onclick="statsOfferdivAjax('${stats.staffNm}','00001', event, '00003','','','','joint');">
					<nobr><font color="navy">${stats.achiTotalAmount}&nbsp;<br></font></nobr>
				</a>
				</c:if>
				
				<c:set var="achiTotalAmountTotal" value="${achiTotalAmountTotal + stats.achiTotalAmount}" />	<!-- 하단 총합계 위해 sum -->
			</li>
													<%-- 투자 (건수, 금액) 추가 :E 20151211 --%>
			<!-- 직접 > 규모 -->
			<li class="temp_class money_style_brdr"><!-- 직접투자: 중개 규모(공동진행 분할되서 출력) -->
				
				<!-- ====== 임시추가(구데이터) :S ====== -->
				<fmt:formatNumber var="intSumDeal" value="${stats.supPriceMedi + stats.jointMediateDealpriceGood}" pattern="0.0"/>
				<fmt:formatNumber var="intSumDeal2" value="${stats.supPriceDire + stats.jointDirectDealpriceGood}" pattern="0.0"/>
				<fmt:formatNumber var="intSumDealTotal" value="${MediateDealpriceGood + stats.directDealpriceGood + intSumDeal + intSumDeal2}" pattern="0.0"/>
				<!-- ====== 임시추가(구데이터) :E ====== -->
			
				<%-- <fmt:formatNumber var="mediatePricePart" value="${intSumDealTotal - stats.achiDirectInvest}" pattern="0.0"/> --%>
				<fmt:formatNumber var="mediatePricePart" value="${stats.achiTotalAmount - stats.achiDirectInvest}" pattern="0.0"/>
			
				<c:if test="${stats.achiDirectInvest != 0.0}">
				<a class="offerCnt pd0" id="mediateDealpriceGood${status.count}" title="중개제외, 직접투자 금액" onclick="statsOfferdivAjax('${stats.staffNm}','00001', event, '00003','','','','joint');">
					<font color="navy">${stats.achiDirectInvest}<%-- <br><span title="중개부분">(${mediatePricePart})</span> --%></font>&nbsp;	<%-- <span title="구데이터">(${intSumDealTotal})</span> --%>
				</a>
				</c:if>
				
				<c:set var="achiDirectInvestTotal" value="${achiDirectInvestTotal + stats.achiDirectInvest}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			<!-- 중개 1 > 규모 -->
			<li class="temp_class money_style_brdr"><!-- 중개분(투자 - 직접)... 투자대비 직접을 뺀 중개분(나의 실적이 아닐 수 있다) -->								
				<font color="navy">
					<c:if test="${mediatePricePart * 1 ne 0}"><span title="중개부분">${mediatePricePart}</span></c:if>
				</font>&nbsp;
			</li>
			
			<!-- 중개 > 성사 -->
			<li class="cent bgWt count_style_brdr" style="line-height:14px;"><!-- 중개(매각) 성사 -->
				<c:if test="${!(stats.disposalSupporter == 0 and stats.disposal == 0)}"><a class="pd0" onclick="disposalModal('${stats.staffNm}',event)" style="white-space:nowrap;">
				<c:if test="${stats.disposalSupporter != 0}"><font color="navy"><small>공동진행<br/>${stats.disposalSupporter}</small></font></c:if>
				<c:if test="${stats.disposal != 0}"><br/><font color="navy">${stats.disposal}</font></c:if>
				</a></c:if>
			</li>

			<!-- 중개 > 규모 -->
			<li class="cent bgWt money_style_brdr"><!-- 중개(매각) 규모 -->
				<fmt:formatNumber var="intDisposalPrice" value="${DisposalPrice}" pattern="0.0"/><%--20150714 --%>					
				<c:if test="${!(DisposalPrice == 0 or empty DisposalPrice)}">
					<a class="pd0" onclick="disposalModal('${stats.staffNm}',event)" style="white-space:nowrap;">
					<font color="navy">${intDisposalPrice}&nbsp;</font>
					</a>
				</c:if>
			</li>
			
			<!-- 중개 > 이익 -->
			<li class="cent bgWt money_style_brdr"><!-- 중개(매각) 이익(매각금액-규모) -->
				<fmt:formatNumber var="intDisposalMargin" value="${DisposalMargin}" pattern="0.0"/>
				<fmt:formatNumber var="intDisposalGain" value="${DisposalMargin - DisposalPrice}" pattern="0.0"/><%--20150714 --%>					
				<c:if test="${!(DisposalMargin == 0 or empty DisposalMargin)}">
					<a class="pd0" onclick="disposalModal('${stats.staffNm}',event)" style="white-space:nowrap;" title="매각금액(${intDisposalMargin})-규모(${intDisposalPrice})">
					<font color="navy">${intDisposalGain}&nbsp;</font>
					</a>
				</c:if>
			</li>


			<!-- 확인 -->
			<li class="cent bgWt" style="width:101px;">
				버튼
			</li>
			
			<!-- 의견 -->
			<li class="cent bgWt" style="width:401px;">
				의견
			</li>

		</ul>
		<!-- ■■■■■■■■■■■■ 기존 한줄 :E ■■■■■■■■■■■■ -->
		
		
		<!-- ■■■■■■■■■■■■ 상장 한줄 :S ■■■■■■■■■■■■ -->
		<ul>
		
			<li class="cent" style="width:91px;color:#2B9ABF;font-weight:normal;"><nobr>상장</nobr></li>
			<li class="cent insideP" style="width:57px;"><p class="mg0">단독</p><p class="mg0">공동</p></li>
			
		
			<!-- 소싱 > 건수 (중개+직접발굴) -->
			<li class="cent insideP count_style_brdr">
				<p class="mg0">
					<fmt:formatNumber var="listedDealCnt" value="${stats.listedDealCnt}" pattern="0.0"/>
					<c:if test="${listedDealCnt * 1 gt 0}">
						<a class="offerCnt pd0" id="listedDealCnt${status.count}" onclick="statsOfferInfo('${stats.staffNm}','listed', event);"><font color="navy">${stats.listedDealCnt}</font></a>
					</c:if>
				</p>
				<p class="mg0"></p>
				
				<c:set var="dealCntTotal" value="${dealCntTotal + listedDealCnt}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			<!-- 소싱 > 규모 (중개+직접발굴) -->
			<li class="cent insideP money_style_brdr">
				<p class="mg0">
					<fmt:formatNumber var="listedDealPrice" value="${stats.listedDealPrice}" pattern="0.0"/>
					<c:if test="${listedDealPrice * 1 gt 0}">
						<a class="offerCnt pd0" id="listedDealPrice${status.count}" onclick="statsOfferInfo('${stats.staffNm}','listed', event);"><font color="navy">${listedDealPrice}</font>&nbsp;</a>
					</c:if>
				</p>
				<p class="mg0"></p>
				
				<c:set var="dealPriceTotal" value="${dealPriceTotal + listedDealPrice}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			<!-- 투자 > 건수 -->
			<li class="cent count_style_brdr" style="line-height:23px;"><!-- 투자: 중개+직접발굴 단독성사 -->					
				<c:if test="${stats.listedInvestMyCnt*1 gt 0 or stats.listedInvestTogeCnt*1 gt 0}">
					<a class="offerCnt pd0" id="listedInvestCnt${status.count}" onclick="statsOfferInfo('${stats.staffNm}','listed', event, '00003');">
					<c:if test="${stats.listedInvestMyCnt*1 gt 0}"><font color="navy">${stats.listedInvestMyCnt}</font></c:if><c:if test="${stats.listedInvestTogeCnt*1 gt 0}"><br/><font color="navy">${stats.listedInvestTogeCnt}</font></c:if>
					</a>
				</c:if>
				
				<c:set var="investCntTotal" value="${investCntTotal + stats.listedInvestCnt}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			<!-- 투자 > 규모 -->
			<li class="temp_class cent money_style_brdr">
				<c:if test="${stats.listedInvestPrice != 0.0}">
				<a class="offerCnt pd0" id="mediateDealpriceGood${status.count}" title="단독진행, 공동진행 합" onclick="statsOfferInfo('${stats.staffNm}','listed', event, '00003');">
					<nobr><font color="navy">${stats.listedInvestPrice}&nbsp;<br></font></nobr>
				</a>
				</c:if>
				
				<c:set var="investPriceTotal" value="${investPriceTotal + stats.listedInvestPrice}" />	<!-- 하단 총합계 위해 sum -->
			</li>
													<%-- 투자 (건수, 금액) 추가 :E 20151211 --%>
			<!-- 직접 > 규모 -->
			<li class="temp_class money_style_brdr"><!-- 직접투자: 중개 규모(공동진행 분할되서 출력) -->
				
				<!-- ====== 임시추가(구데이터) :S ====== -->
				<fmt:formatNumber var="intSumDeal" value="${stats.supPriceMedi + stats.jointMediateDealpriceGood}" pattern="0.0"/>
				<fmt:formatNumber var="intSumDeal2" value="${stats.supPriceDire + stats.jointDirectDealpriceGood}" pattern="0.0"/>
				<fmt:formatNumber var="intSumDealTotal" value="${MediateDealpriceGood + stats.directDealpriceGood + intSumDeal + intSumDeal2}" pattern="0.0"/>
				<!-- ====== 임시추가(구데이터) :E ====== -->
			
				<fmt:formatNumber var="mediatePricePart" value="${stats.listedInvestPrice - stats.listedDirectPrice}" pattern="0.0"/>
			
				<c:if test="${stats.listedDirectPrice != 0.0}">
				<a class="offerCnt pd0" id="mediateDealpriceGood${status.count}" title="중개제외, 직접투자 금액" onclick="statsOfferInfo('${stats.staffNm}','listed', event, '00003', 'DIRECT');">
					<font color="navy">${stats.listedDirectPrice}<%-- <br><span title="중개부분">(${mediatePricePart})</span> --%></font>&nbsp;	<%-- <span title="구데이터">(${intSumDealTotal})</span> --%>
				</a>
				</c:if>
				
				<c:set var="directInvestTotal" value="${directInvestTotal + stats.listedDirectPrice}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			<!-- 중개① > 규모 -->
			<li class="temp_class money_style_brdr"><!-- 중개분(투자 - 직접)... 투자대비 직접을 뺀 중개분(나의 실적이 아닐 수 있다) -->								
				<c:if test="${mediatePricePart * 1 gt 0}">
				<a class="offerCnt pd0" onclick="statsOfferInfo('${stats.staffNm}','listed', event, '00003', 'MEDIATE');">
					<font color="navy">${mediatePricePart}</font>&nbsp;
				</a>
				</c:if>
				
				<c:set var="mediateInvestTotal" value="${mediateInvestTotal + mediatePricePart}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			
			<!-- 중개② > 성사 -->
			<li class="cent bgWt count_style_brdr" style="line-height:23px;"><!-- 중개(매각) 성사 -->
				<c:if test="${stats.listedDisposalSupporter gt 0 or stats.listedDisposal gt 0}">
					<a class="pd0" onclick="mediateInfo('${stats.staffNm}',event,'listed');" style="white-space:nowrap;">
					<c:if test="${stats.listedDisposal gt 0}"><font color="navy">${stats.listedDisposal}</font></c:if><c:if test="${stats.listedDisposalSupporter gt 0}"><br/><font color="navy">${stats.listedDisposalSupporter}</font></c:if>
					</a>
				</c:if>
			</li>

			<!-- 중개② > 규모 -->
			<li class="cent bgWt money_style_brdr" style="line-height:23px;"><!-- 중개(매각) 규모 -->
				<%-- <fmt:formatNumber var="listedDisposalPrice" value="${stats.listedDisposalPrice/1000}" pattern="0.0"/> --%>
				<c:if test="${stats.listedDisposalPrice * 1 gt 0 or stats.listedDisposalTogePrice * 1 gt 0}">
					<a class="pd0" onclick="mediateInfo('${stats.staffNm}',event,'listed');" style="white-space:nowrap;">
					<c:if test="${stats.listedDisposalPrice gt 0}"><font color="navy">${stats.listedDisposalPrice/1000}&nbsp;</font></c:if><c:if test="${stats.listedDisposalTogePrice gt 0}"><br/><font color="navy">${stats.listedDisposalTogePrice/1000}</font>&nbsp;</c:if>
					</a>
				</c:if>
			</li>
			
			<!-- 중개② > 이익 -->
			<li class="cent bgWt money_style_brdr" style="line-height:23px;"><!-- 중개(매각) 이익(매각금액-규모) -->
				<%-- <fmt:formatNumber var="intlistedDisposalMargin" value="${stats.listedDisposalMargin}" pattern="0.0"/>
				<fmt:formatNumber var="intDisposalGain" value="${DisposalMargin - DisposalPrice}" pattern="0.0"/> 	--%>
				<fmt:formatNumber var="listedDisposalGain" value="${(stats.listedDisposalMargin * 1 - stats.listedDisposalPrice * 1) / 1000}" />
				<fmt:formatNumber var="listedDisposalTogeGain" value="${(stats.listedDisposalTogeMargin * 1 - stats.listedDisposalTogePrice * 1) / 1000}" />
				<c:if test="${listedDisposalGain * 1 gt 0 or listedDisposalTogeGain * 1 gt 0}">
					<a class="pd0" onclick="mediateInfo('${stats.staffNm}',event,'listed');" style="white-space:nowrap;" title="매각금액(${stats.listedDisposalMargin/1000})-규모(${stats.listedDisposalPrice/1000})">
					<c:if test="${listedDisposalGain * 1 gt 0}"><font color="navy">${(stats.listedDisposalMargin * 1 - stats.listedDisposalPrice * 1) / 1000}&nbsp;</font></c:if><c:if test="${listedDisposalTogeGain * 1 gt 0}"><br/><font color="navy">${(stats.listedDisposalTogeMargin * 1 - stats.listedDisposalTogePrice * 1) / 1000}&nbsp;</font></c:if>
					</a>
				</c:if>
			</li>


			<!-- 확인 -->
			<li class="cent bgWt" style="width:101px;">
				버튼
			</li>
			
			<!-- 의견 -->
			<li class="cent bgWt" style="width:401px;">
				의견
			</li>
			
		</ul>
		<!-- ■■■■■■■■■■■■ 상장 한줄 :E ■■■■■■■■■■■■ -->
		
		
		<!-- ■■■■■■■■■■■■ 비상장 한줄 :S ■■■■■■■■■■■■ -->
		<ul>
		
			<li class="cent" style="width:91px;color:#2B9ABF;font-weight:normal;"><nobr>비상장</nobr></li>
			<li class="cent insideP" style="width:57px;"><p class="mg0">단독</p><p class="mg0">공동</p></li>
			
		
			<!-- 소싱 > 건수 (중개+직접발굴) -->
			<li class="cent insideP count_style_brdr">
				<p class="mg0">
					<fmt:formatNumber var="unlistedDealCnt" value="${stats.unlistedDealCnt}" pattern="0.0"/>
					<c:if test="${unlistedDealCnt * 1 gt 0}">
						<a class="offerCnt pd0" id="unlistedDealCnt${status.count}" onclick="statsOfferInfo('${stats.staffNm}','unlisted', event);"><font color="navy">${stats.unlistedDealCnt}</font></a>
					</c:if>
				</p>
				<p class="mg0"></p>
				
				<c:set var="dealCntTotal" value="${dealCntTotal + unlistedDealCnt}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			<!-- 소싱 > 규모 (중개+직접발굴) -->
			<li class="cent insideP money_style_brdr">
				<p class="mg0">
					<fmt:formatNumber var="unlistedDealPrice" value="${stats.unlistedDealPrice}" pattern="0.0"/>
					<c:if test="${unlistedDealPrice * 1 gt 0}">
						<a class="offerCnt pd0" id="unlistedDealPrice${status.count}" onclick="statsOfferInfo('${stats.staffNm}','unlisted', event);"><font color="navy">${unlistedDealPrice}</font>&nbsp;</a>
					</c:if>
				</p>
				<p class="mg0"></p>
				
				<c:set var="dealPriceTotal" value="${dealPriceTotal + unlistedDealPrice}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			<!-- 투자 > 건수 -->
			<li class="cent count_style_brdr" style="line-height:23px;"><!-- 투자: 중개+직접발굴 단독성사 -->					
				<c:if test="${stats.unlistedInvestMyCnt*1 gt 0 or stats.unlistedInvestTogeCnt*1 gt 0}">
					<a class="offerCnt pd0" id="unlistedInvestCnt${status.count}" onclick="statsOfferInfo('${stats.staffNm}','unlisted', event, '00003');">
					<c:if test="${stats.unlistedInvestMyCnt*1 gt 0}"><font color="navy">${stats.unlistedInvestMyCnt}</font></c:if><c:if test="${stats.unlistedInvestTogeCnt*1 gt 0}"><br/><font color="navy">${stats.unlistedInvestTogeCnt}</font></c:if>
					</a>
				</c:if>
				
				<c:set var="investCntTotal" value="${investCntTotal + stats.listedInvestCnt}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			<!-- 투자 > 규모 -->
			<li class="temp_class cent money_style_brdr">
				<c:if test="${stats.unlistedInvestPrice != 0.0}">
				<a class="offerCnt pd0" id="unlistedInvestPrice${status.count}" title="단독진행, 공동진행 합" onclick="statsOfferInfo('${stats.staffNm}','unlisted', event, '00003');">
					<nobr><font color="navy">${stats.unlistedInvestPrice}&nbsp;<br></font></nobr>
				</a>
				</c:if>
				
				<c:set var="investPriceTotal" value="${investPriceTotal + stats.unlistedInvestPrice}" />	<!-- 하단 총합계 위해 sum -->
			</li>
													<%-- 투자 (건수, 금액) 추가 :E 20151211 --%>
			<!-- 직접 > 규모 -->
			<li class="temp_class money_style_brdr"><!-- 직접투자: 중개 규모(공동진행 분할되서 출력) -->
				
				<!-- ====== 임시추가(구데이터) :S ====== -->
				<fmt:formatNumber var="intSumDeal" value="${stats.supPriceMedi + stats.jointMediateDealpriceGood}" pattern="0.0"/>
				<fmt:formatNumber var="intSumDeal2" value="${stats.supPriceDire + stats.jointDirectDealpriceGood}" pattern="0.0"/>
				<fmt:formatNumber var="intSumDealTotal" value="${MediateDealpriceGood + stats.directDealpriceGood + intSumDeal + intSumDeal2}" pattern="0.0"/>
				<!-- ====== 임시추가(구데이터) :E ====== -->
							
				<fmt:formatNumber var="mediatePricePart" value="${stats.unlistedInvestPrice - stats.unlistedDirectPrice}" pattern="0.0"/>
			
				<c:if test="${stats.unlistedDirectPrice * 1 gt 0}">
				<a class="offerCnt pd0" id="unlistedDirectPrice${status.count}" title="중개제외, 직접투자 금액" onclick="statsOfferInfo('${stats.staffNm}','unlisted', event, '00003', 'DIRECT');">
					<font color="navy">${stats.unlistedDirectPrice}<%-- <br><span title="중개부분">(${mediatePricePart})</span> --%></font>&nbsp;	<%-- <span title="구데이터">(${intSumDealTotal})</span> --%>
				</a>
				</c:if>
				
				<c:set var="directInvestTotal" value="${directInvestTotal + stats.unlistedDirectPrice}" />	<!-- 하단 총합계 위해 sum -->				
			</li>
			
			<!-- 중개① > 규모 -->
			<li class="temp_class money_style_brdr"><!-- 중개분(투자 - 직접)... 투자대비 직접을 뺀 중개분(나의 실적이 아닐 수 있다) -->
				<c:if test="${mediatePricePart * 1 ne 0}">
				<a class="offerCnt pd0" onclick="statsOfferInfo('${stats.staffNm}','unlisted', event, '00003', 'MEDIATE');">
					${mediatePricePart}&nbsp;
				</a>
				</c:if>
				
				<c:set var="mediateInvestTotal" value="${mediateInvestTotal + mediatePricePart}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			<!-- 중개② > 성사 -->
			<li class="cent bgWt count_style_brdr" style="line-height:23px;"><!-- 중개(매각) 성사 -->
				<c:if test="${stats.unlistedDisposalSupporter gt 0 or stats.unlistedDisposal gt 0}">
					<a class="pd0" onclick="mediateInfo('${stats.staffNm}',event,'unlisted');" style="white-space:nowrap;">
					<c:if test="${stats.unlistedDisposal gt 0}"><font color="navy">${stats.unlistedDisposal}</font></c:if><c:if test="${stats.unlistedDisposalSupporter gt 0}"><br/><font color="navy">${stats.unlistedDisposalSupporter}</font></c:if>
					</a>
				</c:if>
			</li>

			<!-- 중개② > 규모 -->
			<li class="cent bgWt money_style_brdr" style="line-height:23px;"><!-- 중개(매각) 규모 -->
				<%-- <fmt:formatNumber var="unlistedDisposalPrice" value="${stats.unlistedDisposalPrice/1000}" pattern="0.0"/> --%>
				<c:if test="${stats.unlistedDisposalPrice * 1 gt 0 or stats.unlistedDisposalTogePrice * 1 gt 0}">
					<a class="pd0" onclick="mediateInfo('${stats.staffNm}',event,'unlisted');" style="white-space:nowrap;">
					<c:if test="${stats.unlistedDisposalPrice gt 0}"><font color="navy">${stats.unlistedDisposalPrice/1000}&nbsp;</font></c:if><c:if test="${stats.unlistedDisposalTogePrice gt 0}"><br/><font color="navy">${stats.unlistedDisposalTogePrice/1000}</font>&nbsp;</c:if>
					</a>
				</c:if>
			</li>
			
			<!-- 중개② > 이익 -->
			<li class="cent bgWt money_style_brdr" style="line-height:23px;"><!-- 중개(매각) 이익(매각금액-규모) -->
				<%-- <fmt:formatNumber var="intunlistedDisposalMargin" value="${stats.unlistedDisposalMargin}" pattern="0.0"/>
				<fmt:formatNumber var="intDisposalGain" value="${DisposalMargin - DisposalPrice}" pattern="0.0"/> 	--%>
				<fmt:formatNumber var="unlistedDisposalGain" value="${(stats.unlistedDisposalMargin * 1 - stats.unlistedDisposalPrice * 1) / 1000}" />
				<fmt:formatNumber var="unlistedDisposalTogeGain" value="${(stats.unlistedDisposalTogeMargin * 1 - stats.unlistedDisposalTogePrice * 1) / 1000}" />
				<c:if test="${unlistedDisposalGain * 1 gt 0 or unlistedDisposalTogeGain * 1 gt 0}">
					<a class="pd0" onclick="mediateInfo('${stats.staffNm}',event,'unlisted');" style="white-space:nowrap;" title="매각금액(${stats.unlistedDisposalMargin/1000})-규모(${stats.unlistedDisposalPrice/1000})">
					<c:if test="${unlistedDisposalGain * 1 gt 0}"><font color="navy">${(stats.unlistedDisposalMargin * 1 - stats.unlistedDisposalPrice * 1) / 1000}&nbsp;</font></c:if><c:if test="${unlistedDisposalTogeGain * 1 gt 0}"><br/><font color="navy">${(stats.unlistedDisposalTogeMargin * 1 - stats.unlistedDisposalTogePrice * 1) / 1000}&nbsp;</font></c:if>
					</a>
				</c:if>
			</li>
			
			
			
			<!-- 확인 -->
			<li class="cent bgWt" style="width:101px;">
				버튼
			</li>
			
			<!-- 의견 -->
			<li class="cent bgWt" style="width:401px;">
				의견
			</li>

		</ul>
		<!-- ■■■■■■■■■■■■ 비상장 한줄 :E ■■■■■■■■■■■■ -->
		
		
		<!-- ■■■■■■■■■■■■ 프리IPO 한줄 :S ■■■■■■■■■■■■ -->
		<ul>
		
			<li class="cent" style="width:91px;color:#2B9ABF;font-weight:normal;"><nobr>프리IPO</nobr></li>
			<li class="cent insideP" style="width:57px;"><p class="mg0">단독</p><p class="mg0">공동</p></li>
			
		
			<!-- 소싱 > 건수 -->
			<li class="cent insideP count_style_brdr">
				<p class="mg0">
					<fmt:formatNumber var="ipo" value="${stats.ipo}" pattern="0"/>
					<c:if test="${ipo * 1 gt 0}">
						<a class="offerCnt pd0" id="ipo${status.count}" onclick="statsOfferInfo('${stats.staffNm}','preIpo', event);"><font color="navy">${ipo}</font></a>
					</c:if>
				</p>
				<p class="mg0"></p>
				
				<c:set var="dealCntTotal" value="${dealCntTotal + ipo}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			<!-- 소싱 > 규모 (중개+직접발굴) -->
			<li class="cent insideP money_style_brdr">
				<p class="mg0">
					<fmt:formatNumber var="ipoPrice" value="${stats.ipoPrice}" pattern="0.0"/>
					<c:if test="${ipoPrice * 1 gt 0}">
						<a class="offerCnt pd0" id="ipoPrice${status.count}" onclick="statsOfferInfo('${stats.staffNm}','preIpo', event);"><font color="navy">${ipoPrice}</font>&nbsp;</a>
					</c:if>
				</p>
				<p class="mg0"></p>
				
				<c:set var="dealPriceTotal" value="${dealPriceTotal + ipoPrice}" />	<!-- 하단 총합계 위해 sum -->
			</li>
						
			<!-- 투자 > 건수 -->
			<li class="cent count_style_brdr" style="line-height:23px;"><!-- 투자: 중개+직접발굴 단독성사 -->					
				<c:if test="${stats.ipoInvestMyCnt*1 gt 0 or stats.ipoInvestTogeCnt*1 gt 0}">
					<a class="offerCnt pd0" id="ipoInvestCnt${status.count}" onclick="statsOfferInfo('${stats.staffNm}','preIpo', event, '00003');">
					<c:if test="${stats.ipoInvestMyCnt*1 gt 0}"><font color="navy">${stats.ipoInvestMyCnt}</font></c:if><c:if test="${stats.ipoInvestTogeCnt*1 gt 0}"><br/><font color="navy">${stats.ipoInvestTogeCnt}</font></c:if>
					</a>
				</c:if>
				
				<c:set var="investCntTotal" value="${investCntTotal + stats.listedInvestCnt}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			<!-- 투자 > 규모 -->
			<li class="temp_class cent money_style_brdr">
				<c:if test="${stats.ipoInvestPrice * 1 gt 0}">
				<a class="offerCnt pd0" id="ipoInvestPrice${status.count}" title="단독진행, 공동진행 합" onclick="statsOfferInfo('${stats.staffNm}','preIpo', event, '00003');">
					<nobr><font color="navy">${stats.ipoInvestPrice}&nbsp;<br></font></nobr>
				</a>
				</c:if>
				
				<c:set var="investPriceTotal" value="${investPriceTotal + stats.ipoInvestPrice}" />	<!-- 하단 총합계 위해 sum -->
			</li>
													<%-- 투자 (건수, 금액) 추가 :E 20151211 --%>
			<!-- 직접 > 규모 -->
			<li class="temp_class money_style_brdr"><!-- 직접투자: 중개 규모(공동진행 분할되서 출력) -->
				
				<!-- ====== 임시추가(구데이터) :S ====== -->
				<fmt:formatNumber var="intSumDeal" value="${stats.supPriceMedi + stats.jointMediateDealpriceGood}" pattern="0.0"/>
				<fmt:formatNumber var="intSumDeal2" value="${stats.supPriceDire + stats.jointDirectDealpriceGood}" pattern="0.0"/>
				<fmt:formatNumber var="intSumDealTotal" value="${MediateDealpriceGood + stats.directDealpriceGood + intSumDeal + intSumDeal2}" pattern="0.0"/>
				<!-- ====== 임시추가(구데이터) :E ====== -->
							
				<fmt:formatNumber var="mediatePricePart" value="${stats.ipoInvestPrice - stats.ipoDirectPrice}" pattern="0.0"/>
			
				<c:if test="${stats.ipoDirectPrice * 1 gt 0}">
				<a class="offerCnt pd0" id="unlistedDirectPrice${status.count}" title="중개제외, 직접투자 금액" onclick="statsOfferInfo('${stats.staffNm}','preIpo', event, '00003', 'DIRECT');">
					<font color="navy">${stats.ipoDirectPrice}<%-- <br><span title="중개부분">(${mediatePricePart})</span> --%></font>&nbsp;	<%-- <span title="구데이터">(${intSumDealTotal})</span> --%>
				</a>
				</c:if>
				
				<c:set var="directInvestTotal" value="${directInvestTotal + stats.ipoDirectPrice}" />	<!-- 하단 총합계 위해 sum -->				
			</li>
			
			<!-- 중개① > 규모 -->
			<li class="temp_class money_style_brdr"><!-- 중개분(투자 - 직접)... 투자대비 직접을 뺀 중개분(나의 실적이 아닐 수 있다) -->								
				<c:if test="${mediatePricePart * 1 gt 0}">
				<a class="offerCnt pd0" onclick="statsOfferInfo('${stats.staffNm}','preIpo', event, '00003', 'MEDIATE');">
					${mediatePricePart}&nbsp;
				</a>
				</c:if>
				
				<c:set var="mediateInvestTotal" value="${mediateInvestTotal + mediatePricePart}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
						
			<!-- 중개② > 성사 -->
			<li class="cent bgWt count_style_brdr" style="line-height:23px;"><!-- 중개(매각) 성사 -->
				<c:if test="${stats.ipoDisposalSupporter gt 0 or stats.ipoDisposal gt 0}">
					<a class="pd0" onclick="mediateInfo('${stats.staffNm}',event,'preIpo');" style="white-space:nowrap;">
					<c:if test="${stats.ipoDisposal gt 0}"><font color="navy">${stats.ipoDisposal}</font></c:if><c:if test="${stats.ipoDisposalSupporter gt 0}"><br/><font color="navy">${stats.ipoDisposalSupporter}</font></c:if>
					</a>
				</c:if>
			</li>

			<!-- 중개② > 규모 -->
			<li class="cent bgWt money_style_brdr" style="line-height:23px;"><!-- 중개(매각) 규모 -->
				<%-- <fmt:formatNumber var="ipoDisposalPrice" value="${stats.ipoDisposalPrice/1000}" pattern="0.0"/> --%>
				<c:if test="${stats.ipoDisposalPrice * 1 gt 0 or stats.ipoDisposalTogePrice * 1 gt 0}">
					<a class="pd0" onclick="mediateInfo('${stats.staffNm}',event,'preIpo');" style="white-space:nowrap;">
					<c:if test="${stats.ipoDisposalPrice gt 0}"><font color="navy">${stats.ipoDisposalPrice/1000}&nbsp;</font></c:if><c:if test="${stats.ipoDisposalTogePrice gt 0}"><br/><font color="navy">${stats.ipoDisposalTogePrice/1000}</font>&nbsp;</c:if>
					</a>
				</c:if>
			</li>
			
			<!-- 중개② > 이익 -->
			<li class="cent bgWt money_style_brdr" style="line-height:23px;"><!-- 중개(매각) 이익(매각금액-규모) -->
				<%-- <fmt:formatNumber var="intunlistedDisposalMargin" value="${stats.unlistedDisposalMargin}" pattern="0.0"/>
				<fmt:formatNumber var="intDisposalGain" value="${DisposalMargin - DisposalPrice}" pattern="0.0"/> 	--%>
				<fmt:formatNumber var="ipoDisposalGain" value="${(stats.ipoDisposalMargin * 1 - stats.ipoDisposalPrice * 1) / 1000}" />
				<fmt:formatNumber var="ipoDisposalTogeGain" value="${(stats.ipoDisposalTogeMargin * 1 - stats.ipoDisposalTogePrice * 1) / 1000}" />
				<c:if test="${ipoDisposalGain * 1 gt 0 or ipoDisposalTogeGain * 1 gt 0}">
					<a class="pd0" onclick="mediateInfo('${stats.staffNm}',event,'preIpo');" style="white-space:nowrap;" title="매각금액(${stats.ipoDisposalMargin/1000})-규모(${stats.ipoDisposalPrice/1000})">
					<c:if test="${ipoDisposalGain * 1 gt 0}"><font color="navy">${(stats.ipoDisposalMargin * 1 - stats.ipoDisposalPrice * 1) / 1000}&nbsp;</font></c:if><c:if test="${ipoDisposalTogeGain * 1 gt 0}"><br/><font color="navy">${(stats.ipoDisposalTogeMargin * 1 - stats.ipoDisposalTogePrice * 1) / 1000}&nbsp;</font></c:if>
					</a>
				</c:if>
			</li>
			
			
			
			
			<!-- 확인 -->
			<li class="cent bgWt" style="width:101px;">
				버튼
			</li>
			
			<!-- 의견 -->
			<li class="cent bgWt" style="width:401px;">
				의견
			</li>
			
		</ul>
		<!-- ■■■■■■■■■■■■ 프리IPO 한줄 :E ■■■■■■■■■■■■ -->
		
		
		<!-- ■■■■■■■■■■■■ 블록딜 한줄 :S ■■■■■■■■■■■■ -->
		<ul>
		
			<li class="cent" style="width:91px;color:#2B9ABF;font-weight:normal;"><nobr>블록딜</nobr></li>
			<li class="cent insideP" style="width:57px;"><p class="mg0">단독</p><p class="mg0">공동</p></li>
			
		
			<!-- 소싱 > 건수 -->
			<li class="cent insideP count_style_brdr">
				<p class="mg0">
					<fmt:formatNumber var="block" value="${stats.block}" pattern="0"/>
					<c:if test="${block * 1 gt 0}">
						<a class="offerCnt pd0" id="ipo${status.count}" onclick="statsOfferInfo('${stats.staffNm}','block', event);"><font color="navy">${block}</font></a>
					</c:if>
				</p>
				<p class="mg0"></p>
				
				<c:set var="dealCntTotal" value="${dealCntTotal + block}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			<!-- 소싱 > 규모 (중개+직접발굴) -->
			<li class="cent insideP money_style_brdr">
				<p class="mg0">
					<fmt:formatNumber var="blockPrice" value="${stats.blockPrice}" pattern="0.0"/>
					<c:if test="${blockPrice * 1 gt 0}">
						<a class="offerCnt pd0" id="blockPrice${status.count}" onclick="statsOfferInfo('${stats.staffNm}','block', event);"><font color="navy">${blockPrice}</font>&nbsp;</a>
					</c:if>
				</p>
				<p class="mg0"></p>
				
				<c:set var="dealPriceTotal" value="${dealPriceTotal + blockPrice}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			<!-- 투자 > 건수 -->
			<li class="cent count_style_brdr" style="line-height:23px;"><!-- 투자: 중개+직접발굴 단독성사 -->					
				<c:if test="${stats.blockInvestMyCnt*1 gt 0 or stats.blockInvestTogeCnt*1 gt 0}">
					<a class="offerCnt pd0" id="blockInvestCnt${status.count}" onclick="statsOfferInfo('${stats.staffNm}','block', event, '00003');">
					<c:if test="${stats.blockInvestMyCnt*1 gt 0}"><font color="navy">${stats.blockInvestMyCnt}</font></c:if><c:if test="${stats.blockInvestTogeCnt*1 gt 0}"><br/><font color="navy">${stats.blockInvestTogeCnt}</font></c:if>
					</a>
				</c:if>
				
				<c:set var="investCntTotal" value="${investCntTotal + stats.listedInvestCnt}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			<!-- 투자 > 규모 -->
			<li class="temp_class cent money_style_brdr">
				<c:if test="${stats.blockInvestPrice != 0.0}">
				<a class="offerCnt pd0" id="blockInvestPrice${status.count}" title="단독진행, 공동진행 합" onclick="statsOfferInfo('${stats.staffNm}','block', event, '00003');">
					<nobr><font color="navy">${stats.blockInvestPrice}&nbsp;<br></font></nobr>
				</a>
				</c:if>
				
				<c:set var="investPriceTotal" value="${investPriceTotal + stats.blockInvestPrice}" />	<!-- 하단 총합계 위해 sum -->
			</li>
													<%-- 투자 (건수, 금액) 추가 :E 20151211 --%>
			<!-- 직접 > 규모 -->
			<li class="temp_class money_style_brdr"><!-- 직접투자: 중개 규모(공동진행 분할되서 출력) -->
				
				<!-- ====== 임시추가(구데이터) :S ====== -->
				<fmt:formatNumber var="intSumDeal" value="${stats.supPriceMedi + stats.jointMediateDealpriceGood}" pattern="0.0"/>
				<fmt:formatNumber var="intSumDeal2" value="${stats.supPriceDire + stats.jointDirectDealpriceGood}" pattern="0.0"/>
				<fmt:formatNumber var="intSumDealTotal" value="${MediateDealpriceGood + stats.directDealpriceGood + intSumDeal + intSumDeal2}" pattern="0.0"/>
				<!-- ====== 임시추가(구데이터) :E ====== -->
							
				<fmt:formatNumber var="mediatePricePart" value="${stats.blockInvestPrice - stats.blockDirectPrice}" pattern="0.0"/>
			
				<c:if test="${stats.blockDirectPrice != 0.0}">
				<a class="offerCnt pd0" id="blockDirectPrice${status.count}" title="중개제외, 직접투자 금액" onclick="statsOfferInfo('${stats.staffNm}','block', event, '00003', 'DIRECT');">
					<font color="navy">${stats.blockDirectPrice}<%-- <br><span title="중개부분">(${mediatePricePart})</span> --%></font>&nbsp;	<%-- <span title="구데이터">(${intSumDealTotal})</span> --%>
				</a>
				</c:if>
				
				<c:set var="directInvestTotal" value="${directInvestTotal + stats.blockDirectPrice}" />	<!-- 하단 총합계 위해 sum -->				
			</li>
			
			<!-- 중개① > 규모 -->
			<li class="temp_class money_style_brdr"><!-- 중개분(투자 - 직접)... 투자대비 직접을 뺀 중개분(나의 실적이 아닐 수 있다) -->								
				<c:if test="${mediatePricePart * 1 gt 0}">
				<a class="offerCnt pd0" onclick="statsOfferInfo('${stats.staffNm}','block', event, '00003', 'MEDIATE');">
					${mediatePricePart}&nbsp;
				</a>
				</c:if>
				
				
				<c:set var="mediateInvestTotal" value="${mediateInvestTotal + mediatePricePart}" />	<!-- 하단 총합계 위해 sum -->
			</li>
			
			
			<!-- 중개② > 성사 -->
			<li class="cent bgWt count_style_brdr" style="line-height:23px;"><!-- 중개(매각) 성사 -->
				<c:if test="${stats.blockDisposalSupporter gt 0 or stats.blockDisposal gt 0}">
					<a class="pd0" onclick="mediateInfo('${stats.staffNm}',event,'block');" style="white-space:nowrap;">
					<c:if test="${stats.blockDisposal gt 0}"><font color="navy">${stats.blockDisposal}</font></c:if><c:if test="${stats.blockDisposalSupporter gt 0}"><br/><font color="navy">${stats.blockDisposalSupporter}</font></c:if>
					</a>
				</c:if>
			</li>

			<!-- 중개② > 규모 -->
			<li class="cent bgWt money_style_brdr" style="line-height:23px;"><!-- 중개(매각) 규모 -->
				<%-- <fmt:formatNumber var="blockDisposalPrice" value="${stats.blockDisposalPrice/1000}" pattern="0.0"/> --%>
				<c:if test="${stats.blockDisposalPrice * 1 gt 0 or stats.blockDisposalTogePrice * 1 gt 0}">
					<a class="pd0" onclick="mediateInfo('${stats.staffNm}',event,'block');" style="white-space:nowrap;">
					<c:if test="${stats.blockDisposalPrice gt 0}"><font color="navy">${stats.blockDisposalPrice/1000}&nbsp;</font></c:if><c:if test="${stats.blockDisposalTogePrice gt 0}"><br/><font color="navy">${stats.blockDisposalTogePrice/1000}</font>&nbsp;</c:if>
					</a>
				</c:if>
			</li>
			
			<!-- 중개② > 이익 -->
			<li class="cent bgWt money_style_brdr" style="line-height:23px;"><!-- 중개(매각) 이익(매각금액-규모) -->
				<%-- <fmt:formatNumber var="intunlistedDisposalMargin" value="${stats.unlistedDisposalMargin}" pattern="0.0"/>
				<fmt:formatNumber var="intDisposalGain" value="${DisposalMargin - DisposalPrice}" pattern="0.0"/> 	--%>
				<fmt:formatNumber var="blockDisposalGain" value="${(stats.blockDisposalMargin * 1 - stats.blockDisposalPrice * 1) / 1000}" />
				<fmt:formatNumber var="blockDisposalTogeGain" value="${(stats.blockDisposalTogeMargin * 1 - stats.blockDisposalTogePrice * 1) / 1000}" />
				<c:if test="${blockDisposalGain * 1 gt 0 or blockDisposalTogeGain * 1 gt 0}">
					<a class="pd0" onclick="mediateInfo('${stats.staffNm}',event,'block');" style="white-space:nowrap;" title="매각금액(${stats.blockDisposalMargin/1000})-규모(${stats.blockDisposalPrice/1000})">
					<c:if test="${blockDisposalGain * 1 gt 0}"><font color="navy">${(stats.blockDisposalMargin * 1 - stats.blockDisposalPrice * 1) / 1000}&nbsp;</font></c:if><c:if test="${blockDisposalTogeGain * 1 gt 0}"><br/><font color="navy">${(stats.blockDisposalTogeMargin * 1 - stats.blockDisposalTogePrice * 1) / 1000}&nbsp;</font></c:if>
					</a>
				</c:if>
			</li>
			
			
			<!-- 확인 -->
			<li class="cent bgWt" style="width:101px;">
				버튼
			</li>
			
			<!-- 의견 -->
			<li class="cent bgWt" style="width:401px;">
				의견
			</li>
			
		</ul>
		<!-- ■■■■■■■■■■■■ 블록딜 한줄 :E ■■■■■■■■■■■■ -->
		
		
		
		<fmt:formatNumber var="intSumDealNormal0" value="0"/>
		<fmt:formatNumber var="intSumDealNormal00" value="0"/>
		<fmt:formatNumber var="intSumDealNormal1" value="0"/>
		<fmt:formatNumber var="intSumDealNormal2" value="0"/>
		<fmt:formatNumber var="intSumDeal00" value="0"/>
		<fmt:formatNumber var="intSumDeal01" value="0"/>
		
		<%-- ------------------------------------------------- 개인별 실적 :E ------------------------------------------------------ --%>


		<%-- ------------------------------------------------- 합계 :S ------------------------------------------------------------ --%>
		<ul>
			<li class="cent" style="width:149px!important;"><nobr><b>합계</b></nobr></li>
		
			<%-- 소싱 건수 --%>
			<li class="cent bgGrn hoverTd count_style_brdr">
				<c:if test="${dealCntTotal * 1 gt 0}">
				<fmt:formatNumber var="dealCntTotal" value="${dealCntTotal}" pattern="0"/>
				<nobr><b>${dealCntTotal}</b></nobr>
				</c:if>
			</li>
			<%-- 소싱 규모 --%>
			<li class="cent bgGrn hoverTd money_style_brdr">
				<c:if test="${dealPriceTotal * 1 gt 0}">				
				<nobr><b>${dealPriceTotal}&nbsp;</b></nobr>
				</c:if>
			</li>
			
			<%-- 투자 건수 --%>
			<li class="cent bgGrn hoverTd count_style_brdr">
				<c:if test="${investCntTotal * 1 gt 0}">
				<nobr><b>${investCntTotal}</b></nobr>
				</c:if>
			</li>
			<%-- 투자 규모 --%>
			<li class="cent bgGrn hoverTd money_style_brdr">
				<c:if test="${investPriceTotal * 1 gt 0}">
				<nobr><b>${investPriceTotal}&nbsp;</b></nobr>
				</c:if>
			</li>
			
			<%-- 임시 구 데이터 출력위해 :S --%>
			<fmt:parseNumber var="intMdDealpriceG" integerOnly="true" value="${mdDealpriceG}"/>
			<fmt:formatNumber var="intDrDealJointPrice" value="${drDealJointPrice}" pattern="0.0"/>
			<fmt:formatNumber var="intMdDealJointPrice" value="${mdDealJointPrice}" pattern="0.0"/>
			<fmt:formatNumber var="intMdDealJointPriceTotal" value="${intMdDealpriceG + intDrDealJointPrice + intMdDealJointPrice + drDealpriceG}" pattern="0.0"/>	<!--20150714 -->
			<%-- 임시 구 데이터 출력위해 :E --%>
			
			<%-- 직접 규모 --%>
			<li class="cent bgGrn hoverTd money_style_brdr">
				<c:if test="${directInvestTotal gt 0}">
				<b>${directInvestTotal}&nbsp;</b><%--<br>(${intMdDealJointPriceTotal})&nbsp; --%>
				</c:if>
			</li>
			
			<%-- 중개 규모 --%>			
			<li class="cent bgGrn hoverTd money_style_brdr">
				<c:if test="${mediateInvestTotal gt 0}">
				<fmt:formatNumber var="mediateInvestTotal" value="${mediateInvestTotal}" pattern="0.0"/>
					<b>${mediateInvestTotal}&nbsp;</b><%--<br>(${intMdDealJointPriceTotal})&nbsp; --%>
				</c:if>
			</li>
			
			<!-- 중개 > 성사 -->
			<li class="cent bgGrn hoverTd count_style_brdr"><c:if test="${dsps != 0}"><nobr><b>${dsps}</b></nobr></c:if></li>
			<!-- 중개 > 규모 -->
			<li class="cent bgGrn hoverTd money_style_brdr">
				<fmt:formatNumber var="intMdDealPriceT" value="${dspsP/1000}" pattern="0.0"/>
				<c:if test="${dspsP != 0}"><nobr><b>${intMdDealPriceT}&nbsp;</b></nobr></c:if>
			</li>
			<!-- 중개 > 이익 -->
			<li class="cent bgGrn hoverTd money_style_brdr">
				<fmt:formatNumber var="intMdDealGainT" value="${dspsG/1000}" pattern="0.0"/>
				<c:if test="${dspsG != 0}"><nobr><b>${intMdDealGainT}&nbsp;</b></nobr></c:if>
			</li>
			
			<!-- 확인 -->
			<li class="cent bgGrn" style="width:503px;">
				&nbsp;
			</li>
		</ul>
		<%-- ------------------------------------------------- 합계 :E ------------------------------------------------------------ --%>
		
		</tbody>
		
		</div>
	</div>

</div>

<!-- ================================================= M&A 이외 부분 :E =================================================== -->

<div class="clear"></div>

<div style="float:left;padding-left:10px;">
	<div><font color="#893BFF">①</font> : 투자 에서 직접투자분을 뺀 부분으로,
		매각인은 <b><c:out value="${stats.staffNm}"/></b> 님이 아닐 수 있음
	</div>
	<div><font color="#893BFF">②</font> : 매각인이 <b><c:out value="${stats.staffNm}"/></b> 님인 건들</div>
</div>


<%-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
<div class="clear"></div>


<!-- ================================================= M&A 부분 :S ======================================================= -->

<div id="wrap2" class="content_box" style="height:100%;float:left;">

	<div id="fixedTop" class="fixed-top00" style="z-index:99;">
		<header>
			<div id="title0" class="cent" style="height:20px;display:inline-block;background-color:white;width:100%;padding-left:10px;">
				<h2 class="h_divTitle">
				 <!-- 개인별 실적 현황 -->
				</h2>
			</div>
		</header>
	
		
		<div>
			<table class="t_skinR0077" style="margin-left:10px;">
			<colgroup>
				<col width="93">
				
				<col class="count_style">
				<col class="count_style">
				<col class="count_style">
				
				<col class="">
				<col class="">
							
			</colgroup>
			<thead id="TiTle">
				<tr>				
					<th rowspan="3" class="bgYlw pd0" style="height:70px;">구분</th>
				</tr>
				<tr>					
					<th colspan="3" class="bgGrn pd0">M&A</th>
					
					<th rowspan="3" class="bgYlw pd0" style="height:70px;width:100px;">확인</th>
					<th rowspan="3" class="bgYlw pd0" style="height:70px;width:400px;border-top-right-radius: 10px;">의견</th>
				</tr>
				<tr>
					
					<th class="bgGrn pd0">딜소싱<br/><font style="color:gray;font-weight:normal;">(딜)</font></th>
					<th class="bgGrn pd0">연결<br/><font style="color:gray;font-weight:normal;">(회사)</font></th>
					<th class="bgGrn pd0">성사<br/><font style="color:gray;font-weight:normal;">(딜)</font></th>
					
				</tr>
				
			</thead>
			</table>
		</div>
			
	</div>



<c:set var="mdDeal" value="0"/>
<c:set var="drGood" value="0"/>
<c:set var="mdDealprice" value="0"/>
<c:set var="drDealprice" value="0"/>
<c:set var="mdDealpriceG" value="0"/>
<c:set var="drDeal" value="0"/>
<c:set var="dsGood" value="0"/>
<c:set var="drDealpriceG" value="0"/>

<c:set var="ma" value="0"/>
<c:set var="maGood" value="0"/>
<c:set var="ip" value="0"/>
<c:set var="ipGood" value="0"/>
<c:set var="sp" value="0"/>
<c:set var="spGood" value="0"/>


	<div id="nfixedMain" class="t_skin05" style="height:100%;padding-top:95px;border-left:0;border-bottom:0;display:inline-block;">
		
		<div id="nfixedRight" style="padding-left:10px !important">
		
		<tbody class="bgOdd">
		
		<!-- 합계를 위한 변수 선언 20151211 :S -->
		<c:set var="achiTotalAmountTotal" value="0.0"/>
		<c:set var="achiDirectInvestTotal" value="0.0"/>
		<!-- 합계를 위한 변수 선언 20151211 :E -->
		
		
		<%-- ------------------------------------------------- 개인별 실적 :S ------------------------------------------------------ --%>
		
		
		<!-- 공동규모 소수점이하 3자리 넣어서 에러 발생-->
		<fmt:formatNumber var="MediateDealpriceGood" value="${stats.mediateDealpriceGood}" pattern="0.0"/>
		<!-- 공동규모 소수점이하 3자리 넣어서 에러 발생-->
		<fmt:parseNumber var="DisposalPrice" value="${stats.disposalPrice/1000}" type="number"/>
		<fmt:parseNumber var="DisposalMargin" value="${stats.disposalMargin/1000}" type="number"/>
		
		
		
		<c:set var="mdDeal" value="${stats.mediateDeal+mdDeal}"/>
		<c:set var="drGood" value="${stats.dealRgood+drGood}"/>
		<c:set var="mdDealprice" value="${stats.mediateDealprice+mdDealprice}"/>
		<c:set var="mdDealpriceG" value="${MediateDealpriceGood+mdDealpriceG}"/>
		<c:set var="mdDealJoint" value="${stats.jointMediate+mdDealJoint}"/>
		<c:set var="mdDealJointPrice" value="${stats.supPriceMedi + stats.jointMediateDealpriceGood+mdDealJointPrice}"/>
		<c:set var="drDeal" value="${stats.directDeal+drDeal}"/>
		<c:set var="dsGood" value="${stats.dealSgood+dsGood}"/>
		<c:set var="drDealprice" value="${stats.directDealprice+drDealprice}"/>
		<c:set var="drDealpriceG" value="${stats.directDealpriceGood+drDealpriceG}"/>
		<c:set var="drDealJointPrice" value="${stats.supPriceDire + stats.jointDirectDealpriceGood+drDealJointPrice}"/>
		<c:set var="ma" value="${stats.mna+ma}"/>
		<c:set var="maMc" value="${stats.mnaMcpn+maMc}"/>
		<c:set var="maGood" value="${stats.mnaGood+maGood}"/>
		<c:set var="ip" value="${stats.ipo+ip}"/>
		<c:set var="ipGood" value="${stats.ipoGood+ipGood}"/>
		<c:set var="sp" value="${stats.spac+sp}"/>
		<c:set var="spGood" value="${stats.spacGood+spGood}"/>
		
		
		
		<c:set var="rsMoneyJoint" value="${stats.supPriceResa+stats.jointResaleDealpriceGood+rsMoneyJoint}"/>
		
		<c:set var="fdMoneyJoint" value="${stats.supPriceFund+stats.jointFundDealpriceGood+fdMoneyJoint}"/>
		
		
		<c:set var="dsps" value="${dsps+stats.disposal}"/>
		<c:set var="dspsP" value="${(dspsP+stats.disposalPrice)}"/>
					
		<c:set var="dspsG" value="${(dspsG + (stats.disposalMargin-stats.disposalPrice))}"/>
		
		
		<!-- ■■■■■■■■■■■■ 기존 한줄 :S ■■■■■■■■■■■■ -->
		<ul>
			
			<li class="cent" style="width:91px;color:#2B9ABF;font-weight:normal;"><nobr>M&A</nobr></li>
		
			<li class="cent bgWt count_style_brdr"><!-- mna > 딜소싱 -->
				<c:if test="${stats.mna != 0}">
					<a class="offerCnt pd0" id="mna${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', event, '', '', '', '', 'mna');"><font color="navy">${stats.mna}</font></a>
				</c:if>
			</li>			
			<li class="cent bgWt count_style_brdr"><!-- mna > 연결 -->
				<c:if test="${stats.mnaMcpn != 0}"><font color="navy">${stats.mnaMcpn}</font></c:if>
			</li>
			<li class="cent bgWt count_style_brdr"><!-- mna > 성사 -->
				<c:if test="${stats.mnaGood != 0}">
					<a class="offerCnt pd0" id="mnaG${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', event, '00006', '', '', '', 'mna');"><font color="navy">${stats.mnaGood}</font></a>
				</c:if>
			</li>
			
			
			<!-- 확인 -->
			<li class="cent bgWt" style="width:101px;">
				버튼
			</li>
			
			<!-- 의견 -->
			<li class="cent bgWt" style="width:401px;">
				의견
			</li>
			
		</ul>
		<!-- ■■■■■■■■■■■■ 기존 한줄 :E ■■■■■■■■■■■■ -->
		
		
		
		<fmt:formatNumber var="intSumDealNormal0" value="0"/>
		<fmt:formatNumber var="intSumDealNormal00" value="0"/>
		<fmt:formatNumber var="intSumDealNormal1" value="0"/>
		<fmt:formatNumber var="intSumDealNormal2" value="0"/>
		<fmt:formatNumber var="intSumDeal00" value="0"/>
		<fmt:formatNumber var="intSumDeal01" value="0"/>
		
		<%-- ------------------------------------------------- 개인별 실적 :E ------------------------------------------------------ --%>


		<%-- ------------------------------------------------- 합계 :S ------------------------------------------------------------ --%>
		<ul>
			<li class="cent" style="width:91px!important;"><nobr><b>합계</b></nobr></li>
					
			<li class="cent bgGrn hoverTd count_style_brdr"><!-- mna 딜소싱 --><c:if test="${ma != 0}"><nobr><b>${ma}</b></nobr></c:if></li>
			<li class="cent bgGrn hoverTd count_style_brdr"><!-- mna 연결 --><c:if test="${maMc != 0}"><nobr><b>${maMc}</b></nobr></c:if></li>
			<li class="cent bgGrn hoverTd count_style_brdr"><!-- mna 성사 --><c:if test="${maGood != 0}"><nobr><b>${maGood}</b></nobr></c:if></li>
			
			<!-- 확인 -->
			<li class="cent bgGrn" style="width:503px;">
				&nbsp;
			</li>
		</ul>
		<%-- ------------------------------------------------- 합계 :E ------------------------------------------------------------ --%>
		
		</tbody>
		
		</div>
	</div>

</div>

<!-- ================================================= M&A 부분 :E ======================================================= -->

<div class="clear"></div>


</body>
</html>