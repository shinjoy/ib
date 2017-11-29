<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/card.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/calendar_beans_v2.0.js'/>" ></script>

<!-- 추가 20150713 :S -->
<script>var contextRoot="${pageContext.request.contextPath}";</script>

<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/JavaScript" src="<c:url value='/js/sys/utils.js'/>" ></script>
<!-- 추가 20150713 :E -->
<!-- 추가 20151207 :S -->
<script type="text/JavaScript" src="<c:url value='/js/ajaxRequest.js'/>" ></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 
<!-- 추가 20151207 :E -->



<script>
CalAddCss();
var division ="${userLoginInfo.division}";
function totalList(){
	$('#total').val('tot');
	var frm = document.getElementById('modifyRec');//sender form id
	frm.submit();
}

$(document).ready(function(){
	var divisionList= getCodeInfo(null,null,null,null,null,null,"/common/getDivisionList.do",null);
	 $("#divisionDiv").empty();
	 for(var i=0;i<divisionList.length;i++){
		if(divisionList[i].divCode=="SYNERGY"){ //일단 FIDES 는 사용하지않으니 SYNERGY만, 추후 사용할시 if문만 빼주면 됨.
		 	var str="";
		 	str='<div id="userListDiv'+divisionList[i].divCode+'"></div>'
		 	$("#divisionDiv").append(str);
		 	getUserList(divisionList[i].divCode,divisionList[i].divName,1); 
		 }
	 }
	
	
	
	if('<c:out value='${deleteCnt}'/>' > 0 ) {
		alert('<c:out value='${message}'/>');	
		location.href ="<c:url value='index.do' />";
	}
	if('<c:out value='${saveCnt}'/>' > 0 ) {
		location.href ="<c:url value='index.do' />";
	}
	$("tr:even").css("background-color", "#E0F8F7");

	//전달 버튼 클릭시 사람들 이름 보이기
	$(document).on("click",".pass2P", function(){
		var t_num = $(this).attr('id').split('_');
		var dId = (parseInt(t_num[0])<10?("0"+t_num[0]):t_num[0])+'memoPr'+ t_num[2];
		$('#memoDay').val(parseInt(t_num[0])<10?("0"+t_num[0]):t_num[0]);
		$('#comment').val($("#"+dId).find('textarea').val());
		divId = 'test';
		divShow($(this));
		$("#PM_0").focus();
	});
	//업무일지 닫기 클릭시
	$(document).on("click",".closePopUpMenu",function(event){
		$(this).parent().hide();
		$("#selectstaffname").hide();
	});
	function divShow(obj){
		var objId = obj.attr('id');
		object = objId;
		divPosition(objId,divId);
		$("#"+divId).css('display','block');
		$("#"+divId).show();

	}

	function divPosition(target,id){
		var browserWidth = document.documentElement.clientWidth;
		var tInput  = $("#" + target).offset();
		var tHeight = $("#" + target).outerHeight();
		var tWidth 	= $("#" + target).outerWidth();
		var calWidth 	= $("#" + id).outerWidth();

		if( tInput != null){
			$("#" + id).css({"top":tInput.top+15 , "left":(tInput.left+calWidth<browserWidth?tInput.left:browserWidth-(calWidth+8))});
		}
	}
	
	//업테 변경시(식사 >> 점심,저녁 선택)	20150713
	/*
	$("#dv").change(function(){
		var val = $("#dv").val(); 
		if(val == '1' || val == '2' || val == '3' || val == '4'){
			$("#dv2").show();
		}else{
			$("#dv2").hide();
		}
	});*/
	
	$("#dv").mouseover(function(){
		$("#balloon").show();		//도움말풍선
		$("#balloon").css("left",270);	//$("#note").offset().left);
	});
	$("#dv").change(function(){
		$("#balloon").hide();		//도움말풍선
	});
	$("#dv").mouseout(function(){
		$("#balloon").hide();		//도움말풍선
	});
	
	//항목 선택시 항목 그룹핑 정보 입력
	$("select[name='dv']").change(function(){
		var dv = $(this).val();
		var dv2 = null;
		if(dv != ""){
			if(dv > 0 && dv <= 50){
				dv2 = "1000";
			}else if(dv > 50 && dv < 100){
				dv2 = "2000";
			}else if(dv == 100){
				dv2 = "3000";
			}else if(dv > 100 && dv < 160){
				dv2 = "4000";
			}else if(dv == 160){
				dv2 = "5000";
			}else if(dv == 170){
				dv2 = "6000";
			}
			$("#dv2").val(dv2);
		}
	});
});

