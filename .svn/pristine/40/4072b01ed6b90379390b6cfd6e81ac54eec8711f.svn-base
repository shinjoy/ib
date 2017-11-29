<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js?ver=2.1'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/popUp.js'/>" ></script>
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
	
	
	
	//20150901
	setSortBtn();		//정렬버튼 모양 세팅 함수 호출
	
});

function addDeal(cpnId,th){
	var obj = $(th).parent().parent().parent();
	//var tm = obj.find('td:eq(0)').html();
	var tm = $("#CurDay").val();
	var tmArr = tm.split('-');
	var comment = "주관사 : "+obj.find('td:eq(9)').html();
	comment += "\n["+obj.find('td:eq(1)').html()+"] "+obj.find('td:eq(3)').html();
	comment += "\n 발행규모 "+obj.find('td:eq(4)').html()+"억, 할인율 "+obj.find('td:eq(8)').html();
	
	var data = {
			choice_year: tmArr[0]
			,choice_month: tmArr[1]
			,day: tmArr[2]
			,middleOfferCd:'00003'
			,cpnId: cpnId
			,price: obj.find('td:eq(4)').html()+"억"
			,categoryCd: '00004'
			,memo: comment
			,dueDt: obj.find('td:eq(6)').html()
			,rgId: $("#rgstId").val()
			};
	var url = "../work/insertDeal.do";
	var fn = function(){
		document.modifyRec.submit();
	};
	ajaxModule(data,url,fn);
}

function validation(obj){
	if(obj.attr('id')=='tbl00'){
		if(obj.find("[id^=tm]").val().is_null()){
			alert("접수일자를 입력하시요.");
			return false;
		}
		if(obj.find("[id^=AP_cpnId]").val().is_null()){
			alert("회사를 선택하시요.");
			return false;
		}
	}
	var pri =  obj.find("[id^=ratio]").val();
	if(parseFloat(pri)>1) {
		alert("할인율은 퍼센트문자를 지우고, 0.xxx 와 같이 소수로 입력하세요.");
		return false;
	}
	if(obj.find("[id^=cate]").val().is_null()){
		alert("구분을 입력하시요.");
		return false;
	}

	if(obj.find("[id^=way]").val().is_null()){
		alert("증자방식을 입력하시요.");
		return false;
	}
	if(obj.find("[id^=pri]").val().is_null()){
		alert("발행규모를 입력하시요.");
		return false;
	}
	if(obj.find("[id^=subdt]").val().is_null()){
		if(confirm("청약일이 입력되지 않았습니다! 그대로 등록하시겠습니까?")){		//20150724 청약일 입력안해도 저장되도록 수정
			//////////go/////////
		}else{
			return;
		}
		//alert("청약일을 입력하시요.");
		//return false;
	}
	if(obj.find("[id^=ratio]").val().is_null()){
		alert("할인율을 입력하시요.");
		return false;
	}
	return true;
}
function insertNotice(th){
	var obj = $(th).parent().parent();
	if(!validation(obj)) return;
	var data = {
			tmDt: 			obj.find('input:eq(0)').val()
			,categoryCd: 	obj.find('input:eq(1)').val()
			,cpnId: 		obj.find('input:eq(2)').val()
			,way: 			obj.find('input:eq(3)').val()
			,price: 		obj.find('input:eq(4)').val().replace(',','')
			,assignmentDt: 	obj.find('input:eq(5)').val()
			,payupDt: 		obj.find('input:eq(6)').val()
			,subscriptionDt: obj.find('input:eq(7)').val()
			,refixSale: 	obj.find('input:eq(8)').val()
			,superCpn: 		obj.find('input:eq(9)').val()
			,underWriter: 	obj.find('input:eq(10)').val()
			,rgId: 			$("#rgstId").val()
	};	
	var url = "../work/insertPublicNoticeInCap.do";
	var fn = function(){
		document.modifyRec.submit();
	};
	ajaxModule(data,url,fn);
}
function modifyNotice(th){
	var obj = $(th).parent().parent();
	if(!validation(obj)) return;
	var data = {
		sNb: 			obj.find('input:eq(0)').val()
		,categoryCd: 	obj.find('input:eq(1)').val()
		,way: 			obj.find('input:eq(2)').val()
		,price: 		obj.find('input:eq(3)').val().replace(',','')
		,assignmentDt: 	obj.find('input:eq(4)').val()
		,payupDt: 		obj.find('input:eq(5)').val()
		,subscriptionDt: obj.find('input:eq(6)').val()
		,refixSale: 	obj.find('input:eq(7)').val()
		,superCpn: 		obj.find('input:eq(8)').val()
		,underWriter: 	obj.find('input:eq(9)').val()
		,rgId: 			$("#rgstId").val()
	};
	
	var url = "../work/modifyPublicNoticeIncCap.do";
	var fn = function(){
		document.modifyRec.submit();
	};
	ajaxModule(data,url,fn);
}
function deleteNotice(snb){
	var url = "<c:url value='/work/deletePublicNoticeIncCap.do'/>"
		, data = {sNb:snb}
		, fn = function(arg){
			document.modifyRec.submit();
		};
		ajaxModule(data,url,fn);
}

