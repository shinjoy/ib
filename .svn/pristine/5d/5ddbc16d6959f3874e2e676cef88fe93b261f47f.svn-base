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
<title>MeetingRoom</title>

<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>

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



<style>
.btn_wh_bevel {
	/*float:left;*/ 
	width:100px; height:21px; line-height:21px; vertical-align:middle; border:#c2c2c2 solid 1px; 
	color:#666; display:inline-block; font-size:12px; text-align:center;
}

tbody tr.tr_selected {/* background:#edf1f2; */ font-weight:bold; }

.classicBox dl dd {
    width: 80%;
}

.custManagerGap{
    float: none;
    background: url(../images/common/bg_gtab.gif) repeat-x 0 top;
    height: 37px;
    overflow: hidden;
}
.custManager{
	padding-top:5px;
	height:25px;
	vertical-align:middle;
	text-align:center;
    float: none;
    background: url(../images/common/bg_bookmark_repeat.gif) repeat-x bottom;
    display: block;
    color: #242424;
}

.showManaAll{
	padding-top:10px;
	padding-left:20px;
}
.showNotyet{	
	padding-left:20px;
}
.showUnstaffCst{
	padding-top:10px;
	padding-left:20px;
}

.tNav li.active a {
    font-weight: normal;
    color: #999;
}

.widescroll_wrap { width:100%; min-width: 0px; overflow-x:auto; }

.network_st_box { 
	position:relative; border-top:#868d97 solid 2px; border-left:#b9c1ce solid 1px; 
	border-right:#b9c1ce solid 1px; border-bottom:#b9c1ce solid 1px; min-width:1550px; 
}

.editable_td_arrow {
	float:right;
    background: url(../images/common/bg_arrow_editable.gif) no-repeat right center;
    vertical-align: middle;
    display: inline-block;
    padding-right: 1px;
}

.s_gray01_btn {
    background: url(../images/common/bg_gray_sbtn.gif) repeat-x left bottom;
    border: #b7b7b7 solid 1px;
    border-radius: 2px;
    color: #555555;
    padding: 4px 5px 5px;
    font-size: 11px;
    vertical-align: middle;
    font-weight: normal;
    font-family: "돋움",Dotum,"굴림",Gulim,arial,sans-serif;     
}
.s_gray01_btn_off {
    background: url(../images/common/bg_gray_sbtn.gif) repeat-x left bottom;
    border: #b7b7b7 solid 1px;
    border-radius: 2px;
    color: #888;
    padding: 4px 5px 5px;
    font-size: 11px;
    vertical-align: middle;
    font-weight: normal;
    font-family: "돋움",Dotum,"굴림",Gulim,arial,sans-serif;
    opacity: 0.7;
}

.chng {
    background: url(../images/network/bg_network_arrow.gif) no-repeat right 0;
    padding-right: 13px;
    vertical-align: middle;
    font-family: "돋움",Dotum,"굴림",Gulim,arial,sans-serif; 
}
.s_gray01_btn .add {
    background: url(../images/network/btn_network_add.gif) no-repeat right 0;
    padding-right: 13px;
    vertical-align: middle;
    font-family: "돋움",Dotum,"굴림",Gulim,arial,sans-serif; 
}
.del {
    background: url(../images/network/btn_closed.gif) no-repeat right 0;
    padding-right: 13px;
    vertical-align: middle;
    font-family: "돋움",Dotum,"굴림",Gulim,arial,sans-serif; 
}

.btn_excel{
	border-right:#bbb solid 1px;
}
<%--

/* 페이징 */
.btnPageZone { margin-top:20px; text-align:center; font-family:Verdana, Geneva, sans-serif; vertical-align:middle; }
.btnPageZone button { background:url(../images/common/board/btn_board_collection.gif) no-repeat; width:19px; height:23px; display:inline-block; line-height:13px; font-size:12px; vertical-align:middle; }
.btnPageZone button em { position:absolute; left:-9999999999px; width:0px; height:0px; overflow:hidden; }
.btnPageZone button.pre_end_btn { background-position: -137px 6px; } 
.btnPageZone button.pre_btn { background-position: -166px 6px; margin-right:20px; } 
.btnPageZone button.next_btn { background-position: -192px 6px; margin-left:20px; }
.btnPageZone button.next_end_btn { background-position: -220px 6px; }

