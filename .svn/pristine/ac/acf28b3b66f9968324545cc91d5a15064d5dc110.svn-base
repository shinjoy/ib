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

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script>
$(document).ready(function(){
	if('<c:out value='${saveCnt}'/>' > 0 ) {
		location.href ="<c:url value='index.do' />";
	}
	$("tr:even").css("background-color", "#E0F8F7");

	insertModifyPagePersonnelData();
});
</script>
</head>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<body>

<c:if test="${userLoginInfo.permission == '00021' or userLoginInfo.permission == '00002'}">

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
			 
			
			<a <c:if test="${choice_month == '01' }">class="red bold"</c:if> onclick="month('01','modifyTardiness.do')">1월</a><span> | </span>
			<a <c:if test="${choice_month == '02' }">class="red bold"</c:if> onclick="month('02','modifyTardiness.do')">2월</a><span> | </span>
			<a <c:if test="${choice_month == '03' }">class="red bold"</c:if> onclick="month('03','modifyTardiness.do')">3월</a><span> | </span>
			<a <c:if test="${choice_month == '04' }">class="red bold"</c:if> onclick="month('04','modifyTardiness.do')">4월</a><span> | </span>
			<a <c:if test="${choice_month == '05' }">class="red bold"</c:if> onclick="month('05','modifyTardiness.do')">5월</a><span> | </span>
			<a <c:if test="${choice_month == '06' }">class="red bold"</c:if> onclick="month('06','modifyTardiness.do')">6월</a><span> | </span>
			<a <c:if test="${choice_month == '07' }">class="red bold"</c:if> onclick="month('07','modifyTardiness.do')">7월</a><span> | </span>
			<a <c:if test="${choice_month == '08' }">class="red bold"</c:if> onclick="month('08','modifyTardiness.do')">8월</a><span> | </span>
			<a <c:if test="${choice_month == '09' }">class="red bold"</c:if> onclick="month('09','modifyTardiness.do')">9월</a><span> | </span>
			<a <c:if test="${choice_month == '10' }">class="red bold"</c:if> onclick="month('10','modifyTardiness.do')">10월</a><span> | </span>
			<a <c:if test="${choice_month == '11' }">class="red bold"</c:if> onclick="month('11','modifyTardiness.do')">11월</a><span> | </span>
			<a <c:if test="${choice_month == '12' }">class="red bold"</c:if> onclick="month('12','modifyTardiness.do')">12월</a>
		</div>
		</form>
	</header>
	<section>
		<article style="padding-top:35px;">
			<table class="t_skin05 t_skin05width">
				<thead>
					<tr>
						<th class="nameD bgYlw">${choice_month}월</th>
						
						<c:forEach var="cnt" begin="1" end="${last_day }">
							<c:set var="substr"><c:if test="${cnt < 10}">0</c:if>${cnt}</c:set>
							<c:set var="date_cnt" value="${choice_year}-${choice_month}-${substr}"/>
							<th class="bgYlw <c:if test="${date_cnt==cur_day}">bgRed</c:if>">${cnt}</th>
						</c:forEach>
						
						<th class="bgYlw" rowspan="2">합계</th>
						<th class="bgYlw" rowspan="2">총합계</th>
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
				
				
				
			
				<form name="insertPersonnel" id="personnel" method="post">
				<input type="hidden" id="choice_mon" name="choice_month" value="${choice_month}">
				<input type="hidden" id="choice_ye" name="choice_year" value="${choice_year}">
				<input type="hidden" name="flagHt" value="1">
				<tbody>
					<c:forEach var="staff" items="${userList}" varStatus="usrStatus"><c:set var="JoinY" value="${fn:substring(staff.joinDt,0,4)}"/><c:set var="JoinM" value="${fn:substring(staff.joinDt,5,7)}"/>
					<c:if test="${(JoinY < choice_year) or (JoinY == choice_year and JoinM <= choice_month)}">
					<tr>
						<td class="bgYlw">${staff.usrNm}</td>
						<input type="hidden" name="sTafF" value="${staff.sNb}"/>
						<c:forEach var="day" begin="1" end="${last_day }" varStatus="dayStatus">
							<td id="${staff.sNb}_view_${dayStatus.count}" class="cent pd0 D${dayStatus.count}">
								<input class="cent bd0 pd0 bgClr intNum" type="text" name="pDay${staff.sNb }" style="width:32px;" maxlength="4" onKeyPress="return numbersonly(event, false)"/>
							</td>
						</c:forEach>
							
						<input type="hidden" name="pDay${staff.sNb }" value=""/>
							
						<td class="cent pd0" id="${staff.sNb}_sumCnt"></td>
						<td class="cent pd0" id="${staff.sNb}_totSumCnt"></td>

					</tr>
					</c:if>
					</c:forEach>
					<table>
						<tr><td>네자리로 (9시정각)<b>0900</b>,  (10시5분)<b>1005</b> 등으로 입력해주세요</td></tr>
						<tr><td>기존에 있던 값을 삭제하기 위해서는 <b>0</b> 을 입력하고 저장합니다.</td></tr>
					</table>
					<table>
						<tr><td class="cent pd0"><span class="btn green s savePersonnel"><a><spring:message code="button.save" /></a></span></td></tr>
					</table>
					
					<c:forEach var="MonList" items="${personnelMonthList }" varStatus="monStatus">
						<input type="hidden" class="viewPersonnel" id="${MonList.staffId}_data_${MonList.tmDt}" value="${MonList.holiday}">
					</c:forEach>

					<c:forEach var="totTrad" items="${totalTradiness }" varStatus="totStatus">
						<input type="hidden" class="viewTotalTrad" id="${totTrad.staffId}_tot_${totTrad.tmDt}" value="${totTrad.holiday}">
					</c:forEach>
						
				</tbody>
				</form>
			</table>
						
		</article>
	</section>
</div>
</c:if>

</body>
</html>