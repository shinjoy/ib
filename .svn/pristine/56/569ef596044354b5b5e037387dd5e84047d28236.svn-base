<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
function onNoff(cstSnb,rgnm,star,stSnb){
	var flag = 0;
	if(star==0) flag = 1;
	
	var URL = "../stockFirmManage/insertStockFirmIBstar.do";
	$.ajax({
		type:"POST",        //POST GET
		url:URL,     //PAGEURL
		data : ({
			 cstSnb: cstSnb
			,rgNm: rgnm
			,star: flag
			,starSnb: stSnb
		}),
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			selectStockFirmIb(rgnm,'','B');
		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});
}
</script>
<table class="t_skin04_cstNcpn" style="width:100%">
	<tr style="padding:5px 7px;">
		<td class="cent bgYlw"></td>
		<td class="cent bgYlw"><b>증권사</b></td>
		<td class="cent bgYlw"><b>이름</b></td>
		<td class="cent bgYlw"><b>직책/직급</b></td>
		<td class="cent bgYlw"><b>전화</b></td>
		<td class="cent bgYlw"><b>미팅</b></td>
		<td class="cent bgYlw"><b>저녁<br/>미팅</b></td>
		<td class="cent bgYlw"><b>딜</b></td>
		<td class="cent bgYlw"><b>성과</b></td>
		<td class="cent bgYlw"><b>규모</b></td>
		<td class="cent bgYlw"><b>최근<br/>연락</b></td>
	</tr>
	<c:forEach var="cst" items="${cstList}"><tr class="link LK2nd">
		<td class="cent" title="선택"><img class="bd0 bookmark" <c:if test="${userLoginInfo.permission > '00019'  or userLoginInfo.name==cst.rgNm}">onclick="onNoff('${cst.sNb}','${cst.rgNm}','${cst.star}','${cst.starSnb}');"</c:if> <c:if test="${cst.star==0}">src="<c:url value='/images/bookmark/Bookmark round.png' />"</c:if><c:if test="${cst.star==1}">src="<c:url value='/images/bookmark/Bookmark-16.png' />"</c:if> style="width:16px;height:16px" alt="bookmark"></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>${cst.cpnNm }</nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.cstNm }&nbsp;</nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>${fn:substring(cst.position,0,5) }<c:if test="${fn:length(cst.position) > 4}">...</c:if></nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.callCnt  }&nbsp;</nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.meetCnt  }&nbsp;</nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.nightMeetCnt }&nbsp;</nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.dealCnt  }&nbsp;</nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.dealSCnt }&nbsp;</nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.price    }&nbsp;</nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.tmDt     }&nbsp;</nobr></td>
	</tr></c:forEach>
</table>

<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
</form>
