<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file ="../includeJSP/header.jsp" %> 

<body>

<form name="scheduleCal" id="scheduleCal" method="post">
	<input type="hidden" name="SelYear" id="selYear"/>
	<input type="hidden" name="SelMonth" id="selMonth"/>
	<input type="hidden" name="ScheSDate" id="selectDate"/>
	
</form>	
	
<div id="wrap">
	<div class="mb_sub_c_location">
		<button type="button" class="back" onclick='location.href="${pageContext.request.contextPath}/m/main.do"'><em>이전</em></button>
		<a href="javascript:history.go(0);" class="txt_month" id="calDateArea"><span id="yearArea"></span>년 <span id="monthArea"></span>월</a>
		<%-- <a href="${pageContext.request.contextPath}/MbScheduleList.do"  class="btn_choist_list">달력</a> --%>
		<a href="${pageContext.request.contextPath}/MbScheduleList.do" class="btn_choist_list"><em>달력</em></a>
	</div>
	<section class="contentsWrap" id="contentsWrap_scroll">
	 	<!--달력-->
	 	<div class="calander_mwrap">
	 		<table class="work_calendar" summary="업무일정달력(요일별, 업무, 일정 카운트)">   
                  <caption>업무일정달력</caption>
                  <colgroup>
                      <col colspan="7" width="*">
                  </colgroup>
                  <thead>
                      <tr>
                      	<th scope="col">SUN</th>
                          <th scope="col">MON</th>
                          <th scope="col">TUE</th>
                          <th scope="col">WED</th>
                          <th scope="col">THU</th>
                          <th scope="col">FRI</th>
                          <th scope="col" >SAT</th>
                      </tr>
                  </thead>
                  <tbody id="calendarArea" ></tbody>
	         </table>
	 	</div>
	 	<!--//달력//-->
	 	<!--업무일정-->
	 	<div class="con_pdst01">
			<!--tab-->
	 		<div class="sub_tabList">
			  	<ul class="tab_pushst mn4">
			  		<li><a id="tabAll" class="btn_gra_style left workScheTab active" onclick="scheCalObj.clickTab('All');">전체</a></li>
			  	 	<li><a id="tabWorkDiary" class="btn_gra_style workScheTab" onclick="scheCalObj.clickTab('WorkDiary');">업무</a></li>
			  	 	<li><a id="tabSchedule" class="btn_gra_style workScheTab" onclick="scheCalObj.clickTab('Schedule');">일정</a></li>
			  	 	<li><a id="tabMemo" class="btn_gra_style right workScheTab" onclick="scheCalObj.clickTab('Memo');">메모</a></li>
			  	</ul>
			</div>
			<!--//tab//-->
			<div class="work_schedule_wrap" >	 
				<!--해당날짜-->
				<div class="schedule_titleZone2">
					<h2 class="today_title">
						<strong id="dateArea"></strong>
						<em id="dateNameArea"></em>
						<span class="dayinfo_st" id="holidayNameArea"></span>
					<!-- <button type="button"  class ="downSche" ><span><em>달력 내림 </em></span></button> -->
					</h2>
					<label class="rightck"><input type="checkbox" id="showNoFinish" onclick="scheCalObj.checkNoFinish(this);"><span>미완료</span></label>
				</div>
				<!--//해당날짜//-->
				<div class="sche_todayconwrap topArea listArea"  >
				 	<ul class="todo_list listArea" id="listAreaWorkDiary"></ul>
				 	<ul class="todo_list listArea" id="listAreaSchedule"></ul>
				</div>	
			 	<h3 class="memo_titleZone memoWith listArea">업무메모 <a href="javascript:commonPopAllObj.todayNewMemoView();" class="needck_btn">신규업뎃</a><a href="javascript:commonPopAllObj.memoSearchView();" class="search_btn">메모검색</a></h3>
				<div class="sche_todayconwrap memoWith listArea">	
					<ul class="memo_list memoWith listArea" id="listAreaMemo"></ul>
				</div>
			</div>
		</div>
	 	<!--//업무일정//-->

	 	<div id="wrapper"></div>
  		<div id="maskingLayOut"></div>
	</section>
	
	<div id="divTabar">
		<%@ include file ="../includeJSP/quickmenu.jsp" %> 
	</div>
