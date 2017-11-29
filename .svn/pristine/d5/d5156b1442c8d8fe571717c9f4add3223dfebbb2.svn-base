<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
	<c:if test="${fn:length(companyList) != 0}">
	<div style="padding-right:10px;margin-bottom:5px;">
		<table class="t_skinR00">
			<thead>
				<tr style="padding:2px;">
					<th class="bgYlw">법인명</th>
					<th class="bgYlw" style="width:50px">코드</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="cpn" items="${companyList}" varStatus="status">
				<tr class="link" onclick="slctCpn('${cpn.sNb}');">
					<td class="cent"><b>${cpn.cpnNm }</b></td>
					<td class="cent" style="padding: 7px 0 7px 0;">${cpn.aCpnId}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	</c:if>

	<form id="rgstCpnNm" name="rgstCpnNm" action="<c:url value='/company/rgstCpn.do' />" method="post">
		<input type="hidden" id="c_Name" name="cpnNm">
		<input type="hidden" name="searchCpnNm" value="${searchName}">
	</form>
	
	<!-- 시가 및 회사정보(혹시 나중 파람값 세팅 ) -->
	<form id="stockCompanyFrm" name="stockCompanyFrm" action="<c:url value='/company/uploadStockCompany.do' />" method="post">
		<input type="hidden" id="uploadType" name="uploadType">
	</form>

	<c:if test="${not empty companyList }">
	<div align="center">
	   <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
	</div>		
	</c:if>
	
	<br/><br/>
	<div class="cent">
		<c:if test="${empty companyList }"><spring:message code="common.nodata.msg" /><br/><br/></c:if>
		<span class="btn black s"><a onclick="rgstCpn();">업체 등록하기</a></span>
	</div>
	
	<br/>
	<c:if test="${userLoginInfo.permission ge '00021' }">
	<!--
	<div class="cent"><span style="font-size:11px;color:red;">※관리자메뉴:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
		<span class="btn black s">
			<a onclick="popUp('_0','cExcel')" id="AP_cstNm_0" class="c_title" title="회사업로드">회사업로드(EXCEL)</a>
		</span>
	</div>
	 -->
	<div class="cent">
		<div style="font-size:13px;color:red;"><strong>※관리자메뉴※</strong></div>
		<div>
			<div class="btn black s" style="margin-top:10px;"><a onclick="javascript:uploadCompanyByCsv();" id="AP_cstNm_0" class="c_title" title="회사업로드">회사업로드&nbsp;(CSV)&nbsp;&nbsp;</a></div>	<%--onclick="popUp('_0','cCsv')" --%>
			<div class="btn navy s" style="margin-top:10px;"><a onclick="javascript:uploadStockCompany('stock');"  class="c_title" title="시가업로드">시가업로드&nbsp;(CSV)&nbsp;&nbsp;</a></div>
			<div class="btn gold s" style="margin-top:10px;"><a onclick="javascript:uploadStockCompany('company');"  class="c_title" title="회사업로드">회사업로드&nbsp;(상장)&nbsp;&nbsp;</a></div>
		</div>
	</div>
	</c:if>
	
<script>$("tr:even").css("background-color", "#E0F8F7");</script>