.btnPageZone span { height:23px; }
.btnPageZone span a { background:url(../images/common/board/bg_divide_boardnum.gif) no-repeat left center; height:16px; line-height:16px; font-size:12px; padding:3px 8px 4px; text-align:center; vertical-align:middle; display:inline-block; }
.btnPageZone .pre_btn + span a { background:none; }
.btnPageZone span.current a { border:#5d697c solid 1px; background:none; color:#242424; font-weight:bold; padding:2px 9px 3px; }
.btnPageZone span.current + span a { background:none; }

 --%>

</style>



<style type="text/css" >
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.2); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
    z-index: 1000000;
}
.wrap-loading div{ /*로딩 이미지*/
    position: fixed;
    top:50%;
    left:50%;
    margin-left: -21px;
    margin-top: -21px;
    z-index: 1000000;
}
.display-none{ /*감추기*/
    display:none;
}


</style>
 
 
<script type="text/javascript">
//왼쪽 메뉴관련 열기, 닫기	
    function setVisibleLeftMenu(n){
        var containerNm = 'container';
        if(document.getElementById('container')==null){
            containerNm = 'ADM_container';
        }
        
        var divLeft = $('#leftPanel')[0];		//왼쪽 메뉴 공간 div
        if(n==0){
            $(divLeft).hide();
            $('#btnLeftMenuHide').hide();	//왼쪽메뉴 숨김버튼 숨기기
            $('#btnLeftMenuShow').show();	//왼쪽메뉴 보기버튼 보이게
            $('#rightPanel').css('width', '100%');	//내용 100%
        }else{		
            $(divLeft).show();
            $('#btnLeftMenuHide').show();
            $('#btnLeftMenuShow').hide();
            $('#rightPanel').css('width', 'auto');	//내용 88%(원복)            
        }
    }

</script>
 
 
<div class="wrap-loading display-none">
    <div><img src="<c:url value='/images/ajax_loading.gif'/>" /></div>
</div>


</head>

<body>
<section id="detail_contents">
	
	<div class="board_classic" style="margin-top:30px;">
		<div class="leftblock" style="width:70%;margin-left:auto;margin-right:auto;">
			<div class="sys_p_noti mgt10 mgb10"><span class="icon_noti"></span><span class="pointB">[순서변경방법]</span><span> Drag & Drop 을 이용해 정렬 후 <strong>순서변경버튼</strong>을 클릭하면 순서를 변경할 수 있습니다.</span></div>
		</div>	
	</div>	
		
	<div class="spending_st_box mgt10" style="width:70%;margin-left:auto;margin-right:auto;">
		<span class="scroll_cover" onclick="javascript:setdayFull('sp_scroll_body');"></span>
		<div class="scroll_header" style="overflow-y:auto;">
		
			<table class="network_tb_st"  style="table-layout:fixed;width:1200px;">
				<colgroup>
					<col width="40">
					<col width="150">
					<col width="100">
					<col width="120">
					<col width="40">
					<col width="120">
					<col width="40">
					<col width="40">
				</colgroup>
				<thead>
					<tr>
						<th style="padding:10px;">번호</th>
						<th><a href="#;" onclick="fnObj.doSort(0);" id="sort_column_prefix0" class="sort_normal">회의실 명<em>오름차순</em></a></th>
						<th><a href="#;" class="sort_normal">회의실 명(축약)</a></th>
						<th><a href="#;" onclick="fnObj.doSort(1);" id="sort_column_prefix1" class="sort_normal">위치<em>오름차순</em></a></th>
						<th><a href="#;" onclick="fnObj.doSort(2);" id="sort_column_prefix2" class="sort_normal">순서<em>오름차순</em></a></th>
						<th>설명</th>
						<th><a href="#;" onclick="fnObj.doSort(3);" id="sort_column_prefix3" class="sort_normal">사용여부<em>오름차순</em></a></th>
						<th>등록자</th>
					</tr>	
				</thead>
			
			</table>
		</div>
		<div class="scroll_body" style="overflow-y:auto;">
			<table class="network_tb_st" id="SGridTarget" style="width:1200px;">
				<colgroup>
					<col width="40">
					<col width="150">
					<col width="100">
					<col width="120">					
					<col width="40">
					<col width="120">
					<col width="40">
					<col width="40">
				</colgroup>
				
				<tbody></tbody>
			</table>
		</div>
	</div>
	
	<div class="spending_st_box mgt10" style="margin-top:20px;width:15%;margin-left:auto;margin-right:auto;">
		<button name="reg_btn" class="btn_standard" onclick="fnObj.openRegMeetingRoomPop(0);" style="border:1px solid #323b5a; background-color:#59647a;">
			<span id="regTxtSpan" style="color:white;">회의실 등록</span>
		</button>
		<button name="reg_btn" class="btn_standard" onclick="fnObj.doSortChange();" style="margin-left:10px; border:1px solid #323b5a; background-color:#59647a;">
			<span id="regTxtSpan" style="color:white;">순서변경</span>
		</button>
	</div>
	
