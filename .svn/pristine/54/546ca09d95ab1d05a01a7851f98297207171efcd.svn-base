<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>경쟁사현황</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/management.css'/>" rel="stylesheet" type="text/css"/>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/popUp.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery-ui.js'/>" ></script>
<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->

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
	
	getInvestorList("total"); //전체
 });
 
 function doSort(sortNum){
	 getInvestorList($("#choiceYear").val(), sortNum);
 }
 
 function searchInvestor(rId){
	var rVal = new Object();
	rVal.i = rId;  
	
	if (window.opener){
		window.close();
		window.opener.searchInvestor(rVal);
	}
 }
 
 function getInvestorList(year, sortNum){
	var url = "<c:url value='/work/getInvestorStatus.do'/>";
	
	var data = {
					choiceYear : year
				  ,	sorting : sortNum
	};
	
	var fn = function(result){
		var obj = JSON.parse(result);
		var list = obj.resultList;
			
		var str = "";
		var onclickSet = "";
		var totalCountSum = 0;
		var totalPriceSum = 0;
		
		if(list.length > 0){
			for(var i=0;i<list.length;i++){
				onclickSet = 'popUp(\'\', \'rcmdCpn\',\'\', \''+list[i].cpnSnb+'\')';
				str += '<tr><td class="cent pd0" style="border-radius:0px; height:30px;">';
				str += '<a onclick="'+onclickSet+'" style="cursor:pointer;">';
				if(list[i].cpnId == '67'){
					str += '<b><font color="blue">'+list[i].cpnNm+'</font></b></a></td>';	
					str += '<td class="won"><b><font color="blue">'+list[i].investCount+'</font></b></td>';	
					str += '<td class="won"><b><font color="blue">'+formatMoney(list[i].price,'INSERT')+'</font></b></td>';	
				}else{
					str += list[i].cpnNm+'</a></td>';	
					str += '<td class="won">'+list[i].investCount+'</td>';	
					str += '<td class="won">'+formatMoney(list[i].price,'INSERT')+'</td>';	
				}
				str += '<td class="won" style="border-radius:0px;">';
				str += '<span class="btn orange s" style="float:right;margin-right:5px;">';
				str += '<a onclick="javascript:searchInvestor(\''+list[i].investorId+'\');">검색</a></span></td></tr>';
				
				totalCountSum += Number(list[i].investCount);
				totalPriceSum += Number(list[i].price);
			}
			
			totalStr = '<tr>';
			totalStr += '<td class="cent pd0" bgcolor="#EEEEFF" style="height: 30px;"><b>합  계</b></td>'; 
			totalStr += '<td class="won" bgcolor="#EEEEFF"><b>'+totalCountSum+'</b></td>'; 
			totalStr += '<td class="won" bgcolor="#EEEEFF"><b>'+formatMoney(totalPriceSum,'INSERT')+'</b></td>'; 
			totalStr += '<td bgcolor="#EEEEFF"></td>'; 
			totalStr += '</tr>';
			
			$("#total").html(totalStr);
		}else{
			str = '<tr>';
			str += '<td class="cent pd0" colspan="4" style="height: 30px;">내역이 없습니다.</td>';
			str += '</tr>';
			$("#total").html('');
		}
		
		$("#investorList").html(str);
	}
	
	//로딩 이미지 보여주기 위한 리스너 함수 :S -----------
 	var beforeFn = function(){
 		// 로딩 이미지 보여주기 처리
 		$('.wrap-loading', document).removeClass('display-none');
 	};
 	var completeFn = function(){
 		// 로딩 이미지 감추기 처리
	    $('.wrap-loading', document).addClass('display-none');  // 계속 유지하다가 submit 마무리 되면 어차피 화면 재로딩 되며 사라진다.
 	};
 	//로딩 이미지 보여주기 위한 리스너 함수 :E -----------
 	commonAjax("POST", url, data, fn, true, beforeFn, completeFn);
 }
 
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

</style>
<body>

	<div class="wrap-loading display-none">
	    <div><img src="<c:url value='/images/ajax_loading.gif'/>" /></div>
	</div>
	
	<div id="wrap" class="content_box">
		<article>
			<header>
				<div class="year_wrap" style="top:0px">					
					<h2 class="headerTitle">
						<c:set var="now" value="<%= new java.util.Date() %>"/>
						<fmt:formatDate var="curYear" value='${now}' pattern='yyyy'/>
						경쟁사 현황
						&nbsp;&nbsp;
						<span class="year">
							<select id="choiceYear" name="choiceYear" style="font-size: 14px;" onchange="getInvestorList(this.value);">
								<option value="total">전체</option> 
								<c:forEach var="year" begin="2011" end="${curYear}">
									<option value="${year}">${year}</option>
								</c:forEach>
								<option value="sixMonth">최근6개월</option> 								
							</select>
						</span>
					</h2>
				</div>
				<h2 class="headerTitle">&nbsp;</h2>
				<h2 class="headerTitle"><span style="position:absolute; margin-left:550px;"><small>(단위: 개, 억원)</small></span></h2>
			</header>
			<div style="padding-top:25px;">
				<table class="t_skinR00" style="table-layout: fixed;width: 30%;">
					<colgroup>
						<col width="300"> 
						<col width="150"> 
						<col width="150"> 
						<col width="50"> 
					</colgroup>
					<thead>
						<tr>
							<th class="hand pd0" onclick="doSort(1);" "style="height: 30px;">투자자<br/>▼</th>
							<th class="hand pd0" onclick="doSort(2);">투자횟수<br/>▼</th>
							<th class="hand pd0" onclick="doSort(3);">투자규모<br/>▼</th>
							<th class="hand pd0"></th>
						</tr>
					</thead>
				</table>
			</div>
			<div>
				<table class="t_skinR00" style="table-layout: fixed;width: 30%">
					<colgroup>
						<col width="300"> 
						<col width="150"> 
						<col width="150"> 
						<col width="50"> 
					</colgroup>
				<tbody id="investorList"></tbody>
				<tbody id="total"></tfoot>
				</table>
			</div>
		</article>
	</div>
</body>
</html>