function getUserList(divCode,divName,count){  //division code,divisionName,divisionList length
	var url = contextRoot + "/work/selectuserList.do";
	var param = {division : divCode};

	    	    	
	var callback = function(result){
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;		//결과수
		var list = obj.resultList;		//결과데이터JSON
		
	
		
		if(list.length>0){
						
			var str="";
			for(var i=0 ; i<list.length ;i++){
				str+=' <input type="checkbox" id="'+divCode+'chbox'+i+'" name="memoSndName" value="'+list[i].usrNm+'" ';
				if(list[i].usrNm=="${userLoginInfo.name}"){
					str+=' checked="checked" ';
				}
				str+=' >';
				str+='<label for="'+divCode+'chbox'+i+'" class="checkR">'+list[i].usrNm+' </label>';
				if(i%2==1){
					str+='<br/>';
				}
			}
			if(count>1){
				str=' <p style="background-color:white; text-align:center;"> <b>'+divName+'</b></p>'+str;
			}
		}
		$("#userListDiv"+divCode).html(str);

	};
	commonAjax("POST", url, param, callback, true, null, null);
}
/* 
function getUserList2(){
	var url = contextRoot + "/work/selectuserList.do";
	var param = {division : 'FIDES'};

	    	    	
	var callback = function(result){
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;		//결과수
		var list = obj.resultList;		//결과데이터JSON
		console.log(list);
	
		var str=" ";
		if(list.length>0){
			str+='<p style="background-color:white; text-align:center;"><b> FIDES </b></p> ';
			for(var i=0 ; i<list.length ;i++){
				
				str+=' <input type="checkbox" id="chbox'+i+'" name="memoSndName" value="'+list[i].usrNm+'" ';
				if(list[i].usrNm=="${userLoginInfo.name}"){
					str+=' checked="checked" ';
				}
				str+=' >';
				str+='<label for="chbox'+i+'" class="checkR">'+list[i].usrNm+' </label>';
				if(i%2==1){
					str+='<br/>';
				}
			}
		}
		$("#userListDivFides").html(str);

	};
	commonAjax("POST", url, param, callback, true, null, null);
} */

//엑셀다운(html table to excel)
function excelDown(htmlStr, fileName, sheetName){	//excelDown(html문자열, 파일명, 시트명)
	
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
}

//엑셀다운로드
function excelDownList(){
	
	var htmlStr = "<table>";
	htmlStr += $("#excelContentHeader").html();
	$(".excelContentRow").each(function(index){		
		var str = $(this).html();
		str = str.substring(0, str.lastIndexOf('<td class="cent">'));
		htmlStr += ("<tr>" + str + "</tr>");
	});
	htmlStr += $("#excelContentRowFooter").html();	
	htmlStr += "</table>";
	
	excelDown(htmlStr, '지출'+(new Date().yyyy_mm_dd()));	
}


//수정 팝업 추가 20151207
var myModal = new AXModal();	// instance
function updateCardPop(obj, snb){
	var url = "<c:url value='/card/updateCardPop.do'/>";
	
	var params = {snb : snb};
	
	myModal.open({
		url: url,
		pars: params,
		titleBarText: '지출 수정',		//titleBarText 속성 추가하였음.(원 Axisj에는 없었던것)
		method:"POST",
		top: 150,
		width: 1650,
		closeByEscKey: true				//esc 키로 닫기
	});
}

function alarmReg(){
	//left 숨기기
	parent.leftIframeOFF();
	parent.mainFrame.location.href="<c:url value='/alarm/index.do'/>";
}

function openMemo(num, dt){
	//메모 보이기 
	var top = $(document).scrollTop();
	top += 10;
	<c:forEach items='${cardList}' var="item" varStatus="status">
		var cnt = '${status.count}';
		if(cnt != num){
			$("#bsnsPmemo_"+cnt).attr("style","display:none;");
		}else{
			$("#bsnsPmemo_"+num).attr("style","display:block;left:35%;top:"+top+"px");
			$("#bsnsPmemodt_"+num).html(dt+"일 메모");
		}
	</c:forEach>
}


</script>

