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
<link href="<c:url value='/css/management.css'/>" rel="stylesheet" type="text/css"/>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/popUp.js'/>" ></script>
<script>
 $(document).ready(function(){
	$(".t_skinR00 tbody tr:odd").css("background-color", "#F6F9FB");
	$(".t_skinR00 thead th").addClass('bgPuple');
	
	
	
	//20150902
	setSortBtn();		//정렬버튼 모양 세팅 함수 호출
	
	
 });
$(document).on("change",'.processResult',function(){
	var obj = $(this);
	obj.parent().find('input').val(obj.val());
});
 function validation(obj){

	if(isNullAlert(obj,'tm','청구일자를'))
		return false;
	if(isNullAlert(obj,'cate','행사내용을'))
		return false;
	if(isNullAlert(obj,'AP_cpnId','회사를'))
		return false;
	if(isNullAlert(obj,'rank','회차를'))
		return false;

 	return true;
 }
 
 function isNullAlert(obj, id, text){
	 if(obj.find("[id^="+id+"]").val().is_null()){
		alert(text+" 입력하십시요.");
		return true;
	}
 }
 
 function insertNotice(th){
		var obj = $(th).parent().parent();
		if(!validation(obj)) return;
		var data = {
				tmDt: 		obj.find('input:eq(0)').val()
				,cpnId:		obj.find('input:eq(1)').val()
				,rank:		obj.find('input:eq(2)').val()
				,categoryCd:obj.find('input:eq(3)').val()
				,eventStock:obj.find('input:eq(4)').val().replace(',','')
				,eventPrice:obj.find('input:eq(5)').val().replace(',','')
				,ipoDt: 	obj.find('input:eq(6)').val()
				,unchangeStock:		obj.find('input:eq(7)').val()
				,outstandingStock:	obj.find('input:eq(8)').val()
				,eventUser:	obj.find('input:eq(9)').val()
				,comment: 	obj.find('input:eq(10)').val()
				,rgId: $("#rgstId").val()
		};	
		var url = "<c:url value='/work/insertEventPublicNotice.do'/>";
		var fn = function(){
			document.modifyRec.submit();
		};
		ajaxModule(data,url,fn);
	}
 
 function modifyNotice(th){
		var obj = $(th).parent().parent();
		if(!validation(obj)) return;
		
		var data = {
				sNb: 		obj.find('input:eq(11)').val()
				,tmDt: 		obj.find('input:eq(0)').val()
				,cpnId:		obj.find('input:eq(1)').val()
				,rank:		obj.find('input:eq(2)').val()
				,categoryCd:obj.find('input:eq(3)').val()
				,eventStock:obj.find('input:eq(4)').val().replace(',','')
				,eventPrice:obj.find('input:eq(5)').val().replace(',','')
				,ipoDt: 	obj.find('input:eq(6)').val()
				,unchangeStock:		obj.find('input:eq(7)').val()
				,outstandingStock:	obj.find('input:eq(8)').val()
				,eventUser:	obj.find('input:eq(9)').val()
				,comment: 	obj.find('input:eq(10)').val()
				,rgId: $("#rgstId").val()
		};	
		var url = "<c:url value='/work/modifyEventPublicNotice.do'/>";
		var fn = function(){
			document.modifyRec.submit();
		};
		ajaxModule(data,url,fn);
	}
function excelDownload(){
	$('body').append('<iframe id="excelDown" style="display:none;"></iframe><form id="excelform"></form>');
	$('#excelform').attr('action',"../work/excelEventPublicNotice.do");
	$('#excelform').attr('target','excelDown');
	$('#excelform').submit();
}
function deleteNotice(snb){
	var url = "<c:url value='/work/deleteEventPublicNotice.do'/>"
		, data = {sNb:snb}
		, fn = function(arg){
			document.modifyRec.submit();
		};
		ajaxModule(data,url,fn);
}

function sortTable(flag,ttT){
	if(ttT=='total'){
		$("#ttT").val(flag);
		$("#sorting").val('1');
	}else 
		$("#sorting").val(flag);
	
	document.modifyRec.submit();
}



