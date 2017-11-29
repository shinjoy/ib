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
<script type="text/JavaScript" src="<c:url value='/js/calendar_beans_v2.0.js'/>" ></script>
<script>
CalAddCss();
$(document).ready(function(){
	if('<c:out value='${saveCnt}'/>' > 0 ) {
		location.href ="<c:url value='index.do' />";
	}
	$("tr:even").css("background-color", "#E0F8F7");
		
});

function carSubmit(){
	$("input").css('background-color','');
	if($("#tmDt").val().is_null()){
		alert("일자를 선택하세요.");return 0;
	}
	if($("#departurePoint").val().is_null()){
		$("#departurePoint").focus();
		$("#departurePoint").css('background-color','#A9F5BC');
		alert("출발지를 입력하세요.");return 0;
	}
	if($("#departureTime").val().is_null()){
		$("#departureTime").focus();
		$("#departureTime").css('background-color','#A9F5BC');
		alert("출발시간을 입력하세요.");return 0;
	}
	if($("#destination").val().is_null()){
		$("#destination").focus();
		$("#destination").css('background-color','#A9F5BC');
		alert("목적지를 입력하세요.");return 0;
	}
	if($("#arriveTime").val().is_null()){
		$("#arriveTime").focus();
		$("#arriveTime").css('background-color','#A9F5BC');
		alert("도착시간을 입력하세요.");return 0;
	}
	/* if($("#mileage").val().is_null()){
		$("#mileage").focus();
		$("#mileage").css('background-color','#A9F5BC');
		alert("운행거리를 입력하세요.");return 0;
	} */
	if($("#totalDistance").val().is_null()){
		$("#totalDistance").focus();
		$("#totalDistance").css('background-color','#A9F5BC');
		alert("누적거리를 입력하세요.");return 0;
	}
	if($("#floor").val().is_null()){
		$("#floor").focus();
		$("#floor").css('background-color','#A9F5BC');
		alert("주차층을 선택하세요.");return 0;
	}
	if($("#note").val().is_null()){
		$("#note").focus();
		$("#note").css('background-color','#A9F5BC');
		alert("미팅내용을 입력하세요.");return 0;
	}
	var frm = document.getElementById('insertCar');//sender form id
	frm.action = "insertCarUsed.do";//target frame name
	frm.submit();
}

