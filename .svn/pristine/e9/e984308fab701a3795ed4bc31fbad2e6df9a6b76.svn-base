<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ include file ="./includeJSP/header.jsp" %> 
<%@ include file ="./includeJSP/commonPopAll.jsp" %> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css_m/refont.css">

<script>

$(document).ready(function(){
	
	var loginId = localStorage.getItem('synergyloginId');
	var loginPw = localStorage.getItem('synergypassword');
	
	if(loginId =='' || loginPw =='' ||'${userLoginInfo}' == null){

		location.href ="${pageContext.request.contextPath}/m/login.do";
		
	}else{
		
			
		mainObj.getNewCount();
			
	}
	
});


var mainObj = {
	
	getNewCount : function(){
		
		var mezzLYn = '${userLoginInfo.mezzL}';		//메자닌 상장 권한
		var mezzNYn = '${userLoginInfo.mezzN}';		//메자닌 비상장 권한
		
		if('${userLoginInfo.permission}' > '00020' || '${userLoginInfo.id}' == 'gjh'){	//개발자 대표님 무조건 Y
			mezzLYn = 'Y';
			mezzNYn = 'Y';
		}
		
		var url = contextRoot + "/m/mainCount.do";
		var param = {
				allDealYn : mezzNYn,		//메자닌 권한 여부
				date	  : new Date().yyyy_mm_dd(),
				
				
				
		};
		
		var callback = function(result){
			var obj = JSON.parse(result);
			var resultObj = obj.resultObject;
			
			var dealCount = resultObj.dealCount;
			var dealCommentCount = resultObj.dealCommentCount;
			
			//딜 갯수
			if(dealCount*1 >0){
				if(dealCount>99) dealCount ='99+';
				$("#dealCntArea").html(dealCount);
				$("#dealCntArea").show();
			
			}else{
				$("#dealCntArea").html();
				$("#dealCntArea").hide();
			}
			
			//댓글 갯수
			if(dealCommentCount*1 >0){
				if(dealCommentCount*1 >99) dealCommentCount ='99+';
				$("#dealCommentCntArea").html(dealCommentCount);
				$("#dealCommentCntArea").show();
				
			}else{
				$("#dealCommentCntArea").html();
				$("#dealCommentCntArea").hide();
			}
			
			
			if(resultObj.accessPage  == 'alarm'){
				
				commonPopAllObj.alarmListMain(); 
			}	
			
			
		};
		
		commonAjax("POST", url, param, callback, false);
		
	}
	
	
};


</script>

<body class="mobile_main_bg">
<input type="hidden" name="ip" id="ip" value="<%=request.getRemoteAddr() %>"/>
<input type="hidden" name="loginDt" id="loginDt" value="<%= new java.util.Date() %>"/>
	 <div id="wrap_main">
	
	 	<button type="button" class="btn_logout" onclick="javascript:location.href='${pageContext.request.contextPath}/m/logout.do'"><em>로그아웃</em></button>
    	<div class="mobile_m_titleZone">
            <h1>IBsystem <span>ver.1.1</span></h1>
            <p class="destxt1">시너지 IBsystem 모바일에 오신것을 환영합니다.</p>
           	<p class="destxt2">딜목록, 딜등록, Push 알림기능 추가</p>
        </div>
        <ul class="mobile_mn_list">
        	<li><a href="${pageContext.request.contextPath}/MbScheduleCal.do"  class="icon_mn_work">업무일정</a></li>
        	<li><a href="${pageContext.request.contextPath}/m/deal/dealMain.do" class="icon_mn_deal">딜</a><span id="dealCntArea" style="display:none;"></span></li>
            <li><a href="${pageContext.request.contextPath}/m/deal/dealCommentMain.do" class="icon_mn_comment">코멘트</a><span id="dealCommentCntArea" style="display:none;"></span></li>
        	<li><a href="${pageContext.request.contextPath}/m/car/carRecord.do" class="icon_mn_support">차량운행</a></li>
            <li><a href="${pageContext.request.contextPath}/m/meetingRoom/meetingRoomMgmt.do" class="icon_mn_approve">회의실예약</a></li>
        	<li><a href="${pageContext.request.contextPath}/m/address/addressMain.do" class="icon_mn_mypage">직원전화</a></li>
        	<!-- <li style="opacity:0.5;"><a href="javascript:alert('준비중입니다.')" class="icon_mn_info">업무전달</a></li>
            <li style="opacity:0.5;"><a href="javascript:alert('준비중입니다.')" class="icon_mn_deal">딜등록</a></li>
            <li style="opacity:0.5;"><a href="javascript:alert('준비중입니다.')" class="icon_mn_network">네트워크</a></li>
            <li style="opacity:0.5;"><a href="javascript:alert('준비중입니다.')" class="icon_mn_report">리포트</a></li>
			<li style="opacity:0.5;"><a href="javascript:alert('준비중입니다.')" class="icon_mn_board">게시판</a></li> -->
        </ul>
    </div>
</body>
</html>