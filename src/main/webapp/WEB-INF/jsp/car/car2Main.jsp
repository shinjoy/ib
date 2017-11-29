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
<title>Car2Main</title>

<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/new_style.css'/>" rel="stylesheet" type="text/css">

<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<link href="<c:url value='/images/favicon.ico' />" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">				<!-- jquery-ui -->
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

/* .network_st_box { 
	position:relative; border-top:#868d97 solid 2px; border-left:#b9c1ce solid 1px; 
	border-right:#b9c1ce solid 1px; border-bottom:#b9c1ce solid 1px; min-width:1350px; 
} */

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

.network_st_box .scroll_cover {
    position: absolute;
    right: 0px;
    top: 0px;
    z-index: 5;
    background: #dfe3e8;
    width: 17px;
    height: 123px;
    border-top: #cccccc solid 1px;    
    border-bottom: #cccccc solid 1px;
}

.selUserStyle, .selUserStyle option{
	height:22px;
}
.selUserStyle1, .selUserStyle1 option{
	font-weight:bold;
	height:22px;
}

.btn_standard{
	border-radius:2px;
	padding:4px 8px 4px 8px;
	margin-left:7px;
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

<!-- 내용 팝업 -->
<div style="display:none; position:absolute; width: expression( this.scrollwidth > 99 ? 200px : auto );  height: expression( this.scrollHeight > 99 ? 200px : auto ); border:2px solid #cccccc;  background-color:white; z-index:10000;" id="scheListArea" >

</div>

<fmt:formatDate var="nowDay" value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd'/>
<fmt:formatDate var="year" value='<%= new java.util.Date() %>' pattern='yyyy'/>
<fmt:formatDate var="month" value='<%= new java.util.Date() %>' pattern='MM'/>
<fmt:formatDate var="day" value='<%= new java.util.Date() %>' pattern='dd'/>
<div id="wrap" >
	<div id="carReg"  style=" width:90%; margin:40px auto; border:0px;"> 
	<div id="tb_titleZone"> 
		<span>
			<b>차량 운행일지</b>			
		</span>
		<span style="display:inline-block;width:90%;text-align:right; padding-bottom:3px;">
			<c:if test="${userLoginInfo.deptId eq '3' or userLoginInfo.permission ge '00020'}"> <!-- 버튼권한 : 경영지원팀, 대표님, 개발자 -->
			<button name="reg_btn" class="btn_standard" onclick="fnObj.goCarUseMgmt();" style="border:1px solid #095792; background-color:#387cc8;"><span id="regTxtSpan" style="color:white;">운행관리</span></button>
			</c:if>
		</span>
	</div>
	<div class="network_st_box" style="border:0!important;"> 
		<span class="scroll_cover" onclick="fnObj.showAllGrid();"><br/>▼</span>
        	
            <div class="scroll_header">
               <table id="SGridTarget_head" class="network_tb_st" style="table-layout:fixed; border:1px solid #ccc;" >
                    
                    <input type="hidden" id="sabun"> <!--사번 --> 
                    
                    <colgroup>
                    	<col width="6%" /> <!--차량번호, 사용일-->
                        <col width="6%" /> <!--부서-->
                        <col width="7%" /> <!--성명-->                            
                        <col width="6%" /> <!--주행전 거리-->
                        <col width="6%" /> <!--주행후 거리-->
                   		<col width="6%" /> <!--주행거리-->
                   		<col width="6%" /> <!--구분-->
                        <col width="18%" /><!--내용-->
                    </colgroup>
                    <thead>
                    	 <tr>
                        	 <th colspan="2" ><span id="carSelect"></span></th>
                      		 <th colspan="6" style="padding-right:400px; font-size:15px;">
                        	 	 <a href="javascript:fnObj.setDate(1);">◀</a>
                    				<b><span id="yearTxt">${year}</span> - <span id="monthTxt">${month}</span></b>
                    				<input type="hidden" name="year" id="year" value="${year}">
                    				<input type="hidden" name="nowmonth" id="nowmonth" value="${month}">
                    				<input type="hidden" name="month" id="month" value="${month}">
                    				<input type="hidden" name="day" id="day" value="${day}">	
                    				<a href="javascript:fnObj.setDate(2);">▶</a> 
                        	 </th>
                        </tr>
                        <tr>
                        	
                             <th rowspan="2" scope="col" >사용일</th>
                           	 <th colspan="2" scope="col">사용자</th>
                             <th colspan="2" scope="col">계기판</th>
                             <th rowspan="2" scope="col">주행거리</th>
                        	 <th colspan="2" scope="col">업무내용</th>
                        </tr>
                        <tr id="tblHeaderPart">
                        	<th>부서</th>
                        	<th>성명</th>
                        	<th>주행전 거리</th>   
                        	<th>주행후 거리</th>  
                                                  	
                            <th>업무용 여부</th>
                            <th>내용</th>
                        </tr>
                    </thead>
                 
                    <tbody>
                    	<%--<tr><td colspan=8 style="height:20px;border-bottom:1px solid #ccc;"></td></tr> --%>
                    	
			<tr>
				<td style="vertical-align:middle;">
					<div class="tdRel">
						<input type="text" id="inputUseDate" class="applyinput_B w_st06 mgl6" readonly="readonly" onchange="fnObj.divClear();"/><a href="#" onclick="$('#inputUseDate').datepicker('show');return false;" class="btn_calendar" style="margin-top:10px;"></a>
							</div>  
				</td>
				
				<td style="vertical-align:middle;"><div id="teamNm"></div></td> 
				<td style="vertical-align:middle;"><div id=adminuserDiv></div>
					<div id="normaluserDiv"><input type="hidden" id="sNb"></div>
				</td>
		
				
				<td style="vertical-align:middle; text-align: right;"><span id="beforeDistance"></span> KM</td>
				<td style="vertical-align:middle;"><input type="text" name="totalDistance" id="totalDistance" class="AXInput W60" style="text-align:center;" onkeyup="fnObj.calculateGap();"> KM</td>
				<td style="vertical-align:middle; text-align: right;"><span id="calGap"></span> KM</td>
				
				<td style="vertical-align:middle;"><select id="type">
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</td>
				<td style="text-align:left!important;vertical-align:middle;">
					<a href="javascript:$('#spanSelSchedule').empty();$('#scheSeq').val('0');$('#aDelCust').css('display','none'); " id="aDelCust" style="border:1px solid #cccccc;">&nbsp;X&nbsp;</a>
					<span id="spanSelSchedule" style="line-height:25px;"></span>
					<input type="text"  id="memoArea" class="AXInput W300" onfocus="javascript:fnObj.popUpmemo(this);"   onmouseup="javascript:fnObj.popUpmemo(this);" onkeyup="javascript:fnObj.memoDivSet(this);" >
					<input type="hidden" id="scheSeq" value="0">
					<input type="hidden" id="carNick">
				</td>
			</tr>
							                        
				</tbody>
			</table>                    
            </div>
            <div id="buttonArea" style="margin:5px 18px 10px 18px;text-align:right;">
               	<button name="reg_btn" onclick="fnObj.doSave();" style="padding:5px 70px 5px 70px; border:1px solid #cccccc; background-color:#f1f1f1;">등록</button>
            </div>
          
        	<div class="scroll_body" style="height:500px;border:1px solid #ccc;">
                <table id="SGridTarget_body" class="network_tb_st" style="table-layout:fixed;" >
                    <colgroup>
                        <col width="6%" /> <!--차량번호, 사용일-->
                        <col width="6%" /> <!--부서-->
                        <col width="7%" /> <!--성명-->                            
                        <col width="6%" /> <!--주행전 거리-->
                        <col width="6%" /> <!--주행후 거리-->
                   		<col width="6%" /> <!--주행거리-->
                   		<col width="6%" /> <!--구분-->
                        <col width="18%" /><!--내용-->
                    </colgroup>
                    <tbody>
                    
                    </tbody>
                 </table>
            </div> 
          	<label><a href="#" onclick="fnObj.showAllGrid();" class="btn_wh_bevel sort_normal" style="width:26px;">펼침</a></label>
     
   
    
	 </div> <!-- network_st_box -->
	
	</div>
</div><!-- wrap -->
</body>
</html>

<script type="text/javascript">

//Global variables :S ---------------

//공통코드

var myGrid = new SGrid();					   // instance		new sjs


var sNb='${userLoginInfo.staffSnb}'; 		  //로그인 유저의 sNb
var permission='${userLoginInfo.permission}'; //로그인 유저의 permission
var division='${userLoginInfo.division}';
var g_gridListStr;							  //그리드 데이터 string (객체화되기전 문자열 json... JSON.parse 로 객체로 만들어사용) (증권사 필터링을 위해..)


//Global variables :E ---------------
var carList;
var userList;

/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	

	//선로딩코드
	preloadCode: function(){
		//공통코드
		
		var colorObj = {};
		fnObj.permissionChk(colorObj);
		fnObj.getCarList();
		
		for(var i=0; i<carList.length; i++){
			carList[i].carModel = '&nbsp;' + carList[i].carNumber + '&nbsp;&nbsp;-&nbsp;&nbsp;' + carList[i].carModel; 
		}
	
		var cstSelectTag = createSelectTag('carId', carList, 'carId', 'carModel','${userLoginInfo.cusId}', 'fnObj.carChangeSelect();', colorObj, 180, 'selUserStyle1');		
		$("#carSelect").html(cstSelectTag);
		
		fnObj.carChangeSelect();
	
		//캘린더 세팅 
		$("#inputUseDate").datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true, 
			changeYear: true,
			showOn: "button",
			yearRange: 'c-7:c+7',
			maxDate: new Date(),
		
			showButtonPanel: true,
			isRTL: false,
		    buttonImageOnly: true,
		    buttonText: ""
		});	
		
		var nDate = new Date();
		$("#inputUseDate").datepicker('setDate', nDate);
	},

	//화면세팅
    pageStart: function(){
    			
    	//-------------------------- 그리드 설정 :S ----------------------------
    	/* 그리드 설정정보 */
    	var configObj = {
    		
    		targetID : "SGridTarget_body",		//두번째  테이블
    		
    		//그리드 컬럼 정보
    		colGroup : [    		
            {key:"startTime"},
            {key:"deptNm"},            
            {key:"userNm"},
           	{key:"beMileage", formatter:function(obj){return Number(obj.item.beMileage).toLocaleString();}},
            {key:"afMileage", formatter:function(obj){return Number(obj.item.afMileage).toLocaleString();}},	
            {key:"gap" , formatter:function(obj){return Number(obj.item.afMileage-obj.item.beMileage).toLocaleString();} },
            {key:"businessYn"},	
          	{key:"memo", formatter:function(obj){return obj.item.memo.substring(obj.item.memo.lastIndexOf("]")+1);}}
            ],
            
            body : {
                onclick: function(obj, e){
                
                }
    		}
            
    	};
    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
    	var rowHtmlStr = '<tr>';
    	rowHtmlStr +=	 '<td style="text-align:center;">#[0]</td>';
    	rowHtmlStr +=	 '<td class="left_txt">#[1]</td>';
    	rowHtmlStr +=	 '<td style="text-align:center;">#[2]</td>';
    	rowHtmlStr +=	 '<td style="text-align:right;padding-right:20px!important;">#[3] </td>';				
    	rowHtmlStr +=	 '<td style="text-align:right;padding-right:20px!important;">#[4] </td>';	
    	rowHtmlStr +=	 '<td style="text-align:right;padding-right:20px!important;">#[5] </td>';	
    	rowHtmlStr +=	 '<td style="text-align:center;">#[6]</td>';	
    	rowHtmlStr +=	 '<td class="left_txt" style="cursor:pointer;">#[7]</td>';			
    	rowHtmlStr +=	 '</tr>';
    	configObj.rowHtmlStr = rowHtmlStr; 
        
    	
    	myGrid.setConfig(configObj);		//그리드 설정정보 세팅
    	//-------------------------- 그리드 설정 :E ----------------------------
    	
     	//-------------------------- 모달창 :S -------------------------
    },//end pageStart.
    
    //검색
    doSearch: function(){ 
    	
    	//차량 아이디와 날짜
    	var carId =$("#carId").val();
    	var selectDay=$("#year").val()+'-'+$("#month").val();
    	var url = contextRoot + "/car2/getCarLogList.do";
    	var param = {
		    			carId:carId,
		    			selectDay:selectDay
    				};
    	
    	
    	//alert(JSON.stringify(param));
    	    	    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
			
    		myGrid.setGridData({				//그리드 데이터 세팅	*** 2 ***
								list: list		//그리드 테이터
							   });
    		
    		g_gridListStr = result;				//따로 전역변수에 넣어둔다
    		$("#beforeDistance").empty();
    		if(list.length>0){
    			console.log(list[0].afMileage);
    			$("#beforeDistance").append(Number(list[0].afMileage).toLocaleString());
    		}else{
    			$("#beforeDistance").append(0);
    		}
    		$("#totalDistance").val("")
			$("#calGap").empty();
    		$("#totalDistance").focus();
    		fnObj.divClear();
    	};
    	
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
    permissionChk: function(colorObj){ 
		
    	userList = getCodeInfo(null,"","",null, null, null,'/car2/userList.do',{division : division});
		if(permission==21||permission==16){
			
			var userSelectTag = createSelectTag('sNb', userList, 'sNb', 'usrNm','${userLoginInfo.staffSnb}', 'fnObj.userChangeSelect();', colorObj, 90, 'selUserStyle');		
			$("#normaluserDiv").empty();
			$("#adminuserDiv").html(userSelectTag);
			fnObj.userChangeSelect();
		}else{
			for(var i=0;i<userList.length;i++){
				if(userList[i].sNb==sNb){
					
					$("#normaluserDiv").html(userList[i].usrNm+'<input type="hidden" id="sNb">');
					$("#sNb").val(userList[i].sNb);
					$("#sabun").val(userList[i].sabun);
					$("#teamNm").html(userList[i].deptNm);
				}
			}
		}
	},//end permissionChk
    
    getCarList: function(){ 
    
        var url = contextRoot + "/car2/carList.do";
     	var param = { sNb :$("#sNb").val(), owned : 'B', enable : 'Y'};
     	
     	var callback = function(result){
     		var obj = JSON.parse(result)
     		carList = obj.resultList;
     	};
     	commonAjaxForSync("POST", url, param, callback);
     },//end getCarList
  
	///select 차종에 따른  model 변경
    carChangeSelect: function(){
    	var selectCarId = $('#carId').val();
    	for(var i=0;i<carList.length;i++){
    		var carId = carList[i].carId;
    		if(carId==selectCarId){
    			//$("#carModel").html(carList[i].carModel);
    			$("#carNick").val(carList[i].carNick);
    			break;
    		}
    	}
    	var nDate = new Date();
		$("#inputUseDate").datepicker('setDate', nDate);
    	fnObj.doSearch();
    	$("#scheSeq").val("0");
    }, //end carChangeSelect
  	
	///select 에 따른 부서 변경
    userChangeSelect: function(){
    	fnObj.divClear();
    	$("#scheSeq").val("0");
    	var selectSnb = $('#sNb').val();
    	for(var i=0;i<userList.length;i++){
    		var sNb = userList[i].sNb;
    		if(sNb==selectSnb){
    			$("#teamNm").html(userList[i].deptNm);
    			$("#sabun").val(userList[i].sabun);
    			break;
    		}
    	}
    	
    	//var nDate = new Date();
		//$("#inputUseDate").datepicker('setDate', nDate);

    	
    }, //end carChangeSelect
    
   	setDate: function(type){
    	
    	var year =$("#year").val();
    	var month=$("#month").val();
    	var day =$("#day").val();
    	var nowmonth=$("#nowmonth").val();
    	var oDate = new Date(year, month-1, 1);
    	var selectMonth;
    	var fullmonth;
    	if(type==1){//감소
    		
			oDate.setMonth(oDate.getMonth()-1);
		}
    	if(type==2){//증가
    		
    		oDate.setMonth(oDate.getMonth()+1);
    		
    		if(new Date().yyyy_mm_dd() < (oDate.getFullYear() + '-' + fillzero(oDate.getMonth()+1, 2) + '-01')){
    			return;
    		}
    	}
    	
    	selectMonth=oDate.getMonth()+1;
		fullmonth =  selectMonth < 10 ? '0' + selectMonth : '' + selectMonth
    	
    	$("#year").val(oDate.getFullYear());
		$("#month").val(fullmonth);
		if(fullmonth!=nowmonth){
			day='01';
		}
		$("#inputUseDate").val($("#year").val()+'-'+fullmonth+'-'+day);
		$("#yearTxt").html(oDate.getFullYear());
		$("#monthTxt").html(fullmonth)
		
		fnObj.doSearch();
    },//end setDate
  	popUpmemo: function(th){
   	 	
	    if($("#scheSeq").val()==0){
	    		var left = $(th).offset().left;
	    		var top = $(th).position().top + $(th).height() +74; 
		    	$("#scheListArea").css({display:"",left:left,top:top});
		    	
		    	var url = "<c:url value='/car2/popUpmemo.do'/>";
		     	var date = $("#inputUseDate").val();
		     	var carNick = $("#carNick").val();
		     	var params = {date: date,carNick :carNick};
	     		
		     	var callback = function(result){
		     		var obj = result;
		     		//console.log(obj);
		     		$("#scheListArea").html(obj);  
	     		};
	     	$.ajax({
	    		type	: "POST",        			//"POST" "GET"
	    		url		: url,    					//PAGEURL
	    		data	: params,					//parameter object
	    		dataType: "html",
	    		timeout : 100000,       				//제한시간 지정(millisecond)
	    		cache 	: false,        			//true, false
	    		success	: callback,				//SUCCESS FUNCTION
	    		async	: true,
	    		error	: function whenError(x,e){	//ERROR FUNCTION			
	    			alertMsg("[FAIL!!]\n\n실패하였습니다!\n\n재시도후 문의바랍니다!");			
	    		}
	    	});
     	}
     },//end popUpmemo
     //팝업 메모 세팅
     setMemo: function(ScheSeq,ScheEDate,memo){
    	 if(ScheSeq>0){
     		$("#spanSelSchedule").html(memo + '<br/>');
     		
 	    	
 	    	$("#scheSeq").val(ScheSeq);
 	    	if(ScheSeq>0){
 	    		$("#inputUseDate").val(ScheEDate);
 	    	}
 	    	$("#scheListArea").css("display","none"); 
 	    	$("#aDelCust").css("display",""); 
 	    	
    	 }
     	
     },//end setMemo
    //################# else function :E #################
     //저장
     doSave: function(){ 
     	var memo=$("#memoArea").val();
     	var totalDistance=$("#totalDistance").val().replace(/,/g,'');
     	var useDate = $("#inputUseDate").val();
     	var scheSeq = $("#scheSeq").val();
     	var carId=$("#carId").val();
        if(scheSeq=="0" && memo==""){
     	   alert("업무내용을 확인해주세요.");
     	  $("#memoArea").focus();
     	   return false;
        }
        if(totalDistance==""||totalDistance=="0"||!strInNum(totalDistance)){
     	   alert("주행후 거리를 확인해주세요.");
     	  $("#totalDistance").focus();
     	   return false;
        }
    
        var url = contextRoot + "/car2/insertCarLog.do";
     	var param = {
     			        carId   : carId,
     			        useDate : useDate,
     			        type    : $("#type").val(),
     					totalDistance : totalDistance,
     					memo    :$("#memoArea").val(),
     					scheSeq :$("#scheSeq").val(),
     					sNb     :$("#sNb").val()
 		    		};
     	//	alert(JSON.stringify(param));
     	var callback = function(result){
     		var obj = JSON.parse(result);
     		var sub = obj.resultObject;	
     		var cnt = sub.cnt;
     		var errDis = sub.errDis;
     		if(cnt > 0){
     			toast.push("등록되었습니다!");
     			$("#scheSeq").val("0");
     			var arr =useDate.split("-");
     			$("#year").val(arr[0]);
     			$("#yearTxt").html(arr[0]);
     			$("#month").val(arr[1]);
     			$("#monthTxt").html(arr[1]);
     			$("select[id='carId'] option[value="+carId+"]").prop("selected",true);
     			
     			fnObj.doSearch();
     		}else{
     			if(cnt==-2){
     				alert("입력하신 주행후 거리가 전날의 최종거리 보다 같거나 작습니다. 주행후 거리를 확인해주세요. [전날 최종거리:"+errDis+"KM]");
     			}
     			if(cnt==-3){
     				alert("입력하신 주행후 거리가  다음날의 최종거리 보다 같거나 큽니다. 주행후 거리를 확인해주세요. [다음날 최종거리:"+errDis+"KM]" );
     			}
     			if(cnt==-4){
     				alert("이미 등록된 최종 거리가 있습니다. 주행후 거리를 확인해주세요. " );
     			}
     		}
     	};
     	commonAjax("POST", url, param, callback, true, null, null);
     },//end doSave
    //차이계산
     calculateGap: function(){
    	 fnObj.setComma();
     	$("#calGap").empty();
     	var totalDistance = parseInt($("#totalDistance").val().replace(/,/g,''));
     	var beforeDistance=parseInt($("#beforeDistance").text().replace(/,/g,''));
     	$("#calGap").append(Number(totalDistance-beforeDistance).toLocaleString());
     },//end calculateGap
 	//페이지 사이즈 세팅
    setPageSize: function(isSearch){
    	
    	pageSize = $('#sel_page_size').val();
    	
    	//검색도 바로할 경우 ... isSearch ... true
		if(isSearch){
			fnObj.doSearch(1);
    	}
    },
	//input , 생성
    setComma : function(){
    	var p = $("#totalDistance").val().match(/\d+/g).join('');
		var reg = /(^[+-]?\d+)(\d{3})/;  
		p += ''; 
		while (reg.test(p)) p = p.replace(reg, '$1' + ',' + '$2');
		$("#totalDistance").val(p);
	},//end setComma
	//그리드 div height toggle
    showAllGrid: function(){
    	var gridH = $('#SGridTarget').height() + 100;
    	if($('.scroll_body').height() == 450){
    		$('.scroll_body').css('height', gridH);
    		$('.scroll_body').css('max-height', gridH);
    	}else{
    		$('.scroll_body').css('height', '450px');
    		$('.scroll_body').css('max-height', '450px');
    	}
    },//end showAllGrid
    divClear : function(){
	    	$("#totalDistance").val("")
			$("#calGap").empty();
			$("#totalDistance").focus();
    		$("#memoArea").val("");
    		$("#spanSelSchedule").empty();
    		$("#scheListArea").css("display","none"); 
    		$("#aDelCust").css("display","none"); 
    },//end divClear
    memoDivSet : function(obj){
    	
    	if(obj.value==""){
    		$('#scheListArea').css('display','');
    	}else{
    		$('#scheListArea').css('display','none');
    	}
    	
    	
    },
    
    
	//운행관리 화면 go
    goCarUseMgmt : function(){
    	location.href = '<c:url value="/car2/carMgmt.do" />';
    }

};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
		fnObj.preloadCode();		//선코딩
		fnObj.pageStart();		//화면세팅
		fnObj.doSearch(); //해당 차량 리스트
});




</script>