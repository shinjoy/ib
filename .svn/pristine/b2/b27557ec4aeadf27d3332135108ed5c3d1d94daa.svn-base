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
<title>지출</title>

<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/n_typography.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/n_layout.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>

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
.tNav li.active a {
    font-weight: normal;
    color: #999;
}
.widescroll_wrap { width:100%; min-width: 0px; overflow-x:auto; }

.btn_standard{
	border-radius:2px;
	padding:4px 8px 4px 8px;
	margin-left:7px;
}
.carSearchBox {
    background: url(../images/work/bg_memo_search.gif) repeat-x 0 0;
    border: #b8bfcc solid 1px;
    box-shadow: 0px 1px 0px #eceef1;
    height: 24px;
    padding: 11px 15px 11px 15px;
    position: relative;
}
.carSearchBox .carSearchtitle {
    font-weight: bold;
    color: #3a485e;
    padding-right: 5px;
}
.btn_b2_skyblue {
    background: url(../images/support_w/bg_btn_skyblue.gif) repeat-x;
    font-weight: bold;
    color: #fff;
    border: #a1a6ac solid 1px;
    height: 24px;
    box-sizing: border-box;
    display: inline-block;
    font-size: 11px;
    border-radius: 2px;
}
.btn_b2_skyblue em {
    color: #555;
    line-height: 1;
    letter-spacing: -0.1em;
}
.icon_XLS {
    background: url(../images/support_w/icon_xls.png) no-repeat 0 center;
    margin-left: -1px;
    padding: 2px 5px 2px 34px;
}
.btnRightZone {
    position: absolute;
    right: 15px;
    top: 11px;
}
.btn_g_black {
    background: #8e99a8;
    border: #707c8f solid 1px;
    border-radius: 2px;
    color: #fff!important;
    padding: 2px 10px 2px;
    line-height: 1.4;
    font-size: 12px;
    vertical-align: middle;
    display: inline-block;
    box-sizing: border-box;
}
.h3_title_basic {
    background: url(../images/common/bu_h3_title.gif) no-repeat 0 3px;
    color: #2a3a5b;
    font-family: 'NanumBarunL';
    font-weight: bold;
    font-size: 16px;
    letter-spacing: -0.04em;
    padding-left: 12px;
    margin-bottom: 10px;
}
.mgt20 {
    margin-top: 20px;
}
.h3_title_basic .sub_desc {
    font-size: 13px;
    margin-left: 6px;
    color: #6a798e;
    font-family: 'NanumBarun';
    font-weight: normal;
}

/* 상단 합계 */

