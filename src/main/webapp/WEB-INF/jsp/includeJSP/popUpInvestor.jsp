<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
	<div class="_popUpWidth">
		<table class="pop_tb_basic">
			<thead>
				<tr>
					<th style="width:256px;">법인명</th>
					<th style="width:256px;">담당자명</th>
					<!-- <th style="width:60px;">코드</th> -->
				</tr>
			</thead>
			<tbody>
			<c:forEach var="investor" items="${investorCompanyList}" varStatus="status">
					<tr class="link">
					<td class="cent" style="width:256px;" onclick="End('${investor.cpnId}','${investor.cpnNm }','${investor.sNb}','${investor.listed}','${investor.investorId}');">
						<b>${investor.cpnNm }</b></td>
					<td class="cent" style="width:256px;" id="view_${investor.investorId}"><b>${investor.managerNm }</b>
						<span class="btn red s" style="float:right;margin-right:5px;">
						<a onclick="javascript:delInvestorCompany('${investor.investorId}')">삭제</a></span>
						<span class="btn orange s" style="float:right;margin-right:10px;">
						<a onclick="javascript:editInvestorManager('${investor.investorId}', 'EDIT')">수정</a></span>
					</td>
					
					<td class="cent" "style="width:256px;" id="edit_${investor.investorId}" style="display:none">
						<span class="btn blue s" style="float:right;margin-right:5px;">
						<a href="javascript:editInvestorManager('${investor.investorId}', 'VIEW');">취소</a></span>
						<span class="btn green s" style="float:right;margin-right:5px;">
						<a onclick="javascript:modifyInvestorManager('${investor.investorId}')">저장</a></span>
						<input type="text" name="managerNm${investor.investorId}" id="managerNm${investor.investorId}" value="${investor.managerNm}" style="width:65%;height:20px;float:right;margin-right:5px;"/> 
					</td>
					<%-- <td class="cent" style="padding: 5px 0 5px 0 !important;">${investor.aCpnId}</td> --%>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<c:if test="${not empty investorCompanyList }"><br/>
		<div align="center">
			<ui:pagination type="image" paginationInfo = "${paginationInfo}" jsFunction="linkPage" />
		</div>
		</c:if>

		<c:if test='${param.fromInside ne "y"}'>
		<div class="cent" style="float:right;padding-right:5px;"><br/>
			<!-- <span class="btn black s"><a onclick="popRgstCpn();">등록하기</a></span> -->
			<span class="btn black s"><a onclick="openPopUp('','c');">등록하기</a></span>
		</div>
		</c:if>
		
		<div class="btn_pop_basic">
			<button type="button" class="btn_pop_gray01" style="height:26px;" onClick="javascript:window.close();">닫기</button>
			<!-- <button type="button" class="btn_pop_white01">확인</button> -->
		</div> 
		
	</div>
<!-- <script>$("tr:even").css("background-color", "#E0F8F7");</script> -->