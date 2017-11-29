<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>pass</title>

<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->

</head>


<body>

<div id="spanMsg" style="display:none;margin:auto;width:300px;"><br/><br/><br/><font color="#75c5de">관계사 화면이 새창으로 열렸습니다</font></div>

<iframe id="passFrame" name="passFrame" width="100%" height="850" src="" marginwidth="0" marginheight="0" frameborder="no" scrolling-x="no"></iframe>

</body>
</html>


<script>
$(function(){
	
	var agent = navigator.userAgent.toLowerCase();
	
	if(navigator.userAgent.search('Trident') != -1 || agent.indexOf("msie") != -1){
		window.open('http://www.passerp.co.kr/pass/ibPass.do?ibtopass=${ibtopass}', '_new', 'scrollbars=yes width=1750 height=950');
		$('#spanMsg').show();	//메세지
		
	}else{
		
		$('#passFrame').attr('src', 'http://www.passerp.co.kr/pass/ibPass.do?ibtopass=${ibtopass}');
	}
});
</script>