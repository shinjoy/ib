<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script>

$(document).ready(function(){
	if('<c:out value='${duplic}'/>' > 0 ) {
		alert("모임이 중복되었습니다.\n 확인후 재입력해주세요.");
		window.close();
	}else if('<c:out value='${saveCnt}'/>' > 0 ) {
		alert("저장되었습니다.");
		window.close();
	}
	
	if(null != Request("f"  )&&''!=Request("f"  ))$("#flag").val(Request('f'));
	if(null != Request("sNb"  )&&''!=Request("sNb"  ))$("#cstSnb").val(Request('sNb'));
	
	// 추가 버튼 클릭시
	$("#addTblBtn").click(function(){
		// tbl 의 최대번호 구하기
		var newitem = $("#dynamicTbl .dnTbl:eq(-1)").clone();
		newitem.find("textarea").val("");
		newitem.find("input[name=arrSnb]").val("N");
		newitem.find("input[id^=meetSnb]").val("N");
		var splitID = newitem.find("input[id^=meetSnb]").attr('id').split("_");
		var cntNum = parseInt(splitID[1])+1;
		newitem.find("input[id^=meetSnb]").attr('id',splitID[0]+"_"+cntNum);
		newitem.find("input:checkbox").attr('checked',false);
		newitem.find("input:checkbox").css('display','none');
		newitem.find(".link").attr('onclick',"javascipt:popUp('"+cntNum+"','meeTingList');");
		newitem.find(".link").html('모임선택');

		$("#dynamicTbl").append(newitem);
		$("#dynamicTbl").find('.link:last').click();
	});
 });
function chk_box(th){
	var arrDelYn = $(th).parent().parent().find("input[name^=arrDelYn]");
	
	if($(th).attr('checked')=='checked'){
		arrDelYn.val('on');
	}else{ 
		arrDelYn.val('off');
	}
}
</script>
<style>
.link{font-weight:bold;color:blue;}
textarea{width:240px;min-height:50px;margin:0;}
</style>
 <base target="_self">
</head>
<body>
<form name="frmMeet" action="<c:url value='/person/processMeeTing.do' />" method="post">
	<table class="t_skinR00 bd0" style="padding:10px;">
		<input type="hidden" name="cstSnb" id="cstSnb"/>
		<colgroup><col width="180"/><col width="250"/><col width="50"/></colgroup>
		<thead>
			<tr>
				<th>모임명</th>
				<th>모임 내 역할/설명</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody id="dynamicTbl">
			<c:forEach var="meet" items="${meetList}" varStatus="ms">
			<tr class="dnTbl">
				<td class="link" onclick="javascript:popUp('${ms.count}','meeTingList');">${meet.meetNm}</td>
				<input type="hidden" name="arrSnb" value="${meet.sNb}"/>
				<input type="hidden" name="arrDelYn" value="off"/>
				<input type="hidden" id="meetSnb_${ms.count}" name="arrMeetSnb" value="${meet.meetSnb}"/>
				<td><textarea name="arrComment">${meet.note}</textarea></td>
				<td class="cent"><input type="checkbox" onclick="javascript:chk_box(this);"/></td>
			</tr>
			</c:forEach>
			<c:if test="${empty meetList}">
			<tr class="dnTbl">
				<td class="link" onclick="javascript:popUp('1','meeTingList');">모임선택</td>
				<input type="hidden" name="arrSnb" value="N"/>
				<input type="hidden" name="arrDelYn" value="off"/>
				<input type="hidden" id="meetSnb_1" name="arrMeetSnb" value="N"/>
				<td><textarea name="arrComment">모임 내 역할/설명</textarea></td>
				<td class="cent"><input type="checkbox" onclick="javascript:chk_box(this);"/></td>
			</tr>
			</c:if>
		</tbody>
	</table>
	<div style="padding: 0 10px;">
		<span class="btn s orange" id="addTblBtn"><a>추가</a></span>
		<span class="btn s green" onclick="javascript:frmMeet.submit();"><a>저장</a></span>
	</div>
</form>
</body>