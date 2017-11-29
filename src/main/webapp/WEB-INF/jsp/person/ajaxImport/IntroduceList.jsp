<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
<c:forEach var="intr" items="${introList}" varStatus="status">
<tr>
	<td style="padding: 5px 2px 0 2px;vertical-align:bottom;"><small>${intr.cpnNm1st}</small></td>
	<td rowspan="2">&nbsp;:&nbsp;</td>
	<td rowspan="2" class="hand hov" onclick="slctCst('${intr.snb2nd}');"><nobr>&nbsp;<b>${intr.staffNm}</b>&nbsp;</nobr></td>
	<td rowspan="2"> ↔ </td>
	<td style="padding: 5px 2px 0 2px;vertical-align:bottom;"><small>${intr.cpnNm2nd}</small></td>
	<td rowspan="2">&nbsp;${fn:replace(intr.comment,lf, "<br/>")}&nbsp;</td>
</tr>
<tr>
	<td class="hand hov" onclick="slctCst('${intr.snb1st}');" style="padding: 0 2px 5px 2px;vertical-align:top;text-align:right;"><nobr>&nbsp;<b>${intr.cstNm1st}</b>&nbsp;</nobr></td>
	<td class="hand hov" onclick="slctCst('${intr.snb3rd}');" style="padding: 0 2px 5px 2px;vertical-align:top;"><nobr>&nbsp;<b>${intr.cstNm2nd}</b>&nbsp;</nobr></td>
	<td style="padding: 0 2px 5px 2px;"><nobr>&nbsp;<small>${intr.rgNm}</small></nobr></td>
</tr>
</c:forEach>
<c:if test="${not empty introList}"><tr><td colspan="6" style="text-align:center;padding-left:60px;"><ui:pagination type="image" paginationInfo = "${paginationInfo}" jsFunction="linkPage" /></td></tr></c:if>