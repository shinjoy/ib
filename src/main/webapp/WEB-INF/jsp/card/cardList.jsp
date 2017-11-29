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
<c:set var="mgmtRoleC" value="N" />
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

<c:if test="${ userLoginInfo.id eq 'kes' 
			or userLoginInfo.id eq 'kbm'
			or userLoginInfo.id eq 'pjh'
										}" >	
	<c:set var="mgmtRoleC" value="Y" />
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
<script type="text/JavaScript" src="<c:url value='/js/part/card.js?ver=0.2'/>" ></script>
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
	border-right:#b9c1ce solid 1px; border-bottom:#b9c1ce solid 1px; min-width:1000px;	/* 1550px; */ 
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
	<div style="margin: 18px;" >
		<p id="memoInfo" style="font-weight:bold;font-size:13px;color:black;margin-bottom:11px;"></p>
		<c:if test="${mgmtRoleA eq 'Y'}">	
			<p id="memoSelect" style="font-weight:bold;font-size:13px;color:black;margin-bottom:11px;">
				<select id="feedbackSelect" onchange="fnObj.setText('');" style="height:24px;">
					<option value="">-----------메모선택----------</option>
					<option value="noSchedule">일정내용상이</option>
					<option value="noOutWork">퇴근시간 미준수(9시 이전)</option>
					<option value="overPrice">1인 식대초과(1인당 1만원 지원)</option>
				</select>
			</p>
		</c:if>
		<textarea id="memoText" rows="13" cols="70" style="border:1px solid #8c8c98;background:#fdfdc3;border-radius: 2px;"></textarea>
	</div>
	<div style="text-align:center;margin:10px;">
		<c:if test="${mgmtRoleA eq 'Y'}">	
			<button name="reg_btn" id="memoSave" class="btn_standard" onclick="fnObj.regMemo();" style="border:1px solid #373a73;color:white;background-color:#6573a2;">저장</button>
			<button name="reg_btn" id="memoEdit" class="btn_standard" onclick="fnObj.regMemo();" style="border:1px solid rgb(28, 82, 29);background-color:#2fe465;display:none;">수정</button>
		</c:if>	
		<button name="reg_btn" class="btn_standard" onclick="fnObj.eleMemoDiv();" style="border:1px solid #8b8b94;background-color:#d4d7de;">닫기</button>
	</div>
