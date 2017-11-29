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
<title>공시문서</title>

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
<div id="wrap"> 
	<div class="container">
	        
            
            <!--고객 리스트-->
            <div class="widescroll_wrap" style="overflow:auto;">
            <div class="network_st_box2">
            	<!-- <span class="scroll_cover" onclick="fnObj.showAllGrid();">▼</span> -->
            	<c:choose>
            	<c:when test="${knd eq 'ALL'}">
            	<div style="color:blue;">* DART 분류기준 : <b>전체 공시 문서</b></div>
            	</c:when>            	
            	<c:otherwise>
            	<div style="color:blue;">* DART 분류기준 : <b>정기공시, 외부감사관련</b></div>
            	</c:otherwise>
            	</c:choose>
                <div class="scroll_header">
                    <table class="network_tb_st" style="table-layout:fixed;" summary="고객관리 리스트(이름, 업종, 회사, 기본정보, 네트워크, 최근정보, 시너지와의 이력)">
                        <caption>
                            네트워크 리스트
                        </caption>
                        <colgroup>
                            <col width="35" /> 		<!--번호-->
                            <col width="170" /> 	<!--공시대상회사-->
                            <col width="250" /> 	<!--보고서명-->
                            <col width="140" /> 	<!--제출인-->
                            <col width="100" /> 	<!--접수일자-->
                        </colgroup>
                        <thead>
                            <tr id="tblHeaderPart">
                                <th scope="col">번호</th>
                                <th scope="col">공시대상회사</th>
                                <th scope="col">보고서명</th>
                                <th scope="col">제출인</th>
                                <th scope="col">접수일자</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                
                <div class="scroll_body">
                    <table id="SGridTarget" class="network_tb_st" style="table-layout:fixed;" summary="공시리스트(번호, 보고서명, 제출인, 접수일자)">                        
                        <colgroup>
                            <col width="35" /> 		<!--번호-->
                            <col width="170" /> 	<!--공시대상회사-->
                            <col width="250" /> 	<!--보고서명-->
                            <col width="140" /> 	<!--제출인-->
                            <col width="100" /> 	<!--접수일자-->
                        </colgroup>
                        <tbody>
                        	<!-- ///////////// 내용 //////////// -->
                        </tbody>
					</table>
                        
				</div>
			</div>  
			  
			
            <%--
            <!-- 페이지 목록 -->
	        <div class="btnPageZone" id="btnPageZone">
	            <button type="button" class="pre_end_btn"><em>맨처음 페이지</em></button>
	            <button type="button" class="pre_btn"><em>이전 페이지</em></button>
	           
	            <button type="button" class="next_btn"><em>다음 페이지</em></button>
	            <button type="button" class="next_end_btn"><em>맨마지막 페이지</em></button>
	        </div>
        	<!--/ 페이지 목록 /-->
            --%>
            </div>
            <!--//고객 리스트//-->
            
			<label><a href="#" onclick="fnObj.doSearchAppend();" style="background:#EEEEEE;padding:5px;margin:3px;float:right;"><i class="axi axi-square-plus" style="font-size:15px;"></i> 추가20개</a></label>           
           
	</div>
	
</div>

</body>
</html>




<script type="text/javascript">

//Global variables :S ---------------

var g_cpnId = "${cpnId}";		//상장사코드
var g_knd = "${knd}";			//검색 유형		'ALL':전자공시전체, '':정기공시,외부감사관련

var g_pageNo = 1;				//현재 페이지

var myModal = new AXModal();		// instance


var myGrid = new SGrid();		// instance		new sjs
var myPaging = new SPaging();	// instance		new sjs
var mySorting = new SSorting();	// instance		new sjs


var curPageNo = 1;				//현재페이지번호
var pageSize = 15;				//페이지크기(상수 설정)


var g_gridListStr;										//그리드 데이터 string (객체화되기전 문자열 json... JSON.parse 로 객체로 만들어사용) (증권사 필터링을 위해..)

var g_sortCol = '';		//소팅 컬럼
var g_sortAD = '';		//소팅 방향(A or D)

