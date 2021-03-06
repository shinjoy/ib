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
<script type="text/JavaScript" src="<c:url value='/js/calendar_beans_v2.0.js'/>" ></script>
<script>
CalAddCss();
/*
	id		:텍스트박스Id   // *필수
	type	:day,mon	    // 둘중 하나입력		,기본값> 일달력 출력
	minYear :xxxx			// 최소년도 4자리 입력	,기본값> 2000
	maxYear :xxxx  			// 최대년도 4자리 입력	,기본값> 현재년도
	splitKey:'-','/'		// 달력 구분값        	,기본값> '-'
	todayYN :'y','n'		// today 표시         	,기본값> 안보여주기
	iconYN  :'y','n'		// 달력그림표시여부	  	,기본값> 안보여주기
	iconUrl :fullUrl 혹은 해당위치 상대경로 url'	,기본값> jquery 사이트 달력
 */
 $(document).ready(function(){

 });
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
	<section>
		<article>
		
		<c:set var="now" value="<%= new java.util.Date() %>"/>
		<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
		
		<form name="modifyRec" action="<c:url value='/work/selectWorkFund.do' />" method="post"><input type="hidden" name="sorting" id="sorting"><input type="hidden" id="tt1" name="total" value="${ttT}"></form>
		<input type="hidden" id="SendReceive" value="FD">
		
		<div class="fixed-top" style="z-index:10;">
		
			<header>
				<form name="dayForm" id="dayForm" method="post" action="<c:url value='/work/selectWorkFund.do' />">
				<input type="hidden" name="total" id="total">
				<div class="year_wrap" style="top:0px"><h2 class="headerTitle">
				
					<c:set var="now" value="<%= new java.util.Date() %>"/>
					<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
								
					<span class="year">
						<select id='deal_select_year' name='choice_year'>
							<c:forEach var="year" begin="2011" end="${cur_year}">
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
					<span class="btn s red"><a onclick="totalView('total');">전체</a></span>
				<%-- ${middleT}  --%>펀드현황</h2>
				</div>
				</form>
				<h2 class="headerTitle">&nbsp;</h2>
			</header>

			<table class="t_skinR00">
				<colgroup>
					<col width="74">
					<col width="57">
					<col width="112">
					<col width="57">
					<col width="57">
					<col width="112">
					<col width="62">
					<col width="56">
					<col width="84">
					<col width="82">
					<col width="">
				</colgroup>
				<thead>
					<tr>
<%-- 					
						<% String[] arr={"제안일자","제안자","제안받은자","회사명","제안유형","발행규모","기한","피드백","진행상황","성과","메모"}; request.setAttribute("array",arr); %>
						<c:forEach var="array" items="${array}" varStatus="status"><th id="input${status.count}">${array}</th></c:forEach>
 --%>						
						<th rowspan="2" onclick="sortTable();" class="hand">입력일자<br/>▼</th>
						<th rowspan="2" onclick="sortTable(1);" class="hand">소개자<br/>▼</th>
						<th colspan="2" class="">펀딩한 사람<small> (고객)</small></th>
						<th rowspan="2" onclick="sortTable(3);" class="hand">일임<br/>받은자<br/>▼</th>
						<th rowspan="2" class="">투자규모</th>
						<th rowspan="2" class="">기한</th>
						<th rowspan="2" class="">피드백</th>
						<th rowspan="2" class="">진행사항</th>
						<th rowspan="2" class="">성과</th>
						<th rowspan="2" class="">메모</th>
					</tr>
					<tr>
						<th class=" companyName">회사</th>
						<th onclick="sortTable(2);" class="hand">이름<br/>▼</th>
						<!-- <th class="">소속/직급</th> -->
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
			</table>
		</div>
		<div style="padding-top:108px;">
			<table class="t_skinR00">
				<colgroup>
					<col width="74">
					<col width="57">
					<col width="112">
					<col width="57">
					<col width="57">
					<col width="112">
					<col width="62">
					<col width="56">
					<col width="84">
					<col width="82">
					<col width="">
				</colgroup>
				<tbody>
					<c:forEach var="offer" items="${offerList}" varStatus="status">
						<tr 
							<c:choose>
								<c:when test="${offer.progressCd == '10000'}"> style="background-color:#B9B9B9" </c:when>
								<c:otherwise> <c:if test="${offer.progressCd == '00002'}">style="background-color:#E7E7E7"</c:if><c:if test="${offer.progressCd == '00003'}">style="background-color:#A9F5BC"</c:if></c:otherwise>
							</c:choose>
						>
							<td class="cent pd0"><nobr>${offer.tmDt}</nobr></td>
							<input type="hidden" id="offerSnb${status.count}" value="${offer.sNb}">
							<input type="hidden" id="cstSnb${status.count}" value="${offer.cstId}">
							<td class="cent" title="${offer.infoProviderCpnNm}">${offer.infoProviderNm}</td>
							<td class="cent">${offer.cstCpnNm}<c:if test="${empty offer.cstCpnNm}">${offer.cpnNm}</c:if></td>
							<td class="cent" title="${offer.position}">${offer.cstNm}</td>
							<%-- <td class="cent">${offer.position}</td> --%>
							<td class="cent">${offer.rgNm}</td>
							<td class="cent">${offer.price}</td>
							<td>
