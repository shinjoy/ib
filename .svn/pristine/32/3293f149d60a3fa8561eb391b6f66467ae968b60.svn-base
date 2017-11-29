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
$(document).ready(function(){
	if('<c:out value='${saveCnt}'/>' > 0 ) {
		location.href ="<c:url value='index.do' />";
	}
	$(".dnTbl:even").css("background-color", "#E0F8F7");
		
});
</script>
<style>.year {padding-left: 5px;}</style>
</head>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<body>
<div id="wrap">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

		<!-- 메모   -->
			<c:forEach var="plan" items="${bsnsPlanList}" varStatus="planStatus">
			<div class="popUpMenu title_area" id="bsnsPmemo_${planStatus.count }" name="textR">
				<p class="closePopUpMenu" title="닫기">ⅹ닫기</p>
				<ul>
					<li class="c_note">${plan.note}</li>
				</ul>
			</div>
			</c:forEach>
		<!-- 메모   -->
	
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">

	<header>
		<form name="modifyRec" id="dayForm" method="post">
		<div class="year_wrap">
		
			<c:set var="now" value="<%= new java.util.Date() %>"/>
			<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
			<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
						
			<input type="hidden" id="choice_month" name="choice_month" value="${choice_month }"/>
			<input type="hidden" id="total" name="total"/>
			<input type="hidden" name="rgId" value="${sltId }"/>
			<input type="hidden" name="staffNm" value="${sltNm }"/>
			
			<span class="year">
				<select id='select_year2' name='choice_year'>
					<c:forEach var="year" begin="2012" end="${cur_year+2}">
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
		</div>
		</form>
	</header>
	<section>
		<article style="padding-top:35px;">
			
			<table class="t_skinR00 t_skin05width">
								<colgroup>
					<col width="100">
					<col width="100">
					<col width="320">
					<col width="320">
					<col width="20">
					<col width="20">
					<col width="20">
					<col width="20">
					<col width="20">
					<col width="20">
					<col width="20">
					<col width="40">
				</colgroup>
				<thead>
					<tr>
						<th class="bgYlw" colspan="12"><font style="color:navy">${sltNm }</font> <font style="color:crimson">${choice_year}년</font> 업무목표</th>
					</tr>
					<tr>
						<th class="bgYlw" rowspan="3" colspan="2">업무내용</th>
						<th class="bgYlw" rowspan="3">세부내용</th>
						<th class="bgYlw" rowspan="3">목표/목표량</th>
						<th class="bgYlw" colspan="7">월별 목표량</th>
						<th class="bgYlw" rowspan="3">메모</th>
					</tr>
					<tr>
						<c:forEach var="cnt" begin="1" end="6">
							<th class="bgYlw pd0" style="line-height:17px;"><small>${cnt}</small></th>
						</c:forEach>
							<th class="bgYlw pd0" rowspan="2" style="line-height:17px;"><small>합</small></th>
					</tr>
					<tr>
						<c:forEach var="cnt" begin="7" end="12">
							<th class="bgYlw pd0" style="line-height:17px;"><small>${cnt}</small></th>
						</c:forEach>
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
				
			
				<tbody id="dynamicTbl">
					
					<c:forEach var="plan" items="${bsnsPlanList}" varStatus="planStatus">
						<%-- <c:if test="${plan.choice_month < 6 and fl!=1}">
							<c:set var="fl" value="1"/>
							<tr><td class="cent bgGrn" colspan="16">상반기</td></tr>
						</c:if>
						<c:if test="${plan.choice_month > 5 and fl!=2}">
							<c:set var="fl" value="2"/>
							<tr><td class="cent bgRed" colspan="16">하반기</td></tr>
						</c:if> --%>
						<tr class="tbl${planStatus.count} dnTbl">
						<fmt:parseNumber value="${plan.detailDivCd+0}" var="num"/>
						
							<td class="cent" nowrap="nowrap" <c:if test="${num > 40 and num < 51}">colspan="2"</c:if>>
								<c:if test="${num < 11}">[딜소싱]</c:if>
								<c:if test="${num > 10 and num < 21}">[자금유치]</c:if>
								<c:if test="${num > 20 and num < 31}">[투자/분석/탐방]</c:if>
								<c:if test="${num > 30 and num < 41}">[내부업무]</c:if>
								<c:if test="${num > 40 and num < 51}">[개인]</c:if>
							</td>
							<td class="cent" nowrap="nowrap" <c:if test="${num > 40 and num < 51}">style="display:none;"</c:if>>
								<c:forEach var="cmmCd" items="${cmmCdList}">	
								<c:if test="${plan.detailDivCd+0 < 40}">
									<c:if test="${plan.detailDivCd == cmmCd.dTailCd}">[${cmmCd.cdNm}]</c:if>
								</c:if>
								</c:forEach>
							</td>	
						<%-- 
							<td nowrap="nowrap">
							<b>${plan.bsnsList}</b>
							</td>
							 --%>
							<c:if test="${plan.bsnsList=='00000'}"><td>${plan.bsnsDtail}</td></c:if>
							<c:if test="${plan.bsnsList!='00000'}">
								<c:forEach var="cmmCd" items="${cmmCdList}">	
								<c:if test="${plan.bsnsList > 50}">
									<c:if test="${plan.bsnsList == cmmCd.dTailCd}"><td class="cent">[${cmmCd.cdNm}]</td></c:if>
								</c:if>
								</c:forEach>
							</c:if>
							
							<c:if test="${plan.bsnsList=='00000'}"><td>${plan.goal}</td></c:if>
							<c:if test="${plan.bsnsList!='00000'}">
								<td class="cent">
									<c:if test="${plan.goalM+0 !=0}"><b>${plan.goalM}</b><c:if test="${plan.detailDivCd+0 ==11 or plan.detailDivCd+0 ==12}">억</c:if><c:if test="${plan.detailDivCd+0 ==1 or plan.detailDivCd+0 ==2}">딜</c:if>/월</c:if>
									<c:if test="${plan.goalHY+0 !=0}">&nbsp;&nbsp;&nbsp;<b>${plan.goalHY}</b><c:if test="${plan.detailDivCd+0 ==11 or plan.detailDivCd+0 ==12}">억</c:if><c:if test="${plan.detailDivCd+0 ==1 or plan.detailDivCd+0 ==2}">딜</c:if>/년</c:if>
								</td>
							</c:if>
							
							<!-- <td class="bar" colspan="10">
								<table style="width:100%"><tr> -->
							<td id="bar1" class="pd0 h5 hand cent">${plan.mon1 }</td>
							<td id="bar2" class="pd0 h5 hand cent">${plan.mon2 }</td>
							<td id="bar3" class="pd0 h5 hand cent">${plan.mon3 }</td>
							<td id="bar4" class="pd0 h5 hand cent">${plan.mon4 }</td>
							<td id="bar5" class="pd0 h5 hand cent">${plan.mon5 }</td>
							<td id="bar6" class="pd0 h5 hand cent">${plan.mon6 }</td>
							<c:set var="sumMon" value="${0+plan.mon1+plan.mon2+plan.mon3+plan.mon4+plan.mon5+plan.mon6}"/>
							<td class="pd0 h5 hand cent"><c:if test="${not empty sumMon}">${sumMon }</c:if></td>
							<!-- </tr></table></td> -->
							<td class="cent"><a class="memoBtn" id="mm_${planStatus.count}"><img src="<c:url value='/images/edit-5-icon.png'/>" title="메모" <c:if test="${fn:length(plan.note)>1}">style="background-color:#F7E7CC"</c:if>></a></td>
						</tr>
						<%-- <c:set var="OBlist" value="${plan.bsnsList }"/> --%>
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