<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Synergy Mobile Info</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="시너지 그룹, 시너지 업무관리 시스템, 시너지 헬퍼, Synergy Helper" />
<meta name="description" content="시너지 그룹 업무관리 시스템 모바일" />
<meta name="copyright" content="Copyright © 2016 Synergy Group. All rights reserved" />
<meta name="author" content="㈜시너지 자산운용 02-586-5982" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">		
<link rel="stylesheet" href="<c:url value='/css_m/sweetalert.css'/>" > <!-- ,메뉴  css  -->


<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/m/sweetalert.min.js"></script><!-- util folder -->

<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->

<script>
$(document).ready(function(){


		 
});

//sms 전송
function sendSmsMobile(){
	
	if($("#phoneNumber").val() == ""){
		swal('번호를 입력해주세요');
		return false;
	}
	
	var url = contextRoot + "/sms/sendSms.do";
	var param = {
			content		 :	"IBsystem APP설치 URL입니다. http://106.250.177.91:8180/"+contextRoot+"/mobileInfo.do",
			categoryType :	"1",
			phoneNumberStr : $("#phoneNumber").val()
			
	};
	
	var callback = function(result){
		
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;
		if(cnt>0){
			swal("발송되었습니다.");
			window.close();
		}else{
			swal("실패하였습니다.");
		}
		
	};
	
	commonAjax("POST", url, param, callback, false);
	
}

</script>
<style>
.sms_poptitle { 
	background: #1c3976;
    color: #fff;
    padding: 0.75rem 1rem;
    font-size: 14px;
    font-weight: bold;
  }
  .sms_popcon { padding:1rem 1rem; text-align:center; font-size:12px; background: #f5f5f5;  }
  .sms_popcon span.title { font-size:14px; font-weight:bold; margin-right:12px; }
  .sms_popcon input { padding:0.4rem 0.4rem 0.4rem; }
  .sms_btnZone { border-top:#cfcfcf solid 1px; text-align:center; padding-top:20px; }
  .sms_btnZone button { display:inline-block; width:70px;
    padding: 0.2rem 0.3rem;
    border: 1px solid #43444c;
    font-size: 0.9rem;
    background: #3a4663;
    color: white;
    border-radius: 4px;
     }
  
  
</style>
</head>
<body style="margin: 0;">
	<div class="sms_poptitle">SMS로 URL보내기</div>
	<div class="sms_popcon">
		<p><label><span class="title">핸드폰번호</span><input type="text" id="phoneNumber" value="${userLoginInfo.phn1}"></label></p>
	</div>
	<div class="sms_btnZone"><button type="button" class="btn_navy" onclick="sendSmsMobile();">보내기</button></div>
</body>
</html>