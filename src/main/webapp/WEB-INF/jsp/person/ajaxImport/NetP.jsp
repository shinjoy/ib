<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="netP" items="${netList}" varStatus="status"><input type="hidden" id="snb2${netP.sNb}" value="${netP.cstId}"/><input type="hidden" id="snb1${netP.sNb}" value="${cst.sNb}"/><input type="hidden" id="npnm${netP.sNb}" value="${cst.cstNm} - ${netP.cstNm}"/>
	<tr>
		<td valign="top">
			<table class="sub_tbl t_skin04_cstNcpn">
				<colgroup>
					<col width="70px;">
					<col />
				</colgroup>
				<tr class="link" onclick="slctCst('${netP.cstId}');" title="${netP.position}">
					<td><b>${netP.cstNm}</b></td>
					<td>&nbsp;${netP.cpnNm}</td>
				</tr>
				<tr>
					<td style="padding:1px; color:gray;" align="right"><span valign="top">└▷</span>${netP.cstNm1}<br/>친밀도</td>
					<td><table class="t"><tr><c:forEach var="loop5" varStatus="L5" begin="1" end="5"><td class="tabImportant<c:if test="${netP.lvCd>=L5.count}"> bgLightGray</c:if>" title="${L5.count}" style="width:12px !important;"<c:if test="${not empty netP.sNb}"> onclick="javascript:selectLvCd('NP','${L5.count}','${netP.sNb}','customerName',event,this);"</c:if>></td></c:forEach></tr></table></td>
				</tr>
			</table>
		</td>
		<td style="padding:0 5px 0 2px;" id="modiCstNet${status.count}"<c:if test="${not empty netP.sNb}"> class="link" onclick="modifyNet(this,'${status.count}','${cst.sNb}','${netP.sNb}','cstNet')" title="수정"</c:if>>${fn:replace(netP.note,lf, "<br/>")}</td>
		<td align="center" style="color:gray;">
			<c:if test="${not empty netP.sNb and (userLoginInfo.permission > '00019'  or  userLoginInfo.name==netP.rgNm)}"><img style="vertical-align:bottom;" class="hand" src="<c:url value='/images/recommend/delete.png'/>" onclick="deleteNet('${cst.sNb}','${netP.sNb}','cstNet')" title="삭제"/><br/></c:if>
			<small>${netP.rgNm}</small>
		
	</tr>
</c:forEach>
<tr><td colspan="3" style="text-align:center;padding-left:60px;"><ui:pagination type="image" paginationInfo = "${paginationInfo}" jsFunction="linkPage" /></td></tr>
	<c:forEach var="note" items="${netList}" varStatus="status">
		<div class="popUpMenu popUpTitle_area" id="netPr${status.count}">
			<input type="hidden" id="cstNetSnb${status.count}" value="${note.sNb}">
			<p class="closePopUpMenu">ⅹ닫기</p>
			<ul>
				<li><textarea id="cstNetArea${status.count}" class="pop_note">${note.note}</textarea></li>
			</ul>
			<p class="bsnsR_btn">
				<span class="btn s green" onclick="saveNoteOFnet('cstNet',${status.count});"><a>저장</a></span>&nbsp;&nbsp;&nbsp;
			</p>
		</div>
	</c:forEach>