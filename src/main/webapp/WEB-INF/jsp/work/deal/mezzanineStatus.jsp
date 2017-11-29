<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메자닌시장현황</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/management.css'/>" rel="stylesheet" type="text/css"/>
<%-- <link href="<c:url value='/css/new_ib.css'/>" rel="stylesheet" type="text/css"/> --%>
<link href="<c:url value='/css/jquery.jqplot.css'/>" rel="stylesheet" type="text/css"/> 

<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/popUp.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery-ui.js'/>" ></script>
<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->

<script type="text/javascript" src="<c:url value='/js/jqplot/jquery.jqplot.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.barRenderer.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.categoryAxisRenderer.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.cursor.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.pointLabels.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.canvasAxisTickRenderer.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.canvasTextRenderer.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/jqplot/plugins/jqplot.dateAxisRenderer.js'/>" ></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<script>
 $(document).ready(function(){
	$(".t_skinR00 tbody tr:odd").css("background-color", "#F6F9FB");
	var tempX=0;
	window.onscroll = function(){//alert($("#fixedTop").attr('class'));
		var scrollX = window.scrollX || document.documentElement.scrollLeft;
		if(tempX != scrollX){
			//alert("좌우스크롤");
			$("#fixedTop").css('right',scrollX);
		}
	    tempX = scrollX;
	};
	
	//20150902
	//setSortBtn();		//정렬버튼 모양 세팅 함수 호출
	
	//---------- draggable :S ----------
	$(".closePopUpMenu").mousedown(function(){
		$(".popUpMenu").draggable({disabled:false, opacity:'0.8'});		
	});
	$(".closePopUpMenu").mouseup(function(){
		$(".popUpMenu").draggable({disabled:true});
		$(".popUpMenu").css('height', 'auto');
	});	
	//---------- draggable :E ----------
	
	doLoadMezzanineSummary('PRICE');
	doLoadMezzanineSummary('COUNT');
 });
 
 function doLoadMezzanineSummary(flag){
	var url = "";
	if(flag == 'PRICE') url = "<c:url value='/work/doLoadMezzaninePriceSummary.do' />";
	else url = "<c:url value='/work/doLoadMezzanineCountSummary.do' />";
		
	var param = {};
	
	var callback = function(result){
		var obj = JSON.parse(result);
		var resultObj = obj.resultObject;
		var chartDataList = resultObj.chartDataList;
		var otherChartDataList = resultObj.otherChartDataList;
		
		var ticks = resultObj.tickList;
		
		var jqPlot;
		if(flag == 'PRICE') chartObj.drawBarChart(jqPlot, "mezzanine_price_status_chart", chartDataList, otherChartDataList, ticks, flag);
		else chartObj.drawBarChart(jqPlot, "mezzanine_count_status_chart", chartDataList, otherChartDataList, ticks, flag);		
	};
	commonAjax("POST", url, param, callback);
}

var chartObj = {
		
			drawBarChart:  function(jqplot, divId, chartData, otherChartData, ticks, flag){
				
				colorTypeCh = ['#3babc8','#fb7471','#f39c12','#9e9e9e',   '#33577B', '#28A65D', '#7CBF62',  '#9E9E9E'];
				widthtype = 35;
			
				jqplot = $.jqplot(divId, [chartData, otherChartData], {
	    	        // The "seriesDefaults" option is an options object that will
	    	        // be applied to all series in the chart.
	    	        stackSeries: true,
            		//captureRightClick: true,
	    	        seriesColors: colorTypeCh,
					seriesDefaults:{
	    	            renderer:$.jqplot.BarRenderer,
	    	            pointLabels: { show: true ,location: 's',  formatString: '%d'},
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
	    	            show: true,
	    	            location: 'sw',
	    	            placement: 'outsideGrid'
	    	            //placement: 'insideGrid'
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
					
	    	        series:[
	    	                {label : '공모'},
	    	                {label : '사모'}
	    	           ],
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
	    	                },
	    	                rendererOptions: {
	    	                	max: flag == 'PRICE' ? 8000 : 600
	    	                },
						    numberTicks: flag == 'PRICE' ? 9 : 7
	    	            }
	    	        }
	    	    });
				    	    
	    	    jqplot.replot(); 	
				
			}
}

function searchWay(year, way){
	if(window.opener){
		window.close();
		window.opener.doYearCheck(year, way);
	}
}


/* function selectPublicNoticeMezzaine(){
	var sUrl = "selectPublicNoticeMezzaine.do";
	parent.mainFrame.location.href = sUrl;		 
}  */
 
