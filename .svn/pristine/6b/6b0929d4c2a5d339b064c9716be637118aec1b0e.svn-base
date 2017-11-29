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
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, height=device-height"> -->
<%-- 
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
--%>
<title>ib system</title>
<link href="<c:url value='/css/new_ib.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/placeholders.min.js'/>"></script>
<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="<c:url value='/js/sys/utils.js?ver=0.1'/>" ></script><!-- 20160108 -->
<script type="text/JavaScript" src="<c:url value='/js/common.js?ver=0.1'/>"></script><!-- jquery , ajaxRequest, etc -->

<script>
$(document).ready(function(){
	var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson');
	for (var word in mobileKeyWords){
	    if (navigator.userAgent.indexOf(mobileKeyWords[word]) != -1){
	    	<c:if test="${userLoginInfo == null}">
	        $("#loginCheckBox").css("min-width","100%");
	        $("#loginCheckBox").css("min-width","100%");	        
	        </c:if>
	         
	        break;
        }else{
	        $("#loginCheckBox").css("min-width","1126px");
	        // $("#main").css("min-width","560px");
	        //$("#mainTopMenu").css("width","70%");
	        $("#loginOut span").css("display","");
        }
	}
	if($(window).width()<1010){
		widthAuto();
		//$("#main").css("min-width","1126px");
	}


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
		alert("ID를 확인하세요.");
		document.getElementById('usrId').focus();
		
	}else if('<c:out value='${passCnt}'/>' == 0 && '<c:out value='${passCnt}'/>' != '') {
		alert("PASSWORD를 잘못입력하셨습니다.");
		document.getElementById('usrPw').focus();
		
	}
	});
	$('#ckbx').click(function(){
		 var isRemember;
		 var checkbox = $(this);
	
		 if(checkbox.attr('checked'))
		 {
			 isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");  
			 if(!isRemember) 			 
				 checkbox.attr('checked',false); 
		 }
	});
	$("#usrId").focus();	
});

function widthAuto(w){
	if(w!='' && parseInt(w) > 0){
		$("#loginCheckBox").css("min-width",w);
		console.log('input width px '+w);
	}else{
		$("#loginCheckBox").css("min-width","100%");
		console.log('input width % '+$(window).width());
	}
		
	$("#loginCheckBox").css("min-width","");
	$("#loginCheckBox").css("background-color","white");
}

function getTodayTime(){
	var today = new Date();
	
	var h=today.getHours();
	//if(h>12){h-=12;ap='PM';}else{ap='AM';}
	var m=today.getMinutes();
	//var s=today.getSeconds();

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

function reloadpage(){
	location.reload();
	location.href ="<c:url value='/index.do' />";
}

function searchProcess(th){
	var frm = $('#movePage000');//sender form id
	frm.append('<input type="hidden" id="searCh" name="search"/>');
	$("#searCh").val($(th).parent().find('input').val());
	frm.attr('action',"<c:url value='/network/integratedSearch.do' />");
	frm.submit();
	$("#searCh").remove();
}
function setsave(name, value, expiredays)
{
 var today = new Date();
 today.setDate( today.getDate() + expiredays );
 document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
}
function saveLogin(id)
{
	
 if(id != "")
 {
  // userid 쿠키에 id 값을 7일간 저장
  setsave("userid", id, 7);
  
 }else{
  // userid 쿠키 삭제
  setsave("userid", id, -1);
  
 }
}

function getLogin()
{
 // userid 쿠키에서 id 값을 가져온다.
 var cook = document.cookie + ";";
 var idx = cook.indexOf("userid", 0);
 var val = "";
 if(idx != -1)
 {
  cook = cook.substring(idx, cook.length);
  begin = cook.split("=");
  end = begin[1].indexOf(";");
  val = unescape( begin[1].substring(0, end));
 }
 // 가져온 쿠키값이 있으면
 if(val!= "")
 {
  //document.frm.id.value = id;
  //document.frm.idcheck.checked = true;
  $('#usrId').val(val);
  $('#ckbx').attr('checked',true);
 }
}

function submit0(){
	//if(companyName.idcheck.checked) saveLogin(frm.id.value);	
	if($('#ckbx').attr('checked')) saveLogin($('#usrId').val());
	 else saveLogin("");
	
	document.getElementById('companyName').submit();	
}
function dispLeft(){
	return $('#left').css('display');
}

//로긴 (ib로긴 > inside로긴)
function doLogin(){

	var frm = document.companyName;
	
	var url = contextRoot + "/loginProcess.do";
	var param = {
			ip:			frm.ip.value,
			loginDt:	frm.loginDt.value,
			usrId:		frm.usrId.value,
			usrPw:		frm.usrPw.value
	};
	
	var callback = function(result){
		
		if( result.length == 0 ){			
			alert("로그인에 실패하였습니다. 아이디 또는 패스워드를 확인하세요.");
			return;
		}
		
		var obj = JSON.parse(result);
				
		parent.document.location.href = contextRoot;
		
	};
	
	var failcallback = function(){
		alert("로그인에 실패하였습니다. 아이디 또는 패스워드를 확인하세요.");
	};
	
	commonAjaxForFail("POST", url, param, callback, failcallback);
}

</script>
</head>
<body onLoad="getLogin()"  id="loginWrap">

<!--[if lt IE 9]> <mce:script src="//html5shiv.googlecode.com/svn/trunk/html5.js" mce_src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></mce:script> <![endif]-->
<!-- [if lt IE]>
<script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
<script>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/chrome-frame/1/CFInstall.min.js"></script>
    <load target="http://ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js" targetie="IE" />
    <script type="text/javascript">window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
<![endif]-->
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<input type="hidden" id="rgstSabun" value="<c:out value='${userLoginInfo.sabun}'/>">
<div id="wrap">
	<section>
		<article>
		<form id="companyName" name="companyName" onkeydown="javascript:if(event.keyCode==13){doLogin();}"  method="post">
		
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>"/>
		<input type="hidden" name="loginDt" value="<%= new java.util.Date() %>"/>
		<div id="skipNavigation">
			<p><a href="#login_inputBox">메뉴 건너뛰기</a></p>
		</div>
		<hr />
			<!--로그인-->
		    <div id="loginCheckBox">
		    	<h1><img src="<c:url  value='/images/main/h1_logo_ib.gif'/>" alt="SYNERGY IB-SYSTEM" /></h1>
		        <p class="loginDes">
		        	시너지 가족여러분 <strong>IB_System</strong>에 오신것을 환영합니다~!<br>
		        	오늘하루도 힘내세요~!
		        <p>
		        <div id="login_inputBox">
		        	<ul>
		            	<li class="userID_st"><label><em class="hide">아이디입력</em><input id="usrId" name="usrId" type="text" required="required" placeholder="ID" /></label></li>
						<li class="pass_st"><label><em class="hide">비밀번호입력</em><input id="usrPw" name="usrPw" type="password" required="required" placeholder="PASSWORD"/></label></li>
						<li class="remembertxt"><label><input id="ckbx" type="checkbox" class="check_st" />ID 저장하기</label></li>
						<li class="remembertxt"><a href="javascript:doLogin();" class="LoginBtnNew"><em class="hide">LOGIN</em></a></li>
		            </ul>
		        </div>
		        <div class="login_copy">
		            <p>Copyright (c) 2016 Synergy IB-System. All Rights Reserved.</p>
		        </div>
		    </div>
		</form>
		</article>
	</section>
<!-- main contents -->
	
<!-- main contents -->
<!-- footer -->
	<footer>
	</footer>
<!-- footer -->
</div>
</body>
</html>