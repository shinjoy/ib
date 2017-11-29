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
		location.href ="<c:url value='Tardiness.do' />";
	}
	$("tr:even").css("background-color", "#E0F8F7");
	
	$(document).on("change","#slct_year", function(){
		 var frm = document.modifyRec;
		 frm.submit();
	});
});
	function insertPersonnelDatas(){
		var objClass = $('.viewPersonnel');
		var objF = $('.viewPersonnel:first');
		var total = 0;
		var objId = objF.attr("id");
		var arr = objId.split("_");
		var tmp = arr[0];
		var cnt = 1;
		var vacaDay = 0;

		for(var i=0;i<objClass.length;i++){
			objId = objF.attr("id");
			var objVal = $('#'+objId).val();
			arr = objId.split("_");

			$('#'+arr[0]+"_view_"+arr[2]).html(objVal);
			objF = objF.next();

			if(tmp!=arr[0]){
				$('#'+tmp+"_total").html(parseInt(total));
				vacaDay = parseFloat(parseInt(total/2)*0.5);
				$('#'+tmp+"_totDay").html(vacaDay);
				total=0;
				cnt=1;
			}else{ if(arr[2]!=0)cnt++; }

			total = parseFloat(total) + parseFloat(objVal);
			tmp = arr[0];
		}
		$('#'+tmp+"_total").html(parseInt(total));
		vacaDay = parseFloat(parseInt(total/2)*0.5);
		$('#'+tmp+"_totDay").html(vacaDay);
	}
	
	function insertPenaltyData(){
		var objClass = $('.viewPenalty');
		var objF = $('.viewPenalty:first');

		for(var i=0;i<objClass.length;i++){
			var objId = objF.attr("id");
			var objVal = $('#'+objId).val();
			var arr = objId.split("_");

			$('#'+arr[0]+"_vaca").html(objVal);
			objF = objF.next();
		}
	}
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

	<c:set var="now" value="<%= new java.util.Date() %>"/>
	<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
	<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
	<fmt:formatDate var="cur_month" value='${now}' pattern='MM'/>
		
	<section>
		<article <%-- style="padding-top:35px;" --%>>
			<table class="t_skin05 t_skin05width">
				<thead>
					<form name="modifyRec" method="get" action="<c:url value='/personnel/Tardiness.do' />">
					<input type="hidden" name="choice_month" id="choice_month"/>
					<tr><th colspan="20" class="bgYlw">
							<%-- ${choice_year} --%>
							<select id='slct_year' name="choice_year">
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
							년 지각/페널티&nbsp;</th></tr>
					</form>				
					<tr>
						<th rowspan="2" class="bgYlw">구분</th>
						<th colspan="12" class="bgYlw">${choice_year}년 월별 지각 횟수</th>
						<th rowspan="2" class="bgYlw">총지각</th>
						<th rowspan="2" class="bgYlw">휴가<br/>차감 일수</th>
						<th rowspan="2" class="bgYlw">반차/휴가<br/>위반 횟수</th>
						<th rowspan="2" class="bgYlw">경고횟수</th>
					</tr>
					<tr>
					<c:forEach var="cnt" begin="1" end="12">
						<th class="bgYlw"><span class="btn s black"><a onclick="month('${cnt}','monthTardiness.do')">${cnt}</a></span></th>
					</c:forEach>
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
				
				<tbody>
					<c:forEach var="staff" items="${userList}" varStatus="stfStatus">
						<tr>
							<td class="cent <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>">${staff.usrNm}</td>
							
							<c:set var="sumD" value="0"/>
							<c:forEach var="day" begin="1" end="12" varStatus="dayStatus">
								<td id="${staff.sNb}_view_${dayStatus.count}" class="cent <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>"></td>
							</c:forEach>
							<c:set var="Scount" value="${Tcount }"/>
							<td id="${staff.sNb}_total" class="cent bold <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>"></td>
							<td id="${staff.sNb}_totDay" class="cent bold <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>"></td>
							<td id="${staff.sNb}_vaca" class="cent bold <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>"></td>
							<td id="${staff.sNb}_warn" class="cent bold <c:if test="${staff.usrId==userLoginInfo.id}">bgGrn</c:if>">
								<c:choose><c:when test="${userLoginInfo.permission == '00002' || userLoginInfo.permission > '00020'}">
								<select><c:forEach var="warn" begin="0" end="3">
									<option value="${warn}">${warn}</option></c:forEach>
								</select>
								</c:when><c:otherwise></c:otherwise></c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			지각 2회시 연차에서 0.5일 자동 차감
			
		<c:forEach var="YearList" items="${tardinessList }" varStatus="monStatus">
			<input type="hidden" class="viewPersonnel" id="${YearList.staffId}_data_${YearList.tmDt}" value="${YearList.holiday}">
		</c:forEach>
			
			<c:forEach var="staff" items="${penaltyList}" varStatus="stfStatus">
				<input type="hidden" class="viewPenalty" id="${staff.staffId}_penalty" value="${staff.tmpNum1}/${staff.holiday}">
			</c:forEach><c:if test="${not empty penaltyList }"><script>insertPenaltyData();</script></c:if>
			
			<c:forEach var="staff" items="${userList}" varStatus="stfStatus">
				<input type="hidden" name="pDay1" id="${staff.sNb}_overH" >
				<input type="hidden" name="pDay2" value="${staff.sNb}">
			</c:forEach><c:if test="${not empty tardinessList }"><script>insertPersonnelDatas();</script></c:if>
		</article>
	</section>
</div>
</body>
</html>