//20150901 추가(엑셀다운로드)
function excelDownload(){
	$('body').append('<iframe id="excelDown" style="display:none;"></iframe><form id="excelform"></form>');
	$('#excelform').attr('action',"../work/excelPublicNoticeIncCap.do");
	$('#excelform').attr('target','excelDown');
	$('#excelform').submit();
}

//정렬추가 20170905 ksm
function sortTable(flag, tm){
	if(flag == 'total' || flag == 'sellBuy'){
		$("#total").val(flag);
		$("#sorting").val(tm);
	}else if(flag == 'nototal'){
		$("#total").val('');
		$("#sorting").val(tm);		
	}else $("#sorting").val(flag);
	
	//회사명검색시 정렬 추가 20170905 ksm
	if('${cpnNm}' != ''){
		$("#s_cpnNm").val('${cpnNm}');
	}
	
	//전체검색시 정렬 추가 20170905 ksm
	if('${total}' != ''){
		$("#s_choiceYear").val('${total}');
	}
	
	document.modifyRec.submit();
}


var sortBtn = '${sortBtn}';		//정렬한 곳 숫자값 ('1',~'5')
function setSortBtn(){
	var sign;
	if(sortBtn == undefined || sortBtn == null || sortBtn == '' || sortBtn == '0'){
		sign = 1;
		sortBtn = 1;
	}else{
		sign = ((1 * sortBtn) > (-1 * sortBtn))? 1:-1;
	}// 1:정방향정렬, -1:역방향정렬
	 
	for(var i=1; i<=5; i++){
		var btnShape = '▽';		
		if(sortBtn == i){
			btnShape = '▲';
		}else if((sortBtn * -1) == i){
			btnShape = '▼';
		}
		$('#sortBtn'+i).html(btnShape);		//모양세팅
	}
}


//회사명 검색
function doSearch(){
	/* if($('#inputCpnNm').val().length < 2){
		alert('2글자 이상 입력해주세요!');
		return false;
	} */
	
	$('#s_cpnNm').val($('#inputCpnNm').val());
	
	document.modifyRec.submit();
}

//년도별보기 
function doYearCheck(cYear){
	$("#s_choiceYear").val(cYear);
	
	if('${cpnNm}' != ''){
		$("#s_cpnNm").val('${cpnNm}');
	}
	
	document.modifyRec.submit();
}


