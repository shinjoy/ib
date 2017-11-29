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
	if('<c:out value='${saveCnt}'/>' > 0 ) {
		location.href ="<c:url value='index.do' />";
	}
	$("tr:odd").css("background-color", "#E0F8F7");
	
	insertPersonnelData();

});
</script>
</head>
<body>
<div id="wrap">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
	
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">

	<header>
		<form name="modifyRec" method="post">
		<div class="year_wrap">
		
			<c:set var="now" value="<%= new java.util.Date() %>"/>
			<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
			<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
			<fmt:formatDate var="cur_date" value='${now}' pattern='dd'/>
			
			<input type="hidden" id="choice_month" name="choice_month" value="${choice_month}">
			
			<span class="year">
				<select id='choice_year' name='choice_year'>
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
			 
			
			<a <c:if test="${choice_month == '01' }">class="red bold"</c:if> onclick="month('01','monthIndex.do')">1월</a><span> | </span>
			<a <c:if test="${choice_month == '02' }">class="red bold"</c:if> onclick="month('02','monthIndex.do')">2월</a><span> | </span>
			<a <c:if test="${choice_month == '03' }">class="red bold"</c:if> onclick="month('03','monthIndex.do')">3월</a><span> | </span>
			<a <c:if test="${choice_month == '04' }">class="red bold"</c:if> onclick="month('04','monthIndex.do')">4월</a><span> | </span>
			<a <c:if test="${choice_month == '05' }">class="red bold"</c:if> onclick="month('05','monthIndex.do')">5월</a><span> | </span>
			<a <c:if test="${choice_month == '06' }">class="red bold"</c:if> onclick="month('06','monthIndex.do')">6월</a><span> | </span>
			<a <c:if test="${choice_month == '07' }">class="red bold"</c:if> onclick="month('07','monthIndex.do')">7월</a><span> | </span>
			<a <c:if test="${choice_month == '08' }">class="red bold"</c:if> onclick="month('08','monthIndex.do')">8월</a><span> | </span>
			<a <c:if test="${choice_month == '09' }">class="red bold"</c:if> onclick="month('09','monthIndex.do')">9월</a><span> | </span>
			<a <c:if test="${choice_month == '10' }">class="red bold"</c:if> onclick="month('10','monthIndex.do')">10월</a><span> | </span>
			<a <c:if test="${choice_month == '11' }">class="red bold"</c:if> onclick="month('11','monthIndex.do')">11월</a><span> | </span>
			<a <c:if test="${choice_month == '12' }">class="red bold"</c:if> onclick="month('12','monthIndex.do')">12월</a>
		</div>
		</form>
	</header>
	<section>
		<article style="padding-top:35px;">
			<table class="t_skinR00 t_skin05width">
				<thead>
					<tr>
						<th class="nameD bgYlw">${choice_month}월</th>
						<c:forEach var="cnt" begin="1" end="${last_day }">
							<c:set var="substr"><c:if test="${cnt < 10}">0</c:if>${cnt}</c:set>
							<c:set var="date_cnt" value="${choice_year}-${choice_month}-${substr}"/>
							<th class="bgYlw <c:if test="${date_cnt==cur_day}">bgRed</c:if>">${cnt}</th>
						</c:forEach>
						
						<th rowspan="2" class="bgYlw">지각</th>
						<th rowspan="2" class="bgYlw">합계</th>
					</tr>
					
					<tr>
						<th class="bgYlw">요일</th>
						
						<c:forEach var="cnt" begin="1" end="${last_day }">
						<c:set var="substr"><c:if test="${cnt < 10}">0</c:if>${cnt}</c:set>
						<c:set var="date_cnt" value="${choice_year}-${choice_month}-${substr}"/>
						
						<th class="bgYlw <c:if test="${date_cnt==cur_day}">bgRed</c:if>">
							<script>
								var weekends = getWeekday('${date_cnt}');
								if(weekends == '토') 	weekends = "<font color='blue'>"+weekends+"</font>";
								else if(weekends == '일') 	weekends = "<font color='red'>"+weekends+"</font>";
								document.write(weekends);
							</script>
						</th>
						</c:forEach>
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
				
			<form name="insertCar" id="insertCar" method="post">
				<tbody>
					<c:forEach var="staff" items="${userList}" varStatus="usrStatus"><c:set var="JoinY" value="${fn:substring(staff.joinDt,0,4)}"/><c:set var="JoinM" value="${fn:substring(staff.joinDt,5,7)}"/>
					<c:if test="${(JoinY < choice_year) or (JoinY == choice_year and JoinM <= choice_month)}">
					<tr>
						<td class="bgYlw <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>">${staff.usrNm}</td>
						
						<c:forEach var="day" begin="1" end="${last_day }" varStatus="dayStatus">
						<c:set var="substr"><c:if test="${day < 10}">0</c:if>${day}</c:set>
						<c:set var="date_cnt" value="${choice_year}-${choice_month}-${substr}"/>
							<td id="${staff.sNb}_view_${dayStatus.count}" class="cent <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if> <c:if test="${date_cnt==cur_day}">bgRed</c:if>"></td>
						</c:forEach>
							
						<td class="cent <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>" id="${staff.sNb}_late">&nbsp;</td>
						<td class="cent <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>" id="${staff.sNb}_sum">&nbsp;</td>
					</tr>
					</c:if>
					</c:forEach>
				</tbody>
			</form>
			</table>
			
		<c:forEach var="MonList" items="${personnelMonthList }" varStatus="monStatus">
			<input type="hidden" class="viewPersonnel" id="${MonList.staffId}_data_${MonList.tmDt}" value="${MonList.holiday}">
			<c:if test="${MonList.penalty =='Y'}"><script>$('#${MonList.staffId}_view_${MonList.tmDt}').addClass('bgOrg');</script></c:if>
		</c:forEach>
						
		</article>
	</section>
</div>
</body>
</html>