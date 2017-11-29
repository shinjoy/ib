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
<title>회의실예약</title>

<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/card.js'/>" ></script>
<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>
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

.applyinput_B {
    border: #cfcfcf solid 1px;
    height: 26px;
    background: #fff;
    vertical-align: middle;
    text-indent: 4px;
    box-sizing: border-box;
    border-radius: 0;
    font-size: 11px;
    width: 80px;
}
.selectHeight{
	height:25px;
}
.btn_calendar {
    background: url(../images/common/board/btn_board_collection.gif) no-repeat;
    width: 18px;
    height: 18px;
    display: inline-block;
    vertical-align: middle;
    background-position: -27px 3px;
    padding: 3px 8px 5px 0px;
    font-size: 11px;
}

.btn_standard {
    border-radius: 2px;
    padding: 4px 8px 4px 8px;
    margin-left: 10px;
}

.btn_small {
    border-radius: 2px;
    padding: 2px 4px 2px 4px;
    margin-left: 5px;
    font-size: 10px; 
    background: -webkit-linear-gradient(top, rgba(245,246,246,1) 2%,rgba(245,246,246,1) 41%,rgba(219,220,226,1) 83%,rgba(219,220,226,1) 83%);
    border:1px solid #c7cace;
}

#containerWrap {
    padding: 0px 9px 9px 9px;
}

/* 회의실별 테이블 */

.meeting_room_table {
    letter-spacing: -0.1px;
    width: 100%;
    overflow: auto;
}

.meeting_room_table thead th {
    background: #dfe3e8;
    font-weight: normal;
    color: #33383f;
    line-height: 1.4;
    padding: 3px 3px 3px;
    text-align: center;
    border-right: #b9c1ce solid 1px;
    border-bottom: #b1b5ba solid 1px;
    border-top: #b1b5ba solid 1px;
    border-left: #b9c1ce solid 1px;
    font-size: 13px;
    vertical-align: middle;
    letter-spacing: -0.05em;
}

.meeting_room_table tbody td{
    border-right: #dadcdd solid 1px;
    border-bottom: #dadada solid 1px;
    vertical-align: top;
    text-align: center;
    font-size: 12px;
    line-height: 1.4;
    color: #636c7f;
    letter-spacing: 0px;
    padding: 3px 10px 3px;
    min-hight : 20px;
}

.meeting_room_table tbody th{
    border-right: #dadcdd solid 1px;
    border-bottom: #dadada solid 1px;
    border-left: #dadada solid 1px;
    vertical-align: middle;
    text-align: center;
    font-size: 12px;
    line-height: 1.4;
    color: #636c7f;
    letter-spacing: 0px;
    padding: 3px 10px 3px;
}