</script>
</head>
<style> tbody tr:hover{background-color: moccasin !important;} input{margin:4px 0px;padding:2px 0px !important;}</style>
<body>
<div id="wrap" class="content_box">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">	
	
		<article>
		
		<c:set var="now" value="<%= new java.util.Date() %>"/>
		<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
		<input type="hidden" id="CurDay" value="${cur_day}"/>
		
		<form name="modifyRec" action="<c:url value='/work/selectPublicNoticeIncCap.do' />" method="post">
			<input type="hidden" name="sorting" id="sorting">
			<input type="hidden" name="total" value="${ttT}">
			<!-- 년도, 회사명 추가 20170905 ksm -->
			<input type="hidden" id="s_cpnNm" name="cpnNm">
			<input type="hidden" name="choice_year" id="s_choiceYear" value="${choiceYear}">			
		</form>
		
		<input type="hidden" id="SendReceive" value="MR">		
		
		<div class="fixedTop" style="z-index:10;">

			<header>
				<form name="dayForm" id="dayForm" method="post" action="<c:url value='/work/selectPublicNoticeIncCap.do' />" onsubmit="return false;">
				<input type="hidden" name="total" id="total">
				<!-- <input type="hidden" id="s_cpnNm" name="cpnNm"> -->
				
				<div class="year_wrap" style="top:0px"><h2 class="headerTitle">
				
					<fmt:formatDate var="curYear" value='${now}' pattern='yyyy'/>
								
					공시 <small>(증자)</small>
					&nbsp;&nbsp;
					<span class="year">
						<select id='choiceYear' name='choice_year' onchange="doYearCheck(this.value);">
							<option value="total" <c:if test="${total eq 'total'}">selected</c:if>>전체</option> 
							<c:forEach var="year" begin="2014" end="${curYear+2}">
								<option value="${year}" 
								<c:choose>
									<c:when test="${choiceYear eq ''}">
										<c:if test="${year eq curYear}">selected</c:if>>
									</c:when>
									<c:otherwise>
										<c:if test="${year eq choiceYear}">selected</c:if>>									
									</c:otherwise>
								</c:choose>
								${year}</option>
							</c:forEach>
						</select>
					</span>
					&nbsp;&nbsp;<span class="btn s green"><a onclick="javascript:view('tbl00',this,event);">증자입력</a></span>
					&nbsp;&nbsp;<span class="btn s"><a onclick="javascript:excelDownload(this,event);">엑셀 다운로드</a></span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:12px;line-height:15px;height:19px;">회사명검색
						<input type="text" id="inputCpnNm" onKeydown="javascript:if(event.keyCode == 13) doSearch();" value="${cpnNm}" style="margin-bottom:2px;font-size:11px;border:1px solid #999999;width:150px;height:13px;padding-left:2px!important;">
					</span>
					<span class="btn s green"><a onclick="javascript:doSearch();">검색</a></span>
				</h2>
				</div>
				</form>
				<h2 class="headerTitle">&nbsp;</h2>
			</header>
	
			<table class="t_skinR00">
				<thead>
					<tr>
						<th onclick="sortTable(${(sortBtn==1||sortBtn==-1)?sortBtn:1});" class="hand" style="width:60px">접수일자<br/><div id="sortBtn1"></div></th>	<%--▽ --%>
						<th onclick="sortTable(${(sortBtn==2||sortBtn==-2)?sortBtn:2});" class="hand pd0 w50p">구분<br/><div id="sortBtn2"></div></th>
						<th onclick="sortTable(${(sortBtn==3||sortBtn==-3)?sortBtn:3});" class="hand pd0 w120p">회사명<br/><div id="sortBtn3"></div></th>
						<th onclick="sortTable(${(sortBtn==4||sortBtn==-4)?sortBtn:4});" class="hand pd0 w120p">증자방식<br/><div id="sortBtn4"></div></th>
						<th class="pd0 w60p">발행규모<small>(억)</small></th>
						<th class="pd0 w70p">배정기준일</th>
						<th class="pd0 w70p">신주인수권<br/>상장일</th>
						<th onclick="sortTable(${(sortBtn==5||sortBtn==-5)?sortBtn:5});" class="hand pd0 w70p">청약일<br/><div id="sortBtn5"></div></th>
						<th class="pd0 w40p">할인율</th>
						<th class="pd0 w120p">주관회사<br/><small>(담당자)</small></th>
						<th class="pd0 w200p"><nobr>인수자</nobr></th>
						<th class="pd0 w120p">딜 선택</th>
					</tr>
				</thead>
				</table></div>
			<div>
			<table class="t_skinR00">
				<tbody>
					<c:forEach var="nt" items="${NoticeList}" varStatus="ntS">
						<tr 
							<%-- <c:choose>
								<c:when test="${offer.progressCd == '10000'}"> style="background-color:#B9B9B9" </c:when>
								<c:otherwise> <c:if test="${offer.progressCd == '00002'}">style="background-color:#E7E7E7"</c:if><c:if test="${offer.progressCd == '00003'}">style="background-color:#A9F5BC"</c:if><c:if test="${fn:length(offer.cpnId) == 7}"> style="background-color:#CEF6EC"</c:if></c:otherwise>
							</c:choose> --%>
						>
							<td class="cent" style="width:70px;padding: 5px 0px;">${nt.tmDt}</td>
							<td class="cent pd0 w50p">${nt.categoryCd}</td>
							<td class="cent pd0 w120p"><a onclick="popUp('','rcmdCpn','','${nt.cpnSnb}')" style="cursor:pointer;">${nt.cpnNm}</a></td>
							<td class="cent pd0 w120p">${nt.way}</td>
							<td class="won" style="width:57px;">${nt.price}</td>
							<td class="cent pd0 w70p">${nt.assignmentDt}</td>
							<td class="cent pd0 w70p">${nt.payupDt}</td>
							<td class="cent pd0 w70p">${nt.subscriptionDt}</td>
							<td class="cent pd0 w40p">${nt.refixSale}%</td>
							<td class="cent pd0 w120p">${nt.superCpn}</td>
							<td class="pd0 w200p overFlowHidden" title="${nt.underWriter}"><nobr>${nt.underWriter}</nobr></td>
							<td class="cent pd0 w120p">
								<span class="btn s orange" style="float:left;margin-left:5px;"><a onclick="javascript:view('tbl${ntS.count}',this,event)">내용수정</a></span>
								<c:if test="${cur_day eq nt.rgDt}"><span class="btn s red" style="float:left;margin-left:5px;"><a onclick="javascript:deleteNotice('${nt.sNb}')">삭제</a></span></c:if>
								<%--
								<c:if test="${nt.tmpNum1<1}"><span class="btn s blue"><a onclick="javascript:addDeal('${nt.cpnId}',this)">클릭시 정보정리 딜로 등록됨</a></span></c:if>
								<c:if test="${nt.tmpNum1>0}">딜 추가됨</c:if>
								 --%>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</article>
		<div class="popUpMenu" style="width:930px;display:none" id="tbl00">
			<p class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</p>
			<table class="t_skinR00">
				<thead>
					<tr>
						<th class="" style="width:60px;border-radius:0px;">접수일자</th>
						<th class="pd0 w50p">구분</th>
						<th class="pd0 w120p">회사명</th>
						<th class="pd0 w120p">증자방식</th>
						<th class="pd0 w60p">발행규모<small>(억)</small></th>
						<th class="pd0 w80p">배정기준일</th>
						<th class="pd0 w80p">신주인수권<br/>상장일</th>
						<th class="pd0 w80p">청약일</th>
						<th class="pd0 w40p">할인율</th>
						<th class="pd0 w120p" style="border-radius:0px;">주관회사<br/><small>(담당자)</small></th>
						<th class="pd0 w80p"><nobr>인수자</nobr></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="cent pd0" style="width:70px;"><input type="text" class="w96" id="tm"></td>
						<td class="cent pd0"><input type="text" class="w96" id="cate"></td>
						<td class="cent pd0"><input type="hidden" class="w96" id="AP_cpnId_00"><span class="btn s orange" style="vertical-align:top;"><a onclick="popUp('00','c')" id="AP_cpnNm_00" class="c_title">회사선택</a></span></td>
						<td class="cent pd0"><input type="text" class="w96" id="way"></td>
						<td class="won"><input type="text" class="w96 intNum" id="price00" onKeyPress="return numbersonly(event, false)"/></td>
						<td class="cent pd0"><input type="text" class="w96" id=""></td>
						<td class="cent pd0"><input type="text" class="w96" id=""></td>
						<td class="cent pd0"><input type="text" class="w96" id="subdt"></td>
						<td class="cent pd0"><input type="text" class="w96" id="ratio00"></td>
						<td class="cent pd0"><input type="text" class="w96" id=""></td>
						<td class="cent pd0"><input type="text" class="w96" id=""></td>
					</tr>
				</tbody>
			</table>
			<p class="cent" style="margin:3px 0px;"><span class="btn s green" onclick="javascript:insertNotice(this);"><a>저장</a></span></p>
		</div>
		<c:forEach var="nt" items="${NoticeList}" varStatus="ntS">
		<div class="popUpMenu" style="width:930px;display:none" id="tbl${ntS.count}">
			<p class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</p>
			<table class="t_skinR00">
				<thead>
					<tr>
						<th class="" style="width:60px;border-radius:0px;">접수일자</th>
						<th class="pd0 w50p">구분</th>
						<th class="pd0 w120p">회사명</th>
						<th class="pd0 w120p">증자방식</th>
						<th class="pd0 w60p">발행규모<small>(억)</small></th>
						<th class="pd0 w80p">배정기준일</th>
						<th class="pd0 w80p">신주인수권<br/>상장일</th>
						<th class="pd0 w80p">청약일</th>
						<th class="pd0 w40p">할인율</th>
						<th class="pd0 w120p">주관회사<br/><small>(담당자)</small></th>
						<th class="pd0 w80p" style="border-radius:0px;"><nobr>인수자</nobr></th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<input type="hidden" value="${nt.sNb}"/>
						<td class="cent bgWht" style="width:70px;border-radius:0px;padding: 5px 0px;">${nt.tmDt}</td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="cate" value="${nt.categoryCd}"></td>
						<td class="cent bgWht pd0">${nt.cpnNm}</td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="way" value="${nt.way}"></td>
						<td class="cent bgWht won"><input type="text" class="w96 intNum" id="price${ntS.count}" value="${nt.price}" onKeyPress="return numbersonly(event, false)"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${nt.assignmentDt}"></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${nt.payupDt}"></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="subdt" value="${nt.subscriptionDt}"></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="ratio${ntS.count}" value="${nt.refixSale/100}"></td>
						<td class="cent bgWht pd0""><input type="text" class="w96" id="" value="${nt.superCpn}"></td>
						<td class="cent bgWht pd0" style="border-radius:0px;"><input type="text" class="w96" id="" value="${nt.underWriter}"></td>
					</tr>
				</tbody>
			</table>
			<p class="cent" style="margin:3px 0px;"><span class="btn s orange" onclick="javascript:modifyNotice(this);"><a>수정</a></span></p>
		</div></c:forEach>
</div>
</body>
</html>
