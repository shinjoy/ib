<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/new_style.css'/>" rel="stylesheet" type="text/css">

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/calendar_beans_v2.0.js'/>" ></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">				<!-- jquery-ui -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->

</head>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<body>
<fmt:formatDate var="nowMonth" value='<%= new java.util.Date() %>' pattern='yyyy-MM'/>
<fmt:formatDate var="nowDay" value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd'/>

<div id="wrap">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
	
	<!--업무승용차운행기록부-->
	<div class="carMgmt_wrap" >
	<div class="carMgmt_wrap2">
		<div class="carSearchBox">
	 		<span class="carSearchtitle">차량번호</span>
	     	<span id="carSelect"></span>
	        <span class="carSearchtitle mgl30">기간</span>
	        <input type="text" value="" class="input_b" id="inputStartDate" readonly="readonly"/><a href="#" onclick="$('#inputStartDate').datepicker('show');return false;" class="btn_calendar" style="margin-top:5px;"></a><span class="between_txt">~</span><input type="text" id="inputEndDate" value="" class="input_b" readonly="readonly"/><a href="#" onclick="$('#inputEndDate').datepicker('show');return false;" class="btn_calendar" style="margin-top:5px;"></a>
	        <button type="button" class="btn_b_black mgl10" onclick="fnObj.doSearch();">조회</button>
	        <div class="btnRightZone">
	        	<button type="button" class="btn_b2_skyblue" onclick="fnObj.excel();"><em class="icon_XLS">파일로 저장</em></button>
	        	<button type="button" class="btn_b_skyblue mgl6" onclick="javascript:fnObj.printPage();"><em class="icon_print">인쇄</em></button>
	        	<button type="button" class="btn_b_skyblue mgl6"><em class="icon_check">검증</em></button>
	        </div>
	    </div>
	    <div class="printAreaLine"><span class="icon_print">인쇄영역</span></div>
	    <div id="excel_data">
	    <p class="car_attachment"><strong>[</strong>업무용승용차 운행기록부에 관한 별지 서식<strong>]</strong> &lt;2016.04.01 제정&gt;</p>
	    <table class="carList_title_st" id="topTitle">
	    	<colgroup>
	        	<col width="100" />
	            <col width="100" />
	            <col colspan=3 width="*" />
	            <col width="10" />
	            <col width="10" />
	        </colgroup>
	        <tr>
	            <td rowspan="2" class="th_w_title">과세기간</td>
	            <td><span id="startday"></span></td>
	            <td rowspan="2" colspan="5" class="note_title">업무승용차 운행기록부</td>
	            <td class="th_w_title">상호명</td>
	            <td><div id="hqName"></div></td>
	        </tr>
	      <tr>
	        <td><span id="endday"></span></td>
	        <td class="th_w_title">사업자등록번호</td>
	        <td><div id="regNumber"></div></td>
	      </tr>
	    </table>
	    <h3 class="prt_title_b">1. 기본정보</h3>
	    <table class="carList_tb_st01" id="carTitle" summary="기본정보(차종, 자동차등록번호)">
	    	
	        <colgroup>
	            <col width="120" />
	            <col width="200" />
	        </colgroup>
	        <thead>
	            <tr>
	                <th>① 차종</th>
	                <th  colspan="3" >② 자동차등록번호</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td><span id="carModel"></span></td>
	                <td colspan="3" ><span id="carNumber"></span></td>
	            </tr> 
	        </tbody>
	    </table>
	
		<h3 class="prt_title_b">2. 업무용 사용비율 계산</h3>
	    <table id="SGridTarget" class="carList_tb_st02" summary="업무용 사용비율 계산내역 (사용일자, 사용자, 주행거리, 업무내용)">
	      
	        <colgroup>
	            <col width="120" /><!--사용일자-->
	            <col width="60" /><!--부서-->
	            <col width="60" /><!--성명-->
	            <col width="*" /><!--주행전계기판-->
	            <col width="*" /><!--주행후계기판-->
	            <col width="*" /><!--주행거리-->
	            <col width="*" /><!--출퇴근용-->
	            <col width="*" /><!--일반업무용-->
	            <col width="160" /><!--업무내용-->
	        </colgroup>
	        <thead id="Title">
	            <tr>
	                <th rowspan="3" scope="col">③ 사용일자<br>(요일)</th>
	                <th colspan="2" scope="col">④ 사용자</th>
	                <th colspan="6" scope="col">운행내역</th>
	            </tr>
	            <tr>
	                <th rowspan="2" scope="col">부서</th>
	                <th rowspan="2" scope="col">성명</th>
	                <th rowspan="2" scope="col">⑤ 주행전<br>계기판의 거리(km)</th>
	                <th rowspan="2" scope="col">⑥ 주행후<br>계기판의 거리(km)</th>
	                <th rowspan="2" scope="col">⑦ 주행거리<br>(km)</th>
	                <th colspan="2" scope="col">업무용사용거리(km)</th>
	                <th rowspan="2" scope="col">⑩ 업무내용</th>
	            </tr>
	            <tr>
	                <td>⑧ 출ㆍ퇴근용<br>(km)</td>
	                <td>⑨ 일반업무용<br>(km)</td>
	            </tr>
	        </thead>
	        <tbody>
	       
	        </tbody>
	        <tfoot>
	            <tr>
	                <th colspan="3" rowspan="2" class="bgcolor_gray">총계</th>
	                <td colspan="3">⑪ 과세기간총주행거리</td>
	                <td colspan="2">⑫ 과세기간업무용 사용거리</td>
	                <td>⑬ 업무사용비율 (⑫/⑪)</td>
	            </tr>
	            <tr>
	                <td colspan="3"><span id="total"></span></td>
	                <td colspan="2"><span id="business"></span></td>
	                <td><span id="businessRate"></span></td>
	            </tr>
	        </tfoot>     
	    </table>
	    </div>
	</div>    
	</div>
	<!--//업무승용차운행기록부//-->
	