</head>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<body>
<!-- ---------------------------- 항목말풍선 :S --------------------------------- -->
<div id="balloon" style="display:none;position:absolute;left:910px;top:130px;width:400px;height:480px;background-color:#BEEFFF;padding-left:10px;border-radius:20px;border:0px;">
<table><tr><td width="100%" bgcolor="#BEEFFF">
<br>
----------- 영업 관련 -------------------------------------<br>
점심-업무&nbsp;&nbsp;&nbsp;  ( 업무 관계자와 점심식사 )<br>
저녁-업무&nbsp;&nbsp;&nbsp;  ( 업무 관계자와 저녁식사 )<br>
회식-업무&nbsp;&nbsp;&nbsp;  ( 업무 관계자와 저녁 회식 - 저녁식사외 별도인 경우 )<br>
커피-업무&nbsp;&nbsp;&nbsp;  ( 업무 관계자와 식사외 비용 - 간식 포함)<br>
<%--기타-업무&nbsp;&nbsp;&nbsp;  ( 업무 관계자와 위 사항 외 지출 비용)<br> --%>
<br>
----------- 복리후생 관련 ---------------------------------<br>
점심-직원&nbsp;&nbsp;&nbsp;  ( 일상적인 직원 점심 )<br> 
저녁-야근&nbsp;&nbsp;&nbsp;  ( 본사 야근시 저녁 식사비용)<br> 
부서회식&nbsp;&nbsp;&nbsp;&nbsp;    ( 부서 회식비 )<br>
워크샵-식비 ( 워크샵 비용중 식대 관련 비용-식사,커피,간식 )<br>
워크샵-회식 ( 워크샵 비용중 회식 관련 비용 )<br>
<br>
----------- 교통비 관련 -----------------------------------<br>
대중교통비&nbsp; ( 택시,지하철,버스 이용시-업무 )<br>
<br>
----------- 차량 유지 관련 --------------------------------<br>
주유비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    ( 업무용 차량 및 본인 차량 운행시 - 워크샵 등 )<br>
주차비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    ( 업무용 차량 및 본인 차량 운행시 )<br>
세차비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    ( 업무용 차량 )<br>
엔진오일&nbsp;&nbsp;&nbsp;    ( 업무용 차량 )<br>
정비비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    ( 업무용 차량 )<br>
<br>
---------- 운반비 관련 ------------------------------------<br>
택배비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ( 우편물, 택배 비용 )<br>
<br>
---------- 구입비 관련 ------------------------------------<br>
소모품비&nbsp;&nbsp;&nbsp;     ( 사무용품 구입 비용 )<br>
<br>
<%------------ 기타 --------------------------------------------<br>
기타&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       ( 위 사항에 포함되지 않는경우, 상세 설명 기록 )<br> --%>
</td></tr></table> 
</div>
<!-- ---------------------------- 항목말풍선 :E --------------------------------- -->
<div id="wrap">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
	

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">

		<!-- 메모   -->
			<c:forEach var="plan" items="${cardList}" varStatus="planStatus">
			<div class="popUpMenu title_area" id="bsnsPmemo_${planStatus.count }">
				<input type="hidden" id="bsnsPsnb${planStatus.count }" value="${plan.sNb}"/>
				<p class="closePopUpMenu" title="닫기">ⅹ닫기</p>
				<ul>
					<div id="bsnsPmemodt_${planStatus.count}" style="font-weight:bolder;padding-bottom:5px;"></div>
					<li class="c_note"><textarea id="memoarea${planStatus.count }">${plan.feedback}</textarea></li>
				</ul>
				<p class="bsnsR_btn">
					<c:if test="${ memoAuth == 'Y' }">
						<span class="btn s green"  id="bsnsPlanSaveBtn_${planStatus.count }"><a onclick="bsnsPsave('card','bsnsPlanSaveBtn_${planStatus.count }');">저장</a></span>
					</c:if>
					<div height="10px"> </div>
				</p>
				
			</div>
			</c:forEach>
			
			<div class="popUpMenu title_area" id="bsnsPmemo_0">
				<p class="closePopUpMenu" title="닫기">ⅹ닫기</p>
				<ul>
					<li class="c_note"><textarea id="memoarea0" placeholder="메모"></textarea></li>
				</ul>
			</div>
		<!-- 메모   -->


	<section>
		<article>
		<div class="fixed-top" style="z-index:10;">
		
		<header>
			<form id="modifyRec" name="modifyRec" method="post" action="<c:url value='/card/index.do' />">
				<input type="hidden" name="sorting" id="sorting">
				<input type="hidden" name="usrId" id="usrId" value="${usrID}">
				<input type="hidden" name="total" id="total" value="">
			<div class="year_wrap">
			
				<c:set var="now" value="<%= new java.util.Date() %>"/>
				<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
				<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
				
				<input type="hidden" id="choice_month" name="choice_month" value="${cardVO.choice_month}">
				
				<span class="year">
					<select id='choice_year' name='choice_year' onchange="javascript:document.modifyRec.submit();">
						<c:forEach var="year" begin="2010" end="${cur_year}">
							<option value="${year}">
							<c:choose>
								<c:when test="${choice_year == null}">
									<c:if test="${year == cur_year}">selected</c:if>>
								</c:when>
								<c:otherwise>
									<c:if test="${year == choice_year}">selected</c:if>>
								</c:otherwise>
							</c:choose> 
							${year}</option>
						</c:forEach>
					</select>
				</span>
				 
				
				<a <c:if test="${cardVO.choice_month == '01' }">class="red bold"</c:if> onclick="month('01','index.do')">1월</a><span> | </span>
				<a <c:if test="${cardVO.choice_month == '02' }">class="red bold"</c:if> onclick="month('02','index.do')">2월</a><span> | </span>
				<a <c:if test="${cardVO.choice_month == '03' }">class="red bold"</c:if> onclick="month('03','index.do')">3월</a><span> | </span>
				<a <c:if test="${cardVO.choice_month == '04' }">class="red bold"</c:if> onclick="month('04','index.do')">4월</a><span> | </span>
				<a <c:if test="${cardVO.choice_month == '05' }">class="red bold"</c:if> onclick="month('05','index.do')">5월</a><span> | </span>
				<a <c:if test="${cardVO.choice_month == '06' }">class="red bold"</c:if> onclick="month('06','index.do')">6월</a><span> | </span>
				<a <c:if test="${cardVO.choice_month == '07' }">class="red bold"</c:if> onclick="month('07','index.do')">7월</a><span> | </span>
				<a <c:if test="${cardVO.choice_month == '08' }">class="red bold"</c:if> onclick="month('08','index.do')">8월</a><span> | </span>
				<a <c:if test="${cardVO.choice_month == '09' }">class="red bold"</c:if> onclick="month('09','index.do')">9월</a><span> | </span>
				<a <c:if test="${cardVO.choice_month == '10' }">class="red bold"</c:if> onclick="month('10','index.do')">10월</a><span> | </span>
				<a <c:if test="${cardVO.choice_month == '11' }">class="red bold"</c:if> onclick="month('11','index.do')">11월</a><span> | </span>
				<a <c:if test="${cardVO.choice_month == '12' }">class="red bold"</c:if> onclick="month('12','index.do')">12월</a><span> | </span>
				&nbsp;<span class="btn s red"><a onclick="javascript:totalList();">전체</a></span>
				<c:if test="${userLoginInfo.permission >= '00020' or userLoginInfo.id eq 'kmy' or userLoginInfo.id eq 'jyl' or userLoginInfo.id eq 'mjy'}">
				<span class="btn s gray" style="margin-left:10px;"><a onclick="javascript:excelDownList();">엑셀다운</a></span>
				<span class="btn s gold" style="margin-left:10px;"><a onclick="javascript:alarmReg();">공지등록</a></span>
				</c:if>
				
			</div>
			</form>
			
			
		</header>
		
		
			
		</div>
		<div style="padding-top:50px;">
		
		
				<input type="hidden" id="cardD" value="card">
			<form name="insertCard" id="insertCard" method="post">
	
