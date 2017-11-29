<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Left</title>
<link href="<c:url value='/css/leftMenu.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script>
$(document).ready(function(){
//	$("li a:even").css("background-color", "#E0F8F7");

	$('#leftHoliday').click(function(){//
		var frm = document.getElementById('cName');//sender form id
			frm.action="index.do";
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});
	$('#leftModifyHoliday').click(function(){//
		var frm = document.getElementById('cName');//sender form id
			frm.action="modifyHoliday.do";
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});
	$('#leftTardiness').click(function(){//
		var frm = document.getElementById('cName');//sender form id
			frm.action="Tardiness.do";
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});
	$('#leftModifyTardiness').click(function(){//
		var frm = document.getElementById('cName');//sender form id
			frm.action="modifyTardiness.do";
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});
});
</script>
</head>
<body>
	<form id="cName" name="cName" method="get">
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
		<div id="menubody">
		<ul class="left-list">
			<li><a href="#" id="leftHoliday">휴가내역</a></li>
			<c:if test="${userLoginInfo.permission == '00002'||userLoginInfo.permission == '00005'}"><li><a id="leftModifyHoliday">휴가내역 수정</a></li></c:if>
			<li><a id="leftTardiness">지각내역</a></li>
			<c:if test="${userLoginInfo.permission == '00002'||userLoginInfo.permission == '00005'}"><li><a id="leftModifyTardiness">지각내역 수정</a></li></c:if>
		</ul>
		</div>
		</article>
	</section>

</body>
</html>