<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="wrap">
    	<!-- 고정서브navi -->
	 	<div class="sub_fixWrap">

				<div class="mb_sub_location">
					<button type="button" class="back" id="alarmListMainPopCanBtn" onclick="closeBottomBox('alarmListMainPop','alarmListMainArea','first');"><em>이전</em></button>
					<a href="javascript:;" class="depth03">알림내역</a>
					<div class="btn_alarmset"  onclick="alarmListMainObj.setAlarmInnerPop();"></div>
				</div>

				<div class="tab_flatst">
					<ul class="tab_flatst_list n04">
						<li id="alarmTab" class="alarmListTab current"><a href="javascript:alarmListMainObj.searchTabType('');" >전체</a></li>
						<li id="alarmTabSCHEDULE"  class="alarmListTab"><a href="javascript:alarmListMainObj.searchTabType('SCHEDULE');" >일정</a></li>
						<li id="alarmTabMEMO" class="alarmListTab"><a href="javascript:alarmListMainObj.searchTabType('MEMO');">메모</a></li>
						<li id="alarmTabDEAL" class="alarmListTab"><a href="javascript:alarmListMainObj.searchTabType('DEAL');">딜</a></li>
					</ul>
				</div>

		</div>
		<!--//고정서브navi//-->

		<!--서브컨텐츠-->
		<section class="contentsWrap scrollArea alarmWrap" id="searchViewListArea_wrap" >
			<!--알림-->
			<article class="alarm_listwrap swipe_list" id="alarmList"><div class="no_content">알림 목록이 없습니다.</div></article>
			<!--//알림//-->
		</section>

		<!--//서브컨텐츠//-->


</div>

<!-- 알람 설정 -->
<div class="rightBox disPlayNone" id="setAlarmInnerPop">
	<div class="rightBox-inner">
      <div id="setAlarmInnerArea"></div>
  	</div>
</div>
<!-- //알람 설정// -->

<!-- 메모 뷰 -->
<div class="rightBox disPlayNone" id="memoViewInnerPop">
	<div class="rightBox-inner">
      <div id="memoViewInnerArea"></div>
  	</div>
</div>
<!--// 메모 뷰 //-->

<!-- 스케쥴 뷰 -->
<div class="rightBox disPlayNone" id="scheduleViewInnerPop">
	<div class="rightBox-inner">
      <div id="scheduleViewInnerArea"></div>
  	</div>
</div>
<!-- //스케쥴 뷰// -->

<!-- 딜 뷰 -->
<div class="rightBox disPlayNone" id="dealViewInnerPop">
	<div class="rightBox-inner">
      <div id="dealViewInnerArea"></div>
  	</div>
</div>
<!-- //딜 뷰// -->


<script>

var g_alarmOpenType = 'alarm';
var g_alarmSearchTab ='';
var g_memoCurPageNo = 1;				//현재페이지번호
var g_memoPageSize = 10;				//페이지크기(상수 설정)
var g_pageCount="";
var g_currentMemoId = 0;

var g_separator = '@!^'; 		//구분자

var g_mnaStatusCodeList = new Array();							//mna 진행상태
var g_statusCodeList = new Array();								//진행상태

var g_mezzLYn = 'N';
var g_mezzNYn = 'N';