<!-- ------------------------------------------------ -->
							
<script type="text/javascript">

function get_day_max(year,month){
    var i = 29, cday;
    while(i<32){
        cday = new Date(year,month,i);
        if (cday.getFullYear()!=year || cday.getMonth()!=month) break;
        i++;
    }
    return i-1;
}
/* var due_date = document.getElementById("dueDt").value; */
var due_date = "${offer.dueDt}";
 
if(due_date != null){
	var n = due_date.split(" ");
	var d = n[0].split("-");
	// if( due_date.length >= 5 ) due_date = due_date.substr(0,3)+"..";
	var today = new Date();
	var c_y = today.getFullYear();
	var c_m = today.getMonth() + 1;
	var c_d = today.getDate();
	
	var c_year  = d[0] - c_y;
	
	var c_month = 0; 
		c_month = d[1] - c_m;
	
	var c_day = 0; 
	var day_max = 0; 
	var mm = (c_m-1);
	if( 0 == c_month ) {
		if( c_year == 0){
			c_day = d[2] - c_d;
		}else{
			for(var i=1;i<6;i++) {if(c_year == i ) c_month += (12*i)};
			for(var i=0;i<c_month;i++){
				if(mm+i < 1)  c_y++;
				day_max = get_day_max(c_y, mm+i);
				
				if(i==0) c_day = (day_max - c_d) + parseInt(d[2]);
				else c_day += day_max;
				
				if( 11 == mm+i ) mm = -(i+1);
			}
		}
	}else if( 0 > c_month ) {
		for(var i=1;i<6;i++) {if(c_year == i ) c_month += (12*i)};
		for(var i=0;i<c_month;i++){
			if(mm+i < 1)  c_y++;
			day_max = get_day_max(c_y, mm+i);
			
			if(i==0) c_day = (day_max - c_d) + parseInt(d[2]);
			else c_day += day_max;
			
			// alert(c_y+" : "+(mm+i+1)+" : "+day_max);
			
			if( 11 == mm+i ) mm = -(i+1);
		}
	} else {
		for(var i=1;i<6;i++) {if(c_year == i ) c_month += (12*i)};
		for(var i=0;i<c_month;i++){
			if(mm+i < 1)  c_y++;
			day_max = get_day_max(c_y, mm+i);
			
			if(i==0) c_day = (day_max - c_d) + parseInt(d[2]);
			else c_day += day_max;
			
			if( 11 == mm+i ) mm = -(i+1);
		}
	}
	// day_max = 0;
	
	
	/*
	if(0 != n[0] - c_y) c_year = c_year * 365;
	if(0 != n[1] - c_m) {
		for(var i=0;i<c_month;i++){
			day_max += get_day_max(c_y,c_m+(c_month-1));
		}
	}
	var c_day   = c_year + day_max + d[2] - c_d;
	*/
	
	if(d[0] != "1970") document.write("D "+c_day);
}
</script>						
							
							
							