.tb_statistics tbody tr:first-child {
    background: #d8dce3;
    border-left: #b2bac5 solid 1px;
    border-right: #b2bac5 solid 1px;
}
.tb_statistics tbody tr:first-child th {
    /* padding-left:50px; */
    padding: 7px 48px;
}
.tb_statistics tbody tr:first-child td {
    padding: 7px 10px;
    color: #3b4354;
    /* border-top: #c3c6cd solid 1px; */
    border-left: #c3c6cd solid 1px;
    text-align: right;
    font-weight: bold;
}
.tb_statistics tbody tr:first-child td:last-child {
    color:#eb2700;
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


.tb_statistics .sub_row td {    
    background: #f7f7ff;
}
.tb_statistics .sub_row th {
    background: url(../images/support_w/th_subrow_line.gif) no-repeat 23px center #f7f7ff;
    font-weight:bold;
}
.tb_statistics .sub_row.sub_last th {
    background: url(../images/support_w/th_subrowlast_line.gif) no-repeat 23px -43px #f7f7ff;
    font-weight:bold;
}

.btn_leftmn_cl {
    position: absolute;
    left: 165px;
    top: 220px;
    z-index: 2;
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

</head>

<body>

<div class="wrap-loading display-none">
    <div><img src="<c:url value='/images/ajax_loading.gif'/>" /></div>
</div>

<input type="hidden" id="usrId">
<div id="wrap"> 
	<div class="container">
		<div id="wholePanel" >
			<!--============== LEFT MENU : S =============-->	
		    <div id="leftPanel">
		        <%-- <div class="favormenu"></div>--%>
		        <a href="#" onclick="setVisibleLeftMenu(0);" id="btnLeftMenuHide" class="btn_leftmn_cl"><em>레프트 메뉴닫기</em></a>
				<div class="custManagerGap"></div>
				<div class="custManager">사원 선택</div>
				<div class="showManaAll"></div>
				<div class="tNav">
		       		<span id="spanStaffTree"></span>	<!-- 담당자 선택 트리  -->
		        </div>
		    </div>
    		<!--============== LEFT MENU : E =============-->	
    		<!--============== RIGHT MENU : S =============-->	
		    <div id="rightPanel" style="min-height:850px;">
		    	<input type="hidden" id="choiceMonth"/>
		    	<a href="#" onclick="setVisibleLeftMenu(1);" id="btnLeftMenuShow" class="btn_leftmn_op"><em>레프트 메뉴열기</em></a> 
		        <!--tab-->
		        <div class="gtabZone">
		        	<ul>
		            	<li class="on"><a href="#">지출통계</a></li>
		            </ul>
		            <ul>
		            	<li class="off"><a href="javascript:fnObj.goMenuCard4Srch();">지출상세검색</a></li>
		            </ul>
       			</div>
		        <section id="detail_contents">
	            
		          <div class="carSearchBox">
		            	
	            		<span id="searchTypeDiv" class="carSearchtitle"><label for="searchType">분류</label></span>
	            		<select class="select_b" id="searchType"  onchange="fnObj.setSearchDiv();" style="height:26px;">
	           				<option value="all">전체통계</option>
	           				<option value="team">부서별통계</option>
	           				<option value="person">사원별통계</option>
	           			</select>
	            		
	            		<span id="yearDiv" style="margin-left:20px;"></span>		<!-- 년도 -->
	            		<button type="button" class="btn_g_black mgl10" onclick="fnObj.doSearch();">조회</button>
		            	
		                <div class="btnRightZone">
		                	<button type="button" class="btn_b2_skyblue" onclick="fnObj.excelDownList();"><em class="icon_XLS">엑셀다운</em></button>
		                </div>
		          </div><!-- carSearchBox -->
	         
	           	  <h3 class="h3_title_basic mgt20"><span id="searchTypeSpan"></span><span class="sub_desc" id="nameDiv"></span></h3>
	           	  
	           	  <!--================= table : S ================-->
	              <table class="tb_statistics" >
                      <caption>
                        	 통계리스트
                      </caption>
                      <colgroup>
						<col width="125" />
						<col width="7%" span="12" />
						<col width="*" />
					  </colgroup>
	                      <thead>
	                      	<tr id="tblHeaderPart">
	                              <th scope="col">&nbsp;</th>
	                              <th scope="col">1월</th>
	                              <th scope="col">2월</th>
	                              <th scope="col">3월</th>
	                              <th scope="col">4월</th>
	                              <th scope="col">5월</th>
	                              <th scope="col">6월</th>
	                              <th scope="col">7월</th>
	                              <th scope="col">8월</th>
	                              <th scope="col">9월</th>
	                              <th scope="col">10월</th>
	                              <th scope="col">11월</th>
	                              <th scope="col">12월</th>
	                              <th scope="col">합계</th>
	                              <!-- <th scope="col">평균</th> -->
	                          </tr>
	                      </thead>
	               <!--        <tbody id="totalTopTableDiv"></tbody> -->
	                      <tbody id="dataTableDiv"></tbody>
	                      <tfoot id="totalTableDiv"></tfoot>
	               </table>
	               <!--================= table : E ================-->
               
		    	</section>
		    </div><!-- rightPanel -->
		    <!--============== RIGHT MENU : E =============-->	
		</div><!-- wholePanel -->
	</div><!-- container -->
</div><!-- Wrap -->
</body>
</html>

<script type="text/javascript">

//Global variables :S ---------------

//공통코드
var comCodeCstType;			//고객구분

var myGrid = new SGrid();		// instance		new sjs
var mySorting = new SSorting();	// instance		new sjs

var g_chargeStaffCusId = '${userLoginInfo.cusId}';		//담당자 사원 고객id ... 담당자 일경우 (처음에는 로그인 사용자 고객id)
var g_division ="${userLoginInfo.division}";
var g_sabun ="${userLoginInfo.sabun}";					//로그인유저사번
var g_loginId ="${userLoginInfo.id}";					//로그인유저아이디
var g_permission ="${userLoginInfo.permission}";		//permission
var g_deptId ="${userLoginInfo.deptId}";				//teamId
var g_deptMngr ="${userLoginInfo.deptMngr}";			//부서장 사번
var g_staffList =[];
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
		dv2List=getCommonCode('00024', '', 'CD', 'NM', null, '', '');		//dv2의 메뉴cd 00024
		dvList =getCommonCode('00025', '', 'CD', 'NM', null, '', '');		//dv의 메뉴cd 00025
	},
	
	//화면세팅
    pageStart: function(){
    	fnObj.yearSetting();		//년도 셀렉트박스 세팅
    	fnObj.setSearchDiv();		//분류에 따른 페이지 세팅
    },//end pageStart.
 
  	//검색
    doSearch: function(){ 
    	
    	var choiceYear 	= $("#choiceYear").val();
    	var searchType 	= $("#searchType").val();
    	var nowDate = new Date().yyyy_mm_dd();
    	var checkist = [];
    	var checkStr = '';
    	if(searchType == 'team'){
    		$('input:checkbox[name="chkboxDept"]:checked').each(function(){
    			checkist.push($(this).val());
	    	});
	    	if(checkist.length>0){
	    		checkStr = checkist.join(',');
	    	}else{
	    		alert("선택된 부서가 없습니다.");
	    		$("#dataTableDiv").html('');
	    		return false;
	    	}
    	}else if(searchType == 'person'){
    		if($("#usrId").val() == ''){
    			alert("선택된 직원이 없습니다.");
    			$("#dataTableDiv").html('');
	    		return false;
    		}else{
    			checkStr = $("#usrId").val();
    		}
    	}
    	if(choiceYear==''){
    		choiceYear = nowDate.substring(0,4);
    	}
		
		var url = contextRoot + "/card/getCardStatistics.do";
    	var param = {
    					searchType 		: searchType,
    					choiceYear 		: choiceYear,
    					checkList 		: checkStr
    				};
    	
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var resultList = obj.resultList;
    		//var totalList = obj.totalList;    		
    		var str ='';
    		sortByKey(dvList, 'CD', 'ASC');	  
            sortByKey(dv2List, 'CD', 'ASC');
           	
            //resultList 
            fnObj.dataDisplay(resultList);			//선택별 테이블 세팅
           	fnObj.totalDisplay(resultList);			//최하단 토탈 세팅
          
           	//최하단 토탈 테이블 상단에 추가
           //	$("#totalTableDiv").css('tbody_total');
           	$("#dataTableDiv").prepend($("#totalTableDiv").html());
           	
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
    	$("#usrId").val(userStr);
    	fnObj.doSearch();
    },
  
	
   	//엑셀다운로드
    excelDownList: function(){
    	var htmlStr = "<table>";
    	htmlStr += $('.tb_statistics').html().replace(/display:none/gi,"");
    	htmlStr += "</table>";
    	console.log(htmlStr);
    	excelDown(htmlStr, '지출통계'+(new Date().yyyy_mm_dd()));	
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
    	    
    		//------------------------- 받아온 사원 데이터로 트리 세팅 :S --------------------------    		
    		
    		//-------- 트리 데이터 세팅
    		
    		var companyDis ='';
    		var teamDis ='';
    		var personDis ='';
    		var searchType =$("#searchType").val() ;
    		if($("#searchType").val() == 'all'){			//회사
    			companyDis='disabled';
    			teamDis ='disabled';
    			personDis ='disabled';
    		}else if($("#searchType").val() == 'team'){		//부서
    			personDis ='disabled';
    		}
    		
    		
    		var str ='<label><input type="checkbox" '+companyDis+' onclick="fnObj.selStaff(\'ALL\');" id="chkboxShowAll" /> 전체보기</label>'
    		
    		$(".showManaAll").html(str);
    		
    		var treeHtmlStr = '';
    		var team = '';			//팀(부서)
    		var foldSeq = [3,8,11];	//팀(부서)중 트리메뉴에서 처음 접을 부서코드 ... 3:경영지원, 6:벤처투자팀, 8:시스템기획팀, 9:오픈플랫폼팀, 10:고객관리, 11:파트너
    		for(var i=0; i<cnt; i++){
    			if(team != list[i].deptSeq){	//부서가 달라질때
    				if(i>0){
    					treeHtmlStr += '</ul>';
    		    		treeHtmlStr += '</li>';
    				}
    				//division 이 달라질때 ---------------
        			if(i==0){
        				treeHtmlStr += '<ul><li ' + ((searchType == 'all')||(searchType == 'team')? 'class="active"':'') + '><a href="#"><label>시너지</label></a><ul>';
        			}
        			if(i>0 && list[i-1].division != list[i].division){
        				treeHtmlStr += '</ul></li></ul><ul><li> <a href="#"><label>' + list[i].divisionNm + '</label></a><ul>';
        			}
        			//----------------------------------
        			team = list[i].deptSeq;
    				treeHtmlStr += '<li ' + ((searchType == 'person')? 'class="active"':'') + '><label><input type="checkbox" name="chkboxDept" id="deptSeq_'+team+'" '+teamDis+' onclick="fnObj.selStaff('+team+');" value="'+team+'"/>' + list[i].deptNm + '</label>';
    				treeHtmlStr += '<ul>';
    	    	}
    			
    			treeHtmlStr += '<li><label><input type="checkbox" id="staff_'+list[i].usrId+'" class="deptSeq_'+team+'"  '+personDis+'  onclick="fnObj.selStaff(\'\');" name="chkboxStaff" value="' + list[i].usrId + '" />' + list[i].usrNm + '</label></li>';
    			
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
    
   
    
    //년도 세팅(셀렉트박스)
    yearSetting : function(){
    	
    	var nowDate= new Date().yyyy_mm_dd();
    	var nowYear = nowDate.substring(0,4);
    	var str ='<span class="carSearchtitle mgl30"><label for="IDNAME02">년도</label></span> <select id="choiceYear" style="height:26px;width:100px;" onchange="fnObj.doSearch();">';
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
    
    //분류 선택
    setSearchDiv : function(){
    	$("#nameDiv").html('');
    	fnObj.setStaffTreeMenu();
    	if($("#searchType").val() == 'all'){				//회사
    		$("#searchTypeSpan").html('전체 통계');
    		$("#chkboxShowAll").prop("checked",true);
    		fnObj.selStaff('ALL');
		}else if($("#searchType").val() == 'team'){			//부서별
			$("#searchTypeSpan").html('부서별 통계');
    		$("#deptSeq_"+g_deptId).prop("checked",true);
    		fnObj.selStaff(g_deptId);
    	}else{												//사원별
    		$("#searchTypeSpan").html('사원별 통계');
    		$("#staff_"+g_loginId).prop("checked",true);
    		fnObj.selStaff('');
    	}
    },
    
    
  //plus 버튼 액션
    trDisplay : function(idx,th,type){						//버튼의 아이디값,tr
    	
    	if(!$("#"+type+"_"+idx).hasClass("select_row")){
    		$("."+type+"_"+idx).show();
        	$("#"+type+"_"+idx).addClass("select_row");
    	}else{
    		$("."+type+"_"+idx).hide();
        	$("#"+type+"_"+idx).removeClass("select_row");
        	if(type == 'grp') {								//부서나 사원 선택시
        		
        		$('tr[dv=dv_'+idx+']').hide();
        		$('tr[grp=grp_'+idx+']').removeClass("select_row");
        	}
    	}
    },
    
    dataDisplay : function(resultList){
    	var searchType 	= $("#searchType").val();
    	$("#dataTableDiv").html('');
    	
    	var str ='';
    	var nameList=[];
    	//전체 리스트
    	for(var i=0; i<resultList.length; i++){
    		/*==================================== 하나의 테이블세팅 : S=================================== */
   			
   			
   			var dv2CardList = resultList[i].dv2CardList;		//큰 분류 통계 리스트
   			var dvCardList = resultList[i].dvCardList;			//작은 분류 통계 리스트	
   			var monthList = resultList[i].monthList;			//월별 통계 리스트
   			var name = resultList[i].name;						//부서,이름
   			if(searchType != 'all'){							//부서별 혹은 직원별만,
   				/*==================================== 부서 or 직원 합계 : S=================================== */
				nameList.push(name);
   				//타이틀
   				str +='<tr class="team_row" id="grp_'+i+'" style="cursor:pointer;" onclick="fnObj.trDisplay(\''+i+'\',this,\'grp\');">';
				str +='<th scope="row" class="name_td btn_plus" id="inner_'+i+'">'+name+'</th>';
				
				//금액
				var totalSum=0;
   	   			for(var p=1; p<13; p++){
   	   				str +='<td>';
   	   				for(var k=0; k<monthList.length; k++){
   	   					if(parseInt(monthList[k].month) == p){	
   	   						str +=Number(monthList[k].sum).toLocaleString();
   	   						totalSum += monthList[k].sum;
   	   					}
   	   				}
   	   				str +=' </td>';
   	   			}
   	   			//합계
   	   			str +='<td class="txt_sum_money">'+Number(totalSum).toLocaleString() +' </td>';
   	   			//str +=' </tr>';
   	   			
   	   			//평균
   	   			//str +='<td class="txt_avg_money">'+Number(totalSum).toLocaleString()+' </td>';
   	   			str +=' </tr>';
   	   			
   	   			/*==================================== 부서 or 직원 합계 : E=================================== */
			}
   			for(var s=0; s<dv2List.length; s++){	//공통코드 리스트
   				var sum=0;
   			
   				/*==================================== 큰 분류(dv2)세팅 : S=================================== */
   				
   				//타이틀
   				str +='<tr class="title_row grp_'+i+'" id="dv_'+i+'_'+s+'" grp=grp_'+i+'  style="cursor:pointer;'+(searchType!='all' ? 'display:none;' : '')+'" onclick="fnObj.trDisplay(\''+i+'_'+s+'\',this,\'dv\');">';
   				str +='<th scope="row" style="background-color:#f7f7f7!important;"><span class="grp_span">';
   				str +=''+dv2List[s].NM+'</th>';
   				
   				//금액
   				for(var p=1; p<13; p++){			//12개의 열을 그리면서
   					str +='<td style="background:#f7f7f7;">';
   				 	for(var k=0; k<dv2CardList.length; k++){	
   				 		
   				 		//통계리스트의 month 와 p 가 같고, dv2의 값이 같을때	
						if(parseInt(dv2CardList[k].month) == p && dv2CardList[k].dv2 == parseInt(dv2List[s].CD)){
							str += Number(dv2CardList[k].sum).toLocaleString();
							sum += dv2CardList[k].sum;
						}
					}
   					str +=' </td>';
   				}
   				
   				//합계
   				str +='<td class="txt_sum_money" style="background:#f7f7f7;">'+Number(sum).toLocaleString()+' </td>';
   			    //평균
   	   			//str +='<td class="txt_avg_money">'+Number(sum).toLocaleString()+' </td>';
   				str +='</tr>';
   				
   				/*==================================== 큰 분류(dv2)세팅 : E=================================== */
   				/*==================================== 작은분류(dv)세팅 : S=================================== */
   				var cnt =0;	//row 색상 표시 
   				var trClass='';
   				for(var h=0; h<dvList.length; h++){
   					
   					if(dvList[h].cdSort == dv2List[s].CD){		//분류에 포함된 항목
   						var dvSum=0;							//우측 합계 sum
   						
   						if(h+1 < dvList.length){
   							trClass= (dvList[parseInt(h+1)].cdSort == dvList[h].cdSort ? 'sub_row' : 'sub_row sub_last');
   						}else{
   							trClass = 'sub_row sub_last';
   						}
   						
   						//타이틀
   						str +='<tr class="'+trClass+' dv_'+i+'_'+s+'"  dv=dv_'+i+' style="display:none;">';
   						str +='<th scope="row">'+dvList[h].NM+'</th>';
   						
   						//금액
   						for(var p=1;p<13;p++){					 //12개의 행을 그리면서
   	    					str +='<td>';
   	    					for(var k=0; k<dvCardList.length; k++){
   	    						
   	    						//dv의 값이 같고 통계리스트의 month 와 p 가 같을때
   	    						if(dvCardList[k].dv == parseInt(dvList[h].CD) && parseInt(dvCardList[k].month) == p){	
   	    							str +=Number(dvCardList[k].sum).toLocaleString();
   	    							dvSum += dvCardList[k].sum;
   	    						}
   	    					}
   	    					str +=' </td>';
   	    				}
   						
   						//합계
   						str +='<td class="txt_sum_money">'+Number(dvSum).toLocaleString()+' </td>';
   					    //평균
   		   	   			//str +='<td class="txt_avg_money">'+Number(dvSum).toLocaleString()+' </td>';
    	    			str +='</tr>';
    	    			cnt ++;
   					}
   				} 
   				/*==================================== 작은분류(dv)세팅 : E=================================== */
   			}
   		 	
   		 	/* str +='</tbody>';
		  	str +='</table>'; */
		  	/*==================================== 하나의 테이블세팅 : E=================================== */  
   		}
    	$("#dataTableDiv").html(str);
    	if(searchType != 'all'){		
    		$("#nameDiv").html('('+nameList.join(',   ')+')');
    	}
   	},
   	
   	//최하단 토탈 통계
   	totalDisplay : function(resultList){
   		$("#totalTableDiv").html('');
   		$("#totalTopTableDiv").html('');
   		var str='<tr>';
   		str +='<th scope="row">합계</th>';
	 	var totalSum=0;
	 	
		for(var p=1; p<13; p++){
			var idxSum=0;											//td 당 합계
			str +='<td>';
			for(var i=0; i<resultList.length; i++){
		    	var monthList = resultList[i].monthList;			//월별 통계 리스트
				for(var k=0; k<monthList.length; k++){
					if(parseInt(monthList[k].month) == p){
						totalSum +=monthList[k].sum;				//전체 합계
						idxSum += monthList[k].sum;					//td 당 합계
					}
				}
			}
			 str+=Number(idxSum).toLocaleString();
			 str +=' </td>';
		}
		
		str +='<td class="txt_sum_money">'+Number(totalSum).toLocaleString()+' </td>';
		//str +='<td class="txt_avg_money">'+Number(totalSum).toLocaleString()+' </td>';
		str +='</tr>';
		
	 	/*=============== 월별 통계 세팅 : E================= */
	 	str +='</tbody>';
	  	str +='</table>';
   		
	  	$("#totalTableDiv").html(str);
	  	if($("#searchType").val() != 'all'){
	  		$("#totalTopTableDiv").html(str);
	  	}
	},
	
	
	//지출리스트 사용자별 검색(통계화면)
	goMenuCard4Srch: function(){
		//parent.leftIframeOFF();
		//top_menu_new("${pageContext.request.contextPath}/card/cardList4Srch.do", "mainFrame");
		
		location.href="<c:url value='/card/cardList4Srch.do'/>";
	}
	
    /* ====================================== 화면 세팅 관련 : E ===================================*/
    
   
    //################# else function :E #################
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	fnObj.pageStart();		//화면세팅
});
</script>