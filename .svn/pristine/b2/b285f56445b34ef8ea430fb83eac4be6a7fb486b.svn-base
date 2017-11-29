<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>a:hover{background-color:#75c5de !important;}</style>
<script>
function slctIbC(sNb,th){
	$('#s_Name').val(sNb);
	var frm = document.getElementById('customerName');//sender form id
	frm.action="<c:url value='/company/main.do' />";
	frm.target = "netInfoFrame";//target frame name
	frm.submit();

	$('.t_skin04_cstNcpn tr.LK3rd').css('background-color','');
	$('.t_skin04_cstNcpn tr.LK3rd').css('color','black');
	$(th).parent().css('background-color','#75c5de');
	$(th).parent().css('color','white');

	resize_iframe();
}
</script>
<table class="t_skin04_cstNcpn" style="width:100%;table-layout: fixed;">
	<tr style="padding:5px 7px;">
		<td class="cent bgYlw" style="width:40px"><b>구분</b></td>
		<td class="cent bgYlw w70p"><b>회사</b></td>
		<td class="cent bgYlw w50p"><b>이름</b></td>
		<td class="cent bgYlw"><b>직책/직급</b></td>
	</tr>
	<c:forEach var="cst" items="${staffNetList}" varStatus="cstS"><tr class="link LK3rd">
		<%-- 입력한 당일만 삭제 가능하게 작업 --%>
		<fmt:formatDate var="cur_day" value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd'/>
		<fmt:parseDate var="parseDate" value="${cst.rgDt}" pattern="yyyy-MM-dd" scope="page"/>
		<fmt:formatDate var="rgDate" value="${parseDate}" pattern="yyyy-MM-dd"/>
		<td class="cent" onclick="slctIbC<c:if test="${cst.categoryCd eq '2'}">st</c:if>('${cst.sNb}',this);">${cst.tmpNum1}</td>
		<td class="cent" onclick="slctIbC<c:if test="${cst.categoryCd eq '2'}">st</c:if>('${cst.sNb}',this);" style="overflow:hidden"><small><nobr>${cst.cpnNm }</nobr></small></td>
		<td class="cent" onclick="slctIbC<c:if test="${cst.categoryCd eq '2'}">st</c:if>('${cst.sNb}',this);" style="overflow:hidden;font-weight:bold;"><nobr>&nbsp;${cst.cstNm }&nbsp;</nobr></td>
		<td class="cent" onclick="slctIbC<c:if test="${cst.categoryCd eq '2'}">st</c:if>('${cst.sNb}',this);" title="${cst.position }"><nobr>${fn:substring(cst.position,0,5) }<c:if test="${fn:length(cst.position) > 4}">...</c:if></nobr></td>
	</tr></c:forEach>
</table>

<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
</form>
