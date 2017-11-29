<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Synergy DateDiff</title>
		<link href="<c:url value='/css/sp/synergy.css'/>" rel="stylesheet" type="text/css">
		<script src="js/sp/synergy_util.js"></script>
		<script src="js/sp/jquery-1.8.2.min.js"></script>
	</head>
	<script>
		var Data = new Object();
		function CarSet() {
			<c:forEach var="car" items="${resultData}" varStatus="status">
				Data['${status.count}'] = {"ScheSeq" : '${car.scheseq}', "CarUseFlag" : '${car.caruseflag}', "CarNum" : '${car.carnum}', "PerNm" : '${car.pernm}', "STime" : '${car.stime}', "ETime" : '${car.etime}'};
			</c:forEach>
		}
	</script>
	<body>
	<form name="result" method="post"><input type="hidden" name="resultData" id="resultData" value="${fn:length(resultData) + 1}"/></form>
	</body>
</html>