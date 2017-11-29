<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>Person History</title>
<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>
<script>
$(document).ready(function(){
	$('li').css('font-size','12px');
	if(${popUp == "Y"}){
		//$(".popUpBtn").css("display","none");
		$("#popUp").val("Y");
		$("#rtn").val("popUp");
		$("tr.link td").attr("onclick","");
	}
	$(".tblBack>tbody>tr:odd").css("background-color", "#F6F9FB");
	if($(window).width()<1010){
		$("#wrap").css("min-width","98%");
		if(typeof(parent.widthAuto)=='function')parent.widthAuto('990px');
	}
 });

function getPosition(e) {
    e = e || window.event;
    var cursor = {x:0, y:0};
    if (e.pageX || e.pageY){
        cursor.x = e.pageX;
        cursor.y = e.pageY;
    } 
    else {
        cursor.x = e.clientX + 
            (document.documentElement.scrollLeft || 
            document.body.scrollLeft) - 
            document.documentElement.clientLeft;
        cursor.y = e.clientY + 
            (document.documentElement.scrollTop || 
            document.body.scrollTop) - 
            document.documentElement.clientTop;
    }
    return cursor;
}

var cpnDivShow = function(e,divId){
	var browserWidth = document.documentElement.clientWidth;
	var calWidth= $("#" + divId).outerWidth();
	var pstn = getPosition(e);
	var top = pstn.y;
	var left = pstn.x;
	$("#"+divId).css({"top":top,"left":(left+calWidth<browserWidth?left:browserWidth-(calWidth+8))});
	$("#"+divId).css('display','block');
	$("#"+divId).show();
}

var ajaxOffer = function(e, snb, cstid, sort){
	var DATA = {
				 sNb: snb
				,cstId: cstid
				,tmpNum1:'off'
				,sort_t: sort
				//,choice_month:''
		};
	$.ajax({
		type:"POST",        //POST GET
		url:"../stats/statsPrivateOffer.do",     //PAGEURL
		data : DATA,
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			$("#offerDiv").html(arg);
			cpnDivShow(e,$("#offerPr").attr('id'));//alert(divId)
		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});
}
function linkPage(pageNo,th){
	var obj = $(th).parent().parent().parent()
		,data = {cstSnb: $("#cst_snb").val(),cstId: $("#cst_snb").val(),pageIndex: pageNo}
		,fn = function(arg){
			obj.html(arg);
		}
		,url= obj.attr('id')+".do";
	ajaxModule(data,url,fn);
}
</script>
<style>
.hov:hover{
	background-color: moccasin/* #f90 */ !important;
}
</style>
<base target="_self">
</head>
<body>

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">	
<input type="hidden" id="rtn" value="">

<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
	<input type="hidden" id="popUp" name="popUp">
</form>

<form id="downName" name="downName" action="<c:url value='/work/downloadProcess.do' />" method="post">
	<input type="hidden" name="makeName" id="makeName"/>
	<input type="hidden" name="recordCountPerPage" value="0"/>
</form>