</script>
</head>
<style>
.t_skinR00 th, .t_skinR00 td{font-size:13px !important;} 
tbody tr:hover{background-color: moccasin !important;}
input{margin:4px 0px;padding:2px 0px !important;}


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

.graphPBox{
	width:13.5cm;
	top:-690px;
	right:-610px;
	position:relative;
}

.graphCBox{
	width:13.5cm;
	top:-650px;
	right:-610px;
	position:relative;
}

.jqplot-point-label { 
	/* font-weight:bold;  */
	font-size:11px; 
	font-family:Tahoma, Geneva, sans-serif; 
	color:#ffffff; 
	/*  text-shadow: black 1px 1px; */ 
}

</style>
<body>
	<div id="wrap" class="content_box">
		<article style="height: 800px;">
			<header>
				<div class="year_wrap" style="top:0px">
					<h2 class="headerTitle">
					메자닌 발행 현황
					<br>
					<small>(금액기준)</small>
					</h2>
				</div>
				<h2 class="headerTitle">&nbsp;</h2>
			</header>
			<div style="padding-top:25px;">
				<table class="t_skinR00" style="table-layout: fixed;width: 30%;">
					<colgroup>
						<col width="150"> 
						<col width="150"> 
						<col width="150"> 
						<col width="150"> 
					</colgroup>
					<thead>
						<tr>
							<th class="pd0" style="height: 30px;"></th>
							<th class="pd0">공모</th>
							<th class="pd0">사모</th>
							<th class="pd0">사모비중</th>
						</tr>
					</thead>
				</table>
			</div>
			<div>
				<table class="t_skinR00" style="table-layout: fixed;width: 30%">
				<colgroup>
						<col width="150"> 
						<col width="150"> 
						<col width="150"> 
						<col width="150"> 
				</colgroup>
				<tbody>
					<c:forEach var="result" items="${mezzaninePriceList}" varStatus="i">
						<tr>
							<td class="cent pd0" style="height: 30px;">${result.year}</td>	
							<td class="won link" onclick="searchWay('${result.year}', '1')" style="padding-right:10px!important;"><fmt:formatNumber value="${result.publicPrice}" type="number"/></td>	
							<td class="won link" onclick="searchWay('${result.year}', '2')" style="padding-right:10px!important;"><fmt:formatNumber value="${result.privatePrice}" type="number"/></td>	
							<td class="won" style="text-align:center;"><fmt:formatNumber value="${result.privatePrice / (result.publicPrice+result.privatePrice)}" type="percent" /></td>	
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</div>
			
			<header>
				<div class="year_wrap" style="top:400px;">
					<h2 class="headerTitle">
					<small>(발행건수 기준)</small>
					</h2>
				</div>
				<h2 class="headerTitle">&nbsp;</h2>
			</header>
			<div style="padding-top:70px;">
				<table class="t_skinR00" style="table-layout: fixed;width: 30%;">
					<colgroup>
						<col width="150"> 
						<col width="150"> 
						<col width="150"> 
						<col width="150"> 
					</colgroup>
					<thead>
						<tr>
							<th class="pd0" style="height: 30px;"></th>
							<th class="pd0">공모</th>
							<th class="pd0">사모</th>
							<th class="pd0">사모비중</th>
						</tr>
					</thead>
				</table>
			</div>
			<div>
				<table class="t_skinR00" style="table-layout: fixed;width: 30%">
				<colgroup>
						<col width="150"> 
						<col width="150"> 
						<col width="150"> 
						<col width="150"> 
				</colgroup>
				<tbody>
					<c:forEach var="result" items="${mezzanineCountList}" varStatus="i">
						<tr>
							<td class="cent pd0" style="height: 30px;">${result.year}</td>	
							<td class="won link" onclick="searchWay('${result.year}', '1')" style="padding-right:10px!important;">${result.publicCount}</td>	
							<td class="won link" onclick="searchWay('${result.year}', '2')" style="padding-right:10px!important;">${result.privateCount}</td>	
							<td class="won" style="text-align:center;"><fmt:formatNumber value="${result.privateCount / (result.publicCount+result.privateCount)}" type="percent" /></td>	
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</div>
			
			<!-- 그래프 -->  	
			<div class="graphPBox">
				<dl class="titleAndGraph">
                	<dt>(단위: 십억원)</dt>
					<dd><div id="mezzanine_price_status_chart"></div></dd>
				</dl>
			</div>
			
			<div class="graphCBox">
				<dl class="titleAndGraph">
                	<dt>(단위: 건)</dt>
					<dd><div id="mezzanine_count_status_chart"></div></dd>
				</dl>
			</div>	
		</article>
	</div>
</body>
</html>