var alarmListMainObj = {

		 preloadCode : function(){
			 
			$("link[rel=stylesheet][href*='${pageContext.request.contextPath}/css_m/refont.css']").remove();
			//상태값 코드
			g_mnaStatusCodeList = getCommonCode('00016', 'KOR', 'code', 'cdNm', null, null, null);
			g_statusCodeList = getCommonCode('00004', 'KOR', 'code', 'cdNm', null, null, null);
			

			//메자닌 권한 세팅
			g_mezzLYn = '${userLoginInfo.mezzL}';		//메자닌 상장 권한
			g_mezzNYn = '${userLoginInfo.mezzN}';		//메자닌 비상장 권한
			
			if('${userLoginInfo.permission}' > '00020' || '${userLoginInfo.id}' == 'gjh'){	//개발자 대표님 무조건 Y
				g_mezzLYn = 'Y';
				g_mezzNYn = 'Y';
			}
			
		 },

		 //카운트 초기화
		 updateCountYn : function(){

			 var url = contextRoot + "/m/alarm/updateAlarmReadStatus.do";


			 var param = {
					countYn	 : 'N'
			 };

			 var callback = function(result){

				 var obj = JSON.parse(result);
				 var cnt = obj.resultVal;

				 if(cnt == -8){

					alert("로그인 후 이용해주세요.");
					location.href = "${pageContext.request.contextPath}/m/login.do";

				 }else{
					 badgeInit();
				 }


			 };

			 commonAjax("POST", url, param, callback, false);

		 },

		 //검색
		 doSearch : function(){

			 var url = contextRoot+"/m/alarm/getAlarmList.do";


			 var param = {

					 listYn		 : 'Y',
					 searchType	 : g_alarmSearchTab

			 };

			 var callback = function(result){
				 var obj = JSON.parse(result);
				 var list = obj.resultList;

				 var str ='';

				 var nowDate = new Date().yyyy_mm_dd();

				 var date = new Date();

				 var yesterDate = new Date(date.valueOf()-(24*60*60*1000)).yyyy_mm_dd();

				 var currentDate = '';

				 if(list.length >0){
					 for(var i=0; i<list.length; i++){
						 var dataObj = list[i];
						 var dateStr = (dataObj.sendDt).substring(0,10);

						 if(currentDate != dateStr){

							 str +='<h3 class="alarm_title">';

							 if(nowDate == dateStr)  str += '<span class="day">오늘<em>('+(dateStr.substring(2,10)).replace(/-/gi,'/')+')</em></span>';
							 else if(yesterDate == dateStr)  str += '<span class="day">어제<em>('+(dateStr.substring(2,10)).replace(/-/gi,'/')+')</em></span>';
							 else  str += dateStr.replace(/-/gi,'/');
							 str +='<span class="btn_delete" onclick="alarmListMainObj.deleteAlarmDate(\''+dateStr+'\');"></span>';
							 str +='</h3>';


						 }
						
						
						//str += '   <div class="item">';

						//메모 세팅
						 if(dataObj.pushType == 'MEMO' || dataObj.pushType == 'MEMOCOMMENT'){
							 //str += '<a class="item-swipe">'+alarmListMainObj.setMemoList(dataObj)+'</a>';
							 str += alarmListMainObj.setMemoList(dataObj);
							 
							 
						 }

						 //일정 세팅
						 if(dataObj.pushType == 'SCHEDULE')  str += alarmListMainObj.setScheduleList(dataObj);

						 //딜 세팅
						 if(dataObj.pushType == 'DEAL')  str += alarmListMainObj.setDealList(dataObj);

						 if(dataObj.pushType == 'DEALCOMMENT' || dataObj.pushType == 'DEALOPINION' 
								 || dataObj.pushType == 'DEALANAL' || dataObj.pushType == 'DEALSTATUS' )  str += alarmListMainObj.setDealEctList(dataObj);
 
						 currentDate = dateStr;
						 
						 /* str += '<div class="item-back btn_close_wrap" >';
						 str += '<button class="action first btn-delete" type="button" onclick="alarmListMainObj.deleteAlarmOne('+dataObj.pushId+');"><i class="fa fa-trash-o"></i></button>';
						 str += '</div>'; */
						// str += '</div>';
						
						 
					 }

				 }else{
					 str = '<div class="no_content">알림 목록이 없습니다.</div>';
				 }



				 $("#alarmList").html(str);

			 };

			 commonAjax("POST", url, param, callback, false);

		 },

		 //탭타입 선택
		 searchTabType : function(tabType){

			 startLoadingBar();

			 $(".alarmListTab").removeClass('current');
			 $("#alarmTab"+tabType).addClass('current');

			 g_alarmSearchTab = tabType;

		 	alarmListMainObj.doSearch();

		 	endLoadingBar();

		 },

		 //메모 리스트 세팅
		 setMemoList : function(obj){

			 var str ='<dl class="alarm_list" ';
			 var dataArr = (obj.contentData).split(g_separator);		//구분자로 나눔

			 if(dataArr.length > 1){
				
				 str += 'onclick="alarmListMainObj.memoViewInnerPop('+dataArr[4]+','+dataArr[5]+',\'inner\','+obj.pushId+',\''+obj.pushType+'\')">';
				 
				 str += '<dt class="icon_memo">';

				 if(obj.pushType == 'MEMOCOMMENT') str += '';
				 else str += (dataArr[0] == '00002' ? '<span class="state_icon_check"></span>' : '<span class="state_icon_order"></span>');		//읽음 안읽음
				 str += '<strong>'+obj.sendNm+'</strong>';														//보낸이
				 str += (dataArr[2] != '0' ? '<span class="icon_count_em">'+dataArr[2]+'</span>' : '');			//인원수
				 str += '<span class="time">'+(obj.sendDt).substring(11,16)+'</span>';							//보낸시간
				 if(obj.readYn == 'N') str += '<span class="new">'+obj.readYn+'</span>'	;						//읽음 여부
				 str += '<dd>';
				 
				 //업무 보고,승인요청 등 
				 if(obj.pushType == 'MEMO' && dataArr[6] != '') str += '<strong>'+dataArr[6]+'</strong>';
				 
				 str += dataArr[3]+'</dd>';																		//내용
				 
				 str += '</dt>';

			 }else str += '><dt><dd>삭제된 글이거나 정보가 잘못 되었습니다.</dd></dt>';


			 str +='</dl>';

			 return str;


		 },

		 //일정 리스트 세팅
		 setScheduleList : function(obj){

			 var str ='<dl class="alarm_list" ';


			 var dataArr = (obj.contentData).split(g_separator);		//구분자로 나눔
			
			 if(dataArr.length > 1){
				 
				 str += ' onclick="alarmListMainObj.scheduleViewInnerPop('+obj.pushTypeId+',\'inner\','+obj.pushId+',\''+obj.pushType+'\')">';
				 
				 str += '<dt class="icon_sche">';
				 str += '<strong>'+dataArr[0]+'</strong>';     //제목
				 str += '<span class="time">'+ (obj.sendDt).substring(11,16)+'</span>';   	//보낸시간
				 if(obj.readYn == 'N') str += '<span class="new">'+obj.readYn+'</span>'	;
				 str += '</dt>';
				 str += '<dd>';
				 str += (dataArr[1] == dataArr[2] ? dataArr[1].replace(/-/gi,'/') +' ('+dataArr[3]+') &nbsp;'  : dataArr[1].replace(/-/gi,'/')+' ('+dataArr[3]+')'+' ~ '+	dataArr[2].replace(/-/gi,'/')+' ('+dataArr[4]+')  &nbsp;')

				 str +=  dataArr[5];    //내용
				 str += '</dd>';

			 }else str += '><dt><dd>삭제된 글이거나 정보가 잘못 되었습니다.</dd></dt>';


			 str +='</dl>';

			 return str;


		 },

		 //딜 세팅
		 setDealList : function(obj){


			 var str ='<dl class="alarm_list" ';


			 var dataArr = (obj.contentData).split(g_separator);		//구분자로 나눔

			 if(dataArr.length > 1){
				 
				 str += ' onclick="alarmListMainObj.dealViewInnerPop('+obj.pushTypeId+',0,\'inner\','+obj.pushId+',\''+obj.pushType+'\')">';
				 str += '<dt class="icon_deal">';
				 str += '<strong>'+dataArr[5]+'-'+dataArr[6]+'</strong>';     					//회사명
				 str += '<span class="time">'+ (obj.sendDt).substring(11,16)+'</span>';   		//보낸시간
				 if(obj.readYn == 'N') str += '<span class="new">'+obj.readYn+'</span>'	;
				 str += '</dt>';
				 str += '<dd>';
				 str +=  obj.sendNm+'님이 딜을 등록하셨습니다.';
				 str += '</dd>';
				

			 }else str += '><dt><dd>삭제된 글이거나 정보가 잘못 되었습니다.</dd></dt>';


			 str +='</dl>';

			 return str;


		 },

		 //딜 코멘트 외
		 setDealEctList : function(obj){

			 var str ='<dl class="alarm_list"';

			 var dataArr = (obj.contentData).split(g_separator);		//구분자로 나눔

			 if(dataArr.length > 1){
				 str += ' onclick="alarmListMainObj.dealViewInnerPop('+dataArr[0]+','+dataArr[2]+',\'inner\','+obj.pushId+',\''+obj.pushType+'\')">';
				 str += '<dt class="icon_deal">';
				 str += '<strong>'+dataArr[5]+'-'+dataArr[6]+'</strong>';     								//회사명
				 str += '<span class="time">'+ (obj.sendDt).substring(11,16)+'</span>';   					//보낸시간
				 if(obj.readYn == 'N') str += '<span class="new">'+obj.readYn+'</span>'	;
				 str += '</dt>';
				 str += '<dd>';



				 if(obj.pushType == 'DEALOPINION') str += '투자의견 : ' + dataArr[4].split(':::')[1];
				 else if(obj.pushType == 'DEALCOMMENT') str += '단순의견 : '+dataArr[4];
				 else if(obj.pushType == 'DEALANAL') str += dataArr[4];
				 else if(obj.pushType == 'DEALSTATUS'){
					 
					 var index = dataArr[4].lastIndexOf(':');
					 str += '딜이 '+dataArr[4].substring(index*1+1,dataArr[4].length)+' 되었습니다.';
				 }
				 str += '</dd>';
				 str += '<dd class="write">작성자 : '+obj.sendNm+'</dd>';

			 }else str += '><dt><dd>삭제된 글이거나 정보가 잘못 되었습니다.</dd></dt>';


			 str +='</dl>';

			 return str;
		 },
		 
		 //단일 건 삭제
		 deleteAlarmOne : function(pushId){

			 var url= contextRoot + "/m/alarm/updateAlarmReadStatus.do";
			 var params ={

					 pushId 	: pushId,
					 listYn 	: 'N',
					 readYn 	: 'Y',
					 countYn 	: 'N',
					
					 

			 };

			 var callback = function(result){

				 var obj = JSON.parse(result);
				 var cnt = obj.resultVal;

				 if(cnt == -8){

					alert("로그인 후 이용해주세요.");
					location.href = "${pageContext.request.contextPath}/m/login.do";

				 }else{
					 alarmListMainObj.doSearch();
				 }

			 };

			 commonAjax("POST", url, params, callback, false);
		 },

		 //삭제
		 deleteAlarmDate : function(date){

			 var url= contextRoot + "/m/alarm/updateAlarmReadStatus.do";
			 var params ={

					 date 		: date,
					 listYn 	: 'N',
					 readYn 	: 'Y',
					 countYn 	: 'N',
					 pushTab	: g_alarmSearchTab
					 

			 };

			 var callback = function(result){

				 var obj = JSON.parse(result);
				 var cnt = obj.resultVal;

				 if(cnt == -8){

					alert("로그인 후 이용해주세요.");
					location.href = "${pageContext.request.contextPath}/m/login.do";

				 }else{
					 alarmListMainObj.doSearch();
				 }

			 };

			 commonAjax("POST", url, params, callback, false);
		 },

		 //알림 설정 팝업
		 setAlarmInnerPop : function(){


			var url= "/m/alarm/setAlarmPop_openLayer.do";

	  		var params ={};

	  		commonPopAllObj.pushBeforeUrl();

	  		var callback = function(result){


	  			$("#setAlarmInnerArea").html(result);

		  		$('#setAlarmInnerPop').animate({'right':'0'},300);
		  		$('#setAlarmInnerPop').removeClass('disPlayNone');
	  			nowUrl = url;

	  			window.history.pushState({'url' : url}, 'Title', "#"+url);

	      	}

	  		commonAjaxTohtml( contextRoot+url, params, callback);

		},

		//읽음 처리
		doReadStatus : function(pushId,pushType){

			var url= contextRoot + "/m/alarm/updateAlarmReadStatus.do";
			var params ={

					pushId 	 	: pushId,
	  				pushType 	: pushType,
	  				readYn 	 	: 'Y',
	  				countYn 	: 'N'

	  		};

			var callback = function(result){


			};

			commonAjax("POST", url, params, callback, false);

		},

		 //메모팝업
		 memoViewInnerPop : function(memoMainSnb,memoSnb,openType,pushId,pushType){

			alarmListMainObj.doReadStatus(pushId,pushType);

			g_currentMemoId = memoSnb;

			var url= "/m/schedule/memoViewPop_openLayer.do";

	  		var params ={

	  				memoId 	 : memoMainSnb,
	  				memoSnb	 : memoSnb,
	  				openType : openType,
	  				searchKey : ''
	  		};

	  		commonPopAllObj.pushBeforeUrl();

	  		var callback = function(result){


	  			$("#memoViewInnerArea").html(result);

		  		$('#memoViewInnerPop').animate({'right':'0'},300);
		  		$('#memoViewInnerPop').removeClass('disPlayNone');
	  			nowUrl = url;

	  			window.history.pushState({'url' : url}, 'Title', "#"+url);

	  			$("#scrollChatArea").animate({ scrollTop: $('#scrollChatArea').eq(0).prop("scrollHeight")}, 50);

	      	}

	  		commonAjaxTohtml( contextRoot+url, params, callback);

		},

		//일정보기팝업
		scheduleViewInnerPop : function(scheSeq, openType, pushId, pushType){

			alarmListMainObj.doReadStatus(pushId,pushType);

			var url= "/m/schedule/scheduleViewPop_openLayer.do";

	  		var params ={

	  				 ScheSeq 	 	: scheSeq,
	  				 openType 		: openType,

	  		};

	  		commonPopAllObj.pushBeforeUrl();

	  		var callback = function(result){

	  			$("#scheduleViewInnerArea").html(result);

		  		$('#scheduleViewInnerPop').animate({'right':'0'},300);
		  		$('#scheduleViewInnerPop').removeClass('disPlayNone');

	  			nowUrl = url;

	  			window.history.pushState({'url' : url}, 'Title', "#"+url);

	      	}

	  		commonAjaxTohtml( contextRoot+url, params, callback);

		},

		//딜 상세
		dealViewInnerPop : function(dealSnb, commentSnb, openType, pushId, pushType){

			alarmListMainObj.doReadStatus(pushId,pushType);

			var url = "/m/commonPop/dealViewPop_openLayer.do";

			var params = {
						sNb 		: dealSnb,
						commentSnb  : commentSnb,
						openType	: openType
			};

			commonPopAllObj.pushBeforeUrl();

	  		var callback = function(result){

	  			$("#dealViewInnerArea").html(result);

		  		$('#dealViewInnerPop').animate({'right':'0'},300);
		  		$('#dealViewInnerPop').removeClass('disPlayNone');

	  			nowUrl = url;

	  			window.history.pushState({'url' : url}, 'Title', "#"+url);
	  		};


	  		commonAjaxTohtml( contextRoot+url, params, callback);

		},

};


$(function(){
	alarmListMainObj.updateCountYn();
	alarmListMainObj.preloadCode();
	alarmListMainObj.doSearch();

});


</script>