</div>	

<%@ include file ="../includeJSP/commonPopAll.jsp" %> 
</body>

</html>

<script>


    var currentX;   
    var lastX = 0;
    var lastY = 0;
    var lastT;
    var currentY;
    
    var todayDateArr = (new Date().yyyy_mm_dd()).split('-');
    
    var selYear = '${vo.scheSYear}' == '' ? todayDateArr[0] : '${vo.scheSYear}';
    var currnt_MM = '${vo.scheSMonth}' == '' ? todayDateArr[1] : '${vo.scheSMonth}';

    var currntYM= selYear+currnt_MM;
    var selYM ;
    var caltop ="N";
    var swipeLF ="N";
    var  startX;
    var  startX_lastX = 0;

    var  startY;
    var  startY_lastY = 0;
	//var table_cunt_index =0 ;
	var row_taget=0;
	
    // 캘린더  좌우    touchmove
   
    //  클릭 했을시   touchstart ->  touchend
    
    $('#calendarArea').bind(' touchstart',function(event){ 

        var e = event.originalEvent; 

        clearTimeout(lastT);
        startX = e.targetTouches[0].pageX; 
        startY = e.targetTouches[0].pageY;
        
        if(startX_lastX == 0 ) {
        	startX_lastX = startX;
        }else if(startY_lastY == 0){
        	startY_lastY = startY;
        }
        //clientX = e.targetTouches[0].clientX; 
        
        startX_lastX = startX;
        startY_lastY = startY;

        // Check if moving is done
        lastT = setTimeout(function() {
        	startX_lastX = 0;
        	startY_lastY=  0;
        }, 100);
        
        //event.stopPropagation();
    });
    
    
    //  클릭 했을시   touchstart ->  touchend
    $('#calendarArea').bind('touchend',function(event){ 

        //  달력  올렸을때   
        if( caltop == "Y"  && swipeLF=="Y" && startX < currentX   &&  currentY < 250){

        	
       	    $('.work_calendar tbody tr').eq(row_taget).hide(); 
   	        $('.work_calendar tbody tr').eq(row_taget-1).show(); 
   	        
   	        
   	        if(0 == row_taget){ 
	   	    	
	   	    	 scheCalObj.changeMonth(-1);
	   	    	
	   	    	row_taget = $('#calendarArea tr').length-1;
	   	   
	   	    	 $('.work_calendar tbody tr').hide(); 
		   	     $('.work_calendar tbody tr').eq(row_taget).show(); 
		   	     $('.work_calendar tbody tr').css('height','2.813rem');  
		   	     $('.work_calendar .currentday .todo_all').css('top','2rem');
		   	  	 $('.work_calendar .todo_all').css('top','2rem');
	   	      } else --row_taget;
           
        }else if(caltop == "Y" && swipeLF=="Y" &&startX > currentX  &&   currentY < 250) {
        	 
       		var rowCount = $('#calendarArea tr').length-1;
  
       	     $('.work_calendar tbody tr').eq(row_taget).hide(); 
	   	     $('.work_calendar tbody tr').eq(row_taget+1).show(); 
	   	     
	   	     if(rowCount == row_taget){ 
	   	    	row_taget=0;
	   	    	 scheCalObj.changeMonth(+1);
	   	    	 $('.work_calendar tbody tr').hide(); 
		   	     $('.work_calendar tbody tr').eq(row_taget).show(); 
		   	     $('.work_calendar tbody tr').css('height','2.813rem');
		   	     $('.work_calendar .currentday .todo_all').css('top','2rem');
		   	     $('.work_calendar .todo_all').css('top','2rem');
	   	      } else ++row_taget;
	   	
	   	     
        }else if(caltop == "Y" && swipeLF=="Y"&&  currentY > 350 ){      //  달력  내리기   
       	   	  caltop = "N"
       
       	   	  $('.work_calendar tbody tr').css('height','');
       	   	  $('.work_calendar tbody tr:nth-child(1)').css({'height':'2.813rem' , 'border-collapse':''});
	   	      $('.work_calendar .currentday .todo_all').css('top','');
	   	  	  $('.work_calendar .todo_all').css('top','');
       	      $('.work_calendar tbody tr').show();
       	  
       
        }
  
        
        swipeLF ="N"  ;
         
    });  
    

    //  터치  이동시    touchstart -> touchmove  ->touchend
    $('#calendarArea').bind('touchmove',function(event){ 
    

    	//event.preventDefault();
        var e = event.originalEvent; 

        clearTimeout(lastT);
        currentX = e.targetTouches[0].pageX; 
        currentY = e.targetTouches[0].pageY;
  
       // $('.work_schedule_wrap ').removeClass('scrollArea schedulecal2');
        
         if(lastX == 0) {
            lastX = currentX;
        }
         var gab_Y=Math.abs(startY-currentY);

		//  달력  내렸을때  
        if(currentX < lastX  &&  caltop == "N" &&  gab_Y < 15) {
    
             scheCalObj.changeMonth(+1);    //left
            
            
             if(currntYM == selYM) $('.currentday').closest('tr').removeClass('up_hidden').addClass('unhidden');
      
        } else if(currentX > lastX &&  caltop == "N"  &&  gab_Y < 15){
        	
      
        	scheCalObj.changeMonth(-1);    // Right
        	
        	if(currntYM == selYM) $('.currentday').closest('tr').removeClass('up_hidden').addClass('unhidden');
       
        }else if (caltop == "Y"){
        	if(currntYM == selYM) $('.currentday').closest('tr').removeClass('up_hidden').addClass('unhidden');
        	swipeLF = "Y";
        }
    
       
         $('.work_schedule_wrap').css('overflow','hidden');  

        lastX = currentX;   

        // Check if moving is done
        lastT = setTimeout(function() {
            lastX = 0;
         
        }, 100);
        
        
    });
   

    
    // 캘린더  숨김   전체 업무등  상하조
    $('.work_schedule_wrap').bind('touchmove',function(event){ 

    	//event.preventDefault(); 
    	
    	
        var e = event.originalEvent; 

        clearTimeout(lastT);
        currentY = e.targetTouches[0].pageY; 
        
         if(lastY == 0) {
        	 lastY = currentY;
        }

        if(currentY < lastY) {  //상  

        	
        	caltop = "Y";   // 달력 접힐때   구분값  
        	var  height=$(window).height()-250;
        	  
        	
	   	    $('.work_schedule_wrap').css({'overflow':'scroll' ,'height': height ,'-webkit-overflow-scrolling':'touch'}); 
	   	    $('.work_calendar tbody tr').css('height','2.813rem');
	   	    $('.work_calendar .currentday .todo_all').css('top','2rem');
	   	    $('.work_calendar .todo_all').css('top','2rem');
	   	   if( $('.work_calendar tbody tr').hasClass("unhidden") == false){
	   		        
	   				$('#selectDiv1 ').closest('tr').removeClass().addClass('unhidden'); 
	   	   }
		   	
	   	   $('.work_calendar tbody tr.up_hidden').hide();
	  
	       row_taget=$('.unhidden').closest('tr').index(); 
	   	   //table_cunt_index =  $('.work_calendar tbody tr.currentday_line').index();
	       // $('.calander_mwrap').css({"border-bottom": "#b9c1ce solid 1px"});
        }
        

         
        lastY = currentY;
        lastT = setTimeout(function() {
        	lastY = 0;
        }, 100);
    });