//20150902 추가 (양방향정렬)
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


</script>
</head>
<style>
.t_skinR00 th, .t_skinR00 td{font-size:11px !important;} 
tbody tr:hover{background-color: moccasin !important;}
input{margin:4px 0px;padding:2px 0px !important;}
</style>
<body>
<div id="wrap" class="content_box">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">	
	
	<section>
		<article>
		
		<c:set var="now" value="<%= new java.util.Date() %>"/>
		<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
		
		<form name="modifyRec" action="<c:url value='/work/selectEventPublicNotice.do' />" method="post"><input type="hidden" name="sorting" id="sorting" value="${sorting}"><input type="hidden" id="ttT" name="total" value="${ttT}"></form>
		<input type="hidden" id="SendReceive" value="MR">
		
		<div class="fixed-top" style="z-index:10;">

			<header>
				<form name="dayForm" id="dayForm" method="post" action="<c:url value='/work/selectEventPublicNotice.do' />">
				<input type="hidden" name="total" id="total">
				<div class="year_wrap" style="top:0px"><h2 class="headerTitle">
				
					<c:set var="now" value="<%= new java.util.Date() %>"/>
					<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
								
					행사공시
					&nbsp;&nbsp;<span class="btn s green"><a onclick="javascript:view('tbl00',this,event);">공시입력</a></span>
					<%--
					&nbsp;&nbsp;<span class="btn s"><a onclick="javascript:excelDownload(this,event);">엑셀 다운로드</a></span>
					--%>
				</h2>
				</div>
				</form>
				<h2 class="headerTitle">&nbsp;</h2>
			</header>
			
<div>
	<div class="clear" style="float:left;width:10px;height:15px;">&nbsp;</div>
	<div style="height:16px;line-height:15px;"class="1st subTab<c:if test="${empty ttT}">on</c:if>" onclick="sortTable('','total')">전체</div>
	<c:forEach var="ct" items="${CategoryList}" varStatus="cateS">
	<div style="height:16px;line-height:15px;"class="1st subTab<c:if test="${ttT eq ct.categoryCd}">on</c:if>" onclick="sortTable('${ct.categoryCd}','total')">${ct.categoryCd}</div>
	</c:forEach>
	<div style="height:16px;line-height:15px;"class="1st subTab<c:if test="${ttT eq 'event'}">on</c:if>" onclick="sortTable('event','total')">행사공시</div>
	<div class="tabUnderBar" style="float:left;height:15px;">&nbsp;</div>
