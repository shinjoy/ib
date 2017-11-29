<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<table class="t_skin04_cstNcpn" style="width:100%">
	<c:forEach var="cm" items="${cmmCdNet}">
	<tr class="link LK2nd" onclick="selectNet('${cm.dTailCd}',this);"><c:set var="cnt" value="0"/>
	<c:forEach var="sn" items="${staffNetList}"><c:if test="${cm.dTailCd==sn.netCd}"><c:set var="cnt" value="${sn.netCnt}"/></c:if></c:forEach>
		<td style="padding:5px 6px;width:70px;">${cm.cdNm}</td>
		<td style="padding:5px 7px;width:22px;text-align:right;"><c:if test="${empty cnt}">0</c:if>${cnt}</td>
	</tr></c:forEach>
</table>
