<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
/*String u = request.getRequestURL().toString();
String arrU = new String(u);
if(arrU.indexOf(":8180")>0 && u.startsWith("http://")){
	u = u.replaceAll("http://","https://");
	u = u.replaceAll(":8180",":8181");
	u = u.split("WEB-INF")[0];
	response.sendRedirect(u);
}*/
String u = request.getRequestURL().toString();
String arrU = new String(u);
if(u.startsWith("https://")){
	u = u.replaceAll("https://","http://");
	u = u.replaceAll(":8181",":8180");
	u = u.split("WEB-INF")[0];
	response.sendRedirect(u);
}
%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<head>
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"/> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>ib system</title>
<link href="<c:url value='/css_m/style.css?ver=2'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/placeholders.min.js'/>"></script>
<script>var contextRoot="${pageContext.request.contextPath}";</script>

<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<script type="text/JavaScript" src="<c:url value='/js/common.js'/>"></script><!-- jquery , ajaxRequest, etc -->
<script type="text/JavaScript" src="<c:url value='/js/m/mobile.js?ver=2'/>"></script><!-- jquery , ajaxRequest, etc -->

<!-- alert   -->
<link href="<c:url value='/css_m/sweetalert.css'/>" rel="stylesheet" type="text/css"> <!-- ,메뉴  css  -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/m/sweetalert.min.js"></script><!-- util folder -->

<script>
var g_ver = "1.1";		//앱버전


$(document).ready(function(){
	
	callMobileVersion();
	setTimeout(function() {
		callMobileInfo();		//모바일 정보요청
    }, 100);
	

	
	var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson');


	jQuery(function () {
	    if (!("placeholder" in document.createElement("input"))) { 
	        jQuery(":input[placeholder]").each(function () {
	            var $this = jQuery(this);
	            var pos = $this.offset();
	            if (!this.id) this.id = "jQueryVirtual_" + this.name;
	            
	        }).focus(function () {
	            var $this = jQuery(this);
	            $this.addClass("focusbox");
	            jQuery("#jQueryVirtual_label_" + $this.attr("id")).hide();
	        }).blur(function () {
	            var $this = jQuery(this);
	            $this.removeClass("focusbox");
	            if(!jQuery.trim($this.val())) 
	                jQuery("#jQueryVirtual_label_" + $this.attr("id")).show();
	            else jQuery("#jQueryVirtual_label_" + $this.attr("id")).hide();
	        }).trigger("blur");
	    }
		if('<c:out value='${idCnt}'/>' == 0 && '<c:out value='${idCnt}'/>' != '') {
			swal("ID를 확인하세요.");
			document.getElementById('usrId').focus();
			
		}else if('<c:out value='${passCnt}'/>' == 0 && '<c:out value='${passCnt}'/>' != '') {
			swal("PASSWORD를 잘못입력하셨습니다.");
			document.getElementById('usrPw').focus();
			
		}
	});

	
	var loginId = localStorage.getItem('synergyloginId');
	var loginPw = localStorage.getItem('synergypassword');
	
	
	if(loginId !='' && loginId !=null && loginPw !='' && loginPw !=null){
		
		$("#usrId").val(loginId);
		$("#usrPw").val(loginPw);
		
		if('${userLoginInfo}' != null && '${accessPage}' == 'alarm' ){	
			setTimeout(function() {
				 doLogin();
   	       }, 100);
		}
	}
	
	$("#usrId").focus();	
});

function getTodayTime(){
	var today = new Date();
	
	var h=today.getHours();
	var m=today.getMinutes();
	
	if(h===6){
		if(m===30){
			setTimeout("window.location.reload()",1*60*1000);
		}
		setTimeout("getTodayTime()", 1*60*1000);
	}else{
		setTimeout("getTodayTime()", 40*60*1000);
	}
}
getTodayTime();


//로긴 (ib로긴 )
function doLogin(){

	var frm = document.loginForm;
	
	
	var url = contextRoot + "/m/doLogin.do";
	var param = {
			ip:			frm.ip.value,
			loginDt:	frm.loginDt.value,
			usrId:		frm.usrId.value,
			usrPw:		frm.usrPw.value,
	}
	
	var callback = function(result){
		
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;
		
		
		if( cnt == 0 ){			
			swal("로그인에 실패하였습니다.\n 아이디 또는 패스워드를 확인하세요.");
			return;
		
		}else{
			doSetSessionData();
		}

	};
	
	commonAjax("POST", url, param, callback, false);
}

//세션세팅
function doSetSessionData(){
	
	
	var frm = document.loginForm;
	var url = contextRoot + "/m/getUserInfo.do";
	var param = {
			usrId		:	frm.usrId.value,
			usrPw		:	frm.usrPw.value,
			deviceUuid  :	$("#deviceUuid").val(),
			deviceToken : 	$("#deviceToken").val(),
			deviceType 	: 	$("#deviceType").val(),
			
	}

	var callback = function(result){
		
		var obj = JSON.parse(result);
		var resultObj = obj.resultObject;
		
		if(resultObj.loginId != ''){
			localStorage.setItem('synergyloginId', resultObj.loginId);
			localStorage.setItem('synergypassword', frm.usrPw.value);
			
			location.href ="${pageContext.request.contextPath}/m/main.do";
		}
		else swal("다시 시도해주세요."); return false;
	};
	
	commonAjax("POST", url, param, callback, false);
}




</script>
</head>
<body id="loginWrap">
	<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
	<input type="hidden" id="rgstSabun" value="<c:out value='${userLoginInfo.sabun}'/>">
	<div id="wrap">
		<form id="loginForm" name="loginForm" onkeydown="javascript:if(event.keyCode==13){doLogin();}"  method="post">
			<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>"/>
			<input type="hidden" name="loginDt" value="<%= new java.util.Date() %>"/>
			<input type="hidden" id="deviceUuid" value=""/>
			<input type="hidden" id="deviceToken" value=""/>
			<input type="hidden" id="deviceType" value=""/>
			
			<!--로그인-->
			<div id="loginCheckBox">
				<div id="login_inputBox">
					<ul>
						<li class="userID_st"><label><em class="hide">아이디입력</em><input id="usrId" name="usrId" type="text" required="required" placeholder="USER ID"  autocorrect="off" autocapitalize="off" style="ime-mode:active;" /></label></li>
						<li class="pass_st"><label><em class="hide">비밀번호입력</em><input id="usrPw" name="usrPw" type="password" placeholder="PASSWORD"/></label></li>
						<li><a href="javascript:doLogin();" class="LoginBtnNew">LOGIN</a></li>
					</ul>
				</div>
			</div>
		</form>
	</div>
</body>
</html>