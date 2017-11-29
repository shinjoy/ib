<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Synergy Partners</title>

<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/sp/synergy.css?ver=0.1'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/sp/new_btn.css?ver=0.1'/>" rel="stylesheet" type="text/css">


<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/ajaxRequest.js'/>"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"/></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"/></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<style>

div {text-align: left;}
body {margin:auto;}
.box {
    margin: 0 0;
    margin-top: 10px;
    width:300px;
    height: 500px;
    border: 1px solid #b4cef3;
}
.shadow {
    box-shadow:  1px 1px 5px #444;
}

.soflow {
   -webkit-appearance: button;
   -webkit-border-radius: 2px;
   -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
   -webkit-padding-end: 20px;
   -webkit-padding-start: 2px;
   -webkit-user-select: none;
   background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
   background-position: 97% center;
   background-repeat: no-repeat;
   border: 1px solid #AAA;
   color: #555;
   font-size: inherit;
   margin: 00px;
   overflow: hidden;
   padding: 5px 10px;
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 250px;
}

.soflow-enable {
   -webkit-appearance: button;
   -webkit-border-radius: 2px;
   -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
   -webkit-padding-end: 20px;
   -webkit-padding-start: 2px;
   -webkit-user-select: none;
   background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#FFFFFF, #FFFFFF 40%, #FFFFFF);
   background-position: 97% center;
   background-repeat: no-repeat;
   border: 1px solid #AAA;
   color: #555;
   font-size: inherit;
   margin: 00px;
   overflow: hidden;
   padding: 5px 10px;
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 250px;
}

.soflow-color {
   color: #fff;
   background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#779126, #779126 40%, #779126);
   background-color: #779126;
   -webkit-border-radius: 20px;
   -moz-border-radius: 20px;
   border-radius: 20px;
   padding-left: 15px;
}

