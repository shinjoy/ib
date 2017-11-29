<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<table class="t_skin04_cstNcpn"><c:forEach var="cst" items="${companyList}">
	<tr class="link LK2nd" style="padding:5px 7px;" title="${cst.position }">
		<td onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.cstNm }&nbsp;</nobr></td>
		<td onclick="slctIbCst('${cst.sNb}',this);" style="width:78px;"><nobr>&nbsp;${fn:substring(cst.position,0,5) }<c:if test="${fn:length(cst.position) > 4}">...</c:if></nobr></td>
	</tr></c:forEach>
</table>

<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
</form>
