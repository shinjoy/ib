<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% 
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);

%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>팝업알림 리스트</title>
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/new_style.css'/>" rel="stylesheet" type="text/css">

<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<link href="<c:url value='/images/favicon.ico' />" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">				<!-- jquery-ui -->
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>

<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->


<script type="text/javascript">

</script>
<style type="text/css">
.net_table_apply thead{
	hieght:22px;
}
tbody tr.tr_selected {
	font-weight:bold; 
}
.net_table_apply tbody tr:hover {
	 background:#f0f0f0;
}
.net_table_apply th{
    border-right: #b9c1ce solid 1px;
    border-bottom: #b9c1ce solid 1px;
}
.net_table_apply td{
    border-right: #b9c1ce solid 1px;
}
.tab_div{
	width: 100%;
}
.tab_title{
	width: 100%;
}
.btn_standard{
	border-radius:2px;
	padding:4px 8px 4px 8px;
	margin-left:7px;
}
</style> 

</head>

<body>
	<div id="titleMsg" class="titleMsg"></div>
	<div style="margin:30px 200px;">
		<div class="tab_title"><font style="font-size:15px;font-weight:bold;">*알림 리스트*</font></div>
		<div class="tab_div">
			<span id="totalCount"></span>
			<span style="padding-left:10px;">
				<select id="pageSize" class="mgl6" style="height:22px;width:100px;" onchange="fnObj.doSearch(1);">
					<option value="15">15개씩 보기</option>
					<option value="20">20개씩 보기</option>
					<option value="30">30개씩 보기</option>
				</select>
			</span>
			<span style="padding-left:140px;">분류:</span>
			<span>
				<select id="alarmTarget" class="mgl6" style="height:22px;width:90px;" onchange="fnObj.doSearch(1);">
					<option value="">전체</option>
					<option value="B_CARD">법인카드</option>
					<option value="NOTICE">전체공지</option>
					<!-- <option value="DIRECTOR">임원</option> -->
					<option value="MANAGER">팀장</option>
					<option value="DEPART">부서</option>
				</select>
			</span>
			<span style="padding-left:10px;">알림타입:</span>
			<span>
				<select id="alarmType" class="mgl6" style="height:22px;width:90px;" onchange="fnObj.doSearch(1);">
					<option value="">전체</option>
					<option value="POPUP">팝업</option>
				</select>
			</span>
		
			<span style="padding-left:10px;">내용:</span>
			<span><input type="text" id="alarmText" class="applyinput_B mgl6" style="width:300px;" onkeypress="if(event.keyCode==13) fnObj.doSearch(1);"></span>
		
			<span style="padding-left:10px;">날짜:</span>
			<!-- <span> -->
				<input type="text" id="alarmStart" class="applyinput_B w_st06" readonly="readonly" onclick="$(this).val('');"/>
				<a href="#" onclick="$('#alarmStart').datepicker('show');return false;" class="btn_calendar" style="margin-top:10px;margin-left:0px;"></a>
			<!-- </span> -->
			<span>
				<button name="reg_btn" class="btn_standard" onclick="fnObj.doSearch();" style="border:1px solid #bbbfce; background-color:#f1f1f1;border-radius:2px;">검색</button>
			</span>
			<span style="float:right;padding-top: 8px;">
				<button name="reg_btn" class="btn_standard" onclick="fnObj.regAlarmPop(0);" style="border:1px solid #323b5a; background-color:#59647a;border-radius:2px;"><font style="color:white;">신규등록</font></button>
				<button name="reg_btn" class="btn_standard" onclick="fnObj.secAlarmUser();" style="border:1px solid #bbbfce; background-color:#f1f1f1;border-radius:2px;">대상자조회</button>
			</span>
		</div>
			
		<table id="SGridTarget" class="net_table_apply" summary="알림리스트" style="margin-top:5px;">
		       <caption>
		          알림리스트
		       </caption>
		       <colgroup>
		       		<col width="6%"/>  <!--알림시퀀스-->
		       		<col width="6%"/>  <!--진행중-->
                    <col width="6%"/>  <!--알림분류-->
                    <col width="7%"/>  <!--알림타입-->                            
                    <col width="*"/>   <!--알림내용-->
                    <col width="10%"/> <!--시작일-->
               		<col width="10%"/> <!--종료일-->
               		<col width="10%"/> <!--등록일-->
               </colgroup>
               <thead>
              	 <tr style="height:30px;background:#dfe3e8;">
          	 		<th>번호</th>
          	 		<th>진행여부</th>
        		 	<th>분류</th>
        		 	<th>알림타입</th>
        		 	<th>내용</th>
        		 	<th><a href="#" onclick="fnObj.doSort(0);" id="sort_column_prefix0" class="sort_normal">알림시작일</a></th>
        		 	<th><a href="#" onclick="fnObj.doSort(1);" id="sort_column_prefix1" class="sort_normal">알림종료일</a></th>
        		 	<th><a href="#" onclick="fnObj.doSort(2);" id="sort_column_prefix2" class="sort_normal">등록일</a></th>
               	 </tr>
             	</thead>
		       	<tbody>
		        </tbody>
		</table>
	   <!--페이징-->
        <div class="memoPageZone">
            <div class="fl_block">
             	<!-- 페이지 목록 -->
                 <div class="btnPageZone" id="btnPageZone">
                     <button type="button" class="pre_end_btn"><em>맨처음 페이지</em></button>
                     <button type="button" class="pre_btn"><em>이전 페이지</em></button>
                     <button type="button" class="next_btn"><em>다음 페이지</em></button>
                     <button type="button" class="next_end_btn"><em>맨마지막 페이지</em></button>
                 </div>
                 <!--/ 페이지 목록 /-->
            </div>
         </div>
       <!--//페이징//-->
    </div>
	</div>
