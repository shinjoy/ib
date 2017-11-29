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
<script type="text/JavaScript" src="<c:url value='/js/base.js'/>" ></script>
<script>
$(document).ready(function(){
	
	//if(null != Request("f"  )&&''!=Request("f"  ))$("#flag").val(Request('f'));
	//if(null != Request("sNb"  )&&''!=Request("sNb"  ))$("#cstSnb").val(Request('sNb'));
	
 });
function Request(valuename)    //javascript로 구현한 Request
{
    var rtnval;
    var nowAddress = location.href;
    var parameters = new Array();
    parameters = (nowAddress.slice(nowAddress.indexOf("?")+1,nowAddress.length)).split("&");

    for(var i = 0 ; i < parameters.length ; i++){
        if(parameters[i].indexOf(valuename) != -1){
            rtnval = parameters[i].split("=")[1];
            if(rtnval == undefined || rtnval == null){
                rtnval = "";
            }
            return rtnval;
        }
    }
}
End = function(snb,nm){
	var rVal = new Object();
	
	rVal.f = Request("f");
	rVal.n = Request("num");
	rVal.snb = snb;
	rVal.nm = nm;
	//rVal.cur = arg;
	
	if (window.opener) window.opener.returnPopUp(rVal);
	window.close();
};
function saveMeet(th){
	var obj = $(th).parent().parent()
	,nm = obj.find('input').val()
	,note = obj.find('textarea').val();
	if(nm==''){
		alert('모임명을 입력하지 않으셨습니다.');
		obj.find('input').focus();
		return;
	}
	if(note==''){
		alert('모임설명을 입력하지 않으셨습니다.');
		obj.find('textarea').focus();
		return;
	}
	var data = {
		meetNm:nm
		,note:note
	},fn=function(){
		location.reload(true);
	};
	ajaxModule(data,"<c:url value='/person/insertMeeting.do' />",fn);
	
	
}
</script>
<style>
.link{cursor:hand;}
.title_area{width:400px;}
.title_area ul {min-width:380px;}
.m_note{width:380px;}
.c_note,.c_note > textarea{width:380px;min-height:120px;}
.bsnsR_btn{padding-bottom:5px;}
</style>
	<base target="_self">
</head>
<body>
<form name="frmMeet" action="<c:url value='/person/processMeeTing.do' />" method="post">
	<table class="t_skinR00 bd0" style="padding:10px;">
		<input type="hidden" name="cstSnb" id="cstSnb"/>
		<colgroup>
			<col width="180"/><col width="300"/>
		</colgroup>
		<thead>
			<tr>
				<th class="bgPuple">모임명</th>
				<th class="bgPuple">모임설명</th>
			</tr>
		</thead>
		<tbody id="dynamicTbl">
			<c:forEach var="meet" items="${meetList}" varStatus="ms">
			<tr class="dnTbl link" onclick="End('${meet.sNb}','${meet.meetNm}')">
				<td><b>${meet.meetNm}</b></td>
				<input type="hidden" name="snb" value="${meet.sNb}"/>
				<td>${meet.note}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="padding-left:10px;"><span class="btn s green" onclick="javascript:view('meetPr',this);"><a>추가</a></span></div>
</form>
<%-- 노트수정 --%>
	<div class="popUpMenu title_area" id="meetPr">
		<p class="closePopUpMenu">ⅹ닫기</p>
		<ul style="padding-bottom:0;">
			<li class="c_title"><input class="m_note" type="text" id="meetTitle" placeholder="모임명을 입력하세요."/></li>
			<li class="c_note"><textarea id="meetArea" placeholder="모임설명을 입력하세요."></textarea></li>
		</ul>
		<p class="bsnsR_btn">
			<span class="btn s green" onclick="saveMeet(this)"><a>저장</a></span>
		</p>
	</div>
<%-- 	
<c:forEach var="meet" items="${meetList}" varStatus="mtS">
	<div class="popUpMenu title_area" id="meetPr${status.count}">
		<input type="hidden" id="meetSnb${status.count}" value="${meet.sNb}">
		<p class="closePopUpMenu">ⅹ닫기</p>
		<ul>
			<li class="c_title"><input class="m_note" type="text" id="meetTitle${mtS.count}" value="${meet.meetNm}"/></li>
			<li class="c_note"><textarea id="meetArea${mtS.count}">${meet.note}</textarea></li>
		</ul>
		<p class="bsnsR_btn">
			<span class="btn s green" onclick="saveMeet('meet',${mtS.count})"><a>저장</a></span>&nbsp;&nbsp;&nbsp;
		</p>
	</div>
</c:forEach>
 --%>
<%-- 노트수정 --%>
</body>