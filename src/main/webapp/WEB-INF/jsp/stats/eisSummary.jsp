<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<html>
<head>

<link href="<c:url value='/css/new_ib.css'/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value='/css/jquery.jqplot.css'/>" rel="stylesheet" type="text/css"/>

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/stats.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/ajaxRequest.js'/>" ></script>

<script type="text/javascript" src="<c:url value='/js/jqplot/jquery.jqplot.min.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.barRenderer.min.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.categoryAxisRenderer.min.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.barRenderer.min.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.pieRenderer.min.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.highlighter.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.cursor.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.pointLabels.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.donutRenderer.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.canvasAxisTickRenderer.min.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.canvasAxisTickRenderer.min.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.canvasTextRenderer.min.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.dateAxisRenderer.min.js'/>" ></script>

<style>

</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
</head>

<body>

<div id="ib_sumarry_wrap">
	<div id="navcontainer">
      	<ul class="navlist">
			<li id="active_l1" ><a id="current" href="<c:url value='/stats/eisSummary.do' />" >EIS Summary</a></li>
     		<li><a href="<c:url value='/stats/eisInvestResult.do' />" >투자 회수 현황</a></li>
     		<li><a href="<c:url value='/stats/eisPeriodRecord.do' />" >기간별 실적현황</a></li>
     		<li><a href="<c:url value='/stats/eisMemberRecord.do' />" >직원별 실적현황</a></li>                        
     		<li id="active_r1" ><a href="<c:url value='/stats/eisMediation.do' />" >중개현황</a></li>
 		</ul>
	</div>
	<div id="ib_sumarry_wrap1">
	<div id="ib_sumarry_wrap2">        
        <h3 class="ib_h3_title">시너지 파트너스 실적현황<span>
        	<select id="sel_year" class="select_b mgl25" onchange="fnObj.doSearch();">        	
        		<option selected value="2015">2015년</option>
        		<option value="2014">2014년</option>
        		<option value="2013">2013년</option>
        		<option value="2012">2012년</option>
        	</select>
        	<!--  <a href="#" class="btn_compare2" onclick="fnObj.doSearch();"><em class="blind">실적현황</em></a>-->
        	</span></h3>
        <!-- 써머리 테이블st -->
        <div class="Point_infoBox_03">
        	<div id="title_year_div" class="title_year">2015</div>
            <div class="summaryinfo">
            	<table class="summary_table_b">
                    <thead>
                        <tr>
                            <th scope="col">구분</th>
                            <th scope="col">총투자</th>
                            <th scope="col">직접투자</th>
                            <th scope="col">중개</th>
                            <th scope="col">중개이익</th>
                            <th scope="col">건수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="summary_table_total" >
                            <th scope="row">Total</th>
                            <td class="numtype_right investmoney">3271.6 억</td>
                            <td class="numtype_right investmoney">2781.4 억</td>
                            <td class="numtype_right investmoney">490.2 억</td>
                            <td class="numtype_right getmoney">32.1 억</td>
                            <td class="numtype_right getmoney">75 건</td>
                        </tr>
                        <tr id="summary_table_mezza" class="point">
                            <th scope="row">메자닌</th>
                            <td class="numtype_right">2519.5 억</td>
                            <td class="numtype_right">2284.7 억</td>
                            <td class="numtype_right">234.8 억</td>
                            <td class="numtype_right">4.1 억</td>
                            <td class="numtype_right">45 건</td>
                        </tr>
                        <tr id="summary_table_x-mezza" >
                            <th scope="row">메자닌 외</th>
                            <td class="numtype_right">- 억</td>
                            <td class="numtype_right">- 억</td>
                            <td class="numtype_right">- 억</td>
                            <td class="numtype_right">- 억</td>
                            <td class="numtype_right">- 건</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!--// 써머리 테이블st //-->
        
        <!-- 첫번째 라인 -->
        <div class="divBlockWrap">
            <div class="left_block">
                <h4 class="h4_box_title">Deal Summary</h4>
                <div class="graphBox">
                    <!-- 소싱/미팅 -->
                    <dl class="titleAndGraph">
                        <dt>소싱/미팅</dt>
                        <dd class="Process_bar" id="sourcing_success_rate"><span class="current" style="width:50">18%</span><span class="totalNum"><strong>124</strong> / 2154</span></dd>
                    </dl>
                    <!--// 소싱/미팅 //-->
                    <!-- Deal 현황그래프 -->
                    <dl class="titleAndGraph">
                        <dt>Deal 현황</dt>
                        <dd><div id="invest_success_rate_chart"></div></dd>
                    </dl>
                    <!--// 투자성사율그래프 //-->
                    <table class="data_table_b">
                        <thead>
                            <tr>
                                <th scope="col">&nbsp;</th>
                                <th scope="col">미팅</th>
                                <th scope="col">소싱</th>
                                <th scope="col">투자</th>
                                <th scope="col">중개</th>
                            </tr>
                        </thead>
                        <tbody id=deal_summary_data>
                        </tbody>
                        
                    </table>
                </div>
            </div>
            <div class="right_block">
                <h4 class="h4_box_title">M&amp;A Summary</h4>
                <div class="graphBox">
                    <!-- M&A매칭률 -->
                    <dl class="titleAndGraph">
                        <dt>M&amp;A매칭률</dt>
                        <dd id="mna_success_rate" class="Process_bar"><span class="current">18%</span><span class="totalNum"><strong>124</strong> / 2154</span></dd>
                    </dl>
                    <!--// M&A매칭률 //-->
                    <!-- 투자현황그래프 -->
                    <dl class="titleAndGraph">
                        <dt>M&amp;A현황</dt>
                        <dd><div id="mna_success_rate_chart" ></div></dd>
                    </dl>
                    <!--// 투자현황그래프 //-->
                    <table class="data_table_b">
                        <thead id="mna_summary_column">
                            <tr>
                                <th scope="col">&nbsp;</th>
                                <th scope="col">소싱</th>
                                <th scope="col">대기</th>
                                <th scope="col">매칭</th>
                                <th scope="col">성사</th>
                                <th scope="col">폐기</th>                                
                            </tr>
                        </thead>
                        <tbody id="mna_summary_data">   
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        
        
        <!-- 두번째 라인 -->
        <div class="divBlockWrap">
            <div class="left_block">
                <h4 class="h4_box_title">DEAL - 상태별 분석</h4>
                <div class="graphBox">
                    <!-- 전체 Deal - 진행상황 그래프 -->
                    <div class="posi_Relative">
                    	<div id="deal_progress_chart"></div>
                    	<div class="PointTotal_tab1"><p class="title">전체소싱수</p><p id="deal_progress_total" class="totalnum">193</p></div>
                    </div>
                    <!--// 전체 Deal - 진행상황 그래프 //-->
                    <table class="data_table_b">
                        <thead id="deal_progress_column"/>
                        <tbody id="deal_progress_data"/>
                    </table>
                </div>
            </div>
            <div class="right_block">
                <h4 class="h4_box_title">DEAL - 유형별 분석</h4>
                <div class="graphBox">
                    <!-- 전체 Deal - 유형분석 그래프 -->
                    <div class="posi_Relative">
                    	<div id="deal_category_chart"></div>
                    	<div class="PointTotal_tab1_2"><p class="title">전체소싱수</p><p id="deal_category_total" class="totalnum">193</p></div>
                    </div>
                    <!--// 전체 Deal - 유형분석 그래프 //-->
                    <table class="data_table_b">
                        <thead id="deal_category_column"/>
                        <tbody id="deal_category_data"/>
                    </table>
                </div>
            </div>
        </div>
        
        
        
        <!-- 세번째 라인 -->
        <div class="divBlockWrap">
            <div class="left_block">
                <h4 class="h4_box_title">투자 유형분석 - 건수별</h4>
                <div class="graphBox">
                    <!-- 직접투자 건별 그래프 -->
                    <div class="posi_Relative">
	                    <div id="deal_self_invest_case_chart"></div>
                    	<div class="PointTotal_tab1_3"><p class="title">투자건수</p><p id="deal_self_invest_case_total" class="totalnum">193</p></div>
                    </div>
                    <!--// 직접투자 건별 그래프 //-->
                    <table class="data_table_b">
                        <thead id="deal_self_invest_case_column"/>                        
                        <tbody id="deal_self_invest_case_data"/>                        
                    </table>
                </div>
            </div>
            <div class="right_block">
                <h4 class="h4_box_title">투자 유형분석 - 금액별</h4>
                <div class="graphBox">
                    <!-- 직접투자 금액별 그래프 -->
                    <div class="posi_Relative">
	                    <div id="deal_self_invest_amount_chart"></div>
                    	<div class="PointTotal_tab1_4"><p class="title">투자금액</p><p id="deal_self_invest_amount_total" class="totalnum">193</p></div>
                    </div>
                    <!--// 직접투자 금액별 그래프 //-->
                    <table class="data_table_b">
                        <thead id="deal_self_invest_amount_column"/>
                        <tbody id="deal_self_invest_amount_data"/>                 
                    </table>
                </div>
            </div>
        </div>        
        
        <!-- 네번째 라인 -->
        <div class="divBlockWrap">
            <h4 class="h4_box_title">3년 동기대비 실적비교
            	<select id="compare_3year_select" class="select_b mgl25" onchange="fnObj.doLoadRecordCompare(1);">
            		<option selected value=2015>2015년</option>
            		<option value=2014>2014년</option>
            	</select>
            	<select id="compare_12month_select" class="select_b" onchange="fnObj.doLoadRecordCompare(1);">
            	<option value=2014>2014년</option></select>
            <!-- 
            <a href="#" class="btn_compare" onclick="fnObj.doLoadRecordCompare(1); return false;" ><em class="blind">실적비교</em></a>
             -->
            </h4>
            <div class="graphBox">
                <table class="data_table_b">
                    <thead id="record_compare_column">
                    </thead>
                    <tbody id="record_compare_data">
                    </tbody>
                </table>
                <!-- 투자성사율그래프 -->
                <div class="divBlockWrap mgt25">
                    <div class="compare_TypeA" id="compare_TypeA">
                        <!--3년토탈 or 지정된 월까지의 총금액 총건수-->                        
                    </div>
                    <div class="compare_TypeB" id="compare_TypeB">
                        <!--3년간 매월 건수 비교-->                        
                    </div>
                </div>
                <!--// 투자성사율그래프 //-->
            </div>
        </div>
        

        
        <%--<img src="../images/stats/@test.jpg" alt="">--%>
        </div>      
    </div>    