</section>
</body>



<script type="text/javascript">




function setdayFull(knd){
    	var h = '';
    	if(knd == 'week_allday')
    		h = '99px';
    	else
    		h = '450px';

    	if($('.'+knd).css('max-height') == h)
    		$('.'+knd).css('max-height','none');
    	else
    		$('.'+knd).css('max-height', h);
}



//Global variables :S ---------------

//공통코드

var myModal = new AXModal();		// instance
var myGrid = new SGrid();		// instance		new sjs
var mySorting = new SSorting();	// instance		new sjs
//var myPaging = new SPaging();	// instance		new sjs

var g_dataList = [];

var curPageNo = 1;		//현재페이지번호
var g_pageSize = 15;	//페이지크기

//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		
		
	},
	
	//화면세팅
    pageStart: function(){
    	
    	var configObj = {
        		columnCountForEmpty : 7,
        		targetID : "SGridTarget",		//그리드의 id

        		//그리드 컬럼 정보
        		colGroup : [
        		
                {key:"no" ,  		formatter:function(obj){
										var str = '';  	
										str=obj.index+1;
                						 		
										return str ;
				}},
                {key:"meetingRoomNm"},                
                {key:"meetingRoomLocation"},
                {key:"sort"},
                {key:"description"},
                {key:"enable"},
                {key:"createdNm"},
                {key:"meetingRoomId"},
                {key:"titleColor"},
                {key:"meetingRoomNmS"},
                ],


                body : {
                    onclick: function(obj, e){
                    	fnObj.openRegMeetingRoomPop(obj.item.meetingRoomId);
                    }
                }
        };


        	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */

        	var rowHtmlStr = '<tr id="#[7]">';
        	rowHtmlStr +=	 '<td class="b_num">#[0]</td>';
        	rowHtmlStr +=	 '<td class="b_title" style="cursor:pointer;color:#[8];">#[1]</td>';		//td 에 이벤트를 준 케이스
        	rowHtmlStr +=	 '<td class="b_title" style="color:#[8];">#[9]</td>';		//td 에 이벤트를 준 케이스
        	rowHtmlStr +=	 '<td class="b_writer">#[2]</td>';
        	rowHtmlStr +=	 '<td class="b_date">#[3]</td>';
        	rowHtmlStr +=	 '<td class="b_count">#[4]</td>';
        	rowHtmlStr +=	 '<td class="b_count">#[5]</td>';
        	rowHtmlStr +=	 '<td class="b_count">#[6]</td>';
            rowHtmlStr +=	 '</tr>';
        	configObj.rowHtmlStr = rowHtmlStr;


        	myGrid.setConfig(configObj);		//그리드 설정정보 세팅

        	//-------------------------- 그리드 설정 :E ----------------------------
			
        	//-------------------------- 소팅 설정 :S ----------------------------
	    	mySorting.setConfig({
				colList : ['meet.MEETING_ROOM_NM', 'meet.MEETING_ROOM_LOCATION', 'meet.SORT', 'meet.ENABLE'],
				classNameNormal		: 'sort_normal',				//정렬기본 아이콘 css class
				classNameHighToLow	: 'sort_hightolow',				//오름정렬 아이콘 css class
				classNameLowToHigh	: 'sort_lowtohigh'				//내림정렬 아이콘 css class
			});
	    	//-------------------------- 소팅 설정 :E ----------------------------


    	
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
    	
    	var url = contextRoot + "/meetingRoom/getMeetingRoomList.do";
    	var param = {
    					search 	: $("#search").val(),
    					orgId 	: $("#orgSelBox").val(),
    					//pageSize: $("#recordCountPerPage").val(),
    	    			//pageNo	: (page == undefined ? 1 :page),
    	    			sortCol		: mySorting.nowSortCol,
		    			sortVal		: mySorting.nowDirection,
    				};
    	
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var list = obj.resultList;
    		
    		g_dataList = list;
    		

    		myGrid.setGridData({				//그리드 데이터 세팅	*** 2 ***
								list: list,		//그리드 테이터
							});

    		$('#totalCount').text(list.length);

    		mySorting.applySortIcon();		//소팅화면적용
    		
    	};
    	commonAjax("POST", url, param, callback, false);
    	
    },//end doSearch
    
    //컬럼 소팅
    doSort: function(idx){
		mySorting.setSort(idx);				//소팅객체를 소팅한다.(상태값들의 변화)
		fnObj.doSearch(1);
    },
    
  	//순서변경
    doSortChange : function(){  
    	
    	//소팅 시작 숫자.
    	var startSortIdx = 1;
    	
		var trList = $("#SGridTarget tbody").find('tr');
    	var cloneList = g_dataList.clone();
    	
    	
    	//아이디 리스트 순서대로 
    	for(var i=0;i<trList.length;i++){
    		var id = $(trList[i]).attr('id');
    		
    		for(var k=0;k<cloneList.length;k++){
    			
    			if(id == cloneList[k].meetingRoomId) cloneList[k].sort = startSortIdx+i;
    			
        	}
    	}
    	
    	var url = contextRoot + "/meetingRoom/doSortChange.do";
    	var param = {
    					sortList : JSON.stringify(cloneList)
    				};
    	
    	
    	var callback = function(result){
    		
    		
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;	
    		
    		alert("변경되었습니다.");
    		fnObj.doSearch();
    	};
    	
    	commonAjax("POST", url, param, callback, false);
    }, 
    
    //회의실 등록 팝업 
    openRegMeetingRoomPop : function(meetingRoomId){
    	
    	var param ={
    				meetingRoomId	:	meetingRoomId,
    				orgId			:	$("#orgSelBox").val()
		}
		
		var url = contextRoot+"/meetRoom/openRegMeetingRoomPop/pop.do";
		myModal.open({
			url: url,
			pars: param,
			titleBarText: '회의실등록',			//titleBarText 속성 추가하였음.(원 Axisj에는 없었던것)
			method:"POST",
			top: 200,
		   	width: 550,
		   	displayLoading : false,
			closeByEscKey: true				//esc 키로 닫기
		});

		
		$('#myModalCT').draggable();
    }
};
    
   
   
/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	fnObj.pageStart();		//화면세팅
	fnObj.doSearch();
	
	$( '#SGridTarget tbody' ).sortable({
		items: "tr",
	    selectedClass: "selected",
	    sort : function(){},
	    
	
	});
	
});
</script>