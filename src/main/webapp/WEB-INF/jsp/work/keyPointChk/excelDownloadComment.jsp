<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 response.reset();
 response.setContentType("application/vnd.ms-excel;charset=utf-8"); 
 response.setHeader("Content-Disposition", "attachment; filename=analysisComment.xls");
 response.setHeader("Content-Description", "Tetris GameLog Data");
%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>excelDownload</title>

</head>

<body>

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
	<table>
		<colgroup>
			<col width="52">       
			<col width="62">       
			<col width="112">      
			<col width="80">        
			<col width="50">       
			<col width="48">       
			<col width="48">        
			<col width="285">       
			<col width="50">        
			<col width="50">       
			<col width="50">        
			<col width="50">        
			<col width="50">        
			<col width="50">       
			<col width="50">       
		</colgroup>
		<thead>
			<tr>
				<th style="border:1px solid black;">입력자</th>
				<th style="border:1px solid black;">입력일</th>
				<th style="border:1px solid black;">회사명</th>
				<th style="border:1px solid black;">중요도</th>
				<th style="border:1px solid black;">분석<br/>유효기간</th>
				<th style="border:1px solid black;">주가<br/>등락률</th>
				<th style="border:1px solid black;">구분</th>						
				<th style="border:1px solid black;">내용</th>
				<th style="border:1px solid black;">기준일<br/>주가</th>
				<th style="border:1px solid black;">현재가</th>
				<th style="border:1px solid black;">현재<br/><nobr>상승률<small> (%)</small></nobr></th>
				<th style="border:1px solid black;">최저가</th>
				<th style="border:1px solid black;">최저<br/><nobr>상승률<small> (%)</small></nobr></th>
				<th style="border:1px solid black;">최고가</th>
				<th style="width:65px;border:1px solid black;">최고<br/><nobr>상승률<small> (%)</small></nobr></th>
			</tr>
			<tr style="height:1px;"></tr>
		</thead>
	</table>
	<table id="SGridTarget">
		<colgroup>
			<col width="52">       
			<col width="62">       
			<col width="112">      
			<col width="80">        
			<col width="50">       
			<col width="48">       
			<col width="48">        
			<col width="285">       
			<col width="50">        
			<col width="50">       
			<col width="50">        
			<col width="50">        
			<col width="50">        
			<col width="50">       
			<col width="50">        
		</colgroup>
		<tbody>
			<c:forEach var="financ" items="${financingList}" varStatus="financStatus">
			<tr ${financStatus.count%2 == 1 ? 'bgcolor="#E6FFFF"' : ''}>
				<td>${financ.rgNm}</td>
		
				<td><div>${financ.rgDt}</div></td>
				<td style="text-align: center;"><a>${financ.cpnNm}</a></td>
				
				<td style="text-align: center;"><c:if test="${not empty financ.star}">
					
					${financ.star }	
				</c:if></td>
				<td style="text-align: center;">${financ.expTerm} 개월</td>						
				<td style="text-align: center;">
					<c:if test="${not empty financ.expStartPrice and not empty financ.expPrice}">
						<c:choose>
							<c:when test="${(financ.expPrice - financ.expStartPrice) ge 0}"><font color=red></c:when>
							<c:otherwise><font color=blue></c:otherwise>
						</c:choose>
						
						<fmt:formatNumber value="${((financ.expPrice - financ.expStartPrice) / financ.expStartPrice) * 100}" pattern=".0"/> %
					</c:if>
					<c:choose>
						<c:when test="${empty financ.expStartPrice and empty financ.expPrice}"><font color=silver>비상장</font></c:when>
						<c:when test="${financ.expDt gt financ.nowDt}"><font color=silver>날짜남음</font></c:when>								
						<c:otherwise><font color=silver></font></c:otherwise>
					</c:choose>
					
				</td>
				<td>${financ.tmpNum1}</td>
				<td>
					${fn:substring(financ.comment, 0, 42)}
					<c:if test="${fn:length(financ.comment) > 42 }">...</c:if>
				</td>
				
				<td><fmt:formatNumber value="${financ.regPrice}" type="currency" currencySymbol=""/>
					<c:if test="${empty financ.expStartPrice and empty financ.expPrice}"><font color=silver>비상장</font></c:if>
				</td>
				<td style="text-align: center;"><fmt:formatNumber value="${financ.curPrice}" type="currency" currencySymbol=""/></td>
				<td style="text-align: center; <c:if test="${(financ.curPrice-financ.regPrice)>0}">color:red;</c:if> <c:if test="${(financ.curPrice-financ.regPrice)<0}">color:blue;</c:if>"><c:if test="${not empty financ.curPrice}"><fmt:formatNumber value="${(financ.curPrice-financ.regPrice)/financ.regPrice *100}" pattern="0.00"/>%</c:if></td>
				<td style="text-align: center;"><fmt:formatNumber value="${financ.minPrice}" type="currency" currencySymbol=""/></td>
				<td style="text-align: center; <c:if test="${(financ.minPrice-financ.regPrice)>0}">color:red;</c:if> <c:if test="${(financ.minPrice-financ.regPrice)<0}">color:blue;</c:if>"><c:if test="${not empty financ.regPrice}"><fmt:formatNumber value="${(financ.minPrice-financ.regPrice)/financ.regPrice *100}" pattern="0.00"/>%</c:if></td>
				<td style="text-align: center;"><fmt:formatNumber value="${financ.maxPrice}" type="currency" currencySymbol=""/></td>
				<td style="text-align: center; <c:if test="${(financ.maxPrice-financ.regPrice)>0}">color:red;</c:if> <c:if test="${(financ.maxPrice-financ.regPrice)<0}">color:blue;</c:if>"><c:if test="${not empty financ.regPrice}"><fmt:formatNumber value="${(financ.maxPrice-financ.regPrice)/financ.regPrice *100}" pattern="0.00"/>%</c:if></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>