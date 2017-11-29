<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/base.js'/>" ></script>
<script>

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
			view("offerPr",'',e);
		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});
};


function view(divId,th,e){ 		//divId : 보여주기위한 target divId
	var browserWidth = document.documentElement.clientWidth;		//창너비
	var calWidth= $("#" + divId).outerWidth();
	var pstn = getPosition(e);
	var top = pstn.y;
	var left = pstn.x;
	$("#"+divId).css({"top":top+"px","left":(left+calWidth<browserWidth?left:0)+"px"});		//browserWidth-(calWidth+8))+"px"});
	$("#"+divId).css('display','block');
	$(".popUpMenu").hide();
	$("#"+divId).show();
}

</script>
</head>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<body>
<div id="offerDiv"><div id="offerPr" style="display: none;"></div></div>
	<header>
	</header>
	<section>
		<article>
			<form name="searchCst" action="<c:url value='/network/integratedSearch.do' />" method="post">
			<div style="padding: 10px 20px 0px 20px;<%--width: 1300px;border: darkgray solid 1px;border-radius: 5px; background-color: #FAEBD7; --%>">
				<font color="#75C5DE" style="font-weight:bold;display: inline-block;width: 30px;text-align: left;vertical-align: top;">통합검색</font>&nbsp;&nbsp;
				<%-- <img src="<c:url value='../images/network/searchTitle.png' />" style="width:68px;height:23px" border="0" align="absmiddle"> --%>
				<input class="nameSearch textSearchB" type="search" id="nameSearch" name="search" placeholder="텍스트" autofocus="autofocus" value="${search}">
				<input class="btnSearchB" type="submit" value="검색">
			</div>
			<div style="padding: 0px 20px 10px 20px;">
				<font color="#75C5DE" style="font-weight:bold;display: inline-block;width: 30px;text-align: left;vertical-align: top;">세부</font>
				<label><input type="radio" name="text" value="">전체</label>
				<label><input type="radio" name="text" value="fil">리포트</label>
				<label><input type="radio" name="text" value="file">파일명</label>
				<label><input type="radio" name="text" value="nw">인맥</label>
				<label><input type="radio" name="text" value="of">정보정리</label>
				<label><input type="radio" name="text" value="ro">코멘트</label>
			</div>
			</form>
			<table>
		<c:forEach var="net" items="${netList}" varStatus="NS">
				<tr>
					<td style="text-decoration:underline;color:blue;font-size:16px;">
						<a 
							<c:if test="${net.tmpNum2=='of'||net.tmpNum2=='ro'||net.tmpNum2=='file'}">
								<c:choose>
									<c:when test="${(net.offerCd == '00006') or (net.offerCd == '00007') or (net.offerCd == '00013') }">onclick="popUp('${net.tmDt}','rcmdComment','','${net.sNb}');"</c:when>
									<c:otherwise>onclick="ajaxOffer(event,'${net.sNb}')"</c:otherwise>
								</c:choose>
							</c:if>
							<c:if test="${net.tmpNum2=='nw'}">onclick="popUp('','rcmdCst','','${net.sNb}');"</c:if>
							<c:if test="${net.tmpNum2=='nwB'}">onclick="popUp('','rcmdCpn','','${net.sNb}');"</c:if>
						>${net.text0}...</a>
					</td>
				</tr>
				<tr><td><small>작성자: ${net.rgNm}</small> - <b>[${net.tmpNum1}]</b></td></tr>
				<tr><td style="display:inline-block;width:500px;color:darkgray">${fn:substring(net.tmDt, 0,10)} - ${net.text}</td></tr>
				<tr><td>&nbsp;</td></tr>
		</c:forEach>
			</table>	
		</article>
	</section>
</body>
</html>