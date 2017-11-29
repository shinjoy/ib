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


<%-- ========= 관리 권한자 설정 :S ========= --%>
<c:set var="mgmtRoleA" value="N" />
<c:set var="mgmtRoleB" value="N" />
<c:if test="${ userLoginInfo.id eq 'kmy'
			or userLoginInfo.id eq 'jyl' 
			or userLoginInfo.id eq 'mjy' 
			or userLoginInfo.id eq 'kes' 
			or userLoginInfo.id eq 'kbm' 
			or userLoginInfo.id eq 'shr' 
			or userLoginInfo.id eq 'pjh'
										}" >
	<c:set var="mgmtRoleA" value="Y" />
	<c:set var="mgmtRoleB" value="Y" />
</c:if>

<c:if test="${userLoginInfo.permission ge '00020'	}" >
	<c:set var="mgmtRoleA" value="Y" />
</c:if>
<%-- ========= 관리 권한자 설정 :E ========= --%>


<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>지출</title>

<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/card.js'/>" ></script>
<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<%--
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
--%>
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
.btn_calendar {
    background: url(../images/common/board/btn_board_collection.gif) no-repeat;
    width: 18px;
    height: 18px;
    display: inline-block;
    vertical-align: middle;
    background-position: -27px 3px;
    padding: 3px 8px 5px 0px;
    font-size: 11px;
}
.applyinput_B {
    border: #cfcfcf solid 1px;
    height: 22px;
    background: #fff;
    vertical-align: middle;
    text-indent: 4px;
    box-sizing: border-box;
    border-radius: 0;
    font-size: 11px;
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

.select_m{
	background:#40f3e3;
	font-weight:bold;
}
.btn_standard{
	border-radius:2px;
	padding:4px 8px 4px 8px;
	margin-left:7px;
}
.btn_inner{
	border-radius:2px;
	font-size:12px;
	padding:0px 3px 0px 3px;
	margin-left:10px;
}

.sum_table{
	margin-top:10px;
	margin-left:30%;
	width: 70%;
	border-top:#b9c1ce solid 2px;
	border-bottom:#b9c1ce solid 1px;
	border-left:#b9c1ce solid 1px;
}
.sum_table td{
	border-right:#b9c1ce solid 1px;
}
.month_tag{
	padding: 5px;
	border:1px solid #b9b5b5;
}
.click_memo{
	background:#f1f705;
}
.network_tb_st thead th {
    background: #2ba4ca;
    font-weight: bold;
    color: white;
    line-height: 1.4;
    padding: 3px 3px 3px;
    text-align: center;
    border-right: #1577a0 solid 1px;
    border-bottom: #237fab solid 1px;
    font-size: 13px;
    vertical-align: middle;
    letter-spacing: -0.05em;
}
.display-none{ /*감추기*/
    display:none;
}
.tabDiv{
	width: 100%;
    background: #4a6382;
    height: 30px;
    border-bottom: 1px solid rgb(117, 119, 132);
}
.btn_close{
 	margin: 5px;
 	padding:3px 5px 3px 5px;
 	border: 1px solid #ffffff;
 	vertical-align: middle;
}
.inner_p{
	padding-left:10px;
	font-weight:bold;
}
.top_p{
	color:red;
	font-size:13px;
}


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


<!--====================== 도움말풍선 : S ===================-->
<div id="balloon" style="z-index:65;display:none;position:absolute;left:910px;top:110px;width:520px;height:450px;background-color:rgb(212, 255, 254);padding-left:10px;border-radius:20px;border:1px dotted rgb(7, 175, 177);">
<div>
<br>
<span>
<p class="top_p" ><b>#일정 필수 항목 - 영업관련 및 대중교통비,부서회식 [해당건에 대한 일정을 등록 후 사용]</b></p>
<p class="inner_p" style="padding-top:7px;">1. 점심,저녁업무 : 해당건에 대한 일정(점심미팅,저녁미팅)</p>
<p class="inner_p" >2. 외 : 해당건에 대한 일정</p>
<p class="top_p" style="padding-top:7px;"><b>#영업관련 입력 시 대상자 필수</b></p>
<p class="inner_p" style="padding-top:7px;">1. 대상자 외 1명 이상 -추가대상자 입력</p>
<p class="top_p" style="padding-top:7px;"><b>#대중교통비 입력 시 출발지 목적지 기재</b></p>
<p class="top_p" style="padding-top:7px;"><b>#소모품 입력 시 구입품목 개별 기재</b></p>
<p class="top_p" style="padding-top:7px;"><b>#신규추가 항목</b></p>  
<p class="inner_p" style="padding-top:7px;">1. 고객과의 점심이 아닌 일상적인 점심은 [복리후생]-[점심-직원]</p>
<p class="inner_p" >2. 영업 관련 고객 선물이나 기타 물품 구매 비용은 [업무-기타]</p>
<p class="top_p" style="padding-top:10px;"><b># 사용규정(제한) #</b></p>
<p class="inner_p" style="padding-top:7px;">1. 접대 또는 회식 후 귀가 택시비  </p>
<p class="inner_p" >2. 2차 접대 비용</p>
<p class="inner_p" >3. 직원 간 단순 친목을 위한 일정에 등록되지 않은 소규모 회식</p>
<p class="inner_p" >4. 접대가 아닌 식사 후 음료 및 간식구입 비용 등</p>
<p class="inner_p" >5. 야근식대 퇴근 시간 9시 이전, 야근식대 1인당 1만원 초과</p>
<p class="inner_p" >5. 점심식대 1인당 1만원 초과</p>
<p class="inner_p" >------위의 사항은 인정되지 않음.</p>

</span>
</div> 
</div>
<!--====================== 도움말풍선 : E ===================-->
</head>
<!--====================== 메모 박스 : S ===================-->
<input type="hidden" id="cardSnb"/> <!-- 메모 등록시 snb 세팅-->
<div id="memoArea" style="display:none; position:absolute; width:25%;box-shadow: 0 2px 6px hsla(0, 0%, 0%, 0.25);  height: expression( this.scrollHeight > 99 ? 200px : auto );border:1px solid rgb(117, 119, 132);border-radius: 2px; background-color:#ffffff; z-index:1;" >
	<div class="tabDiv">
		<p style="padding: 4px 6px;font-weight:bold;font-size:13px;color:white;float:left;">*메모</p>
		<p style="padding-top: 4px;float:right;color:white;"><i class="axi axi-ion-android-close btn_close" style="cursor:pointer" onclick="fnObj.eleMemoDiv();"></i></p>
	</div>		
</div>
<!--====================== 메모 박스 : E ===================-->
<body>
<input type="hidden" id="usrId">
<div id="wrap"> 
	<div class="container">
		<div id="wholePanel">
			<!--============== LEFT MENU : S =============-->	
		    <div id="leftPanel" style="min-height:950px;" >
		        <%-- <div class="favormenu"></div>--%>
		        <a href="#" onclick="setVisibleLeftMenu(0);" id="btnLeftMenuHide" class="btn_leftmn_cl"><em>레프트 메뉴닫기</em></a>
				<div class="custManagerGap"></div>
				<div class="custManager">사원 선택</div>
				
				<c:if test="${mgmtRoleA eq 'Y'}">
					<div class="showManaAll"><label><input type="checkbox" onclick="fnObj.selStaff('ALL');" id="chkboxShowAll"/> 전체보기</label></div>
				</c:if>
				
		       	<div class="tNav">
		       		<span id="spanStaffTree"></span>	<!-- 담당자 선택 트리  -->
		        </div>
		    </div>
    		<!--============== LEFT MENU : E =============-->	
    		<!--============== RIGHT MENU : S =============-->	
		    <div id="rightPanel" style="min-height:950px;">
		    	<input type="hidden" id="choiceMonth"/>
		    	<a href="#" onclick="setVisibleLeftMenu(1);" id="btnLeftMenuShow" class="btn_leftmn_op"><em>레프트 메뉴열기</em></a> 
		        <!--tab-->
		         <div class="gtabZone">
		        	<ul>
		            	<li class="on"><a href="#">법인카드사용내역</a></li>
		                <%--<li><a href="#">담당자별 고객관리</a></li> --%>
		            </ul>
		            <ul>
		            	<li class="off"><a href="javascript:goMenuCard();">지출리스트</a></li>
		                <%--<li><a href="#">담당자별 고객관리</a></li> --%>
		            </ul>
		            
       			</div>
		        <!--//tab//-->
		        <div id="containerWrap">
		            
		            <div class="tb_titleZone">
		            	<div class="title">
		            		<b>총 <span id="total_count"></span> 건</b>
		           			<span id="searchCorpType" style="margin-left:10px;"></span>  <!-- 분류 -->
		            		<button type="button" name="reg_btn" class="btn_standard" onclick="fnObj.clickSearch();" style="border:1px solid #bdc9d6; background-color:#e5e8ea;">검색</button>
		            		<!-- <a id="qNa" style="cursor:pointer;"><span style="vertical-align: middle;padding-left:30px;font-size:16px;color:red;"><i id="qNa" class="axi axi-json-undefined3"></i></span> -->
		            		<!--  <span style="font-size:14px;color:red;">도움말</span></a> -->
		            	</div>
		                <div class="btnBox" style="padding-top:3px;">		                			                	
		                	<c:if test="${mgmtRoleA eq 'Y'}">
		                		<button name="reg_btn" class="btn_standard" onclick="fnObj.goStatistics();" style="border:1px solid #095792; background-color:#387cc8;"><span id="regTxtSpan" style="color:white;">지출통계</span></button>
								<button name="reg_btn" class="btn_standard" onclick="fnObj.alarmReg();" style="border:1px solid #bdc9d6; background-color:#e5e8ea;">공지등록</button>		                		
							</c:if>
		                </div>
		            </div><!-- tb_titleZone -->
		            
		            <div class="widescroll_wrap">
		           	<div class="network_st_box">
		            	<span class="scroll_cover" onclick="fnObj.showAllGrid();">▼</span>
		            	  <!--================= 상단 table : S ================-->
			                <div class="scroll_header">
			                    <table class="network_tb_st" style="table-layout:fixed;" summary="고객관리 리스트(이름, 업종, 회사, 기본정보, 네트워크, 최근정보, 시너지와의 이력)">
			                        <caption>
			                          	 지출 리스트
			                        </caption>
			                        <colgroup>
			                            <col width="80" />  <!--지출일자-->
			                            <col width="100" /> 	<!--소유자-->                            
			                            <col width="80" /> 	<!--법인-->
			                            <col width="50" /> 	<!--소유자-->
			                            <col width="50" /> <!--금액-->
			                            <col width="120" /> <!--사용처-->
			                            <col width="70" /> <!--상태-->
			                            <col width="40" /> <!--지연횟수-->				                            
			                        </colgroup>
			                        <thead>
			                            <tr id="tblHeaderPart">
			                                <th scope="col"><a href="#" onclick="fnObj.doSort(0);" id="sort_column_prefix0" class="sort_normal" style="color:white;">지출일자</a></th>
			                                <th scope="col">카드번호</th>
			                                <th scope="col">법인</th>
			                                <th scope="col">소유자</th>
			                                <th scope="col">금액(단위:원)</th>
			                                <th scope="col">사용처</th>
			                                <th scope="col">상태</th>
			                                <th scope="col">지연횟수</th>
			                            </tr>			                            
			                        </thead>
			                    </table>
			                </div>
		                 <!--================= 상단 table : E ================-->
		                 
		                 <!--============ scroll_body 내용 : S ===============-->
		                 	<div class="scroll_body" style="height:450px;">
			                    <table id="SGridTarget" class="network_tb_st" style="table-layout:fixed;" summary="고객관리 리스트(이름, 업종, 회사, 기본정보, 네트워크, 최근정보, 시너지와의 이력)">
			                    	<colgroup>
			                            <col width="80" />  <!--지출일자-->
			                            <col width="100" /> 	<!--소유자-->                            
			                            <col width="80" /> 	<!--법인-->
			                            <col width="50" /> 	<!--소유자-->
			                            <col width="50" /> <!--금액-->
			                            <col width="120" /> <!--사용처-->
			                            <col width="70" /> <!--상태-->
 										<col width="40" /> <!--지연횟수-->						   
			                        </colgroup>
			                        <tbody></tbody>
			                     </table>
			              	</div>
			              <!--============ scroll_body 내용 : E ===============-->
		         	</div> <!--network_st_box  -->
		         	<label><a href="#" onclick="fnObj.showAllGrid();" class="btn_wh_bevel sort_normal" style="width:26px;">펼침</a></label>
		           	<!--========================== 합계 :S =======================-->
		           	
		           	<!--=========================== 합계 :E =========================-->
		        </div><!-- widescroll_wrap -->
		        </div><!-- containerWrap -->
		    </div><!-- rightPanel -->
		    <!--============== RIGHT MENU : E =============-->	
		</div><!-- wholePanel -->
	</div><!-- container -->
</div><!-- Wrap -->
</body>
</html>

<script type="text/javascript">
function newMap() {
	  var map = {};
	  map.value = {};
	  map.getKey = function(id) {
	    return "k_"+id;
	  };
	  map.put = function(id, value) {
	    var key = map.getKey(id);
	    map.value[key] = value;
	  };
	
	  map.get = function(id) {
	    var key = map.getKey(id);
	    if(map.value[key]) {
	      return map.value[key];
	    }
	    return null;
	  };
	
	  return map;
}
//Global variables :S ---------------

//공통코드
var comCodeCstType;			//고객구분

var myGrid = new SGrid();		// instance		new sjs
var mySorting = new SSorting();	// instance		new sjs

var g_chargeType = '';									//담당자 타입	...	'all':전체보기, 'notyet':미담당보기, '':특정담당자, 'new':신규등록고객(꼽사리)
var g_chargeStaffCusId = '${userLoginInfo.cusId}';		//담당자 사원 고객id ... 담당자 일경우 (처음에는 로그인 사용자 고객id)
var g_division ="${userLoginInfo.division}";
var g_staffList = new Array();							//담당자 전체 리스트 ... [{cusId:'123', usrNm:'시너지'}]
var g_sabun ="${userLoginInfo.sabun}";					//로그인유저사번
var g_loginId ="${userLoginInfo.id}";					//로그인유저아이디
var g_permission ="${userLoginInfo.permission}";		//permission
var g_deptId ="${userLoginInfo.deptId}";				//teamId
var g_deptMngr ="${userLoginInfo.deptMngr}";			//부서장 사번
var g_sortCol = '';		//소팅 컬럼
var g_sortAD = '';		//소팅 방향(A or D)

var dv2List=[];				//dv2 리스트
var dvList=[];				//dv 리스트

var cardList;
var corpList = ${corpList};

//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		
		//공통코드		
		fnObj.searchCorpTypeSetting();	// 법인검색 분류 세팅
    },
	//화면세팅
    pageStart: function(){
    	
    	/*=========================================== 달력 세팅 : S ===========================================*/
    	
    	/*=========================================== 달력 세팅 : E ===========================================*/
    	
    	this.setStaffTreeMenu();		//담당자 선택 트리 메뉴 세팅
    	
    	//-------------------------- 그리드 설정 :S ----------------------------
    	/* 그리드 설정정보 */
    	var configObj = {
    		
    		targetID : "SGridTarget",		//그리드의 id
    		
    		//그리드 컬럼 정보
    		colGroup : [    		
            {key:"tmDt", formatter:function(obj){return obj.item.tmDt.replace(/-/gi,'/');}},// 지출일
            {key:"cardNum", formatter:function(obj)
            	{
             		return obj.item.cardNum.substring(0,4) + '***********' + obj.item.cardNum.substring(12,16);
            	}
            },			//지출일
            {key:"corpName" 	 },            
            {key:"usrNm"	},																// 소속회사
            {key:"approvalCost", formatter:function(obj)
            	{
            		return Number(obj.item.approvalCost).toLocaleString();
            	}
            },	//금액																		// 소속회사
            {key:"placeName"	},															// 장소
            {key:"statusFlag", formatter:function(obj)
            	{            	
            	var htmlTxt='';
            	htmlTxt += obj.item.statusFlag=='N'?'미등록':'등록완료';
            	
            	/* 본인이 사용한 내역 또는 관리자(김은실:kes, 김보미:kbm) 일 경우 삭제 가능 */
            	if(obj.item.sabun == g_sabun 
            	|| g_loginId == 'kes' || g_loginId == 'kbm' ){
            		htmlTxt += '<button name="reg_btn" class="btn_inner" onclick="javascript:fnObj.doDelete('+obj.item.sNb+');" style="border:1px solid #e4212d; background-color:#f14953;"><span id="regTxtSpan" style="color:white;">삭제</span></button>';
	            }
            	return htmlTxt;
            	}
            },
            {key:"regLateCount"	},
            {key:"regLateFlag"	},
            {key:"tmDate"	},
            {key:"sNb"	},
            {key:"sabun"	}							// 사번
            ],
            
            body : {
                onclick: function(obj, e){
                	/* ***** obj *****
                		obj.c 		- column index,
						obj.index 	- row index,
						obj.item 	- row data object,
						obj.list 	- grid data object
                	*/
                	//alert(obj.item.tmDt);
                	
                	// sNb 값이 0이 아닌것으로 법인카드등록건인지 아닌지 판단
                	if( obj.c >= 0 && obj.c <= 5 ){
                		fnObj.cardReg(0,obj.item.tmDate,obj.item.approvalCost, obj.item.placeName, obj.item.sNb);	
                	}       
                }
            }
            
    	};
    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
    	var rowHtmlStr = '<tr class="excelContentRow" style="cursor:pointer">';	
    	rowHtmlStr +=	 '<td>#[0]</td>';											//지출일자
    	rowHtmlStr +=	 '<td>#[1]</td>';											//카드번호
    	rowHtmlStr +=	 '<td>#[2]</td>';											//법인
    	rowHtmlStr +=	 '<td>#[3]</td>';											//소유자
    	rowHtmlStr +=	 '<td class="right_txt"><strong>#[4]</strong></td>';		//금액			
    	rowHtmlStr +=	 '<td style="cursor:pointer;color:blue;">#[5]</td>';		//사용처								
    	rowHtmlStr +=	 '<td >#[6]</td>';											//상태
    	rowHtmlStr +=	 '<td >#[7]</td>';											//지연횟수										//상태
		rowHtmlStr +=	 '</tr>';
    	configObj.rowHtmlStr = rowHtmlStr; 
        
    	
    	myGrid.setConfig(configObj);		//그리드 설정정보 세팅
    	//-------------------------- 그리드 설정 :E ----------------------------
    	//-------------------------- 소팅 설정 :S ----------------------------    	
    	 mySorting.setConfig({
			colList : ['tmDt', 'usrNm'],				//['지출일', '항목', '등록자'],
			classNameNormal		: 'sort_normal',				//정렬기본 아이콘 css class
			classNameHighToLow	: 'sort_hightolow',				//오름정렬 아이콘 css class
			classNameLowToHigh	: 'sort_lowtohigh',				//내림정렬 아이콘 css class
			defaultSortDirection: 'DESC'						//기본 정렬 방향
		});
    	//-------------------------- 소팅 설정 :E ----------------------------
    	
    	
    	
    	//LEFT 사원 기본 세팅
    	if('${mgmtRoleB}' == 'Y'){	//전체보기		g_permission >= '00020' || 
    		$("#chkboxShowAll").prop("checked",true);
    		fnObj.selStaff('ALL');																		//기본 전체 선택
    	}
    	/*else if(g_deptMngr == g_sabun){																//팀장		팀장도 일단 본인것만 보이고 팀원 활성화 20170522
    		$("#deptSeq_"+g_deptId).prop("checked",true);
    		fnObj.selStaff(g_deptId);
    	}*/
    	else{																							//나
    		$('input[name="chkboxStaff"][value="'+ g_loginId +'"]').prop("checked",true);
    		fnObj.selStaff('');
    	}
    	
    },//end pageStart.
 
    // 삭제
    doDelete: function(sNb) {
    	/*
    	var data = '소유자 : ' + usrNm  + '\n';
    	data += '금액 : ' + cost + '\n';
    	data += '사용처: ' + place + '\n\n';
    	data += '법인카드 사용내역을 삭제하시겠습니까?';
    	*/
    	if( confirm('법인카드 사용내역을 삭제하시겠습니까?') == false ) return;
    		
    	// 취소 처리
		var url = contextRoot + "/card/deleteCardCorpUsed.do";
    	var param = {
    			cardCorpSnb		 		: sNb				// 카드사용내역 ID값    					    					
		};
    	    	
    	var callback = function(result){    		
    		var obj = JSON.parse(result);
    		if( obj.resultVal == 1 ){
    			alert('성공적으로 삭제되었습니다.');
    			fnObj.doSearch();
    		}  
    		
    	};
    	
    	//실패처리
    	var failFn = function(result){    		
    	};
    	
    	commonAjaxForFail("POST", url, param, callback, failFn);
    },
    
    
  	//검색
    doSearch: function(){    	
    	
    	var corpType = $("#corpType").val();
    			
		var url = contextRoot + "/card/getCardCorpUsedList.do";
    	var param = {
    					corpNum 		: corpType,				//법인사업자번호
    					statusFlag		: 'N',					//처리여부 Y:등록완료, N:미등록
    					approvalYn 		: 'Y',					//카드승인여부 Y:승인, N:미승인/취소    					
    					usrId 			: $("#usrId").val(),	// 로그인 ID
    					checkCount		: $('input:checkbox[name="chkboxStaff"]:checked').length
    				};
    	    	
    	var callback = function(result){    		
    			
    		var obj = JSON.parse(result);    		
    		cardList = obj.resultList;    		
    		myGrid.setGridData({					//그리드 데이터 세팅	*** 2 ***
				list: cardList		//그리드 테이터
			});
    		
    		g_gridListStr = result;					//따로 전역변수에 넣어둔다
    		//전체 건수 세팅
			$('#total_count').html(' '+ obj.resultVal);			
			
			//소팅 초기화
			mySorting.clearSort();
			//----- 하단 기본 소팅 설정은 기본정책에 따라 바꿔준다. 
			//mySorting.nowDirection = 'DESC';
			mySorting.setSort(0);				//소팅객체를 소팅한다.(상태값들의 변화)
			mySorting.applySortIcon();			//소팅화면적용
			
    	};
    	
    	var failFn = function(result){
    		//실패처리
    	};
    	
    	//commonAjax("POST", url, param, callback, failFn, false, '', '');
    	
    	//로딩 이미지 보여주기 위한 리스너 함수 :S -----------
    	var beforeFn = function(){
    		// 로딩 이미지 보여주기 처리
    		$('.wrap-loading', parent.mainFrame.document).removeClass('display-none');
    	};
    	var completeFn = function(){
    		// 로딩 이미지 감추기 처리
	        $('.wrap-loading', parent.mainFrame.document).addClass('display-none');
    	};
    	//로딩 이미지 보여주기 위한 리스너 함수 :E -----------
    	
    	
    	commonAjax("POST", url, param, callback, true, beforeFn, completeFn);
    	
    },//end doSearch
    
    //LEFT 사원 선택
    selStaff : function(type){ //type : ALL 전체선택 , 빈값 : 개별선택 , 이외 : 부서SEQ 
    	var userList = [];
    	var userStr = '';
    	
    	if(type == 'ALL'){
    		if($('input:checkbox[id="chkboxShowAll"]').is(":checked") == true){
    			$('input:checkbox[name="chkboxDept"]').prop("checked",true);		//부서 체크박스
    			$('input:checkbox[name="chkboxStaff"]').prop("checked",true);		//시원 체크박스
    		}else{
    			$('input:checkbox[name="chkboxStaff"]').prop("checked",false);		//부서체크박스
    			$('input:checkbox[name="chkboxDept"]').prop("checked",false);		//사원체크박스 
    		}
    		
    	}else if(type !=''){
    		if($('input:checkbox[id="deptSeq_'+type+'"]').is(":checked") == true){	//부서체크박스
    			$('input:checkbox[class="deptSeq_'+type+'"]').prop("checked",true);	//deptSeq_부서SEQ 를 class 로 가지고있는 체크박스 세팅
    		}else{
    			$('input:checkbox[class="deptSeq_'+type+'"]').prop("checked",false);
    		}
    	}
    	$('input:checkbox[name="chkboxStaff"]:checked').each(function(){
	 	    	userList.push($(this).val());
	    });
    	if(userList.length>0){
	    	userStr = userList.join(',');
	    }
    	
    	if(userList.length != $('input:checkbox[name="chkboxStaff"]').length){
    		$("#usrId").val(userStr);
    	}else{
    		$("#usrId").val('');
    	}
    	fnObj.doSearch();
    },
    
    /* ====================================== 팝업 관련 : S ===================================*/
    
    //지출등록팝업
    cardReg: function(sNb, tmDt, approvalCost, placeName, cardCorpSnb){
    	
    	var param = {
    			cardSnb 		: sNb,				// 카드번호
    			tmDt			: tmDt,				// 승인시각
    			approvalCost 	: approvalCost,		// 승인금액    					
    			placeName 		: placeName,		// 가맹점
    			cardCorpSnb		: cardCorpSnb		// 법인카드번호
			};

    	// 동적 팝업 윈도우 POST 방식으로 보내기 - 유틸에 포함시키는게 좋을듯 함
    	var targetTitle = "cardRegPopup";
    	var option = "left=" + (screen.width > 1400?"700":"0") + ", top=" + (screen.height > 810?"100":"0") + ", width=900, height=860, menubar=no, status=no, toolbar=no, location=no, scrollbars=yes, resizable=no";
    	window.open("", targetTitle, option);
    	send_to_post("${pageContext.request.contextPath}/card/regCard.do", param, "post", targetTitle);    	
    },
    
	/* ====================================== 팝업 관련 : E ===================================*/
	    
   	//엑셀다운로드
    excelDownList: function(){
    	var htmlStr = "<table>";
    	htmlStr += '<tr bgcolor=silver><td>지출일자</td><td>항목</td><td>금액</td><td>소속회사</td><td>이름</td><td>장소</td><td>지출내용</td><td>시너지참석자</td><td>등록자</td><td>상태</td></tr>';
    	htmlStr += $('#SGridTarget').html().replace(/checkbox/gi,'hidden').replace(/<em>선택<\/em>/gi, '').replace(/img/gi, 'hidden').replace(/수정/gi, '');
    	htmlStr += "</table>";    	
    	excelDown(htmlStr, '지출'+(new Date().yyyy_mm_dd()));	
    },
   	
    //엑셀다운(html table to excel)
    excelDown: function(htmlStr, fileName, sheetName){	//excelDown(html문자열, 파일명, 시트명)
    	var sheetNm = '다운로드';
    	if(sheetName!=null) sheetNm = sheetName;
    		
    	var tableToExcel = (function() {
        	var uri = 'data:application/vnd.ms-excel;base64,'
        	, template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
        	, base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))); }
        	, format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }); };
        	
        	return function() {	    	
    	    	var ctx = {worksheet: sheetNm || 'Worksheet', table: htmlStr};	    	
        		var link = document.createElement('a');
    			link.download = fileName;
    			link.href = uri + base64(format(template, ctx));
    			link.click();	    	
        	};
        })();	
    	tableToExcel();
    },
    
    /* ====================================== 화면 세팅 관련 : S ===================================*/
    
    //담당자 선택 트리 메뉴
    setStaffTreeMenu: function(){
    	
    	var url = contextRoot + "/common/getStaffList.do";
    	var param = {division : g_division};
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
    		
    		var disabledValue = 'disabled = disalbed';
			// 관리자급 외에는 본인만 강제 선택되도록 설정
    		if('${mgmtRoleA}' == 'Y'){
				disabledValue = '';
			}
			//팀장은 팀원들것을 선택적으로 볼 수 있도록 활성화
			var mngrTeam = '';
			if(${userLoginInfo.deptMngr eq userLoginInfo.sabun}){
				mngrTeam = '${userLoginInfo.deptId}';
			}
			
    		
    		//------------------------- 받아온 사원 데이터로 트리 세팅 :S --------------------------    		
    		
    		//-------- 트리 데이터 세팅
    		
    		var treeHtmlStr = '';
    		var team = '';		//팀(부서)
    		var foldSeq = [3,8,11];	//팀(부서)중 트리메뉴에서 처음 접을 부서코드 ... 3:경영지원, 6:벤처투자팀, 8:시스템기획팀, 9:오픈플랫폼팀, 10:고객관리, 11:파트너
    		for(var i=0; i<cnt; i++){
    			if(team != list[i].deptSeq){	//부서가 달라질때
    				if(i>0){
    					treeHtmlStr += '</ul>';
    		    		treeHtmlStr += '</li>';
    				}
    				//division 이 달라질때 ---------------
        			if(i==0){
        				treeHtmlStr += '<ul><li><a href="#"><label>시너지</label></a><ul>';
        			}
        			if(i>0 && list[i-1].division != list[i].division){
        				treeHtmlStr += '</ul></li></ul><ul><li> <a href="#"><label>' + list[i].divisionNm + '</label></a><ul>';
        			}
        			//----------------------------------
        			team = list[i].deptSeq;
        			
    				treeHtmlStr += '<li ' + ((list[i].division == g_division)?' class="active"':'') + '><label><input type="checkbox" name="chkboxDept" id="deptSeq_'+team+ '" ' + (team!=mngrTeam?disabledValue:'') + ' onclick="fnObj.selStaff('+team+');" />' + list[i].deptNm + '</label>';
    				treeHtmlStr += '<ul>';
    	    		
    			}
    			    			
    			treeHtmlStr += '<li><label><input type="checkbox" id="staff_'+list[i].usrId+'" class="deptSeq_'+team+ '" ' + (team!=mngrTeam?disabledValue:'') + ' onclick="fnObj.selStaff(\'\');" name="chkboxStaff" value="' + list[i].usrId + '" />' + list[i].usrNm + '</label></li>';
    			
    			if(i==cnt-1){	//마지막 일때
    				treeHtmlStr += '</ul>';
		    		treeHtmlStr += '</li>';
    			}
    			//------------- [{cusId,usrNm}] -----
    			g_staffList.push({cusId:list[i].cusId, usrNm:list[i].usrNm});
    			
    		}
    		
    		treeHtmlStr += '</ul>';
    		treeHtmlStr = treeHtmlStr + '</li></ul>';
    		$('#spanStaffTree').html(treeHtmlStr);
    		//-------- 트리 스타일 세팅
    		
    		// Tree Navigation
        	var tNav = $('.tNav');
        	var tNavPlus = '\<button type=\"button\" class=\"tNavToggle plus\"\>+\<\/button\>';
        	var tNavMinus = '\<button type=\"button\" class=\"tNavToggle minus\"\>-\<\/button\>';
        	tNav.find('li>ul').css('display','none');
        	tNav.find('ul>li:last-child').addClass('last');
        	tNav.find('li>ul:hidden').parent('li').prepend(tNavPlus);
        	tNav.find('li>ul:visible').parent('li').prepend(tNavMinus);
        	tNav.find('li.active').addClass('open').parents('li').addClass('open');
        	tNav.find('li.open').parents('li').addClass('open');
        	tNav.find('li.open>.tNavToggle').text('-').removeClass('plus').addClass('minus');
        	tNav.find('li.open>ul').slideDown(100);
        	$('.tNav .tNavToggle').click(function(){
        		t = $(this);
        		t.parent('li').toggleClass('open');
        		if(t.parent('li').hasClass('open')){
        			t.text('-').removeClass('plus').addClass('minus');
        			t.parent('li').find('>ul').slideDown(100);
        		} else {
        			t.text('+').removeClass('minus').addClass('plus');
        			t.parent('li').find('>ul').slideUp(100);
        		}
        		return false;
        	});
        	$('.tNav a[href=#]').click(function(){
        		t = $(this);
        		t.parent('li').toggleClass('open');
        		if(t.parent('li').hasClass('open')){
        			t.prev('button.tNavToggle').text('-').removeClass('plus').addClass('minus');
        			t.parent('li').find('>ul').slideDown(100);
        		} else {
        			t.prev('button.tNavToggle').text('+').removeClass('minus').addClass('plus');
        			t.parent('li').find('>ul').slideUp(100);
        		}
        		return false;
        	});
        	

        	// Lined Tab Navigation
        	var tab_line = $('div.tab.line');
        	var tab_line_i = tab_line.find('<ul<li');
        	var tab_line_ii = tab_line.find('<ul<li<ul<li');
        	tab_line.removeClass('jx');
        	if($(document).width()<=640){
        		tab_line.addClass('jx');	
        	}
        	$(window).resize(function(){
        		if($(document).width()<=640){
        		tab_line.addClass('jx');	
        		} else {
        		tab_line.removeClass('jx');
        		}
        	});
        	tab_line_i.find('>ul').hide();
        	tab_line_i.find('<ul<li[class=active]').parents('li').attr('class','active');
        	tab_line.find('<ul<li[class=active]').find('>ul').show();
        	function lineTabMenuToggle(event){
        		if (!tab_line.hasClass('jx')){
        			var t = $(this);
        			tab_line_i.find('>ul').hide();
        			t.next('ul').show();
        			tab_line_i.removeClass('active');
        			t.parent('li').addClass('active');
        			return false;
        		}
        	}
        	function lineTabSubMenuActive(){
        		tab_line_ii.removeClass('active');
        		$(this).parent(tab_line_ii).addClass('active');
        		return false;
        	}; 
        	tab_line_i.find('>a[href=#]').click(lineTabMenuToggle).focus(lineTabMenuToggle);
        	tab_line_ii.find('>a[href=#]').click(lineTabSubMenuActive).focus(lineTabSubMenuActive);
    		
    		//------------------------- 받아온 사원 데이터로 트리 세팅 :E --------------------------
    	};
    	commonAjax("POST", url, param, callback, false);		// false (sync 처리)
    	
    },//setStaffTreeMenu
    
    //그리드 div height toggle
    showAllGrid: function(){
    	var gridH = $('#SGridTarget').height() + 50;
    	if($('.scroll_body').height() == 450){
    		$('.scroll_body').css('height', gridH);
    		$('.scroll_body').css('max-height', gridH);
    	}else{
    		$('.scroll_body').css('height', '450px');
    		$('.scroll_body').css('max-height', '450px');
    	}
    },//end showAllGrid
    
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
    },//end doSort
     
    
    // 법인분류셋팅
    searchCorpTypeSetting : function(){
    	var str = '<b>법인분류 :</b> <select id="corpType" style="height:26px;width:100px;" onchange="fnObj.doSearch();">';
    	str += '<option value="0">전체</option>';
    	
    	for(var i=0; i< corpList.length; i++){
			str += '<option value="' + corpList[i].corpNum +'">' + corpList[i].corpName + '</option>';
		}
		
    	str += '</select>';
    	$("#searchCorpType").html(str);
    }, //end searchTypeSetting    
    
    //검색버튼 클릭
    clickSearch : function(){    	
    	fnObj.doSearch();
    },
    
    
  	//통계 
    goStatistics : function(){
    	location.href="<c:url value='/card/statistics.do'/>";
    },
  	
    
  	//공지등록팝업
    alarmReg : function(){
    	location.href="<c:url value='/alarm/index.do'/>";
    }
    
    /* ====================================== 화면 세팅 관련 : E ===================================*/
    
   
    //################# else function :E #################
};//end fnObj.

function goMenuCard(){
	parent.leftIframeOFF();
	top_menu_new("${pageContext.request.contextPath}/card/cardIndex.do", "mainFrame");
}

function top_menu_new(sUrl, frame) {
	
	if (frame=="mainFrame") {
		parent.mainFrame.location.href = sUrl;
	}else if (frame == "leftFrame") {
		parent.leftFrame.location.href = sUrl;
	}
}

function send_to_post(path, params, method, targetTitle){	
	method = method || "post";  //method 부분은 입력안하면 자동으로 post가 된다.
    var form = document.createElement("form");
    form.setAttribute("target", targetTitle);
    form.setAttribute("method", method);
    form.setAttribute("action", path);
    //input type hidden name(key) value(params[key]);
    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}
	

/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	fnObj.pageStart();		//화면세팅	
	
	
	if($(window).width()<1010){
		setVisibleLeftMenu(0);		//외쪽메뉴 숨기기
	}
});
</script>