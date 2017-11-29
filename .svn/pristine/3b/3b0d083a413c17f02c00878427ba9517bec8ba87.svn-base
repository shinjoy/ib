<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/keyPointChk.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/calendar_beans_v2.0.js'/>" ></script>
<script>
	 $("tr:even").css("background-color", "#E0F8F7");
 $(document).ready(function(){
 });
 
 
 
	//정보정리 팝업을 위한 ajax
 	function statsOfferdivAjax(e,rgName, th, snb, report){
 		var DATA = {
 				sNb: snb,
 				tmpNum1: "on",
 				rgNm: rgName,
 				reportYN: report,
 				day: $(th).attr('name'),
 				dayF: $('#cc_year').val() + '-' + $('#choice_month').val() + '-' + $(th).attr('name'),
 				tmpNum2:$('#pageName').val()
 		}, fn = function(arg){
 			$("#offerDiv").html(arg);
 						
 			//--------- 정보정리 팝업 default size 변경 20150703 :S -------
 			var dvPop = $('#offerPr').get(0);	//div popup
 			dvPop.style.width = "750px";
 			var obj = $('#txtarea').get(0);		//textarea
 			if(obj==undefined) obj = $('#txtarea1').get(0);
 			obj.style.width = "720px";
 			obj.style.height = "250px";
 			//--------- 정보정리 팝업 default size 변경 20150703 :E -------
 			
 			view("offerPr",'',e);			
 		};
 		
 		ajaxModule(DATA,"../stats/statsPrivateOffer.do",fn);
	}
	
	
 	function view(divId,th,e){ //divId : 보여주기위한 target divId
 		var browserWidth = document.documentElement.clientWidth
 		   ,browserHeight = document.documentElement.clientHeight;
 		var calWidth= $("#" + divId).outerWidth()
 		   ,calHeight= $("#" + divId).outerHeight();
 		var pstn = getPosition(e)
 		    ,top = pstn.y
 		    ,left = pstn.x;
 		var rtnTop = e.clientY<calHeight?top:top-(calHeight+5);
 		$("#"+divId).css({"top":(e.clientY+calHeight<browserHeight?top:rtnTop)+"px","left":(left+calWidth<browserWidth?left:0)+"px"}); 		
 		$("#"+divId).css('display','block');
 		$(".popUpMenu").hide();
 		$("#"+divId).show();
 	}
 	
 	
 	function getPosition(e) {
 	   e = e || window.event;
 	   var cursor = {x:0, y:0};
 	   if (e.pageX || e.pageY) {
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
 
 
</script>
<style>tbody tr:hover{background-color: moccasin !important;}</style>
</head>
<body>
<div id="wrap">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">	


		<div class="fixed-top" style="z-index:10;">
			<header>
				<h2 class="headerTitle">
					<c:set var="now" value="<%= new java.util.Date() %>"/>
					<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
					<form id="modifyRec" name="modifyRec" action="<c:url value='/work/keyPoint.do' />" method="post"><input type="hidden" name="sorting" id="sorting"><input type="hidden" name="selectInfo" value="${keyPointCd}"><input type="hidden" id="total" name="total" value="${ttT}">
						<span class="year">
							<select name='choice_year' onchange="sortTable(''<c:if test='${not empty TAB}'>,'${TAB}'</c:if>);">
								<c:forEach var="year" begin="2011" end="${cur_year}">
									<option value="${year}"
									<c:choose>
										<c:when test="${choice_year == null}"><c:if test="${year == cur_year}">selected</c:if>></c:when>
										<c:otherwise><c:if test="${year == choice_year}">selected</c:if>></c:otherwise>
									</c:choose> 
									${year}</option>
								</c:forEach>
							</select>
						</span>
					<!-- <span class="btn s red"><a onclick="sortTable('total');">전체</a></span> -->
					<c:forEach var="kp" items="${cmmCdKeyPointList}" varStatus="kpS">
						<c:if test="${kp.dTailCd == keyPointCd}">${kp.cdNm}<input type="hidden" id="SendReceive" value="${kp.cdNm}"></c:if>
					</c:forEach> 
					</form>
				</h2>
			</header>
			<%@include file="../../includeJSP/KeyPoint.jsp" %>
	
</div>
</body>
</html>