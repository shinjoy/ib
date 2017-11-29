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
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script>
$(document).ready(function(){
	if('<c:out value='${saveCnt}'/>' > 0 ) {
		alert("저장되었습니다.");
		window.close();
	}
	
	$(document).on("change","#rgSnb", function(){
		$("#rgNm").val($("#rgSnb option:selected").text());
	});
	if(Request('f')!=null)$("#flag").val(Request('f'));
	if(Request('dt')!=null)$("#tmDt").val(Request('dt'));
	if(Request('sNb')!=null&&Request('sNb')!='undefined'){
		$("#ssnb").val(Request('sNb'));
		$("#refresh").submit();
	}
});

function ajaxModule(DATA,Url,Fn){
	$.ajax({
		type:"POST",        //POST GET
		url:Url,     //PAGEURL
		data : DATA,
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			Fn(arg);
		},
		error: function whenError(x,e){    //ERROR FUNCTION
			ajaxErrorAlert(x,e);
		}
	});
}
function saveIntroducer(){
	if($("#staffSnb").val()==0 || $("#staffSnb").val().is_null()) {
		alert("시너지 직원을 선택해주세요.");
		return;
	}
	if($("#AP_cstId").val().is_null()) {
		alert("외부인물을 선택해주세요.");
		return;
	}
	if($("#rgSnb").val().is_null()) {
		alert("소개자를 선택해주세요.");
		return;
	}
	$("#introducer").submit();
}
function deleteIntroducer(){
	var data = {sNb:$("#snb").val()};
	var url = "../work/deleteIntroducer.do";
	var fn = function(){
		alert("삭제되었습니다.");
		var rVal = new Object();
		rVal.f = <c:if test="${empty MDf}">Request('f')</c:if><c:if test="${not empty MDf}">'${MDf}'</c:if>;
		rVal.nm = 'del';
		
		if (window.opener) window.opener.returnPopUp(rVal);
		window.close();
	};
	ajaxModule(data,url,fn);
}
function switchInOut(InO){
	$("#SLCTin").css('display','none');
	$("#SLCTout").css('display','none');
	$("#SLCT"+InO).css('display','');
}
function slctIntro(th){
	var obj = $(th);
	$("#rgSnb").val(obj.val());
}
</script>
<style>
.pBox{
    display: inline-block;
    /* border: darkkhaki 1px solid; */
    border-radius: 5px;      
    box-shadow: 1px 1px 3px #888888;      
    /* margin: 0 auto; */
    padding: 5px;
   }
</style>
<base target="_self">
</head>
<body>
<div id="wrap">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

	<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">	
