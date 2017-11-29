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
<title>Main</title>
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
	width:40px!important;
}
.money_style{
	width:55px!important; text-align:right!important;
}
.count_style_brdr{
	width:39px!important;
}
.money_style_brdr{
	width:54px!important; text-align:right!important;
}


.t_skinR0077{
	table-layout:fixed!important;
	/* width:100%; */
	border-spacing: 0;
	border-bottom: 1px solid #EBEDF1 !important;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
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
	border-top-right-radius: 10px;
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

.staffNm_dtl_view:hover{
	color:#FF7043;
}

</style>

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/stats.js'/>" ></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<script>
$(document).ready(function(){
	//$('#nfixedMain').css('width',60*31+10);	<%-- 46 >> 45 --%><%-- 44 >> 46 20150717 --%>	<%-- 43 >> 44 20150717 --%>
	//$('#fixedTop').css('width',60*31+1);	<%-- 46 >> 45 --%><%-- 44 >> 46 20150717 --%>	<%-- 43 >> 44 20150717 --%>
	$(".t_skin05 ul li:first-child").css("background-color", "#E0F8F7");
	$(".t_skin05 ul li p:even").css("background-color", "#E0F8F7");
	$(".t_skin05 ul li p:even").css("border-bottom", "1px solid #75C5DE");
	//$("li").filter('.bgWt').css("background-color", "#fff");
	var tempX=0;
	var tempY=0;
	window.onscroll = function(){//alert($("#fixedTop").attr('class'));
		var scrollX = window.scrollX;	// || document.documentElement.scrollLeft;
		var scrollY = window.scrollY || document.documentElement.scrollTop;
		var w=window.innerWidth
		|| document.documentElement.clientWidth
		|| document.body.clientWidth;
		if(tempX != scrollX){
			//alert("좌우스크롤");
			//$("#fixedTop").css('right',scrollX);
			//$("#fixedTop").css('right',scrollX - 136);
			//$("#title0").css('width',w+scrollX);
			
			$("#fixedTop").offset({'left': $('#nfixedRight').offset().left});
			
		}else if(tempY != scrollY){//alert(scrollY/40)
			//alert("상하스크롤");
			$(".fixed-left").css('top',$("#nfixedMain").css('padding-top').split('px')[0]-(scrollY-1));
		}
	    tempX = scrollX;
	    tempY = scrollY;
	};

/* 	$(document).on("mouseover","li", function(){
		var lineli = $(this).parent('ul').find('li, p');
		lineli.addClass('bgLightOrange');
	});
 */
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

});
function privateList(nm){
	$('#dayForm').append('<input type="hidden" name="tmpNum1" value="'+nm+'"/>');
	document.dayForm.action = "<c:url value='/stats/selectPrivateList.do' />";
	document.dayForm.target = "_self";
	document.dayForm.submit();

}
function privateStatsPop(nm){
	
	window.open("", "private_popup", "width=1300, height=700");
	
	$('input[name=usrNm]').val(nm);
	document.dayForm.action = "<c:url value='/stats/privateStatsPop.do' />";
	document.dayForm.target = "private_popup";
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
	, data = {choice_year : $("#choice_yearS").val()
			 ,tmpNum1 : nm
			 ,tmpNum2 : 'stats'}
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


//년도 선택 이벤트 
function submitLH(halfYear){
	document.dayForm.action="<c:url value='/stats/index.do' />";
	document.dayForm.target="_self";
	
	$('input[name=usrNm]').val("");
	
	$("#total").val(halfYear);
	$("#dayForm").submit();
}

</script>
<style>.year {padding-left: 10px;}li>a,li>p>a{width:100%;height:100%;display:inline-block !important;}.bgLightOrange{background-color: #FFECCA/*#FFE4B5*/ !important;}</style>
</head>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<body>





<div id="wrap" class="content_box" style="height:100%;">

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
		
		<input type="hidden" name="usrNm" value=""/>							<!-- 개인별 실적 팝업 화면 위한 -->
		
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
		<c:if test="${userLoginInfo.permission > '00020'}">
		<span class="btn s black" onclick="excel();"><a>엑셀다운</a></span>		
		</c:if>
		<%--<c:if test="${userLoginInfo.permission > '00019'}"> --%>
		<span class="btn s blue" onclick="showAll();">
			<a>퇴사자보기
			<c:choose><c:when test="${showAll eq 'Y'}"> <font color=red>[ON]</font></c:when><c:otherwise>[OFF]</c:otherwise></c:choose>
			</a>
		</span>
		<%--</c:if> --%>
		
	</form>
</div>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">


<div id="fixedTop" class="fixed-top00" style="z-index:99;">
	<header>
		<div id="title0" class="cent" style="height:50px;display:inline-block;background-color:white;width:100%;padding-left:10px;">
			<h2 class="h_divTitle">
			 개인별 실적 현황
			</h2>
		</div>
	</header>


	<div>
		<table class="t_skinR0077" style="margin-left:10px; width:1448px;">
		<colgroup>			
			<col width="50"> 
			<col width="60">
			<col width="43">
			<col class="count_style">
			<col class="money_style">
			<col class="count_style">
			<col class="money_style">
			
			<col class="money_style">
			
			<col class="count_style">
			<col class="money_style">
			<col class="money_style">
			
			<col class="count_style">
			<col class="count_style">
			<col class="count_style">
			
			<col class="count_style">
			<col class="count_style">
			<col class="count_style">
			<col class="count_style">
			<col class="count_style">
			
			<col class="money_style">
			
			<col class="money_style">
			<col class="money_style">
			<col class="money_style">
			
			<col class="count_style">
			<col class="count_style">
			<col class="count_style">
			<col class="count_style">
			<col class="count_style">
			<col class="count_style">
			<col class="count_style">
			<col class="count_style">
			<col class="count_style">
						
		</colgroup>
		<thead id="TiTle">
			<tr>
				<th rowspan="3" class="bgYlw pd0" style="height:86px;">부서</th>
				<th rowspan="3" class="bgYlw pd0" style="height:86px;">활동<br/>내용</th>
				<th rowspan="3" class="bgYlw pd0">업무</th>				
				<th colspan="16" class="bgGrn" style="height:25px;">딜</th>		<%-- 17>>16 --%><%-- 15>>17 중개 '이익' 추가 20151211 --%>	<%-- 14>>15 중개 '이익' 추가 20150717 --%>
				<th colspan="4" class="bgPich">자금</th>
				<th colspan="2" class="bgSky pd0">추천</th>
				<th rowspan="3" class="bgSky pd0">딜<br/>분석</th>
				<th rowspan="3" class="bgSky pd0">IR/<br/>탐방</th>
				<th rowspan="3" class="bgSky pd0">기투자<br/>리포트</th>
				<th rowspan="3" class="bgSky pd0">제안서</th>				
				<th rowspan="3" class="bgYlw pd0">정보<br/>등록<br/>핵심<br/>체크</th>
				<th rowspan="3" class="bgYlw pd0">네트<br/>워크<br/>등록</th>
				<th rowspan="3" class="bgYlw pd0">외부인<br/>소개</th>				
			</tr>
			<tr>
				<th colspan="2" class="bgGrn pd0">소싱</th>
				
				<th colspan="2" class="bgGrn pd0">투자</th>		<%-- 20151211 추가 --%>
				
				<th class="bgGrn pd0">직접</th>
				<th colspan="3" class="bgGrn pd0">중개</th>		<%-- 2>>3 중개 '이익' 추가 20150717 --%>
				<th colspan="3" class="bgGrn pd0">M&A</th>
				<th colspan="2" class="bgGrn pd0">프리IPO</th>
				<th colspan="2" class="bgGrn pd0">Shell</th><%-- 스팩 --%>
				<th rowspan="3" class="bgGrn pd0">코멘트</th>

				<th colspan="3" class="bgPich pd0">사모투자</th>
				
				<th rowspan="2" class="bgPich pd0">총<br/>규모<br/><font style="color:gray;font-weight:normal;">(억)</font></th>

				<th rowspan="2" class="bgSky pd0">종목<br/>추천</th>
				<th rowspan="2" class="bgSky pd0">추천<br/>의견</th>

			</tr>
			<tr>
				<th class="bgGrn pd0">제안<br/><font style="color:gray;font-weight:normal;">(딜)</font></th>
				<th class="bgGrn pd0">규모<br/><font style="color:gray;font-weight:normal;">(억)</font></th>
				
				<th class="bgGrn pd0">건수<br/><font style="color:gray;font-weight:normal;">(딜)</font></th>		<%-- 20151211 추가 --%>
				<th class="bgGrn pd0">규모<br/><font style="color:gray;font-weight:normal;">(억)</font></th>		<%-- 20151211 추가 --%>
				
				<%--<th rowspan="2" class="bgGrn pd0">건수</th> --%>		<%-- 20151211 --%>
				<th class="bgGrn pd0">규모<br/><font style="color:gray;font-weight:normal;">(억)</font></th>
				<!--
				<th colspan="2" class="bgGrn pd0">단독</th>
				<th colspan="2" class="bgGrn pd0">공동</th>
				<th rowspan="2" class="bgGrn pd0">총<br/>규모</th>
				-->
				<th class="bgGrn pd0">성사<br/><font style="color:gray;font-weight:normal;">(딜)</font></th>
				<th class="bgGrn pd0">규모<br/><font style="color:gray;font-weight:normal;">(억)</font></th>
				<th class="bgGrn pd0">이익<br/><font style="color:gray;font-weight:normal;">(억)</font></th>

				<th class="bgGrn pd0">딜소싱<br/><font style="color:gray;font-weight:normal;">(딜)</font></th>
				<th class="bgGrn pd0">연결<br/><font style="color:gray;font-weight:normal;">(회사)</font></th>
				<th class="bgGrn pd0">성사<br/><font style="color:gray;font-weight:normal;">(딜)</font></th>

				<c:forEach begin="1" end="2">
				<th class="bgGrn pd0">제안<br/><font style="color:gray;font-weight:normal;">(딜)</font></th>
				<th class="bgGrn pd0">성사<br/><font style="color:gray;font-weight:normal;">(딜)</font></th>
				</c:forEach>

				<th class="bgPich pd0" title="ib시스템->일임->성사">쿼터</th>
				<%--
				<th rowspan="2" class="bgPich pd0" title="고객시스템의 일임금액">단독<br/>성사</th>
				<th rowspan="2" class="bgPich pd0" title="고객시스템의 일임금액">공동<br/>성사</th>
				--%>
				<th class="bgPich pd0">일임<br/><font style="color:gray;font-weight:normal;">(억)</font></th>
				<th class="bgPich pd0">매각<br/><font style="color:gray;font-weight:normal;">(억)</font></th>
				<%--
				<c:forEach begin="1" end="2">
				<th class="bgPich pd0">성사</th>
				<!-- <th rowspan="2" class="bgPich pd0">공동<br/>성사</th> -->
				</c:forEach>
				 --%>
				<%--
				<c:forEach begin="1" end="2">
				<th colspan="2" class="bgPuple pd0">직접섭외</th>
				<th colspan="2" class="bgPuple pd0">소개</th>
				</c:forEach>

				<th rowspan="2" class="bgYlw pd0">건수</th>
				<th rowspan="2" class="bgYlw pd0">평점</th>
				 --%>
				<%-- <th class="bgYlw">횟수</th>
				<th class="bgYlw">성과</th> --%>
				<%-- </c:forEach> --%>
			</tr>
			<%--<tr> --%>
				<%-- <c:forEach begin="1" end="2">
				<th class="bgGrn pd0">성사</th>
				<th class="bgGrn pd0">규모</th>
				</c:forEach> --%>
				<%--
				<c:forEach begin="1" end="4">
				<th class="bgPuple pd0">제안</th>
				<th class="bgPuple pd0">성사</th>
				</c:forEach>
			</tr> --%>
		</thead>
		</table>
	</div>
</div>

<c:set var="mdDeal" value="0"/><c:set var="drGood" value="0"/><c:set var="mdDealprice" value="0"/><c:set var="drDealprice" value="0"/><c:set var="mdDealpriceG" value="0"/><c:set var="drDeal" value="0"/><c:set var="dsGood" value="0"/><c:set var="drDealpriceG" value="0"/><c:set var="etGood" value="0"/><c:set var="crMoney" value="0"/><c:set var="crMoney1" value="0"/><c:set var="rsGood" value="0"/><c:set var="crsMoney" value="0"/><c:set var="fnc" value="0"/><c:set var="ipt5" value="0"/><c:set var="ipt4" value="0"/><c:set var="ipt3" value="0"/><c:set var="rcmd" value="0"/><c:set var="opnn" value="0"/><c:set var="ivt" value="0"/><c:set var="rpt" value="0"/><c:set var="pps" value="0"/><c:set var="mcc" value="0"/><c:set var="mci" value="0"/><c:set var="scc" value="0"/><c:set var="sci" value="0"/><c:set var="ann" value="0"/><c:set var="ifPv" value="0"/><c:set var="nwCst" value="0"/><c:set var="idc" value="0"/><c:set var="ids" value="0"/><c:set var="idrc" value="0"/><c:set var="idrs" value="0"/><c:set var="ma" value="0"/><c:set var="maGood" value="0"/><c:set var="ip" value="0"/><c:set var="ipGood" value="0"/><c:set var="sp" value="0"/><c:set var="spGood" value="0"/>
<div id="fixedcross" class="fixed-top" style="z-index:999;float:left;width:153px;padding:50px 0 0 10px;">
	<table class="t_skinR0077" style="">
	<colgroup>
		<col width="50">
		<col width="60">
		<col width="43">
	</colgroup>
	<thead>
		<tr>
			<th rowspan="3" class="bgYlw pd0" style="height:86px">부서</th>
			<th rowspan="3" class="bgYlw pd0 hand hov" style="height:86px" onclick="privateList('')">활동<br/>내용</th>
			<th rowspan="3" class="bgYlw pd0" style="height:86px;border-top-right-radius:0;">업무</th>
		</tr>
	</thead>
	</table>
</div>
	<div id="nfixedMain" class="t_skin05" style="width:1457px;height:100%;padding-top:137px;border-left:0;border-bottom:0;display:inline-block;">
		<%-- 왼쪽 직원 고정 메뉴 :S --%>
		<div id="fixedLeft" class="fixed-left" style="float:left;width:152px;padding-left:10px;background-color:white;border-right:1px solid #75c5de;">
		<tbody class="bgOdd">
			<c:forEach var="stats" items="${statsList}" varStatus="status">
				<c:if test="${stats.deptId ne '15'}"><%-- 출력 제외 조건 :S (전략기획팀 제외) --%>
				
				<ul class=" hov"><input type="hidden" id="statsSNb${status.count}" value="${stats.sNb}">
					<li class="cent" style="width:48px;font-size:11px;word-break:break-all;line-height:24px;
						<c:if test="${statsList[status.index+1].deptId eq stats.deptId}">border-bottom:1px solid white;</c:if> ">
						<c:if test="${stats.deptId ne preDept}">${stats.deptNm}</c:if>
					</li>
					<li class="cent"><nobr><b style="float:left;padding-left:3px;"><c:if test="${stats.isEmp eq 'not'}"><font color="#AAA"></c:if>
						<span href="#" class="hand staffNm_dtl_view" onclick="privateList('${stats.staffNm}')">${stats.staffNm}</span>
						<c:if test="${stats.isEmp eq 'not'}"></font></c:if></b></nobr>
						<font onclick="javascript:privateStatsPop('${stats.staffNm}');" style="font-size:15px;float:right;padding-right:3px;color:pink;" class="hand">
						<i class="axi axi-pageview staffNm_dtl_view"></i></font>
					</li>
					<li class="cent insideP" style="width:42px;"><p class="mg0">목표</p><p class="mg0">결과</p></li>
				</ul>
				<c:set var="preDept" value="${stats.deptId}"/>
				
				</c:if>
			</c:forEach>
			<ul><li class="cent" style="width:151px"><nobr><b>총 합계</b></nobr></li></ul>
		</tbody>
		</div>
		<%-- 왼쪽 직원 고정 메뉴 :E --%>
		
		<div id="nfixedRight" style="padding-left:10px !important">
		<tbody class="bgOdd">
		
		<!-- 합계를 위한 변수 선언 20151211 :S -->
		<c:set var="achiTotalAmountTotal" value="0.0"/>
		<c:set var="achiDirectInvestTotal" value="0.0"/>
		<!-- 합계를 위한 변수 선언 20151211 :E -->
		
		<c:forEach var="stats" items="${statsList}" varStatus="status">
		
		
			<c:if test="${stats.deptId ne '15'}"><%-- 출력 제외 조건 :S (전략기획팀 제외) --%>
			
		
			<!-- 공동규모 소수점이하 3자리 넣어서 에러 발생-->
			<fmt:formatNumber var="MediateDealpriceGood" value="${stats.mediateDealpriceGood}" pattern="0.0"/>
			<!-- 공동규모 소수점이하 3자리 넣어서 에러 발생-->
			<fmt:parseNumber var="DisposalPrice" value="${stats.disposalPrice/1000}" type="number"/>
			<fmt:parseNumber var="DisposalMargin" value="${stats.disposalMargin/1000}" type="number"/>
			
		<c:set var="mdDeal" value="${stats.mediateDeal+mdDeal}"/><c:set var="drGood" value="${stats.dealRgood+drGood}"/><c:set var="mdDealprice" value="${stats.mediateDealprice+mdDealprice}"/><c:set var="mdDealpriceG" value="${MediateDealpriceGood+mdDealpriceG}"/><c:set var="mdDealJoint" value="${stats.jointMediate+mdDealJoint}"/><c:set var="mdDealJointPrice" value="${stats.supPriceMedi + stats.jointMediateDealpriceGood+mdDealJointPrice}"/><c:set var="drDeal" value="${stats.directDeal+drDeal}"/><c:set var="dsGood" value="${stats.dealSgood+dsGood}"/><c:set var="drDealprice" value="${stats.directDealprice+drDealprice}"/><c:set var="drDealpriceG" value="${stats.directDealpriceGood+drDealpriceG}"/><%--c:set var="drDealJoint" value="${stats.jointDirect+drDealJoint}"/--%><c:set var="drDealJointPrice" value="${stats.supPriceDire + stats.jointDirectDealpriceGood+drDealJointPrice}"/><c:set var="ma" value="${stats.mna+ma}"/><c:set var="maMc" value="${stats.mnaMcpn+maMc}"/><c:set var="maGood" value="${stats.mnaGood+maGood}"/><c:set var="ip" value="${stats.ipo+ip}"/><c:set var="ipGood" value="${stats.ipoGood+ipGood}"/><c:set var="sp" value="${stats.spac+sp}"/><c:set var="spGood" value="${stats.spacGood+spGood}"/><c:set var="etGood" value="${stats.entrustGood+etGood}"/>
				
		<fmt:formatNumber var="crMoney" value="${stats.cusRealMoney+crMoney}" pattern="#.#"/>
		<fmt:formatNumber var="crMoney1" value="${stats.cusReSaleMoney+crMoney1}" pattern="#.#"/>
		<fmt:formatNumber var="crJointMoney" value="${stats.cusRealJointMine+stats.supPriceCusJointMine+crJointMoney}" pattern="#.#"/>
		
		
		<c:set var="rsGood" value="${stats.reSaleGood+rsGood}"/><c:set var="rsMoneyJoint" value="${stats.supPriceResa+stats.jointResaleDealpriceGood+rsMoneyJoint}"/><c:set var="fdGood" value="${stats.fundGood+fdGood}"/><c:set var="fdMoneyJoint" value="${stats.supPriceFund+stats.jointFundDealpriceGood+fdMoneyJoint}"/>
		
				
		<fmt:formatNumber var="crsMoney" value="${stats.cusReSaleMoney+crsMoney}" pattern="#.#"/>
		
		
		<c:set var="fnc" value="${stats.financing+fnc}"/><c:set var="rcmd" value="${stats.recommend+rcmd}"/><c:set var="opnn" value="${stats.opinion+opnn}"/><c:set var="rcmdOpnn" value="${stats.rcmdOpinion+rcmdOpnn}"/><c:set var="ivt" value="${stats.invite+ivt}"/><c:set var="rpt" value="${stats.report+rpt}"/><c:set var="pps" value="${stats.proposal+pps}"/><c:set var="mcc" value="${stats.memberCpnCast+mcc}"/><c:set var="mci" value="${stats.memberCpnIntroduce+mci}"/><c:set var="scc" value="${stats.shareholderCpnCast+scc}"/><c:set var="sci" value="${stats.shareholderCpnIntroduce+sci}"/><c:set var="mccGood" value="${stats.memberCpnCastGood+mccGood}"/><c:set var="mciGood" value="${stats.memberCpnIntroduceGood+mciGood}"/><c:set var="sccGood" value="${stats.shareholderCpnCastGood+sccGood}"/><c:set var="sciGood" value="${stats.shareholderCpnIntroduceGood+sciGood}"/><c:set var="ann" value="${stats.anner+ann}"/><c:set var="ifPv" value="${stats.introducer+ifPv}"/><c:set var="nwCst" value="${stats.networkCst+stats.networkCpn+nwCst}"/><c:set var="idc" value="${idc+stats.ideaCnt}"/><c:set var="ids" value="${ids+stats.ideaScore}"/><c:set var="idrc" value="${idrc+stats.ideaRcmdCnt}"/><c:set var="idrs" value="${idrs+stats.ideaRcmdScore}"/><c:set var="dsps" value="${dsps+stats.disposal}"/><c:set var="dspsP" value="${(dspsP+stats.disposalPrice)}"/>
		
					
		<c:set var="dspsG" value="${(dspsG + (stats.disposalMargin-stats.disposalPrice))}"/>
			
			<ul>
				<li class="cent" style="width:49px!important;"><nobr><b>${stats.deptNm}</b></nobr></li>
			
				<li class="cent" style="width:60px;"><nobr><b>${stats.staffNm}</b></nobr></li>
				<li class="cent insideP" style="width:40px;"><p class="mg0">목표</p><p class="mg0">결과</p></li>
				
			<!-- 딜 -->
			
				<li class="cent insideP count_style_brdr"><!-- 소싱: 중개+직접발굴 제안 -->
					<p class="mg0"><c:if test="${not empty stats.planMediateDeal and stats.planMediateDeal != 0  and not empty stats.planDirectDeal and stats.planDirectDeal != 0}"><b>${stats.planMediateDeal + stats.planDirectDeal}</b></c:if></p>
					<p class="mg0"><c:if test="${stats.mediateDeal != 0  or stats.directDeal != 0}"><a class="offerCnt pd0" id="midiateDeal${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00001', event);"><font color="navy">${stats.mediateDeal + stats.directDeal}</font></a></c:if></p>
				</li>
				<li class="cent money_style_brdr"><!-- 소싱: 중개+직접발굴 규모 -->
					<fmt:formatNumber var="intSumIntDeal" value="${stats.mediateDealprice + stats.directDealprice}" pattern="0.0"/><c:if test="${not empty (stats.mediateDealprice+stats.directDealprice) and (stats.mediateDealprice+stats.directDealprice) != 0}"><a class="offerCnt pd0" id="mediateDealprice${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00001', event);"><font color="navy">${intSumIntDeal}</font>&nbsp;</a></c:if>					
				</li>
				
				<%-- 투자 (건수, 금액) 추가 :S 20151211 --%>
				<li class="cent count_style_brdr" style="line-height:14px;"><!-- 투자: 중개+직접발굴 단독성사 -->
					<c:if test="${stats.dealRgood != 0 or stats.dealSgood != 0 or stats.jointMediate != 0}">
						<a class="offerCnt pd0" id="dealRgood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00001', event, '00003', '', '', '', 'joint');">
						<c:if test="${stats.jointMediate != 0 }"><font color="navy"><small>공동진행&nbsp;${stats.jointMediate}</small></font></c:if>
						<c:if test="${stats.dealRgood != 0 or stats.dealSgood != 0}"></br><font color="navy">${stats.dealRgood + stats.dealSgood}</font></c:if>
						</a>
					</c:if>
				</li>
				<li class="cent money_style_brdr"><!-- 투자 > 규모 -->
					<c:if test="${stats.achiTotalAmount != 0.0}">
					<a class="offerCnt pd0" id="mediateDealpriceGood${status.count}" title="단독진행, 공동진행 합" onclick="statsOfferdivAjax('${stats.staffNm}','00001', event, '00003','','','','joint');">
						<nobr><font color="navy">${stats.achiTotalAmount}&nbsp;<br></font></nobr>
					</a>
					</c:if>
					
					<c:set var="achiTotalAmountTotal" value="${achiTotalAmountTotal + stats.achiTotalAmount}" />	<!-- 하단 총합계 위해 sum -->
				</li>
				<%-- 투자 (건수, 금액) 추가 :E 20151211 --%>
				
				<li class="temp_class money_style_brdr"><!-- 직접 투자: 중개 규모(공동진행 분할되서 출력) -->
					
					<!-- ====== 임시추가(구데이터) :S ====== -->
					<fmt:formatNumber var="intSumDeal" value="${stats.supPriceMedi + stats.jointMediateDealpriceGood}" pattern="0.0"/>
					<fmt:formatNumber var="intSumDeal2" value="${stats.supPriceDire + stats.jointDirectDealpriceGood}" pattern="0.0"/>
					<fmt:formatNumber var="intSumDealTotal" value="${MediateDealpriceGood + stats.directDealpriceGood + intSumDeal + intSumDeal2}" pattern="0.0"/>
					<!-- ====== 임시추가(구데이터) :E ====== -->
				
				
					<c:if test="${stats.achiDirectInvest != 0.0}">
					<a class="offerCnt pd0" id="mediateDealpriceGood${status.count}" title="중개제외, 직접투자 금액" onclick="statsOfferdivAjax('${stats.staffNm}','00001', event, '00003','','','','joint');">
						<font color="navy">${stats.achiDirectInvest}&nbsp;<br><span title="구데이터">(${intSumDealTotal})</span></font>&nbsp;
					</a>
					</c:if>
					
					<c:set var="achiDirectInvestTotal" value="${achiDirectInvestTotal + stats.achiDirectInvest}" />	<!-- 하단 총합계 위해 sum -->
				</li>
								
				<li class="cent bgWt count_style_brdr" style="line-height:14px;"><!-- 중개(매각) 성사 -->
					<c:if test="${!(stats.disposalSupporter == 0 and stats.disposal == 0)}"><a class="pd0" onclick="disposalModal('${stats.staffNm}',event)" style="white-space:nowrap;">
					<c:if test="${stats.disposalSupporter != 0}"><font color="navy"><small>공동진행<br/>${stats.disposalSupporter}</small></font></c:if>
					<c:if test="${stats.disposal != 0}"><br/><font color="navy">${stats.disposal}</font></c:if>
					</a></c:if>
				</li>

				<li class="cent bgWt money_style_brdr"><!-- 중개(매각) 규모 -->
					<fmt:formatNumber var="intDisposalPrice" value="${DisposalPrice}" pattern="0.0"/><%--20150714 --%>					
					<c:if test="${!(DisposalPrice == 0 or empty DisposalPrice)}">
						<a class="pd0" onclick="disposalModal('${stats.staffNm}',event)" style="white-space:nowrap;">
						<font color="navy">${intDisposalPrice}&nbsp;</font>
						</a>
					</c:if>
				</li>
				
				<li class="cent bgWt money_style_brdr"><!-- 중개(매각) 이익(매각금액-규모) -->
					<fmt:formatNumber var="intDisposalMargin" value="${DisposalMargin}" pattern="0.0"/>
					<fmt:formatNumber var="intDisposalGain" value="${DisposalMargin - DisposalPrice}" pattern="0.0"/><%--20150714 --%>					
					<c:if test="${!(DisposalMargin == 0 or empty DisposalMargin)}">
						<a class="pd0" onclick="disposalModal('${stats.staffNm}',event)" style="white-space:nowrap;" title="매각금액(${intDisposalMargin})-규모(${intDisposalPrice})">
						<font color="navy">${intDisposalGain}&nbsp;</font>
						</a>
					</c:if>
				</li>

				<li class="cent bgWt count_style_brdr"><!-- mna --><c:if test="${stats.mna != 0}"><a class="offerCnt pd0" id="mna${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', event, '', '', '', '', 'mna');"><font color="navy">${stats.mna}</font></a></c:if></li>
				<li class="cent bgWt count_style_brdr"><!-- mnaMcpn --><c:if test="${stats.mnaMcpn != 0}"><font color="navy">${stats.mnaMcpn}</font></c:if></li>
				<li class="cent bgWt count_style_brdr"><!-- mnaG--><c:if test="${stats.mnaGood != 0}"><a class="offerCnt pd0" id="mnaG${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', event, '00006', '', '', '', 'mna');"><font color="navy">${stats.mnaGood}</font></a></c:if></li>
				<li class="cent bgWt count_style_brdr"><!-- ipo --><c:if test="${stats.ipo != 0}"><a class="offerCnt pd0" id="ipo${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', event, '', '', '', '', 'ipo');"><font color="navy">${stats.ipo}</font></a></c:if></li>
				<li class="cent bgWt count_style_brdr"><!-- ipoG--><c:if test="${stats.ipoGood != 0}"><a class="offerCnt pd0" id="ipoG${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', event, '00003', '', '', '', 'ipo');"><font color="navy">${stats.ipoGood}</font></a></c:if></li>
				<li class="cent bgWt count_style_brdr"><!-- Shell --><c:if test="${stats.spac != 0}"><a class="offerCnt pd0" id="spac${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', event, '', '', '', '', 'spac');"><font color="navy">${stats.spac}</font></a></c:if></li>
				<li class="cent bgWt count_style_brdr"><!-- ShellG--><c:if test="${stats.spacGood != 0}"><a class="offerCnt pd0" id="spacG${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', event, '00003', '', '', '', 'spac');"><font color="navy">${stats.spacGood}</font></a></c:if></li>
				<li class="cent bgWt count_style_brdr"><!-- 딜코멘트--><c:if test="${not empty stats.opinion and stats.opinion != 0}"><a class="offerCnt pd0" id="opinion${status.count}" onclick="statsOfferdivAjax('${stats.staffId}','', event, '', '','','','100');"><font color="navy">${stats.opinion}</font></a></c:if></li>

			<!-- 자금 -->
				
				<li class="cent insideP money_style_brdr">
					<p class="mg0"><c:if test="${not empty stats.planEntrustSuccess and stats.planEntrustSuccess != 0}"><nobr><b><fmt:formatNumber value="${stats.planEntrustSuccess}" pattern="0.0"/></b></nobr></c:if></p>
					<p class="mg0 modalText" title="ib시스템->일임->성사"><fmt:formatNumber var="entrustGood" value="${stats.entrustGood}" pattern="0.0"/><c:if test="${entrustGood != 0.0}"><a class="offerCnt pd0" id="entrustGood${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00011', event, '00003', '', '', '');"><nobr><font color="navy">${entrustGood}</font></nobr></a></c:if></p>
				</li>
				<li class="cent bgWt modalText money_style_brdr" title="고객시스템 실데이터"><!-- 일임 성사 -->
				<c:if test="${!(empty stats.cusRealMoney or stats.cusRealMoney == 0.0)}">
					<a href="javascript:Go_InvestList('${stats.cusInviteSabun}', '2');">
					<fmt:formatNumber var="intSumDealNormal0" value="${stats.cusRealMoney}" pattern="0.0"/><font color="navy">${intSumDealNormal0}&nbsp;</font>
					</a>
				</c:if></li>
				<li class="cent bgWt modalText money_style_brdr" title="고객시스템 실데이터"><!-- 매각 성사 -->
				<c:if test="${!(empty stats.cusReSaleMoney or stats.cusReSaleMoney == 0.0)}">
					<a href="javascript:Go_InvestList('${stats.cusInviteSabun}', '4');">
					<fmt:formatNumber var="intSumDealNormal00" value="${stats.cusReSaleMoney}" pattern="0.0"/><font color="navy">${intSumDealNormal00}&nbsp;</font>
					</a>
				</c:if></li>
				
				<li class="cent bgWt money_style_brdr"><!-- 자금 총규모 -->
					<a href="javascript:Go_InvestList('${stats.cusInviteSabun}', '');">
						<span style="color:navy;">
						<fmt:formatNumber var="ttSum" value="${intSumDealNormal0 + intSumDealNormal00 + intSumDealNormal1 + intSumDealNormal2 + intSumDeal00 + stats.reSaleGood + intSumDeal01}" pattern="0.0"/><c:if test="${ttSum > 0.0}">${ttSum}&nbsp;</c:if>
						</span>
					</a>
				</li>
			<!-- 정보 -->
				<li class="cent bgWt hoverTd count_style_brdr"><!-- 추천 --><c:if test="${not empty stats.recommend and stats.recommend != 0}"><a class="offerCnt pd0" id="recommend${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00000', event, '', '00013');"><font color="navy">${stats.recommend}</font></a></c:if></li>
				<!-- <li class="cent bgWt hoverTd"></li> -->
				<li class="cent bgWt hoverTd count_style_brdr"><!-- 추천종목의견 --><c:if test="${not empty stats.rcmdOpinion and stats.rcmdOpinion != 0}"><a class="offerCnt pd0" id="rcmdOpinion${status.count}" onclick="statsOfferdivAjax('${stats.staffId}','', event, '', '','','','200');"><font color="navy">${stats.rcmdOpinion}</font></a></c:if></li>
				<li class="cent bgWt hoverTd count_style_brdr"><!-- 분석 --><c:if test="${not empty stats.anner and stats.anner != 0}"><a class="offerCnt pd0" id="anner${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00000', event, '', '00004');"><font color="navy">${stats.anner}</font></a></c:if></li>
				<li class="cent bgWt hoverTd count_style_brdr"><!-- 탐방 --><c:if test="${not empty stats.invite and stats.invite != 0}"><a class="offerCnt pd0" id="invite${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00000', event, '', '00003');"><font color="navy">${stats.invite}</font></a></c:if></li>
				<li class="cent bgWt hoverTd count_style_brdr"><!-- 리포트 --><c:if test="${not empty stats.report and stats.report != 0}"><a class="offerCnt pd0" id="report${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00000', event, '', '','', 'Y');"><font color="navy">${stats.report}</font></a></c:if></li>
				<li class="cent bgWt hoverTd count_style_brdr"><!-- 제안서 --><c:if test="${not empty stats.proposal and stats.proposal != 0}"><a class="offerCnt pd0" id="proposal${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','00000', event, '', '00005');"><font color="navy">${stats.proposal}</font></a></c:if></li>
			
				<li class="cent bgWt hoverTd count_style_brdr"><!-- 정보등록 --><c:if test="${not empty stats.financing and stats.financing != 0}"><a class="offerCnt pd0" id="financing${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', event, '', '','','','0');"><font color="navy">${stats.financing}</font></a></c:if></li>
				<%-- <li class="cent bgWt hoverTd"><!-- 정보등록 성공 --><c:if test="${not empty stats.financingSuccess and stats.financingSuccess != 0}"><a class="offerCnt pd0" id="financingSuccess${status.count}" onclick="statsOfferdivAjax('${stats.staffNm}','', event, '', '','','','1');"><font color="navy">${stats.financingSuccess}</font></a></c:if></li> --%>
				<li class="cent bgWt hoverTd count_style_brdr"><!-- 네트워크 등록 --><c:if test="${(not empty stats.networkCst or not empty stats.networkCpn)and(stats.networkCst != 0 or stats.networkCpn != 0)}"><a class="offerCnt pd0" id="network${status.count}" onclick="statsNetworkAjax(event,'${stats.networkCst}','${stats.networkCpn}','${stats.staffId}');"><font color="navy">${stats.networkCst + stats.networkCpn}</font></a></c:if></li>
				<li class="cent bgWt hoverTd count_style_brdr"><!-- 외부인 소개 --><c:if test="${not empty stats.introducer and stats.introducer != 0}"><a class="offerCnt pd0" id="infoProvider${status.count}" onclick="statsNetworkAjax(event,'introducer','','${stats.staffId}');""><font color="navy">${stats.introducer}</font></a></c:if></li>
				
			</ul>
			<fmt:formatNumber var="intSumDealNormal0" value="0"/>
			<fmt:formatNumber var="intSumDealNormal00" value="0"/>
			<fmt:formatNumber var="intSumDealNormal1" value="0"/>
			<fmt:formatNumber var="intSumDealNormal2" value="0"/>
			<fmt:formatNumber var="intSumDeal00" value="0"/>
			<fmt:formatNumber var="intSumDeal01" value="0"/>
			
			</c:if>
			
		</c:forEach>


		<!-- ======================================= 하단 TOTAL :S ======================================= -->
			<ul>
				<li class="cent" style="width:49px!important;">&nbsp;</li>
				
				<li class="cent" style="width:60px!important;"><nobr><b>총 합계</b></nobr></li>
				<li class="cent insideP" style="width:40px;"><p class="mg0">목표</p><p class="mg0">결과</p></li>
			<!-- 딜 -->
				<li class="cent bgGrn hoverTd count_style_brdr"><c:if test="${mdDeal != 0 or drDeal != 0}"><nobr><b>${mdDeal + drDeal}</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd money_style_brdr"><c:if test="${mdDealprice != 0 or drDealprice != 0}"><fmt:formatNumber var="mdDrPrice" value="${mdDealprice + drDealprice}" pattern="0.0"/><nobr><b>${mdDrPrice}&nbsp;</b></nobr></c:if></li>
				
				<%-- 20151211 투자(건수,규모) 추가 :S --%>
				<li class="cent bgGrn hoverTd count_style_brdr"><c:if test="${drGood != 0 or dsGood != 0}"><nobr><b>${drGood + dsGood}</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd money_style_brdr">
					<c:if test="${achiTotalAmountTotal !=0.0}">
					<nobr><b>${achiTotalAmountTotal}&nbsp;</b></nobr>
					</c:if>
				</li>
				<%-- 20151211 투자(건수,규모) 추가 :E --%>
				
				
				<%-- 임시 구 데이터 출력위해 :S --%>
				<fmt:parseNumber var="intMdDealpriceG" integerOnly="true" value="${mdDealpriceG}"/>
				<fmt:formatNumber var="intDrDealJointPrice" value="${drDealJointPrice}" pattern="0.0"/>
				<fmt:formatNumber var="intMdDealJointPrice" value="${mdDealJointPrice}" pattern="0.0"/>
				<fmt:formatNumber var="intMdDealJointPriceTotal" value="${intMdDealpriceG + intDrDealJointPrice + intMdDealJointPrice + drDealpriceG}" pattern="0.0"/>	<!--20150714 -->
				<%-- 임시 구 데이터 출력위해 :E --%>
				
				<li class="cent bgGrn hoverTd temp_class money_style_brdr">
					<c:if test="${achiInvestAmountTotal !=0.0}">
					<b>${achiDirectInvestTotal}&nbsp;</b><br>(${intMdDealJointPriceTotal})&nbsp;
					</c:if>
				</li>
								 
				<li class="cent bgGrn hoverTd count_style_brdr"><c:if test="${dsps != 0}"><nobr><b>${dsps}</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd money_style_brdr">
					<fmt:formatNumber var="intMdDealPriceT" value="${dspsP/1000}" pattern="0.0"/>
					<c:if test="${dspsP != 0}"><nobr><b>${intMdDealPriceT}&nbsp;</b></nobr></c:if>
				</li>
				<li class="cent bgGrn hoverTd money_style_brdr">
					<fmt:formatNumber var="intMdDealGainT" value="${dspsG/1000}" pattern="0.0"/>
					<c:if test="${dspsG != 0}"><nobr><b>${intMdDealGainT}&nbsp;</b></nobr></c:if>
				</li>
				
				<li class="cent bgGrn hoverTd count_style_brdr"><!-- mna 딜소싱 --><c:if test="${ma != 0}"><nobr><b>${ma}</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd count_style_brdr"><!-- mna 연결 --><c:if test="${maMc != 0}"><nobr><b>${maMc}</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd count_style_brdr"><!-- mna 성사 --><c:if test="${maGood != 0}"><nobr><b>${maGood}</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd count_style_brdr"><!-- ipo 제안 --><c:if test="${ip != 0}"><nobr><b>${ip}</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd count_style_brdr"><!-- ipo 성사 --><c:if test="${ipGood != 0}"><nobr><b>${ipGood}</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd count_style_brdr"><!-- spac 제안--><c:if test="${sp != 0}"><nobr><b>${sp}</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd count_style_brdr"><!-- spac 성사--><c:if test="${spGood != 0}"><nobr><b>${spGood}</b></nobr></c:if></li>
				<li class="cent bgGrn hoverTd count_style_brdr"><!--  딜의견  --><c:if test="${not empty opnn and opnn != 0}"><b>${opnn}</b></c:if></li>
			<!-- 자금 -->
				<li class="cent bgPich hoverTd money_style_brdr"><c:if test="${etGood != 0}"><nobr><b>${etGood}&nbsp;</b></nobr></c:if></li>
				<li class="cent bgPich hoverTd money_style_brdr"><!-- 일임 성사 -->
					<c:if test="${crMoney != 0.0}"><a href="javascript:Go_InvestList('', '2');"><nobr><span style="color:#000000;font-weight:bold;">${crMoney}&nbsp;</span></nobr></a></c:if>
				</li>
				<li class="cent bgPich hoverTd money_style_brdr"><!-- 매각 성사 -->
					<c:if test="${crMoney1 != 0.0}"><a href="javascript:Go_InvestList('', '4');"><nobr><span style="color:#000000;font-weight:bold;">${crMoney1}&nbsp;</span></nobr></a></c:if>
				</li>
				
				<li class="cent bgPich hoverTd money_style_brdr"><!-- 자금 총규모 -->
					<a href="javascript:Go_InvestList('', '');">
						<nobr><span style="color:#000000;font-weight:bold;"><fmt:formatNumber value="${crMoney+crMoney1+fdGood+rsGood}" pattern="0.0"/></span>&nbsp;</nobr>
						<%--20160530 펀드 성사, 재매각 성사 삭제... 자금 총규모 에서는 삭제 안했다..바서 삭제  --%>
					</a>
				</li>
			<!-- 정보 -->
				<li class="cent bgSky hoverTd count_style_brdr"><!-- 추천 --><c:if test="${not empty rcmd and rcmd != 0}"><b>${rcmd}</b></c:if></li>
				<li class="cent bgSky hoverTd count_style_brdr"><!-- 추천종목의견 --><c:if test="${not empty rcmdOpnn and rcmdOpnn != 0}"><b>${rcmdOpnn}</b></c:if></li>
				<li class="cent bgSky hoverTd count_style_brdr"><!-- 분석 --><c:if test="${not empty ann and ann != 0}"><b>${ann}</b></c:if></li>
				<li class="cent bgSky hoverTd count_style_brdr"><!-- 탐방 --><c:if test="${not empty ivt and ivt != 0}"><b>${ivt}</b></c:if></li>
				<li class="cent bgSky hoverTd count_style_brdr"><!-- 리포트 --><c:if test="${not empty rpt and rpt != 0}"><b>${rpt}</b></c:if></li>
				<li class="cent bgSky hoverTd count_style_brdr"><!-- 제안서 --><c:if test="${not empty pps and pps != 0}"><b>${pps}</b></c:if></li>
		
				<li class="cent bgYlw hoverTd count_style_brdr"><!-- 정보등록 --><c:if test="${not empty fnc and fnc != 0}"><b>${fnc}</b></c:if></li>
				<li class="cent bgYlw hoverTd count_style_brdr"><!-- 네트워크 등록 --><c:if test="${(not empty nwCst)and(nwCst != 0 )}"><b>${nwCst}</b></c:if></li>
				<li class="cent bgYlw hoverTd count_style_brdr"><!-- 외부인 소개 --><c:if test="${not empty ifPv and ifPv != 0}"><b>${ifPv}</b></c:if></li>
			
			</ul>
			
		<!-- ======================================= 하단 TOTAL :E ======================================= -->
			
		</tbody><!-- </div> -->
	</div>
</div>
<div class="clear"></div>
</div>
</body>
</html>