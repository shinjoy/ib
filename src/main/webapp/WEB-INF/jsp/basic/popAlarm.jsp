<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>알림</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js?ver=0.1'/>" ></script>


<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js?ver=0.1"></script><!-- ajaxRequest, etc -->

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->
<style>
#container {
	margin:0px;
	padding: 0px;
	height: 100%; 
	position: relative;
} 

#container .header{
	background-color:#f14432;
	font-weight:700;
	color:#fff;
	height:26px;
	border-bottom:1px solid #f14432;
	padding: 5px;
	text-align:center;
	font-size:20px;
}

#container .content{
	margin-top:5px;
}

#container textarea{
	position : relative;
	margin:10px 1px 10px 1px;
	padding-left:5px;
	font-weight:600;
	width:98%;
	border:0px;
	font-size:14px;
	overflow : auto;
	letter-spacing : 2px;
}

#container .footer {
	bottom: 0;
	width: 100%;
	height: 22px;
	color : #fff;
	padding-top:2px;
	background-color: #ff4949;
}

.footer .footer_left{
	float: left;
}

.footer .footer_right{
	float: right;
	padding-right:10px;
	padding-top:2px;
}

.footer .footer_right a{
	color : #fff;
}
</style>
</head>
<body>
	<div id="container">
		<div class="header">※알 림※</div>
		<div class="content">
			<textarea name="pop_content" readonly><c:out value="${alarm.alarmText}" escapeXml="false"/></textarea>
		</div>
		<div class="footer">
			<div class="footer_left"><label for="check_today"><input type="checkbox" name="check_today" id="check_today" onclick="closeWin();">오늘은 그만보기</label></div>
			<div class="footer_right"><a href="javascript:closeWin();">닫기</a></div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
$(function(){
	//팝업 내부 사이즈 초기화  
	var window_height = $(window).height() - 100;
	$("textarea[name='pop_content']").css("height",window_height);	
	
	//팝업창 사이즈 변경에 의한 알림창 css 변경
	$(window).resize(function() {
	      resizeContent();
	});
});

function resizeContent(){
	 var window_height = $(window).height() - 100;
	 $("textarea[name='pop_content']").height(window_height);
}

//창 닫기 클릭시 쿠키 처리
function closeWin() { 
    if(document.getElementById("check_today").checked){
    	setCookie("cookie_"+"${alarm.alarmId}", "done", 1); // 쿠기 만료일 하루 뒤
     	window.close();
    }else{
       	window.close();
    }
}

//쿠기설정
function setCookie(name, value, expiredays){
	var today = new Date();
	today.setDate( today.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";";
}
</script>