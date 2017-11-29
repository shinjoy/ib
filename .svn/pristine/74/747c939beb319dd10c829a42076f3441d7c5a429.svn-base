<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file ="../includeJSP/header.jsp" %> 
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<style type="text/css">

/*회의실예약*/
.meetroom_tb .fc-body .meetroom_tb tbody .fc-minor { border-left:#c2c4c9 solid 1px!important; border-bottom:#c2c4c9 solid 1px!important; }



.wtime{
	width:6rem;
}

.wMeet{
	width:11.8rem;
}


.btn_standard {
    border-radius: 2px;
    padding: 0.5rem 0.5rem;
    margin-left: 1rem;
    font-size: 0.8rem;
}

.btn_small {
    border-radius: 2px;
    padding: 2px 4px 2px 4px;
    margin-left: 0.5rem;
    font-size: 2rem; 
    background: -webkit-linear-gradient(top, rgba(245,246,246,1) 2%,rgba(245,246,246,1) 41%,rgba(219,220,226,1) 83%,rgba(219,220,226,1) 83%);
    border:1px solid #c7cace;
}


/* 팝업디자인 */
.smodal-box { position: absolute; margin-bottom: 10px; background-color: #ffffff; font-family: sans-serif;  color: #444;
 -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px; 
 -webkit-background-clip: padding-box; -moz-background-clip: padding-box; background-clip: padding-box;
 -webkit-box-shadow: 0 0px 7px rgba(0, 0, 0, 0.3); -moz-box-shadow: 0 0px 7px rgba(0, 0, 0, 0.3); box-shadow: 0 0px 7px rgba(0, 0, 0, 0.3);
 outline: none; }

.smodal-box .modal-title {
    position: relative;
    padding: 0.688rem 0.875rem;
    border-bottom: 1px solid #e5e5e5;
    font-size: 1rem;
    font-weight:600;
    overflow: hidden;
   	background: #21438b;
    color: white;
}

.smodal-box .modal-title h3 {
    font-size: 1rem;
    font-weight: 600;
    line-height: normal;
    display: inline-block;
    margin: 0;
    padding: 0;
}
/* Modal Close Button */
.smodal-box .modal-title .modal-close-btn {
    position: absolute;
    display: block;
    width: 2.5rem;
    height: 2.5rem;
    right: 0;
    top: 0;
    cursor: pointer;
    background:url(../../images_m/work/btn_close.png) no-repeat center center; background-size:0.563rem 0.563rem;
    background-size: 0.813rem 0.813rem;
}

.smodal-box .modal-title .modal-close-btn:hover {
    opacity: 1;
    filter: alpha(opacity=100);
}
 
.otherDay{
	color: #3592f5;
	font-weight:bold;	
	 
}



/* 회의실별 날짜 <> 표기 */

/* .fc-widget-header{background:#dfe3e8;}

.fc-content{padding: 10px;}

.fc-button {
    box-sizing: border-box;
    height: 2.1rem;
    font-size: 1rem;
    white-space: nowrap;
    cursor: pointer;
    margin: 0px;
    padding: 0rem 0.8rem;
    margin: 0px 0px 0px -5px;
}
 */
.other_rsv_div{background:rgb(204, 204, 204);border:1px solid #b0b8bb;color:black;}		/* 타인 div */
.noUsed{background:white;}
.enableUsed{background:#f9ffce;}


#scheduleListArea {
	position: relative;
	box-shadow: 0px 0px 2px rgba(0, 0, 0, 0.5);
}
#scheduleListArea:after, #scheduleListArea:before {
	bottom: 100%;
	left: 50%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

#scheduleListArea:after {
	/* border-bottom-color: #344553;
	border-width: 20px;
	margin-left: 40px; */
}
#scheduleListArea:before {
	/* border-width: 20px;
	margin-left: 40px; */
}
.showinputwdate { width:8rem; border: #c1c1c1 solid 1px; font-size: 0.875rem;  box-sizing: border-box; height: 1.875rem; vertical-align: middle; padding: 0.25rem 0.25rem;  border-radius: 0rem; display: inline-block; }
</style>
 
 
</head>

<input type="hidden" id="scheduleId" value="0"/>
<input type="hidden" id="rsvId" value="0"/>

<!--====================== 예약하기 박스 : S ===================-->

<div id="popup" class="smodal-box" style="display:none;">
	<div class="modal-title"><h3>예약하기</h3><a class="modal-close-btn b-close"></a></div>
	<!-- <h1>예약하기<i class="axi axi-ion-close " style="float: right;font-size: 1.5rem;" onclick=""></i></h1> -->
	<div class="content con_pdst01">
			<table class="tb_input_basic02">
				<colgroup>
                    <col width="25%">
                    <col width="*">
                </colgroup>
                <tr>
                	<th>사용 날짜</th>
                	<td>
                		<input type="date" id="rsvDate" class="input_basic wdate" onchange="fnObj.useDateChange();"/>
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
                		<label><input type="radio" name="rsvType" value="schedule" onclick="fnObj.selectRsvType('schedule');"/><span>일정 선택</span></label>
						<label><input type="radio" name="rsvType" value="doWrite" onclick="fnObj.selectRsvType('doWrite');"/><span>직접 입력</span></label>
						<input type="hidden" id="scheTitle" class="input_basic wdate" />
							<!-- 일정선택 시 보여지는 화면 -->
							<p id="scheduleArea" class="valign mgt05rem" style="display:none;">
								<span id="scheTitleArea" class="showinputwdate"  onclick="fnObj.getScheduleList(this);"></span>
								<button type="button" onclick="fnObj.refreshField('schedule');" class="btn_3dst_basic2 mgl05rem"><span class="icon_reset"><em>초기화</em></span></button>
								<!-- 일정리스트 -->
								<div id="scheduleListArea" style="display:none; padding-bottom:1rem; position:absolute; left:1em; width:90%; height: expression( this.scrollHeight > 99 ? 200px : auto ); border:1px solid #b1b1b1; border-radius: 3px; margin-top:0.25rem; background-color:white; z-index:10000;">
									<div id="content" class="content"></div>
									<div class="btn_pop_basic"><button type="button" class="btn_pop_white01" onclick='$("#scheduleListArea").hide();'>닫기</button></div>
								</div>
							</p>
							<!-- //일정선택 시 보여지는 화면// -->
					
							<!-- 직접입력 시 보여지는 창 -->
							<p id="doWriteArea" class="valign mgt05rem" style="display:none;">
								<input type="text" id="comment" class="input_basic wdate" />
								<button type="button" onclick="fnObj.refreshField('doWrite');" class="btn_3dst_basic2 mgl05rem"><span class="icon_reset"><em>초기화</em></span></button>
							</p>
	                		<!-- //직접입력 시 보여지는 창// -->
                	</td>
                </tr>
                 <tr>
                	<th>회의실</th>
                	<td><span id="meetingRoomArea" style="display:none;" ></span><!-- 회의실 셀렉트박스 --></td>
                </tr>
			</table>
			<div class="btn_pop_basic">
				<button name="del_btn" id="delBtn" class="btn_pop_gray01" onclick="fnObj.doDelete();" style="display:none;">삭제</button>
				<button name="reg_btn" id="rsvBtn" class="btn_pop_white01" onclick="fnObj.doSave();">예약</button>
			</div>
	</div>
</div>


<!--====================== 예약하기 박스 : E ===================-->



<body>
<input type="hidden" id="usrId">

<div id="meetingRoonListArea"></div>


<div id="wrap">
	<div class="mb_sub_location">
		<button type="button" class="back" onclick='history.back(-1)'><em>이전</em></button>
		<a href="${pageContext.request.contextPath}/m/meetingRoom/meetingRoomMgmt.do" class="depth01">회의실</a>
		<a href="#;" class="depth02">현황 및 예약</a>
	</div> 
	<div class="containerWrap">
		<section class="contentsWrap">
			<!--wholePanel-->
			<div id="wholePanel" class="con_pdst01">
				<div class="tabBoxWrap">
					<div class="tab_pushst">
			  	  		 <ul class="tabList">
			             	<li><a href="javascript:;" class="btn_gra_style left" onclick="javascript:fnObj.moveDate('-1');">&lt;</a></li>
			                <li><a href="javascript:;" id="todayBtn" class="btn_gra_style" onclick="javascript:fnObj.moveDate('today');">Today</a></li>
			                <li><a href="javascript:;" class="btn_gra_style right" onclick="javascript:fnObj.moveDate('+1');">&gt;</a></li>
			             </ul> 
		  	  		</div>
		  	  		<div class="tabright">
			  	  		<input type="date" id="choiceDate" class="input_basic" onchange="fnObj.moveDate(0);"/>
			  	  		<button name="reg_btn" class="btn_reservation" onclick="fnObj.openRsvPop();">
							<span id="regTxtSpan">예약</span>
						</button>
					</div>
		  	  	</div>
		  	  	<div id="dp"></div>
		  	 </div>
		  	 <!--//wholePanel//-->
		  	 
		</section>
	</div><!-- containerWrap -->
	<div id="divTabar">
		<%@ include file ="../includeJSP/quickmenu.jsp" %> 
	</div>
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

var g_meetingRoomList = new Array();	//회의실 리스트
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
    
    //미팅룸 리스트 
    getMeetingRoomList : function(){
    	
    	var url = contextRoot + "/meetingRoom/getMeetingRoomList.do";
		
		var param = {enable : 'Y',sortCol:'GROUP_CODE',  sortVal:'ASC'};
		
		var callback = function(result){
			var obj = JSON.parse(result);
			var list = obj.resultList;	
    		
    		for(var i=0;i<list.length;i++) {
    			g_meetingRoomList.push({id : list[i].meetingRoomId , title : list[i].meetingRoomNmS , meetingRoomNm : list[i].meetingRoomNm , groupCode : list[i].groupCode});
    		}
    		
    		
    		var selectTag = createSelectTag('meetingRoomId', g_meetingRoomList, 'meetingRoomId', 'meetingRoomNmS', '', null, {}, null, null);
			
    		$("#meetingRoomListArea").html(selectTag);
		};
		
		commonAjax("POST", url, param, callback, false);
    },
    
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
    				
    	    		str +='<th '+usedClass+' rowspan="'+(rowCount < 3 ? 3 : rowCount)+'"><span>'+g_meetingRoomList[i].title+'</span></th>';
    			
    			}
    			
    			
    			var gridCount =0;
    			for(var k=0;k<list.length;k++){
    				if(list[k].meetingRoomId == meetingRoomId){
    					if(gridCount !=0) str +='<tr>';		//새로운 행 추가시
    					
    					str +='<td>'+list[k].showStartTime+' ~ '+list[k].showEndTime +'</td>';
                		str +='<td style="text-align:left;">'+list[k].comment;
                		
                		//수정 삭제 버튼 세팅
                		if('${userLoginInfo.staffSnb}' == list[k].createdBy) {
                			
    						str +='<span><button class="btn_small" onclick="fnObj.editSet('+list[k].rsvId+');"><span><strong>수정</strong></span></button> ';
                			str +='<button class="btn_small" onclick="fnObj.doDelete('+list[k].rsvId+');"><span><strong>삭제</strong></span></button><span>';
                			
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
    doSave : function(fStartTime,fEndTime,fRsvDate,fMeetingRoomId,sabun){  //시작 시간, 종료시간, 예약일, 미팅룸 아이디
    	
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
    		swal("이미 예약건이 존재합니다.");
    		return;
    	}
    	
    	if( rsvType == 'schedule' && scheduleId == '0'){	//스케줄 선택시
    		
    		swal("일정을 선택해 주세요");
    		//$("#scheTitle").focus();
    		return;
    	}
    	
    	if(endTime < startTime ) {
    		swal("시작 시간과 종료시간을 확인해주세요");
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
    					rsvUserId		: (sabun != undefined && sabun != "undefined" && sabun != "") ? sabun : $("#sabun").val(),
    					meetingRoomId 	: selectRoomId,
    					rsvId			: rsvId
    				};
    	
    	
    	var callback = function(result){
    		
    		
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;	
    		
    		if(cnt>0){
    			$("#rsvId").val(0);
    			swal("저장되었습니다.");
        		$('.modal-close-btn').trigger("click");
        		
        		//재 그리드 
        		$('#choiceDate').val(rsvDate);
        		fnObj.doSearch();
        		
        		$('#dp').fullCalendar( 'gotoDate', rsvDate );		//해당 날짜로이동
        		
        		fnObj.addClassTable();
    		
    		}else{
    			swal("실패 하였습니다.");
    		}
    		
    		$('#dp').fullCalendar( 'removeEvents' );
            $('#dp').fullCalendar( 'addEventSource', g_rsvList);
            $('#dp').fullCalendar( 'refetchEvents' );
            
            
            fnObj.addClassTable();
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
		
    		$('.modal-close-btn').trigger("click");
    		
    		//재 그리드 
    		$('#choiceDate').val();
    		
    		fnObj.doSearch();
    		
    		$('#dp').fullCalendar( 'removeEvents' );
            $('#dp').fullCalendar( 'addEventSource', g_rsvList);
            $('#dp').fullCalendar( 'refetchEvents' );
            
            fnObj.addClassTable();
    		
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
			eventLongPressDelay :100,
			selectLongPressDelay : 200,
			
			selectOverlap: function(event) {					//신규 drag 겹칠때 return
		        return;
		    },
		    
		    eventOverlap: function(stillEvent, movingEvent) {	//drag 이동 겹칠때 return
		        return;
		    },
		
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
			height: 480,				// 높이 -- 지정가능
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
	            
	            fnObj.addClassTable();
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
					swal('선택 오류 !!');
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
 	 		       		fnObj.doSave(startTime,endTime,rsvDate,event.resourceId,event.rsvSabun); //변경 사항 저장 .
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
 	 		       		fnObj.doSave(startTime,endTime,rsvDate,event.resourceId,event.rsvSabun); //변경 사항 저장 .
 		        	}
		       } 

		    },
		    loading : function(){
		    
		    }
 		    
 		 	//-- 이벤트 설정 관련 : E
		});
   		
   		fnObj.addClassTable();
	},
	
	addClassTable : function(){
		
		var obj = $(".fc-row").find('table');
		
		
   		if(($(obj).find('tr').length) == 1){
   			
   			var str = '<tr><th width="30px"></th>';
   			var code = '';
   			for(var i=0; i<g_meetingRoomList.length; i++){
   				if(code != g_meetingRoomList[i].groupCode){
   					code = g_meetingRoomList[i].groupCode;
   					var count = getCountWithValue(g_meetingRoomList, 'groupCode', code);
   					str += '<th colspan="'+count+'">'+code+'F</th>';
   				}
   			}
   			str += '</tr>';
   			
   			$(".fc-row").find('table thead').prepend(str);
   		}
   		
		var obj2 = $(".fc-agendaDay-view").find('table');
   		
   		$(obj2).addClass('meetroom_tb');
   		
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
   		
   		$('#rsvDate').val((selectDate == undefined ? $("#choiceDate").val() : selectDate));
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
   		var startTimeSelectTag = createSelectTag('startTime', timeArr, 'id', 'name', startTime, 'fnObj.setEndTime();', '', '','select_basic wtime');
   		var endTimeSelectTag = createSelectTag('endTime', timeArr, 'id', 'name', endTime, '', '', '','select_basic wtime');
   		
   		$("#timeArea").html(startTimeSelectTag+' ~ '+endTimeSelectTag);
   		
   		//-- 시간 셀렉트 박스 세팅 : E
   		
   		
   		
   		
   		//-- 직원 셀렉트 세팅 : S
   		
   		var userList = getCodeInfo(null,"","",null, null, null,'/common/getStaffListNameSort.do', {division : 'SYNERGY'});
		var userSelectTag = createSelectTag('sabun', userList, 'sabun', 'usrNm','${userLoginInfo.sabun}', '', '', '','select_basic' );		
   		
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
		
		
  	/* 	modal({
            type: 'customer',
            title: '회읫예약',
            text: $('#popup').html(),
        });
	   */
  		
  		
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
   			$("#scheTitleArea").html('');
   			$("#scheduleId").val(0);
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
    			
    			str = '<span style="display: inline-block;padding:1em;">해당 일에 일정이 없습니다.</span>';
    		
    		}else{
    			
    			str = '<table style="width:90%;margin:1em;border-top: #dadada solid 2px;border-left: #dadada solid 1px;border-bottom: #dadada solid 1px;">';
    			
    			str += '<colgroup>';
    			str += '<col width="50%" />';
    			str += '<col width="*" />';
    			str += '</colgroup>';
    			
    			//str += '<tr>';
    			
    			for(var i=0;i<list.length;i++){
    				
    				var scheObj = list[i];
    				var endTimeClass ='';
    				
    				//날짜가 같지 않을때 강조
    				if(scheObj.scheEDate != scheObj.scheSDate){
    					endTimeClass ='otherDay';
    				}
    				
    				str += '<tr onclick="fnObj.timeChk(\''+scheObj.scheSDate +'\',\''+scheObj.scheEDate+'\',\''+scheObj.startTime+'\',\''+scheObj.endTime+'\',\''+scheObj.scheSeq+'\',\''+scheObj.scheTitle+'\');">';
    				str += '<td style="padding: 3px 10px 3px; border-right: #dadada solid 1px;border-bottom: #dadada solid 1px;">'+scheObj.startTime+' ('+fillzero(scheObj.scheSMonth,2)+'/'+fillzero(scheObj.scheSDay,2)+ ') ' ;
    				str +=  '<br/> ~ '  ;
    				str += scheObj.endTime+'<span class="'+endTimeClass+'"> ('+fillzero(scheObj.scheEMonth,2)+'/'+fillzero(scheObj.scheEDay,2)+') </span>' +' </td>';
    				
    				
    				str += '<td style="padding: 3px 10px 3px;border-right: #dadada solid 1px;border-bottom: #dadada solid 1px;">'+scheObj.scheTitle+' </td>';
    				str += '</tr>';
    			}
    			str += '</table>';
    		}
    		
    		$("#content").html(str);
    		
    		
    		$("#scheduleListArea").css(display,"");
	    	
    		
    	}
   		
    	commonAjax("POST", url, param, callback, false);
   		
   	},
   	
   	//일정 선택시 
   	timeChk : function(scheSDate,scheEDate,startTime,endTime,scheSeq,scheTitle){
   		
   		if(confirm("일정의 시간으로 사용 시간을 변경하시겠습니까?")){
   			
   			if(parseInt((startTime).split(':')[0]) > 21 || parseInt((endTime).split(':')[0]) > 21){
   				
   				swal("오후 10 시 이후의 일정은 일정의 시간으로 예약 할 수 없습니다.");
   				return;
   				
   			}else if(scheEDate != scheSDate){
   	   			
   				swal("일정 시작일과 종료일이 달라 시작시간 + 1시간으로 종료시간이 세팅됩니다.");
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
  		 
  		var roomSelectTag = createSelectTag('selectRoomId', enableRsvRoomList, 'id', 'meetingRoomNm', g_selectRoomId, '', '', '','select_basic w100pro');	
  		$("#meetingRoomArea").html(roomSelectTag);
  		$("#meetingRoomArea").show();
  		
  		$("#selectRoomId").focus();
   		
   	},
   	
   	//날짜 변경시
   	useDateChange : function(){
   		if( $("input:radio[name=rsvType]:checked").val() == 'schedule') fnObj.getScheduleList();
   		fnObj.enableRsvRoomList();
   		
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
    	if(moveResult == new Date().yyyy_mm_dd()) $("#todayBtn").addClass('active'); 
    	else  $("#todayBtn").removeClass('active'); 
    	
    	fnObj.doSearch();
    	
    	
		$('#dp').fullCalendar( 'removeEvents' );
   		$('#dp').fullCalendar( 'addEventSource', g_rsvList);
        $('#dp').fullCalendar( 'refetchEvents' );
        
        $('#dp').fullCalendar( 'gotoDate', $("#choiceDate").val());		//해당 날짜로이동 
        
        fnObj.addClassTable();
    },
   	
    
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
	fnObj.getMeetingRoomList();
	
 	$(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
       
        fnObj.moveDate(0);		//싱크 맞춰주기위해 
       // $('#dp').fullCalendar( 'gotoDate', $("#choiceDate").val());	//해당 날짜로이동
        
    });
    
    fnObj.doSearch();
    
    fnObj.setCalendarGrid(new Date().yyyy_mm_dd());
	
});
</script>