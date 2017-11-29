<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
//치환 변수 선언
pageContext.setAttribute("cr", "\r"); //Space
pageContext.setAttribute("cn", "\n"); //Enter
pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
pageContext.setAttribute("br", "<br>"); //br 태그
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Synergy Partners</title>
		<link href="<c:url value='/css/sp/synergy.css'/>" rel="stylesheet" type="text/css">
		<script src="js/sp/synergy_util.js"></script>
		<script src="js/sp/jquery-1.8.2.min.js"></script>
		<script src="http://code.jquery.com/jquery-1.9.1.js"/></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"/></script>
		
		<script>var contextRoot="${pageContext.request.contextPath}";</script><!-- necessary! to import js files -->		
		<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js"></script><!-- util folder -->
		<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- util folder -->	
		<style type="text/css">
		
		.selectHeight{
			height:25px;
			margin-left:5px;
		}
		
		</style>
		<script type="text/javaScript" language="javascript">
			var divisionList = [];		//디비전 리스트 (참가자)
			var g_meetingRoomList = []; //미팅 룸 리스트
			var g_noRsvList	= [];		//예약 불가 리스트
			
			$(document).ready(function () {
				$(window).load(function() {
					//디비전 리스트 가져오기
					divisionList= getCodeInfo(null,null,null,null,null,null,"/common/getDivisionList.do",{enable :'Y',userCountChk :'Y'});
					//참조인 전체선택 체크박스 세팅
			    	
			    	for(var i=0;i<divisionList.length;i++){
			    		var htmlStr = '';
			    		htmlStr += '<label><input type="checkbox" name="Entry" id="Entry" class="Entry_'+divisionList[i].divCode+'" onclick="javascript:SelAll(this.name, ' + i + ', \'' + divisionList[i].divCode + '\');"/>';
				    	htmlStr += '전체선택('+divisionList[i].divName + ')</label>';
				    	$('#'+divisionList[i].divCode+"_div").html(htmlStr);		// 전체선택 체크박스
				  	}
				
			    	//-- 시간 셀렉트 박스 세팅 : S
			   		
			   		var timeArr = [];
			   		
			   		for(var i=8;i<22;i++){
			   			
			   			var timeStr = fillzero(i,2);	//2자리로 맞춘다
			   			
			   			timeArr.push({id : timeStr+':00:00' , name : timeStr+':00'});
			   			timeArr.push({id : timeStr+':30:00' , name : timeStr+':30'});
			   		}
			   		
			   		timeArr.push({id : '22:00:00' , name : '22:00'});
			   																								//fnObj.enableRsvRoomList();
			   		//selectVal 추가 20170907 ksm																						
					var startTimeSelectTag = createSelectTag('meetStartTime', timeArr, 'id', 'name', '${meetingRoom.startTime}', 'setMeetingRoomList();', '', '60','selectHeight');
			   		var endTimeSelectTag = createSelectTag('meetEndTime', timeArr, 'id', 'name', '${meetingRoom.endTime}', 'setMeetingRoomList();', '', '60','selectHeight');

			   		$("#useTimeArea").html('<strong style="margin-left:10px;">사용시간 : </strong>'+startTimeSelectTag+' ~ '+endTimeSelectTag);
			   		
			    	
					$('#ContactLoc').val($('#ContactLoc', parent.document).val());
					if($('#EventType').val() == 'Add') ScheDateSet();
					else  getScheduleEntryList();
					
					
					
					
				});
				
				$('input:radio[name=CarUseFlag]').click(function() {   // 차량사용여부 클릭 시 
					if($('input[name="AllTime"]').is(":checked")) {  // 종일일정인 경우 오전 8:30 ~ 오후 6:00 로 변경
						TimeChange('STime', 'AM8:30');
						TimeChange('ETime', 'PM6:00');
					} else {  // 그 외 
						TimeChange('STime', $('#STime').val());
						TimeChange('ETime', $('#ETime').val());
					}
					if($('input:radio[name=CarUseFlag]:checked').val() == 'Y')    // 사용함인 경우 
						$('#CarNum').show();
					else 
						$('#CarNum').hide();
				});
				
				
				$('#CarNum').change(function() {   
					if($('#CarNum option:selected').text().indexOf('-') != -1) {  // - 있는 경우
						if($('#CarNum option:selected').val().indexOf('_-_') == -1) {  // _-_ 없는 경우
							alert('해당차량은 현재 ' + $('#CarNum option:selected').text().split('(')[1].substring(0, 3) + ' 님께서 운행중입니다. \n다른 차량을 선택하세요.');
							$('#CarNum').val('X');								
						}
						else {
							$('#CarNum').append("<option value="+ $('#CarNum option:selected').val().split('_-_')[0] +" selected>"+ $('#CarNum option:selected').text() +"</option>");
						}
					}
				});
				
				newDatepickerSet('ScheSDate');
				newDatepickerSet('ScheEDate');
				
				if('${vo.eventType}' == 'Add' || ('${vo.eventType}' == 'Edit' && ('${vo.procFlag}' == 'alone' || '${scheVO.scheGrpCd}' == 'Period'))) {
					$('#ScheSDate').parent().children('img').css({'vertical-align':'middle', 'line-height':'23px', 'margin-left':'5px'});
					$('#ScheEDate').parent().children('img').css({'vertical-align':'middle', 'line-height':'23px', 'margin-left':'5px'});
				
				
				}
				
				
				
				
				
				
				//------------------------------------- 분류 선택에 따라 제목 자동생성을 위한 이벤트 핸들링 :S ------------------
				/* 
				//분류 선택 이벤트 핸들러
				$('input[name=ScheduleType]').bind('change', function(){
					setAutoMakeTitle();		//제목자동생성 호출
				}); */
				
				//------------------------------------- 분류 선택에 따라 제목 자동생성을 위한 이벤트 핸들링 :E ------------------
				
				
				//------------------------------------- mna 추가 관련 회사 선택 팝업용 :S -------------------------------------

				/*
				//분류 M&A 라디오 선택 이벤트 핸들러
				$('input[name=ScheduleType]').bind('change', function(){
					//M&A 옵션 visibility
					if(this.value == 'mna'){
						$('#spanMnaOption').show();
						
						//제목 자동생성을 위해 제목입력 불가능하도록
						//$('#ScheTitle').attr('readonly', true);
						//$('#ScheTitle').val('');	//내용초기화.
						setAutoMakeTitle();		//제목자동생성 호출
						
					}else{
						$('#spanMnaOption').hide();
						
						//제목 입력 활성화
						//$('#ScheTitle').removeAttr('readonly');
						
					}
					
					//회사선택 초기화
					//$('#tmpCpnNm').val('');
					
				});
				*/
				
				//분류 M&A 옵션 선택 이벤트 핸들러
				/*$('input[name=mnaType]').bind('change', function(){
					setAutoMakeTitle();		//제목자동생성 호출
				});*/
				
				
				$('#ScheTitleTmp').bind('change', function(){
					setAutoMakeTitle();		//제목자동생성 호출
				});
				
				//------------------------------------- mna 추가 관련 회사 선택 팝업용 :E -------------------------------------

				
			});
				
			function newDatepickerSet(obj){
				
			
				$('#'+obj).datepicker({
					dateFormat: 'yy-mm-dd',
					changeMonth: true, 
					changeYear: true,
					prevText: 'prev',
					nextText: 'next',
					showOn: "button",
					yearRange: 'c-7:c+7',
				 	monthNames: ['1 월','2 월','3 월','4 월','5 월','6 월','7 월','8 월','9 월','10 월','11 월','12 월'], // 개월 텍스트 설정
				    monthNamesShort: ['1 월','2 월','3 월','4 월','5 월','6 월','7 월','8 월','9 월','10 월','11 월','12 월'], // 개월 텍스트 설정
				    dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], // 요일 텍스트 설정
				    dayNamesShort: ['일','월','화','수','목','금','토'], // 요일 텍스트 축약 설정    
				    dayNamesMin: ['일','월','화','수','목','금','토'], // 요일 최소 축약 텍스트 설정
				    showButtonPanel: true,
					isRTL: false,
					buttonText: "Calendar",
			    	showOtherMonths: true,    /* 이전/다음 달 일수 보이기 */
					selectOtherMonths: true,    /* 이전/다음 달 일 선택하기 */
					buttonImage: "images/sp/btn_cal.gif",
					buttonImageOnly: true,
					closeText: '닫기',
					currentText: '오늘',
					showMonthAfterYear: true,        /* 년과 달의 위치 바꾸기 */
					showAnim: 'slideDown',
					
				});	
				
			}	
			
			
			// 선택시간 차량 사용여부 받아오기
			function CarListChk() {
				var ScheSTime, ScheETime;
				if($('#ScheSTimeAMPM').val() == 'PM' && $('#ScheSTime').val().split(':')[0] != 12) // 오후
					Time = Number($('#ScheSTime').val().split(':')[0]) + Number(12);
				else 
					Time = Number($('#ScheSTime').val().split(':')[0]);
				
				ScheSTime = Time + ':' + $('#ScheSTime').val().split(':')[1];
				
				if($('#ScheETimeAMPM').val() == 'PM' && $('#ScheETime').val().split(':')[0] != 12) 
					Time = Number($('#ScheETime').val().split(':')[0]) + Number(12);
				else 
					Time = Number($('#ScheETime').val().split(':')[0]);
				
				ScheETime = Time + ':' + $('#ScheETime').val().split(':')[1];
				
				$.ajax({
					type:"POST",
					url:"CarListChk.do",
					data:{
						ScheSDate : $('#ScheSDate').val(),
						ScheSTime : ScheSTime,
						ScheETime : ScheETime,
					},
					dataType:"json",
					timeout:30000,
					cache:false,
					success:function whenSuccess(result) {
						$('#CarNum').empty();
						$('#CarNum').append("<option value='X'>차량 - 차량담당자</option>");
						$.each(result, function(idx){
							var hqId = '${userLoginInfo.hqId}';		//로그인 사용자의 법인
							if(hqId == result[idx].cpn || ((hqId == '1' || hqId == '2') && (result[idx].cpn == '1' || result[idx].cpn == '2'))){
								if(result[idx].caruseflag == 'N'){
									//차량번호 - 관리자명
									$('#CarNum').append("<option value="+ result[idx].carnum +">"+ result[idx].carnum +" - "+result[idx].managerNm+"</option>");
								}else if(result[idx].caruseflag == 'Y' && result[idx].scheseq == $('#ScheSeq').val()){
									//차량번호 - (일정인명  일정시작시간 ~ 일정종료시간)
									$('#CarNum').append("<option value="+ result[idx].carnum +"_-_"+ result[idx].scheseq +" selected>"+ result[idx].carnum + " - (" +result[idx].pernm + " " + result[idx].stime + " ~ " + result[idx].etime + ")</option>");
								}else{
									//차량번호 - (일정인명  일정시작시간 ~ 일정종료시간)
									$('#CarNum').append("<option value="+ result[idx].carnum +" style='background:#FFD7EB;'>"+ result[idx].carnum + " - (" +result[idx].pernm + " " + result[idx].stime + " ~ " + result[idx].etime + ")</option>");
								}
							}
						});
					},
					error:function whenError(x, e) {
						ajaxErrorAlert(x, e);
					}
				});
			}
			
			// 선택일자 차량 사용 리스트
			function CarUseList() {
				ScheSDate = $('#ScheSDate').val();
				URL = "<c:url value='/CarUseList.do?ScheSDate="+ ScheSDate +"'/>";
				var w = '370';
				var h = '400';
				var ah = screen.availHeight - 30;
				var aw = screen.availWidth - 10;
				var xc = (aw - w) / 2;
				var yc = (ah - h) / 2;
				var option = "left=" + xc
				+",top=" + yc
				+",width=" + w
				+",height=" + h
				
				window.open(URL, 'CarUseList', option);
			} 
			
			// 선택일자 회의실 현황
			function meetingRoomRsvList() {
				var choiceDate = $('#ScheSDate').val();
				URL = contextRoot + '/meetingRoomListPop.do?choiceDate='+ choiceDate ;
				var w = '700';
				var h = '650';
				var ah = screen.availHeight - 30;
				var aw = screen.availWidth - 10;
				var xc = (aw - w) / 2;
				var yc = (ah - h) / 2;
				var option = "left=" + xc
				+",top=" + yc
				+",width=" + w
				+",height=" + h
				
				window.open(URL, 'meetingRoomList', option);
			} 
			
			// 일정 등록시 일자 설정
			function ScheDateSet() {
				if($("#ParentPage").val() != 'card'){
					$('#ScheSDate').val($('#ScheSDate', parent.document).val());
				}
				$('#ScheTitle').focus();  // 제목
				TimeSet();
			}
			
			// 일정 수정시 데이터 셋
			function ScheInfoSet(list) {
				
				TimeSet();		// 일정 시간 설정
				$('#STime').val('${scheVO.scheSTimeAMPM}${scheVO.scheSTime}');
				$('#ETime').val('${scheVO.scheETimeAMPM}${scheVO.scheETime}');
				
				$('#AddEnd').hide();
				$('#EditEnd').show();
				
				if('${scheVO.scheGubun}' == 'All') $('#SMSView').show();
				else $('#SMSView').hide();
		
	    		
				$('input:radio[name="ScheduleGubun"]:input[value="${scheVO.scheGubun}"]').attr("checked", true);		//구분(숨김) ...전체일정,개인일정
				
				$('input:radio[name="ScheduleType"]:input[value="${scheVO.scheType}"]').attr("checked", true);			//분류
				
				chngScheType();		//분류선택 세팅
				
				

				if('${fn:length(ScheduleEntryList)}' > 0) {   // 참가자 있는 경우
					 for(var i = 0; i < divisionList.length; i++){
						var divisionCnt = 0;	//해당 division 의 사람 수. -> 참가자의 수
						var Cnt = 0; //해당 division 에 참여자에 포함된 사람수. -> 선택된 참가자
						<c:forEach var="result" items="${EmpList}" varStatus="status">
							if("${result.division}" == divisionList[i].divCode){
								divisionCnt++;
							}
						</c:forEach>
						 for(var k = 0; k < list.length; k++){
							if(list[k].division == divisionList[i].divCode){
								for(var idx = 0; idx < (Number($('#EmpCnt').val()) ); idx++) {
									if($('#EntryAry'+(idx+1)).val() == list[k].persabun && list[k].delflag == 'N') { //division이 같고 , 해당 sabun 이 참여자 리스트에 있으면
										Cnt++;
										$('#EntryAry'+(idx+1)).attr("checked", true);
										$('#EntryDelAry'+(idx+1)).val(list[k].delflag);
									}
								}		
							}
						 }
						
						
						if(Cnt == divisionCnt) { 
							$('.Entry_'+divisionList[i].divCode).attr("checked", true);
						}

					}  
				
				}
				
				if('${scheVO.scheGubun}' == 'Alone') {
					//$('#PublicView').show();
					$('input:radio[name="SchePublicFlag"]:input[value="${scheVO.schePublicFlag}"]').attr("checked", true);					
					$('#SchePublicFlag2').attr('disabled', false);
										
					if('${scheVO.schePublicFlag}' == 'N'){
						$('#Secret').attr('checked', true);
						$('#Secret').removeAttr('disabled');
					}
				}
				
				
				if('${scheVO.scheGubun}' == 'Alone'){ 
					$('#EntryView').hide();
				}
				
				if('${scheVO.scheAllTime}' == 'Y') {  // 종일일정
					$('#ScheAllTime').val("Y");
					$('#STime').hide();
					$('#ETime').hide();
					$('input[name="AllTime"]').attr("checked", true);
				}
				
				// 차량사용여부 == carUseFlag
				$('input:radio[name="CarUseFlag"]:input[value="${scheVO.carUseFlag}"]').attr("checked", true);
				
				if('${scheVO.carUseFlag}' == 'Y') {  // 차량 사용중일때 
					$('#CarNum').show();
					//$('#CarNum').val('${scheVO.carNum}'); // 차량번호만 세팅 
					
					if($('input[name="AllTime"]').is(":checked")) {  // 종일일정인 경우 
						TimeChange('STime', 'AM8:30');
						TimeChange('ETime', 'PM6:00');
					} else {
						TimeChange('STime', $('#STime').val());
						TimeChange('ETime', $('#ETime').val());
					}
					
					// 사용중인 차량으로 선택 
					$("#CarNum").val('${scheVO.carNum}').prop("selected", true);
					$('#CarNum').show();  										
					 						
				}
				
				
				$('#ScheTitle').val('${scheVO.scheTitle}');				// 제목
				$('#ScheSDate').val('${scheVO.scheSDate}');				// 시작날짜
				$('#ScheEDate').val('${scheVO.scheEDate}');				// 종료날짜
				$('#SelDate').val('${scheVO.scheSDate}');				// 선택날짜(시작날짜)
				
				
				if($('#alone').val() == 'alone'){  // 반복일정 수정할 때 '이 일정만 수정'인 경우 반복설정을 없음으로 세팅함
					$('input:radio[name="ScheRepetFlag"]:input[value="None"]').attr("checked", true);
				} else{
					$('input:radio[name="ScheRepetFlag"]:input[value="${scheVO.scheRepetFlag}"]').attr("checked", true);	
				}
				
				
				var ScheAlarmFlag = '${scheVO.scheAlarmFlag}';
				if(ScheAlarmFlag != '7' && ScheAlarmFlag != '0' && ScheAlarmFlag != 'None') {	// 직접입력이면
					$('input:radio[name="ScheAlarm"]:input[value="Write"]').attr("checked", true);
					$('#WriteDay').val(ScheAlarmFlag);
				}else{ 
					$('input:radio[name="ScheAlarm"]:input[value="'+ScheAlarmFlag+'"]').attr("checked", true);
				}				
				if(ScheAlarmFlag != "None") {
					//$('#AlarmHowView').show();
					$('input:radio[name="AlarmHow"]:input[value="${scheVO.scheAlarmHow}"]').attr("checked", true);
				}
				
				// 중요도
				$('input:radio[name="ScheImportant"]:input[value="${scheVO.scheImportant}"]').attr("checked", true);
				
				
				//세부내용 세팅
				<% pageContext.setAttribute("newLine","\r\n");%>				
				$('#ScheCon').val("${fn:replace(scheVO.scheCon, newLine, 'NNNEEEWWW')}");
				var contTmp = $('#ScheCon').val();
				$('#ScheCon').val(contTmp.split('NNNEEEWWW').join('\n'));
				
				//------------------------------------- mna 추가 관련 회사 선택 팝업용 :S -------------------------------------

				//분류 M&A 라디오 선택 이벤트 핸들러
				var form = document.ScheduleProc;
				/*
				if('${scheVO.scheType}' == 'mna'){
					$('#spanMnaOption').show();						//옵션 보이도록
					form.mnaType.value = '${scheVO.mnaType}';		//값 세팅
					//form.tmpCpnId.value = '_';						//있다는 뜻으로 ('_')넣어둠(수정 저장시 입력안했다는 것을 피하기 위해)
					
					//제목 자동생성을 위해 제목입력 불가능하도록
					//$('#ScheTitle').attr('readonly', true);
				} */
				
				if('${scheVO.mnaType}' == 'M'){
					form.IsMna.checked = true;		//M&A업무여부
					
					
					//$('#ScheTitleTmp').attr('disabled', false)					
					//$('#ScheTitleTmp').css('background-image', 'url(/SynergyCus/images/sp/CSS/input_text_bg.gif)');
					//$('#trMemo').show();	//메모 보이게
				}
				
				//------------------------------------- mna 추가 관련 회사 선택 팝업용 :E -------------------------------------
				
				
				$('#tmpCpnNm').val('${scheVO.companyNm}');
				$('#tmpCpnId').val('${scheVO.company}');
				$('#tmpCstNm').val('${scheVO.customer}');
				$('#tmpCstId').val('${scheVO.customerId}');
				
				//회의실 추가 건 세팅
				if('${meetingRoomChk}' != 0){
					
					$('input:radio[name="meetingRoomUseFlag"]:input[value="Y"]').prop("checked", true);
					
				
					
					$('#rsvId').val('${meetingRoom.rsvId}');
					
					//$('#meetStartTime').val('${meetingRoom.startTime}');
					//$('#meetEndTime').val('${meetingRoom.endTime}');
					setMeetingRoomList();
					
					
					$('#selectRoomId').val('${meetingRoom.meetingRoomId}');
					
					//$("#useTimeArea").html('사용시간 : '+$('#meetStartTime').val().substring(0,5)+'~'+$('#meetEndTime').val().substring(0,5));
					
				}
				
				$('#ScheArea').val('${scheVO.scheArea}');
				$("#meetStartTime").val('${meetingRoom.startTime}');
				$("#meetEndTime").val('${meetingRoom.endTime}');
				
			}
			
			function getScheduleEntryList(){  // 스케줄 참가자 리스트 
				var url=contextRoot+"/getScheduleEntryList.do";
		    	var param = {
				    			scheSeq : $("#ScheSeq").val(),
				    			eventType : $("#EventType").val()
		    				};
		    	var callback = function(result){
		    		
		    		var obj = JSON.parse(result);
		    		var cnt = obj.resultVal;		//결과수
		    		var list = obj.resultList;		//결과데이터JSON
		    		ScheInfoSet(list);
		    	};
		    
		    	commonAjax("POST", url, param, callback, true, null, null);
			}
			// 일정 시간 설정
			function TimeSet() {
				for(var Hour = 0; Hour < 24; Hour++) {
					for(var Min = 0; Min < 2; Min++) {
						if(Hour >= 12) {
							AMPM = "오후 ";
							AMPM_Val = "PM";
							Hh = Hour - 12;
							Color = '#00CECE';
						}
						else {
							AMPM = "오전 ";
							AMPM_Val = "AM";
							Hh = Hour;
							Color = '#CEFFFF';
						}
						if(Hh == 0) Hh = 12;
			
						if(Min == 0) Mm = ':00';
						else Mm = ':30';
						
						var Now = new Date();
						var SHh = Now.getHours();
						var EHh = Now.getHours() + 1;
						
						if(SHh == Hour) {
							$('#STime').append("<option value='"+AMPM_Val + Hh + Mm+"' style='background:"+Color+";' selected>"+AMPM + Hh + Mm+"</option>");
							if('${scheVO.scheSeq}' == '') {
								$('#ScheSTimeAMPM').val(AMPM_Val);
								$('#ScheSTime').val(Hh + Mm);
							}
							else {
								$('#ScheSTimeAMPM').val('${scheVO.scheSTimeAMPM}');
								$('#ScheSTime').val('${scheVO.scheSTime}');
							}
						}
						else $('#STime').append("<option value='"+AMPM_Val + Hh + Mm+"' style='background:"+Color+";'>"+AMPM + Hh + Mm+"</option>");
						
						if(EHh == Hour) {
							$('#ETime').append("<option value='"+AMPM_Val + Hh + Mm+"' style='background:"+Color+";' selected>"+AMPM + Hh + Mm+"</option>");
							if('${scheVO.scheSeq}' == '') {
								$('#ScheETimeAMPM').val(AMPM_Val);
								$('#ScheETime').val(Hh + Mm);
							}
							else {
								$('#ScheETimeAMPM').val('${scheVO.scheETimeAMPM}');
								$('#ScheETime').val('${scheVO.scheETime}');
							}
						}
						else {
							$('#ETime').append("<option value='"+AMPM_Val + Hh + Mm+"' style='background:"+Color+";'>"+AMPM + Hh + Mm+"</option>");
						}
					}
				}
			}
			
			// 종일일정 설정
			function AllTimeSet() {
				if($('input[name="AllTime"]').is(":checked")) {
					$('#ScheAllTime').val("Y");
					$('#ScheSTimeAMPM').val('AM');
					$('#ScheSTime').val('8:30');
					$('#ScheETimeAMPM').val('PM');
					$('#ScheETime').val('6:00');
					var stime = $('#ScheSTimeAMPM').val() + $('#ScheSTime').val();
					var etime = $('#ScheETimeAMPM').val() + $('#ScheETime').val(); 
					$("#STime").val(stime).prop("selected", true);  // AM 8:30
					$("#ETime").val(etime).prop("selected", true);  // PM 6:00
					$('#STime').hide();
					$('#ETime').hide();
				} else {
					$('#ScheAllTime').val("N");
					$('#ScheSTimeAMPM').val('');
					$('#ScheSTime').val('');
					$('#ScheETimeAMPM').val('');
					$('#ScheETime').val('');
					$('#STime').show();
					$('#ETime').show();
				}
				CarListChk();  // 차량 조회
			}
			
			// 일정시간 변경
			function TimeChange(Obj, Val, type) {
				var EAP = '', ET = '', EM = '';
				$('#Sche'+Obj+'AMPM').val(Val.substr(0, 2));		// 오전, 오후
				$('#Sche'+Obj).val(Val.substr(2));					// 시간 (hh:mm)
				
				if(Obj == "STime" && !$('input[name="AllTime"]').is(":checked")) {		// 종일일정이 아닌 경우 
					if(Val.substr(2).split(":")[0] == '11'){ //  11시인 경우 
						EAP = 'PM';
					}else { 
						EAP = Val.substr(0, 2);
					}
					
					// 시작시간 + 1 = 종료시간으로 세팅 
					ET = Number(Val.substr(2).split(":")[0]) + 1;  
					EM = Val.substr(2).split(":")[1];
					if(ET == '13') ET = '1';
					$('#ScheETimeAMPM').val(EAP);							
					$('#ScheETime').val(ET + ":" + EM);						
					$('#ETime').val(EAP + ET + ":" + EM).attr("selected", "selected");  
				}
				
				CarListChk();		// 선택시간 차량 사용여부 받아오기
					
				changeScheTime();	// 회의실 스케쥴 시간변경
			}
			
			// 기간에 따른 반복 여부
			function SchePeriodChk() {
				if($('#ScheSDate').val() != $('#ScheEDate').val()) $('#RepetView').hide();
				else $('#RepetView').show();
				CarListChk();
			}
			
			// 일정 구분
			function EntrySet(Val) {
				if(Val == "All") {
					//$('#EntryView').show();		//참가자
					//$('input:radio[name="SchePublicFlag"]:input[value="Y"]').attr("checked", true);
					$('#SchePublicFlag1').trigger('click');
					//$('#SchePublicFlag2').attr('disabled', true);
					//$('#PublicView').hide();	//공개여부
					//$('#SMSView').show();		//문자전송
				
					setEnableChildren($('#EntryView').get(0));		//참가자 활성화
					
				}else {
					//$('#EntryView').hide();
					//$('input:radio[name="SchePublicFlag"]').attr("checked", false);
					//$('#SchePublicFlag2').attr('disabled', false);
					//$('#PublicView').show();
					//$('#SMSView').hide();
					
					setDisableChildren($('#EntryView').get(0));		//참가자 비활성화
					
					//참가자 초기화
					
					///////////////////////전체 해제시킴.
					for(var i=0;i<divisionList.length;i++){
						$('.Entry_'+divisionList[i].divCode).removeAttr('checked');
						SelAll('Entry',i,divisionList[i].divCode);
					}
				}
			}
			
			
			//분류 선택 onclick
			function chngScheType(){
				var frm = document.ScheduleProc;
				
				//var scheduleType = frm.ScheduleType.value;
				var scheduleType = $('input:radio[name=ScheduleType]:checked').val();
				
				if(scheduleType == 'Private'){						//개인메모 이면 일정구분(숨기있음)이 개인일정으로 선택되도록
					$('#ScheduleGubun2').trigger('click');
					$('#Secret').attr('disabled', false);			//비공개 활성화
					
				}else{												//일정구분 > 전체일정
					$('#ScheduleGubun1').trigger('click');
					$('#Secret').removeAttr('checked');
					$('#Secret').attr('disabled', true);			//비공개 비활성화
				}
				
				//메모 활성화여부, M&A업무여부
				if(scheduleType == 'Invest' || scheduleType == 'Notice' || scheduleType == 'Private' || scheduleType == 'Mt_inside' || scheduleType == 'Schedule'){
					//$('#ScheTitleTmp').attr('disabled', false)
					//$('#ScheTitleTmp').css('background-color', 'silver');
					//$('#ScheTitleTmp').css('background-image', 'url(/SynergyCus/images/sp/CSS/input_text_bg.gif)');
					//$('#trMemo').show();	//메모 보이게
					
					frm.IsMna.checked = false;		//M&A업무여부
					frm.IsMna.disabled = true;		//비활성화
					
				}else{
					
					if(!$('#IsMna').is(':checked')){
						
						//$('#ScheTitleTmp').attr('disabled', true);
						//$('#ScheTitleTmp').val('');
						//$('#ScheTitleTmp').css('background-image', 'none');
						//$('#trMemo').hide();	//메모 숨김
						
						frm.IsMna.disabled = false;		//활성화
					}
					
				}
				
				
				setAutoMakeTitle();		//제목자동생성 호출
			}
			
			
			//M&A업무여부 체크
			function chkIsMna(th)	{
				/*
				if(th.checked){
					$('#ScheTitleTmp').attr('disabled', false)					
					$('#ScheTitleTmp').css('background-image', 'url(/SynergyCus/images/sp/CSS/input_text_bg.gif)');
					$('#trMemo').show();	//메모 보이게
				}else{
					$('#ScheTitleTmp').attr('disabled', true);
					$('#ScheTitleTmp').val('');
					$('#ScheTitleTmp').css('background-image', 'none');
					$('#trMemo').hide();	//메모 숨김
				}*/
				
				setAutoMakeTitle();		//제목자동생성 호출
			}
			
			
			//비공개(개인메모) click
			function setSecret(th){
				if(th.checked)
					$('#SchePublicFlag2').trigger('click');
				else
					$('#SchePublicFlag1').trigger('click');
			}
			
			// 참가자 전체선택
		/* 	function SelAll(Obj) {
				var All = $('#'+Obj+'');
				var ChkList = $('input[name='+Obj+'Ary]');
				var DelList = $('input[name='+Obj+'DelAry]');

				if(!All.is(':checked')) {// 전체선택 체크박스가 해제되었다면
					for(var oOo = 0; oOo <= ChkList.length - 1; oOo++) {// 모든 체크박스를 체크해제
						if('${loginVO.regPerSabun}' != ChkList[oOo].value) {
							ChkList[oOo].checked = false;
							DelList[oOo].value = "Y";
						}
					}
				}
				else { // 그게 아니라면
					for(var oOo = 0; oOo <= ChkList.length - 1; oOo++) {
						if('${loginVO.regPerSabun}' != ChkList[oOo].value) {
							ChkList[oOo].checked = true;// 모든 체크박스를 체크
							DelList[oOo].value = "N";
						}
					}
				}
			} */
			
		 	function SelAll(Obj, idx, divCd) {			//idx ... division list index ... 0:'SYNERGY', 1:'FIDES'		divCd...  'SYNERGY', 'FIDES'
				var All = $($('input:checkbox[name='+Obj+']')[idx]);
				var ChkList = $('input[name='+Obj+'Ary]');
				var DelList = $('input[name='+Obj+'DelAry]');
				
				if(!All.is(':checked')) {// 전체선택 체크박스가 해제되었다면
					for(var i=0; i<ChkList.length; i++) {
						if('${loginVO.regPerSabun}' == ChkList[i].value|| !$(ChkList[i]).hasClass(divCd)) continue;	//본인제외
						ChkList[i].checked = false;
						DelList[i].value = "Y";				//체크해제
					}
				}
				else { // 그게 아니라면
					for(var i=0; i<ChkList.length; i++) {
						if(!$(ChkList[i]).hasClass(divCd)||'${loginVO.regPerSabun}' == ChkList[i].value) continue;//본인제외
						ChkList[i].checked = true;			// 모든 체크박스를 체크
						DelList[i].value = "N";				//체크
					}
				}
			}
			
			// 참가자 개별선택
			function OneSel(Obj) {
				if($('#'+Obj).is(':checked')) $('#'+Obj.replace("Ary", "DelAry")).val("N");
				else $('#'+Obj.replace("Ary", "DelAry")).val("Y");
			}
			
			// 알림발생시기 설정
			function AlarmChk(Val) {
				if(Val != "None") return;	//$('#AlarmHowView').show();
				else {
					//$('#AlarmHowView').hide();
					$('input:radio[name="AlarmHow"]').attr("checked", false);
					$('#ScheAlarmHow').val("None");
				}
			}
			
			// 알림방법 설정
			function AlarmHowChk(Val) {
				$('#ScheAlarmHow').val(Val);
			}
			
			//스케쥴 시간변경시
			function changeScheTime(){
				
				//시간 세팅
				var scheStart = $("#STime").val();
				$('#ScheSTimeAMPM').val(scheStart.substr(0, 2));
				$('#ScheSTime').val(scheStart.substr(2));
				
				var scheEnd = $("#ETime").val();
				$('#ScheETimeAMPM').val(scheEnd.substr(0, 2));
				$('#ScheETime').val(scheEnd.substr(2));
				
				
				var startTime = parseInt($("#ScheSTime").val().replace(/:/gi,''));
				var sAmPm = $("#ScheSTimeAMPM").val();
				
				var endTime = parseInt($("#ScheETime").val().replace(/:/gi,''));
				var eAmPm = $("#ScheETimeAMPM").val();
				
				
				//오전 오후 변경 
				if(sAmPm=='PM' && startTime<1200) startTime = parseInt(startTime)+1200;
				if(eAmPm=='PM' && endTime<1200){
					endTime = parseInt(endTime)+1200;
				}
				
				//스케쥴이 다른날
				if($("#ScheSDate").val() != $("#ScheEDate").val()){
					endTime = parseInt(startTime)+100;
				}
			
				//8시 이전 일경우 8 시로
				if(startTime<800) startTime=800;
				if(endTime<=800) endTime=900;
				
				//10시 이후일 경우 9시로
				if(startTime>2200) startTime=2200;
				if(endTime>2200) endTime=2200;
				
				if((startTime)>(endTime)){
					alert("시간을 다시 확인해주세요.");
					$("#STime").focus();
					return;
				}
				
				
				startTime = fillzero(startTime,4);
				endTime = fillzero(endTime,4);
				
				startTime = startTime.substring(0,2)+':'+startTime.substring(2,4)+':00';
				endTime = endTime.substring(0,2)+':'+endTime.substring(2,4)+':00';
				
				$("#meetStartTime").val(startTime);
		  		$("#meetEndTime").val(endTime);
		  		
		  		setMeetingRoomList();  // 회의실 세팅
			}
			
			
			
			//회의실 세팅
			function setMeetingRoomList(){
				
				$('#meetingRoomArea').empty();
				//$("#useTimeArea").empty();
				
				//회의실관리와 연계하여 회의실리스트 가져오기로 변경 20170907 ksm
				var url = contextRoot + "/meetingRoom/getMeetingRoomList.do";
				
				var param = {enable : 'Y'};
				
				var callback = function(result){
					g_meetingRoomList = [];
					var obj = JSON.parse(result);
					var list = obj.resultList;	
		    		
		    		for(var i=0;i<list.length;i++) {
		    			g_meetingRoomList.push({id : list[i].meetingRoomId , title : list[i].meetingRoomNm});
		    		}
				};
				commonAjax("POST", url, param, callback, false);

				if($('input:radio[name=meetingRoomUseFlag]:checked').val() == 'Y'){
					$('#meetingRoomArea').show();
					$("#useTimeArea").show();
					//$('#noticeArea').show();
					
				
				}else{
					$('#meetingRoomArea').hide();
					$("#useTimeArea").hide();
					$("#ScheArea").val('');
					return;
				}
			
				meetingRoomChk('',$("#meetStartTime").val(),$("#meetEndTime").val(),$("#rsvId").val());		//미팅룸 리스트 조회					
					
				var enableRsvRoomList = [];
		   		
		   		for(var i=0;i<g_meetingRoomList.length;i++){
		   		
		   			if(getCountWithValue(g_noRsvList, 'meetingRoomId', g_meetingRoomList[i].id) == 0){
		   				enableRsvRoomList.push(g_meetingRoomList[i]);
		   			}
		   		}
			   		
			   		
		   		var roomSelectTag = createSelectTag('selectRoomId', enableRsvRoomList, 'id', 'title', '', 'setArea();', '', '100','selectHeight');	
		  		$("#meetingRoomArea").html(roomSelectTag);
		  		
		  		//$("#meetStartTime").val(startTime);
		  		//$("#meetEndTime").val(endTime);
				setArea();
				
			}
			
			function setArea(){
				$("#ScheArea").val($("#selectRoomId :selected").text())
			}
			
			//회의실 사용가능 체크
			function meetingRoomChk(meetingRoomId,startTime,endTime,rsvId){
				
				var rslt = false;
				
				var url = contextRoot + "/meetingRoom/getMeetingRoomRsvList.do";
				
		    	var param = {
		    					choiceDate 		: $("#ScheSDate").val(),
		    					meetingRoomId 	: (meetingRoomId == undefined || meetingRoomId == ''  ? '' : meetingRoomId) ,
		    					enable			: 'Y',
		    					rsvStartTime	: startTime.split(':')[0]+':'+startTime.split(':')[1]+':01',
		    					rsvEndTime		: endTime,
		    					rsvId			: (rsvId == undefined || rsvId == '' || rsvId == 0  ? '' : rsvId)
		    				};
		    	
		    	
		    	var callback = function(result){
		    		
		    		var obj = JSON.parse(result);
		    		var list = obj.resultList;	
		    		
		    		if(meetingRoomId == '' || meetingRoomId == undefined) g_noRsvList = list;		//전체 검색건만 불가능한 회의실리스트 세팅
		    		
		    		if(list.length == 0){		//예약 가능
		    			rslt = true;
		    		}
		    		
		    	}
		   		
		    	commonAjax("POST", url, param, callback, false);
		    	
		    	return rslt;
			}
			
			// 일정 등록/수정
			function ScheduleProcEnd() {
				var SMSSeq = '${SMSSeq}';
				var ToNum_tmp, index_tmp, cnt = 0;
				
				if($('#ScheAllTime').val() == 'N') {
					$('#ScheSTimeAMPM').val($('#STime').val().substr(0, 2));
					$('#ScheSTime').val($('#STime').val().substr(2));
					
					$('#ScheETimeAMPM').val($('#ETime').val().substr(0, 2));
					$('#ScheETime').val($('#ETime').val().substr(2));
				}
				
				/* ============================== validation check Strat ============================== */			
				if($('#ScheSDate').val() > $('#ScheEDate').val()){
					alert('날짜를 다시 입력해 주세요.');
					$('#ScheSDate').focus();
					return;
				}
				$('#ScheGubun').val($('input:radio[name="ScheduleGubun"]:checked').val());
				if($('input:radio[name="ScheduleType"]:checked').val() == undefined) {
					alert('분류를 선택하셔야 합니다.');
					return;
				} else { 
					$('#ScheType').val($('input:radio[name="ScheduleType"]:checked').val());
				}
				
				if( $('#ScheAllTime').val() != 'Y' &&  $('#ScheSDate').val() != $('#ScheEDate').val() ){  // 기간 일정인 경우 반복설정은 없음만 가능
					if( $('input:radio[name="ScheRepetFlag"]:checked').val() != 'None' ){  // 없음이 아닌 경우
						alert('기간일정은 반복이 불가능합니다.');
						return;
					}
				}
				
				
				
				//M&A업무여부
				if($('#IsMna').is(':checked')){
					$('#IsMna').val('M');
				}else{
					$('#IsMna').val('');
				}
				if($('input:radio[name=CarUseFlag]:checked').length == 0) {
					if("${userLoginInfo.division}"=='SYNERGY'){
						alert('차량 사용여부를 선택하셔야 합니다.');
						return;
					}else{
						$('input:radio[name=CarUseFlag]:checked').val('N');
					}
				} else if($('input:radio[name=CarUseFlag]:checked').val() == 'Y' && $('#CarNum').val() == 'X') {
					alert('차량을 선택해 주세요. \n선택하실 차량이 없으실 경우 \'사용안함\'으로 체크해주세요.');
					return;
				}
				
				if($('#CarNum option:selected').val().indexOf('_-_') != -1) {
					$('#CarNum').append("<option value="+ $('#CarNum option:selected').val().split('_-_')[0] +" selected>"+ $('#CarNum option:selected').text() +"</option>");
				}
				
				//--회의실 추가
				if($('input:radio[name=meetingRoomUseFlag]:checked').val() == 'Y' && $("#selectRoomId").val() =='') {
					alert('회의실을 선택해 주세요');
					$("#meetingRoomId").focus();
					return;
				}
				
				if($('input:radio[name=meetingRoomUseFlag]:checked').val() == 'Y' && $("#meetStartTime").val() == $("#meetEndTime").val()) {
					alert('회의실 예약 시간을 확인해주세요');
					$("#meetStartTime").focus();
					return;
				}
				
				//중복 여부 확인
				if($('input:radio[name=meetingRoomUseFlag]:checked').val() == 'Y'){
					if(!meetingRoomChk($("#selectRoomId").val() ,$("#meetStartTime").val() ,$("#meetEndTime").val() ,$("#rsvId").val())){
						alert('이미 예약된 회의실 입니다.');
						$("#selectRoomId").focus();
						return;
					}else{
						$("#meetingRoomId").val($("#selectRoomId").val()); 
					}
				}
				
				//----------- mna 타입 및 수정추가사항 :S -----------
	//			var form = document.ScheduleProc;
	//			if(form.ScheduleType.value == 'mna' && form.mnaType.value == '') {
	//				alert('M&A 타입을 선택하셔야 합니다.');
	//				return;
	//			}
				//----------- mna 타입 및 수정추가사항 :E -----------
				
				var frm = document.ScheduleProc;
				//var scheduleType = frm.ScheduleType.value;
				var scheduleType = $('input:radio[name=ScheduleType]:checked').val();	
				
				if(scheduleType != 'Invest' && scheduleType != 'Notice' && scheduleType != 'Private' && scheduleType != 'Mt_inside' && scheduleType != 'Schedule'){
					if('${vo.eventType}' == 'Add' && isEmpty($('#tmpCstNm').val()) && isEmpty($('#tmpCpnNm').val())){
						alert('인물,회사 정보는 최소한 한가지 정보를 입력하셔야 합니다.');
						return;
					}
					
					if('${vo.eventType}' == 'Edit'){						
						var tmp = $('#ScheTitle').val().split('/')[0].trim();
						tmp = tmp.split(']')[1];
						
						if(isEmpty(tmp)){
							alert('인물,회사 정보는 최소한 한가지 정보를 입력하셔야 합니다.');
							return;
						}
					}
				}
				
				
				
				if($('#ScheTitle').val() == "") {
					alert('제목을 입력하셔야 합니다.');
					$('#ScheTitle').focus();
					return;
				}
				
				
				if($('input[name="EntryAry"]:checked').length == 0){
					alert('참가자가 없습니다. 선택해주시기 바랍니다.');
					return;
				}
				
				
				if($('input:radio[name="ScheAlarm"]:checked').val() == 'Write') {
					if($('#WriteDay').val() == "") {
						alert('알림발생시기를 입력하셔야 합니다.');
						$('#WriteDay').focus();
						return;
					}
					$('#ScheAlarmFlag').val($('#WriteDay').val());
					
				}else {
					$('#WriteDay').val('');
					$('#ScheAlarmFlag').val($('input:radio[name="ScheAlarm"]:checked').val());
				}
				
				if($('input:radio[name="AlarmHow"]:checked').val() != undefined)
					$('#ScheAlarmHow').val($('input:radio[name="AlarmHow"]:checked').val());
				
				if($('input:radio[name="ScheAlarm"]:checked').val() != 'None' && $('#ScheAlarmHow').val() == 'None') {
					alert("알림방법을 선택하셔야 합니다.");
					return;
				}
				
				if($('#ScheGubun').val() == 'Alone' && $('input:radio[name="SchePublicFlag"]:checked').val() == undefined) {
					alert('공개여부를 선택하셔야 합니다.');
					return;
				}
								
				if($('input:radio[name="ScheduleGubun"]:checked').val() == 'All') {
			    	for(var i = 1; i < (Number($('#EmpCnt').val()) + 1); i++) {
						$('#EntrySabunAry'+i).val($('#EntryPerAry'+i).val());
						$('#EntryDelFlagAry'+i).val($('#EntryDelAry'+i).val());
					}
			    	
			    	// 문자전송
			    	if($('#SMSSendFlag').is(':checked')) {
						for(var i = 1; i < (Number($('#EmpCnt').val()) + 1); i++) {
							if($('#EntryDelAry'+i).val() != 'Y' && $('#EntryPhoneAry'+i).val() != '') {
								if(cnt == 0) {
									ToNum_tmp = $('#EntryPhoneAry'+i).val();
									index_tmp = SMSSeq;
								}
								else {
									ToNum_tmp = ToNum_tmp + "," + $('#EntryPhoneAry'+i).val();
									index_tmp = index_tmp + "," + SMSSeq;
								}
								$('#SMSSeq'+i).val(SMSSeq);
								cnt++;
								SMSSeq++;
							}
						}
					}
			    }
				
				/* ============================== validation check End ============================== */	
				
				
				$('#ScheSYear').val($('#ScheSDate').val().split('-')[0]);
				$('#ScheSMonth').val($('#ScheSDate').val().split('-')[1]);
				$('#ScheSDay').val($('#ScheSDate').val().split('-')[2]);
				$('#ScheEYear').val($('#ScheEDate').val().split('-')[0]);
				$('#ScheEMonth').val($('#ScheEDate').val().split('-')[1]);
				$('#ScheEDay').val($('#ScheEDate').val().split('-')[2]);
				
				// 문자 전송 데이터
				var Title = $('#ScheTitle').val();
				var Period = "";
				if($('#ScheAllTime').val() == 'N') Period = $('#ScheSDate').val() + " (" + $('#STime').val().replace('AM', '오전 ').replace('PM', '오후 ') + ") ~ " + $('#ScheEDate').val() + " (" + $('#ETime').val().replace('AM', '오전 ').replace('PM', '오후 ') + ")";
				else Period = $('#ScheSDate').val() + " ~ " + $('#ScheEDate').val();
				
				$('#SMSContent').val("[일정] '" + Title + " ["+Period+"]'");
				
				
				if($('#EventType').val() == 'Add') {
					//$('#InfoMessage').val('등록 완료 되었습니다.');
					$('#ScheduleProc').attr('action', "<c:url value='/ScheduleAddEnd.do'/>");
					if($("#ParentPage").val() == 'card'){
						parent.LayerClose();
					}
				} else {					
					/* 팝업시 수정 막은듯..
					if(opener != null && opener.$('#EventType').val() != 'Pop') {
						form.target = "content";
						$('#EventType').val(opener.$('#EventType').val());
					}
					else form.target = "_self";*/
					//form.target = "_self";
					$('#EventType').val("Edit");
					//$('#InfoMessage').val('수정 완료 되었습니다.');
					$('#ScheduleProc').attr('action', "<c:url value='/ScheduleEditEnd.do'/>");
				}
				
				if($('#ScheSDate').val() != $('#ScheEDate').val()) 
					$('#SchePeriodFlag').val('Y');
				

				if( ($('#SchePeriodFlag').val() == 'Y' || $('input:radio[name="ScheRepetFlag"]:checked').val() != 'None') 
						&& $('input:radio[name="meetingRoomUseFlag"]:checked').val() != 'N'){
					
					alert("반복이나 기간일정은 회의실 예약이 불가하여, 회의실 예약 설정은 취소됩니다.");
					$('input:radio[name=meetingRoomUseFlag]:checked:input[value="N"]').prop("checked",true); 
				}
								
				//$('#ScheduleProc').attr('target', 'content').submit();
				$('#ScheduleProc').attr('target', 'mainFrame').submit();		//IBsystem mainFrame
				
				
				showLayer();
				if($('#EventType').val() == 'Add') {
					if($("#ParentPage").val() == 'card'){
						parent.LayerClose('Add');
					}
				}
				if(cnt != 0) {   
					NowTime = replaceC(GetToday(), "-", "") + replaceC(GetNowTime("HhMiSs"), ":", "");
					if(Title.length > 9) Title = Title.substring(0, 9) + "..";
					
					$('#toNumber').val(replaceC(ToNum_tmp, "-", ""));
					$('#contents').val($('#SMSContent').val());
					
// 					$('#fromNumber').val(replaceC($('#RegPerPhone').val(), "-", ""));
					$('#startTime').val(NowTime);
					$('#indexCode').val(index_tmp);
					$('#ScheduleProc').attr('target', 'moashot').attr('action', "https://biz.moashot.com/EXT/URLASP/mssendUTF.asp").submit();
				}
			}
			
			// 수정취소
			function ScheView() {
				$('#EventType').val("View");
				$('#ScheduleProc').attr('action', "<c:url value='/ScheduleView.do'/>").submit();
			}
			
			
			
			//------------------------------------- mna 추가 관련 회사 선택 팝업용 :S -------------------------------------
			var mnaPopup;
			function popUp(num,flag,nm,snb){

				// popUp 규격
				var w = '740';
				var h = '740';
				var ah = screen.availHeight - 30;
				var aw = screen.availWidth - 10;
			
				var val = new Object();
				var sUrl = '';
			
				if(flag=='c') {
					//sUrl = "http://106.250.177.91:8180/IBsystem/work/popUpCpn.do";
					sUrl = "work/popUpCpn.do";
					sUrl+='?f='+flag+'&n='+num+'&fromInside=y';
					w='500',h='600';	
				}else if(flag=='iP'){
					//sUrl = "http://106.250.177.91:8180/IBsystem/work/popUpCst.do";
					sUrl = "work/popUpCst.do";
					sUrl+='?f='+flag+'&n='+num;
					w='500',h='600';
				}
				
				h = (ah-40>h?h:ah-40);
				var xc = (aw - w) / 2;
				var yc = (ah - h) / 2;
				var option = "left=" + xc
							+",top=" + yc
							+",width=" + w
							+",height=" + h
							+",menubar=no"
							+",status=no"
							+",toolbar=no"
							+",location=no"
							+",scrollbars=yes"
							+",resizable=no"
							;
			
				mnaPopup = window.open(sUrl, "_blank", option);			
			}
			
			
			//팝업에서 회사 선택시 메세지를 던져서 하단 이벤트리스너 및 핸들러가 처리
			
			addEventListener("message", receiveMessage, false);
			
			
			function receiveMessage(event)
			{
			  	//alert(event.data);
			  
			  	var obj = JSON.parse(event.data);
			  
			  	
			  	if(obj.position == undefined){	//------ 회사선택
			  		
			  		var tmpSpan = document.createElement("span");
					tmpSpan.innerHTML = obj.nm;
					
					var cpnNm = $(tmpSpan).text();		//위에서 임시로  span 을 만들어 내부에 테그를포함한 회사명을 넣어놓고 text()로 텍스트만 뽑아낸다.
					var cpnId = obj.snb;
					//alert('회사명:::' + cpnNm  + '\n회사 ID:::' + cpnId);
					
					
					$('#tmpCpnNm').val(cpnNm);		//회사명 표시
					$('#tmpCpnId').val(cpnId);		//회사 ID 임시저장
			  		
					$('#ScheArea').val(cpnNm);		//장소 표시
					
			  	}else{							//------ 인물선택
			  		//인물
			  		var tmpSpan = document.createElement("span");
					tmpSpan.innerHTML = obj.nm;
					
					var cstNm = $(tmpSpan).text();		//위에서 임시로  span 을 만들어 내부에 테그를포함한 인물명을 넣어놓고 text()로 텍스트만 뽑아낸다.
					var cstId = obj.snb;
					
					$('#tmpCstNm').val(cstNm);		//인물명 표시
					$('#tmpCstId').val(cstId);		//인물 ID 임시저장
			  		
					
					//회사
					tmpSpan.innerHTML = obj.cpnNm;
					
					var cpnNm = $(tmpSpan).text();		//위에서 임시로  span 을 만들어 내부에 테그를포함한 회사명을 넣어놓고 text()로 텍스트만 뽑아낸다.
					var cpnId = obj.cpnId;
					
					$('#tmpCpnNm').val(cpnNm);		//회사명 표시
					$('#tmpCpnId').val(cpnId);		//회사 ID 임시저장
					
					$('#ScheArea').val(cpnNm);		//장소 표시
			  	}
			  	
				
				setAutoMakeTitle();				//제목 자동생성 호출
				
				mnaPopup.close();	//팝업닫기
			}
			
			
			//분류 global variable
			/*var g_sTypeObj = {IR:	'IR'
						   ,Visit:	'탐방'
						   ,Meet:	'미팅'
						   ,Invest:	'투자'
						   ,Other:	'기타'
						   ,mna:	'M&A'};*/
			var g_sTypeObj = {Invest:	'투자'
						   ,Notice:		'알림'
						   ,Schedule:	'일정'
						   ,Mt_inside:	'회의'
						   ,Private:	'메모'
						   ,IR:			'IR'
						   ,Visit:		'탐방'
						   ,Meet:		'미팅'
						   ,Mt_lunch:	'점심미팅'
						   ,Mt_dinner:	'저녁미팅'
						   ,Inspect:	'실사'
						   ,Mediate:	'중개'
						   ,Manage:		'관리'
						   ,BusiTrip:	'출장'
						   };
			
						   
			//제목 자동생성 호출
			function setAutoMakeTitle(){
				
				var form = document.ScheduleProc;
				
				var title = '';
				//분류
				var kV = $('input:radio[name="ScheduleType"]:checked').val();
				if(kV != undefined) {
					title += '[' + g_sTypeObj[kV] + '] ';
				}
				//회사
				var cpV = $('#tmpCpnNm').val();
				if(cpV.trim().length > 0){
					//title += $('#tmpCpnNm').val() + ' |' + $('#tmpCpnId').val() + '| ';						//회사정보 ( 회사명 (회사ID) )
					title += $('#tmpCpnNm').val() + ' ';						//회사정보 ( 회사명 )
				}
				var csV = $('#tmpCstNm').val();
				if(csV.trim().length > 0){
					//title += $('#tmpCstNm').val() + ' (' + $('#tmpCstId').val() + ') ';						//인물정보 ( 인물명 (인물ID) )
					title += $('#tmpCstNm').val() + ' ';						//인물정보 ( 인물명 )
				}
				
				
				//M&A 옵션
				/*
				if($('input:radio[name="ScheduleType"]:checked').val() == 'mna') {		//M&A 일경우
					title += '/' + $('input[value=' + form.mnaType.value + ']').parent().text() + '/';
				}*/
				if($('#IsMna').is(':checked')){				//M&A 일경우
					title += '/ M&A /';
				}
				
				//추가 제목입력 사항
				var aV = $('#ScheTitleTmp').val();
				if(aV.trim().length > 0){
					title += ' ' + aV;
				}
				
				$('#ScheTitle').val(title);	//제목
				$('#ScheCon').val(title);	//내용에도 추가
			}
			
			
			//인물, 회사 초기화
			function resetCstCpn(){
				$('#tmpCpnNm').val('');
				$('#tmpCpnId').val('');
				$('#tmpCstNm').val('');
				$('#tmpCstId').val('');
				
				$('#ScheArea').val('');		//장소 표시
				
				setAutoMakeTitle();				//제목 자동생성 호출
			}
			
			
			//인물, 회사 선택 된것 화면에 추가
			function returnPopUp(rVal){
				var flag = rVal.f
				var nm = rVal.nm
				var num = rVal.n;
				
			
				if(flag=='c'){
					var tmpSpan = document.createElement("span");
					tmpSpan.innerHTML = rVal.nm;
					
					var cpnNm = $(tmpSpan).text();		//위에서 임시로  span 을 만들어 내부에 테그를포함한 회사명을 넣어놓고 text()로 텍스트만 뽑아낸다.
					var cpnId = rVal.snb;
					//alert('회사명:::' + cpnNm  + '\n회사 ID:::' + cpnId);
					
					
					$('#tmpCpnNm').val(cpnNm);		//회사명 표시
					$('#tmpCpnId').val(cpnId);		//회사 ID 임시저장
			  		
					$('#ScheArea').val(cpnNm);		//장소 표시
				
				}else{
					
					//인물
			  		var tmpSpan = document.createElement("span");
					tmpSpan.innerHTML = rVal.nm;
					
					var cstNm = $(tmpSpan).text();		//위에서 임시로  span 을 만들어 내부에 테그를포함한 인물명을 넣어놓고 text()로 텍스트만 뽑아낸다.
					var cstId = rVal.snb;
					
					$('#tmpCstNm').val(cstNm);		//인물명 표시
					$('#tmpCstId').val(cstId);		//인물 ID 임시저장
			  		
					//회사
					tmpSpan.innerHTML = rVal.cpnNm;
					
					var cpnNm = $(tmpSpan).text();		//위에서 임시로  span 을 만들어 내부에 테그를포함한 회사명을 넣어놓고 text()로 텍스트만 뽑아낸다.
					var cpnId = rVal.cpnId;
					
					$('#tmpCpnNm').val(cpnNm);		//회사명 표시
					$('#tmpCpnId').val(cpnId);		//회사 ID 임시저장
					
					$('#ScheArea').val(cpnNm);		//장소 표시
					
				}
								 
				setAutoMakeTitle();				//제목 자동생성 호출
				
				mnaPopup.close();	//팝업닫기
				
			}
			
			//------------------------------------- mna 추가 관련 회사 선택 팝업용 :E -------------------------------------
			
		</script>
		<style>
			.head {
				height:40px;
				width:99%;
				font-weight:bold;
				color: #496b9b;
				padding-left:10px;
				padding-top:10px;
				border: 1px solid #b4cef3;
				background-position: left bottom;
				background-color:#EEEEEE;
			}
			.btn1.orange a {
			    color: #fff;
			    background-color: orange;
			    cursor:pointer;
			    padding-top:3px;
			    padding-bottom:5px;
			}
			.btn1.navy a {
			    color: #fff;
			    background-color: skyblue;
			    cursor:pointer;
			    padding-top:3px;
			    padding-bottom:5px;
			}
			.real_title {
			    border: 0px #b5b8c8 solid;
			    background-image: none;
			    height: 14pt;
			    font-weight: bold;
			    padding-bottom:4px;
			}
			.btn_reset {
			    color: #fff;
			    background-color: silver;
			    cursor:pointer;
			    padding-bottom:2px;
			}
			.btn_lightblue{
				background-color: #79BBFF;
			    -moz-border-radius: 6px;
			    -webkit-border-radius: 6px;
			    border-radius: 6px;
			    display: inline-block;
			    cursor: pointer;
			    color: #FFFFFF;
			    font-family: 맑은 고딕;
			    font-size: 8pt;
			    font-weight: bold;
			    padding: 4px 8px;
			    text-decoration: none;
		    }
		</style>
	</head>
	<body>
	<form name="ScheduleProc" id="ScheduleProc" action="" method="post">
	<input type="hidden" name="InfoMessage" 		id="InfoMessage"/>
	<input type="hidden" name="CMD"					id="CMD"				value="${vo.CMD}"/>
	<input type="hidden" name="EmpCnt"				id="EmpCnt"				value="${fn:length(EmpList)}"/>
	<input type="hidden" name="EventType"			id="EventType"			value="${vo.eventType}"/>
	<input type="hidden" name="ParentPage"			id="ParentPage"			value="${vo.parentPage}"/>
	<input type="hidden" name="SelDate"				id="SelDate"			value="${vo.scheSDate}"/>
	<input type="hidden" name="PerSabun"			id="PerSabun"			value="${loginVO.regPerSabun}"/>
	<input type="hidden" name="RegPerPhone"			id="RegPerPhone"		value="${loginVO.perPhone}"/>
	<input type="hidden" name="IB_ID"				id="IB_ID"				value="${loginVO.IB_ID}"/>
	<input type="hidden" name="ScheSeq"				id="ScheSeq"			value="${scheVO.scheSeq}"/>
	<input type="hidden" name="ScheGrpCd"			id="ScheGrpCd"			value="${scheVO.scheGrpCd}"/>
	<input type="hidden" name="ProcFlag"			id="ProcFlag"			value="${vo.procFlag}"/>
	<input type="hidden" name="ScheSYear"			id="ScheSYear"/>
	<input type="hidden" name="ScheSMonth"			id="ScheSMonth"/>
	<input type="hidden" name="ScheSDay"			id="ScheSDay"/>
	<input type="hidden" name="ScheEYear"			id="ScheEYear"/>
	<input type="hidden" name="ScheEMonth"			id="ScheEMonth"/>
	<input type="hidden" name="ScheEDay"			id="ScheEDay"/>
	<input type="hidden" name="SchePeriodFlag"		id="SchePeriodFlag"		value="${scheVO.schePeriodFlag}"/>
	<input type="hidden" name="ScheAlarmFlag"		id="ScheAlarmFlag"/>
	<input type="hidden" name="ScheRepetFlagTmp"	id="ScheRepetFlagTmp"	value="${scheVO.scheRepetFlag}"/>
	<input type="hidden" name="ScheGubun" 			id="ScheGubun"			value="${scheVO.scheGubun}"/>
	<input type="hidden" name="ScheType" 			id="ScheType"			value="${scheVO.scheType}"/>
	<input type="hidden" name="ContactLoc"			id="ContactLoc"/>
	<input type="hidden" name="SMSContent"			id="SMSContent"/>
	<input type="hidden" name="grpCd"		        id="grpCd"              value="${vo.grpCd}"/>
	<input type="hidden" name="alone"		        id="alone"              value="${vo.alone}"/>
	
	<input type="hidden" name="userSeq"				value="${userLoginInfo.staffSnb }"/>
	<input type="hidden" name="meetingRoomId"	id="meetingRoomId"	value=""/>
	
	<!-- 모아샷 연동 파라메터 -->
	<input type="hidden" name="uid"			id="uid"			value="synergy">
	<input type="hidden" name="pwd"			id="pwd"			value="00synergy00">
	<input type="hidden" name="sendType"	id="sendType"		value="3">
	<input type="hidden" name="toNumber"	id="toNumber">
	<input type="hidden" name="contents"	id="contents">
	<input type="hidden" name="fromNumber"	id="fromNumber" value="025865981">
	<input type="hidden" name="startTime"	id="startTime">
	<input type="hidden" name="nType"		id="nType"			value="3">
	<input type="hidden" name="indexCode"	id="indexCode">
	<input type="hidden" name="returnUrl"	id="returnUrl"		value="http://106.250.177.91:8280/SynergyCus/SMSSendResult.do">
	<input type="hidden" name="returnType"	id="returnType"		value="2">
	<input type="hidden" name="redirectUrl" id="redirectUrl"	value="http://106.250.177.91:8280/SynergyCus/ClosePage.do">
	<div id="prolayer" style="height:100%;width:100%;display:none;">
		<table border="0" width="100%" height="100%">
			<tr><td align="center"><img src="<c:url value='/images/sp/loading.gif'/>"><p><b>저장중입니다.</b></td></tr>
		</table>
	</div>
	<table class="subtable_noline" cellpadding="0" cellspacing="0" style="width:770px;" align="center">
		<tr>
			<td class="Title_B Text_L" colspan="3" style="height:40px;"><img src="images/sp/arrow3.gif" style="line-height:23px;vertical-align:middle;"> 일정등록</td>
		</tr>
		<tr style="display:none;">
			<td class="desc_BR Text_L" colspan="2" style="width:18%;height:35px;">일정구분</td>
			<td class="input_B Text_L" bgcolor="#EEEEEE">
				<input type="radio" name="ScheduleGubun" id="ScheduleGubun1" value="All" onclick="javascript:EntrySet(this.value);" checked/><label for="ScheduleGubun1">전체 일정</label>
				<input type="radio" name="ScheduleGubun" id="ScheduleGubun2" value="Alone" onclick="javascript:EntrySet(this.value);"/><label for="ScheduleGubun2">개인 일정</label>
			</td>
		</tr>
		
		<tr style="width:150px!important;">
			<td class="desc_BR Text_L" rowspan="2" style="width:70px!important;;border-right: 0px dotted #b4cef3;">분류</td>
			<td class="desc_BR Text_L" style="width:70px!important;height:28px;border-bottom: 1px dotted #b4cef3;">관리</td>
			<td class="input_B Text_L" style="border-bottom: 1px dotted #b4cef3;">
				<input type="radio" name="ScheduleType" id="ScheType1" value="Invest" onclick="javascript:chngScheType();" /><label for="ScheType1">투자</label>&nbsp;
				<input type="radio" name="ScheduleType" id="ScheType2" value="Notice" onclick="javascript:chngScheType();"/><label for="ScheType2">알림(공지)</label>&nbsp;								
				<input type="radio" name="ScheduleType" id="ScheType3" value="Schedule" onclick="javascript:chngScheType();"/><label for="ScheType3">일정</label>&nbsp;
				<input type="radio" name="ScheduleType" id="ScheType4" value="Mt_inside" onclick="javascript:chngScheType();"/><label for="ScheType4">회의</label>&nbsp;
				<input type="radio" name="ScheduleType" id="ScheType5" value="Private" onclick="javascript:chngScheType();"/><label for="ScheType5">개인메모</label>(<input type="checkbox" name="Secret" id="Secret" onclick="javascript:setSecret(this);"/><label for="Secret">비공개</label>)&nbsp;
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_L" style="width:9%;height:28px;border-left: none;">업무</td>
			<td class="input_B Text_L">
				<%--
				<input type="radio" name="ScheduleType" id="ScheType1" value="IR"/><label for="ScheType1">IR</label>
				<input type="radio" name="ScheduleType" id="ScheType2" value="Visit"/><label for="ScheType2">탐방</label>
				<input type="radio" name="ScheduleType" id="ScheType3" value="Meet"/><label for="ScheType3">미팅</label>
				<input type="radio" name="ScheduleType" id="ScheType4" value="Invest"/><label for="ScheType4">투자</label>
				<input type="radio" name="ScheduleType" id="ScheType5" value="Other"/><label for="ScheType5">기타</label>
				<input type="radio" name="ScheduleType" id="ScheType6" value="mna"/><label for="ScheType6">M&A</label>
				<span id="spanMnaOption" style="display:none;">					
					(<label><input type="radio" name="mnaType" value="mna_m"/>미팅</label>
					<label><input type="radio" name="mnaType" value="mna_d"/>실사</label>
					<label><input type="radio" name="mnaType" value="mna_a"/>중개</label>
					<label><input type="radio" name="mnaType" value="mna_g"/>관리</label> )					
				</span>
				 --%>
				<input type="radio" name="ScheduleType" id="ScheType6" value="IR" onclick="javascript:chngScheType();"/><label for="ScheType6">IR</label>
				<input type="radio" name="ScheduleType" id="ScheType7" value="Visit" onclick="javascript:chngScheType();"/><label for="ScheType7">탐방</label>
				<input type="radio" name="ScheduleType" id="ScheType8" value="Meet" onclick="javascript:chngScheType();"/><label for="ScheType8">미팅</label>
				<input type="radio" name="ScheduleType" id="ScheType9" value="Mt_lunch" onclick="javascript:chngScheType();"/><label for="ScheType9">점심미팅</label>
				<input type="radio" name="ScheduleType" id="ScheType10" value="Mt_dinner" onclick="javascript:chngScheType();"/><label for="ScheType10">저녁미팅</label>
				<input type="radio" name="ScheduleType" id="ScheType11" value="Inspect" onclick="javascript:chngScheType();"/><label for="ScheType11">실사</label>
				<input type="radio" name="ScheduleType" id="ScheType12" value="Mediate" onclick="javascript:chngScheType();"/><label for="ScheType12">중개</label>
				<input type="radio" name="ScheduleType" id="ScheType13" value="Manage" onclick="javascript:chngScheType();"/><label for="ScheType13">관리</label>
				<input type="radio" name="ScheduleType" id="ScheType14" value="BusiTrip" onclick="javascript:chngScheType();"/><label for="ScheType14">출장</label>
				
				&nbsp;&nbsp;| <input type="checkbox" name="IsMna" id="IsMna" onclick="javascript:chkIsMna(this);" /><label for="IsMna"><font style="font-weight:bold;">M&A업무여부</font></label>
				
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_L" colspan="2" style="height:35px;">기간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:choose>
					<c:when test="${vo.eventType eq 'Edit' && scheVO.scheGrpCd ne '' && scheVO.scheGrpCd ne 'Period' && vo.procFlag ne 'alone'}">						
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="AllTime" id="AllTime" onclick="javascript:AllTimeSet();"><label for="AllTime"><font style="font-weight:bold;">종일일정</font></label>
					</c:otherwise>
				</c:choose>			
			</td>
			<td class="input_B Text_L">
				<%-- <c:choose> 
					<c:when test="${vo.eventType eq 'Edit' && scheVO.scheGrpCd ne '' && scheVO.scheGrpCd ne 'Period' }"> 
						<c:choose>
							<c:when test="${scheVO.scheAllTime eq 'Y'}">${scheVO.scheSDate} ~ ${scheVO.scheEDate}</c:when>
							<c:otherwise>${scheVO.scheSDate} ${scheVO.scheSTimeAMPMNm} ${scheVO.scheSTime} ~ ${scheVO.scheEDate} ${scheVO.scheETimeAMPMNm} ${scheVO.scheETime}</c:otherwise>
						</c:choose>
						<input type="hidden" name="ScheSDate" id="ScheSDate" value="${scheVO.scheSDate}">
						<input type="hidden" name="ScheSTimeAMPM" id="ScheSTimeAMPM" value="${scheVO.scheSTimeAMPMNm}"/>
						<input type="hidden" name="ScheSTime" id="ScheSTime" value="${scheVO.scheSTime}"/>
						<input type="hidden" name="ScheEDate" id="ScheEDate" value="${scheVO.scheEDate}">
						<input type="hidden" name="ScheETimeAMPM" id="ScheETimeAMPM" value="${scheVO.scheETimeAMPMNm}"/>
						<input type="hidden" name="ScheETime" id="ScheETime" value="${scheVO.scheETime}"/>
					</c:when>
					<c:otherwise> --%>
					    <!-- 
						<input type="checkbox" name="AllTime" id="AllTime" onclick="javascript:AllTimeSet();"><label for="AllTime">종일일정</label>
						&nbsp; -->
						<input type="text" class="input_box Text_C" name="ScheSDate" id="ScheSDate" value="${vo.scheSDate}" size="12" maxlength="10" onchange="javascript:setMeetingRoomList();" onkeyup="javascript:DateFormat(this.name, this.value);">
						<input type="hidden" name="ScheSTimeAMPM"	id="ScheSTimeAMPM"/>
						<input type="hidden" name="ScheSTime"		id="ScheSTime"/>
						<select name="STime" id="STime" style="height:24px;font-size:12px;" onchange="javascript:TimeChange(this.id, this.value);"></select> ~ 
						<input type="text" class="input_box Text_C" name="ScheEDate" id="ScheEDate" value="${vo.scheSDate}" size="12" maxlength="10" onkeyup="javascript:DateFormat(this.name, this.value);">
						<input type="hidden" name="ScheETimeAMPM"	id="ScheETimeAMPM"/>
						<input type="hidden" name="ScheETime"		id="ScheETime"/>
						<select name="ETime" id="ETime" style="height:24px;font-size:12px;" onchange="javascript:TimeChange(this.id, this.value);"></select>						
						<input type="hidden" name="ScheAllTime" id="ScheAllTime" value="N"/>
				<%--	</c:otherwise>
				 </c:choose> --%>
			</td>
		</tr>
		
		<tr <c:if test="${userLoginInfo.division != 'SYNERGY' }">   style=" display :none; " </c:if>>
			<td class="desc_BR Text_L" colspan="2" style="height:35px;" >차량사용여부</td>
			<td class="input_B Text_L">
				<input type="radio" name="CarUseFlag" id="CarUseY" value="Y"/><label for="CarUseY">사용함</label>
				<input type="radio" name="CarUseFlag" id="CarUseN" value="N" checked/><label for="CarUseN">사용안함</label>
				<select name="CarNum" id="CarNum" style="display:none;"> 
					<option value="X">선택하세요.</option>
					<c:forEach var="car" items="${CarList}" varStatus="status">
						<c:choose>
							<c:when test="${car.caruseflag eq 'N' }"><option value="${car.carnum}">${car.carnum}</option></c:when>
							<c:otherwise><option value="${car.carnum}" style="background:#FFD7EB;">${car.carnum} - (${car.pernm} ${car.stime} ~ ${car.etime})</option></c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				&nbsp;
				<span class="btn1 s orange" name="Orange">
				<a href="javascript:CarUseList();" class="c_title" style="vertical-align:top;" name="Orange">&nbsp;차량사용 현황보기&nbsp;</a></span>
				<%--<span style="color:#FF0000;"> (차량사용시 예상 종료시간을 입력해주시면 다른 사람의 일정 등록시 참고가 됩니다.)</span> --%>				
			</td>
		</tr>
		
		
		<tr>
			<td class="desc_BR Text_L" colspan="2" style="height:35px;" >회의실사용여부</td>
			<td class="input_B Text_L">
				<label><input type="radio" name="meetingRoomUseFlag" value="Y" onclick="changeScheTime();"/>사용함</label>
				<label><input type="radio" name="meetingRoomUseFlag" value="N" checked onclick="changeScheTime();"/>사용안함</label>
				
			<!-- 	<input type="hidden" id="meetStartTime" name="meetStartTime" value=""/>
				<input type="hidden" id="meetEndTime" name="meetEndTime"  value=""/>  -->
				<input type="hidden" id="rsvId" name="rsvId" value="0"/>
				<span>
					<span id="useTimeArea" style="display:none;"></span>
					<span id="meetingRoomArea" style="display:none;margin-left:10px;"></span>
					
				</span>
				<span style="margin-left:8px;">
				<a href="javascript:meetingRoomRsvList();" class="c_title" style="background:Orange;padding: 4px 7px; color: #fff;" name="Orange"><strong>회의실</strong> 현황보기</a></span>
				
				<div id="noticeArea" style="padding:4px;margin-top: 5px;">
					<div>* 회의실 예약 시간은 8 시 ~ 22시 까지 이며, 시간 초과 및 미달 시 자동으로 세팅됨.</div>  
					<div style="margin-top:3px;color:#fd6205;">* 반복 일정이거나 기간 일정(시작일과 종료일이 다른 일정)일 경우 회의실 예약 불가.</div> 
				</div>
			</td>
		</tr>
		
		<tr>
			<td class="desc_BR Text_L" colspan="2" style="height:35px;">인물, 회사</td>
			<td class="input_B Text_L">
				<span class="btn1 s navy" name="">
					<a onclick="popUp('0','iP')" id="AP_infoProviderNm" class="c_title">&nbsp;인물선택 </a>
				</span>
				<input type="text" class="input_box" name="tmpCstNm" id="tmpCstNm" size="20" disabled="true" style="height:20px;background-color:#EFEFEF!important;background-image:none;"/>
				<input type="hidden" name="tmpCstId" id="tmpCstId" />
				
				<span class="btn1 s orange" name="">
					<a onclick="popUp('0','c')" id="AP_cpnNm" class="c_title">&nbsp;회사선택 </a>
				</span>
				<input type="text" class="input_box" name="tmpCpnNm" id="tmpCpnNm" size="40" disabled="true" style="height:20px;background-color:#EFEFEF!important;background-image:none;"/>
				<input type="hidden" name="tmpCpnId" id="tmpCpnId" />
				&nbsp;
				<a href="javascript:resetCstCpn();" class="btn_reset"> &nbsp초기화&nbsp;</a>
			</td>
		</tr>
		<tr id="trMemo">	<!-- style="display:none;"> --> 
			<td class="desc_BR Text_L" colspan="2" style="height:30px;padding-bottom:5px;">메모</td>
			<td class="input_B Text_L">
				<%--<input type="text" class="input_box real_title" name="ScheTitle" id="ScheTitle" size="70" readonly="true"/> --%>
				<input type="text" class="input_box" name="ScheTitleTmp" id="ScheTitleTmp" size="100"/>
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_L" colspan="2" style="height:30px;padding-bottom:5px;">제목
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>[입력결과]</b>
			</td>
			<td class="input_B Text_L">
				<input type="text" class="input_box real_title" name="ScheTitle" id="ScheTitle" size="70" readonly="true"/>				
			</td>
		</tr>
		
		
				
		<%--
		<tr id="SMSView">
			<td class="desc_BR Text_L" style="height:35px;">문자전송</td>
			<td class="input_B Text_L">
				<input type="checkbox" name="SMSSendFlag" id="SMSSendFlag" value="Y"/><label for="SMSSendFlag">문자전송</label>
				<span style="color:#FF0000;">(체크하시고 일정을 등록하시면 참가자로 선택한 사람에게 해당일정에 대한 문자가 전송됩니다.)</span>
			</td>
		</tr> --%>
		<tr>
			<td class="desc_BR Text_L" colspan="2" style="height:35px;">장소</td>
			<td class="input_B Text_L"><input type="text" class="input_box" name="ScheArea" id="ScheArea" size="70"/></td>
		</tr>
		<tr>
			<td class="desc_BR Text_L" colspan="2" style="height:90px;">세부내용</td>
			<td class="input_B Text_L"><textarea name="ScheCon" id="ScheCon" style="font-size:12px;ime-mode:active;" rows="5" cols="40"></textarea></td>
		</tr>
		<tr id="EntryView"> 
			<td class="desc_BR Text_L" colspan="2"  style="height:50px;">
				참가자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td class="input_B Text_L" style="padding-top:5px;padding-bottom:5px;">
				<c:forEach var="EmpResult" items="${EmpList}" varStatus="status">
					<c:if test="${status.index eq 0}">
						<div id="${EmpList[status.index].division}_div" style="background:#B2CCFF;width:24%;color:white;"></div>
					</c:if>
					<c:choose>
						<c:when test="${EmpResult.persabun eq loginVO.regPerSabun}">
							<input type="checkbox" name="EntryAry" id="EntryAry${status.count}" class="${EmpResult.division}"  value="${EmpResult.persabun}" onclick="javascript:OneSel(this.id);" checked/>
							<label for="EntryAry${status.count}">${EmpResult.pernm}</label>
							<c:set var="DelChk" value="N"/>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="EntryAry" id="EntryAry${status.count}" class="${EmpResult.division}"  value="${EmpResult.persabun}" onclick="javascript:OneSel(this.id);"/>
							<label for="EntryAry${status.count}">${EmpResult.pernm}</label>
							<c:set var="DelChk" value="Y"/>
						</c:otherwise>
					</c:choose>
					<input type="hidden" name="EntryPerAry" id="EntryPerAry${status.count}" value="${EmpResult.persabun}"/>
					<input type="hidden" name="EntryDelAry" id="EntryDelAry${status.count}" value="${DelChk}"/>
					<c:if test="${status.count % 9 eq 0}"><br/></c:if>
					<c:if test="${status.count gt 0 and status.count lt (fn:length(EmpList)) and EmpList[status.index].division ne EmpList[status.index+1].division}"><br/>
						<div style="border-top:silver 1px dotted;width:98%;">
							<div id="${EmpList[status.index+1].division}_div" style="background:#B2CCFF;width:25%;color:white;"></div>
							<%-- ${EmpList[status.index+1].division} --%>
						</div>
					</c:if>
					<input type="hidden" name="EntrySabunAry${status.count}" id="EntrySabunAry${status.count}"/>
					<input type="hidden" name="EntryDelFlagAry${status.count}" id="EntryDelFlagAry${status.count}"/>
					<input type="hidden" name="EntryPhoneAry${status.count}" id="EntryPhoneAry${status.count}" value="${EmpResult.perphone}"/>
				</c:forEach>
			</td>
		</tr>
		<tr id="RepetView">
			<td class="desc_BR Text_L" colspan="2" style="height:30px;">반복설정</td>
			<td class="input_B Text_L">
				<input type="radio" name="ScheRepetFlag" id="ScheRepetFlag1" value="Year"/><label for="ScheRepetFlag1">매년</label>
				<input type="radio" name="ScheRepetFlag" id="ScheRepetFlag2" value="Quarter"/><label for="ScheRepetFlag2">분기</label>
				<input type="radio" name="ScheRepetFlag" id="ScheRepetFlag3" value="Month"/><label for="ScheRepetFlag3">매월</label>
				<input type="radio" name="ScheRepetFlag" id="ScheRepetFlag4" value="Week"/><label for="ScheRepetFlag4">매주</label>
				<%--<input type="radio" name="ScheRepetFlag" id="ScheRepetFlag5" value="Date"/><label for="ScheRepetFlag5">매일</label> --%>
				<input type="radio" name="ScheRepetFlag" id="ScheRepetFlag6" value="None" checked/><label for="ScheRepetFlag6">없음</label><br/>
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_L" colspan="2" style="height:50px;">알림발생시기<br/>알림방법</td>
			<td class="input_B Text_L">
				<input type="radio" name="ScheAlarm" id="ScheAlarm1" value="7" onclick="javascript:AlarmChk(this.value);"/><label for="ScheAlarm1">일주일전</label>
				<input type="radio" name="ScheAlarm" id="ScheAlarm2" value="0" onclick="javascript:AlarmChk(this.value);"/><label for="ScheAlarm2">당일</label>
				<input type="radio" name="ScheAlarm" id="ScheAlarm3" value="Write" onclick="javascript:AlarmChk(this.value);"/><label for="ScheAlarm3">직접입력</label>
				<input type="text" class="input_box" name="WriteDay" id="WriteDay" size="3" onkeyup="NumFormat(this.name, this.value);" style="text-align:right;"/>일전
				<input type="radio" name="ScheAlarm" id="ScheAlarm4" value="None" onclick="javascript:AlarmChk(this.value);" checked/><label for="ScheAlarm4">없음</label>
				
				&nbsp;&nbsp;&nbsp;(알람발생시기? D-day까지 일정알림을 시작하는 시기)
				<br/>				
				<input type="radio" name="AlarmHow" id="ScheAlarmHow1" value="Pop" onclick="javascript:AlarmHowChk(this.value);"/><label for="ScheAlarmHow1">팝업만 사용</label>
				<input type="radio" name="AlarmHow" id="ScheAlarmHow2" value="PopSMS" onclick="javascript:AlarmHowChk(this.value);"/><label for="ScheAlarmHow2">팝업, 문자 모두 사용</label>
				<input type="hidden" name="ScheAlarmHow" id="ScheAlarmHow" value="None"/>				
			</td>
		</tr>
		<%--
		<tr id="AlarmHowView" colspan="2" style="display:none;">
			<td class="desc_BR Text_L" style="height:35px;">알림방법</td>
			<td class="input_B Text_L">
				<input type="radio" name="AlarmHow" id="ScheAlarmHow1" value="Pop" onclick="javascript:AlarmHowChk(this.value);"/><label for="ScheAlarmHow1">팝업만 사용</label>
				<input type="radio" name="AlarmHow" id="ScheAlarmHow2" value="PopSMS" onclick="javascript:AlarmHowChk(this.value);"/><label for="ScheAlarmHow2">팝업, 문자 모두 사용</label>
				<input type="hidden" name="ScheAlarmHow" id="ScheAlarmHow" value="None"/>
			</td>
		</tr>
		 --%>
		<tr>
			<td class="desc_BR Text_L" colspan="2" style="height:35px;">중요도</td>
			<td class="input_B Text_L">
				<input type="radio" name="ScheImportant" id="ScheImportant1" value="top"/><label for="ScheImportant1">상</label>
				<input type="radio" name="ScheImportant" id="ScheImportant2" value="middle"/><label for="ScheImportant2">중</label>
				<input type="radio" name="ScheImportant" id="ScheImportant3" value="bottom"/><label for="ScheImportant3">하</label>
			</td>
		</tr>
		<tr id="PublicView" style="display:none;">
			<td class="desc_BR Text_L" colspan="2" style="height:35px;">공개여부</td>
			<td class="input_B Text_L" bgcolor="#EEEEEE">
				<input type="radio" name="SchePublicFlag" id="SchePublicFlag1" value="Y" checked/><label for="SchePublicFlag1">공개</label>
				<input type="radio" name="SchePublicFlag" id="SchePublicFlag2" value="N" /><label for="SchePublicFlag2">비공개</label>
			</td>
		</tr>
		<tr >
			<td class="input_noline Text_C" colspan="3" style="padding-top:20px;padding-bottom:20px;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span id="AddEnd">
					<a href="javascript:ScheduleProcEnd();" class="btn_lightblue">등록</a>
				</span>
				<span id="EditEnd" style="display:none;">
					<a href="javascript:ScheduleProcEnd();" class="btn_lightblue" name="LightBlue">완료</a>
				</span>
				<c:choose>
					<c:when test="${vo.eventType eq 'View' || vo.eventType eq 'Add'}">
						<a href="javascript:parent.LayerClose();" class="btn_lightblue" name="LightBlue">취소</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:ScheView();" class="btn_lightblue" name="LightBlue">취소</a>
					</c:otherwise>
				</c:choose>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				(<input type="checkbox" name="SMSSendFlag" id="SMSSendFlag" value="Y"/><label for="SMSSendFlag">참가자에게 등록알림 SMS발송</label>)
			</td>
		</tr>
	</table>
	<iframe id="moashot" width="0" height="0" frameborder="0"></iframe>
	</form>
	<div id="result"></div>
	</body>
</html>