<!-- ------------------------------------------------ -->
								<div id='CaliCal${status.count}Icon' style="float:right;padding-top:2px;">
									<img id='CaliCal${status.count}IconImg' class='calImg' src='../images/calendar.gif'>
								</div>
								
								<input type="text" id="iCal${status.count}" style="width:0px;border:0px none;background-color:transparent;visibility:hidden;"/>
								<script>initCal({id:"iCal${status.count}",type:"day",today:"y"});</script>
							</td>
							<td class="cent">
								<select id='feedback' name='feedback' <%-- <c:if test="${userLoginInfo.name!=offer.rgNm}">disabled="disabled"</c:if> --%>>
									<c:forEach var="cmmCd" items="${cmmCdFeedbackList}">
										<option value="${cmmCd.dTailCd}" <c:if test="${offer.feedback == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
									</c:forEach>
								</select>
							</td>
							<td class="cent">
								<select id='progressCd' name='progressCd' <%-- <c:if test="${userLoginInfo.name!=offer.rgNm}">disabled="disabled"</c:if> --%>>
									<c:forEach var="cmmCd" items="${cmmCdProgressList}">
										<option value="${cmmCd.dTailCd}" <c:if test="${offer.progressCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
									</c:forEach>
								</select><c:if test="${offer.jointCnt!=0}"><br/><a onclick="popUp('','supporter','','${offer.sNb}')"><b>공동 ${offer.jointCnt} 명</b></a></c:if>
							</td>
							<td>
								<a class="result_m" id="result_${offer.sNb}">
								<c:choose>
									<c:when test="${empty offer.result}"><small><font style="color:gray">성과...</font></small></c:when>
									<c:otherwise>${fn:substring(offer.result,0,18)}<c:if test="${fn:length(offer.result) > 18}">...</c:if></c:otherwise>
								</c:choose>
								</a>
							</td>
							<td>
								<a class="memo_m" id="memo_${offer.sNb}">
								<c:choose>
									<c:when test="${empty offer.memo}"><font style="color:gray">메모를 입력하세요.</font></c:when>
									<c:otherwise>${fn:substring(offer.memo,0,18)}<c:if test="${fn:length(offer.memo) > 18}">...</c:if></c:otherwise>
								</c:choose>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</article>
	</section>
<!-- 메모 -->
<div>
	<c:forEach var="offer" items="${offerList}" varStatus="status">
		<div class="popUpMenu title_area" id="memoPr${offer.sNb}" name="textR">
		<c:choose>
			<c:when test="${userLoginInfo.permission > '00019'  or userLoginInfo.name==offer.rgNm}"> 
				<input type="hidden" id="dealMemoSNb${offer.sNb}" value="${offer.sNb }">
				<input type="hidden" id="dealResultCstId${offer.cstId}" value="${offer.cstId }">
				<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
				<ul>
					<c:choose>
						<c:when test="${empty offer.memo}">
						<li class="c_note"><textarea id="memoarea0" placeholder="메모를 입력하세요."></textarea></li>
						</c:when>
						<c:otherwise>
						<li class="c_note"><textarea id="memoarea${offer.sNb}">${offer.memo}</textarea></li>
						</c:otherwise>
					</c:choose>
					<p class="bsnsR_btn">
						<span class="dealMemo_btnOk btn s green"><a><spring:message code="button.save" /></a></span>&nbsp;&nbsp;&nbsp;
						<!-- <span class="dealMemo_btnDel">완전삭제</span> -->
					</p>
				</ul>
			</c:when>
			<c:otherwise>
				<input type="hidden" id="memoSNb${offer.sNb}" value="${offer.sNb }">
				<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
				<ul>
					<li class="c_note v-textarea">${fn:replace(offer.memo, lf,"<br/>")}</li>
				</ul>
			</c:otherwise>
		</c:choose>
		</div>
	</c:forEach>

</div>
<!-- 메모 -->


<!-- 성과 -->
<div>
	<c:forEach var="offer" items="${offerList}" varStatus="status">
		<div class="popUpMenu title_area" id="resultPr${offer.sNb}" name="textR">
		<c:choose>
			<c:when test="${userLoginInfo.permission > '00019'  or  userLoginInfo.name==offer.rgNm}"> 
				<input type="hidden" id="dealResultSNb${offer.sNb}" value="${offer.sNb }">
				<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
				<ul>
					<c:choose>
						<c:when test="${empty offer.result}">
						<li class="c_note"><textarea id="resultarea0" placeholder="성과 내용을 입력하세요."></textarea></li>
						</c:when>
						<c:otherwise>
						<li class="c_note"><textarea id="resultarea${offer.sNb}">${offer.result}</textarea></li>
						</c:otherwise>
					</c:choose>
					<p class="bsnsR_btn">
						<span class="dealResult_btnOk btn s green"><a><spring:message code="button.save" /></a></span>&nbsp;&nbsp;&nbsp;
						<!-- <span class="dealResult_btnDel">완전삭제</span> -->
					</p>
				</ul>
			</c:when>
			<c:otherwise>
				<input type="hidden" id="resultSNb${offer.sNb}" value="${offer.sNb }">
				<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
				<ul>
					<li class="c_note v-textarea">${fn:replace(offer.result, lf,"<br/>")}</li>
				</ul>
			</c:otherwise>
		</c:choose>
		</div>
	</c:forEach>
</div>
<!-- 성과 -->

</div>
</body>
</html>