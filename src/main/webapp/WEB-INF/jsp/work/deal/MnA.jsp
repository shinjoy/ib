<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!-- 진행사항 -->
<div>

	<c:forEach var="comment" items="${commentList}">
		<div class="popUpMenu title_area" id="commentPr${comment.sNb}">
			<input type="hidden" id="commentSNb${comment.sNb}" value="${comment.sNb }">
			<p class="closePopUpMenu">ⅹ닫기</p>
			<ul>
				<li>
					<input type="hidden" id="TMP${comment.sNb}"/>
					<input type="hidden" id="AP_cpnId${comment.sNb}" value="${workVO.cpnId }"/>
					<input type="hidden" id="AP_cstId${comment.sNb}" value="${workVO.cstId }"/>
					${comment.tmDt}
					&nbsp;회사: <a onclick="popUp('${comment.sNb}','c')" id="AP_cpnNm_${comment.sNb}" class="c_title" title="회사수정">${comment.cpnNm}</a>
					&nbsp;사람: <a onclick="popUp('${comment.sNb}','p')" id="AP_cstNm${comment.sNb}" class="c_title" title="이름수정">${comment.cstNm}</a>
					&nbsp;&nbsp;
					<select id='progressCd${comment.sNb}'>
						<c:forEach var="cmmCd" items="${cmmCdProgressList}">
							<option value="${cmmCd.dTailCd}" <c:if test="${comment.progressCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
						</c:forEach>
					</select>
				</li>
				<li class="c_note"><textarea id="commentarea${cnt}" placeholder="메모를 입력하세요."></textarea></li>
			</ul>
 			
			<p class="bsnsR_btn">
				<span class="mna_btnOk btn s green"><a><spring:message code="button.save" /></a></span>&nbsp;&nbsp;&nbsp;
				<!-- <span class="memo_btnDel">완전삭제</span> -->
			</p>
			
		</div>
	</c:forEach>

	<c:forEach var="cnt" begin="1" end="5">
		<div class="popUpMenu title_area" id="commentPrN${cnt}">
			<input type="hidden" id="commentSNb${cnt}">
			<p class="closePopUpMenu">ⅹ닫기</p>
			<ul>
				<li>
					<input type="hidden" id="TMPN${cnt}"/>
					<input type="hidden" id="AP_cpnIdN${cnt}" value="${workVO.cpnId }"/>
					<input type="hidden" id="AP_cstIdN${cnt}" value="${workVO.cstId }"/>
					&nbsp;회사: <a onclick="popUp('N${cnt}','c')" id="AP_cpnNm_N${cnt}" class="c_title" title="회사수정">회사선택</a>
					&nbsp;사람: <a onclick="popUp('N${cnt}','p')" id="AP_cstNmN${cnt}" class="c_title" title="이름수정">이름선택</a>
					&nbsp;&nbsp;
					<select id='progressCd${cnt}'>
						<c:forEach var="cmmCd" items="${cmmCdProgressList}">
							<option value="${cmmCd.dTailCd}">${cmmCd.cdNm}</option>
						</c:forEach>
					</select>
				</li>
				<li class="c_note"><textarea id="commentarea${cnt}" placeholder="메모를 입력하세요."></textarea></li>
			</ul>
			<p class="bsnsR_btn">
				<span class="mna_btnOk btn s green"><a><spring:message code="button.save" /></a></span>&nbsp;&nbsp;&nbsp;
				<!-- <span class="bsnsR_btnDel">완전삭제</span> -->
			</p>
		</div>
	</c:forEach>


</div>
<!-- 진행사항 -->