function deleteCarInfo(snb){
	var data = {sNb: snb};
	var url = "../car/deleteCarUsed.do";
	var fn = function(){
		$("#dayForm").submit();
	};
	ajaxModule(data,url,fn);
}
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
	
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<fmt:formatDate var="cur_day" value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd'/>
	
	<section>
		<article>
		<div class="fixed-top" style="z-index:10;">
			<header>
				<form name="modifyRec" id="dayForm" method="post" action="<c:url value='/car/index.do' />">
					<input type="hidden" name="sorting" id="sorting">
				<div class="year_wrap">
				
					<c:set var="now" value="<%= new java.util.Date() %>"/>
					<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
					<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
								
					<input type="hidden" id="choice_month" name="choice_month" value="${choice_month }"/>
					<input type="hidden" id="total" name="total"/>
					<input type="hidden" id="carNum" name="carNum" value="${carNumber }"/>
					
					<span class="year">
						<select id='choice_year' name='choice_year' onchange="javascript:document.modifyRec.submit();">
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
					 
					
					<a <c:if test="${choice_month == '01' }">class="red bold"</c:if> onclick="month('01','index.do')">1월</a><span> | </span>
					<a <c:if test="${choice_month == '02' }">class="red bold"</c:if> onclick="month('02','index.do')">2월</a><span> | </span>
					<a <c:if test="${choice_month == '03' }">class="red bold"</c:if> onclick="month('03','index.do')">3월</a><span> | </span>
					<a <c:if test="${choice_month == '04' }">class="red bold"</c:if> onclick="month('04','index.do')">4월</a><span> | </span>
					<a <c:if test="${choice_month == '05' }">class="red bold"</c:if> onclick="month('05','index.do')">5월</a><span> | </span>
					<a <c:if test="${choice_month == '06' }">class="red bold"</c:if> onclick="month('06','index.do')">6월</a><span> | </span>
					<a <c:if test="${choice_month == '07' }">class="red bold"</c:if> onclick="month('07','index.do')">7월</a><span> | </span>
					<a <c:if test="${choice_month == '08' }">class="red bold"</c:if> onclick="month('08','index.do')">8월</a><span> | </span>
					<a <c:if test="${choice_month == '09' }">class="red bold"</c:if> onclick="month('09','index.do')">9월</a><span> | </span>
					<a <c:if test="${choice_month == '10' }">class="red bold"</c:if> onclick="month('10','index.do')">10월</a><span> | </span>
					<a <c:if test="${choice_month == '11' }">class="red bold"</c:if> onclick="month('11','index.do')">11월</a><span> | </span>
					<a <c:if test="${choice_month == '12' }">class="red bold"</c:if> onclick="month('12','index.do')">12월</a><span> | </span>
					<span class="btn s"><a id="carTotSum">1~${choice_month+0}월</a></span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${carNumber != null and carNumber != ''}"><b><font color='blue'>차량번호 : ${carNumber}</font></b></c:if>
				</div>
				</form>
			</header>
	
			<table class="t_skinR00" style="width:100%;margin-top:35px;padding-right:5px;">
				<thead>
					<tr>
 						<th onclick="sortTable()" class="hand bgYlw" style="width:64px">일자<br/>▼</th>
 						<th class="bgYlw" style="width:25px">요일</th>
 						<th class="bgYlw nameD" <c:if test="${carNumber != null and carNumber != ''}">style="display:none"</c:if>>차량<br/>번호</th>
 						<th onclick="sortTable(1)" class="hand bgYlw nameD">운전자▼</th>
						<th class="bgYlw" style="width:80px">출발지</th>
						<th class="bgYlw nameD">출발<br/>시간</th>
						<th class="bgYlw" style="width:120px">목적지</th>
						<th class="bgYlw nameD">도착<br/>시간</th>
						<%-- <th class="bgYlw">미팅<br/>예정시간</th> --%>
						<th class="bgYlw" style="width:50px">운행km</th>
						<th class="bgYlw" style="width:50px">누적km</th>
						<th class="bgYlw" style="width:75px">주차 층</th>
						<th class="bgYlw companyName"><nobr>주유내역<br/>(금액)</nobr></th>
						<th class="bgYlw" colspan="2">미팅내용</th>
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
				
			</table>
		</div>
		<div style="padding-top:79px;">
				<input type="hidden" id="cardD" value="card">
			<form name="insertCar" id="insertCar" method="post">
				<input type="hidden" name="carNum" id="carNum" value="${carNumber}">
			<table class="t_skinR00" style="width:100%">
				<tbody>
					<tr <c:if test="${carNumber == null or carNumber== ''}">style="display:none"</c:if>>
						<input type="hidden" name="cstSnb" id="cstSnb">
						<input type="hidden" name="tmDt" id="tmDt">
						<td class="cent bgRed pd0" style="width:73px">
							<span id="cardDate">&nbsp;</span>
							<div id='CaliCal0Icon' style="padding: 1px 2px 0 0; float: right;">
								<img id='CaliCal0IconImg' class='calImg' src='../images/calendar.gif'>
							</div>
							
							<input type="hidden" id="iCal0"/>
							<script>initCal({id:"iCal0",type:"day",today:"y"});</script>
						</td>
						<td class="cent bgRed" style="width:25px"></td>
						<td class="cent bgRed nameD"></td>
						<td class="cent bgRed" style="width:80px"><input class="w96 pd0" type="text" name="departurePoint" id="departurePoint"></td>
						<td class="cent bgRed nameD"><input class="w96 pd0 intNum" type="text" name="departureTime" id="departureTime" maxlength="4" onKeyPress="return numbersonly(event, false)"></td>
						<td class="cent bgRed" style="width:120px"><input class="w96 pd0" type="text" name="destination" id="destination"></td>
						<td class="cent bgRed nameD"><input class="w96 pd0 intNum" type="text" name="arriveTime" id="arriveTime" maxlength="4" onKeyPress="return numbersonly(event, false)"></td>
						<%-- <td class="cent bgRed"><input type="text" class="inputTime" name="estimatedTime" id="estimatedTime" maxlength="4" onKeyPress="return numbersonly(event, false)"></td> --%>
						<td class="cent bgRed" style="width:50px"><%-- <input class="w96 pd0 intNum" type="text" name="mileage" id="mileage" maxlength="5" onKeyPress="return numbersonly(event, false)"> --%></td>
						<td class="cent bgRed" style="width:50px"><input class="w96 pd0 intNum" type="text" name="totalDistance" id="totalDistance" maxlength="5" onKeyPress="return numbersonly(event, false)"></td>
						<td class="cent bgRed" id="sltFloor" style="width:75px">
							<select name="floor" id="floor">
								<option value="">-선택-</option>								
								<c:choose>
								<c:when test="${carNumber == '3308'}">
								<option value="여의도">여의도</option>
								<option value="지상(캠코)">지상(캠코)</option>
								<option value="B1(캠코)">B1(캠코)</option>
								<option value="B2(캠코)">B2(캠코)</option>
								<option value="B3(캠코)">B3(캠코)</option>
								<option value="B4(캠코)">B4(캠코)</option>
								<option value="B5(캠코)">B5(캠코)</option>
								<option value="B6(캠코)">B6(캠코)</option>
								<option value="B7(캠코)">B7(캠코)</option>
								</c:when>
								<c:otherwise>
								<option value="지상">지상</option>
								<option value="타워">타워</option>
								</c:otherwise>								
								</c:choose>
								
							</select>
						</td>
						<td class="cent bgRed companyName"><input class="w96 intNum" type="text" name="price" id="price" maxlength="7" onKeyPress="return numbersonly(event, false)"></td>
						<td class="cent bgRed"><input class="w96" type="text" name="note" id="note"></td>
						<td class="cent bgRed" style="width:120px;"><input type="checkbox" name="oil" value="Y">엔진오일&nbsp; <span class="btn s green"><a onclick="carSubmit()">저장</a></span></td>
					</tr>
 				
					<c:forEach var="carL" items="${carList}" varStatus="carStatus">
					<tr>
						<td class="cent pd0" style="width:73px">${fn:substring(carL.tmDt,0,10)}</td>
						<td class="cent" style="width:25px">
							<script>
								var weekends = getWeekday('${fn:substring(carL.tmDt,0,10)}');
								if(weekends == '토') 	weekends = "<font color='blue'>"+weekends+"</font>";
								else if(weekends == '일') 	weekends = "<font color='red'>"+weekends+"</font>";
								document.write(weekends);
							</script>
						</td>
						<td class="cent nameD" <c:if test="${carNumber != null and carNumber != ''}">style="display:none"</c:if>>${carL.carNum}</td>
						<td class="cent nameD">${carL.staffNm}</td>
						<td class="cent" style="width:80px">${carL.departurePoint}</td>
						<td class="cent nameD">${carL.departureTime}</td>
						<td class="cent" style="width:120px">${carL.destination}</td>
						<td class="cent nameD">${carL.arriveTime}</td>
						<%-- <td class="cent">${carL.estimatedTime}</td> --%>
						<td class="cent driveT${carL.carNum}" style="width:50px"><%-- ${carL.mileage} --%></td>
						<td class="cent" style="width:50px">${carL.totalDistance}</td>
						<td class="cent" style="width:75px">${carL.floor}</td>
						<td class="rgt companyName"><small><nobr>
							<c:if test="${carL.price != 0}">
							<c:choose>
								<c:when test="${fn:length(carL.price) > 6}">
									${fn:substring(carL.price, 0,(fn:length(carL.price)-6))},${fn:substring(carL.price, (fn:length(carL.price)-6),(fn:length(carL.price)-3))},${fn:substring(carL.price, (fn:length(carL.price)-3),fn:length(carL.price))}
								</c:when>
								 <c:when test="${fn:length(carL.price) < 7 && fn:length(carL.price) > 3}">
									${fn:substring(carL.price, 0,(fn:length(carL.price)-3))},${fn:substring(carL.price, (fn:length(carL.price)-3),fn:length(carL.price))}
								</c:when> 
								<c:otherwise>
									${carL.price}
								</c:otherwise>
							</c:choose>원</c:if></nobr>
						</small></td>
						<td class="cent" colspan="2">${carL.note}
							<%-- 입력한 당일만 삭제 가능하게 작업 --%>
							<fmt:parseDate var="parseDate" value="${carL.rgDt}" pattern="yyyy-MM-dd" scope="page"/>
							<fmt:formatDate var="rgDate" value="${parseDate}" pattern="yyyy-MM-dd"/>
							<c:if test="${(userLoginInfo.id == carL.rgId) and (cur_day == rgDate)}"><span class="hand" onclick="javascript:deleteCarInfo('${carL.sNb }')"><img src="<c:url value='/images/recommend/delete.png'/>" title="삭제" align="absmiddle"/></span></c:if>
						</td>
					<script>
					<!-- $('.driveT:last').parent().prev().find('[class*=driveT]').html('${prevTotalDistance - carL.totalDistance}'); -->
					var distance=0;
					switch(${carL.carNum}){
					case 6334: 
						distance = '${prevTotalDistance1 - carL.totalDistance}';
						break;
					case 8213: 
						distance = '${prevTotalDistance2 - carL.totalDistance}';
						break;
					case 9384: 
						distance = '${prevTotalDistance3 - carL.totalDistance}';
						break;
					case 9559: 
						distance = '${prevTotalDistance4 - carL.totalDistance}';
						break;
					}
					$('.driveT${carL.carNum}:eq(-2)').html(distance);
					</script>
					</tr>
					<c:if test="${carL.carNum eq 6334}"><c:set var="prevTotalDistance1" value="${carL.totalDistance}"/></c:if>
					<c:if test="${carL.carNum eq 8213}"><c:set var="prevTotalDistance2" value="${carL.totalDistance}"/></c:if>
					<c:if test="${carL.carNum eq 9384}"><c:set var="prevTotalDistance3" value="${carL.totalDistance}"/></c:if>
					<c:if test="${carL.carNum eq 9559}"><c:set var="prevTotalDistance4" value="${carL.totalDistance}"/></c:if>
					</c:forEach>
				
				</tbody>
			</form>
			</table>
						
		</article>
	</section>
</div>
<div class="clear"></div>
</body>
</html>