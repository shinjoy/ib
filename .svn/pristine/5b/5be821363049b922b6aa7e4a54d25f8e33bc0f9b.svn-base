<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="wrap" >
	<div class="mb_sub_location">
		<c:choose>
			<c:when test="${vo.openType eq 'inner' }">
				<button type="button" class="back" id="scheduleViewPopCanBtn" onclick="closeRightBox('scheduleViewInnerPop','scheduleViewInnerArea');"><em>이전</em></button>
			</c:when>
			<c:otherwise>
				<button type="button" class="back" id="scheduleViewPopCanBtn" onclick="closeBottomBox('scheduleViewPop','scheduleViewArea','first');"><em>이전</em></button>
			</c:otherwise>
		</c:choose>
	  	
	  	<a href="javascript:;" class="depth01">업무일정</a><a href="javascript:;" class="depth02">일정상세보기</a>
	</div>
    <section class="contentsWrap con_pdst01 scrollArea schedulewrap">
		<!--서브컨텐츠-->
		<div class="work_schedule_conZone">
				<form name="ScheduleView" id="ScheduleView" method="post">
					<input type="hidden" name="message"			id="message"		value="${message}"/>
					<input type="hidden" name="command"		 	id="command"		value="MbSchedule"/>
					<table class="tb_view_basic02" summary="일정상세내용">
						<caption>일정상세내용</caption>
                           <colgroup>
                               <col width="70" />
                               <col width="*" />
                           </colgroup>
						<!-- <tr>
							<th scope="row">업무분류</th>
							<td class="contxt_line"></td>
						</tr> -->
						<tr>
							<th scope="row">제목</th>
							<td class="valign contxt_title"><span id="scheTypeArea"></span><span id="scheViewTitleArea"></span></td>
						</tr>
						<tr>
							<th scope="row">기간</th>
							<td class="contxt_line" id="scheViewPeriodArea"></td>
						</tr>
						<tr>
							<th scope="row">참가자</th>
							<td class="contxt_line" id="Entry"></td>
						</tr>
						<tr>
							<th scope="row">인물/회사</th>
							<td class="contxt_line" id="scheViewCusComArea"></td>
						</tr>
						<tr scope="row">
							<th scope="row">중요도</th>
							<td class="contxt_line" id="scheViewImportantArea"></td>
						</tr>
						<tr>
							<th scope="row">장소</th>
							<td class="contxt_line" id="scheViewLocationArea"></td>
						</tr>
						<tr>
							<th scope="row">세부내용</th>
							<td class="contxt_area" id="scheViewContentArea"></td>
						</tr>
						<tr>
							<th scope="row">차량</th>
							<td class="valign contxt_line" id="scheViewCarUseArea"></td>
						</tr>
						<tr>
							<th scope="row">회의실</th>
							<td class="valign contxt_line" id="scheViewMeetUseArea"></td>
						</tr>
						
						<tr>
							<th scope="row">알림</th>
							<td class="contxt_line" id="scheViewAlarmHowArea"></td>
						</tr>
						<tr>
							<th scope="row">알림반복</th>
							<td class="contxt_line" id="scheViewRepeatArea"></td>
						</tr>
						<tr>
							<th scope="row">공개여부</th>
							<td class="contxt_line" id="scheViewPublicArea"></td>
						</tr>
						<tr>
							<th scope="row">진행상황</th>
							<td class="contxt_line" id="statusArea"></td>
						</tr>
						<tr>
							<th scope="row">작성일</th>
							<td class="contxt_line" id="regArea"></td>
						</tr>
					</table>
					
					<div class="btn_box_basic">
						<ul class="btn_b_list btn_count3">
							<li><button type="button" class="btn_mobile_white01 regBtn" onclick="scheduleViewObj.doDeleteSchedule();" style="visibility:hidden;" >삭제</button></li>
							<c:choose>
								<c:when test="${vo.openType eq 'inner' }">
									<li><button type="button" class="btn_mobile_gray01" onclick="closeRightBox('scheduleViewInnerPop','scheduleViewInnerArea');" >닫기</button></li>
								</c:when>
								<c:otherwise>
									<li><button type="button" class="btn_mobile_gray01" onclick="closeBottomBox('scheduleViewPop','scheduleViewArea','first');" >닫기</button></li>
								</c:otherwise>
							</c:choose>
							
							<li><button type="button" class="btn_mobile_blue01 regBtn" onclick="scheduleViewObj.scheduleProcInnerPop(${vo.scheSeq},'inner');" style="visibility:hidden;" >수정</button></li>
						</ul>
					</div>
				</form>
		</div>
	</section>