</div>

</body>
</html>




<script type="text/javascript">

//Global variables :S ---------------

//공통코드
var comCodeCstType;			//고객구분


var myGrid = new SGrid();		// instance		new sjs
var g_gridListStr;										//그리드 데이터 string (객체화되기전 문자열 json... JSON.parse 로 객체로 만들어사용) (증권사 필터링을 위해..)

//Global variables :E ---------------
var carList='';


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	

	//선로딩코드
	preloadCode: function(){
		//공통코드
		
	 	var colorObj = {};
		carList = getCodeInfo(null,'','',null, null, null,'/car2/carList.do',{owned : 'B'});
		console.log(carList);
	
		for(var i=0; i<carList.length; i++){
			carList[i].carModel = '&nbsp;' + carList[i].carNumber + '&nbsp;&nbsp;-&nbsp;&nbsp;' + carList[i].carModel; 
		}
	
		var cstSelectTag = createSelectTag('carId', carList, 'carId', 'carModel','${userLoginInfo.cusId}', '', colorObj, 180, 'selUserStyle1');		
		$("#carSelect").html(cstSelectTag);
		

		fnObj.carChangeSelect();
		
		
		//캘린더 세팅 
		$("#inputStartDate").datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true, 
			changeYear: true,
			yearRange: 'c-7:c+7',
			maxDate: new Date(),
			showButtonPanel: true,
			isRTL: false,
		    buttonImageOnly: true
		});	
		var startDate = new Date();
		startDate.setDate('01');
		$("#inputStartDate").datepicker('setDate', startDate);
		
		//캘린더 세팅 
		$("#inputEndDate").datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true, 
			changeYear: true,
			yearRange: 'c-7:c+7',
			maxDate: new Date(),
			showButtonPanel: true,
			isRTL: false,
		    buttonImageOnly: true
		});	
		var endDate = new Date();
		$("#inputEndDate").datepicker('setDate', endDate);
		fnObj.setDate();
		
		//유저 리스트
		
	},

	//화면세팅
    pageStart: function(){
    	
    	//$("#inputUseDate").bindDate();			
    	//-------------------------- 그리드 설정 :S ----------------------------
    	/* 그리드 설정정보 */
    	var configObj = {
    		
    		targetID : "SGridTarget",		//테이블
    		
    		//그리드 컬럼 정보
    		colGroup : [    		
            {key:"startTime"},
            {key:"deptNm"},            
            {key:"userNm"},
           	{key:"beMileage", formatter:function(obj){return Number(obj.item.beMileage).toLocaleString();}},
            {key:"afMileage", formatter:function(obj){return Number(obj.item.afMileage).toLocaleString();}},	
            {key:"gap" , formatter:function(obj){return Number(obj.item.afMileage-obj.item.beMileage).toLocaleString();}},
            {key:"businessN",formatter:function(obj){
										            	if(obj.item.businessYn=='N'){
										            		return Number(obj.item.afMileage-obj.item.beMileage).toLocaleString();	
										            	}
            }},
            {key:"businessY",formatter:function(obj){
										            	if(obj.item.businessYn=='Y'){
										            		return Number(obj.item.afMileage-obj.item.beMileage).toLocaleString();
											
										            	}
            }},
          	{key:"memo"}
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
    	rowHtmlStr +=	 '<td style="text-align:center;">#[7]</td>';	
    	rowHtmlStr +=	 '<td class="left_txt">#[8]</td>';			
    	rowHtmlStr +=	 '</tr>';
    	configObj.rowHtmlStr = rowHtmlStr; 
        
    	
    	myGrid.setConfig(configObj);		//그리드 설정정보 세팅
    	//-------------------------- 그리드 설정 :E ----------------------------
    	
     	//-------------------------- 모달창 :S -------------------------
   
    
    },//end pageStart.
    
    //검색
    doSearch: function(){ 
    	
    	
    	fnObj.carChangeSelect();
    	fnObj.setDate();
    	//차량 아이디와 날짜
    	var carId =$("#carId").val();
    
    	var selectDay=$("#inputStartDate").val();
    	var endDay=$("#inputEndDate").val();
    
    	var url = contextRoot + "/car2/getCarLogList.do";
    	var param = {
		    			carId:carId,
		    			selectDay : selectDay,
		    			endDay : endDay
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
    	
    		var total=0;
    		var business=0;
    		var avg=0;
    		for(var i=0;i<list.length;i++){
    			total+=parseInt(list[i].afMileage)-parseInt(list[i].beMileage);
    			if(list[i].businessYn=='Y'){
    				business+=parseInt(list[i].afMileage)-parseInt(list[i].beMileage);
    			}
    		}
    		$("#total").html(total+' km');
    		$("#business").html(business+' km');
    		if(business>0 || total>0 ){
    			avg=(business/total);
    		}
    		$("#businessRate").html(avg.toFixed(2)*100+' %');
    		//전체 건수 세팅
			$('#total_count').html(cnt);
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
  
	///select 차종에 따른  model 변경
    carChangeSelect: function(){
    	var selectCarId = $('#carId').val();
    	for(var i=0;i<carList.length;i++){
    		var carId = carList[i].carId;
    		if(carId==selectCarId){
    			$("#carModel").html(carList[i].carOrgModel);
    			$("#carNumber").html(carList[i].carNumber);
    			$("#hqName").html(carList[i].hqName);
    			$("#regNumber").html(carList[i].regNumber);
    			break;
    		}
    	}
     }, //end carChangeSelect
  	

   setDate: function(type){
    	
    	var inputStartDate =$("#inputStartDate").val().replace(/-/gi,".");
    	var inputEndDate=$("#inputEndDate").val().replace(/-/gi,".");
    	$("#startday").html(inputStartDate);
     	$("#endday").html(inputEndDate);
		
	 },//end setDate
  	
   
     //차이계산
     calculateGap: function(){
    	 fnObj.setComma();
     	$("#calGap").empty();
     	var totalDistance = parseInt($("#totalDistance").val().replace(/,/g,''));
     	var beforeDistance=parseInt($("#beforeDistance").text().replace(/,/g,''));
     	$("#calGap").append(Number(totalDistance-beforeDistance).toLocaleString());
     },//end calculateGap
     
    excel : function(){
    	
    	var str = '<table>';
    	str+=  ' <tr bgcolor=silver><td bgcolor=white></td>';
    	str+=   $('#excel_data').html();
   
    	str+=  '  </table>';
    	console.log(str);
    	excelDown(str, '차량운행일지'+(new Date().yyyy_mm_dd()));
    },//end excel
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
    },//end excelDown
    printPage : function(){
    	window.print(); 
    },//end printPage
 
 	//페이지 사이즈 세팅
    setPageSize: function(isSearch){
    	
    	pageSize = $('#sel_page_size').val();
    	
    	//검색도 바로할 경우 ... isSearch ... true
		if(isSearch){
			fnObj.doSearch(1);
    	}
    },//end setPageSize

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
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
		fnObj.preloadCode();	//선코딩
		fnObj.doSearch(); 	    //해당 차량 리스트
		fnObj.pageStart();		//화면세팅
});
</script>