<script>
</script>
<style>
.cstInfo>tr>th{font-size:12px;}.cstInfo>tr>td{padding:5px 10px;min-width:160px;}
tr.hov:hover,td.hov:hover {background-color: moccasin !important;}
.t_skinR00>tbody>tr:hover{background-color:white !important;}
.t_skinR00>thead>tr>td{border-top: 1px solid #E6E6E6;}
</style>
<div id="offerDiv"><div id="offerPr" style="display: none;"></div></div>

	<header>
	</header>
	<section>
	
		<table class="t_skinR00">
				
			<thead><tr>
				<th class="tbColor tbColorSub">시너지와 이력</th>
				<td colspan="3" class="tbColorSub">&nbsp;&nbsp;<span class="btn s navy"><a onclick="ajaxOffer(event,'','${cst.sNb}')">전체이력</a></span></td>
				</tr>
			</thead>
			<tbody><tr>
				<td colspan="4">
					<table class="sub_tbl t_skin04_cstNcpn" style="width:auto;">
						<tbody id="ajaxOfferP">
						<c:forEach var="offer" items="${offerList}" varStatus="status">
						<c:choose>
							<c:when test="${(offer.offerCd == '00006') or (offer.offerCd == '00007') or (offer.offerCd == '00013') }"><tr class="link"  onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');"></c:when>
							<c:otherwise><tr class="link" onclick="ajaxOffer(event,'${offer.sNb}')"></c:otherwise>
						</c:choose>
							<td>'${fn:replace(fn:substring(offer.tmDt,2,10),'-','.')}</td>
							<td><b>${offer.cpnNm}</b></td>
							<td><font color="green">${offer.offerNm}<c:if test="${empty offer.offerNm}">${offer.middleOfferNm }</c:if></font><c:if test="${offer.opinion != 0}"><span style="color:darkgoldenrod">&nbsp;<b>[${offer.opinion}]</b></span></c:if>&nbsp;</nobr></td>
							<td></td>
							<td>${offer.rgNm}</td>
							<td>
								<c:if test="${not empty offer.realNm}"><c:choose><c:when test="${fn:indexOf(offer.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(offer.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(offer.makeNm, '^^^')}"/><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file${imSt.count}" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(offer.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file1" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${offer.realNm}"></c:otherwise></c:choose></c:if>
							</td>
						<c:if test="${offer.middleOfferCd > 0}">
							<td><c:forEach var="cmmCd" items="${cmmCdProgressCdList}"><c:if test="${offer.progressCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach></td>
							<td style="max-width: 200px;"><c:if test="${not empty offer.result}">/</c:if> ${offer.result}</td>
							<td style="max-width: 200px;"><c:if test="${not empty offer.subMemo}">/</c:if> ${offer.subMemo}</td></c:if><c:if test="${offer.middleOfferCd < 1}"><td></td><td></td><td></td></c:if>
						</tr>
						<c:if test="${not empty offer.financing or not empty offer.humanNet or not empty offer.management or not empty offer.mna or not empty offer.etc or not empty offer.share or not empty offer.resource or not empty offer.investInte}">
						<tr>
							<td></td>
							<td colspan="8" style="max-width:400px;">
								<font color="#B45F04">
									<c:if test="${not empty offer.financing 	}">&nbsp;&nbsp;<b>CB/EB:</b> ${offer.financing}</c:if>
									<c:if test="${not empty offer.humanNet 		}">&nbsp;&nbsp;<b>워런트/블록딜:</b> ${offer.humanNet}</c:if>
									<c:if test="${not empty offer.audit 		}">&nbsp;<c:forEach var="starC" begin="1" end="${offer.star}"><img class="" id="file${starC}" src="../images/figure/star_y.png" style="width:10px;height:10px;"/></c:forEach><c:forEach var="starC" begin="${offer.star+1}" end="5"><img class="" id="file${starC}" src="../images/figure/star_g.png" style="width:10px;height:10px;"/></c:forEach>&nbsp;<b>분석의견:</b> ${offer.audit}</c:if>
									<c:if test="${not empty offer.management 	}">&nbsp;&nbsp;<b>자산운용:</b> ${offer.management}</c:if>
									<c:if test="${not empty offer.etc 			}">&nbsp;&nbsp;<b>실적:</b> ${offer.etc}</c:if>
									<c:if test="${not empty offer.investInte 	}">&nbsp;&nbsp;<b>투자관심:</b> ${offer.investInte}</c:if>
									<c:if test="${not empty offer.resource 		}">&nbsp;&nbsp;<b>매수추천:</b> ${offer.resource}</c:if>
									<c:if test="${not empty offer.mna 			}">&nbsp;&nbsp;<b>M&A:</b> ${offer.mna}</c:if>
									<c:if test="${not empty offer.share 		}">&nbsp;&nbsp;<b>공유:</b> ${offer.share}</c:if>
								</font>
							</td>
						</tr>
						</c:if>
						</c:forEach>
						
						<c:forEach var="offer" items="${staffOfferList}" varStatus="status">
						<c:choose>
							<c:when test="${(offer.offerCd == '00006') or (offer.offerCd == '00007') or (offer.offerCd == '00013') }"><tr class="link"  onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');"></c:when>
							<c:otherwise><tr class="link" onclick="ajaxOffer(event,'${offer.sNb}')"></c:otherwise>
						</c:choose>
							<td>'${fn:replace(fn:substring(offer.tmDt,2,10),'-','.')}</td>
							<td><b>${offer.cpnNm}</b></td>
							<td><font color="green">${offer.offerNm}<c:if test="${empty offer.offerNm}">${offer.middleOfferNm }</c:if></font></td>
							<td>${offer.cstCpnNm}&nbsp;&nbsp;</td>
							<td>${offer.cstNm}</td>
							<td>
								<c:if test="${not empty offer.realNm}"><c:choose><c:when test="${fn:indexOf(offer.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(offer.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(offer.makeNm, '^^^')}"/><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file${imSt.count}" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(offer.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file1" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${offer.realNm}"></c:otherwise></c:choose></c:if>
							</td>
							
						<c:if test="${offer.middleOfferCd > 0}">
							<td><c:forEach var="cmmCd" items="${cmmCdProgressCdList}"><c:if test="${offer.progressCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach></td>
							<td style="max-width: 200px;"><c:if test="${not empty offer.result}">/</c:if> ${offer.result}</td>
							<td style="max-width: 200px;"><c:if test="${not empty offer.subMemo}">/</c:if> ${offer.subMemo}</td></c:if><c:if test="${offer.middleOfferCd < 1}"><td></td><td></td><td></td></c:if>
						</tr>
						<c:if test="${not empty offer.financing or not empty offer.humanNet or not empty offer.management or not empty offer.mna or not empty offer.etc or not empty offer.share or not empty offer.resource or not empty offer.investInte}">
						<tr>
							<td></td>
							<td colspan="8" style="max-width:400px;">
								<font color="#B45F04">
									<c:if test="${not empty offer.financing 	}">&nbsp;&nbsp;<b>CB/EB:</b> ${offer.financing}</c:if>
									<c:if test="${not empty offer.humanNet 	}">&nbsp;&nbsp;<b>워런트/블록딜:</b> ${offer.humanNet}</c:if>
									<c:if test="${not empty offer.audit 		}">&nbsp;<c:forEach var="starC" begin="1" end="${offer.star}"><img class="" id="file${starC}" src="../images/figure/star_y.png" style="width:10px;height:10px;"/></c:forEach><c:forEach var="starC" begin="${offer.star+1}" end="5"><img class="" id="file${starC}" src="../images/figure/star_g.png" style="width:10px;height:10px;"/></c:forEach>&nbsp;<b>분석의견:</b> ${offer.audit}</c:if>
									<c:if test="${not empty offer.management 	}">&nbsp;&nbsp;<b>자산운용:</b> ${offer.management}</c:if>
									<c:if test="${not empty offer.etc 			}">&nbsp;&nbsp;<b>실적:</b> ${offer.etc}</c:if>
									<c:if test="${not empty offer.investInte 	}">&nbsp;&nbsp;<b>투자관심:</b> ${offer.investInte}</c:if>
									<c:if test="${not empty offer.resource 	}">&nbsp;&nbsp;<b>매수추천:</b> ${offer.resource}</c:if>
									<c:if test="${not empty offer.mna 			}">&nbsp;&nbsp;<b>M&A:</b> ${offer.mna}</c:if>
									<c:if test="${not empty offer.share 		}">&nbsp;&nbsp;<b>공유:</b> ${offer.share}</c:if>
								</font>
							</td>
						</tr>
						</c:if>
						</c:forEach>
						<%--<c:if test="${not empty staffOfferList}"><tr><td colspan="9" style="text-align:center;padding-left:120px;"><ui:pagination type="image" paginationInfo = "${paginationInfoOf}" jsFunction="linkPage" /></td></tr></c:if> --%>
						<c:if test="${empty staffOfferList or not empty offerList}"><tr><td><spring:message code="info.nodata.msg" /></td></tr></c:if>
						</tbody>
					</table>
				</td></tr>
			</tbody>
		
		</table>
	
	</section>
</body>
</html>