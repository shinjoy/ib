<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 response.reset();
 response.setContentType("application/vnd.ms-excel;charset=utf-8"); 
 response.setHeader("Content-Disposition", "attachment; filename=networkExcel.xls");
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
		<thead>
			<tr>
				<th rowspan="2">일자</th>
				<th rowspan="2">입력자</th>
				<th colspan="3">인물 I</th>
				<th colspan="3">인물 II</th>
				<th rowspan="2">내용</th>
				<th rowspan="2"><small>입력자 - 인물I</small><br/>친밀도</th>
				<th rowspan="2"><small>인물I - 인물II</small><br/>친밀도</th>
			</tr>
			<tr>
				<th>이름</th>
				<th>회사</th>
				<th>직책</th>
				<th>이름</th>
				<th>회사</th>
				<th>직책</th>
			</tr>
		</thead>
	</table>
	<table>
		<tbody>
			<c:forEach var="financ" items="${financingList}" varStatus="financStatus">
				<tr <c:if test="${financ.tmpNum1 == 2}">style="background-color:ivory;"</c:if>>
					<td>${financ.tmDt}</td>
					<td>${financ.rgNm}</td>
					<td>${financ.cstNm1st}</td>
					<td>${financ.cpnNm1st}</td>
					<td>${financ.position1st}</td>
					<td>${financ.cstNm2nd}</td>
					<td>${financ.cpnNm2nd}</td>
					<td>${financ.position2nd}</td>
					<td>${financ.note}</td>
					<td>${financ.importance}</td>
					<td>${financ.lvCd}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>