</div> <!-- wrap -->

<div class="rightBox disPlayNone"  id="scheduleProcInnerPop">
	<div class="rightBox-inner">
      <div id="scheduleProcInnerArea"></div>
  	</div>
</div>

<script type="text/javaScript">

var g_scheSeq = '${vo.scheSeq}';
var g_grpCd = '';
var g_schePeriodFlag = '';
var g_scheSDate = '';
var g_grpCd_new = '';		//2017-09-14 신규 일정 그룹코드 추가


var scheduleViewObj = {
		
		preloadCode : function(){
		
			
		},
		
		//내용세팅 
		getSchduleDate : function(){
			
			var url= contextRoot+"/m/schedule/getScheduleData.do";
			
	  		var param ={	
	  				
	  				ScheSeq  	: g_scheSeq
	  		};
	  		
	  		var callback = function(result){
	  			
	  			var obj = JSON.parse(result);
	  			
	  			var resultObj = obj.resultObject;
	  			var scheInfo = resultObj.scheVO; 
	  			
	  			
	  			var meetingRoomInfo = resultObj.meetingRoom; 
	  			var scheduleEntryCnt = resultObj.scheduleEntryCnt; 
	  			var scheduleEntryList = resultObj.scheduleEntryList; 
	  			
	  			//참가자 세팅
	  			var cnt = 0, perNm = "";
	  			if(scheduleEntryCnt>0){
	  				for(var i=0; i<scheduleEntryList.length; i++){
	  					
	  					if(scheduleEntryList[i].delflag == 'N'){
	  						
	  						if(cnt == 0) perNm += scheduleEntryList[i].pernm;
	  						else{
								
	  							if(cnt % 3 == 0) perNm += ", "+scheduleEntryList[i].pernm;
								else perNm += ", "+scheduleEntryList[i].pernm;
							}
	  						
	  						cnt++;
	  					}
	  				}
	  				
	  				$('#Entry').html(perNm);
	  			}
	  			$("#statusArea").html(scheInfo.ScheChkFlag == 'Y' ? '완료' : '미완료');
	  		
	  			//등록자
	  			$("#regArea").html(scheInfo.RegPerNm+' - '+(scheInfo.RegDate).substring(0,16).replace(/-/gi,'/'));
	  		
	  			
	  			//분류
	  			
	  			
	  			var str = '';
	  			var scheType = scheInfo.ScheType;
	  			
	  			
	  			if(scheType == 'IR') str='IR';
	  			if(scheType == 'Visit') str='탐방';
	  			if(scheType == 'Meet') str='미팅';
	  			if(scheType == 'Holiday') str='휴가';
	  			if(scheType == 'Invest') str='투자';
	  			if(scheType == 'Other') str='기타';
	  			if(scheType == 'Mt_lunch') str='점심미팅';
	  			if(scheType == 'Mt_dinner') str='저녁미팅';
	  			if(scheType == 'Inspect') str='실사';
	  			if(scheType == 'Mediate') str='중개';
	  			if(scheType == 'Manage') str='관리';
	  			if(scheType == 'BusiTrip') str='출장';
	  			if(scheType == 'Notice') str='알림(공지)';
	  			if(scheType == 'Schedule') str='일정';
	  			if(scheType == 'Mt_inside') str='회의';
	  			if(scheType == 'Private') str='개인메모';
	  			
	  			
	  			if(scheType == 'mna'){
	  				if(scheInfo.MnaType == 'mna_m') 	str='미팅';
	  				if(scheInfo.MnaType == 'mna_d') 	str='실사';
	  				if(scheInfo.MnaType == 'mna_a')		str='중개';
	  				if(scheInfo.MnaType == 'mna_g')		str='관리';
	  			}
	  			
	  			
	  			var test ='<span class="icon_workmna">'+ str + '</span>'
	  			$("#scheTypeArea").html(test);
	  			
	  			//제목
	  			var titleDetailArr = (scheInfo.ScheTitle).split(']');
	  			
	  			if(titleDetailArr.length >1) $("#scheViewTitleArea").html(titleDetailArr[(titleDetailArr.length-1)]);
	  			else  $("#scheViewTitleArea").html(scheInfo.ScheTitle);
	  	
	  			//기간
	  			str ='';
	  			if(scheInfo.ScheAllTime == 'Y') str = scheInfo.ScheSDate+' ~ '+ scheInfo.ScheEDate;
	  			else{
	  				str += '<span class="date">'+(scheInfo.ScheSDate).replace(/-/gi,'/')+' <span class="time">('+scheInfo.ScheSTimeAMPMNm+' '+scheInfo.ScheSTime+')</span>'+' ~ </span> ';
	  				str += '<span class="date">'+(scheInfo.ScheEDate).replace(/-/gi,'/')+' <span class="time">('+scheInfo.ScheETimeAMPMNm+' '+scheInfo.ScheETime+')</span>'+'</span>';
	  			
	  			}
	  			
	  			//if(scheInfo.ScheChkFlag == 'Y') str += '<div style="text-align: right;font-size: 0.8rem;">'+ (scheInfo.ScheChkDate).replace(/-/gi,'/')+'[완료]</div>';
	  			
	  			$("#scheViewPeriodArea").html(str);
	  			
	  			var comTxt = '';
	  			var cusTxt = '';
	  			
	  			
	  			
	  			//인물 회사
	  			if(scheInfo.companyNm != '' && scheInfo.companyNm != null) comTxt+= scheInfo.companyNm;
	  			if(scheInfo.customer != '' && scheInfo.customer != null){
	  				
	  				if('${userLoginInfo.staffSnb}' == scheInfo.managerId || '${userLoginInfo.permission}' > '00019' || '${userLoginInfo.permission}' == '00014' ){
	  					cusTxt+= '<span class="meetto">'+ scheInfo.customer + '</span><span class="icon_phone" onclick="callPhone(\''+scheInfo.CusTel+'\');"><em>전화번호</em></span>';
	  				}else{
	  					cusTxt+= '<span class="meetto">' + scheInfo.customer + '</span>';
	  				}
	  				
	  			}
	  			
	  			
	  			$("#scheViewCusComArea").html(cusTxt + (comTxt != '' ? ' / ' :'')+comTxt);
	  			
	  			//장소
	  			$("#scheViewLocationArea").html(scheInfo.ScheArea);
	  			$("#scheViewContentArea").html(scheInfo.ScheCon);
	  			
	  			//차량
	  			str ='';
	  			if(scheInfo.CarUseFlag == 'Y'){
	  				str +='<span class="icon_carNum">'+scheInfo.CarNum+'</span> <span class="usetime">('+scheInfo.ScheSTimeAMPMNm+ scheInfo.ScheSTime+' ~ '+scheInfo.ScheETimeAMPMNm+scheInfo.ScheETime+')</span>';
	  				//str +='	<br/>[차량위치 : '+scheInfo.CarFloor+', 최근사용자 :'+scheInfo.CarUsePerNm+']';
	  			}else str='사용안함';
	  			
	  			$("#scheViewCarUseArea").html(str);
	  			
	  			//회의실
	  			str ='<span class="icon_carNum">';
	  			if(meetingRoomInfo.length >0){
	  				for(var i=0; i<meetingRoomInfo.length; i++){
	  					str += meetingRoomInfo[i].meetingRoomNmS;
	  					str += '</span> <span class="usetime">('+meetingRoomInfo[i].showStartTime+'~'+meetingRoomInfo[i].showEndTime+')</span>';
	  				}
	  			}else str ='사용안함';
	  				
	  			$("#scheViewMeetUseArea").html(str);
	  			
	  			$("#scheViewRepeatArea").html(scheInfo.ScheRepetFlagNm);
	  			
	  			$("#scheViewAlarmHowArea").html(scheInfo.ScheAlarmFlagNm+' / '+scheInfo.ScheAlarmHowNm);
	  			
	  			//중요도
	  			str ='';
	  			
	  			if(scheInfo.ScheImportant == 'top') str='상';
	  			if(scheInfo.ScheImportant == 'middle') str='중';
	  			if(scheInfo.ScheImportant == 'bottom') str='하';
	  			$("#scheViewImportantArea").html(str);
	  			
	  			$("#scheViewPublicArea").html(scheInfo.SchePublicFlag == 'Y' ? '공개' : '비공개');
	  			
	  			if(scheInfo.ScheChkFlag == 'N' && '${userLoginInfo.sabun}' == scheInfo.RegPerSabun) $(".regBtn").css('visibility',' visible');
	  			
	  			g_grpCd = scheInfo.ScheGrpCd;
	  			g_schePeriodFlag = scheInfo.SchePeriodFlag;
	  			g_scheSDate = scheInfo.ScheSDate;
	  			g_grpCd_new = scheInfo.grpCd;				//2017-09-14 신규 일정 그룹코드 추가
	  		};
	  		
	  		commonAjax("POST", url, param, callback, true); 
		},

		scheduleProcInnerPop : function(scheSeq,openType){
			
			
			if(g_grpCd != '' && g_grpCd != 'Period'){
				swal('반복일정의 수정은 모바일에서 지원하지 않습니다.');
				return false;
			}
			
			var url= "/m/schedule/scheduleProcPop_openLayer.do";
			
	  		var params ={	
	  				
	  				ScheSeq  	: scheSeq,
	  				openType	: openType
	  		};
	  		
	  		commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  		
	  			$("#scheduleProcInnerArea").html(result);  
				
	  			//$('#scheduleProcInnerPop').parent().css('height','100%');
				$('#scheduleProcInnerPop').animate({'right':'0'},300);
				$('#scheduleProcInnerPop').removeClass('disPlayNone');
	  			nowUrl = url;
	  			
	  			window.history.pushState({'url' : url}, 'Title', "#"+url);
			
	      	}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback); 
			
		},	
		
		doDeleteSchedule : function(){
		
			if(g_grpCd == '' || g_grpCd == 'Period') {
				
				swal({
					  title: "",
					  text: "일정을 삭제 하시겠습니까?",
					  
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  
					  cancelButtonText: '취소',
					  confirmButtonText: '삭제'
				  },
				  function(isConfirm){
					
					if(isConfirm) {
						var url = contextRoot+'/m/schedule/scheduleDelete.do';
						var param = {
								 ScheSeq			: g_scheSeq,
								 ScheSDate			: g_scheSDate,
								 ScheGrpCd			: g_grpCd,
								 PerSabun			: '${userLoginInfo.sabun}',
								 SchePeriodFlag		: g_schePeriodFlag,
								 grpCd				: g_grpCd_new			//2017-09-14 신규 일정 그룹코드 추가
						}
						
						var callback = function(result){
							
							var obj = JSON.parse(result);
				    		var cnt = obj.resultVal;		//결과수
				    		
				    		if(cnt == -8){
				    			
				    			alert("로그인 후 이용해주세요.");
								location.href = "${pageContext.request.contextPath}/m/login.do";
				    		}else{
				    			
				    		
				    			$("#scheduleViewPopCanBtn").trigger('click');
								toast.push("삭제되었습니다.");
				    		}
							
							
						};
						commonAjax("POST", url, param, callback, false, null, null);
				
					}
				});
				
				
			}else {	// 반복일정 수정 및 삭제
				swal('반복일정의 삭제는 모바일에서 지원하지 않습니다.');
				return false;
			}	
				
				
		}
};

$(function(){
	
	scheduleViewObj.getSchduleDate();

	/* $('html, body').css({'overflow': 'hidden', 'height': '100%'}); */
	
});
	
</script>