//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		
		if(isEmpty(g_cpnId)){			//상장사코드가 안 넘어온경우
			alert('상장사코드 누락!');
			window.close();
		}else{
			g_cpnId = g_cpnId.substring(1,10);
		}
		
	},
	
	
	//화면세팅
    pageStart: function(){
    	
    	//-------------------------- 그리드 설정 :S ----------------------------
    	/* 그리드 설정정보 */
    	var configObj = {
    		
    		targetID : "SGridTarget",		//그리드의 id
    		
    		//그리드 컬럼 정보
    		colGroup : [    		
	            {key:"no",			formatter:function(obj){return obj.index+1;}},		//번호
	            {key:"crp_nm" 		},													//공시대상회사
	            {key:"rpt_nm"		},													//보고서명
	            {key:"flr_nm"		},													//제출인
	            {key:"rcp_dt",		formatter:function(obj){return obj.value.substr(0,4)+'-'+obj.value.substr(4,2)+'-'+obj.value.substr(6,2);}}													//접수일자
            ],
            
            body : {
                onclick: function(obj, e){
                	/* ***** obj *****
                		obj.c 		- column index,
						obj.index 	- row index,
						obj.item 	- row data object,
						obj.list 	- grid data object
                	*/
                	if(obj.c > 0){
                		//fnObj.openCstTypePop(obj.item.sNb, obj.item.custType, obj.index, e);
                		var popup = window.open('', 'notice_view', 'toolbar=no,width=1000,height=750,top=100');
                		popup.location.href="http://dart.fss.or.kr/dsaf001/main.do?rcpNo=" + obj.item.rcp_no;
                	}
                	
                }
            }
            
    	};
    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
    	var rowHtmlStr = '<tr>';
    	rowHtmlStr +=	 '<td style="cursor:pointer;">#[0]</td>';
    	rowHtmlStr +=	 '<td class="left_txt" style="cursor:pointer;">#[1]</td>';
    	rowHtmlStr +=	 '<td class="left_txt" style="cursor:pointer;">#[2]</td>';
    	rowHtmlStr +=	 '<td style="cursor:pointer;">#[3]</td>';
    	rowHtmlStr +=	 '<td style="cursor:pointer;">#[4]</td>';
        rowHtmlStr +=	 '</tr>';
    	configObj.rowHtmlStr = rowHtmlStr; 
    	
    	myGrid.setConfig(configObj);		//그리드 설정정보 세팅
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
			colList : ['cstNm', 'cpnNm', 'custTypeNm', 'lastDt', 'rgDt', 'usrNm'],						//['PROJECT_TYPE', 'END_DATE', 'BUDGET_AMT'],
			classNameNormal		: 'sort_normal',				//정렬기본 아이콘 css class
			classNameHighToLow	: 'sort_hightolow',				//오름정렬 아이콘 css class
			classNameLowToHigh	: 'sort_lowtohigh',				//내림정렬 아이콘 css class
			defaultSortDirection: 'DESC'						//기본 정렬 방향
		});
    	//-------------------------- 소팅 설정 :E ----------------------------
    	
    	
    	//-------------------------- 모달창 :S -------------------------
    	/* myModal.setConfig({
    		windowID:"myModalCT",
    		//openModalID:"kkkkk",
    		width:740,
            mediaQuery: {
                mx:{min:0, max:767}, dx:{min:767}
            },
    		displayLoading:true,
            scrollLock: true,
    		onclose: function(){
    			//toast.push("모달 close");

				//if(window[myModal.winID].isSaved == false){		//저장을 안한상태로 창이 닫힐때, 이미 업로드한 파일은 삭제
    			//	window[myModal.winID].fnObj.deleteFile();	//팝업창 내 파일삭제함수 호출.
    			//}    			
    		}
    	}); */
    	//-------------------------- 모달창 :E -------------------------
    	
    },//end pageStart.
  	//################# init function :E #################
    
    
    //################# else function :S #################
    
  	//검색
    doSearch: function(page){
    	
    	if(isEmpty(page)) page = 1;
    	
    	var url = contextRoot + "/dart/getOfficialNoticeList.do";
    	var param = {		    			
    					auth: '5f9cfe3e3a9309d678e7f5b99cc74cfb968daf6d',	//인증키
    					crp_cd: g_cpnId,									//상장사 코드
    					start_dt: '19990101',								//정보검색 시작일
    					dsp_tp: g_knd=='ALL'?'A,B,C,D,E,F,G,H,I,J':'A,F',										//정기공시 'A', 외부감사관련 'F'    					
    					page_no: page,										//페이지 번호
    					page_set: 20										//한페이지 글수
    					
		    		};
    	
    	//alert(JSON.stringify(param));
    	//return;
    	
    	var callback = function(result){
    		    		
    		var rslt = JSON.parse(result);
    		var obj = JSON.parse(rslt.resultObject);
    		
    		var cnt = obj.total_count;		//결과수		... 전체페이지수 total_page
    		var list = obj.list;			//결과 list

    		//alert(JSON.stringify(list));
    		//alert(list.length);
    		//return;
    		
    		myGrid.setGridData({				//그리드 데이터 세팅	*** 2 ***
								list: list		//그리드 테이터
								//,page: pageObj	//페이징 데이터
    						});
    		
    		g_pageNo = page;						//현재 페이지
    		
    		//g_gridListStr = result;				//따로 전역변수에 넣어둔다
    		
			
			//전체 건수 세팅
			//$('#total_count').html(cnt);
			
			
			//소팅 초기화
			//mySorting.clearSort();
			//----- 하단 기본 소팅 설정은 기본정책에 따라 바꿔준다. 
			
			//mySorting.setSort(3);				//소팅객체를 소팅한다.(상태값들의 변화)
			//mySorting.applySortIcon();			//소팅화면적용
    	};
    	
    	//로딩 이미지 보여주기 위한 리스너 함수 :S -----------
    	var beforeFn = function(){
    		// 로딩 이미지 보여주기 처리
    		$('.wrap-loading', document).removeClass('display-none');
    	};
    	var completeFn = function(){
    		// 로딩 이미지 감추기 처리
	        $('.wrap-loading', document).addClass('display-none');
    	};
    	//로딩 이미지 보여주기 위한 리스너 함수 :E -----------
    	
    	
    	commonAjax("POST", url, param, callback, true, beforeFn, completeFn);
    	
    },//end doSearch
    
    
  	//추가검색
    doSearchAppend: function(){
    	var page = 0;
    	
    	if(isEmpty(g_pageNo)) g_pageNo = 1;
    	page = ++g_pageNo;
    	
    	var url = contextRoot + "/dart/getOfficialNoticeList.do";
    	var param = {		    			
    					auth: '5f9cfe3e3a9309d678e7f5b99cc74cfb968daf6d',	//인증키
    					crp_cd: g_cpnId,									//상장사 코드
    					start_dt: '19990101',								//정보검색 시작일
    					dsp_tp: g_knd=='ALL'?'A,B,C,D,E,F,G,H,I,J':'A,F',										//정기공시 'A', 외부감사관련 'F'    					
    					page_no: page,										//페이지 번호
    					page_set: 20										//한페이지 글수
    					
		    		};
    	
    	var callback = function(result){
    		    		
    		var rslt = JSON.parse(result);
    		var obj = JSON.parse(rslt.resultObject);
    		
    		var cnt = obj.total_count;		//결과수		... 전체페이지수 total_page
    		var list = obj.list;			//결과 list

    		myGrid.setGridData({				//그리드 데이터 세팅	*** 2 ***
								list: myGrid.getList().concat(list)		//그리드 테이터
								//,page: pageObj	//페이징 데이터
    						});
    		
    	};
    	
    	//로딩 이미지 보여주기 위한 리스너 함수 :S -----------
    	var beforeFn = function(){
    		// 로딩 이미지 보여주기 처리
    		$('.wrap-loading', document).removeClass('display-none');
    	};
    	var completeFn = function(){
    		// 로딩 이미지 감추기 처리
	        $('.wrap-loading', document).addClass('display-none');
    	};
    	//로딩 이미지 보여주기 위한 리스너 함수 :E -----------
    	
    	
    	commonAjax("POST", url, param, callback, true, beforeFn, completeFn);
    	
    },//end doSearchAppend
    
    
  	//컬럼 소팅
    doSort: function(idx){
    	// 로딩 이미지 보여주기 처리
		$('.wrap-loading').removeClass('display-none');
	
    	//--------------------
    	mySorting.setSort(idx);				//소팅객체를 소팅한다.(상태값들의 변화)
    	
		//소팅
        sortByKey(myGrid.getList(), mySorting.nowSortCol, mySorting.nowDirection);
        myGrid.refresh();
         
        
		mySorting.applySortIcon();			//소팅화면적용
		//--------------------
		
		// 로딩 이미지 감추기 처리
        $('.wrap-loading').addClass('display-none');
    }
    
    
  	//################# else function :E #################
  	
  	
    
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	fnObj.pageStart();		//화면세팅
	fnObj.doSearch(1);		//검색
	
});
</script>