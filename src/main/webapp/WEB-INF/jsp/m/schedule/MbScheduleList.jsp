<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file ="../includeJSP/header.jsp" %> 
<%@ include file ="../includeJSP/commonPopAll.jsp" %> 

<body>

<form name="scheduleCal" id="scheduleCal" method="post">
	<input type="hidden" name="SelYear" id="selYear"/>
	<input type="hidden" name="SelMonth" id="selMonth"/>
	<input type="hidden" name="ScheSDate" id="selectDate"/>
	
</form>	
	
<div id="wrap">
	<div class="mb_sub_location">
		<button type="button" class="back" onclick='history.back(-1)'><em>이전</em></button>
		<a href="javascript:;" class="depth01">업무일지</a>
		<a href="${pageContext.request.contextPath}/MbScheduleCal.do" class="btn_choist_cal"><em>달력</em></a>
	</div>
	
	<section class="contentsWrap con_pdst01">
		<!--tab-->
		<div class="sub_tabList">
			<ul class="tab_pushst">
		  	 	<li><a id="tabWorkDiary" class="btn_gra_style left workScheTab active" onclick="scheListObj.clickTab('WorkDiary');">업무</a></li>
		  	 	<li><a id="tabSchedule" class="btn_gra_style workScheTab" onclick="scheListObj.clickTab('Schedule');">일정</a></li>
		  	 	<li><a id="tabMemo" class="btn_gra_style right workScheTab" onclick="scheListObj.clickTab('Memo');">메모</a></li>
			</ul>
		</div>
		<!--//tab//-->  
		          
		<!--업무일정-->
		<div class="work_schedule_wrap" style="overflow: hidden;">
		   <div class="schedule_titleZone">
				<h1 class="month_title"><button class="prebtn" onclick="scheListObj.changeMonth(-1);"><span><em>이전일</em></span></button><span id="monthArea">2017년 06월</span><button class="nextbtn" onclick="scheListObj.changeMonth(+1);"><span><em>다음일</em></span></button></h1>
	       </div>
	       <div class ="work_schedule_scroll">
		  		<table class="calander_oneday_st" style="table-layout: fixed;border-bottom: none;">
			   		<colgroup>
						<col width="80" />
						<col width="*" />
					</colgroup>
					<tbody id="dataArea">
					</tbody>
				</table>
			</div>
		</div>
		<!--//업무일정//-->
			             
	</section>
	
	<!--//서브컨텐츠//-->
        
    <!--퀵메뉴-->
	<div id="divTabar">
		<%@ include file ="../includeJSP/quickmenu.jsp" %> 
	</div>
    <!--//퀵메뉴//-->
</div>

<div id="wrapper_menu"></div>
<div id="maskingLayOut"></div>

</body>
</html>

<script>


var g_workOpenType = 'list';	//현재 접근 페이지 달력 or 리스트
var g_tabType = 'WorkDiary'; 	//탭상태값
var g_selectDate =  new Date().yyyy_mm_dd();
var todayDate_scroll = (new Date().yyyy_mm_dd()).split('-');	//오늘
var today_mm;
var g_noFinishChk = false;