.button {
   border: 1px solid #0a3c59;
   background: #3e779d;
   background: -webkit-gradient(linear, left top, left bottom, from(#65a9d7), to(#3e779d));
   background: -webkit-linear-gradient(top, #65a9d7, #3e779d);
   background: -moz-linear-gradient(top, #65a9d7, #3e779d);
   background: -ms-linear-gradient(top, #65a9d7, #3e779d);
   background: -o-linear-gradient(top, #65a9d7, #3e779d);
   background-image: -ms-linear-gradient(top, #65a9d7 0%, #3e779d 100%);
   padding: 8px 16px;
   -webkit-border-radius: 12px;
   -moz-border-radius: 12px;
   border-radius: 12px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #7ea4bd 0 1px 0;
   color: #ffffff;
   font-size: 13px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border: 1px solid #0a3c59;
   text-shadow: #1e4158 0 1px 0;
   background: #3e779d;
   background: -webkit-gradient(linear, left top, left bottom, from(#65a9d7), to(#3e779d));
   background: -webkit-linear-gradient(top, #65a9d7, #3e779d);
   background: -moz-linear-gradient(top, #65a9d7, #3e779d);
   background: -ms-linear-gradient(top, #65a9d7, #3e779d);
   background: -o-linear-gradient(top, #65a9d7, #3e779d);
   background-image: -ms-linear-gradient(top, #65a9d7 0%, #3e779d 100%);
   color: #fff;
   }
.button:active {
   text-shadow: #1e4158 0 1px 0;
   border: 1px solid #0a3c59;
   background: #65a9d7;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#3e779d));
   background: -webkit-linear-gradient(top, #3e779d, #65a9d7);
   background: -moz-linear-gradient(top, #3e779d, #65a9d7);
   background: -ms-linear-gradient(top, #3e779d, #65a9d7);
   background: -o-linear-gradient(top, #3e779d, #65a9d7);
   background-image: -ms-linear-gradient(top, #3e779d 0%, #65a9d7 100%);
   color: #fff;
   }
</style>

</head>
<body>
<form name="myInfo" id="myInfo" action="" method="post">
	<div class="gtabZone">
		<ul>
	    	<li class="off"><a href="javascript:fnObj.goMyInfoView();">내정보</a></li>		        
	    </ul>
	    <ul>
	    	<li class="on"><a href="#">구글캘린더 연동</a></li>
	    </ul>
	    
	</div>
	<div id="need_auth" class="shadow" style="width:700px; height: 100px; border: 1px solid #bdc9d6; border-radius: 1em;display:none;">
		<table width="100%">
		<tr>
		<td width="150px">					
		<img src="<c:url value='../images/sp/gcal_icon.png' />" style="margin-left:15px;" >
		</td>
		<td width="40%">
		
		<span style="display:table-cell;vertical-align:middle;margin-left:30px;">인사이드에 일정등록 시<br>구글캘린더에 일정을 등록시킬 수 있습니다.<br>		
		</td>
		<td >
			<span id="googleAuthBtn" style="float:right;">
				<a href="javascript:fnObj.AuthGoogleCalendar();" class="btn_blue" style="margin-right:20px;">Google Calendar 계정 인증하기</a>
				<!-- <a href="javascript:fnObj.AuthGoogleCalendarAccount();" class="btn_blue" style="margin-right:20px;">Google Calendar 계정 인증하기</a>
				 -->
			</span>				
		</td>
		</tr>
		</table>
	</div>
	
	<div id="authenticated" class="shadow" style="width:700px; height: 130px; border: 1px solid #bdc9d6; border-radius: 1em;display:none;">		
		<table width="100%">	
		<tr>
		<td width="150px">
			<img src="<c:url value='../images/sp/gcal_icon.png' />" style="margin-left:15px;" >
		</td>
		<td width="40%">
			일정 등록 캘린더<br>
			<span style="margin-left:0px;">
				<select id="calendarList" class="soflow">
			</select>	
		</td>
		<td >
			<span id="" style="">
				인증된 계정<br> 
			</span>
			<span id="googleEmailInfo" style="">				
			</span></b>
		</td>
		<td>
			<a id="" href="javascript:fnObj.unlinkGoogleAuth();" class="btn_blue" style="margin-top:5px;text-align:left;"> &nbsp;&nbsp;연동해제&nbsp;&nbsp; </a>
		</td>
		</tr>
		</table><!-- tb_titleZone -->
		<div class="btnBox" style="padding-top:0px;text-align:center;">
			<a id="editCal" href="javascript:fnObj.editGoogleAuthInfo();" class="btn_blue" style="text-align:center;"> &nbsp;&nbsp;수&nbsp;&nbsp;&nbsp;정&nbsp;&nbsp; </a>			
			<a id="saveCal" href="javascript:fnObj.saveGoogleAuthInfo();" class="btn_blue" style="text-align:center;display:none"> &nbsp;&nbsp;저&nbsp;&nbsp;&nbsp;장&nbsp;&nbsp; </a>
			<a id="cancelCal" href="javascript:fnObj.cancelGoogleAuthInfo();" class="btn_orange" style="text-align:center;display:none"> &nbsp;&nbsp;취&nbsp;&nbsp;&nbsp;소&nbsp;&nbsp; </a>
	    </div>	
	</div>
	
</form>	
</body>
</html>

<script type="text/javaScript" language="javascript">

var g_perSabun = ${PerSabun}; // 사번 저장			
top.document.title = "내정보";
			
var	fnObj = {
	// 내정보 페이지 이동
	goMyInfoView: function(){
		document.location.href = "${pageContext.request.contextPath}/login/modifyUsrInfo.do";
	},
	
	getAuthInfo: function(){
		$('#myInfo').attr('action', "<c:url value='/AuthGoogleAccount.do'/>").submit();
	},
	
	// 구글 인증관련된 정보 조회(이메일ID, 캘린더 리스트)	
	getGoogleAuthInfo: function(){
		var url = "${pageContext.request.contextPath}/getGoogleAuthInfo.do";			
		
		var param = {				
		};	
		
		var callback = function(result){
			
			var obj = JSON.parse(result).resultObject;
			var googleAuthInfo = obj.googleAuthInfo;
			var calendarList = obj.calendarList;
			
			// 인증된 고객에 맞는 데이타 처리
			if( googleAuthInfo.authFlag == 'Y' ){				
				// 달력리스트 콤보 데이타 셋팅-편집용
				fnObj.setCalendarList(calendarList);
				
				// 현재 저장된 달력 및 이메일 정보 셋팅
				fnObj.setCurrGoogleCalendarInfo(googleAuthInfo);
				
				$('#authenticated').show();
			}
			// 인증을 위한 버튼 보여주기
			else{				
				$('#need_auth').show();
			}
		};
		
		var failFn = function(result){
			// 검색 실패시 메시지 출력
			alert(JSON.stringify(result));
		};
		
		commonAjaxForFail("POST", url, param, callback, failFn, false, '', '');
	},
	
	// 인증정보를 이용해 셋팅된 달력 및 이메일계정 정보 저장
	setCurrGoogleCalendarInfo: function(googleAuthInfo){
		
		if( googleAuthInfo.calendarId == 'NONE'){
			fnObj.saveGoogleAuthInfo();
		}
		
		$('#googleEmailInfo').html(googleAuthInfo.emailAddr);		
		$("#calendarList").val(googleAuthInfo.calendarId);	
		$('#calendarList').attr('disabled', 'disabled');
	},
	
	// 인증정보 편집
	editGoogleAuthInfo: function(){
		$('#calendarList').removeAttr('disabled');
		
		$('#editCal').hide();
		$('#saveCal').show();
		$('#cancelCal').show();
		
		$('#calendarList').attr('class','soflow-enable');
	}, 
		
	// 인증정보 저장
	saveGoogleAuthInfo: function(){		
		var url = "${pageContext.request.contextPath}/UpdateGoogleCalendarInfo.do";			
		
		var param = {				
			PerSabun: g_perSabun,
			calendarId: $('#calendarList').val()
		};
		
		var callback = function(result){				
			$('#calendarList').attr('disabled', 'disabled');
			$('#editCal').show();
			$('#saveCal').hide();
			$('#cancelCal').hide();
			
			$('#calendarList').attr('class','soflow');
		};
		
		var failFn = function(result){
			// 검색 실패시 메시지 출력
			alert(JSON.stringify(result));
		};
		
		commonAjaxForFail("POST", url, param, callback, failFn, false, '', '');
		
	}, 	
	
	// 연동해제
	unlinkGoogleAuth: function(){
		if( confirm('구글계정 연동을 해제하시겠습니까?') ){
			// 구글 연동 해제로직 작성
			var url = "${pageContext.request.contextPath}/UnlinkGoogleAccount.do";			
				
			var param = {
				PerSabun: g_perSabun
			};	
			
			var callback = function(result){	
				//alert('구글계정 연동정보가 삭제되었습니다.');
				location.href = location.href;
			};
			
			var failFn = function(result){
				// 검색 실패시 메시지 출력
				alert(JSON.stringify(result));
			};
			
			commonAjaxForFail("POST", url, param, callback, failFn, false, '', '');
		}
	},
	
	// 편집 취소
	cancelGoogleAuthInfo: function(){		
		$('#calendarList').attr('disabled', 'disabled');
		$('#editCal').show();
		$('#saveCal').hide();
		$('#cancelCal').hide();
		
		$('#calendarList').attr('class','soflow');
	},
	
	
	// 구글인증 페이지 Open
	AuthGoogleCalendar: function(){
		// gapi 를 사용하는 방안 검토
		var authUrl = "https://accounts.google.com/o/oauth2/auth?";
		authUrl += "client_id=" + "918864136875-pbl61quid1jmagffu2oor9dn28gknd4d.apps.googleusercontent.com&";
		authUrl += "redirect_uri=" + "http%3A%2F%2Fib.synergynet.co.kr%3A8180%2FIBsystem%2FAuthGoogleRedirect.do&";
		authUrl += "scope=email%20https://www.googleapis.com/auth/calendar%20https://www.googleapis.com/auth/calendar.readonly&";
		authUrl += "response_type=code&";
		authUrl += "access_type=offline&";
		authUrl += "approval_prompt=force&";
		authUrl += "state=" + g_perSabun;
		
		var popupWindow = window.open(authUrl, '', "height=700,width=800,status=yes,toolbar=no,menubar=no,location=no");
		
		// 팝업 윈도우 close 시 refresh
		var closeCheckInterval = 500;
		var closeCheck = setInterval(function () {
		    try {
		        if(popupWindow == null || popupWindow.closed){
		        	clearInterval(closeCheck);
		        	fnObj.refreshPage();
		        }		        
		    } catch (ex) { }
		}, closeCheckInterval);
	},
	
	// 페이지 갱신
	refreshPage: function(){
		document.location.reload();
	},
	
	// 캘린더 목록 출력
	setCalendarList: function(calendarList){
		for(var idx = 0; idx < calendarList.length; idx++ ){
			var gcalId = calendarList[idx].gcal_id;
			var gcalName = calendarList[idx].gcal_name;
			
			if( gcalName != 'Contacts' && gcalName != '대한민국의 휴일' )
				$("#calendarList").append("<option value='" + gcalId + "'>" + gcalName + "</option>");			  
		}		
    } //end searchTypeSetting    
}

function refreshPage(){
	location.href = location.href;
}
			
/*			
* 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
*/
$(function(){	
	fnObj.getGoogleAuthInfo();		//인증정보 조회
});
			
</script>