</div>
 
<div id=chartBarMember style="width:95%;margin-left:20px;margin-top:20px"></div>
 
</body>
</html>

<script type="text/javascript">
var curr1 = null;
var curr2= null;
var curr3= null;

var fnObj = {
		
		//################# init function :S #################
		
		//선로딩코드
		preloadCode: function(){
			
			var today = new Date();
			var curYear = today.getFullYear();
			var curMonth = today.getMonth() + 1;
			
			/** 년도 정보 채우기 **/
			var html = "";
			for( var i = curYear; i > 2012; i-- ){
				if( curYear == i ){
					html += "<option value='" + i + "' selected>" + i + "년</option>";		
				}	
				else{
					html += "<option value='" + i + "'>" + i + "년</option>";		
				}
			} 	
			
			$("#sel_year").html(html);
			
			
			
			/** 월 정보 채우기 **/
			html = "";
			
			for(var i = 1; i< 13; i++){
				if( curMonth == i )
					html += "<option value=" + i + " selected>" + i + "월</option>";
				else
					html += "<option value=" + i + ">" + i + "월</option>";						
			}
			
			$("#compare_12month_select").html(html);
					
			
			/** 3년 동기대비 실적 정보 채우기 **/
			html = "";
			for( var i = curYear; i > 2013; i-- ){
				if( curYear == i ){
					html += "<option value='" + i + "' selected>" + i + "년</option>";		
				}	
				else{
					html += "<option value='" + i + "'>" + i + "년</option>";		
				}
			}
			$("#compare_3year_select").html(html);
		},
		
		//화면세팅
	    pageStart: function(){
	    	
	    	
	    	
	    	$("#title_year_div").html($("#sel_year").val());
	    	
	    	
	    },
	    
	    doSearch: function(){	
	    	var selYear = ($("#sel_year").val());
	    	$("#title_year_div").html(selYear);
	    	
	    	//fnObj.doLoadInvestAmountSummary(selYear);
	    	fnObj.doLoadTotalInvestAmountSummary(selYear);
	    	fnObj.doLoadDealSummary(selYear); 	    	
	    	fnObj.doLoadMnaSummary(selYear);
	    	fnObj.doLoadDealProgress(selYear);
	    	fnObj.doLoadDealCategory(selYear);
	    	fnObj.doLoadSelfInvestCase(selYear);
	    	fnObj.doLoadSelfInvestAmount(selYear);
	    	fnObj.doLoadRecordCompare(0);
	    },    
	    
	    
	    doLoadSummaryDate: function(selYear){
	    	var dateVal = new Date();	
	    	
	    	var yyyy = dateVal.getFullYear().toString();
	        var mm = (dateVal.getMonth() + 1).toString();
	        var dd = dateVal.getDate().toString();

	        var currDate =  yyyy + "/" + (mm[1] ? mm : '0'+mm[0]) + "/" + (dd[1] ? dd : '0'+dd[0]);
	        
	    	$('#eis_summary_date').text('(' + yyyy + '/01/01 ~ ' + currDate +  ')');
	    },
	    
	    // 투자규모 및 총액
	    doLoadInvestAmountSummary: function(selYear){
	    	var url = "<c:url value='/stats/doLoadInvestAmountSummary.do' />";
	    	var param= {
	    			year:selYear
	    	}; 
	    	
			var callback = function(result){
	    		
				var htmlValue;
	    		var obj = JSON.parse(result);
	    		var resultObj = obj.resultObject;
	    		console.debug('## doLoadInvestAmountSummary ##');
	    		console.debug(resultObj);
	    		if( resultObj.result.length == 1 ){
	    			console.debug('rdioxosdjfo#@#$@');
	    			var investAmout = resultObj.result[0];
	    			
	    			// INVEST : 전체 투자 금액
					// SELF_INVEST : 직접 투자 규모					
					// SELL_PRICE : 중개 투자 금액
					// MARGIN : 중개 투자 이익
					// COUNT : 직접 투자 건수
					
					htmlValue = "<li class='sumtitle'><strong>투자총규모</strong><span class='investmoney'>##INVEST## 억</span></li><li><strong>직접투자규모</strong><span class=''>##SELF_INVEST## 억</span></li><li><strong>중개매각규모</strong><span class=''>##SELL_PRICE## 억</span></li>";				
					htmlValue = htmlValue.replace("##INVEST##", investAmout.INVEST).replace("##SELF_INVEST##", investAmout.SELF_INVEST).replace("##SELL_PRICE##", investAmout.SELL_PRICE);
					$("#invest_amount").html(htmlValue);
		    			
						
	                htmlValue = "<li class='sumtitle'><strong>Total 이익</strong><span class='getmoney'>##TOTAL_MARGIN## 억</span></li><li><strong>영업이익</strong><span class=''>-</span></li><li><strong>중개이익</strong><span class=''>##MARGIN## 억</span></li>";
	                htmlValue = htmlValue.replace("##TOTAL_MARGIN##", investAmout.MARGIN).replace("##MARGIN##", investAmout.MARGIN);				
	                $("#invest_gain").html(htmlValue);                
	    		}  
	    		else{
	    			htmlValue = "<li class='sumtitle'><strong>투자총규모</strong><span class='investmoney'>-</span></li><li><strong>직접투자규모</strong><span class=''>-</span></li><li><strong>중개매각규모</strong><span class=''>-</span></li>";				
					$("#invest_amount").html(htmlValue);
		    			
						
	                htmlValue = "<li class='sumtitle'><strong>Total 이익</strong><span class='getmoney'>-</span></li><li><strong>영업이익</strong><span class=''>-</span></li><li><strong>중개이익</strong><span class=''>-</span></li>";
	                $("#invest_gain").html(htmlValue);   
	    		}
	    		
	    	};	    	
	    	commonAjax("POST", url, param, callback);	    
	    },
	    
	    
	 	// 투자규모 및 총액 - 메쟈닌 & 비메쟈닌 구분
	    doLoadTotalInvestAmountSummary: function(selYear){
	    	var url = "<c:url value='/stats/doLoadTotalInvestAmountSummary.do' />";
	    	var param= {
	    			year:selYear
	    	}; 
	    	
			var callback = function(result){
	    		
				var htmlValue;
	    		var obj = JSON.parse(result);
	    		console.debug(result);
	    		var resultObj = obj.resultObject;
	    		console.debug('## doLoadTotalInvestAmountSummary ##');
	    		console.debug(resultObj);
	    		
	    		console.debug("#SERFSFAE#$#");
	    		
	    		// INVEST : 전체 투자 금액
				// SELF_INVEST : 직접 투자 규모					
				// SELL_PRICE : 중개 투자 금액
				// MARGIN : 중개 투자 이익
				// COUNT : 직접 투자 건수	
	    	
	    		
	    		var totalMezza = resultObj.total;					
				htmlValue = "<th scope='row'>Total</th>";
				htmlValue += "<td class='numtype_right investmoney'>" + totalMezza.TOTAL_INVEST+ " 억</td>";
				htmlValue += "<td class='numtype_right investmoney'>" + totalMezza.SELF_INVEST+ " 억</td>";
				htmlValue += "<td class='numtype_right investmoney'>" + totalMezza.SELL_PRICE+ " 억</td>";
				htmlValue += "<td class='numtype_right investmoney'>" + totalMezza.MARGIN+ " 억</td>";
				htmlValue += "<td class='numtype_right investmoney'>" + totalMezza.COUNT+ " 건</td>";
				$("#summary_table_total").html(htmlValue);                
				
				var mezza = resultObj.mezza;					
				htmlValue = "<th scope='row'>메자닌</th>";
				htmlValue += "<td class='numtype_right investmoney'>" + mezza.TOTAL_INVEST+ " 억</td>";
				htmlValue += "<td class='numtype_right investmoney'>" + mezza.SELF_INVEST+ " 억</td>";
				htmlValue += "<td class='numtype_right investmoney'>" + mezza.SELL_PRICE+ " 억</td>";
				htmlValue += "<td class='numtype_right investmoney'>" + mezza.MARGIN+ " 억</td>";
				htmlValue += "<td class='numtype_right investmoney'>" + mezza.COUNT+ " 건</td>";
				$("#summary_table_mezza").html(htmlValue);
				
				var xmezza = resultObj.xmezza;					
				htmlValue = "<th scope='row'>메자닌 외</th>";
				htmlValue += "<td class='numtype_right investmoney'>" + xmezza.TOTAL_INVEST+ " 억</td>";
				htmlValue += "<td class='numtype_right investmoney'>" + xmezza.SELF_INVEST+ " 억</td>";
				htmlValue += "<td class='numtype_right investmoney'>" + xmezza.SELL_PRICE+ " 억</td>";
				htmlValue += "<td class='numtype_right investmoney'>" + xmezza.MARGIN+ " 억</td>";
				htmlValue += "<td class='numtype_right investmoney'>" + xmezza.COUNT+ " 건</td>";
				$("#summary_table_x-mezza").html(htmlValue);
	    		  
	    	};	    	
	    	commonAjax("POST", url, param, callback);	    
	    },
	    
	    doLoadDealSummary: function(selYear){
	    	//소싱성사율
	    	// id : sourcing_success_rate
	    	// <span class="current">18%</span><span class="totalNum"><strong>124</strong> / 2154</span>
	    	
	    	//투자성사율
	    	//id : invest_success_rate_chart
	    	
	    	// 딜서머리 
	    	// id : deal_summary_data
	    	//console.debug(selYear);
	    	var url = "<c:url value='/stats/doLoadDealSummary.do' />";
	    	var param= {
	    			year:selYear
	    	};    	
	    	
	    	var callback = function(result){
	    		
	    		//console.debug(result);
	    		
	    		var obj = JSON.parse(result);
	    		var resultObj = obj.resultObject;	    		
	    		var chartDataList = [resultObj.chartDataList];	  
	    		var ticks = resultObj.tickList;
	    		var dataList= resultObj.dataList;
	    		var dataMap = resultObj.dataMap;
	    		var sourcingRate = resultObj.sourcingRate;
	    			    	
	    		// 소싱성사율 적용
	    		var htmlVal = "<span class='current'>##RATE##%</span><span class='totalNum'><strong>##SOURCE##</strong> / ##MEETING##</span>";
	    		var width = parseInt(365*sourcingRate/100);	    		
	    		htmlVal = htmlVal.replace(/##RATE##/g, sourcingRate);	    		
	    		htmlVal = htmlVal.replace(/##SOURCE##/g, dataMap.소싱);	    		
	    		htmlVal = htmlVal.replace(/##MEETING##/g, dataMap.미팅);
	    		$('#sourcing_success_rate').html(htmlVal);	    		
	    		$("#sourcing_success_rate .current").css('width', width);
	    		//console.debug(htmlVal);
	    		
	    		
	    		// 테이블 적용
	    		var htmlData = "<tr><th scope='row'>건수</th><td class='numtype'>" + dataMap.미팅 + "</td><td class='numtype'>" + dataMap.소싱 + "</td><td class='numtype'>" + dataMap.투자 + "</td><td class='numtype'>" + dataMap.중개 + "</td></tr>";
	    		htmlData += "<tr><th scope='row'>Hit Ratio</th><td class='Ratiotype'>&nbsp;</td>";
	    		htmlData += "<td class='Ratiotype'>" + sourcingRate + "%<span class='explain_tooltip'><div class='ly_help'><span class='intext'><img src='../images/stats/help_01.gif' alt='전체직원 미팅 건수 대비 소싱 건수 입니다.'></span><em class='edge_lgt'></em></div><img src='../images/stats/btn_infoicon.gif' alt='?'></span></td>"; 
	    		htmlData += "<td class='Ratiotype'>" + resultObj.chartDataList[1] + "%<span class='explain_tooltip'><div class='ly_help'><span class='intext'><img src='../images/stats/help_01_2.gif' alt='소싱 건수 대비 투자 결정 건수 입니다.'></span><em class='edge_lgt'></em></div><img src='../images/stats/btn_infoicon.gif' alt='?'></span></td>";
	    		htmlData += "<td class='Ratiotype'>" + resultObj.chartDataList[2] + "%<span class='explain_tooltip'><div class='ly_help'><span class='intext'><img src='../images/stats/help_01_3.gif' alt='투자 결정 건수 대비 중개 건수 입니다.'></span><em class='edge_lgt'></em></div><img src='../images/stats/btn_infoicon.gif' alt='?'></span></td>";
	    		$('#deal_summary_data').html(htmlData);
	    	  
				var jqPlot;
				chartObj.drawBarChart(jqPlot, 'invest_success_rate_chart', chartDataList, ticks,'type1', 'A' );
	    	};	    	
	    	commonAjax("POST", url, param, callback);	    	
	    },
	    
	    doLoadMnaSummary: function(selYear){
	    	//소싱성사율
	    	// id : mna_summary_data
	    	// <span class="current">18%</span><span class="totalNum"><strong>124</strong> / 2154</span>
	    	
	    	//투자성사율
	    	//id : invest_success_rate_chart
	    	
	    	// 딜서머리 
	    	// id : deal_summary_data
	    	
	    	
	    	var url = "<c:url value='/stats/doLoadMnaSummary.do' />";
	    	var param= {
	    			year:selYear
	    	};    	
	    	
	    	var callback = function(result){
	    		
	    		console.debug('## doLoadMnaSummary ##');
	    		console.debug(result);
	    		
	    		var obj = JSON.parse(result);
	    		
	    		var resultObj = obj.resultObject;	    		
	    		var chartDataList = [resultObj.chartDataList];	  

				var ticks = resultObj.tickList;
	    		//var dataList= resultObj.dataList;
	    		var dataMap = resultObj.dataMap;
	    		var mnaRate = resultObj.mnaRate;
	    			    	
	    		// 소싱성사율 적용
	    		var width = parseInt(365*mnaRate/100);
	    		var htmlVal = "<span class='current'>";
	    		htmlVal += mnaRate + "%</span><span class='totalNum'><strong>";
	    		htmlVal += dataMap.매칭 + "</strong> / " + dataMap.소싱 + "</span>";
	    			    		
	    		$('#mna_success_rate').html(htmlVal);	    		
	    		$("#mna_success_rate .current").css('width', width);
	    			    		
	    		// 테이블 적용
	    		var htmlData = "<tr><th scope='row'>건수</th>";
	    		var columnData = "<tr><th scope='col'>&nbsp;</th>";
	    		//console.debug("## MAP : " +dataMap[0].name);
	    		//console.debug(dataMap);
	    		for(var idx = 0; idx < ticks.length; idx++ ){	    			
	    			columnData += "<th scope='col'>" + ticks[idx] + "</th>"; 
	    			htmlData += "<td class='numtype'>" + dataMap[ticks[idx]] + "</td>";	    			
	    		}
	    		htmlData += "</tr>";
	    		columnData += "</tr>";
	    		
	    		htmlData += "<tr><th scope='row'>Hit Ratio</th>";
	    		for(var i =0 ; i < resultObj.chartDataList.length ; i++){
	    			if( i == 0 ) {
	    				htmlData += "<td class='Ratiotype'></td>";
	    			}
	    			else{
	    				htmlData += "<td class='Ratiotype'>"+ resultObj.chartDataList[i] +"%<span class='explain_tooltip'><div class='ly_help'><span class='intext'><img src='../images/stats/help_02_" + i + ".gif' alt='전체직원 미팅 건수 대비 소싱 건수 입니다.'></span><em class='edge_lgt'></em></div><img src='../images/stats/btn_infoicon.gif' alt='?'></span></td>";
	    			}
	    			 
	    		}
	    		htmlData += "</tr>";
            
	    		$("#mna_summary_column").html(columnData);
	    		$("#mna_summary_data").html(htmlData);
	    		
	    		var jqPlot;
	    		chartObj.drawBarChart(jqPlot, 'mna_success_rate_chart', chartDataList, ticks, 'type2', 'B');
	    	   
	    		
	    	};	    	
	    	commonAjax("POST", url, param, callback);	    	
	    },
	    //전체 Deal - 진행상황
	    doLoadDealProgress: function(selYear){
	    	// 차트
	    	// id : deal_progress_chart
	    	
	    	// 데이타 
	    	// id : deal_progress_data
	    	
	    	var url = "<c:url value='/stats/doLoadDealProgress.do' />";
	    	var param= {
	    			year:selYear
	    	};    	
	    	
	    	var callback = function(result){
	    		
	    		//console.debug("## 전체 Deal - 진행상황 : " + result);
	    		
	    		var obj = JSON.parse(result);
	    		var resultObj = obj.resultObject;	    		
	    		//var chartDataList = [resultObj.chartDataList];	  

				var ticks = resultObj.tickList;	    		
	    		var dataMap = resultObj.dataMap;
	    		var totalCount = resultObj.totalCount;	    		
				
				var htmlColumn = " <tr><th scope='col'>&nbsp;</th>";
				var htmlVal1 = "<tr><th scope='row'>건수</th>";
				var htmlVal2 = "<th scope='row'>Hit Ratio</th>";
				var jqplotData = new Array();
	    	    var idx=0;
	    	    var total = 0;
	    	    
				for(var key in ticks){
					htmlColumn += "<th scope='col'>" + ticks[key] + "</th>";
					htmlVal1 +=  "<td class='numtype'>" + dataMap[ticks[key]] + "</td>";
					htmlVal2 += "<td class='Ratiotype'>" + Math.round(dataMap[ticks[key]]/totalCount*100) +"%</td>"; 
					
					var item = new Array();
	    			item.push(ticks[key],Number(dataMap[ticks[key]]));
	    			jqplotData[idx++] = item;
	    			total += Number(dataMap[ticks[key]]);
				}
				
				htmlColumn += "</tr>";
				htmlVal1 += "</tr>";
				htmlVal2 += "</tr>";
				
				$('#deal_progress_column').html(htmlColumn);
				$('#deal_progress_data').html(htmlVal1 + htmlVal2);
				$('#deal_progress_total').html(totalCount);
				
	    		var jqPlot;
	    		chartObj.drawDonutChart(jqPlot, 'deal_progress_chart', jqplotData, ticks, 4, 1);
	    		
	    		
	    	   
	    		
	    	};	    	
	    	commonAjax("POST", url, param, callback);	    	
	    },
	    
	  	//전체 Deal - 유형분석
	    doLoadDealCategory: function(selYear){
	    	// 차트
	    	// id : deal_progress_chart
	    	
	    	// 데이타 
	    	// id : deal_progress_data
	    	
	    	var url = "<c:url value='/stats/doLoadDealCategory.do' />";
	    	var param= {
	    			year:selYear
	    	};    	
	    	
	    	var callback = function(result){
	    		
	    		console.debug("## doLoadDealCategory : " + result);
	    		
	    		var obj = JSON.parse(result);
	    		var resultObj = obj.resultObject;	    		
	    		//var chartDataList = [resultObj.chartDataList];	  

				var ticks = resultObj.tickList;	    		
	    		var dataMap = resultObj.dataMap;	    		
	    		var totalCount = resultObj.totalCount;
	    		
				var htmlColumn = " <tr><th scope='col'>&nbsp;</th>";	    	
				var htmlVal1 = "<tr><th scope='row'>건수</th>";
				var htmlVal2 = "<th scope='row'>Hit Ratio</th>";
				var jqplotData = new Array();
	    	    var idx=0;
	    	    var total = 0;
	    	    
				for(var key in ticks){
					htmlColumn += "<th scope='col'>" + ticks[key] + "</th>";
					htmlVal1 +=  "<td class='numtype'>" + dataMap[ticks[key]] + "</td>";
					htmlVal2 += "<td class='Ratiotype'>" + Math.round(dataMap[ticks[key]]/totalCount*100) +"%</td>";
					
					var item = new Array();
	    			item.push(ticks[key],Number(dataMap[ticks[key]]));
	    			jqplotData[idx++] = item;
	    			total += Number(dataMap[ticks[key]]);
				}
				
				htmlColumn += "</tr>";
				htmlVal1 += "</tr>";
				htmlVal2 += "</tr>";
				
				$('#deal_category_column').html(htmlColumn);
				$('#deal_category_data').html(htmlVal1 + htmlVal2);				
				$('#deal_category_total').html(totalCount);
				
				//console.debug(jqplotData);
	    		var jqPlot;
	    		chartObj.drawDonutChart(jqPlot, 'deal_category_chart', jqplotData, ticks, ticks.length, 1);
	    	   
	    		
	    	};	    	
	    	commonAjax("POST", url, param, callback);
	    },
	    
	  	// 직접투자(건수별) 유형분석
	    doLoadSelfInvestCase: function(selYear){
	    	// 차트
	    	// id : deal_progress_chart
	    	
	    	// 데이타 
	    	// id : deal_progress_data
	    	
	    	var url = "<c:url value='/stats/doLoadSelfInvestCase.do' />";
	    	var param= {
	    			year:selYear
	    	};    	
	    	
	    	var callback = function(result){
	    		
	    		//console.debug('### 직접투자 건수별' + result);
	    		
	    		var obj = JSON.parse(result);
	    		var resultObj = obj.resultObject;	    		
	    		//var chartDataList = [resultObj.chartDataList];	  

				var ticks = resultObj.tickList;	    		
	    		var dataMap = resultObj.dataMap;
	    		var totalCount = resultObj.totalCount;
	    		
	    		var jqplotData = new Array();
	    	    var idx=0;
	    	    var total = 0;
				
				var htmlColumn = " <tr><th scope='col'>&nbsp;</th>";	    	
				var htmlVal1 = "<tr><th scope='row'>건수</th>";
				var htmlVal2 = "<th scope='row'>Hit Ratio</th>";
				
				for(var key in ticks){
					htmlColumn += "<th scope='col'>" + ticks[key] + "</th>";
					htmlVal1 +=  "<td class='numtype'>" + dataMap[ticks[key]] + "</td>";
					htmlVal2 += "<td class='Ratiotype'>" + Math.round(dataMap[ticks[key]]/totalCount*100.0) +"%</td>"; 
					
					var item = new Array();
	    			item.push(ticks[key],Number(dataMap[ticks[key]]));
	    			jqplotData[idx++] = item;
	    			//total += Number(dataMap[ticks[key]]);
				}
				
				htmlColumn += "</tr>";
				htmlVal1 += "</tr>";
				htmlVal2 += "</tr>";
				
				$('#deal_self_invest_case_column').html(htmlColumn);
				$('#deal_self_invest_case_data').html(htmlVal1 + htmlVal2);
				$('#deal_self_invest_case_total').html(totalCount);
                
	    		var jqPlot;
	    		chartObj.drawDonutChart(jqPlot, 'deal_self_invest_case_chart', jqplotData, ticks, ticks.length, 1);
	    	   
	    		
	    	};	    	
	    	commonAjax("POST", url, param, callback);	 
	    	
	    },
	 
	 // 직접투자(금액별) 유형분석
	    doLoadSelfInvestAmount: function(selYear){
	    	// 차트
	    	// id : deal_progress_chart
	    	
	    	// 데이타 
	    	// id : deal_progress_data
	    	
	    	var url = "<c:url value='/stats/doLoadSelfInvestAmount.do' />";
	    	var param= {
	    			year:selYear
	    	};    	
	    	
	    	var callback = function(result){
	    		
	    		//console.debug('###' + result);
	    		
	    		var obj = JSON.parse(result);
	    		var resultObj = obj.resultObject;	    		
	    		//var chartDataList = [resultObj.chartDataList];	  

				var ticks = resultObj.tickList;
				//console.debug('### TICKS : ' + result);
	    		var dataMap = resultObj.dataMap;	    		
	    		var totalCount = resultObj.totalCount;
	    		
	    		var jqplotData = new Array();
	    	    var idx=0;
	    	    var total = 0;
	    	    
				for(var key in ticks){
	    			var item = new Array();
	    			item.push(ticks[key],Number(dataMap[ticks[key]]));
	    			jqplotData[idx++] = item;	  
	    	    }
	    		
				var htmlColumn = " <tr><th scope='col'>&nbsp;</th>";	    	
				var htmlVal1 = "<tr><th scope='row'>금액(억)</th>";
				var htmlVal2 = "<th scope='row'>Hit Ratio</th>";
				
				for(var key in ticks){
					htmlColumn += "<th scope='col'>" + ticks[key] + "</th>";
					htmlVal1 +=  "<td class='numtype'>" + dataMap[ticks[key]] + "</td>";
					htmlVal2 += "<td class='Ratiotype'>" + Math.round(dataMap[ticks[key]]/totalCount*100) +"%</td>"; 
				}
				
				htmlColumn += "</tr>";
				htmlVal1 += "</tr>";
				htmlVal2 += "</tr>";
				
				$('#deal_self_invest_amount_column').html(htmlColumn);
				$('#deal_self_invest_amount_data').html(htmlVal1 + htmlVal2);
				$('#deal_self_invest_amount_total').html(totalCount);
                
	    		var jqPlot;
	    		chartObj.drawDonutChart(jqPlot, 'deal_self_invest_amount_chart', jqplotData, ticks, ticks.length, 1);
	    	   
	    		
	    	};	    	
	    	commonAjax("POST", url, param, callback);	 
	    	
	    },
	    doLoadRecordCompare :function(flag){
	    	
	    	var selYear;
	    	var selMonth;
	    		    	
	    	
	    	
	    	
	    	if( flag == 0){
	    		var today = new Date();
	    		
		        selYear = ($("#sel_year").val());		        
		        
		        if( Number(selYear < 2014 )) {		    		
		    		return;
		    	}
		    	
		        $("#compare_3year_select").val(selYear);
		        selMonth = today.getMonth() + 1;
		        //console.debug(selYear);
		        //console.debug(selMonth);
	    	}
	    	else{
	    		selYear = $("#compare_3year_select").val();
	    		selMonth = $("#compare_12month_select").val();
	    	}
	    	    	
	    	
	    	var url = "<c:url value='/stats/doLoadRecordCompare.do' />";
	    	var param= {
	    			condYear:selYear-3,
	    			year:selYear,
	    			month:selMonth
	    	};    	
	    	var callback = function(result){
	    	
	    		//console.debug("## 3년 : " + result);
	    		var obj = JSON.parse(result);
	    		var resultObj = obj.resultObject;
	    		var tickList = resultObj.tickList;
	    		var yearList = resultObj.yearList;
	    		var totalAmountMap = resultObj.totalAmountMap;
	    		var totalCountMap = resultObj.totalCountMap;
	    		//console.debug("## total : " + totalAmountMap);
	    		//
	    		var amountChartData = new Array();
	    		var countChartData = new Array();
	    	    var idx=0;	    	    
				for(var key in totalAmountMap){
	    			var item = new Array();
	    			item.push(key,Number(totalAmountMap[key]));
	    			amountChartData[idx++] = item;
	    			
	    	    }
				
				idx = 0;
				for(var key in totalCountMap){
	    			var item = new Array();
	    			item.push(key,Number(totalCountMap[key]));
	    			countChartData[idx++] = item;	    			
	    	    }
	    						
	    		var amountMap = resultObj.amountMap;
	    		var countMap = resultObj.countMap;
	    		
		    	var monthList = [tickList];
		    	
		    	var columnHtml = "<tr><th colspan='2' scope='col'>&nbsp;</th><th scope='col'>total</th>";
				for(var key in tickList){
					columnHtml += "<th scope='col'>" + tickList[key] + "</th>";				
					
				}			
				
				
				columnHtml += "</tr>";
				$("#record_compare_column").html(columnHtml);
				
				var dataHtml;
				// 건수 계산
				
				var seriesArray = new Array();
				var yearCountArray = new Array();
	    		var yearIdx = 0;
				for(var year in yearList){
					
					var tempHtml;
					var countData = countMap[yearList[year]];
					if( year == 0 )
						tempHtml =" <tr><th rowspan='3' scope='row' width='3%'>건수</th><th class='numtype'>" + yearList[year] + "</th>";
					else
						tempHtml =" <tr><th class='numtype' width='6%'>" + yearList[year] + "</th>";
							
					
					tempHtml += "<td class='totaltype' width='8%'>" + totalCountMap[yearList[year]] + "</td>";
					
					var idx = 0;
					var countArray = new Array();
					
					for(var month in tickList){
						tempHtml +=  "<td class='numtype'>" + countData[tickList[month]] + "</td>";
						
						var item = new Array();
		    			item.push(tickList[month],Number(countData[tickList[month]]));
		    			countArray[idx++] = item;
					}
					
					tempHtml += "</tr>";
					dataHtml += tempHtml;
					
					yearCountArray[yearIdx] = countArray;
					//var seriesItem = [];
					var seriesItem = {};
					seriesItem.label = yearList[year];
					//seriesItem.push('label', yearList[year]);
					seriesArray[yearIdx] = seriesItem;
					yearIdx++;
					
				}				
				
				//금액 계산
				//console.debug(totalAmountMap);
				for(var year in yearList){
					var tempHtml;
					var amountData = amountMap[yearList[year]];
					if( year == 0 )
						tempHtml =" <tr><th rowspan='3' scope='row'>금액</th><th class='numtype'>" + yearList[year] + "</th>";
					else
						tempHtml =" <tr><th class='numtype'>" + yearList[year] + "</th>";
							
					//console.debug(total[year]);
					tempHtml += "<td class='totaltype'>" + totalAmountMap[yearList[year]] + "</td>";
					
					for(var month in tickList){
						tempHtml +=  "<td class='numtype'>" + amountData[tickList[month]] + "</td>";
					}
					
					tempHtml += "</tr>";
					
					dataHtml += tempHtml;
				}
				$("#record_compare_data").html(dataHtml);
				
				// 바,라인 차트
				chartObj.drawBarLineChart(null, 'compare_TypeA', amountChartData, countChartData, null);
				chartObj.drawLineChart(null, 'compare_TypeB', yearCountArray, seriesArray);
	    	};
	    	
	    	commonAjax("POST", url, param, callback);	
	    }
	    
};//fnObj
		
		
		
		
var chartObj = {
					
			drawBarChart: function(jqplot, divId, chartData, ticks, colorTypeCh, widthtype){
				
				if(colorTypeCh=='type1'){
					colorTypeCh = ['#3babc8','#fb7471','#f39c12','#9e9e9e',   '#33577B', '#28A65D', '#7CBF62',  '#9E9E9E'];
				}
				else if(colorTypeCh=='type2'){
					colorTypeCh = ['#3babc8', '#f39c12', '#387cc8', '#fb7471', '#9E9E9E', '#33577B', '#28A65D', '#7CBF62' ];
				}
				else {
					colorTypeCh = ['#4b78d3', '#fb7471', '#ffa800', '#51a7d2',  '#33577b', '#7bbf62', '#26a687', '#9e9e9e']
					}
					
				if(widthtype=='A') {
					widthtype = 53;
					}	
				if(widthtype=='B') {
					widthtype = 46;
					}
					
			jqplot = $.jqplot(divId, chartData, {
    	        // The "seriesDefaults" option is an options object that will
    	        // be applied to all series in the chart.
    	        seriesColors: colorTypeCh,
				seriesDefaults:{
    	            renderer:$.jqplot.BarRenderer,
    	            pointLabels: { show: true ,location: 's',  formatString: '%.1f%'},
    	            shadowAlpha:1,
    	            rendererOptions: {
    	                // Speed up the animation a little bit.
    	                // This is a number of milliseconds.  
    	                // Default for bar series is 3000.
						
						highlightMouseOver : false,
    	                barWidth: widthtype,
    	                shadowOffset:0,
    	                varyBarColor: true, // 다양한 색상
    	                animation: {
    	                    speed: 1500
    	                }
    	                
    	            }
    	        },
    	       
    	        legend: {
    	            show: false,
    	            placement: 'insideGrid'
    	        },
    	        grid: {
    	        	drawGridlines: true,	    	        	
    	            gridLineColor: '#b9bcc1',
    	        	background: '#fff',
    	        	borderColor: '#b9bcc1',     // CSS color spec for border around grid.
    	            gridLineWidth: 0.3, 
					borderWidth: 1,
    	            shadow:false,
    	        },
				
    	        series:[],
    	        axes: {
    	            // Use a category axis on the x axis and use our custom ticks.
					
    	            xaxis: {
						labelRenderer : $.jqplot.AxisLabelRenderer,	
    	                renderer: $.jqplot.CategoryAxisRenderer,
    	                ticks: ticks,
    	                tickOptions: {
    	                	mark: 'inside',
							showGridline: true,
    	                },
						labelOptions: {
							}
    	                
    	            },
    	            // Pad the y axis just a little so bars can get close to, but
    	            // not touch, the grid boundaries.  1.2 is the default padding.
    	            yaxis: {	    	            	
    	            	tickOptions: {	  
							mark: 'inside',                
    	                	showGridline: true
    	                }
    	            }
    	        }
    	    });
			    	    
    	    jqplot.replot(); 
		},
		drawLineChart : function(jqplot, divId, lineChartData, series){
			
		    var plot1 = $.jqplot (divId,  lineChartData, {	
				   	
		        seriesDefaults: {
					shadow:false, 
					lineWidth:1.4,
					markerOptions: {size:7, shadow:false},
		        	 rendererOptions: {
						//////
		                // Turn on line smoothing.  By default, a constrained cubic spline
		                // interpolation algorithm is used which will not overshoot or
		                // undershoot any data points.
		                //////
		                smooth: false,
						shadowAlpha:0,
			            
			         },
					 				 
					 pointLabels: {
		                 show: false,
		                 formatString:
		                     '%s',
		                     edgeTolerance: -5
		                     
		             	},
		        },
				
		        legend: { show: true},
		        seriesColors:['#ffa800', '#4b78d3', '#fb7471', '#4B78D3', '#33577B', '#28A65D', '#7CBF62',    '#9E9E9E'],
		        series: series,
		        axes: {
		            // options for each axis are specified in seperate option objects.
		            xaxis: {
		              
		              pad: 1,
		                // a factor multiplied by the data range on the axis to give the            
		                renderer: $.jqplot.CategoryAxisRenderer,
		                // renderer to use to draw the axis,     
		                tickOptions: {
							mark : 'inside',
		                    formatString: '%b %#d'
		                }
		              // Turn off "padding".  This will allow data point to lie on the
		              // edges of the grid.  Default padding is 1.2 and will keep all
		              // points inside the bounds of the grid.
		              
					  
		            },
		            yaxis: {
		              	autoscale:true,
						label: "건",
						labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
						tickRenderer: $.jqplot.CanvasAxisTickRenderer,
						tickOptions : {
							labelPosition: 'top',
							mark : 'inside'
						},
					  
					  
		            },
					
		        },
		        grid: {
    	        	drawGridlines: true,	    	        	
    	            gridLineColor: '#b9bcc1',
    	        	background: '#fff',
    	        	borderColor: '#b9bcc1',     // CSS color spec for border around grid.
    	            gridLineWidth: 0.3, 
					borderWidth: 1,
    	            shadow:false,
    	        },
		    });
		    
		    plot1.replot(); 
		},
		drawBarLineChart: function(jqplot1, divId, barChartData, lineChartData, ticks){
				            
			var jqplot = $.jqplot(divId, [barChartData, lineChartData], {
				series:[
				        {renderer:$.jqplot.BarRenderer}, 
				        {xaxis:'x2axis', yaxis:'y2axis'}],
			   	
			    seriesDefaults:{
					shadow:false, 
					lineWidth:1.5,
					markerOptions: {size:7, shadow:false},
			    	rendererOptions: {
						shadowAlpha:0,
			            highlightMouseOver: false,
			            barPadding: 0,
		                   barMargin: 0,
		                   barWidth: 50,
			         },
    	            pointLabels: { 
						shadowAlpha:0,
    	            	show: true ,
    	            	location: 's',  
    	            	formatString: '%d',
    	            	fillToZero:true}
    	        },
				
    	        legend: { show: false },
				
    	        seriesColors:['#4B78D3', '#FA7471'],
				
    	        grid: {
    	        	drawGridlines: true,	    	        	
    	            gridLineColor: '#b9bcc1',
    	        	background: '#fff',
    	        	borderColor: '#b9bcc1',     // CSS color spec for border around grid.
    	            gridLineWidth: 0.3, 
					borderWidth: 1,
    	            shadow:false,
    	        },
			    axes: {
			    	xaxis: {
				        renderer: $.jqplot.CategoryAxisRenderer,
				        tickOptions: {
							borderWidth: 1,
							borderColor:'#ccc',
		                	mark: 'inside',
							showGridline: false
							
				        }
				      },
				      x2axis: {
				        renderer: $.jqplot.CategoryAxisRenderer,
				        tickOptions: {
							mark: 'inside',
		                	
				        }
				      },
				      yaxis: {
				        tickOptions: {
							mark: 'inside', 
				        	formatString: "%d억"
		                	
				        },
						numberTicks:6
					  },
				      y2axis: {
				        tickOptions: {
							mark: 'inside',
				        	formatString: "%d건"
		                	
				        },
						numberTicks:6
			      }
			    }
    	    });
			
    	    jqplot.replot(); 
		},
		drawDonutChart: function(jqplot, divId, chartData, ticks, nRows, nCols){
			
			if(nRows==undefined){
				nRows = 4;
			}
			if(nCols==undefined){
				nCols = 1;
			}
			jqplot = $.jqplot(divId, [chartData], {
			      seriesDefaults: {
			        shadow: true,	        
			        renderer: jQuery.jqplot.DonutRenderer, 
			        rendererOptions: { 
			          startAngle: -90, 
			          //sliceMargin: 5,
			          shadowOffset :8,
			          shadowDepth:1,
			          shadowAlpha:0,        
			          //dataLabels:'value',
			          innerDiameter: 80,
			          showDataLabels : true,
			          dataLabelThreshold :1,
			          dataLabelPositionFactor : 0.52,
			          //dataLabelFormatString: "%s",
			          highlightMouseOver:false
			          } 
			      },
			      
			      seriesColors:['#4b78d3', '#fb7471', '#ffa800', '#51a7d2',  '#33577b', '#7bbf62', '#26a687', '#9e9e9e'],
			      highlighter: {
		              show:true,              
		              tooltipLocation:'sw', 
		              useAxesFormatters: false,
		              formatString:'%s'
		              
		          },
		          grid: {
	    	        	drawGridLines:false,	    	        	
	    	            gridLineColor: '#333333',
	    	        	background: '#ffffff',
	    	        	borderColor: '#333333',     // CSS color spec for border around grid.
	    	            borderWidth: 0, 
	    	            shadow:false
	    	        },
			      legend: {
			    	  show:true 
			    	  ,location: 'e'
			    	  ,showSwatches:true
			    	  ,placement:'insideGrid'
					  ,negativeSeriesColors : $.jqplot.config.defaultNegativeColors
					  ,stackSeries : false
					  ,fontSize: '11px'
					  ,rowSpacing: '1px'
					  ,rendererOptions:{
						  numberRows : nRows,
			              numberColumns : nCols
					  }
					  
			    	}
			    }
			  );						
		}
		
};//chartObj


function tooltipContentEditor(str, seriesIndex, pointIndex, plot) {
    // display series_label, x-axis_tick, y-axis value
    return plot.series[seriesIndex]["label"] + ", " + plot.data[seriesIndex][pointIndex];
}


$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	fnObj.pageStart();		//화면세팅
	fnObj.doSearch();
			
});

</script>