var scheListObj =  {
	
		preloadCode : function(){
			
			var todayDateArr = (new Date().yyyy_mm_dd()).split('-');
			
			
			var selYear = '${vo.scheSYear}' == '' ? todayDateArr[0] : '${vo.scheSYear}';
		    var selMonth = '${vo.scheSMonth}' == '' ? todayDateArr[1] : '${vo.scheSMonth}';
		    
		    
		    $("#selYear").val(selYear);
		    $("#selMonth").val(fillzero(selMonth,2));
		    
		    today_mm =fillzero(selMonth,1);
		   
		    $("#monthArea").html(selYear+'년 '+fillzero(selMonth,2)+'월 ');
		    
		    $("#selectDate").val(selYear+'-'+fillzero(selMonth,2)+'-'+todayDateArr[2]);
		    
		    g_selectDate = $("#selectDate").val();
		   
		},
		
		/* ========================클릭 동작 : S ========================= */
		
		//달력 이전 다음 버튼 클릭시
		changeMonth : function(value){
			
			var selectNowDate = new Date($('#selYear').val(),$('#selMonth').val()-1,'01');		//현재선택된 달
			selectNowDate.setMonth(selectNowDate.getMonth() + value);
			
			$('#selYear').val(selectNowDate.getFullYear());
			$('#selMonth').val(fillzero(selectNowDate.getMonth()+1,2));
			
			$("#monthArea").html(selectNowDate.getFullYear()+'년 '+fillzero(selectNowDate.getMonth()+1,2)+'월 ');
	
				
			scheListObj.searchCalendarDate();

			var temp=selectNowDate.getMonth()+1;
			
			if (today_mm == temp){
				if($("#scroll_today").length >0){
					setTimeout(function(){$("#scroll_today").get(0).scrollIntoView(true);},100);
				}
				
			
			}
			
		},
		
		//탭 클릭
		clickTab : function(type){

			startLoadingBar();
			$(".workScheTab").removeClass('active');
			$("#tab"+type).addClass('active');
			
			g_tabType = type;			//현재 탭 상태값
			
			setTimeout(function() {
				scheListObj.searchCalendarDate();
	        }, 100);

			
		},
	
		/* ========================클릭 동작 : E ========================= */
		
		//달력 그리기
		searchCalendarDate : function(){
			
			var url= contextRoot +"/m/schedule/calendarDate.do";
			
			var param = {
					SelYear		: $('#selYear').val(),
					SelMonth	: $('#selMonth').val(),
					
					ScheSYear	: $('#selYear').val(),
					ScheSMonth	: $('#selMonth').val(),
					
					openPage	: g_workOpenType,			//페이지 타입
					tabType		: g_tabType			//탭 타입
					
			};


			
			var callback = function(result){
				endLoadingBar();
				var obj = JSON.parse(result);
				
				var dateInfo = obj.vo;							//날짜 정보
				var endDay = dateInfo.endDay;					//이달의 끝날짜
				var gapBeforeMonth = dateInfo.gapBeforeMonth;	//이달전 날짜 갯수
				var holidayList = obj.holidayList;				//휴일 리스트 
				var dataList = obj.dataList;					//데이터 리스트
				
				
				g_holiList = holidayList;
				
				var weekSeq = 0;
				var str ='';
				
				var todayDate = new Date().yyyy_mm_dd();	//오늘
				var todayDateArr = (new Date().yyyy_mm_dd()).split('-');	//오늘
				
				
				
				for(var i=1; i<endDay+1; i++){
					
					var currentDate = dateInfo.calYear+'-'+fillzero(dateInfo.mm,2)+'-'+fillzero(i,2); //for 현재날짜
					 
					
					
					var weekName = getWeekName(dateInfo.calYear,fillzero(dateInfo.mm,2),fillzero(i,2));
					
					var holiStr = '';
					var holiYn = 'N';
					
					
					//휴일 세팅 
					for(var k=0; k<holidayList.length; k++){
						
						if(i == holidayList[k].calDay){
							
							holiYn = 'Y';
							
							//공휴일 표시
							if(holidayList[k].holiFlag == 'Y' ){
								
								holiStr +='<div class="explain_tooltip mgt5">';
								holiStr +='<div class="spe_datetxt">';
								holiStr +='<span class="common">'+holidayList[k].holiName+'</span>'; 
								holiStr +='</div>';
								holiStr +='</div>';
							}
						}
					}
					
					str +='<tr ';
					
					
					if(todayDate == currentDate) str +='class="today_bg" id="scroll_today"';		//오늘 
					else if(holiYn == 'Y') str +='class="no_workbg"';			//휴일
					
					
					str +=' >';
					
					str +='<th scope="row">';
					str +='<p class="monthdate_id"><strong>'+fillzero(dateInfo.mm,2)+'/'+fillzero(i,2)+'</strong><em>('+weekName+')</em></p>';

					
					str +=holiStr;
					
					if(todayDate == currentDate){
						
						str +='<div class="vm_typho mgt05rem"><input type="checkbox"  class="b_chst" id="showNoFinish"  onclick="scheListObj.checkNoFinish();" /><label for="showNoFinish">미완료</label></div>';
						
						if(g_tabType == 'Memo'){
							str +='<a href="javascript:commonPopAllObj.todayNewMemoView();" class="needck_btn">신규업뎃</a>';
							str +='<a href="javascript:commonPopAllObj.memoSearchView();" class="search_btn">메모검색</a>';
						}
						
					}	
					
					
					str +='</th>';
					
					//데이터 세팅
					str +='<td class="conrelative">';
				
					str +=scheListObj.setDataList(dataList, currentDate);
					
					
					str +='</td>';
					
					str +='</tr>';
						
				}
			
				$("#dataArea").html(str);
				
				$("#showNoFinish").prop('checked',g_noFinishChk);
				if(g_noFinishChk) $(".finishWork").hide();
			//	endLoadingBar();

			};
			
			/* var beforeSubmit = function(){
	    		startLoadingBar();
	    	} */
			
			commonAjax("POST", url, param, callback, false);
			
		},
		
		setDataList : function(dataList, currentDate){
			
			var str='';
			
			if(g_tabType == 'Memo'){
				
				str +='<ul class="memo_list">';
			}else{
				
				str +='<ul class="todo_list">';
			}
			
			for(var i=0;i<dataList.length;i++){
				
				var dataObj = dataList[i];
				
				
				
				
				
				if(dataList[i].calDate == currentDate){
					
					if(g_tabType == 'WorkDiary') str +=scheListObj.setWorkList(dataObj);
					if(g_tabType == 'Schedule')  str +=scheListObj.setScheduleList(dataObj);
					if(g_tabType == 'Memo') 	 str +=scheListObj.setMemoList(dataObj);

				}
				
				
			}
			
			str +='</ul> ';
			return str;
		},
		

		// 일정 리스트 세팅 
		setScheduleList : function(dataObj){
			
			//CalYear(2017), CalMonth(6), CalDay(13), CalDate(날짜 2017-06-13), ScheSeq(아이디), schechkflag(진행상태 YN), schetitle ,viewtime
			var str ='';
		
			
			
					
    		var schechk ='';
    		var finishChk ='';
    		var statusClass = '';
    		
    		
    		
			if (dataObj.schechkflag == 'N') {
				schechk = '계획';
	
			} else {
				schechk = '완료';
				finishChk ='ck_finish'
				statusClass = "done";
			
			}
			
			
			str +='<li '+(statusClass == 'done' ? 'class="finishWork"' : '')+'><span class="fl_block"><input type="checkbox" class="chst" id="sche_'+dataObj.scheseq+'" onclick="scheListObj.endWorkProcess('+dataObj.scheseq+',\'Schedule\',this,\'\');" ';
			
			if(dataObj.regpersabun != '${userLoginInfo.sabun}' || dataObj.schechkflag != 'N' ) str += ' disabled="disabled" ';

			str += (statusClass == 'done' ? 'checked="checked"' : '') +' /><label for="sche_'+dataObj.scheseq+'"><em class="hidden">오늘할일체크</em></label>';
			str +='<span class="ellipsis"><a href="javascript:commonPopAllObj.scheduleViewPop('+dataObj.scheseq+')" class="con_txt '+finishChk+'"><span class="time"> ';
			
			var schetitle = dataObj.schetitle; // 내용  
			

			//시간세팅
			if (dataObj.viewtime == 'A') {
				str += '종일';

			} else {

				var dateArr = (dataObj.viewtime).split(":");
				var time = fillzero(dateArr[0], 2); //시
				var min = fillzero(dateArr[1], 2); //분	

				str += time + ':' + min + " ";

			}
			str += '</span>' + schetitle;
			str += '</a></span>';
			
			str += '</span><span class="fr_block">';
			
			str += '<em class="state_txt '+statusClass+'">'+ schechk + '</em>';
			str += '</span></li>';
			
			return str;
		},
		
		
		// 업무 리스트 세팅 
		setWorkList : function(dataObj){
			
			// sNb, name(작성자), title(제목), note(내용), process(진행상황 00001 계획, 00002진행중, 00003완료, 0004보류), private(안씀), tmDt(날짜)
			var str='';
			
			var schechk = '';
			var finishChk = '';
			var statusClass = '';
			
			if (dataObj.process == '00001') schechk = '계획';
			else if(dataObj.process == '00002'){
				schechk = '진행';
				statusClass = 'ing';
			}else if(dataObj.process == '00003'){
				schechk = '완료';
				finishChk = "ck_finish";
				statusClass = 'done';
				
			}else{
				schechk = '보류';
				statusClass = 'delay';
			}
			
    		str+='<li '+(statusClass == 'done' ? 'class="finishWork"' : '')+'><span class="fl_block"><input type="checkbox"  class="chst" id="work_'+dataObj.sNb+'" onclick="scheListObj.endWorkProcess('+dataObj.sNb+',\'WorkDiary\',this,\'\');"  ';

			str += (statusClass == 'done' ? 'checked="checked"' : '') +'/><label for="work_'+dataObj.sNb+'"><em class="hidden">오늘할일체크</em></label>';
			
			str += '<span class="ellipsis"><a href="javascript:commonPopAllObj.workViewPop('+dataObj.sNb+');" class="con_txt '+finishChk+'">';
			
			var title = dataObj.title; //  제목   


			str += title + " ";
		
			
			str += '</a></span></span>';
			str += '<span class="fr_block"><em class="state_txt '+statusClass+'">'
			str += schechk + '</em>';
			str += '</span></li>';
			
			return str;
			
		},
		
		// 메모 리스트 세팅 
		setMemoList : function(dataObj){
			
			//sNb (아이디값dataObjSnb(부모글번호), sttsCd, private(비밀여부 Y,N), importance(중요도0,1,2,3), name, comment(내용), major(업무여부), rgId, upId
			//frstReadStts(첫글확인여부 00001:미확인, 00002:확인)
			//tmDt, newMainSnb, grpMemCnt(메모참가자 수), sendNm(보낸사람), revNm(받는사람) repCnt(댓글수), repLastDt, readStts(전체확인여부 00001:미확인, 00002:확인), commentsReply, fileCount(파일수), memoKind(REV 발신, SEND 수신, MEMO 메모)
			
			var str='';
			
			//list - sNb, name(작성자), title(제목), note(내용), process(진행상황 00001 계획, 00002진행중, 00003완료, 0004보류), private(안씀), tmDt(날짜)
    		

			var memoKind = '';
			var iconClass ='';
			var sendNm = dataObj.sendNm;
			var fromTo = 'contact_from';
			
			if (dataObj.memoKind == 'SEND') {
			   
				memoKind = '수신';
				
				if(dataObj.readStts == '00002')iconClass = 'state_icon_check';
				else iconClass = 'state_icon_order';
				

			}else if (dataObj.memoKind == 'REV'){
				
				memoKind = '발신';
				
				if(dataObj.readStts == '00002') iconClass = 'state_icon_check';
				else iconClass = 'state_icon_send';
				
				sendNm = dataObj.revNm;
				fromTo = 'contact_to';
				
			}else {
				
				memoKind = '메모';
				sendNm = '나';
				iconClass = 'state_icon_memo';
	
			}
			
		
			
			str += '<li ';
			str +=' onclick="commonPopAllObj.memoViewPop(';
					
			if(dataObj.mainSnb == 0) str += dataObj.sNb;
			else str += dataObj.mainSnb;
					
			str +=','+dataObj.sNb+')" ';
			
			str += '><dl><dt><span class="'+iconClass+'">'+memoKind+'</span>';	//수신 발신
			str += '<span class="'+fromTo+'">'+sendNm+'</span>';				//보내 받는 사람
			str += '<span class="icon_count_em">'+dataObj.grpMemCnt+'</span>';	//인원
			
			//댓글
			if(dataObj.repCnt >0){
				str += '<span class="icon_comment '+(dataObj.sttsCd == '00001' ? 'n_read' : '')+'">'+dataObj.repCnt+'</span>';
			}
			//파일
			if(dataObj.fileCount >0){
				str += '<span class="icon_clip">'+dataObj.fileCount+'</span>';
			}
			
			str += '</dt>';
			
			
			str += '<dd>';
			str += '<a href="javascript:;">';
			
			//중요도
			if (dataObj.importance =='1')         str += '<span class="icon_important_L1"><em>!</em></span>';
			else if (dataObj.importance =='2')    str += '<span class="icon_important_L2"><em>!!</em></span>';
			else if (dataObj.importance =='3')    str += '<span class="icon_important_L3"><em>!!!</em></span>';
			
			//비밀
			if(dataObj.private =='Y') str += '<span class="icon_secret"><em>비밀글</em></span>';
			
			str +='';
			
			//내용
			
			var txtColor = '#4d87f5;';
			if(dataObj.memoType == '00030') txtColor = '#ff4d06;';
			
			str += '<span>';	
			if(dataObj.memoTypeNm != '') str += '<strong style="color: '+txtColor+'">['+dataObj.memoTypeNm+']</strong>';
			
			str +=  dataObj.comment + '</span> ';
			
			str +='</a>';
			str +='</dd>';
			
			//str +='<dd>';
			
			
			
			
			//str += '</dd>';
			str += '</dl>';
			
			
			return str;
		},
		

		//완료처리
		endWorkProcess : function(listId,type,th,process){		//id, type(Schedule,WorkDiary),th 체크박스, process (이외 진행상태)   
		
			var url = '';
			var param = {};
			
			if(type == 'Schedule'){
				
				url = contextRoot + '/m/changeScheduleProcess.do';
				
				param.ScheSeq = listId;
				param.PerSabun = '${userLoginInfo.sabun}';
				
			}else if(type == 'WorkDiary'){
				
				url = contextRoot + '/m/schedule/workDiaryProcess.do';
				
				param.sNb = listId;
				
				if(process == ''){
					
					if($(th).is(':checked')) param.process = '00003';		//완료
					else param.process = '00001';							//계획
				}
				
			}
			
			var callback = function(result) {
				
				var obj = JSON.parse(result);
	    		var cnt = obj.resultVal;		//결과수
	    		
	    		if(cnt == -8){
	    			
	    			alert("로그인 후 이용해주세요.");
					location.href = "${pageContext.request.contextPath}/m/login.do";
					
	    		}else	scheListObj.searchCalendarDate();
				
				
			}
			
			commonAjax("POST", url, param, callback, false);
			
		},
		
		/* ===============팝업 이벤트 ==============*/
		
		//미완료
		checkNoFinish : function(){
			
			g_noFinishChk = $("#showNoFinish").is(':checked');
				
			if($("#showNoFinish").is(':checked')){
				
				$(".finishWork").hide();
			}else{
				$(".finishWork").show();
			}
		}
		
		
		
		
};


