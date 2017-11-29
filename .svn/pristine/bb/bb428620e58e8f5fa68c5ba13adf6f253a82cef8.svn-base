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
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<body>
<div id="wrap">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
	
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">

	<header>
		<form name="modifyRec" method="get">
		<div class="year_wrap" style="display:none">
		
			<c:set var="now" value="<%= new java.util.Date() %>"/>
			<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
			<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
			<fmt:formatDate var="cur_month" value='${now}' pattern='MM'/>
			
			<input type="hidden" id="choice_month" name="choice_month" value="${cardVO.choice_month}">

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
			 
			
			<a onclick="month('01','monthIndex.do')">1월</a><span> | </span>
			<a onclick="month('02','monthIndex.do')">2월</a><span> | </span>
			<a onclick="month('03','monthIndex.do')">3월</a><span> | </span>
			<a onclick="month('04','monthIndex.do')">4월</a><span> | </span>
			<a onclick="month('05','monthIndex.do')">5월</a><span> | </span>
			<a onclick="month('06','monthIndex.do')">6월</a><span> | </span>
			<a onclick="month('07','monthIndex.do')">7월</a><span> | </span>
			<a onclick="month('08','monthIndex.do')">8월</a><span> | </span>
			<a onclick="month('09','monthIndex.do')">9월</a><span> | </span>
			<a onclick="month('10','monthIndex.do')">10월</a><span> | </span>
			<a onclick="month('11','monthIndex.do')">11월</a><span> | </span>
			<a onclick="month('12','monthIndex.do')">12월</a>
		</div>
		</form>
		
	</header>
	<section>
		<article <%-- style="padding-top:35px;" --%>>
			<table class="t_skinR00 t_skin05width">
				<thead>
					<tr><th colspan="20" class="bgYlw">
							<%-- ${choice_year} --%>
							<select id='select_year'>
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
							년 휴가계획&nbsp;</th></tr>
					<tr>
						<th rowspan="2" class="bgYlw">구분</th>
						<th rowspan="2" class="bgYlw">입사일</th>
						<th rowspan="2" class="bgYlw">기본<br/>연차</th>
						<th rowspan="2" class="bgYlw">근속연수<br/>연차</th>
						<th rowspan="2" class="bgYlw">땡겨씀</th>
						<th rowspan="2" class="bgYlw">제공<br/>휴가</th>
						<th colspan="12" class="bgYlw">${choice_year}년 월별 사용/계획 일정</th>
						<th rowspan="2" class="bgYlw">사용 /<br/>계획<br/>일수</th>
						<th rowspan="2" class="bgYlw">잔여<br/>일수</th>
					</tr>
					<tr>
					<c:forEach var="cnt" begin="1" end="12">
						<th class="bgYlw"><span class="btn s black"><a onclick="month('${cnt}','monthIndex.do')">${cnt}</a></span></th>
					</c:forEach>
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
				
				<tbody>
					<c:forEach var="staff" items="${userList}" varStatus="stfStatus">
						<c:set var="stndY" value="${choice_year - fn:substring(staff.joinDt,0,4)}"/>
						<c:if test="${stndY >  0 }">
							<c:set var="stndY" value="15"/>
							<c:set var="stadM" value="0"/>
						</c:if>
						<c:if test="${stndY == 0 and choice_year == cur_year}">
							<c:set var="stndY" value="0" />
							<c:set var="stadM" value="${cur_month - fn:substring(staff.joinDt,5,7) }"/>
							<c:if test="${fn:substring(staff.joinDt,8,10)<16 }">
								<c:set var="stadM" value="${cur_month - fn:substring(staff.joinDt,5,7) +1 }"/>
							</c:if>
						</c:if>
						<c:if test="${stndY == 0 and choice_year != cur_year}">
							<c:set var="stndY" value="0" />
							<c:set var="stadM" value="${12 - fn:substring(staff.joinDt,5,7) }"/>
							<c:if test="${fn:substring(staff.joinDt,8,10)<16 }">
								<c:set var="stadM" value="${12 - fn:substring(staff.joinDt,5,7) +1 }"/>
							</c:if>
						</c:if>
						<c:if test="${stndY < 0 }">
							<c:set var="stndY" value="0"/>
							<c:set var="stadM" value="0"/>
						</c:if>
						
						<c:set var="longY" value="${((choice_year - fn:substring(staff.joinDt,0,4) + (((12-fn:substring(staff.joinDt,5,7))<0)?-1:0))/3)}"/>
						<c:if test="${longY < 0 }"><c:set var="longY" value="0"/></c:if>
						<fmt:formatNumber var="longY" value="${longY - (longY%1) }" maxFractionDigits="0"/>
						<c:if test="${fn:substring(staff.joinDt,0,4) <= choice_year}">
							<tr>
								<td class="cent <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>">${staff.usrNm}</td>
								<td class="cent <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>">${fn:substring(staff.joinDt,0,10)}</td>
								<td class="cent <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>"><c:if test="${stndY >0}">${stndY  }</c:if></td>
								<td class="cent <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>"><c:if test="${longY >0}">${longY }</c:if></td>
								<td class="cent <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>" id="${staff.sNb}_passYear"></td>
								<td class="cent bold <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>" id="${staff.sNb}_supHol">${stndY + longY + stadM }</td>
								
								<c:set var="sumD" value="0"/>
								<c:forEach var="day" begin="1" end="12" varStatus="dayStatus">
									<td id="${staff.sNb}_view_${dayStatus.count}" class="cent <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>"></td>
								</c:forEach>
								<c:set var="Scount" value="${Tcount }"/>
								<td id="${staff.sNb}_sum" class="cent bold <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>"></td>
								<td id="${staff.sNb}_total" class="cent bold <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>">${stndY + longY + stadM }</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			<table <c:if test="${userLoginInfo.permission != '00021' and userLoginInfo.permission != '00002'}">style="display:none;"</c:if>>
				<tr><td class="cent pd0"><span class="btn green s saveOverH"><a>마이너스 잔여일수 → ${choice_year+1}년 땡겨씀으로..</a></span></td></tr>
			</table>

			근속연수연차 : 만 3년 근무당 1개씩 생성
			<br/>월차 : 1년미만 근무자에게 1개월 개근시 1일 부여<br/>
			
		<c:forEach var="YearList" items="${personnelYearList }" varStatus="monStatus">
			<input type="hidden" class="viewPersonnel" id="${YearList.staffId}_data_${YearList.tmDt}" value="${YearList.holiday}">
		</c:forEach>
			
		<c:forEach var="PassList" items="${passList }" varStatus="passStatus">
			<input type="hidden" class="viewPass" id="${PassList.staffId}_pass" value="${PassList.holiday}">
		</c:forEach>

		<form id="overUsed" name="overUsed" action="" method="post">	
			<c:forEach var="staff" items="${userList}" varStatus="stfStatus">
				<input type="hidden" name="pDay1" id="${staff.sNb}_overH" >
				<input type="hidden" name="pDay2" value="${staff.sNb}">
			</c:forEach>
			<input type="hidden" name="choice_year" value="${choice_year}">
		</form>
		</article>
	</section>
</div>
</body>
</html>