<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>a:hover{background-color:#75c5de !important;}</style>
<script>
function updateStaffNet(th){
	var obj = $(th).parent().parent();
	var data = {
			sNb: obj.find('input:eq(0)').val()
			,cstSnb: obj.find('input:eq(1)').val()
			,netCd: obj.find('input:radio[name=rdoS]:checked').val()
			,comment: obj.find('textarea').val()
			,rgId: $("#rgstId").val()
	};	
	var url = "../network/updateStaffNetwork.do";
	var fn = function(){
		selectNet(obj.find('input:radio[name=rdoS]:checked').val());
		//document.switc.action="selectStaffNetwork.do";
		//document.switc.submit();
	};
	ajaxModule(data,url,fn);
}
function deleteStaffNet(th,snb){
	if(confirm("삭제하시겠습니까?")){
		var data = {sNb: snb};	
		var url = "../network/deleteStaffNetwork.do";
		var fn = function(){
			$(th).parent().parent().css('display','none');
			//document.switc.action="selectStaffNetwork.do";
			//document.switc.submit();
		};
		
		ajaxModule(data,url,fn);
	}
}
</script>
<table class="t_skin04_cstNcpn" style="width:100%;table-layout: fixed;">
	<tr style="padding:5px 7px;">
		<td class="cent bgYlw" style="width:40px"><b>직원</b></td>
		<td class="cent bgYlw w70p"><b>회사</b></td>
		<td class="cent bgYlw w50p"><b>이름</b></td>
		<td class="cent bgYlw w70p"><b>직책/직급</b></td>
		<td class="cent bgYlw"><b>메모</b></td>
	</tr>
	<c:forEach var="cst" items="${staffNetList}" varStatus="cstS"><tr class="link LK3rd">
		<%-- 입력한 당일만 삭제 가능하게 작업 --%>
		<fmt:formatDate var="cur_day" value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd'/>
		<fmt:parseDate var="parseDate" value="${cst.rgDt}" pattern="yyyy-MM-dd" scope="page"/>
		<fmt:formatDate var="rgDate" value="${parseDate}" pattern="yyyy-MM-dd"/>
		<td class="cent"><c:if test="${(userLoginInfo.id != cst.rgId)}">${cst.usrNm}</c:if><c:if test="${(userLoginInfo.id == cst.rgId)||(userLoginInfo.permission > '00020')}"><%-- <c:if test="${(userLoginInfo.id == cst.rgId) and (cur_day == rgDate)}"> --%>
			<span class="pd0 mg0" onclick="view('tbl${cstS.count}',this,event)"><a style="display: inline-block;width:16px;height:16px;"><img src="<c:url value='/images/recommend/modify.png'/>" title="수정"/></a></span>
			<span class="pd0 mg0" onclick="javascript:deleteStaffNet(this,'${cst.sNb}');"><a style="display: inline-block;width:16px;height:16px;"><img src="<c:url value='/images/recommend/delete.png'/>" title="삭제"/></a></span>
		</c:if></td>
		<td class="cent" onclick="slctIbCst('${cst.cstSnb}',this);" style="overflow:hidden"><small><nobr>${cst.cpnNm }</nobr></small></td>
		<td class="cent" onclick="slctIbCst('${cst.cstSnb}',this);" style="overflow:hidden;font-weight:bold;"><nobr>&nbsp;${cst.cstNm }&nbsp;</nobr></td>
		<td class="cent" onclick="slctIbCst('${cst.cstSnb}',this);" title="${cst.position }"><nobr>${fn:substring(cst.position,0,5) }<c:if test="${fn:length(cst.position) > 4}">...</c:if></nobr></td>
		<td class="cent" onclick="slctIbCst('${cst.cstSnb}',this);" title="${cst.comment }"><nobr>&nbsp;${cst.comment }&nbsp;</nobr></td>
	</tr></c:forEach>
</table>
<c:forEach var="cst" items="${staffNetList}" varStatus="cstS">
	<div class="popUpMenu" style="width:460px;" id="tbl${cstS.count}">
		<p class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</p>
		<input type="hidden" id="snb_${cstS.count}" value="${cst.sNb}"/>
		<table class="t_skinR00" style="width:100%">
			<thead>
			<tr>
				<th style="width:40px;border-radius:0px;">인물</th>
				<input type="hidden" id="AP_cstId_${cstS.count}" value="${cst.cstSnb}"/>
				<td style="border-radius:0px;"><span class="btn s glass" style="margin:0px 0px 0px 5px;" onclick="popUp('_${cstS.count}','p')" id="AP_cstNm_${cstS.count}">${cst.cpnNm}:${cst.cstNm}</span></td>
			</tr>
			<tr>
				<th>구분</th>
				<td><span style="margin:0px 0px 0px 5px;display:inline-block;line-height: 150%;"><c:forEach var="cm" items="${cmmCdNet}" varStatus="cmS">
						<label><input type="radio" name="rdoS" value="${cm.dTailCd}" align="absmiddle"<c:if test="${cm.dTailCd==cst.netCd}"> checked="checked"</c:if>/>
						${cm.cdNm}</label><c:if test="${cmS.count==5}"><br/></c:if>
				</c:forEach></span></td>
			</tr>
			<tr>
				<th>메모</th>
				<td><textarea style="width:95%;margin:0px 0px 0px 5px;border:1px solid lightgray;font-size:11px;">${cst.comment}</textarea></td>
			</tr>
			</thead>
		</table>
		<p class="cent" style="margin:3px 0px;"><span class="btn s orange" onclick="javascript:updateStaffNet(this);"><a>수정</a></span></p>
	</div>
</c:forEach>
<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
</form>