</div>
<!--====================== 메모 박스 : E ===================-->
<body>
<input type="hidden" id="usrId">
<div id="wrap"> 
	<div class="container">
		<div id="wholePanel">
			<!--============== LEFT MENU : S =============-->	
		    <div id="leftPanel" style="min-height:950px;">
		        <%-- <div class="favormenu"></div>--%>
		        <a href="#" onclick="setVisibleLeftMenu(0);" id="btnLeftMenuHide" class="btn_leftmn_cl"><em>레프트 메뉴닫기</em></a>
				<div class="custManagerGap"></div>
				<div class="custManager">사원 선택</div>
				
				<c:if test="${mgmtRoleA eq 'Y'}">
					<div class="showManaAll"><label><input type="checkbox" onclick="fnObj.selStaff('ALL');" id="chkboxShowAll" /> 전체보기</label></div>
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
		            	<li class="off"><a href="javascript:goMenuCardCorp();">법인카드사용내역</a></li>
		                <%--<li><a href="#">담당자별 고객관리</a></li> --%>
		            </ul>
		            <ul>
		            	<li class="on"><a href="#">지출리스트</a></li>
		                <%--<li><a href="#">담당자별 고객관리</a></li> --%>
		            </ul>
       			</div>
		        <!--//tab//-->
		        <div id="containerWrap">
		            
		            <div class="tb_titleZone">
		            	<div class="title">
		            		<b>총 <span id="total_count"></span> 건</b>
		           			<span id="searchTypeDiv" style="margin-left:10px;"></span>  <!-- 분류 -->
		            		<span id="yearDiv" style="margin-left:10px;"></span>		<!-- 년도 -->
		            		<span id="monthDiv"></span>         						<!-- 월 -->
		            		<span style="margin-left:15px;">
		            			<b>날짜 :</b>
		            			<input type="text" id="startDate" class="applyinput_B w_st06" style="width:75px;" readonly="readonly"/>
								<a href="#" onclick="$('#startDate').datepicker('show');return false;" class="btn_calendar" style="margin-top:5px;"></a>
							~&nbsp; 
		            		
		            			<input type="text" id="endDate" class="applyinput_B w_st06" style="width:75px;" readonly="readonly"/>
								<a href="#" onclick="$('#endDate').datepicker('show');return false;" class="btn_calendar" style="margin-top:5px;"></a>
		            		</span>
		            		<button type="button" name="reg_btn" class="btn_standard" onclick="fnObj.clickSearch();" style="border:1px solid #bdc9d6; background-color:#e5e8ea;">검색</button>
		            		<a id="qNa" style="cursor:pointer;"><span style="vertical-align: middle;padding-left:30px;font-size:16px;color:red;"><i id="qNa" class="axi axi-json-undefined3"></i></span>
		            		<span style="font-size:14px;color:red;">도움말</span></a>
		            	</div>
		                <div class="btnBox" style="padding-top:3px;">
		                	<button name="reg_btn" class="btn_standard" onclick="fnObj.cardReg(0);" style="border:1px solid #323b5a; background-color:#59647a;"><span id="regTxtSpan" style="color:white;">지출등록</span></button>		                	
		                	<c:if test="${mgmtRoleA eq 'Y'}">
		                		<button name="reg_btn" class="btn_standard" onclick="fnObj.goStatistics();" style="border:1px solid #095792; background-color:#387cc8;"><span id="regTxtSpan" style="color:white;">지출통계</span></button>
								<button name="reg_btn" class="btn_standard" onclick="fnObj.alarmReg();" style="border:1px solid #bdc9d6; background-color:#e5e8ea;">공지등록</button>
		                		<button name="reg_btn" class="btn_standard" onclick="fnObj.excelDownList();" style="border:1px solid #bdc9d6; background-color:#e5e8ea;">엑셀다운</button>
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
			                            <col width="50" />  <!--지출일자-->                            
			                            <col width="70" /> 	<!--항목-->
			                            <col width="50" /> 	<!--금액-->
			                            <col width="100" /> <!--소속회사-->
			                            <col width="70" /> <!--이름-->
			                            <col width="130" /> 	<!--장소-->
			                            <col width="200" /> <!--지출내용-->
			                            <col width="120" /> <!--시너지참석자-->
			                            <col width="50" /> 	<!--등록자-->
			                            <col width="120" /> <!--상태-->
			                        </colgroup>
			                        <thead>
			                            <tr id="tblHeaderPart">
			                                <th rowspan="2" scope="col"><a href="#" onclick="fnObj.doSort(0);" id="sort_column_prefix0" class="sort_normal" style="color:white;">지출일자</a></th>
			                                <th rowspan="2" scope="col"><a href="#" onclick="fnObj.doSort(1);" id="sort_column_prefix1" class="sort_normal" style="color:white;">항목</a></th>
			                                <th rowspan="2" scope="col">금액(단위:원)</th>
			                                <th colspan="2" scope="col">대상</th>
			                                <th rowspan="2" scope="col">장소</th>
			                                <th rowspan="2" scope="col">지출내용</th>
			                                <th rowspan="2" scope="col">시너지참석자</th>
			                                <th rowspan="2" scope="col"><a href="#" onclick="fnObj.doSort(2);" id="sort_column_prefix2" class="sort_normal" style="color:white;">등록자<em></em></a></th>
			                                <th rowspan="2" scope="col">상태</th>
			                            </tr>
			                            <tr id="tblHeaderPart2">
			                            	<th scope="col">소속회사</th>
			                                <th scope="col">이름</th>
			                            </tr>
			                        </thead>
			                    </table>
			                </div>
		                 <!--================= 상단 table : E ================-->
		                 
		                 <!--============ scroll_body 내용 : S ===============-->
		                 	<div class="scroll_body" style="height:450px;">
			                    <table id="SGridTarget" class="network_tb_st" style="table-layout:fixed;" summary="고객관리 리스트(이름, 업종, 회사, 기본정보, 네트워크, 최근정보, 시너지와의 이력)">
			                    	<colgroup>
			                            <col width="50" />  <!--지출일자-->                            
			                            <col width="70" /> 	<!--항목-->
			                            <col width="50" /> 	<!--금액-->
			                            <col width="100" /> <!--소속회사-->
			                            <col width="70" /> <!--이름-->
			                            <col width="130" /> 	<!--장소-->
			                            <col width="200" /> <!--지출내용-->
			                            <col width="120" /> <!--시너지참석자-->
			                            <col width="50" /> 	<!--등록자-->
			                            <col width="120" /> <!--상태-->
			                        </colgroup>
			                        <tbody></tbody>
			                     </table>
			              	</div>
			              <!--============ scroll_body 내용 : E ===============-->
		         	</div> <!--network_st_box  -->
		         	<label><a href="#" onclick="fnObj.showAllGrid();" class="btn_wh_bevel sort_normal" style="width:26px;">펼침</a></label>
		           	<!--========================== 합계 :S =======================-->
		           	<div>
		           		<table id="SGridTargetSum"  class="sum_table" style="min-height:130px;">
		           			<colgroup>
		                            <col width="60" />  <!--총계-->                            
		                            <col width="60" /> 	<!--금액-->
		                            <col width="70" />  <!--세부사항-->                            
		                            <col width="80" /> 	<!--세부금액-->
		                    </colgroup>
		           			<tr>
		           				<td style="text-align:center;background:#e5e8ea;"><font style="font-weight:bold;color:black;font-size:13px;">총계</font></td>
		           				<td style="text-align:center;font-size:20px;"><span id="totalSum" style="font-weight:bold;color:#060c65;"></span></td>
		           				<td style="text-align:center;background:#e5e8ea;"><font style="font-weight:bold;color:black;font-size:13px;"><p id="dv2NameP"></p>세부항목</font></td>
		           				<td style="text-align:right;">
		           					<span id="detailSum" style="font-size:12px;font-weight:bold;"></span>
		           				</td>
		           			</tr>
		           		</table>
		           	</div>
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