</body>
</html>

<script type="text/javascript">

//Global variables :S ---------------

//공통코드

var myGrid = new SGrid();		// instance		new sjs
var myPaging = new SPaging();	// instance		new sjs
var mySorting = new SSorting();	// instance		new sjs

var curPageNo = 1;				//현재페이지번호
var pageSize = 15;				//페이지크기(상수 설정)
var sNb='${userLoginInfo.staffSnb}'; 		  //로그인 유저의 sNb
var permission='${userLoginInfo.permission}'; //로그인 유저의 permission
var division='${userLoginInfo.division}';
var g_gridListStr;							  //그리드 데이터 string (객체화되기전 문자열 json... JSON.parse 로 객체로 만들어사용) (증권사 필터링을 위해..)


//Global variables :E ---------------

/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	

	//선로딩코드
	preloadCode: function(){
		//공통코드
		//캘린더 세팅 
		$("#alarmStart").datepicker({
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
		    buttonImageOnly: true,
		    buttonText: ""
		});	
		//페이지크기 세팅
		fnObj.setPageSize();
	},

	//화면세팅
    pageStart: function(){
    			
    	//-------------------------- 그리드 설정 :S ----------------------------
    	/* 그리드 설정정보 */
    	 var configObj = {
    	 	targetID : "SGridTarget",		//테이블아이디
    		
    		//그리드 컬럼 정보
    		colGroup : [    		
            {key:"alarmId"},
            {key:"alarmTarget", formatter:function(obj){
								           		var alarmTargetTxt ='';
								           		if(obj.item.alarmTarget == 'B_CARD'){alarmTargetTxt='법인카드';}
								           		else if(obj.item.alarmTarget == 'NOTICE'){alarmTargetTxt='전체공지';}
								           		else if(obj.item.alarmTarget == 'DIRECTOR'){alarmTargetTxt='임원';}
								           		else if(obj.item.alarmTarget == 'MANAGER'){alarmTargetTxt='팀장';}
								           		else if(obj.item.alarmTarget == 'DEPART'){alarmTargetTxt='부서';}
								           		return alarmTargetTxt;
           								}},           
            {key:"alarmType"},
           	{key:"alarmText", formatter:function(obj){
							           		var alarmText =obj.item.alarmText;
							           		if(alarmText.length>50){
							           			alarmText=alarmText.substring(0,50)+"...";
							           		}
							           		return alarmText;
							           	}},
            {key:"alarmStart"},	
            {key:"alarmEnd"},
            {key:"createDate"},	
            {key:"viewYn", formatter:function(obj){		//현재 공지중인 알림 배경색 설정				
							           		var txt ='';
							           		if(obj.item.alarmStart<=new Date().yyyy_mm_dd() &&
							           			new Date().yyyy_mm_dd()	<= obj.item.alarmEnd
							           		){
							           			txt='<td style="text-align:center;background:#daf4f9;">진행중</td>';
							           		}else if(new Date().yyyy_mm_dd()<obj.item.alarmStart){
							           			txt='<td style="text-align:center;">예정</td>';
							           		}
							           		else txt='<td style="text-align:center;">완료</td>';
							           		return txt;
							           	}},
           ],
            
            
            body : {
                onclick: function(obj, e){
                	fnObj.regAlarmPop(obj.item.alarmId);
                
                }
    		}
            
    	};	
    	
    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
    	var rowHtmlStr = '<tr #[8] >';
    	rowHtmlStr +=	 '<td style="text-align:center;">#[0]</td>';
    	rowHtmlStr +=	 '#[7]';
    	rowHtmlStr +=	 '<td style="text-align:center;">#[1]</td>';
    	rowHtmlStr +=	 '<td style="text-align:center;">#[2]</td>';
    	rowHtmlStr +=	 '<td style="padding-right:20px!important;cursor:pointer;">#[3] </td>';				
    	rowHtmlStr +=	 '<td style="text-align:center;">#[4] </td>';	
    	rowHtmlStr +=	 '<td style="text-align:center;">#[5] </td>';	
    	rowHtmlStr +=	 '<td style="text-align:center;">#[6]</td>';	
    	rowHtmlStr +=	 '</tr>';
    	configObj.rowHtmlStr = rowHtmlStr; 
        
    	myGrid.setConfig(configObj); 
    	
    	//-------------------------- 그리드 설정 :E ----------------------------
    	
    	//-------------------------- 페이징 설정 :S ----------------------------
    	 
    	myPaging.setConfig({				//페이징 설정정보 세팅
    		
			targetID		: "btnPageZone",		//대상 페이징 id ... <div>
			pageSize		: pageSize,				//global variable value 
			
			preEndBtnClass	: 'pre_end_btn',		//맨처음 페이지 	버튼 클래스명
			preBtnClass		: 'pre_btn',			//이전 페이지		버튼 
			nextBtnClass	: 'next_btn',			//다음 페이지		버튼 
			nextEndBtnClass	: 'next_end_btn',		//맨마지막 페이지	버튼 클래스명
			
			curPageNoClass	: 'current',			//현재페이지를 표시해주기위한 style Class name
			clickFnName		: 'fnObj.doSearch'		//페이지 이동 함수명(버튼 클릭)
			
    	});
    	
    	//-------------------------- 페이징 설정 :E ----------------------------
    	//-------------------------- 소팅 설정 :S ----------------------------    	
    	mySorting.setConfig({
			colList : ['alarm_start', 'alarm_end', 'create_date'],	//알림시작일,알림종료일,등록일
			classNameNormal		: 'sort_normal',					//정렬기본 아이콘 css class
			classNameHighToLow	: 'sort_hightolow',					//오름정렬 아이콘 css class
			classNameLowToHigh	: 'sort_lowtohigh',					//내림정렬 아이콘 css class
			defaultSortDirection: 'DESC'							//기본 정렬 방향
		});
    	//-------------------------- 소팅 설정 :E ----------------------------
    	
    	
    },//end pageStart.
    
    //검색
    doSearch: function(page){ 
    	
    	var pageSize = $("#pageSize").val();
    	var alarmTarget =$("#alarmTarget").val();	//법인카드 전체 임원 등의 타깃
    	var alarmType	=$("#alarmType").val();		//팝업 or sms 
    	var alarmText	=$("#alarmText").val();		//내용검색
    	var alarmStart	=$("#alarmStart").val();	//시작일 검색	
    	
    	if(page==null) page=1;	//현재 페이지 초기값 세팅
    	var url = contextRoot + "/alarm/getAlarmList.do";
    	var param = {
    					pageSize: pageSize,				//페이지 사이즈
		    			pageNo:	page,					//페이지번호
    					alarmTarget:alarmTarget,
    					alarmType:alarmType,
    					alarmText:alarmText,
    					alarmStart:alarmStart,
    					sortCol: mySorting.nowSortCol,	//소팅 컬럼명
		    			sortVal: mySorting.nowDirection	//소팅 타입(DESC,ASC)
    				};
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
			
    		curPageNo = obj.pageNo;			//현재페이지세팅(global variable)
    		
    		
    		var pageObj = {						//페이징 데이터
					pageNo : curPageNo,
					pageSize : pageSize,
					pageCount: obj.pageCount
				};
    		
    		myPaging.setPaging(pageObj);		//페이징 데이터 세팅	*** 1 ***
    		
    		myGrid.setGridData({				//그리드 데이터 세팅	*** 2 ***
								list: list,		//그리드 테이터
								page: pageObj	//페이징 데이터
    						});
    		
    		g_gridListStr = result;				//따로 전역변수에 넣어둔다
    		
    		mySorting.applySortIcon();			//소팅화면적용
    		$("#totalCount").html('<b>전체</b> '+obj.totalCount+' 건');
    	};
    	
    
    	commonAjax("POST", url, param, callback, false, null, null);
    	
    },//end doSearch
    //팝업 열기
    regAlarmPop: function(alarmId){ 
    	var url = "${pageContext.request.contextPath}/alarm/regAlarm.do?alarmId="+alarmId;
    	var option = "left=" + (screen.width > 1400?"700":"0") + ", top=" + (screen.height > 810?"100":"0") + ", width=520, height=560, menubar=no, status=no, toolbar=no, location=no, scrollbars=yes, resizable=no";
    	window.open(url, "_blank", option);
    },//end regAlarmPop
  	//컬럼 소팅
    doSort: function(idx){
    	//--------------------
    	mySorting.setSort(idx);				//소팅객체를 소팅한다.(상태값들의 변화)
    	fnObj.doSearch(1); 
      	//--------------------
	},
   //페이지 사이즈 세팅
    setPageSize: function(isSearch){
   	
	   	pageSize = $('#pageSize').val();
	   	
	   	//검색도 바로할 경우 ... isSearch ... true
		if(isSearch){
			fnObj.doSearch(1);
	   	}
   },
	//알림 공지 대상자 조회
    secAlarmUser : function(){
    	var url = "${pageContext.request.contextPath}/alarm/getAlaUserList.do";
    	var option = "left=" + (screen.width > 1400?"600":"0") + ", top=" + (screen.height > 810?"100":"0") + ", width=700, height=640, menubar=no, status=no, toolbar=no, location=no, scrollbars=no, resizable=no";
    	window.open(url, "_blank", option);
    }//end secAlarmUser
    

};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
		fnObj.preloadCode();	//선코딩
		fnObj.pageStart();		//화면세팅
		fnObj.doSearch(); 
});




</script>