<form id="refresh" name="refresh" action="<c:url value='/work/popUpIntroducer.do' />" method="post"><input type="hidden" id="flag" name="modalFlag" value="${MDf}"><input type="hidden" name="sNb" id="ssnb"/></form>
<form id="introducer" name="introducer" action="<c:url value='/work/saveIntroducer.do' />" method="post">
	<br/><div class="_popUpWidth">
		<%-- <table class="t_skin04"><c:forEach var="itd" items="${introducer}" varStatus="Sitd">
			<thead>
				<tr>
					<th class="bgYlw" style="border-right:1px solid #75C5DE">소개해준 사람</th>
					<th class="bgYlw" style="border-right:1px solid #75C5DE">소개 당사자</th>
					<th class="bgYlw">소개사유</th>
				</tr>
			</thead>
				<tr>
					<input type="hidden" name="sNb" id="snb" value="${itd.sNb}"/>
					<input type="hidden" name="cstId" id="AP_cstId" value="${itd.cstId}"/>
					<td class="cent" rowspan="2" style="border-right:1px solid #75C5DE">
						<select name="rgSnb" id="rgSnb">
							<option value="0">-선택-</option><c:forEach var="usr" items="${userList}" varStatus="US">
							<option value="${usr.cstId}" <c:if test="${itd.rgSnb == usr.cstId}">selected</c:if>>${usr.usrNm}</option></c:forEach>
						</select>
					</td>
					<td class="cent" style="border-right:1px solid #75C5DE">
						<select name="staffSnb">
							<option value="0">-선택-</option><c:forEach var="usr" items="${userList}" varStatus="US">
							<option value="${usr.cstId}" <c:if test="${itd.staffSnb == usr.cstId}">selected</c:if>>${usr.usrNm}</option></c:forEach>
						</select>
					</td>
					<td class="cent" rowspan="2" style="width:220px;">
						<textarea name="comment" style="min-height:40px;width:200px;margin:0;">${itd.comment}</textarea>
					</td>
				</tr>
				<tr>
					<td class="cent" style="border-right:1px solid #75C5DE">
						<span class="btn s blue" onclick="popUp('','p');"><a id="AP_cstNm">${itd.text}</a></span>
					</td>
				</tr></c:forEach>
			<c:if test="${empty introducer}">
			<thead>
				<tr>
					<th class="bgYlw" style="border-right:1px solid #75C5DE">소개해준 사람</th>
					<th class="bgYlw" style="border-right:1px solid #75C5DE">소개 당사자</th>
					<th class="bgYlw">소개사유</th>
				</tr>
			</thead>
				<tr>
					<input type="hidden" name="tmDt" id="tmDt" value=""/>
					<input type="hidden" name="rgNm" id="rgNm" value=""/>
					<input type="hidden" name="cstId" id="AP_cstId" value=""/>
					<td class="cent" rowspan="2" style="border-right:1px solid #75C5DE">
						<select name="rgSnb" id="rgSnb">
							<option value="0">-선택-</option><c:forEach var="usr" items="${userList}" varStatus="US">
							<option value="${usr.cstId}">${usr.usrNm}</option></c:forEach>
						</select>
					</td>
					<td class="cent" style="border-right:1px solid #75C5DE">
						<select name="staffSnb">
							<option value="0">-선택-</option><c:forEach var="usr" items="${userList}" varStatus="US">
							<option value="${usr.cstId}">${usr.usrNm}</option></c:forEach>
						</select>
					</td>
					<td class="cent" rowspan="2" style="width:220px;">
						<textarea name="comment" style="min-height:40px;width:200px;margin:0;">${itd.comment}</textarea>
					</td>
				</tr>
				<tr>
					<td class="cent" style="border-right:1px solid #75C5DE">
						<span class="btn s blue" onclick="popUp('','p');"><a id="AP_cstNm">인물선택</a></span>
					</td>
				</tr></c:if>
		</table> 
		<div>
		<c:if test="${empty introducer}"><span class="btn s green" onclick="saveIntroducer()"><a>저장</a></span></c:if>
		<c:if test="${not empty introducer and (userLoginInfo.permission > '00019'  or  userLoginInfo.name==workVO.name)}"> 
			<span class="btn s green" onclick="saveIntroducer()"><a>수정</a></span>
			<span class="btn s red" onclick="deleteIntroducer()"><a>삭제</a></span>
		</c:if>
		</div>
		--%>
		
		
		
		
		<table class=""><c:forEach var="itd" items="${introducer}" varStatus="Sitd"><c:set var="rgid" value="${itd.rgId}"/>
				<tr>
					<input type="hidden" name="sNb" id="snb" value="${itd.sNb}"/>
					<input type="hidden" name="cstId" id="AP_cstId" value="${itd.cstId}"/>
					<td style="text-align:right"><span class="pBox bgGrn cent">
						<b>시너지 직원</b><br/>
						<select name="staffSnb" id="staffSnb">
							<option value="0">-선택-</option><c:forEach var="usr" items="${userList}" varStatus="US">
							<option value="${usr.cstId}" <c:if test="${itd.staffSnb == usr.cstId}">selected</c:if>>${usr.usrNm}</option></c:forEach>
						</select>
					</span></td>
					<td rowspan="3" style="color:blue;width:40px;">
					<─┐<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│<font color="red"><─</font><br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│<br/>
					<─┘
					</td>
					<td rowspan="3"><span class="pBox bgRed">
						<span style="display:block;float:left;padding:8px 10px 0 0;"><b>소개</b></span>
						<span style="display:block;float:left"><small>
							<input type="radio" class="mg0" name="inNout" id="inRgSnb" onclick="switchInOut('in');" <c:if test="${itd.tmpNum1=='1'}">checked</c:if>><label for="inRgSnb" style="vertical-align:top;">내부</label><br/>
							<input type="radio" class="mg0" name="inNout" id="outRgSnb" onclick="switchInOut('out');" <c:if test="${itd.tmpNum1=='0'}">checked</c:if>><label for="outRgSnb" style="vertical-align:top;">외부</label>
						</small></span>
						<span style="display:block;float:left;padding: 5px 0 0 10px;">
							<input type="hidden" name="rgSnb" id="rgSnb" value="${itd.rgSnb}"/> 
							<select id="SLCTin" onchange="slctIntro(this);" <c:if test="${itd.tmpNum1!='1'}">style="display:none;"</c:if>>
								<option value="0">-선택-</option><c:forEach var="usr" items="${userList}" varStatus="US">
								<option value="${usr.cstId}" <c:if test="${itd.rgSnb == usr.cstId}">selected</c:if>>${usr.usrNm}</option></c:forEach>
							</select>
							<span id="SLCTout" class="btn s blue" onclick="popUp('','ppp');" <c:if test="${itd.tmpNum1!='0'}">style="display:none;"</c:if>><a id="intro_cstNm">${itd.text0}</a></span>
						</span>
					</span></td>
				</tr>
				<tr><td style="height:18px"></td></tr>
				<tr>
					<td style="text-align:right"><span class="pBox bgSky cent">
						<b>외부인물</b><br/> 
						<span class="btn s blue" onclick="popUp('','p');"><a id="AP_cstNm">${itd.text}</a></span>
					</span></td>
				</tr>
				<tr>
					<td class="cent" colspan="3" style="padding-top:20px;width:420px;">
						<textarea class="pBox" name="comment" style="min-height:70px;width:400px;margin:0;">${itd.comment}</textarea>
					</td>
				</tr>
				</c:forEach>
			<c:if test="${empty introducer}">
				<tr>
					<input type="hidden" name="tmDt" id="tmDt" value=""/>
					<input type="hidden" name="rgNm" id="rgNm" value=""/>
					<input type="hidden" name="cstId" id="AP_cstId" value=""/>
					<td style="text-align:right"><span class="pBox bgGrn cent">
						<b>시너지 직원</b><br/>
						<select name="staffSnb" id="staffSnb">
							<option value="0">-선택-</option><c:forEach var="usr" items="${userList}" varStatus="US">
							<option value="${usr.cstId}">${usr.usrNm}</option></c:forEach>
						</select>
					</span></td>
					<td rowspan="3" style="color:blue;width:40px;">
					<─┐<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│<font color="red"><─</font><br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;│<br/>
					<─┘
					</td>
					<td rowspan="3" style="width:230px;"><span class="pBox bgRed">
						<span style="display:block;float:left;padding:8px 10px 0 0;"><b>소개</b></span>
						<span style="display:block;float:left"><small>
							<input type="radio" class="mg0" name="inNout" id="inRgSnb" onclick="switchInOut('in');" checked><label for="inRgSnb" style="vertical-align:top;">내부</label><br/>
							<input type="radio" class="mg0" name="inNout" id="outRgSnb" onclick="switchInOut('out');"><label for="outRgSnb" style="vertical-align:top;">외부</label>
						</small></span>
						<span style="display:block;float:left;padding: 5px 0 0 10px;">
							<input type="hidden" name="rgSnb" id="rgSnb"/> 
							<select id="SLCTin" onchange="slctIntro(this);">
								<option value="0">-선택-</option><c:forEach var="usr" items="${userList}" varStatus="US">
								<option value="${usr.cstId}">${usr.usrNm}</option></c:forEach>
							</select>
							<span id="SLCTout" class="btn s blue" onclick="popUp('','ppp');" style="display:none;"><a id="intro_cstNm">인물선택</a></span>
						</span>
					</span></td>
				</tr>
				<tr><td style="height:18px"></td></tr>
				<tr>
					<td style="text-align:right"><span class="pBox bgSky cent">
						<b>외부인물</b><br/> 
						<span class="btn s blue" onclick="popUp('','p');"><a id="AP_cstNm">인물선택</a></span>
					</span></td>
				</tr>
				<tr>
					<td class="cent" colspan="3" style="padding-top:20px;width:420px;">
						<textarea class="pBox" name="comment" style="min-height:70px;width:400px;margin:0;">${itd.comment}</textarea>
					</td>
				</tr></c:if>
		</table>
		<div>${itd.rgId }
		<c:if test="${empty introducer}"><span class="btn s green" onclick="saveIntroducer()"><a>저장</a></span></c:if>
		<c:if test="${not empty introducer and (userLoginInfo.permission > '00019'  or  userLoginInfo.id==rgid)}"> 
			<span class="btn s green" onclick="saveIntroducer()"><a>수정</a></span>
			<span class="btn s red" onclick="deleteIntroducer()"><a>삭제</a></span>
		</c:if>
		</div>
	</div>
</form>
</div>
</body>
</html>