var cardList ;
var dv2List=[];				//dv2 리스트
var dvList=[];				//dv 리스트
//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		
		//공통코드
		dv2List=getCommonCode('00024', null, 'CD', 'NM');		//dv2의 메뉴cd 00024
		dvList =getCommonCode('00025', null, 'CD', 'NM');		//dv의 메뉴cd 00025
		
		fnObj.setDatepicker('startDate');
		fnObj.setDatepicker('endDate');
		
		fnObj.yearSetting();		//년도 셀렉트박스 세팅
    	fnObj.monthSetting();		//월 세팅
    	fnObj.searchTypeSetting();	//분류 세팅
    	
    	var obj = $("#qNa").offset();	//물음표 버튼 위치
		//도움말 말풍선
		
		$("#qNa").mouseover(function(){
			$("#balloon").show();		//도움말풍선
			$("#balloon").css("left",obj.left);	
		});
	 	$("#qNa").mouseout(function(){
			$("#balloon").hide();		//도움말풍선
		});
    },
	//화면세팅
    pageStart: function(){
    	
    	/*=========================================== 달력 세팅 : S ===========================================*/
    	var nowDate = new Date();
    	var dateArr = nowDate.yyyy_mm_dd().split('-');
    	// 전주 월요일부터 일요일(7일간)으로 기본셋팅
    	var nowWeekName =nowDate.getDay(); 				//오늘 번호
    	var setNum = 0;
    	if(nowWeekName>0 && nowWeekName<7){				//오늘 월~토
    		setNum = 7-(nowWeekName+7); 				// 전주 월요일
    	}else{											//오늘 일
    		setNum = -(6+7);							// 전주 일요일
    	}
    	var thuDay = new Date(dateArr[0],parseInt(dateArr[1])-1,parseInt(dateArr[2])+setNum);	//월요일 날짜
    	var thuStr = thuDay.yyyy_mm_dd();
    	$("#endDate").val(thuStr);
    	
    	var thuArr = thuStr.split("-");															//목요일 기준
    	var friDay = new Date(thuArr[0],parseInt(thuArr[1])-1,parseInt(thuArr[2])-6);			//-6 지난주 일요일
    	var friStr = friDay.yyyy_mm_dd();
    	$("#startDate").val(friStr);
    	/*=========================================== 달력 세팅 : E ===========================================*/
    	
    	this.setStaffTreeMenu();		//담당자 선택 트리 메뉴 세팅
    	
    	//-------------------------- 그리드 설정 :S ----------------------------
    	/* 그리드 설정정보 */
    	var configObj = {
    		
    		targetID : "SGridTarget",		//그리드의 id
    		
    		//그리드 컬럼 정보
    		colGroup : [    		
            {key:"tmDt", formatter:function(obj){return obj.item.tmDt.replace(/-/gi,'/');}},			//지출일
            {key:"dv", 	 formatter:function(obj){														//항목
            										var dv = obj.item.dv;
            										var txt = '';
            										txt = fnObj.dvSet(dv);
            										return txt;
            									}},            
            {key:"price", formatter:function(obj){return Number(obj.item.price).toLocaleString();}},	//금액
            {key:"cstCpnNm",formatter:function(obj){
            										var reCpnNm = "";
            										reCpnNm = obj.item.cstCpnNm;
            										if(obj.item.cstCpnNm == null){
            											reCpnNm = obj.item.cpnNm;
            										}
            											return reCpnNm;
            									   }	
            },							//소속회사
            {key:"cstNm", formatter:function(obj){														//이름
            										var txt = obj.item.cstNm; 
	            										if(obj.item.extraName != null ){  	// 대상자가 있고  obj.item.etcNum > 0
	            											if(obj.item.etcNum > 0){  		// 그 외 몇명이 더 있으면(전체 2명이상일때)
	            												var regCstNm = obj.item.cstNm;		//cst_s_nb 고객명
	            												var arrExtName = obj.item.extraName.split(',');		//신규일때 사용
	            												var arrCstSnb ;
	            												if(obj.item.cstSnb.toString().indexOf(',') != -1){ //신규일때 사용 (고객 snb)
	            													arrCstSnb = obj.item.cstSnb.split(',');			
	            												}
	            												var str = '';
	            												var str1 = arrExtName[0];	//신규 대표고객
	            												if(regCstNm == null){		//신규
	            													txt = '<span onclick="fnObj.personHistoryPopUp('+arrCstSnb[0]+');">'+str1+' 외 '+ obj.item.etcNum+'명</span></br>';
	            													for(var i=1; i<arrCstSnb.length; i++){  // 대표 제외한 나머지 인원 
	            														txt += '<span id="'+arrCstSnb[i]+'" onclick="fnObj.personHistoryPopUp('+arrCstSnb[i]+');" style="color:black;"> ['+arrExtName[i]+']</span>';
	            													}
	            													// txt += '<span id="'+obj.item.cstSnb.substr(obj.item.cstSnb.indexOf(',')+1, 100)+'"><font style="color:black;">['+obj.item.extraName.substr(obj.item.extraName.indexOf(',')+1, 100)+']</font></span>';
	            													
	            												}else{						//구데이터는 대표만 조회
	            													txt = regCstNm+' 외 '+ obj.item.etcNum+'명</br>';
	            													txt += '<span id="'+obj.item.cstSnb+'" onclick="fnObj.personHistoryPopUp('+obj.item.cstSnb+');" ><font style="color:black;">['+obj.item.extraName+']</font></span>';
	            												}
	            														            											
	            											}else{  // 대상자만 있는 경우(전체 1명)
	            												if(obj.item.extraName != ''){
		            												txt = '<span id="'+obj.item.cstSnb+'" onclick="fnObj.personHistoryPopUp('+obj.item.cstSnb+');"> <font style="cursor:pointer;color:blue;">'+obj.item.extraName+'</font> </span>';
		            											}
	            											}
	            										}
	            										
            										return txt;
            									 }},
            {key:"place",		},																		//장소
            {key:"note",	formatter:function(obj){													//지출내용	
													var txt ='';
            										//출발지 목적지 세팅
													if(obj.item.dv== '100' && obj.item.fromLoc!= '' && obj.item.toLoc!= '' && obj.item.fromLoc!= null && obj.item.toLoc!= null){
														txt += '['+obj.item.fromLoc+' ▶ '+obj.item.toLoc+']    :   ';
													}
													txt +=obj.item.note
													if(obj.item.dv =='170'){							//소모품일때
														txt+='    <i class="axi axi-my-library-books" style="font-size:17px;color:#3c79ec;cursor:pointer;" title="내역상세보기" onclick="fnObj.viewSupplies('+obj.item.sNb+');"></i>';
														
													}
													return txt;
												 }},																
            {key:"staff",	formatter:function(obj){													//시너지참석자
									            	var txt='';
									            	if(obj.item.dv == "60"){//저녁 야근일때 세팅
									            		for(var i=0;i<obj.item.cardUserList.length;i++){
									            			var leaveTime = (obj.item.cardUserList[i].leaveWorkTime).replace(/:/gi,'');
									            			if(obj.item.cardUserList[i].leaveWorkTime == '' && obj.item.tmDt > '2016-08-31'){
									            				txt +='<span style="color:blue;">';	
									            				txt +='<font style="cursor:pointer;"  title="퇴근미체크"><b>';
									            			}else if(obj.item.tmDt > '2016-08-31' && parseInt(leaveTime)<210000){
									            				txt +='<span style="color:blue;">';	
									            				txt +='<font style="cursor:pointer;"  title="퇴근시간:'+obj.item.cardUserList[i].leaveWorkTime.substring(0,5)+'"><b>';
									            			}
									            			else{
									            				txt +='<font style="cursor:pointer;"  title="퇴근시간:'+obj.item.cardUserList[i].leaveWorkTime.substring(0,5)+'">';
									            			}
									            			txt +=obj.item.cardUserList[i].cstNm;
									            			if(i<obj.item.cardUserList.length-1){
									            				txt +=', ';
									            			}
									            			txt +='</font></span>';
									            		}
									            	}else{
									            		txt =obj.item.staff;
									            	}
									            	return txt;
									            }},																
            {key:"staffNm",		},																		//등록자
            {key:"progress",  formatter:function(obj){
									            	var txt='';
									            	txt+='<a class="memoBtn"  style="cursor:pointer"  onclick="fnObj.openMemo(this,\''+obj.item.sNb+'\');"><img style="vertical-align:middle;" src="<c:url value="/images/edit-5-icon.png"/>" title="메모 입력"></a>';
									            	
									            	/* 본인이 사용한 내역 또는 관리자(mgmtRoleC) 일 경우 수정/삭제 가능 */
									            	if(obj.item.sabun == '${userLoginInfo.sabun}' || '${mgmtRoleC}' == 'Y'){
									            		
									            		txt+='<button name="reg_btn" class="btn_inner" onclick="fnObj.cardReg('+obj.item.sNb+');" style="border:1px solid rgb(5, 189, 8); background-color:#4cd602;"><span id="regTxtSpan"  style="color:white;" >수정</span></button>';
										            	txt+='<button name="reg_btn" class="btn_inner" onclick="fnObj.doDelete('+obj.item.sNb+');" style="border:1px solid #e4212d; background-color:#f14953;"><span id="regTxtSpan" style="color:white;">삭제</span></button>';
										            }
									            	var feedback = obj.item.feedback;
									            	if(feedback != null){
									            		txt+='<div style="margin-top:4px;cursor:pointer;"><a onclick="fnObj.openMemo(this,\''+obj.item.sNb+'\');"><b>'+feedback.substring(0,20)+(feedback.length>20 ? '...' : '')+'</b></a></div>';
									            	}
									            	return txt;
									            }},														//상태		
            {key:"priceAlert",formatter:function(obj){
										            	var txt='';
										            	if(obj.item.dv == "60"){//저녁 야근
										            		if(obj.item.cardUserList.length>0 && obj.item.price/obj.item.cardUserList.length>10000 && obj.item.tmDt > '2016-08-31'){
											            		txt = 'background:#8ee9ef;color:black;font-weight:bold;';
											            	}
										            	}else if(obj.item.dv == "55"){//점심 직원일때 세팅
										            		if(obj.item.cardUserList.length>0 && obj.item.price/obj.item.cardUserList.length>10000){
										            			txt = 'background:#8ee9ef;color:black;font-weight:bold;';			
										            		}
										            	}
										            	return txt;
										            }}
		    
            ],
            
            body : {
                onclick: function(obj, e){
                	/* ***** obj *****
                		obj.c 		- column index,
						obj.index 	- row index,
						obj.item 	- row data object,
						obj.list 	- grid data object
                	*/
                	/* if(obj.c == 4){  // function 으로 변경
               			if(obj.item.extraName != null && obj.item.cstSnb != 0 ){
               				personHistoryPopUp('','personHistoryPop','',obj.item.cstSnb);
               			}
                	} */
                	
                }
            }
            
    	};
    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
    	var rowHtmlStr = '<tr class="excelContentRow">';
    	rowHtmlStr +=	 '<td >#[0]</td>';																	//지출일
    	rowHtmlStr +=	 '<td>#[1]</td>';																	//항목
    	rowHtmlStr +=	 '<td style="text-align:right;#[10]">#[2] 원</td>';									//금액
    	rowHtmlStr +=	 '<td class="left_txt">#[3]</td>';													//소속회사			
    	rowHtmlStr +=	 '<td class="left_txt" style="cursor:pointer;color:blue;">#[4]</td>';				//이름								
    	rowHtmlStr +=	 '<td >#[5]</td>';																	//장소		
    	rowHtmlStr +=	 '<td class="left_txt">#[6]</td>';					//지출내용					
    	rowHtmlStr +=	 '<td class="left_txt">#[7]</td>';											//시너지참석자								
    	rowHtmlStr +=	 '<td>#[8]</td>';																	//등록자				
    	rowHtmlStr +=	 '<td style="text-align:left;" class="numst">#[9]</td>';							//상태				
		rowHtmlStr +=	 '</tr>';
    	configObj.rowHtmlStr = rowHtmlStr; 
        
    	
    	myGrid.setConfig(configObj);		//그리드 설정정보 세팅
    	//-------------------------- 그리드 설정 :E ----------------------------
    	//-------------------------- 소팅 설정 :S ----------------------------    	
    	 mySorting.setConfig({
			colList : ['tmDt', 'dv', 'staffNm'],				//['지출일', '항목', '등록자'],
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
    
    
    // 시너지와의 이력 조회 팝업
    personHistoryPopUp: function(cstSnb){
    	personHistoryPopUp('','personHistoryPop','',cstSnb);
    },    
    
 
  	//검색
    doSearch: function(){ 
    	$(".click_memo").removeClass();
    	$("#memoArea").css("display","none");
    	var choiceYear 	= $("#choiceYear").val();
    	var choiceMonth = $("#choiceMonth").val();
    	var startDate = $("#startDate").val();
    	var endDate = $("#endDate").val();
    	
    	var dv2 = $("#dv2").val();
    	var nowDate = new Date().yyyy_mm_dd();
    	var userList = [];
    	if(choiceYear==''){
    		choiceYear  = nowDate.substring(0,4);
    	}
    	
    	var choiceDate ='';
    	if(choiceMonth==''){
    		choiceDate  = '';
    		if(startDate>endDate){
    			alert("시작일이 종료일보다 이후 입니다.");
    			return false;
    		}
    	}else{
    		if(parseInt(choiceMonth)<10 && choiceMonth.length<2){
    			choiceMonth='0'+choiceMonth;
    		}
    		choiceDate =choiceYear+'-'+choiceMonth;
    	}
		
		
		
		if(dv2 == 0){dv2 = '';}
		var url = contextRoot + "/card/getCardList.do";
    	var param = {
    					dv2 			: dv2,
    					choiceDate 		: choiceDate,
    					startDate 		: startDate,
    					endDate 		: endDate,
    					usrId 			: $("#usrId").val(),
    					sorting			: '',
    					checkCount		: $('input:checkbox[name="chkboxStaff"]:checked').length
    				};
    	    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		cardList = obj.cardList;		
    		myGrid.setGridData({					//그리드 데이터 세팅	*** 2 ***
								list: cardList		//그리드 테이터
							});
    		g_gridListStr = result;					//따로 전역변수에 넣어둔다
    		//전체 건수 세팅
			$('#total_count').html(' '+cardList.length);
			
			
			//소팅 초기화
			mySorting.clearSort();
			//----- 하단 기본 소팅 설정은 기본정책에 따라 바꿔준다. 
			//mySorting.nowDirection = 'DESC';
			mySorting.setSort(0);				//소팅객체를 소팅한다.(상태값들의 변화)
			mySorting.applySortIcon();			//소팅화면적용
			fnObj.sumSetting();
    	};
    	//commonAjax("POST", url, param, callback, false, '', '');
    	
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
    cardReg: function(sNb){
    	/* 법인카드 사용내역이 올라오기 전에 사용하고자 하는 직원들을 위해
    	막았던 기능을 풀기로 함
    	if(sNb == '0'){
    		alert('지출등록은 법인카드사용내역 화면에 등록되어 있는 지출내역을 클릭하시기 바랍니다.');
    		return;
    	}
    	*/
    	var url = "${pageContext.request.contextPath}/card/regCard.do?cardSnb="+sNb;
    	var option = "left=" + (screen.width > 1400?"700":"0") + ", top=" + (screen.height > 810?"100":"0") + ", width=900, height=860, menubar=no, status=no, toolbar=no, location=no, scrollbars=yes, resizable=no";
    	window.open(url, "_blank", option);
    },
    
    //공지등록팝업
    alarmReg : function(){
    	location.href="<c:url value='/alarm/index.do'/>";
    },
    
    //메모팝업
	openMemo : function(th,sNb){
		$(".click_memo").removeClass();
		$(th).addClass("click_memo");
    	//메모 보이기 
    	var left = $(th).position().left-400;
    	var top = $(th).position().top + $(th).height(); 
    	$("#feedbackSelect").val('');
    	$("#memoText").val('');
    	var obj = getRowObjectWithValue(cardList,'sNb',sNb);	//리스트중에 해당 sNb 의 정보를 뽑아낸다
    	var memo = obj.feedback;	
    	if(memo == null || memo == ''){
    		memo='';
    		if('${mgmtRoleA}' == 'Y'){	//권한사용자 기본세팅
	    		var textAreaTxt ='';
	        	$("#memoSave").css("display","");
	    		$("#memoEdit").css("display","none");
    		}
    	}else{
    		$("#memoText").val(memo);
    		$("#memoSave").css("display","none");
    		$("#memoEdit").css("display","");
    	}
    	
    	var txt = fnObj.dvSet(obj.dv);
    	$("#memoInfo").html(''+obj.tmDt.replace(/-/gi,'/')+' '+obj.staffNm+' - '+txt+' ('+Number(obj.price).toLocaleString()+' 원)');
    	$("#cardSnb").val(sNb);
    	$("#memoArea").css({display:"",left:left,top:top});
		$("#memoArea").css("display","");
	},
	
	//소모품 팝업
	viewSupplies : function(sNb){
    	var url = "${pageContext.request.contextPath}/card/popSupplies.do?cardSnb="+sNb;
    	var option = "left=" + (screen.width > 1400?"700":"0") + ", top=" + (screen.height > 810?"100":"0") + ", width=500, height=600, menubar=no, status=no, toolbar=no, location=no, scrollbars=yes, resizable=no";
    	window.open(url, "_blank", option);
    },
    
    //통계 
    goStatistics : function(){
    	location.href="<c:url value='/card/statistics.do'/>";
    },
    
	/* ====================================== 팝업 관련 : E ===================================*/
	/* ====================================== 메모 관련 : S ===================================*/
    
	//메모 셀렉트 변경 textArea 세팅
    setText : function(memo){
    	if($("#feedbackSelect").val() != ''){
    		if(memo!=''){
    			$("#memoText").val(memo+$("#feedbackSelect option:selected").text()+'\n');
    		}else{
    			$("#memoText").val($("#feedbackSelect option:selected").text());
    		}
    	}else{
    		$("#memoText").val("");
    	}
    },
    
    //메모등록,수정
	regMemo : function(){
		    var url = "../card/insertCardFeedback.do";
			$.ajax({
				type:"POST",        					//POST GET
				url:url,     							//PAGEURL
				data : ({sNb: $("#cardSnb").val(),
						feedback: $('#memoText').val()
						}),
				timeout : 30000,      					//제한시간 지정
				cache : false,        					//true, false
				success: function whenSuccess(arg){  	//SUCCESS FUNCTION
					$("#memoArea").css("display","none");
					alert("저장되었습니다.");
					fnObj.doSearch();
				},
				error: function whenError(e){    		//ERROR FUNCTION
					alert("code : " + e.status + "\r\nmessage : " + e.responseText);
				}
			});
	},
	
	//메모 click 초기화.
	eleMemoDiv : function(){
		$(".click_memo").removeClass();
		$('#memoArea').css('display','none');
	},
	/* ====================================== 메모 관련 : E ===================================*/
   
	//삭제
	doDelete: function(sNb){ 
		if(confirm("삭제하시겠습니까?")){
		   	var url = contextRoot + "/card/deleteCardUse.do";
		   	var param = {sNb : sNb};
		   	var callback = function(result){
		   		var obj = JSON.parse(result);
		   		var chk = obj.resultVal;
		   		if(chk>0){
		   			alert("삭제되었습니다.");
			   		fnObj.doSearch();
		   		}else{
		   			alert("서버오류!!!.");
		   		}
		   		
		   	};
			commonAjax("POST", url, param, callback, false, null, null);
		}
   	},//end doDelete
    
   	//엑셀다운로드
    excelDownList: function(){
    	var htmlStr = "<table>";
    	htmlStr += '<tr bgcolor=silver><td>지출일자</td><td>항목</td><td>금액</td><td>소속회사</td><td>이름</td><td>장소</td><td>지출내용</td><td>시너지참석자</td><td>등록자</td><td>상태</td></tr>';
    	htmlStr += $('#SGridTarget').html().replace(/checkbox/gi,'hidden').replace(/<em>선택<\/em>/gi, '').replace(/img/gi, 'hidden').replace(/수정/gi, '');
    	htmlStr += "</table>";
    	htmlStr += "<table>";
    	htmlStr += $('#SGridTargetSum').html();
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
    	        		
			//--------------------- 관리자급 외에는 본인만 강제 선택되도록 설정
			var disabledValue = 'disabled';    		
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
    
    //dv -> 한글명 변환
    dvSet : function(dv){
    	var txt = '';
    	var dvInfo = getRowObjectWithValue(dvList, 'dtailCd', fillzero(dv,5));		//리스트에서 해당 dv에 대한 공통코드 추출.
    	txt = dvInfo.cdNm;
    	return txt;
    },
    
    //분류세팅 -> 추후 코드화를 위해
    searchTypeSetting : function(){
    	var str = '<b>분류 :</b> <select id="dv2" style="height:26px;width:100px;" onchange="fnObj.doSearch();">';
    	str += '<option value="0">전체</option>';
		for(var i=0; i< dv2List.length; i++){
			str += '<option value="'+parseInt(dv2List[i].dtailCd)+'">'+dv2List[i].cdNm+'</option>';
		}
    	str += '</select>';
    	$("#searchTypeDiv").html(str);
    },//end searchTypeSetting
    
    //년도 세팅(셀렉트박스)
    yearSetting : function(){
    	
    	var nowDate= new Date().yyyy_mm_dd();
    	var nowYear = nowDate.substring(0,4);
    	var str ='<b>년도 :</b> <select id="choiceYear" style="height:26px;width:100px;" onchange="fnObj.doSearch();">';
    	for(var i="${minYear}";i<=parseInt(nowYear)+1;i++){
    		var chk ='';
    		if(nowYear == i){
    			chk ='selected="selected"';
    		}
    		str += '<option value="'+ i+'" '+chk+'>'+ i+'</option>';
    	} 
    	str += '</select>';
    	$("#yearDiv").html(str);
    },//end yearSetting  
    
    //월 세팅
    monthSetting : function(){
    	var nowDate= new Date();
    	var month = nowDate.getMonth() + 1;		//현재 월
    	var str ='';
    	for(var i=1;i<=12;i++){
    		str += '<a class="month_tag" style="cursor:pointer;" id="month_'+i+'" onclick="fnObj.monthClick('+i+');">'+i+'월</a>';
    	}
    	$("#monthDiv").html(str);
    },//end monthSetting
    
    //월 선택
    monthClick : function(i){
    	$(".select_m").removeClass("select_m");
    	$('#month_'+i).addClass("select_m");
    	$('#choiceMonth').val(i);
    	$('#startDate').val('');
    	$('#endDate').val('');
    	fnObj.doSearch();
    },//end monthClick 
    
    //검색버튼 클릭
    clickSearch : function(){
    	$(".select_m").removeClass("select_m");
    	$('#choiceMonth').val(''); 
    	fnObj.doSearch();
    },
    
    //합계 세팅
    sumSetting: function(){
    	dv2 = $("#dv2").val();
    	var totalSum =0;
    	var sumMap =newMap();
    	var cardList2 = cardList.clone();
    	sortByKey(cardList2, "dv", "ASC");		//dv 순서 정렬
    	for(var i=0; i<cardList2.length; i++){
			totalSum +=cardList2[i].price;		//전체 총 합계
    	}
    	//하나의 항목별 금액
   		for(var p=0; p<dvList.length; p++){		
   			var sum =0;
   			var dv ='';
			for(var i=0; i<cardList2.length; i++){
				if(parseInt(dvList[p].dtailCd) == cardList2[i].dv){		//dv가 같을때
					dv = cardList2[i].dv;								//dv세팅
					sum += cardList2[i].price; 							//합계		
				}
			}
			sumMap.put(dv,sum);											//객체에 각 항목을 담는다. 
 		}
    	
   		var str ='';
   		if(dv2 != 0){		//전체가 아닐때
	    	for(var i=0; i<dvList.length; i++){
	    		if(parseInt(dvList[i].cdSort) == dv2){					//항목리스트와 선택 분류(그룹이름)가 같으면
	    			str += dvList[i].cdNm+'  <font style="font-weight:bold;color:#060c65;font-size:15px;">'+Number(sumMap.get(parseInt(dvList[i].dtailCd))).toLocaleString()+'</font> 원 <br/>';
	    		}
	    	}
	    	$("#dv2NameP").html($("#dv2 option:selected").text());
   		}else{				//전체일때
   			$("#dv2NameP").html('');
   			//sortByKey(dvList, 'cdSort', 'ASC');					
	    	for(var i=0;i<dv2List.length;i++){							//분류리스트
	    		var sum =0;
	    		for(var k=0;k<dvList.length;k++){						//항목 리스트
	    			if(dvList[k].cdSort == dv2List[i].dtailCd){			//항목리스트가 분류리스트(그룹이름)에 포함되어있으면
	        			sum += sumMap.get(parseInt(dvList[k].dtailCd));	//객체에서 해당 금액 추출 합친다.
	        		}
	    		}
	    		str += dv2List[i].cdNm+'  <font style="font-weight:bold;color:#060c65;font-size:15px;">'+Number(sum).toLocaleString()+'</font> 원 <br/>';
	    	}
   		}
    	
    	$("#totalSum").html(Number(totalSum).toLocaleString());
    	$("#detailSum").html(str);
    	
    },//end sumSetting.
    
  	//datepicker 설정
    setDatepicker : function(obj){		
		$('#'+obj).datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true, 
			changeYear: true,
			showOn: "button",
			maxDate: new Date(),
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
    }
    
    /* ====================================== 화면 세팅 관련 : E ===================================*/
    
   
    //################# else function :E #################
};//end fnObj.


function goMenuCardCorp(){
	parent.leftIframeOFF();
	top_menu_new("${pageContext.request.contextPath}/card/cardCorpIndex.do", "mainFrame");
}

function top_menu_new(sUrl, frame) {
	
	if (frame=="mainFrame") {
		parent.mainFrame.location.href = sUrl;
	}else if (frame == "leftFrame") {
		parent.leftFrame.location.href = sUrl;
	}
}
/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	fnObj.pageStart();		//화면세팅
	//fnObj.doSearch();
	
	
	if($(window).width()<1010){
		setVisibleLeftMenu(0);		//외쪽메뉴 숨기기
	}
	
});
</script>