<!-- floating div staff -->

				<div class="popUpMenu" id="test" style="font-size: 1em;">
					<p class="closePopUpMenu">ⅹ닫기</p>
					<div id="divisionDiv"></div>
					
					<p class=bsnsR_btn>
						<span class="memo_btnSnd btn s green"><a onclick="selectStaff()">선택</a></span>
					</p>
				</div>
	
<!-- floating div staff -->
			<input type="hidden" id="dv2" name="dv2" value=""/>
			<table id="excelContentHeader" class="t_skinR00" style="width:100%;padding-right:5px;">
				<colgroup>
			        <col width="76">
			        <col width="57">
			        <col width="112">
			        <col width="112">
			        <col width="166">
			        <col width="175">
			        <col width="108">
			        <col width="87">
			        <col width="200">
			        <col width="130">
			    </colgroup>
				<thead>
					<tr>
 						<th rowspan="2" onclick="sortTable()" class="hand bgYlw" style="padding:5px 0;">일자<br/>▼</th>
 						<th rowspan="2" onclick="sortTable(1)" class="hand bgYlw">입력자▼</th>
						<th colspan="2" class="bgYlw">대상자</th>
						<th rowspan="2" class="bgYlw">시너지<br/>참석자</th>
						<th rowspan="2" class="bgYlw">장소</th>
						<th rowspan="2" class="bgYlw">항목</th>
						<th rowspan="2" class="bgYlw">금액</th>
						<th rowspan="2" class="bgYlw"><nobr>지출</nobr><br/>목적</th>
						<th rowspan="2" class="bgYlw">승인<br/>피드백</th>
					</tr>
					<tr>
						<th class="bgYlw">회사</th>
						<th onclick="sortTable(2)" class="hand bgYlw">이름▼</th>
						<!-- <th class="bgYlw">소속/직급</th> -->
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
				
			</table>

	
			<table class="t_skinR00" style="width:100%;padding-right:5px;">
				<colgroup>
			        <col width="76">
			        <col width="57">
			        <col width="112">
			        <col width="112">
			        <col width="166">
			        <col width="175">
			        <col width="108">
			        <col width="87">
			        <col width="200">
			        <col width="130">
			    </colgroup>
				<tbody>
					<tr>
						<input type="hidden" name="cstSnb" id="cstSnb">
						<input type="hidden" name="tmDt" id="tmDt">
						<td class="cent bgRed" style="padding:5px 0;">
							<span id="cardDate">&nbsp;</span>
							<div id='CaliCal0Icon' style="padding-top: 1px;float:right;">
								<img id='CaliCal0IconImg' class='calImg' src='../images/calendar.gif'>
							</div>
							
							<input type="hidden" id="iCal0"/>
							<script>initCal({id:"iCal0",type:"day",today:"y"});</script>
						</td>
						<td class="cent bgRed">${userLoginInfo.name }</td>
						<td class="cent bgRed" id="sltCpn"></td>
						<td class="cent bgRed"><span class="btn s blue"><a onclick="popUp('','card')" id="sltNm">대상자</a></span><span id="sltCst" style="display:none;">외 <input type="text" name="etcNum" style="border:0;height:15px;width:14px;" onclick="if (this.value == this.defaultValue) {this.value='';}" value="0"/>명</span>
						</td>
						<!-- <td class="cent bgRed" id="sltPst"></td> -->
						<!-- <td class="cent bgRed"><span class="btn s orange"><button type="button" class="pass2P" id="0_0_staff_0">직원</button></span></td> -->
						<td class="cent bgRed"><span class="btn s orange"><input type="button" class="pass2P" id="0_0_staff_0" value="직원"/></span></td>
						<td class="cent bgRed"><input type="text" name="place" id="place" class="w96 pd0"></td>
						<td class="cent bgRed">
							<select name="dv" id="dv" class="pd0">
								<option value="">선택</option>
								<optgroup label="영업 관련">
								<!-- dv2 : 1000 -->
								<option value="10">점심-업무</option>
								<option value="20">저녁-업무</option>
								<option value="30">회식-업무</option>
								<option value="40">커피-업무</option>
								<%--<option value="50">기타-업무</option> --%>
								</optgroup>
								<optgroup label="복리후생 관련">
								<!-- dv2 : 2000 -->
								<option value="55">점심-직원</option>
								<option value="60">저녁-야근</option>
								<option value="70">부서회식</option>
								<option value="80">워크샵-식비</option>
								<option value="90">워크샵-회식</option>
								</optgroup>
								<optgroup label="교통비 관련">
								<!-- dv2 : 3000 -->
								<option value="100">대중교통비</option>
								</optgroup>
								<optgroup label="차량 유지 관련">
								<!-- dv2 : 4000 -->
								<option value="110">주유비</option>
								<option value="120">주차비</option>
								<option value="130">세차비</option>
								<option value="140">엔진오일</option>
								<option value="150">정비비</option>
								</optgroup>
								<optgroup label="운반비 관련">
								<!-- dv2 : 5000 -->
								<option value="160">택배비</option>
								</optgroup>
								<optgroup label="구입비 관련">
								<!-- dv2 : 6000 -->
								<option value="170">소모품비</option>
								</optgroup>
								<%--<optgroup label="기타">
								<option value="200">기타</option>
								</optgroup>	 --%>						
							</select>
							<%--<select name="dv2" id="dv2" class="pd0" style="width:60px;display:none;padding-top:3px;background-color:#eeeeee;">
								<option value="">구분</option>
								<option value="1">점심</option>
								<option value="2">저녁</option>
							</select> --%>
						</td>
						<td class="cent bgRed"><input type="text" name="price" id="price" class="w96 pd0 intNum" onKeyPress="return numbersonly(event, false)"></td>
						<td class="cent bgRed"><input type="text" name="note" id="note" class="w96 pd0"></td>
						<td class="cent bgRed"><span class="btn s green"><a onclick="cardSubmit(this)">저장</a></span></td>
					</tr>
					
					<c:forEach var="card" items="${cardList}" varStatus="cardStatus">
					<tr class="excelContentRow">
						<input type="hidden" id="snb${cardStatus.count}" value="${card.sNb}">
						
						<td class="cent" style="padding:5px 0;">${fn:substring(card.tmDt,0,10)}</td>
						<td class="cent">${card.staffNm}</td>
						<td class="cent">${card.cstCpnNm}</td>
						<td class="cent" title="${card.position}"><nobr><a href="#" onclick="personHistoryPopUp('','personHistoryPop','','${card.cstSnb}');return false;">${card.cstNm}</a> <c:if test="${card.etcNum !=0}"><small>외 ${card.etcNum}명</small></c:if></nobr></td>
						<%-- <td class="cent"><small>${card.position}</small></td> --%>
						<td class="cent">
							<c:choose>
								<c:when test="${card.dv == '60'}">
									<c:forEach	items="${card.staffInfoList}" var="user" varStatus="status">
										<c:choose>
											<c:when test="${user.leaveWorkTime== null and fn:substring(card.tmDt,0,10) > '2016-08-31'}">	<!-- 퇴근 기록 없을때 -->
												<span style="color:#FF5E00;">	
													<font style="cursor:pointer;"  title="퇴근미체크"><b>${user.cstNm}</b></font>
												</span>
											</c:when>
											<c:when test="${fn:replace(user.leaveWorkTime,':','')<210000 and fn:substring(card.tmDt,0,10) > '2016-08-31'}">	<!-- 퇴근시간이 오후 9시 이전일때 -->
												<span style="color:#FF5E00;"><!-- #0054FF -->
													<font style="cursor:pointer;" title="퇴근시간: ${fn:substring(user.leaveWorkTime,0,2)}:${fn:substring(user.leaveWorkTime,3,5)}"><b>${user.cstNm}</b></font>
												</span>
											</c:when>
											<c:otherwise>
												${user.cstNm}
											</c:otherwise>
										</c:choose>	
										<c:if test="${status.count < fn:length(card.staffInfoList) }">,</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									${card.staff}
								</c:otherwise>
							</c:choose>
						</td>
						<td class="cent">${card.place}</td>
						<td class="cent">
							<c:choose>
								<c:when test="${card.dv == '10'}">점심-업무</c:when>
								<c:when test="${card.dv == '20'}">저녁-업무</c:when>
								<c:when test="${card.dv == '30'}">회식-업무</c:when>
								<c:when test="${card.dv == '40'}">커피-업무</c:when>
								<c:when test="${card.dv == '50'}">기타-업무</c:when>
								<c:when test="${card.dv == '55'}">점심-직원</c:when>
								<c:when test="${card.dv == '60'}">저녁-야근</c:when>
								<c:when test="${card.dv == '70'}">부서회식</c:when>
								<c:when test="${card.dv == '80'}">워크샵-식비</c:when>
								<c:when test="${card.dv == '90'}">워크샵-회식</c:when>
								<c:when test="${card.dv == '100'}">대중교통비</c:when>
								<c:when test="${card.dv == '110'}">주유비</c:when>
								<c:when test="${card.dv == '120'}">주차비</c:when>
								<c:when test="${card.dv == '130'}">세차비</c:when>
								<c:when test="${card.dv == '140'}">엔진오일</c:when>
								<c:when test="${card.dv == '150'}">정비비</c:when>
								<c:when test="${card.dv == '160'}">택배비</c:when>
								<c:when test="${card.dv == '170'}">소모품비</c:when>
								<c:when test="${card.dv == '200'}">기타</c:when>
							</c:choose>
							<%--<c:choose>
								<c:when test="${(card.dv == '1'||card.dv == '2'||card.dv == '3'||card.dv == '4') && card.dv2 == '1'}">(점심)</c:when>
								<c:when test="${(card.dv == '1'||card.dv == '2'||card.dv == '3'||card.dv == '4') && card.dv2 == '2'}">(저녁)</c:when>
							</c:choose> --%>
						</td>
						<c:set var="spanColor" value=""/>
						<c:choose>
							<c:when test="${card.dv == '60' and card.price/fn:length(card.staffInfoList)>10000 and fn:substring(card.tmDt,0,10) > '2016-08-31'}">
									<c:set var="spanColor" value="background:#1DDB16;border:1px dotted #90af8e;"/>
							</c:when>
						</c:choose>
						
						<td class="rgt" style="${spanColor}">
							<%-- <c:choose>
								<c:when test="${fn:length(card.price) > 6}">
									${fn:substring(card.price, 0,(fn:length(card.price)-6))},${fn:substring(card.price, (fn:length(card.price)-6),(fn:length(card.price)-3))},${fn:substring(card.price, (fn:length(card.price)-3),fn:length(card.price))}
								</c:when>
								 <c:when test="${fn:length(card.price) < 7 && fn:length(card.price) > 3}">
									${fn:substring(card.price, 0,(fn:length(card.price)-3))},${fn:substring(card.price, (fn:length(card.price)-3),fn:length(card.price))}
								</c:when> 
								<c:otherwise>
									${card.price}
								</c:otherwise>
							</c:choose>원 --%>							
							<fmt:formatNumber var="cdPrice" value="${card.price}" pattern=",###"/>
							${cdPrice } 원 
						</td>
						<td class="cent">${card.note}</td>
						<td class="cent">
							<c:if test="${userLoginInfo.name==card.staffNm}">
								<%-- <span class="btn s orange"><a onclick="modifyCardUsed(this, ${cardStatus.count})">수정</a></span> --%>
								<span class="btn s orange"><a onclick="updateCardPop(this, ${card.sNb})">수정</a></span>	<!-- 20151207 -->
								<span class="btn s red"><a onclick="delCardUsed(this, ${cardStatus.count})">삭제</a></span>
							</c:if>
							<c:if test="${not empty card.sNb }">
								<c:if test="${fn:length(card.feedback)>=1}">
									<div style="padding-top:3px;">
										<a class="memoBtn" href="javascript:openMemo('${cardStatus.count}','${fn:substring(card.tmDt,0,10)}');" id="mm_${cardStatus.count}"><img style='vertical-align:top;' src="<c:url value='/images/edit-5-icon.png'/>" title="메모 입력">
											<font style="color:#000">${fn:substring(card.feedback,0,10)}...</font>
										</a>
									</div>
								</c:if>
								<c:if test="${fn:length(card.feedback)<1}"> 
									<c:if test="${memoAuth == 'Y' }">
										<a class="memoBtn" href="javascript:openMemo('${cardStatus.count}','${fn:substring(card.tmDt,0,10)}');" id="mm_${cardStatus.count}"><img style='vertical-align:middle;' src="<c:url value='/images/edit-5-icon.png'/>" title="메모 입력"></a>
									</c:if>
									<c:if test="${memoAuth == 'N' }">
										<a class="memoBtn"><img style='vertical-align:middle;' src="<c:url value='/images/edit-5-icon.png'/>" title="메모 입력"></a>
									</c:if>
								</c:if>
							</c:if>
							</td>
					</tr><c:set var="sumPrice" value="${card.price+sumPrice+0 }" />
					</c:forEach>
					<tr id="excelContentRowFooter">
						<td class="cent" colspan="7">총합</td>
						<td class="rgt"><fmt:formatNumber var="totalPrice" value="${sumPrice}" pattern=",###"/>
							${totalPrice} 원
						</td>
						<td class="cent"></td>
						<td class="cent"></td>
					</tr>
					
					
				</tbody>
			</table>
			</form>
		</div>
						
		</article>
	</section>
</div>
<div class="clear"></div>
</body>
</html>