$(function(){
	
	scheListObj.preloadCode();
	scheListObj.searchCalendarDate();
	if($("#scroll_today").length >0){
	
		setTimeout(function(){$("#scroll_today").get(0).scrollIntoView(true);},100);
	}

	   var links = [
	              {
	          
	              },
	              {
	            	  "url":"javascript:commonPopAllObj.workProcPop(0);",
	                  "background": "url(${pageContext.request.contextPath}/images_m/work/btn_quick_w_regi01.png) no-repeat; background-size: contain",
	                
	              },
	              {
	              	 "url":"javascript:commonPopAllObj.scheduleProcPop(0);",
	                 "background": "url(${pageContext.request.contextPath}/images_m/work/btn_quick_w_regi02.png) no-repeat; background-size: contain ",
	          
	              },
	              {
	            	
	            	  "url":"javascript:commonPopAllObj.memoViewPop(0,0);",
	                  "background": "url(${pageContext.request.contextPath}/images_m/work/btn_quick_w_regi03.png) no-repeat; background-size: contain ",
	             
	              }
	 ];
	   
     var options = {
         rotate: true
     };
     
     $('#wrapper_menu').jqueryFab(links, options);
  /*    $('html, body').css({'overflow': 'hidden', 'height': '100%'}); */
     
     var  height=$(window).height()-250;
	  
 
	  $('.work_schedule_scroll').css({'height': height}); 
     
     
     //  ios  바탕화면  메뉴이벤트  호출안되서  여기서.... 
     $('.jfab_overlay').live('touchend', function(e){
     	
     	 if(  $("#maskingLayOut div").hasClass('jfab_overlay') ==  true ){

     		 $('.jfab_btns_wrapper').css('display','none');
     		 $('.jfab_main_btn').removeClass('rotate');
     	
     		 setTimeout(function() {
     			 $("#maskingLayOut").empty();
     	       }, 400);
     		 
     	 }   
     });
     
    
   
});

</script>