<!-- 메모 -->
<div>
	<c:forEach var="offer" items="${offerList}" varStatus="status">
	
		<div class="popUpMenu title_area" id="memoPr${offer.sNb}">
		<c:choose>
			<c:when test="${userLoginInfo.name==offer.rgNm}"> 
				<input type="hidden" id="dealMemoSNb${offer.sNb}" value="${offer.sNb }">
				<p class="closePopUpMenu">ⅹ닫기</p>
				<ul>
					<c:choose>
						<c:when test="${empty offer.memo}">
						<li class="c_note"><textarea id="memoarea0" placeholder="메모를 입력하세요."></textarea></li>
						</c:when>
						<c:otherwise>
						<li class="c_note"><textarea id="memoarea${offer.sNb}">${offer.memo}</textarea></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<p class="bsnsR_btn">
					<span class="dealMemo_btnOk btn s green"><a><spring:message code="button.save" /></a></span>&nbsp;&nbsp;&nbsp;
					<!-- <span class="dealMemo_btnDel">완전삭제</span> -->
				</p>
			</c:when>
		
			<c:otherwise>
				<input type="hidden" id="memoSNb${offer.sNb}" value="${offer.sNb }">
				<p class="closePopUpMenu">ⅹ닫기</p>
				<ul>
					<li class="c_note">${fn:replace(offer.memo, lf,"<br/>")}</li>
				</ul>
			</c:otherwise>
		</c:choose>
		</div>
		
	</c:forEach>

</div>
<!-- 메모 -->

	<header>
		<h1>M&A / 신사업</h1>
	</header>
	<section>
		<article>
		
		<c:set var="now" value="<%= new java.util.Date() %>"/>
		<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
		
		<form name="modifyRec" action="<c:url value='/work/selectWorkMnA.do' />" method="post"></form>
		<input type="hidden" id="SendReceive" value="M">
		
			<table class="t_skin03">
				<thead>
					<tr>
						<th rowspan="2">등록일</th>
						<th colspan="3">제안자</th>
						<th rowspan="2">제안받은자</th>
						<th rowspan="2">물건</br>(회사명)</th>
						<th rowspan="2">발행규모</th>
						<th rowspan="2">결정기한</th>
						<th rowspan="2">결정</th>
						<th rowspan="2" colspan="5">진행사항</th>
						<th rowspan="2">메모</th>
					</tr>
					<tr>
						<th>회사</th>
						<th>이름</th>
						<th>소속/직급</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="offer" items="${offerList}" varStatus="status">
						<c:choose>
							<c:when test="${offer.progressCd == '10000'}"><tr style="background-color:#B9B9B9"> </c:when>
							<c:otherwise><tr<c:if test="${fn:length(offer.cpnId) == 7}"> style="background-color:#CEF6EC"</c:if>></c:otherwise>
						</c:choose>
							<input type="hidden" id="offerSnb${status.count}" value="${offer.sNb}">
							<input type="hidden" id="offerTmDt${status.count}" value="${offer.tmDt}">
							<td class="cent">${offer.tmDt}</td>
							<td class="cent">${offer.cstCpnNm}</td>
							<td class="cent">${offer.cstNm}</td>
							<td class="cent">${offer.position}</td>
							<td class="cent">${offer.rgNm}</td>
							<td class="cent">${offer.cpnNm}</td>
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
								<select id='progressCd' name='progressCd' <c:if test="${userLoginInfo.name!=offer.rgNm}">disabled="disabled"</c:if>>
									<c:forEach var="cmmCd" items="${cmmCdDecisionList}">
										<option value="${cmmCd.dTailCd}" <c:if test="${offer.progressCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
									</c:forEach>
								</select>
							</td>
							
							<c:set var="c_comment" value="0"/>
							<c:forEach var="comment" items="${commentList}">
								<c:if test="${offer.sNb == comment.offerId}">
									<c:set var="c_comment" value="${c_comment + 1}"/>
									<c:forEach var="cmmCd" items="${cmmCdProgressList}">
										<c:if test="${comment.progressCd == cmmCd.dTailCd}">
											<td class="cent"><a class="comment_m" id="comment_${comment.sNb}_${status.count}">${cmmCd.cdNm}</a></td>
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
							
							<c:forEach var="cnt" begin="${1 + c_comment}" end="5">
								<td class="cent"><a class="comment_m" id="comment_N${cnt}_${status.count}">----</a></td>
							</c:forEach>
							
							<td>
								<a class="memo_m" id="memo_${offer.sNb}">
								<c:choose>
									<c:when test="${empty offer.memo}">
									<font style="color:gray">메모를 입력하세요.</font>
									</c:when>
									<c:otherwise>
									${fn:substring(offer.memo,0,6)}<c:if test="${fn:length(offer.memo) > 6}">...</c:if>
									</c:otherwise>
								</c:choose>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</article>
	</section>
</div>
</body>
</html>