var g_workOpenType = 'cal';		//현재 접근 페이지 달력 or 리스트  
var g_tabType = 'All'; 	//탭상태값
var g_selectDate = new Date().yyyy_mm_dd();




var scheCalObj =  {
	
		preloadCode : function(){
			
			var todayDateArr = (new Date().yyyy_mm_dd()).split('-');
			
			
			var selYear = '${vo.scheSYear}' == '' ? todayDateArr[0] : '${vo.scheSYear}';
		    var selMonth = '${vo.scheSMonth}' == '' ? todayDateArr[1] : '${vo.scheSMonth}';
		    
		    
		    $("#selYear").val(selYear);
		    $("#selMonth").val(fillzero(selMonth,2));
		    
		    $("#yearArea").html(selYear);
		    $("#monthArea").html(fillzero(selMonth,2));
		    
		    $("#selectDate").val(selYear+'-'+fillzero(selMonth,2)+'-'+todayDateArr[2]);
		    
		    g_selectDate = $("#selectDate").val();
		    
		},
		
		//달력 이전 다음 버튼 클릭시
		changeMonth : function(value){
			
			var selectNowDate = new Date($('#selYear').val(),$('#selMonth').val()-1,'01');		//현재선택된 달
			selectNowDate.setMonth(selectNowDate.getMonth() + value);
			
			$('#selYear').val(selectNowDate.getFullYear());
			$('#selMonth').val(fillzero(selectNowDate.getMonth()+1,2));
			
			$("#yearArea").html(selectNowDate.getFullYear());
			$("#monthArea").html(fillzero(selectNowDate.getMonth()+1,2));
			
			selYM=selectNowDate.getFullYear()+fillzero(selectNowDate.getMonth()+1,2);
			scheCalObj.searchCalendarDate();
	
			
		},
		
		//달력 그리기
		 searchCalendarDate : function(){
			
			var url= contextRoot +"/m/schedule/calendarDate.do";
			
			var param = {
					SelYear		: $('#selYear').val(),
					SelMonth	: $('#selMonth').val(),
					
					ScheSYear	: $('#selYear').val(),
					ScheSMonth	: $('#selMonth').val(),
					
					openPage	: g_workOpenType			//페이지 타입
			};


			var callback = function(result){

				var obj = JSON.parse(result);
				
				
				var cnt = obj.cnt;								//세션체크
				
				var dateInfo = obj.vo;							//날짜 정보
				var endDay = dateInfo.endDay;					//이달의 끝날짜
				var gapBeforeMonth = dateInfo.gapBeforeMonth;	//이달전 날짜 갯수
				var holidayList = obj.holidayList;				//휴일 리스트 
				var workCountList = obj.dataList;				//일정 갯수 
				
				if(cnt == -8){
					
					alert("로그인 후 이용해주세요.");
					location.href = "${pageContext.request.contextPath}/m/login.do";
				}else{
				
					g_holiList = holidayList;
					
					var weekSeq = 0;
					var str ='<tr class="up_hidden" style="height:2.83rem;">';
					var todayDateArr = (new Date().yyyy_mm_dd()).split('-');	//오늘
					
					//선택달의 시작날짜 
				 	var selectStartDate = new Date(dateInfo.calYear,fillzero(dateInfo.mm,2)-1,'01');
					selectStartDate.setDate(selectStartDate.getDate() - gapBeforeMonth);		//전달 포함 
					
					for(var i=1; i<gapBeforeMonth; i++){
						
						selectStartDate.setDate(selectStartDate.getDate() + 1);
						
						var beforeStartDayArr = selectStartDate.yyyy_mm_dd().split('-');
						weekSeq = weekSeq +1;
						
						str +='<td class="outfocus"><span class="date">'+beforeStartDayArr[2]+'</span></td>';//
					} 
					
					for(var i=1; i<endDay+1; i++){
						
						var dateColorClass ='dateweek';		//해당일의 날짜 색상
						var todayColorClass ='';			//오늘 날짜 표시 
						
						var currentDate = dateInfo.calYear+'-'+fillzero(dateInfo.mm,2)+'-'+fillzero(i,2); //for 현재날짜
						
					
						
						
						//휴일 세팅 
						for(var k=0; k<holidayList.length; k++){
							
							if(i == holidayList[k].calDay){
								
								var weekName = getWeekName(dateInfo.calYear,fillzero(dateInfo.mm,2),fillzero(i,2));
								
								if(holidayList[k].holiFlag == 'W'){		//토 일
									
									if(weekName == '토') dateColorClass ='datesater';
									else dateColorClass ='datesun';
									
								}else dateColorClass ='datesun';		//법정공휴일 
								
							}
						}
						
						//오늘 
						if(new Date().yyyy_mm_dd() == currentDate) todayColorClass ='class="currentday"';
						
						//그리기
						str +='<td '+todayColorClass+'  id="selectDiv'+i+'"  onclick="scheCalObj.clickDate('+i+', this);">';
						//날짜
						str +='<span id="'+i+'" class="date '+dateColorClass+'">';
						str += i +'</span>';
						
						var cnt=0;
						//일정 혹은 메모 등의 갯수
						for(var k=0; k<workCountList.length; k++){
							
							var countObj = workCountList[k]; 
							
							if(countObj.viewDate == currentDate ){
								cnt++;
								
								/* if(countObj.type == 'WORK') 	 str+='<p class="todo_work">업무<em>('+countObj.count+')</em></p>';
								if(countObj.type == 'SCHEDULE')  str+='<p class="todo_meet">일정<em>('+countObj.count+')</em></p>';
								if(countObj.type == 'MEMO') 	 str+='<p class="todo_memo">메모<em>('+countObj.count+')</em></p>'; */
	
							}	
						}
						
						if(cnt>0) str+='<span class="todo_all"></span>';
						
						str +='</td>';
						
						weekSeq = (weekSeq + 1) % 7;		
						
						if((i == endDay) && weekSeq !=0){	//해당 월의 마지막 일일때 빈 칸 세팅
							
							for(var k=0; k<7-weekSeq; k++) str +='<td class="outfocus"><span class="date">'+(k+1)+'</span></td>';//''
						} 
						
						if(((gapBeforeMonth-1 + i) %7 == 0 ) && (i != endDay)){	//줄바꿈(주) 
							str +='</tr><tr class="up_hidden">';
							
						}
						
					}
					
					str +='</tr>';
					
					
				
					$("#calendarArea").html(str);
				}
			
			};
			

			commonAjax("POST", url, param, callback, false);
		
		}, 
		

		//탭 클릭
		clickTab : function(type){
			$(".workScheTab").removeClass('active');
			$("#tab"+type).addClass('active');
			
			g_tabType = type;			//현재 탭 상태값
			//scheCalObj.setDateTilte();
			
			$(".listArea").hide();
			$("#listAreaWorkDiary").removeClass('hide');
			
			if(type == 'Memo'){
				
				$(".memoWith").show();
				$(".topArea").hide();
			}else if(type == 'Schedule'){
				
				$(".topArea").show();
				$("#listAreaSchedule").show();
				$("#listAreaWorkDiary").addClass('hide');
				
			}else if(type == 'WorkDiary'){
				
				$(".topArea").show();
				$("#listAreaWorkDiary").show();
			}else{
				
				$(".listArea").show();
			}
			
			
			
		},  
		
		//날짜 클릭 
		clickDate : function(i){

		    $('.work_calendar .dateweek ').css({"color": "#3b4354","background":"#fff"});
		    $('.work_calendar .todo_all ').css("background","#b6bfcd");
		   
			$('.work_calendar .outfocus .date').css("color", "#cdcdcd");  
			$('.work_calendar .datesun').css({"color": "#ff3232","background":"#fff"}); 
			$('.work_calendar .datesater').css({"color": "#3b4354","background":"#fff"}); 

			$('.work_calendar tbody tr').removeClass('unhidden').addClass('up_hidden'); 
			
			$("#"+i).closest('tr').removeClass().addClass('unhidden');  
			$("#"+i).css({"background": "#5195f3" ,"border-radius":"100%" , "color": "#fff"});
			$("#"+i).closest('td').find('span:eq(1)').css("background","#fff");
			
			
		     if($("#"+i).closest('td').hasClass("currentday") == false){
	
				 $('.currentday').removeClass().addClass('uncurrentday');
				// $('.work_calendar .todo_all ').css({"background":"#b6bfcd"});
			}
		     
		     if ($("#"+i).closest('td').hasClass('uncurrentday') == true){
				
		    	
				$('.uncurrentday').removeClass().addClass('currentday');
			}
		     
	
			
			row_taget=$('.unhidden').closest('tr').index();
			
			$("#selectDate").val($('#selYear').val()+'-'+$('#selMonth').val()+'-'+fillzero(i,2));
			g_selectDate = $("#selectDate").val();
			scheCalObj.setDateTilte();
	
			
		},
		
		//클릭시 내용 세팅
		setDateTilte: function(){
			
			$("#holidayNameArea").html('');
		
			var selectDate =$("#selectDate").val();
			
			scheCalObj.setSelectList();
			
		},
		
		//하단 리스트 세팅
		setSelectList : function(){
			
			 startLoadingBar();
			
			var url=contextRoot+"/m/schedule/getAllScheduleList.do";

			var queryString = $("form[name=scheduleCal]").serialize() ;
			 
		       $.ajax({
		           type : 'post',
		           url : url,
		           data : queryString,
		         
		           error: function(xhr, status, error){
		              
		           },
		           success : function(result){
		        	    
		        	    var obj = JSON.parse(result);
			    		var resultObj = obj.resultObject;		//결과데이터JSON
			    	
			    		$("#listAreaSchedule").html(scheCalObj.setScheduleList(resultObj.scheduleList));
			    		$("#listAreaWorkDiary").html(scheCalObj.setWorkList(resultObj.workDiaryList));
			    		$("#listAreaMemo").html(scheCalObj.setMemoList(resultObj.memoList));

			    		scheCalObj.checkNoFinish();
			    		var selectDate= $("#selectDate").val();
			    		
			    		var dateObj = getRowObjectWithValue(g_holiList, 'calDate', selectDate);
						
						//휴일표시
						if(dateObj != null){
							
							if(dateObj.holiName !=null) $("#holidayNameArea").html(dateObj.holiName);
							
						}
						
			    		$("#dateArea").html(selectDate.replace(/-/gi,'/'));
						
						var selectDateArr = selectDate.split('-');
						
						$("#dateNameArea").html('('+getWeekName(selectDateArr[0],selectDateArr[1],selectDateArr[2])+')');
						endLoadingBar();
		           }
		       });
			
		},
		
		
		
		//하단 일정 리스트 세팅 
		setScheduleList : function(list){
			
			
    		var str='';
    	
    		if (list.length == 0) {
					str += '<li class="nocon_txt">등록된 일정이 없습니다.</li>';

			}else{
					for (var i = 0; i < list.length; i++) {

						var schechk ='';
						var finishChk = '';
						str += '<li '+(list[i].schechkflag != 'N' ? 'class="finishWork"' : '')+' ><span class="fl_block"><input type="checkbox"  class="chst"  id="sche_'+list[i].scheseq+'" ';
						
						if(list[i].regpersabun != '${userLoginInfo.sabun}' || list[i].schechkflag != 'N' ) str += ' disabled="disabled"';
						
						if (list[i].schechkflag == 'N') {
							schechk = '계획';
							str += 'onclick="scheCalObj.endWorkProcess('+list[i].scheseq+',\'Schedule\',this,\'\');" ';
						
						} else {
							schechk = '완료';
							finishChk = 'ck_finish';
							str += ' checked="checked" ';
							
						}
						
						str += '/><label for="sche_'+list[i].scheseq+'"><em class="hidden">오늘할일체크</em></label>';
						str += '<span class="ellipsis"><a href="javascript:commonPopAllObj.scheduleViewPop('+list[i].scheseq+')" class="con_txt '+finishChk+'">';
						str += '<span class="time">';

						var schetitle = list[i].schetitle; // 내용  
						

						//시간세팅
						if (list[i].viewtime == 'A') {
							str += '종일';

						} else {

							var dateArr = (list[i].viewtime)
									.split(":");
							var time = fillzero(dateArr[0], 2); //시
							var min = fillzero(dateArr[1], 2); //분	

							str += time + ':' + min + " ";

						}
						str += '</span>' + schetitle;
						
						str += '</a></span>';
						
						str += '<span class="fr_block"><em class="state_txt">'
								+ schechk + '</em>';
						str += '</span></li>';
					
					}
				}

				return str;
         	
		      
		},
		
		
		//하단 업무 리스트 세팅 
		setWorkList : function(list){
		
			
    		var str='';
    		
    		//list - sNb, name(작성자), title(제목), note(내용), process(진행상황 00001 계획, 00002진행중, 00003완료, 0004보류), private(안씀), tmDt(날짜)
    		
		    if (list.length == 0) {
		    	str += '<li class="nocon_txt">등록된 업무가 없습니다.</li>';
			} else {
				//finishWork
				for (var i = 0; i < list.length; i++) {

					var schechk = '';
					var scheClass = '';
					var finishChk = '';
					
					if (list[i].process == '00001') {
						
						schechk = '계획';
						//str += ' style="margin-left:-1.313rem;" ';
					
					}else if(list[i].process == '00002'){
						
						schechk = '진행';
						scheClass = 'ing';
					}else if(list[i].process == '00003'){
						
						schechk = '완료';
						
						finishChk = 'ck_finish';  
						scheClass = 'done';
					}else{
						
						schechk = '보류';
						scheClass = 'delay';
					}
					
					
					str +='<li '+(finishChk != '' ? 'class="finishWork"' : '')+'><span class="fl_block"> <input type="checkbox" id="work_'+list[i].sNb+'"  class="chst"  onclick="scheCalObj.endWorkProcess('+list[i].sNb+',\'WorkDiary\',this,\'\');" ';
					
					//완료일때 체크
					if(finishChk != '') str += ' checked="checked" ';
					
					str +='/><label for="work_'+list[i].sNb+'"><em class="hidden">오늘할일체크</em></label> ';
					
					str +='<span class="ellipsis"><a href="javascript:commonPopAllObj.workViewPop('+list[i].sNb+');" class="con_txt '+finishChk+'"> ';

					var title = list[i].title; //  제목   


					str += title + " ";
				
					
					str += '</a></span><span class="fr_block"><em class="state_txt '+scheClass+'">'
							+ schechk + '</em>';
					str += '</span></li>';
					/* str += ' <span class="fr_block"><em class="state_txt">'; */

				}
				
			}
	    	return str;
			
		},

		//하단 메모 리스트 세팅 
		setMemoList : function(list) {

			
			var str = '';
			
			//sNb (아이디값), mainSnb(부모글번호), sttsCd, private(비밀여부 Y,N), importance(중요도0,1,2,3), name, comment(내용), major(업무여부), rgId, upId
			//frstReadStts(첫글확인여부 00001:미확인, 00002:확인)
			//tmDt, newMainSnb, grpMemCnt(메모참가자 수), sendNm(보낸사람), revNm(받는사람) repCnt(댓글수), repLastDt, readStts(전체확인여부 00001:미확인, 00002:확인), commentsReply, fileCount(파일수), memoKind(REV 발신, SEND 수신, MEMO 메모)
		

    		//str+='<ul class="memo_list"  style="overflow:scroll; width:100%; height:350px; display:block; -webkit-overflow-scrolling:touch;"> ';
    		//list - sNb, name(작성자), title(제목), note(내용), process(진행상황 00001 계획, 00002진행중, 00003완료, 0004보류), private(안씀), tmDt(날짜)
    		
		    if (list.length == 0) {
		    	str += '<li class="nocon_txt">등록된 메모가 없습니다.</li>';

			} else {
				
				for (var i = 0; i < list.length; i++) {

					var memoKind = '';
					var iconClass ='';
					var sendNm = list[i].sendNm;
					var fromTo = 'contact_from';
					
					if (list[i].memoKind == 'SEND') {
					   
						memoKind = '수신';
						
						if(list[i].readStts == '00002') iconClass = 'state_icon_check';
						else iconClass = 'state_icon_order';
						

					}else if (list[i].memoKind == 'REV'){
						
						memoKind = '발신';
						
						if(list[i].readStts == '00002') iconClass = 'state_icon_check';
						else iconClass = 'state_icon_send';
					
						sendNm = list[i].revNm;
						fromTo = 'contact_to';
						
					}else {
						
						memoKind = '메모';
						sendNm = '나';
						iconClass = 'state_icon_memo';
			
					}
					
					str += '<li onclick="commonPopAllObj.memoViewPop(';
					if(list[i].mainSnb == 0) str += list[i].sNb;
					else str += list[i].mainSnb;
					
					str +=','+list[i].sNb+');">';
					
					str += '<dl><dt><span class="'+iconClass+'">'+ memoKind + '</span>';
					str += '<span class="'+fromTo+'">'+sendNm+'</span>';
					str += '<span class="icon_count_em">'+list[i].grpMemCnt+'</span>';
					
					if(list[i].repCnt > 0) str += '<span class="icon_comment ' + (list[i].sttsCd == '00001' ? 'n_read' : '') + '">' + list[i].repCnt + '</span>';
					if(list[i].fileCount > 0) str += '<span class="icon_clip">' + list[i].fileCount + '</span>';
					
					str += '</dt>';
					
					str += '<dd>';
					str += '<a href="javascript:;">';
					
					if (list[i].importance =='1')         str += '<span class="icon_important_L1"><em>!</em></span>';
					else if (list[i].importance =='2')    str += '<span class="icon_important_L2"><em>!!</em></span>';
					else if (list[i].importance =='3')    str += '<span class="icon_important_L3"><em>!!!</em></span>';
					
					if(list[i].private =='Y') str += '<span class="icon_secret"><em>비밀글</em></span>';
					
					str += '<span>';
					
					var txtColor = '#4d87f5;';
					
					if(list[i].memoType == '00030') txtColor = '#ff4d06;';
					if(list[i].memoTypeNm != '') str += '<strong>'+list[i].memoTypeNm+'</strong>';
					
					str +=  list[i].comment + '</span> ';
					
					
					str += '</a></dd></dl></li>';   
	

				}
			}
	    		
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
	    		}else{
	    			scheCalObj.setSelectList();
	    			
	    			/* if(type == 'Schedule') scheCalObj.setScheduleList();
					else scheCalObj.setWorkList(); */
	    		}
				
				
			}
			
			commonAjax("POST", url, param, callback, false);
			
		},
		
		//미완료
		checkNoFinish : function(){
			
			
			if($("#showNoFinish").is(':checked')){
				
				$(".finishWork").hide();
			}else{
				$(".finishWork").show();
			}
		}
		

	};

$(function() {

	scheCalObj.preloadCode();
	scheCalObj.searchCalendarDate();
	scheCalObj.setDateTilte();
	//scheCalObj.searchCalendarDate_week()
	
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
        
	var options = { rotate: true };  
    $('#wrapper').jqueryFab(links, options);
   
    $('.currentday').closest('tr').removeClass().addClass('unhidden');
    	/* 
    $('html, body').css({'overflow': 'hidden', 'height': '100%'}); */
    
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