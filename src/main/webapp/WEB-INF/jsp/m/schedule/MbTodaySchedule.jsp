<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file ="../includeJSP/header.jsp" %>

<script type="text/javaScript">
var g_divZidx =0;	
	$(document).ready(function () {
		if(parent.g_chkApp != undefined && parent.g_chkApp =='N' ){
			$("#divTabar").css('display','none');
			$("#buttonDiv").css('display','none');
		}
		
		//ajax 로 해당일 일정 리스트 가져오기
		
		getScheduleList();
		setDateDiv();
		
		
		$('#Schedule').click(function(event) {
			$('#TodaySchedule').attr('target', "_self");
			$('#TodaySchedule').attr("action", "<c:url value='/MbScheduleCal.do'/>").submit();
		});
		
		$('#Board').click(function(event) {
			$('#TodaySchedule').attr('target', "_self").attr("action", "<c:url value='/MbBoardList.do'/>").submit();
		});
		
		$('#Addr').click(function(event) {
			$('#TodaySchedule').attr('target', "_self").attr("action", "<c:url value='/PerAddrList.do'/>").submit();
		});
		// 이전
		$('#Prev').click(function(event) {
			Move_Cal("prev");
		});
		
		// 이후
		$('#Next').click(function(event) {
			Move_Cal("next");
		});
		
		// 일정추가
		$('#Add').click(function(event) {
			var year = $("#yearSelect").val();
			var month = $("#monthSelect").val();
			var day =$("#daySelect").val();
			if(month.length == 1) month = '0'+month ;
			var selectDate = year+'-'+month+'-'+day;
			var selectDate =new Date(selectDate).yyyy_mm_dd();
			
			$("#scheSDate").val(selectDate);
			$('#ScheduleCal').attr('target', "_self");
			$('#ScheduleCal').attr("action", '<c:url value="/MbScheduleProc.do?CMD=${vo.CMD}&EventType=Add&ScheSDate='+selectDate+'"/>').submit();
		});
		
	});
	//일정 리스트 가져오기
	function getScheduleList(){
		var url=contextRoot+"/getScheduleList.do";
		var searchPerSabun =$("#SearchPerSabun").val();
		
		var ScheGubun ="";
		if(searchPerSabun==''){
			searchPerSabun='${userLoginInfo.sabun}';
			ScheGubun ='Alone';
		}else{
			ScheGubun ='All';
		}
	 
    	var param = {
    					SearchSDate : $("#SearchSDate").val(),	//시작날짜
    					SearchPerSabun :searchPerSabun,	//사원 사번	
    					PerSabun :$("#PerSabun").val(),	//사원 사번	
    					regPerSabun :$("#RegPerSabun").val(),	//등록자 사번 내사번,	
    					ScheGubun:ScheGubun
    				};
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
    		
    		
    		var str="";
    		if(cnt==0){
    			 str='<dl class="schedule_list" style="text-align:center;"><dt><div class="con">일정이 없습니다.</div></dt></dl>';		
    		}else{
    		   str+='<dl class="schedule_list">';
    		   for(var i=0;i<list.length;i++){
	    			var FontColor="";
	    			var SpanSet="";
	    			
	    			if(list[i].scheimportant == 'top'){
	    				FontColor = 'style="color:#4507fd;font-weight:bold;"';
	    			}else{
	    				FontColor = 'style="color:#000000;"';
	    				//FontColor = "#000000";
	    			}
	    			if(list[i].mysche == 'My' || list[i].mysche == 'MyEntry'){
    					SpanSet = "style='text-align:center;color:red;'";
    				}else{
    					SpanSet = "style='text-align:center;color:#878787;'";
    				}
	    			
					str+='<dt onclick="javascript:ScheView(this, \''+list[i].scheseq+'\');"> <div class="time" '+SpanSet+'> ';	
	    			if(list[i].viewtime == 'A'){ str+='종일';}
	    			else { 
									    				
	    					var dateArr = (list[i].viewtime).split(":");
							var time =	dateArr[0];	//시
							var min  =	dateArr[1];	//분	
	    					if(time.length == 1) time = '0'+time ;
	    					if(min.length == 1) min = '0'+min ;
	    					str+=time+':'+min;
	    					
	    			}
    			  	str+='</div> <div class="con" '+FontColor+'> ';
    			  	str+=list[i].regpernm +' ';
    				var reTitle = list[i].schetitle;
    			  	reTitle = reTitle.replace(/\s\|A?[0-9]+\|/gi, '');	//회사코드 제거
    			   	reTitle = reTitle.replace(/\s\([0-9]+\)/gi, ' ');		//인물id sequence 제거
    			   	reTitle = reTitle.replace(/\/\sM&A\s\//gi, '<span style="font-size:11px;font-weight:bold;">M&A</span>');	
    			   	str+=reTitle;
    			   	str+=' </div></dt>';
    			  
    		   
    		   }
    		  
    		   str+='<dt id="dtSelScheView" style="display:none;"><iframe name="SelScheView" id="SelScheView" scrolling="no" frameborder="0" width="100%"  ></iframe></dt>';
    		   str+='</dl>';
    		
			}
    		 $("#scheListDiv").html(str);	
    	};
    
    	commonAjax("POST", url, param, callback, false, null, null);
	}
	
	// 일정 보기
	function ScheView(th, ScheSeq) {
		
		//---- 상세보기 iframe(SelScheView) 이동 :S -----
		$(th).after($('#dtSelScheView'));
		$('#dtSelScheView').show();		//보이게
		//---- 상세보기 iframe(SelScheView) 이동 :E -----
		
		
		$('#SelScheView').show();
		$('#ScheSeq').val(ScheSeq);
		var fullDate=$('#SearchSDate').val();
		if($('#SelYear').val() == ""){
			$('#SelYear').val(fullDate.substring(0,4));
		}
		if($('#SelMonth').val() == ""){
			$('#SelMonth').val(fullDate.substring(5,7));
		}
		
		$('#TodaySchedule').attr('target', "SelScheView");
		$('#TodaySchedule').attr("action", "<c:url value='/MbScheduleView.do'/>").submit(); 
							
		//줄선택 스타일
		$(".selected").removeClass('selected');
		$(th).addClass('selected');
		
	}
	
	function todayClick(){
		$("#SearchSDate").val(new Date().yyyy_mm_dd());
		setDateDiv();
		getScheduleList();
	}
	
	function clickPopUp(){
		
		if($('#SearchPerSabun').val() == ''){
			$('#SearchPerSabun').val('${userLoginInfo.sabun}');
		}
		window.open('${pageContext.request.contextPath}/openUserListPopUp.do?ScheSeq=0&eventType=Add&rootType=calendar&searchPerSabun='+$("#SearchPerSabun").val(),"new_window1","scrollbars=yes,toolbar=yes,location=yes,status=yes");

	}
	function goCalendar(){
			var fullDate=$('#SearchSDate').val();
			$('#SelYear').val(fullDate.substring(0,4));
			$('#SelMonth').val(fullDate.substring(5,7));
		
			$('#TodaySchedule').attr('target', "_self");
			$('#TodaySchedule').attr("action", "<c:url value='/MbScheduleCal.do'/>").submit();
	}
	
	function Move_Cal(type){
		var year = $("#yearSelect").val();
		var month = $("#monthSelect").val();
		var day =$("#daySelect").val();
		 var nowDate=new Date(Number(year),Number(month)-1,Number(day));
	
		//이전버튼
		if(type == 'prev'){
			nowDate.setDate(nowDate.getDate()-1);
			
		}else{ //이후버튼
			nowDate.setDate(nowDate.getDate()+1);	
		}
		
		$("#SearchSDate").val(nowDate.yyyy_mm_dd());
		
		setDateDiv();
		getScheduleList();
	}
	// 일정 닫기
	function ScheViewClose() {
		$('#SelScheView').hide();
	}
	// 날짜 세팅
	function setDateDiv() {
	
		var SearchSDate =$("#SearchSDate").val();
		
		var dateArr = SearchSDate.split("-");
		
		$("#yearDiv").html(dateArr[0]);
		$("#monthDiv").html(dateArr[1]);
		$("#dayDiv").html(dateArr[2]);
		
		$("#yearSelect").val(dateArr[0]);
		$("#monthSelect").val(dateArr[1]);
		$("#daySelect").val(dateArr[2]);
		
	}
	
	///직원선택 창 div open
	function openUserSelectPop(){
		
		
		var url=contextRoot+"/m/commonPop/openUserListPop.do";
		var params={selectList : ($('#SearchPerSabun').val() == '' ? '${userLoginInfo.sabun}' : $('#SearchPerSabun').val())};
		
		var callback = function(result){
	  		modal({
	            type: 'customer',
	            title: '직원선택',
	            text: result,
	            
	        });
	  	}
	  	
	  	$.ajax({
			type	: "POST",        			//"POST" "GET"
			url		: url,    					//PAGEURL
			data	: params,					//parameter object
			dataType: "html",
			timeout : 100000,       			//제한시간 지정(millisecond)
			cache 	: false,        			//true, false
			success	: callback,					//SUCCESS FUNCTION
			async	: true,
			error	: function whenError(x,e){	//ERROR FUNCTION			
				swal("서버오류");			
			}
	 	});
	}
	
	// 유저 세팅 후 리 로드
	function changeUser(userListStr) {
		
		if(userListStr!=''){
			var userList = JSON.parse(userListStr);
			var userSabun = [];
			for(var i=0;i<userList.length;i++){
				userSabun.push(userList[i].sabun);
			}
			
			$('#SearchPerSabun').val(userSabun.join(','));	
			
		}else $('#SearchPerSabun').val('${userLoginInfo.sabun}');	
		
		
		getScheduleList();
	
	}
