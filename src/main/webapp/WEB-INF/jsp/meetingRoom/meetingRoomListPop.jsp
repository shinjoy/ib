<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회의실 예약 내역</title>

<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/card.js'/>" ></script>
<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->


<link href='${pageContext.request.contextPath}/css/fullCalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/css/fullCalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<link href='${pageContext.request.contextPath}/css/fullCalendar/scheduler.min.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/js/fullCalendar/moment.min.js'></script>
<script src='${pageContext.request.contextPath}/js/fullCalendar/fullcalendar.js'></script>
<script src='${pageContext.request.contextPath}/js/fullCalendar/scheduler.min.js'></script>


<style type="text/css">

.wtime{
	width:6em;
}

.wMeet{
	width:10.8em;
}

#containerWrap {
    padding: 0px 9px 9px 9px;
}

 #container {
    width: 249px;
    margin: 0 auto;
}


.fc-widget-header{background:#dfe3e8;}
.other_rsv_div{background:rgb(204, 204, 204);border:1px solid #b0b8bb;color:black;}		/* 타인 div */


</style>
</head>

<body>

<div id="containerWrap" style="margin:10px;">
	<strong style="font-size:16px;font-weight:bold;">회의실 예약내역(${choiceDate})</strong>
	<div id="dataArea"></idv>    
	
</div> <!-- containerWrap -->	

		
	
</body>
</html>

<script type="text/javascript">

var g_meetingRoomList = [];
var g_rsvList = [];

var fnObj = {
		
		//################# init function :S #################
		
		//선로딩코드
		preloadCode: function(){
			
			//회의실관리와 연계하여 회의실리스트 가져오기로 변경 20170907 ksm
			var url = contextRoot + "/meetingRoom/getMeetingRoomList.do";
			
			var param = {enable : 'Y'};
			
			var callback = function(result){
				var obj = JSON.parse(result);
				var list = obj.resultList;	
	    		
	    		for(var i=0;i<list.length;i++) {
	    			g_meetingRoomList.push({id : list[i].meetingRoomId , title : list[i].meetingRoomNm});
	    		}
			};
			commonAjax("POST", url, param, callback, false);
		
		
		},
		
		//화면세팅
	    pageStart: function(){
	    	
	    
	    	
	    },//end pageStart.
	    
	 	//검색
	    doSearch: function(){ 
	    	
	    	
	    	
			var url = contextRoot + "/meetingRoom/getMeetingRoomRsvList.do";
	    	var param = {
	    					choiceDate 		: '${choiceDate}',
	    					meetingRoomId 	: ''
	    				};
	    	
	    	
	    	var callback = function(result){
	    		
	    		var obj = JSON.parse(result);
	    		var list = obj.resultList;	
	    	
	    		g_rsvList = list ;			//전역변수로 예약내역리스트 담아둠
	    	
	    	};
	    	commonAjax("POST", url, param, callback, false);
	    	
	    },//end doSearch
	    
	    
	  	//calendarGrid set
	   	setCalendarGrid : function(selectDate){
	   		
			$('#dataArea').fullCalendar({
				
				schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
				defaultView: 'agendaDay',
				defaultDate: '${choiceDate}',
				editable: false,
				selectable: false,
				eventLimit: true, 				//더보기 갯수
				minTime : '08:00:00',			//표시최소시간
				maxTime : '22:00:00',			//표시최대시간
				allDaySlot : false,				//하루종일 사용 여부
				slotEventOverlap: false,		//겹침 사용 (시간중복시 오버랩 사용여부)
				lazyFetching : false,
				
			
				header: {
					left: '',	//왼쪽 <> today 버튼 
					center: '',			//title 표시
					right: ''			//month,agendaWeek,agendaDay,listWeek 등 등 
				},
				
				views: {
					agendaTwoDay: {
						type: 'agenda',
						duration: { days: 2 },
						groupByDateAndResource : true,	//그룹 표시
						eventLimit: 1 ,
						
					}
				},
				
				titleFormat:'YYYY/MM/DD',		// 타이틀 포맷 형식 
				smallTimeFormat : 'HH시',
				timeFormat: 'HH:mm',
				contentHeight: 580,				// 높이 -- 지정가능
				aspectRatio : 2.3,				// 달력의 너비와 높이의 종횡비를 결정 숫자가 클수록 높이가 낮아짐
				
				//-- 데이터 셋 S
				
				resources: g_meetingRoomList, 	// 컬럼 리스트  ... ex> { id: 'b', title: 'Room B', eventColor: 'green' }, 
				
			    eventSources: [ {overlap : false, events: g_rsvList} ],  //view List  [{ id: '1', resourceId: '31', start: '2017-03-07T17:00:00', end: '2017-03-07T18:00:00', title: 'event 1' } ],	
	 			
	 			//-- 데이터 셋 E
	 			
	 			selectHelper: true,
	 			
			});
	   	},
	    

};



/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	fnObj.doSearch();
	fnObj.setCalendarGrid();
	
});

</script>