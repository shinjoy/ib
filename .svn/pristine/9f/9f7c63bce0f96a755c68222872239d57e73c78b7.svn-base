<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Left</title>
<link href="<c:url value='/css/leftMenu.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script>
$(document).ready(function(){
//	$("li:even").css("background-color", "#E0F8F7");
	$('#leftCar1').click(function(){//전체 선택
		left_menu(this);
		$("#s_Name").val(null);
		var frm = document.getElementById('cName');//sender form id
			frm.action="index.do";
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});
	$('.leftCar').click(function(){//차량 선택
		left_menu(this);
		$("#s_Name").val($(this).parent('li').attr('id').split('car')[1]);
		var frm = document.getElementById('cName');//sender form id
			frm.action="index.do";
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});
	$('.possess').click(function(){//차량점유
		$("#frmPossess").append("<input type='hidden' id='snb' name='sNb'/>");
		var frm = document.getElementById('frmPossess');
		$("#snb").val($(this).attr('id').split('snb')[1]);
		frm.action = "<c:url value='/car/possess.do' />";
		frm.submit();
		
		
	});
});
function left_menu(th){
	$('li .bgSky').removeClass('bgSky');
	$(th).addClass('bgSky');
}
</script>
<style>.bgSky{background: #75c5de left repeat-y;color: #ffffff;}</style>
</head>
<body>
	<form id="frmPossess" name="frmPossess" method="post"></form>
	<form id="cName" name="cName" method="post">
		<input type="hidden" id="s_Name" name="carNum">
	</form>
<%-- 	
	<header>
		<h2 id="login_name">이름: ${userLoginInfo.name}</h2>
		<h4>&nbsp;&nbsp;&nbsp;&nbsp;IP: ${userLoginInfo.ip}
			<br/>Date: ${userLoginInfo.loginDt}
		</h4>
	</header>
 --%>
	<section>
		<article>
		<div id="menubody" style="padding-left:10px;">
		<ul class="left-list">
			<li><a id="leftCar1">전체</a></li>
			<c:forEach var="car" items="${carList}"><c:if test="${car.carNum != '3798' and car.carNum != '9559' }"><c:set var="lengFloor" value="${fn:length(car.floor)}"/>
			<li id='car${car.carNum}' title="${car.tmpNum1}">
				<a class="leftCar" style="width:160px;" title="엔진오일교체날짜: ${car.tmDt}">${car.carNum}&nbsp;&nbsp; ${car.floor}&nbsp;&nbsp; ${car.tmpNum2}<c:if test="${not empty car.tmpNum2}">km</c:if></a>
				<%-- 
				<span id="snb${car.sNb}" class="btn s<c:if test="${(lengFloor>2 and car.floor eq userLoginInfo.name) or (lengFloor<3)}"> possess</c:if><c:if test="${lengFloor > 2}"> red</c:if>"><a>예약</a></span>
			 	--%>
			</li>
			</c:if></c:forEach>
		</ul>
		</div>
		</article>
	</section>
</div>
</body>
</html>