/* 	------------------------일단 안씀.
	//셀렉트 날짜 변경
	function changeYM(divname){
		var year=$("#yearSelect").val();
		var month=$("#monthSelect").val();
		$("#"+divname).css("display","");
		$("#"+divname+"Select").css("display","none");
		Move_Cal(year, month);
	
	}
	//날짜 선택시 div 숨김.
	function hiddenView(obj){
		var divname= $(obj).attr('id'); 
	    $("#"+divname).css("display","none");
	    $("#"+divname+"Select").css("display","");
	    if(divname =='yearDiv'){
	    	$("#yearSelect").focus();
	    }
				if(divname =='monthDiv'){
					$("#monthSelect").focus();
	    }
	    
	} */
	
	
</script>

<style type="text/css">
.selected{background: #f0f0f0;}
</style>
	
	 
<body>
<div id="join_mb_searchWrap" class="relative" style="display:none;width:96%;"></div> <!-- 참가자 팝업 -->
				  
<fmt:formatDate var="nowDay" value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd'/>	
	<form name="ScheduleCal" id="ScheduleCal" method="post">
		<input type="hidden" name="PerSabun"		id="PerSabun"		value="${vo.perSabun == '' ?  userLoginInfo.sabun : vo.perSabun}"/>
		<input type="hidden" name="RegPerSabun"		id="RegPerSabun"	value="${userLoginInfo.sabun}"/>
	<%-- 	<input type="hidden" name="SearchPerSabun"	id="SearchPerSabun"	value="${vo.searchPerSabun}"/> --%>
		<input type="hidden" name="scheSDate" id="scheSDate" 			value="${vo.scheSDate == '' ? nowDay : vo.scheSDate}"/>
	</form>
	<div id="wrap">
		<!-- top -->
		<div id="buttonDiv">
    	<div class="mb_sub_location">
    		<button type="button" class="back" onclick='location.href="${pageContext.request.contextPath}/m/main.do"'><em>이전</em></button>
    		<a href="#" class="depth01">Work Schedule</a>
    		<a href="#" class="depth02">업무일정</a>
    	</div>
    	</div>
        <!--서브-->
        <div class="containerWrap"> 	
     
			<section class="contentsWrap">
				<!--tab-->
				  <div class="tabBoxWrap mgb1rem">
				  	 <div class="tab_pushst">
					  	 <ul class="tabList">
					  	 	 <li><a href="#" class="btn_gra_style btn_left btn_gra_style_active" style="font-size: 1rem;">Day</a></li>
					  	 	 <li><a href="javascript:goCalendar();" class="btn_gra_style btn_right" style="font-size: 1rem;">Month</a></li>
					  	 	 <li><a href="javascript:todayClick();" class="btn_gra_style btn_right" style="font-size: 1rem;">Today</a></li>
					  	 </ul>
				  	 </div>
				  	 <div class="selBox" >
			          	<button type="button" class="btn_pop_white01" onclick="javascript:openUserSelectPop();">직원선택</button>
			          	<button type="button" class="btn_pop_white01" onclick="javascript:changeUser('');">나</button>
			         </div>
			      </div>
			     
				<!--//tab//-->
			  <article class="work_schedule_wrap">
			  		<form name="TodaySchedule" id="TodaySchedule" method="post">
					<input type="hidden" name="CMD"			id="CMD"			value="${loginVO.CMD}"/>
					<input type="hidden" name="SearchPerSabun"	id="SearchPerSabun"	value="${vo.searchPerSabun}"/>
					<input type="hidden" name="RegPerSabun"	id="RegPerSabun"	value="${userLoginInfo.sabun}"/> 
					<input type="hidden" name="EventType"	id="EventType"		value="${vo.eventType}"/>
					<input type="hidden" name="ScheSeq"		id="ScheSeq"/>
					<input type="hidden" name="DocType"		id="DocType"		value="Self"/>
					<input type="hidden" name="SearchSDate" id="SearchSDate" 	value="${vo.scheSDate == '' ? nowDay : vo.scheSDate}"/>
				 	<input type="hidden" name="SelYear" 	id="SelYear"		value="${dateVO.selYear}"/>
					<input type="hidden" name="SelMonth" 	id="SelMonth"		value="${dateVO.selMonth}"/> 
					<input type="hidden" name="beforePage" 	id="beforePage"		value="list"/> 
					</form>
			  	<div class="schedule_titleZone" >
			  		<button type="button" id="Prev" class="prebtn"><span><em>이전일</em></span></button>
			  		<span style="font-size:1.6rem;width:9em;" class="today_title" ">
					 		<input type="hidden" name="yearSelect" id="yearSelect" >
					 		<span name="yearDiv"  id="yearDiv" ></span>년
					 		<input type="hidden" name="monthSelect" id="monthSelect" >
					 		<span name="monthDiv" id="monthDiv" ></span>월
					 		<input type="hidden" name="daySelect" id="daySelect">
					 		<span name="dayDiv" id="dayDiv" ></span>일
					 </span>
					 <button type="button" id="Next" class="nextbtn"><span><em>다음일</em></span></button>
			  	</div>
			  	<div class="work_schedule_conZone">
			  		<h2 class="schedule_contitle">일정</h2>
			  		 <div class="contentsBox" id="scheListDiv"></div> <!-- 일정 리스트 세팅 -->
			  		 <button type="button" class="registbtn" id="Add" ><span><em>등록</em></span></button>  <!-- 등록화면으로 -->
			  	</div>
				
				</article>
				<div class="work_schedule_btnZone">
	                <button type="button" class="btn_mobile_gray02" onClick="location.href='#wrap';"><em class="btn_gototop">맨위로</em></button>
	            </div>
			
			</section>
		</div>
		<div id="divTabar">
			<%@ include file ="../includeJSP/quickmenu.jsp" %> 
		</div>
	</div>
</body>
</html>