.meeting_room_table tbody tr:nth-child(2n) { background:#f7f7f7; }


/* 주별 테이블 */

.meeting_room_week_table {
    letter-spacing: -0.1px;
    width: 100%;
    overflow: auto;

}

.meeting_room_week_table thead th {
    background: #dfe3e8;
    font-weight: normal;
    color: #33383f;
    line-height: 1.4;
    padding: 8px 3px 8px;
    text-align: center;
    border-right: #b9c1ce solid 1px;
    border-bottom: #b1b5ba solid 1px;
    border-top: #b1b5ba solid 1px;
    border-left: #b9c1ce solid 1px;
    font-size: 13px;
    vertical-align: middle;
    letter-spacing: -0.05em;
    width:200px;
}

.meeting_room_week_table tbody td{
    border-right: #dadcdd solid 1px;
    border-bottom: #dadada solid 1px;
    vertical-align: top;
    text-align: center;
    font-size: 12px;
    line-height: 1.4;
    color: #636c7f;
    letter-spacing: 0px;
    padding: 6px 10px 3px;
    min-hight : 20px;
}

.meeting_room_week_table tbody td:first-child{
    border-left: #dadada solid 1px;
    
}



/*  예약하기 팝업 테이블 */

.meeting_rsv_room_table {
    letter-spacing: -0.1px;
    width: 100%;
    overflow: auto;
    border-top: #b1b5ba solid 1px;
    width: 500px;
}

.meeting_rsv_room_table  tbody th {
    background: #dfe3e8;
    font-weight: normal;
    color: #33383f;
    line-height: 1.4;
    padding: 3px 3px 3px  6px;
    border-right: #b9c1ce solid 1px;
    border-bottom: #b1b5ba solid 1px;
    border-left: #b9c1ce solid 1px;
    font-size: 12px;
    vertical-align: middle;
    text-align:left;
    letter-spacing: -0.05em;
    font-weight:bold;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
.meeting_rsv_room_table tbody td{
    border-right: #dadcdd solid 1px;
    border-bottom: #dadada solid 1px;
    vertical-align: top;
    text-align: center;
    font-size: 12px;
    line-height: 1.4;
    color: #636c7f;
    letter-spacing: 0px;
    text-align:left;
    padding: 6px 8px 8px 10px;
}


.meeting_rsv_room_table tbody tr:nth-child(2n) { background:#f7f7f7; }


/* 팝업디자인 */

.Pstyle {
 opacity: 0;
 display: none;
 position: relative;
 width: auto;
 padding: 20px;
 background-color: #fff;
}

.b-close {
position: absolute;
 right: 10px;
 top: 5px;
 display: inline-block;
 cursor: pointer;
 font-size: 20px;
}
 
.otherDay{
	color: #3592f5;
	font-weight:bold;	
	 
}


/* 탭 */

ul.tabs {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    height: 32px;
    border-bottom: 1px solid #eee;
    border-left: 1px solid #eee;
    width: 100%;
    font-family:"dotum";
    font-size:12px;
}
ul.tabs li {
    float: left;
    text-align:center;
    cursor: pointer;
    width:82px;
    height: 31px;
    line-height: 31px;
    border: 1px solid #eee;
    border-left: none;
    font-weight: bold;
    background: #fafafa;
    overflow: hidden;
    position: relative;
}
ul.tabs li.active {
    background: #FFFFFF;
    border-bottom: 1px solid #FFFFFF;
}
.tab_container {
    border: 1px solid #eee;
    border-top: none;
    clear: both;
    float: left;
    background: #FFFFFF;
}
.tab_content {
    padding: 5px;
    font-size: 12px;
    display: none;
}
.tab_container .tab_content ul {
    width:100%;
    margin:0px;
    padding:0px;
}
.tab_container .tab_content ul li {
    padding:5px;
    list-style:none
}
;
 #container {
    width: 249px;
    margin: 0 auto;
}

/* 회의실별 날짜 <> 표기 */

.fc-widget-header{height:25px;background:#dfe3e8;}

.fc-content{padding: 10px;}

.fc-button {
    box-sizing: border-box;
    height: 2.1em;
    font-size: 1em;
    white-space: nowrap;
    cursor: pointer;
    margin: 0px;
    padding: 0px 0.8em;
    margin: 0px 0px 0px -5px;
}

.other_rsv_div{background:rgb(204, 204, 204);border:1px solid #b0b8bb;color:black;}		/* 타인 div */
.noUsed{background:white;}
.enableUsed{background:#f9ffce;}


.rsvDiv{

    border: 1px solid #cccccc;
    padding: 10px;
    border-radius: 7px;
    margin-top: 10px;


}

.myDiv{

    border: 1px solid #207eda;
    padding: 10px;
    border-radius: 7px;
    margin-top: 10px;
    cursor: pointer;


}
</style>
 
 
</head>

<input type="hidden" id="scheduleId" value="0"/>
<input type="hidden" id="rsvId" value="0"/>

<!--====================== 예약하기 박스 : S ===================-->

<div id="popup" class="Pstyle">

  	<span class="b-close">X</span>
	<div class="content" style="height: auto; width: auto;">
		<strong style="font-size:15px; margin-bottom:10px;">  회의실 예약</strong>
		<div  style="margin-top:15px;"> 
			<table class="meeting_rsv_room_table">
				<colgroup>
                    <col width="30%">
                    <col width="*">
                </colgroup>
                <tr>
                	<th>사용 날짜</th>
                	<td>
                		<input type="text" id="rsvDate" class="applyinput_B wdate"/>
						<a href="#" onclick="$('#rsvDate').datepicker('show');return false;" class="btn_calendar" style="margin-top:5px;"></a>
					</td>
                </tr>
                 <tr>
                	<th>사용자</th>
                	<td><span id="userArea"></span></td>
                </tr>
                 <tr>
                	<th>사용시간</th>
                	<td> <span id="timeArea"></span></td>
                </tr>
                 <tr>
                	<th>사용목적</th>
                	<td>
                		<label><input type="radio" name="rsvType" value="schedule" onclick="fnObj.selectRsvType('schedule');"/>일정 선택</label>
						<label><input type="radio" name="rsvType" value="doWrite" onclick="fnObj.selectRsvType('doWrite');"/>직접 입력</label>
						<input type="hidden" id="scheTitle" class="applyinput_B" />
						<!-- 일정선택 시 보여지는 화면 -->
						<div id="scheduleArea" style="display:none;margin-top:0.5em;">
							<span id="scheTitleArea" class="applyinput_B" style="display:inline-block; width:200px;height:2em;"  onclick="fnObj.getScheduleList(this);"></span>
							
							<span class="applyinput_B" style="display:inline-block;cursor:pointer;height:2em;padding:2px;width:50px;border: #9e9fa5 solid 1px;border-radius: 2px;"  onclick="fnObj.refreshField('schedule');">초기화</span>
							<!-- <i class="axi axi-ion-refresh" style="font-size:15px;margin-left:5px;" onclick="fnObj.refreshField('schedule');"></i> -->
							<div id="scheduleListArea" style="box-shadow: 2px 2px 2px 0px grey;display:none; position:absolute;left:20px;width:90%;height: expression( this.scrollHeight > 99 ? 200px : auto ); border:2px solid #cccccc;  background-color:white; z-index:10000;">
								<div id="content" class="content" style="height: auto; width: auto;"></div>
								<div style="margin:1em 0em;text-align:center;"><button type="button" class="btn_small" onclick='$("#scheduleListArea").hide();'>닫기</button></div>
							</div>
							
							
						</div>
						<!-- //일정선택 시 보여지는 화면// -->
					
						<!-- 직접입력 시 보여지는 창 -->
						<div id="doWriteArea" style="display:none;margin-top:0.5em;">
							<input type="text" id="comment" class="applyinput_B" style="display:inline-block; width:200px;height:2em;"/>
							<span class="applyinput_B" style="display:inline-block;cursor:pointer;height:2em;padding:2px;width:50px;border: #9e9fa5 solid 1px;border-radius: 2px;"  onclick="fnObj.refreshField('doWrite');">초기화</span>
						<!-- 	<i class="axi axi-ion-refresh" style="font-size:15px;margin-left:5px;" onclick="fnObj.refreshField('doWrite');"></i> -->
						</div>
                		<!-- //직접입력 시 보여지는 창// -->
                	</td>
                </tr>
                 <tr>
                	<th>회의실</th>
                	<td><span id="meetingRoomArea" style="display:none;" ></span><!-- 회의실 셀렉트박스 --></td>
                </tr>
                 
			</table>
			
			<div style="margin-top:1em;text-align: center;">
				<button name="reg_btn" id="rsvBtn" class="btn_standard" onclick="fnObj.doSave();" style="border:1px solid #323b5a; background-color:#59647a;">
					<span style="color:white;">예약</span>
				</button>
				<button name="del_btn" id="delBtn" class="btn_standard" onclick="fnObj.doDelete();" style="border:1px solid #f33d22; background-color:#ff5834;display:none;">
					<span style="color:white;">삭제</span>
				</button>
			</div>	
			
			
		</div>
	</div>
</div>



<!--====================== 예약하기 박스 : E ===================-->



<body>
<input type="hidden" id="usrId">
<div id="wrap"> 
	<div class="container">
		<div id="wholePanel">
		
    		
		    <div id="rightPanel" style="min-height:950px;">
		    	
		    	<div style="font-weight:bold;font-size:20px;text-align:center;padding:20px;">회의실 이용 현황</div>
		    	
		    	<div style="width:70%;margin-left: auto; margin-right: auto;">
			    	<div style="text-align:right;margin-right:5px;">
			    		<input type="text" id="choiceDate" class="applyinput_B w_st06" readonly="readonly" onchange="fnObj.refreshPage(this.value);"/>
						<a href="#" onclick="$('#choiceDate').datepicker('show');return false;" class="btn_calendar" style="margin-top:5px;"></a>
					  	
			    		<button name="reg_btn" class="btn_standard" onclick="fnObj.openRsvPop();" style="border:1px solid #323b5a; background-color:#59647a;">
							<span id="regTxtSpan" style="color:white;">예약하기</span>
						</button>
						
			    	</div>
			    	
			    	<!-- TAB  -->
			    	<div id="container">
						 <ul class="tabs">
							<li class="active" rel="tabs-1">Day</li>
							<li rel="tabs-2">Week</li>
						    <li rel="tabs-3">Room</li>
						 </ul>
						 
						 
					  	 <div class="tab_container">
					  	 	<!-- Day -->
							  <div id="tabs-1" class="tab_content">
							  	  <div id="dp" style="padding:10px;"></div>
							  </div>
							<!--// Day //-->
							
							<!--// Week //-->  
							  <div id="tabs-2" class="tab_content">
							  	<div class="fc-toolbar fc-header-toolbar" style="margin-left: 1.2em;margin-top: 1em;">
							  	  	<div class="fc-left">
							  	  		<div class="fc-button-group">
							  	  			<button type="button" class="fc-prev-button fc-button fc-state-default fc-corner-left" onclick="fnObj.moveWeek('-7');">
							  	  				<span class="fc-icon fc-icon-left-single-arrow"></span>
							  	  			</button>
							  	  			<button type="button" class="fc-next-button fc-button fc-state-default fc-corner-right" onclick="fnObj.moveWeek('+7');">
							  	  				<span class="fc-icon fc-icon-right-single-arrow"></span>
							  	  			</button>
							  	  		</div>
							  	  		<button type="button" id="weekBtn" class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right  fc-state-disabled"  style="margin-left: 0.5em;padding:6px;" onclick="fnObj.moveWeek('week');">this week</button>
							  	  	</div>
							  	  	<div class="fc-right"></div>
							  	  	<div class="fc-center"><h2 id="weekDateArea">2017/03/10</h2></div>
							  	  	<div class="fc-clear"></div>
							  	</div>				
							  	<div id="weekArea" style="padding:10px;"></div>
							  </div>
					  		<!--// Week //-->  
					  		
					  		<!-- room -->
							  <div id="tabs-3" class="tab_content">
							  
							  	  <div class="fc-toolbar fc-header-toolbar" style="margin-left: 1.2em;margin-top: 1em;">
							  	  	<div class="fc-left">
							  	  		<div class="fc-button-group">
							  	  			<button type="button" class="fc-prev-button fc-button fc-state-default fc-corner-left" onclick="fnObj.moveDate('-1');">
							  	  				<span class="fc-icon fc-icon-left-single-arrow"></span>
							  	  			</button>
							  	  			<button type="button" class="fc-next-button fc-button fc-state-default fc-corner-right" onclick="fnObj.moveDate('+1');">
							  	  				<span class="fc-icon fc-icon-right-single-arrow"></span>
							  	  			</button>
							  	  		</div>
							  	  		<button type="button" id="todayBtn" class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right  fc-state-disabled"  style="margin-left: 0.5em;padding:6px;" onclick="fnObj.moveDate('today');">today</button>
							  	  	</div>
							  	  	<div class="fc-right"></div>
							  	  	<div class="fc-center"><h2 id="dateArea">2017/03/10</h2></div>
							  	  	<div class="fc-clear"></div>
							  	  </div>
							  	
							  	  <!-- 회의실리스트에서 가져오기 20170907 ksm -->	
								  <select id="meetingRoomId" style="height:26px;width:150px;margin-right:10px;display:none;">
										<option value="">전체</option>
										<c:forEach var="result" items="${meetingRoomList}">
											<option value="${result.meetingRoomId}">${result.meetingRoomNm}</option>
										</c:forEach>
								  </select>
								
									<div id="containerWrap">
								  	 	<table class="meeting_room_table" style="table-layout:fixed;" >
							  	 		 	<colgroup>
					                            <col width="150" /> <!--회의실명-->                            
					                            <col width="200" /> <!--시간-->
					                            <col width="*" /> 	<!--등록 일정-->
					                            <col width="100" /> <!--사용자-->
					                            <col width="100" /> <!--등록자-->
					                        </colgroup>
					                        <thead>
					                            <tr>
					                            	<th>회의실명</th>
					                            	<th>시간</th>
					                            	<th>등록 일정</th>
					                            	<th>사용자</th>
					                            	<th>등록자</th>
					                            </tr>
					                        </thead>
					                        <tbody id="dataArea"></tbody>    
								  	 	</table>
								  	 	<div style="margin-top:10px;">* 사용가능 회의실 표시 (바탕 노란색)</div>
						             </div> <!-- containerWrap -->	
							  </div>
							  <!-- //room// -->
						 </div>
					</div>
					<!-- // TAB //  -->
					
					
				</div>	
		  	</div><!-- rightPanel -->
		    <!--============== RIGHT MENU : E =============-->	
		</div><!-- wholePanel -->
	</div><!-- container -->
</div><!-- Wrap -->

</body>
</html>



<script type="text/javascript">

//Global variables :S ---------------

//공통코드

var myModal = new AXModal();		// instance
var myGrid = new SGrid();		// instance		new sjs
var mySorting = new SSorting();	// instance		new sjs

var g_sabun ="${userLoginInfo.sabun}";					//로그인유저사번
var g_loginId ="${userLoginInfo.id}";					//로그인유저아이디

var g_meetingRoomList =[];				//회의실 리스트
var g_rsvList =[];						//예약 내역 리스트
var g_noRsvList = [];					//예약 불가 리스트 

var g_selectRoomId = 0;
//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		
		//공통코드
		fnObj.setDatepicker('choiceDate');
		$( "#choiceDate" ).val($.datepicker.formatDate('yy-mm-dd', new Date()));
		
		fnObj.setDatepicker('rsvDate');
		$( "#rsvDate" ).val($.datepicker.formatDate('yy-mm-dd', new Date()));
		
		//회의실관리와 연계하여 회의실리스트 가져오기 변경 20170907 ksm
		var url = contextRoot + "/meetingRoom/getMeetingRoomList.do";
		
		var param = {enable : 'Y'};
		
		var callback = function(result){
			var obj = JSON.parse(result);
			var list = obj.resultList;	
    		
    		for(var i=0;i<list.length;i++) {
    			g_meetingRoomList.push({id : list[i].meetingRoomId , title : list[i].meetingRoomNm, textColor: list[i].titleColor});
    		}
		};
		commonAjax("POST", url, param, callback, false);
	},
	
	//화면세팅
    pageStart: function(){
    	
    	//-------------------------- 모달창 :S -------------------------
    	myModal.setConfig({
    		windowID:"myModalCT",

    		width:740,
            mediaQuery: {
                mx:{min:0, max:767}, dx:{min:767}
            },
    		displayLoading:true,
            scrollLock: false,
    		onclose: function(){

    		}
            ,contentDivClass: "popup_outline"

    	});
    	//-------------------------- 모달창 :E -------------------------
    	
    },//end pageStart.
    
 	//검색
    doSearch: function(){ 
    	
    	$("#rsvId").val(0);
    	$("#sabun").val('');
    	
		var url = contextRoot + "/meetingRoom/getMeetingRoomRsvList.do";
    	var param = {
    					choiceDate 		: $("#choiceDate").val(),
    					meetingRoomId 	: $("#meetingRoomId").val()
    				};
    	
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var list = obj.resultList;	
    		
    		
    		for(var i=0;i<list.length;i++) {
    			
    			//내가 쓴게 아니면 어떠한 이벤트도 불가 처리
    			if(list[i].createdBy != '${userLoginInfo.staffSnb}'){
    				list[i].resourceEditable = false;
        			list[i].editable = false;
        			list[i].startEditable = false;
        			list[i].durationEditable = false;
        			list[i].className ='other_rsv_div';
        			
        			
    			}else{
    				list[i].resourceEditable = true;
        			list[i].editable = true;
        			list[i].startEditable = true;
        			list[i].durationEditable = true;
        			
    			}
    			
    			
    		}
    		
    		g_rsvList = list ;			//전역변수로 예약내역리스트 담아둠
    		
    	 	var str ='';
    		var rowCount = 0;
    		var beforeMeetingRoomId =0;
    		
    		
    		var now = new Date();
    		var nowTime = fillzero(now.getHours(), 2) + '' +fillzero(now.getMinutes(), 2) + '' +fillzero(now.getSeconds(), 2);
    
    		
    		//회의실 리스트 수
    		for(var i=0; i<g_meetingRoomList.length;i++){
    			
    			var meetingRoomId = g_meetingRoomList[i].id;
    			rowCount = getCountWithValue(list, 'meetingRoomId', meetingRoomId);	//해당일 예약된건(회의실 별)
    			
    			//회의실이 바뀔때
    			if(meetingRoomId != beforeMeetingRoomId){
    				
    				var nowUseCount = 0;
    				var usedClass ='class="enableUsed"';
    				str +='<tr>';
    				
    				for(var k=0;k<list.length;k++){
    					//지금 시간에 예약 내역이 있는 지 판별
    					if(meetingRoomId == list[k].meetingRoomId 
    							&&( (list[k].startTime.replace(/:/gi,'')< nowTime &&  nowTime < list[k].endTime.replace(/:/gi,'')) )){
    						
    						nowUseCount++;
    					}
    					
    				}
    				
    				//예약건이 있다.
    				if(nowUseCount  != 0) usedClass = 'class="noUsed"';
    				//오늘이 아니면 무조건 no 처리
    				if($("#choiceDate").val() != new Date().yyyy_mm_dd() ) usedClass = 'class="noUsed"';
    				
    	    		str +='<th '+usedClass+' rowspan="'+(rowCount < 3 ? 3 : rowCount)+'"><span >'+g_meetingRoomList[i].title+'</span></th>';
    			
    			}
    			
    			
    			var gridCount =0;
    			for(var k=0;k<list.length;k++){
    				if(list[k].meetingRoomId == meetingRoomId){
    					if(gridCount !=0) str +='<tr>';		//새로운 행 추가시
    					
    					str +='<td>'+list[k].showStartTime+' ~ '+list[k].showEndTime +'</td>';
                		str +='<td style="text-align:left;">'+list[k].comment;
                		
                		//수정 삭제 버튼 세팅
                		if('${userLoginInfo.staffSnb}' == list[k].createdBy) {
                			
    						str +='<span style="margin-left:10px;"><button class="btn_small" onclick="fnObj.editSet('+list[k].rsvId+');"><span style="color:#182198;"><strong>수정</strong></span></button> ';
                			str +='<button class="btn_small" onclick="fnObj.doDelete('+list[k].rsvId+');"><span style="color:red;"><strong>삭제</strong></span></button> <span>';
                			
                		}
                		
                		
                		str +='</td>';
                		str +='<td>'+list[k].rsvUserNm+'</td>';
                		str +='<td>'+list[k].regNm+'</td>';
                		str +='</tr>';
                		
                		gridCount++;
    				}
    			}
    			
    			var emtpyCount =0;
    			
    			//default 3 row
    			if(gridCount <3){
    				for(var k=0;k<3-gridCount;k++){
        				if(emtpyCount !=0) str +='<tr>';
       					
        				str +='<td>  .</td>';
                   		str +='<td>  .</td>';
                   		str +='<td>  .</td>'; 
                   		str +='<td>  .</td>'; 
                   		//str +='<td colspan="3">예약된 내역이 없습니다.</td>'
                   		str +='</tr>';
                    		
                   		emtpyCount++;
        				
        			}
        		}
    			
    			beforeMeetingRoomId =  g_meetingRoomList[i].id;
    		}
    		
    		$("#dataArea").html(str); 
    		
    	};
    	commonAjax("POST", url, param, callback, false);
    	
    },//end doSearch
    
    
    
    
    
    
  	//예약 저장
    doSave : function(fStartTime,fEndTime,fRsvDate,fMeetingRoomId){  //시작 시간, 종료시간, 예약일, 미팅룸 아이디
    	
    	var rsvChk = 'true';
    
    	//매개 변수가 undefined  일 경우는  예약 하기 버튼으로 접근시
    	
    	var selectRoomId = (fMeetingRoomId == undefined ? $("#selectRoomId").val() : fMeetingRoomId);
    	var startTime = (fStartTime == undefined ? $("#startTime").val() : fStartTime);
    	var endTime =  (fEndTime == undefined ? $("#endTime").val() : fEndTime);
    	var rsvDate = (fRsvDate == undefined ? $("#rsvDate").val() : fRsvDate);
    	var rsvType = $("input:radio[name=rsvType]:checked").val();
    	var comment = ( rsvType == 'schedule' ? $("#scheTitle").val() : $("#comment").val());
    	var scheduleId = $("#scheduleId").val();
    	var rsvId = $("#rsvId").val();
    	
    	if(fStartTime  == undefined){	//예약하기 버튼으로 접근시에만 예약 가능 여부 판별하면 된다.
    		rsvChk = fnObj.chkSelectRoom(rsvDate,startTime,endTime,selectRoomId,rsvId);
    	}
    	
    	if(rsvChk == 'false'){
    		alert("이미 예약건이 존재합니다.");
    		return;
    	}
    	
    	if( rsvType == 'schedule' && scheduleId == '0'){	//스케줄 선택시
    		
    		alert("일정을 선택해 주세요");
    	//	$("#scheTitle").focus();
    		return;
    	}
    	
    	if(endTime < startTime ) {
    		alert("시작 시간과 종료시간을 확인해주세요");
    		$("#startTime").focus();
    		return;
    	}
    	
		
		var url = contextRoot + "/meetingRoom/doSaveRsvMeetingRoom.do";
    	var param = {
    					startDate 		: rsvDate,
    					endDate 		: rsvDate,
    					startTime		: startTime,
    					endTime			: endTime,
    					scheduleId		: scheduleId,
    					comment			: comment,
    					rsvUserId		: $("#sabun").val(),
    					meetingRoomId 	: selectRoomId,
    					rsvId			: rsvId
    				};
    	
    	
    	var callback = function(result){
    		
    		
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;	
    		
    		if(cnt>0){
    			$("#rsvId").val(0);
    			alert("저장되었습니다.");
        		$('.b-close').trigger("click");
        		
        		
        		fnObj.refreshPage(rsvDate);
        	
    		}else{
    			alert("실패 하였습니다.");
    		}
    	   
    		
    	};
    	
    	commonAjax("POST", url, param, callback, false);
    },
    
    //삭제
    doDelete : function(rsvId){
    	
    	
    	if(!confirm("삭제 하시겠습니까?")) return;
    	
    	var rsvId = (rsvId >0 ? rsvId :$("#rsvId").val());
    	
    	var url = contextRoot + "/meetingRoom/doDeleteRsvMeetingRoom.do";
    	var param = {
    					rsvId			: rsvId
    				};
    	
    	
    	var callback = function(result){
    		
    		$("#rsvId").val(0);
		
    		$('.b-close').trigger("click");
    		
    		fnObj.refreshPage(1);
    		
    		
    	};
    	
    	commonAjax("POST", url, param, callback, false);
    },
    
   	//calendarGrid set
   	setCalendarGrid : function(selectDate){
   		
		$('#dp').fullCalendar({
			
			schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
			defaultView: 'agendaDay',
			defaultDate: selectDate,
			editable: true,
			selectable: true,
			eventLimit: true, 				//더보기 갯수
			minTime : '08:00:00',			//표시최소시간
			maxTime : '22:00:00',			//표시최대시간
			allDaySlot : false,				//하루종일 사용 여부
			slotEventOverlap: false,		//겹침 사용 (시간중복시 오버랩 사용여부)
			nowIndicator : true,			//현재시간 표시
			lazyFetching : false,
			
			selectOverlap: function(event) {					//신규 drag 겹칠때 return
		        return;
		    },
		    
		    eventOverlap: function(stillEvent, movingEvent) {	//drag 이동 겹칠때 return
		        return;
		    },
		
			header: {
				left: 'prev,next today',	//왼쪽 <> today 버튼 
				center: 'title',			//title 표시
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
 			
 			//-- 이벤트 설정 관련 : S
 			
 			//날짜 변경 로딩 시 이벤트
 			viewRender: function(view,element){		
				var moment = $('#dp').fullCalendar('getDate');
				$( "#choiceDate" ).val(moment.format().split('T')[0]);
				fnObj.doSearch();
				
				$('#dp').fullCalendar( 'removeEvents' );
	            $('#dp').fullCalendar( 'addEventSource', g_rsvList);
	            $('#dp').fullCalendar( 'refetchEvents' );
	            
				
			},
			
 			//선택 이벤트 - selectable 
 			select: function(start, end, jsEvent, view, resource) {
				var startArr = start.format().split('T');
				var endArr = end.format().split('T');
				
				if(startArr.length>1 && endArr.length>1){
					var selectDate = startArr[0];
					var startTime = startArr[1];
					var endTime = endArr[1];
					
					//예약 가능 여부 판별
					var result = fnObj.chkSelectRoom(selectDate,startTime,endTime,resource.id);
					
					if(result == 'true'){
						
						g_selectRoomId = resource.id;
						fnObj.openRsvPop(selectDate,startTime,endTime,resource.id);
						$('#dp').fullCalendar('unselect');
						
					}
					
				}else{
					alert('선택 오류 !!');
				}
				
 			},
 			
 			//데이터 클릭 시
 			eventClick: function(event) {
 				if(event.createdBy == '${userLoginInfo.staffSnb}'){
	 				var selectDate =event.startDate;
	 				var startTime = event.startTime;
	 				var endTime =event.endTime;
	 				var meetingRoomId =event.meetingRoomId;
	 				
	 				$("#rsvId").val(event.rsvId);
	 				$("#scheduleId").val(event.scheduleId);
	 				
	 				var eventObj = {scheduleId : event.scheduleId , comment : event.comment, sabun :event.rsvSabun };
	 				
	 				fnObj.openRsvPop(selectDate,startTime,endTime,meetingRoomId,event.rsvId,JSON.stringify(eventObj));		//수정 창 
 				}
 				
 			},
 			
			// div 이동 시 
 			eventDrop : function(event, delta, revertFunc) {
				
 				var newMeetingNm = getRowObjectWithValue(g_meetingRoomList, 'id', event.resourceId).title;	//새로운 미팅룸
 				var meetingNm = getRowObjectWithValue(g_meetingRoomList, 'id', event.meetingRoomId).title;	//저장 미팅룸 
 				
 				var startTime = ((event.start.format()).split("T")[1]).substring(0,5);
				
 				if (!confirm(event.comment+' : '+meetingNm+' ('+event.showStartTime+') -> ' +newMeetingNm+' ('+startTime+') 로 변경하시겠습니까?')) {
 		            revertFunc();
 		        }else{
 		        	
 		        	var chk = 'true';
 		        	
 		        	var rsvDate = (event.start.format()).split("T")[0];
 		        	startTime = (event.start.format()).split("T")[1];
 		        	var endTime = (event.end.format()).split("T")[1];
 		        	var rsvId = event.rsvId;
 		        	
 		        	if(fnObj.chkSelectRoom(rsvDate,startTime,endTime,event.resourceId,rsvId) == 'false'){
 		        		revertFunc();
 		        	}else{
 		        		$("#rsvId").val(rsvId);
 		        		$("#scheduleId").val(event.scheduleId);
 		        		
 	 		       		//시작 시간, 종료시간, 예약일, 미팅룸 아이디
 	 		       		fnObj.doSave(startTime,endTime,rsvDate,event.resourceId); //변경 사항 저장 .
 		        	}
 		        
 		        }

 		    },
 		    
 		    //div 늘리기 or 줄이기 
 		    eventResize : function(event, delta, revertFunc) {
				
 			    var startTime = ((event.start.format()).split("T")[1]).substring(0,5);
				var endTime = ((event.end.format()).split("T")[1]).substring(0,5);
				
				if (!confirm(event.comment+' : ('+event.showStartTime+' ~ '+event.showEndTime+' -> ' +startTime+' ~ '+endTime+') 로 변경하시겠습니까?')) {
		            revertFunc();
		        }else{
		        	
		        	var chk = 'true';
 		        	
 		        	var rsvDate = (event.start.format()).split("T")[0];
 		        	startTime = (event.start.format()).split("T")[1];
 		        	endTime = (event.end.format()).split("T")[1];
 		        	
 		        	var rsvId = event.rsvId;
 		        	
 		        	if(fnObj.chkSelectRoom(rsvDate,startTime,endTime,event.resourceId,rsvId) == 'false'){
 		        		revertFunc();
 		        	
 		        	}else{
 		        		$("#rsvId").val(rsvId);
 		        		$("#scheduleId").val(event.scheduleId);
 	 		       		//시작 시간, 종료시간, 예약일, 미팅룸 아이디
 	 		       		fnObj.doSave(startTime,endTime,rsvDate,event.resourceId); //변경 사항 저장 .
 		        	}
		        	
		        	
		        } 

		    }
 		    
 		 	//-- 이벤트 설정 관련 : E
		});
   	},
   	
   	//해당 룸의 사용 예약이 있는지 판별
   	chkSelectRoom : function(selectDate,startTime,endTime,meetingRoomId,rsvId){
   		
   		var rslt = 'false';
   		
   		var url = contextRoot + "/meetingRoom/getMeetingRoomRsvList.do";
    	var param = {
    					choiceDate 		: selectDate,
    					meetingRoomId 	: (meetingRoomId == undefined || meetingRoomId == ''  ? '' : meetingRoomId) ,
    					enable			: 'Y',
    					rsvStartTime	: startTime.split(':')[0]+':'+startTime.split(':')[1]+':01',
    					rsvEndTime		: endTime,
    					rsvId			: (rsvId == undefined || rsvId == ''  ? '' : rsvId)
    				};
    	
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var list = obj.resultList;	
    		
    		if(meetingRoomId == '' || meetingRoomId == undefined) g_noRsvList = list;		//전체 검색건만 불가능한 회의실리스트 세팅
    		
    		if(list.length == 0){		//예약 가능
    			rslt = 'true';
    		}
    		
    	}
   		
    	commonAjax("POST", url, param, callback, false);
    	
    	return rslt;
    	
   	},
   	
	//수정 팝업(회의실 별 에서 클릭시)
   	editSet : function(rsvId){
   		
   		$("#rsvId").val(rsvId);
   		
   		
   		var rsvObj =  getRowObjectWithValue(g_rsvList, 'rsvId', rsvId);    
   		
   		
		$("#scheduleId").val(rsvObj.scheduleId);
		
		var eventObj = {scheduleId : rsvObj.scheduleId , comment : rsvObj.comment, sabun :rsvObj.rsvSabun };
		
		fnObj.openRsvPop(rsvObj.startDate, rsvObj.startTime, rsvObj.endTime, rsvObj.meetingRoomId, rsvId,JSON.stringify(eventObj));		//수정 창 
   		
   	},
   	
   	
   	//예약 하기 팝업
   	openRsvPop : function(selectDate,startTime,endTime,meetingRoomId,rsvId,eventObj){
		 
   		//-- clear
   		
   		fnObj.selectRsvType('all');
   		$("input:radio[name=rsvType]:radio[value='schedule']").prop("checked",true);
   		
   		$('#rsvDate').val((selectDate == undefined ? $('#choiceDate').val() : selectDate));
   		fnObj.selectRsvType('schedule');
   		
   		if(endTime == undefined) endTime='09:00:00';
   		
   		//-- 시간 셀렉트 박스 세팅 : S
   		
   		var timeArr = [];
   		
   		for(var i=8;i<22;i++){
   			
   			var timeStr = fillzero(i,2);	//2자리로 맞춘다
   			
   			timeArr.push({id : timeStr+':00:00' , name : timeStr+':00'});
   			timeArr.push({id : timeStr+':30:00' , name : timeStr+':30'});
   		}
   		
   		timeArr.push({id : '22:00:00' , name : '22:00'});
   																								//fnObj.enableRsvRoomList();
   		var startTimeSelectTag = createSelectTag('startTime', timeArr, 'id', 'name', startTime, 'fnObj.setEndTime();', '', '80','selectHeight');
   		var endTimeSelectTag = createSelectTag('endTime', timeArr, 'id', 'name', endTime, '', '', '80','selectHeight');
   		
   		$("#timeArea").html(startTimeSelectTag+' ~ '+endTimeSelectTag);
   		
   		//-- 시간 셀렉트 박스 세팅 : E
   		
   		
   		
   		
   		//-- 직원 셀렉트 세팅 : S
   		
   		var userList = getCodeInfo(null,"","",null, null, null,'/common/getStaffListNameSort.do', {division : 'SYNERGY'});
		var userSelectTag = createSelectTag('sabun', userList, 'sabun', 'usrNm','${userLoginInfo.sabun}', '', '', 'height:26px;width:60px;margin-right:10px;' );		
   		
		$("#userArea").html(userSelectTag);
		
		//-- 직원 셀렉트 세팅 : E	
		
		g_selectRoomId = meetingRoomId;
		
		/* var roomSelectTag = createSelectTag('selectRoomId', g_meetingRoomList, 'id', 'title', g_selectRoomId, '', '', 'height:26px;width:100px;margin-right:10px;');	
  		$("#meetingRoomArea").html(roomSelectTag);
  		$("#meetingRoomArea").show(); */
  		
  		fnObj.enableRsvRoomList();	 //회의실 리스트 세팅 
  		
		if(rsvId ==undefined || rsvId==0 || rsvId=='' ){	//신규 등록건
			$("#delBtn").hide();
			
		}
		else{
			
			
	  		if(eventObj !=undefined) eventObj = JSON.parse(eventObj);
	  		
	  		$("#scheduleId").val(eventObj.scheduleId);
	  		
	  		if(eventObj.scheduleId == 0){
	  			$("#comment").val(eventObj.comment);
	  			$("input:radio[name=rsvType][value=doWrite]").trigger("click");
	  		
	  		}else{
	  			$("#scheTitle").val(eventObj.comment);
	  			$("#scheTitleArea").html(eventObj.comment);
	  			$("input:radio[name=rsvType][value=schedule]").val("schedule");
	  		}
	  		
	  		$("#sabun").val(eventObj.sabun);
	  		$("#delBtn").show();
	  		$("input:radio[name=rsvType]:checked").trigger("click");
		}
		
		
		$('#popup').bPopup();
 	
   	},
   	
   	
   	
   	//--------------------- 레이어 팝업 함수 : S
   	

   	setEndTime : function(){
   		var newEndTime = '';
   		var endTime = parseInt($("#startTime").val().split(':')[0])+1;
   		
   		if(endTime > 21) newEndTime ='22:00:00';
   		else newEndTime = fillzero(endTime,2)+':'+$("#startTime").val().split(':')[1]+':00';
   		$("#endTime").val(newEndTime);
   		
   		fnObj.enableRsvRoomList();
   	},
   	
   	//라디오 버튼 선택
   	selectRsvType : function(value){
   		
   		$('#scheduleListArea').hide();
   		
   		if(value == 'schedule'){
   			$('#doWriteArea').hide();
   			fnObj.refreshField('doWrite');
   			
   		}else if(value == 'doWrite'){
   			
   			$('#scheduleArea').hide();
   			fnObj.refreshField('schedule');
   			
   		}else{
   			
   			$("input:radio[name=rsvType]").prop("checked",false);
   			$('#doWriteArea').hide();
   			$('#scheduleArea').hide();
   			fnObj.refreshField('all');
   		}
   		$('#'+value+'Area').show();
   		
   		
   	},
   	
   	//초기화
   	refreshField : function(value){
   		
   		if(value == 'schedule'){		//스케쥴 영역 초기화
   			$("#scheTitle").val('');
   			$("#scheTitleArea").html('');
   			$("#scheduleId").val(0);
   			
   		}else if(value == 'doWrite'){							//직접입력 영역 초기화 
   			$('#comment').val('');
   			
   			
   		}else{
   			
   			$("#scheTitle").val('');
   			$("#scheduleId").val(0);
   			$("#scheTitleArea").html('');
   			$('#comment').val('');
   		}
   		
   	},
   	
   	//스케줄 가져오기
   	getScheduleList : function(){
   		var dateArr = $("#rsvDate").val().split('-');
   		
   		var param = {
      			 sabun 		: $("#sabun").val(),
      			 selectDate	: $("#rsvDate").val(),
      			 selectYear	: parseInt(dateArr[0]),
      			 selectMonth: parseInt(dateArr[1]),
      			 selectDay	: parseInt(dateArr[2]),
      	};

    	var url = contextRoot+"/meetingRoom/getScheduleList.do";
    	
		var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var list = obj.resultList;	
    		var str = '';
    		
	    	
    		//일정이 없음.
    		if(list.length == 0){
    			
    			str = '<div style="text-align: center;margin: 10px;border: 1px solid #cecfda;padding: 5px;"><strong>해당 일에 일정이 없습니다.</strong></div>';
        		
    		}else{
    			
    			str = '<table  style="width:90%;margin:1em;border-top: #dadada solid 2px;border-left: #dadada solid 1px;border-bottom: #dadada solid 1px;">';
    			
    			str += '<colgroup>';
    			str += '<col width="50%" />';
    			str += '<col width="*" />';
    			str += '</colgroup>';
    			
    			str += '<tr>';
    			
    			for(var i=0;i<list.length;i++){
    				
    				var scheObj = list[i];
    				var endTimeClass ='';
    				
    				//날짜가 같지 않을때 강조
    				if(scheObj.scheEDate != scheObj.scheSDate){
    					endTimeClass ='otherDay';
    				}
    				
    				str += '<tr onclick="fnObj.timeChk(\''+scheObj.scheSDate +'\',\''+scheObj.scheEDate+'\',\''+scheObj.startTime+'\',\''+scheObj.endTime+'\',\''+scheObj.scheSeq+'\',\''+scheObj.scheTitle+'\');">';
    				str += '<td style="padding: 3px 10px 3px;border-right: #dadada solid 1px;border-top: #dadada solid 1px;">'+scheObj.startTime+' ('+fillzero(scheObj.scheSMonth,2)+'/'+fillzero(scheObj.scheSDay,2)+ ') ' ;
    				str +=  ' ~ '  ;
    				str += scheObj.endTime+'<span class="'+endTimeClass+'"> ('+fillzero(scheObj.scheEMonth,2)+'/'+fillzero(scheObj.scheEDay,2)+') </span>' +' </td>';
    				
    				
    				str += '<td style="padding: 3px 10px 3px;border-right: #dadada solid 1px;border-top: #dadada solid 1px;">'+scheObj.scheTitle+' </td>';
    				str += '</tr>';
    			}
    			str += '</table>';
    		}
    		
    		$("#content").html(str);
    		
    		
    		$("#scheduleListArea").css({display:""});
	    	
    		
    	}
   		
    	commonAjax("POST", url, param, callback, false);
   		
   	},
   	
   	//일정 선택시 
   	timeChk : function(scheSDate,scheEDate,startTime,endTime,scheSeq,scheTitle){
   		
   		if(confirm("일정의 시간으로 사용 시간을 변경하시겠습니까?")){
   			
   			if(parseInt((startTime).split(':')[0]) > 21 || parseInt((endTime).split(':')[0]) > 21){
   				
   				alert("오후 10 시 이후의 일정은 일정의 시간으로 예약 할 수 없습니다.");
   				return;
   				
   			}else if(scheEDate != scheSDate){
   	   			
   				alert("일정 시작일과 종료일이 달라 시작시간 + 1시간으로 종료시간이 세팅됩니다.");
   	   			$("#startTime").val(startTime+':00');
   	   			
   	   			var setEndTime = fillzero(parseInt(startTime.split(':')[0]) + 1,2) +':'+ startTime.split(':')[1]+ ':00' ;
   	   			if(parseInt(startTime.split(':')[0]) + 1 > 21){
   	   				setEndTime = '22:00:00';
   	   			}
   	   			
   	   			$("#endTime").val(setEndTime);
   	   			
   	   		}else{
   	   			
   	   			$("#startTime").val(startTime+':00');
   	   			$("#endTime").val(endTime+':00');
   	   			
   	   		}	
   		}
   		
   		
   		$("#scheduleId").val(scheSeq);
   		$("#scheTitle").val(scheTitle);
   		$("#scheTitleArea").html(scheTitle);
   		$("#scheduleListArea").hide();
   		
   		fnObj.enableRsvRoomList();
   	},
   	
  	//예약 가능 룸 리스트 가져오기
   	enableRsvRoomList : function(){
   		
   		fnObj.chkSelectRoom($("#rsvDate").val(),$("#startTime").val(),$("#endTime").val(),'',$("#rsvId").val());	  //사용불가 미팅룸 리스트 
   		
   		var enableRsvRoomList = [];
   		
   		for(var i=0;i<g_meetingRoomList.length;i++){
   			
   			if(getCountWithValue(g_noRsvList, 'meetingRoomId', g_meetingRoomList[i].id) == 0){
   				enableRsvRoomList.push(g_meetingRoomList[i]);
   			}
   		}
   		
   		
   		//meetingRoomArea 회의실 셀렉트 박스 생성
  		 
  		var roomSelectTag = createSelectTag('selectRoomId', enableRsvRoomList, 'id', 'title', g_selectRoomId, '', '', 'height:26px;width:150px;margin-right:10px;');	
  		$("#meetingRoomArea").html(roomSelectTag);
  		$("#meetingRoomArea").show();
  		
  		$("#selectRoomId").focus();
   		
   	},
   	
  	//--------------------- 레이어 팝업 함수 : E
   	
  	//datepicker 설정
    setDatepicker : function(obj){		
		$('#'+obj).datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true, 
			changeYear: true,
			showOn: "button",
			yearRange: 'c-7:c+7',
		 	monthNames: ['1 월','2 월','3 월','4 월','5 월','6 월','7 월','8 월','9 월','10 월','11 월','12 월'], // 개월 텍스트 설정
		    monthNamesShort: ['1 월','2 월','3 월','4 월','5 월','6 월','7 월','8 월','9 월','10 월','11 월','12 월'], // 개월 텍스트 설정
		    dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], // 요일 텍스트 설정
		    dayNamesShort: ['일','월','화','수','목','금','토'], // 요일 텍스트 축약 설정    
		    dayNamesMin: ['일','월','화','수','목','금','토'], // 요일 최소 축약 텍스트 설정
		    showButtonPanel: false,
			isRTL: false,
		    buttonText: ""
		});	
    },
    
    //<> 버튼으로 이동시 
    moveDate : function(value){
    	
    	var nt = new Date($("#choiceDate").val());
    	
    	if(value !='today') nt.setDate(nt.getDate() + parseInt(value)); // <>
    	else nt = new Date();			//today  
    	
    	var moveResult = nt.yyyy_mm_dd();
    	$("#choiceDate").val(moveResult);
    	
    	
    	//today 버튼 비활성화 
    	if(moveResult == new Date().yyyy_mm_dd()) $("#todayBtn").addClass('fc-state-disabled'); 
    	else  $("#todayBtn").removeClass('fc-state-disabled'); 
    	
    	$("#dateArea").html(moveResult.replace(/-/gi,'/'));
    	
		fnObj.doSearch();
    	
    	
		$('#dp').fullCalendar( 'removeEvents' );
   		$('#dp').fullCalendar( 'addEventSource', g_rsvList);
        $('#dp').fullCalendar( 'refetchEvents' );
        
        $('#dp').fullCalendar( 'gotoDate', $("#choiceDate").val());		//해당 날짜로이동
    },
    
    
  	//<> 버튼으로 이동시 (week)
    moveWeek : function(value){
    	
    	$("#weekDateArea").show();
    	
    	if(value == 'week'){
    		$("#choiceDate").val(new Date().yyyy_mm_dd());
    		value =0;
    		
    	}
    	
    	var selectDate = $("#choiceDate").val(); //기준일
    	
    	var dateArr = selectDate.split('-');
    	var year = dateArr[0];
        var month = dateArr[1];
        var day = dateArr[2];
    	var nowSelectDate = new Date(year, month-1, day);
    	
    	nowSelectDate.setDate(nowSelectDate.getDate()+parseInt(value));			//시작 날짜 세팅
    	
     	var intDayCnt1 = 0;
        var intDayCnt2 = 0;
        
        var i = nowSelectDate.getDay(); //기준일의 요일을 구한다.( 0:일요일, 1:월요일, 2:화요일, 3:수요일, 4:목요일, 5:금요일, 6:토요일 )
       
       
        if ((i > 0) && (i < 7)) { //기준일이 월~토 일때
            intDayCnt1 = 1 - i;
            intDayCnt2 = 7 - i;
            
        }else if (i == 0) {  	//기준일이 일요일일때
            intDayCnt1 = -6;
            intDayCnt2 = 0;
        }
        //기준일의 주의 월요일의 날짜와 토요일의 날짜
        var startDate = new Date(nowSelectDate.getFullYear(), nowSelectDate.getMonth(), nowSelectDate.getDate() + intDayCnt1);
        var endDate =  new Date(nowSelectDate.getFullYear(), nowSelectDate.getMonth(), nowSelectDate.getDate() + intDayCnt2);
    	
    	
        fnObj.getWeekRsvList(startDate,endDate);
        
        if(value != 0) $("#choiceDate").val(startDate.yyyy_mm_dd());
       
        
        $("#weekDateArea").html(startDate.yyyy_mm_dd().replace(/-/gi,'/')+' ~ '+ endDate.yyyy_mm_dd().replace(/-/gi,'/'));
        
      	//week 버튼 비활성화 
    	
      	
      	//같은 주인지 판별
      	if(startDate.getFullYear() ==  new Date().getFullYear() && yearOfWeekNum(startDate) == yearOfWeekNum(new Date())) $("#weekBtn").addClass('fc-state-disabled'); 
    	else  $("#weekBtn").removeClass('fc-state-disabled'); 
    	
    },
    
    //일주일 데이터
    getWeekRsvList : function(startDate,endDate){
    	
        
        var url = contextRoot + "/meetingRoom/getMeetingRoomRsvList.do";
    	 
    	var param = {
				startDate 		: startDate.yyyy_mm_dd(),
				endDate 		: endDate.yyyy_mm_dd(),
				meetingRoomId 	: '',
		};


		var callback = function(result){
			var obj = JSON.parse(result);
    		var list = obj.resultList;	
    		
    		g_rsvList = list;
    		
    		var week = new Array("일", "월", "화", "수", "목", "금", "토");
    	
    		var str = '<table class="meeting_room_week_table">';
    		str += '<colgroup>';
    		str += '<col width="100">';
    		str += '<col width="100">';
    		str += '<col width="100">';
    		str += '<col width="100">';
    		str += '<col width="100">';
    		str += '<col width="100">';
    		str += '<col width="100">';
    		
    		str += '</colgroup>';
    		str += '<thead>';
    		str += '<tr>';
    		for(var i=0;i<7;i++){
    			var dateSet = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate() + i);
    			var weekNum = dateSet.getDay();
    			var color="black";
    			
    			if(weekNum == 6) color="#2727ef";	//토
    			if(weekNum == 0) color="#f33737";	//일
    			
    			str += '<th onclick="fnObj.openRsvPop(\''+dateSet.yyyy_mm_dd()+'\');"><strong style="color:'+color+';">'+week[weekNum]+'</strong> ('+(dateSet.yyyy_mm_dd()).replace(/-/gi,'/')+')';	
    			str += '<i class="axi axi-plus-square" style="cursor:pointer; margin-left:5px;"></i></th>';	
    		}
    		str += '</tr>';
    		str += '</thead>';
    		
    		str += '<tbody>';
    		str += '<tr>';
    		if(list.length>0){
	    		for(var i=0;i<7;i++){
	    			
	    			
	    			
	    			//비교날짜 
	    			var curDate =  (new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate() + i)).yyyy_mm_dd();
					
	    			str += '<td '+(curDate == new Date().yyyy_mm_dd() ? 'style="background:#fffae3;"':'')+'>';
	    			
	    			for(var k=0;k<list.length;k++){
	    				
	    				if(list[k].startDate == curDate){
	    					
	    					str += '<div '; 
	    					
	    					if(list[k].createdBy == '${userLoginInfo.staffSnb}'){
	    						str += 'class="myDiv" onclick="fnObj.editSet('+list[k].rsvId+');" style="cursor:pointer;">';   
	    					}else{
	    						str += ' class="rsvDiv">'; 
	    					}
	    					
	    					
	    					
	    					str += '<div><i class="axi axi-clock-o"></i><strong>'+list[k].showStartTime+' ~ '+list[k].showEndTime;
	    					str += '</strong></div>';
	    					
	    					
	    					var meetObj = getRowObjectWithValue(g_meetingRoomList, 'id', list[k].meetingRoomId);
	    					
	    					str += '<div><strong style="color:'+meetObj.textColor+'">';
	    					str+=meetObj.title;
	    					str += '</strong></div>';
	    					str += '<div>'+list[k].title;
	    					str += '</div>';
	    					str += '</div>';
	    				}
	    			}
	    			
		    		str += '</td>';
		    		
	    		}
			}else  str += '<td colspan="7">데이터가 존재 하지 않습니다.</td>';
			
    		str += '</tr>';
    		str += '</tbody>';
    		str += '</table>';
    		$("#weekArea").html(str);
    		
		};
    	
		commonAjax("POST", url, param, callback, false);
    	
    },
    
    refreshPage : function(rsvDate){
    	
    	if($("li[rel=tabs-2]").hasClass('active')){
    		if(rsvDate !=1) $('#choiceDate').val(rsvDate);
    		fnObj.moveWeek(0);
    		
    	}else{
    		
    		if(rsvDate == '1'){
	    		//재 그리드 
	    		$('#choiceDate').val();
	    		
	    		fnObj.doSearch();
	    		
	    		$('#dp').fullCalendar( 'removeEvents' );
	            $('#dp').fullCalendar( 'addEventSource', g_rsvList);
	            $('#dp').fullCalendar( 'refetchEvents' );
    		
	    	}else{
	    		//재 그리드 
	    		$('#choiceDate').val(rsvDate);
	    		fnObj.doSearch();
	    		
	    		$('#dp').fullCalendar( 'gotoDate', rsvDate );		//해당 날짜로이동
	    		
	    		$('#dp').fullCalendar( 'removeEvents' );
	            $('#dp').fullCalendar( 'addEventSource', g_rsvList);
	            $('#dp').fullCalendar( 'refetchEvents' );
	    	}
    	}
    	
    }
   	
    
    /* ====================================== 화면 세팅 관련 : E ===================================*/
    
   
    //################# else function :E #################
};//end fnObj.



function top_menu_new(sUrl, frame) {
	
	if (frame=="mainFrame") {
		parent.mainFrame.location.href = sUrl;
	}else if (frame == "leftFrame") {
		parent.leftFrame.location.href = sUrl;
	}
}


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	//fnObj.pageStart();		//화면세팅
	
	
 	$(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
       
        if(activeTab!='tabs-2')fnObj.moveDate(0);		//싱크 맞춰주기위해 
        else fnObj.moveWeek(0);
    });
    
    fnObj.doSearch();
    
    fnObj.setCalendarGrid(new Date().yyyy_mm_dd());
	
});
</script>