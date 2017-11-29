<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
</head>
<body>
<c:if test="${not empty userLoginInfo}">
	<header>
		<h2 id="name">이름: ${userLoginInfo.name}</h2>
		<h4>&nbsp;&nbsp;&nbsp;&nbsp;IP: ${userLoginInfo.ip}
			<br/>Date: ${userLoginInfo.loginDt}
		</h4>
	</header>
</c:if>
<c:if test="${empty userLoginInfo}">
	<h3>로그인 하십시요.</h3>
</c:if>
</body>
</html>