</div>
			
			<table class="t_skinR00" style="table-layout: fixed;">
				<colgroup>
					<col width="70">
					<col width="100">
					
					<col width="30">
					<col width="50">
					<col width="60">
					<col width="60">
					<col width="100">
					
					<col width="70">
					<col width="60">
					<col width="100">
					
					<col width="60">
					<col width="60">
					<col width="60">
					
					<col width="100">
					<col width="">
				</colgroup>
				<thead>
					<tr>
						<th onclick="sortTable(${(sortBtn==1||sortBtn==-1)?sortBtn:1});" class="hand">청구일자<br/><div id="sortBtn1"></div></th>
						<th onclick="sortTable(${(sortBtn==2||sortBtn==-2)?sortBtn:2});" class="hand pd0">회사명<br/><div id="sortBtn2"></div></th>
						
						<th class="pd0">회차</th>
						<th class="pd0">행사내용</th>
						<th class="pd0">행사<br/>주식수</th>
						<th class="pd0">행사가격</th>
						<th class="pd0">행사금액</th>
						
						<th class="pd0">상장<br/>예정일</th>
						<th class="pd0">현재가</th>
						<th class="pd0">현재가<br/>적용금액</th>
						
						<th class="pd0">미전환<br/>주식수</th>
						<th class="pd0">발행주식<br/>총수</th>
						<th class="pd0">발행주식<br/>총수대비</th>
						
						<th class="pd0">행사자</th>
						<th class="pd0">비고</th>
					</tr>
				</thead>
				</table></div>
			<div style="padding-top:97px;">
			<table class="t_skinR00" style="table-layout: fixed;">
				<colgroup>
					<col width="70">
					<col width="100">
					
					<col width="30">
					<col width="50">
					<col width="60">
					<col width="60">
					<col width="100">
					
					<col width="70">
					<col width="60">
					<col width="100">
					
					<col width="60">
					<col width="60">
					<col width="60">
					
					<col width="100">
					<col width="">
				</colgroup>
				<tbody>
					<c:forEach var="nt" items="${NoticeList}" varStatus="ntS">
						<tr>
							<td class="cent" style="padding: 5px 0px;">${nt.tmDt}</td>
							<td class="cent pd0">${nt.cpnNm}</td>
							
							<td class="cent pd0">${nt.rank}</td>
							<td class="cent pd0"><nobr>${nt.categoryNm}</nobr></td>
							<td class="cent pd0"><fmt:formatNumber value="${nt.eventStock}" groupingUsed="true"/></td>
							<td class="won"><fmt:formatNumber value="${nt.eventPrice}" groupingUsed="true"/></td>
							<td class="won"><fmt:formatNumber value="${nt.eventStock * nt.eventPrice}" groupingUsed="true"/></td>
							
							<td class="cent pd0">${nt.ipoDt}</td>
							<td class="won"><fmt:formatNumber value="${nt.curPrice}" groupingUsed="true"/></td>
							<td class="won"><fmt:formatNumber value="${nt.eventStock * nt.curPrice}" groupingUsed="true"/></td>
							
							<td class="cent pd0"><fmt:formatNumber value="${nt.unchangeStock}" groupingUsed="true"/></td>
							<td class="cent pd0"><fmt:formatNumber value="${nt.outstandingStock}" groupingUsed="true"/></td>
							<td class="cent pd0"><fmt:formatNumber value="${nt.eventStock / nt.outstandingStock}" groupingUsed="true" type="percent"/></td>

							<td class="cent pd0">${nt.eventUser}</td>
							<td class="pd0 overflowHide" title="${nt.comment}"><nobr>${nt.comment}</nobr>
								<span class="btn s orange" style="float:left;margin-left:5px;"><a onclick="javascript:view('tbl${ntS.count}',this,event)">내용수정</a></span>
								<c:if test="${cur_day eq nt.rgDt}"></c:if>
								<span class="btn s red" style="float:left;margin-left:5px;"><a onclick="javascript:deleteNotice('${nt.sNb}')">삭제</a></span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</article>
	</section>
	<div class="popUpMenu" style="width:500px;display:none" id="tbl00">
		<p class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</p>
		<table class="t_skinR00">
			<thead>
				<tr>
						<th class="pd0">청구일자</th>
						<th class="pd0">회사명</th>
						
						<th class="pd0">회차</th>
						<th class="pd0">행사내용</th>
						<th class="pd0">행사<br/>주식수</th>
						<th class="pd0">행사가격</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="cent bgWht pd0" style="width:70px;border-radius:0px;"><input type="text" class="cent w96" id="tm"/></td>
					<td class="cent bgWht pd0"><input type="hidden" class="cent w96" id="AP_cpnId_00"><span class="btn s orange" style="vertical-align:top;"><a onclick="popUp('00','c')" id="AP_cpnNm_00" class="c_title">회사선택</a></span></td>
					
					<td class="cent bgWht pd0"><input type="text" class="cent w96" id="rank"/></td>
					<td class="cent bgWht pd0"><input type="hidden" class="cent w96" id="cate" value="00001"/>
						<select class="processResult" id="processResult_0">
							<c:forEach var="cmmCd" items="${cmmCdCategoryList}" varStatus="status">
							<option value="${cmmCd.dTailCd}">${cmmCd.cdNm}</option>
							</c:forEach>
						</select>
					</td>
					<td class="cent bgWht pd0"><input type="text" class="cent w96" id=""/></td>
					<td class="cent bgWht pd0"><input type="text" class="cent w96" id=""/></td>
				</tr>
			</tbody>
		</table>
		<table class="t_skinR00">
			<thead>
				<tr>
						<th class="pd0">상장<br/>예정일</th>
						
						<th class="pd0">미전환<br/>주식수</th>
						<th class="pd0">발행주식<br/>총수</th>
						
						<th class="pd0">행사자</th>
						<th class="pd0">비고</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="cent bgWht pd0"><input type="text" class="cent w96" id=""/></td>
					
					<td class="cent bgWht pd0"><input type="text" class="cent w96" id=""/></td>
					<td class="cent bgWht pd0"><input type="text" class="cent w96" id=""/></td>
					
					<td class="cent bgWht pd0"><input type="text" class="cent w96" id=""/></td>
					<td class="cent bgWht pd0" style="border-radius:0px;"><input type="text" class="cent w96" id=""/></td>
				</tr>
			</tbody>
		</table>
		<p class="cent" style="margin:3px 0px;"><span class="btn s green" onclick="javascript:insertNotice(this);"><a>저장</a></span></p>
	</div>
	
	<c:forEach var="nt" items="${NoticeList}" varStatus="ntS">
	<div class="popUpMenu" style="width:600px;display:none" id="tbl${ntS.count}">
		<p class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</p>
		<table class="t_skinR00">
			<thead>
				<tr>
						<th class="pd0">청구일자</th>
						<th class="pd0">회사명</th>
						
						<th class="pd0">회차</th>
						<th class="pd0">행사내용</th>
						<th class="pd0">행사<br/>주식수</th>
						<th class="pd0">행사가격</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="cent bgWht pd0" style="width:70px;border-radius:0px;"><input type="text" class="cent w96" id="tm" value="${nt.tmDt}"/></td>
					<td class="cent bgWht pd0"><input type="hidden" class="cent w96" id="AP_cpnId_${ntS.count}" value="${nt.cpnId}">${nt.cpnNm}</td>
					
					<td class="cent bgWht pd0"><input type="text" class="cent w96" id="rank" value="${nt.rank}"/></td>
					<td class="cent bgWht pd0"><input type="hidden" class="cent w96" id="cate" value="${nt.categoryCd}"/>
						<select class="processResult" id="processResult_${nt.sNb}">
							<c:forEach var="cmmCd" items="${cmmCdCategoryList}" varStatus="status">
								<option value="${cmmCd.dTailCd}"<c:if test="${nt.categoryCd == cmmCd.dTailCd}"> selected</c:if>>${cmmCd.cdNm}</option>
							</c:forEach>
						</select>
					</td>
					<td class="cent bgWht pd0"><input type="text" class="cent w96" id="" value="${nt.eventStock}"/></td>
					<td class="cent bgWht pd0"><input type="text" class="cent w96" id="" value="${nt.eventPrice}"/></td>
				</tr>
			</tbody>
		</table>
		<table class="t_skinR00">
			<thead>
				<tr>
						<th class="pd0">상장<br/>예정일</th>
						
						<th class="pd0">미전환<br/>주식수</th>
						<th class="pd0">발행주식<br/>총수</th>
						
						<th class="pd0">행사자</th>
						<th class="pd0">비고</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="cent bgWht pd0"><input type="text" class="cent w96" id="" value="${nt.ipoDt}"/></td>
					<td class="cent bgWht pd0"><input type="text" class="cent w96" id="" value="${nt.unchangeStock}"/></td>
					<td class="cent bgWht pd0"><input type="text" class="cent w96" id="" value="${nt.outstandingStock}"/></td>
					<td class="cent bgWht pd0"><input type="text" class="cent w96" id="" value="${nt.eventUser}"/></td>
					<td class="cent bgWht pd0" style="border-radius:0px;"><input type="text" class="cent w96" id="" value="${nt.comment}"/></td>
					<input type="hidden" value="${nt.sNb}"/>
				</tr>
			</tbody>
		</table>
		<p class="cent" style="margin:3px 0px;"><span class="btn s orange" onclick="javascript:modifyNotice(this);"><a>수정</a></span></p>
	</div>
	</c:forEach>
</div>
</body>
</html>