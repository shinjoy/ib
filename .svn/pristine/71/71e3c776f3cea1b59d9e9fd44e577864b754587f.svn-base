<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/base.js'/>" ></script>
<script>

var ajaxOffer = function(e, snb, cstid, sort){
	var DATA = {
				 sNb: snb
				,cstId: cstid
				,tmpNum1:'off'
				,sort_t: sort
				//,choice_month:''
		};
	$.ajax({
		type:"POST",        //POST GET
		url:"../stats/statsPrivateOffer.do",     //PAGEURL
		data : DATA,
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			$("#offerDiv").html(arg);
			view("offerPr",'',e);
		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});
};

</script>
</head>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<body>
<div id="offerDiv"><div id="offerPr" style="display: none;"></div></div>
	<header>
	</header>
	<section>
		<article>
			<form name="searchCst" action="<c:url value='/network/main.do' />" method="post">
			<div style="padding: 10px 20px 10px 40px;width: 300px;border: darkgray solid 1px;border-radius: 5px; background-color: #FAEBD7;"><font color="blue"><b>네트워크검색</b></font>&nbsp;&nbsp; 
				<%-- <select name="sort_t" style="height:23px;">
					<option value="0" <c:if test="${sortTitle==0}">selected</c:if>>이름</option>
					<option value="1" <c:if test="${sortTitle==1}">selected</c:if>>회사</option>
				</select> --%>
				<input class="nameSearch textSearch" type="search" id="nameSearch" name="search" placeholder="텍스트" autofocus="autofocus" value="${search}">
				<input class="btnSearch" type="submit" value="검색">
			</div>
			</form>
			<table>
		<c:forEach var="net" items="${netList}" varStatus="NS">
			<c:if test="${net.name != oldNm1}">
				<tr>
					<td><b>${net.name}</b></td>
					<td>─<small>[${net.tmpNum1}]</small></td>
					<td>─<span class="" title="${net.text}<c:if test="${empty net.text}">내용없음</c:if>">
						<c:if test="${empty net.text}">		<img <c:if test="${net.tmpNum1 == '정보정리'}">class="link" onclick="ajaxOffer(event,'${net.sNb}')" src="<c:url value='/images/network/comment_pop.png' />"</c:if> <c:if test="${net.tmpNum1 != '정보정리'}">src="<c:url value='/images/network/comment.png' />"</c:if> style="vertical-align: bottom;width:18px;height:16px" border="0"></c:if>
						<c:if test="${not empty net.text}">	<img <c:if test="${net.tmpNum1 == '정보정리'}">class="link" onclick="ajaxOffer(event,'${net.sNb}')" src="<c:url value='/images/network/comment_pop1.png' />"</c:if> <c:if test="${net.tmpNum1 != '정보정리'}">src="<c:url value='/images/network/comment1.png' />"</c:if> style="vertical-align: bottom;width:18px;height:16px" border="0"></c:if>
					</span></td>
					<td class="link" onclick="popUp('','rcmdCst','','${net.snb1st}');">${net.cstNm1st}</td>
					<td><c:if test="${not empty net.cstNm2nd}">─<span class="" title="${net.text0}<c:if test="${empty net.text0}">내용없음</c:if>">
						<c:if test="${empty net.text0}">		<img src="<c:url value='/images/network/comment.png' />" style="vertical-align: bottom;width:18px;height:16px" border="0"></c:if>
						<c:if test="${not empty net.text0}">	<img src="<c:url value='/images/network/comment1.png' />" style="vertical-align: bottom;width:18px;height:16px" border="0"></c:if>
					</span></c:if></td>
					<td <c:if test="${not empty net.cstNm2nd and net.tmpNum2 != 'nwC'}">class="link" onclick="popUp('','rcmdCst','','${net.snb2nd}');"</c:if> <c:if test="${not empty net.cstNm2nd and net.tmpNum2 == 'nwC'}">class="link" onclick="popUp('','rcmdCpn','','${net.snb2nd}');"</c:if>>${net.cstNm2nd}</td>
				</tr>
			</c:if>
			<c:if test="${net.name == oldNm1 and net.cstNm1st != oldNm2}">
				<tr>
					<td></td>
					<td>└<small>[${net.tmpNum1}]</small></td>
					<td>─<span class="" title="${net.text}<c:if test="${empty net.text}">내용없음</c:if>">
						<c:if test="${empty net.text}">		<img <c:if test="${net.tmpNum1 == '정보정리'}">class="link" onclick="ajaxOffer(event,'${net.sNb}')" src="<c:url value='/images/network/comment_pop.png' />"</c:if> <c:if test="${net.tmpNum1 != '정보정리'}">src="<c:url value='/images/network/comment.png' />"</c:if> style="vertical-align: bottom;width:18px;height:16px" border="0"></c:if>
						<c:if test="${not empty net.text}">	<img <c:if test="${net.tmpNum1 == '정보정리'}">class="link" onclick="ajaxOffer(event,'${net.sNb}')" src="<c:url value='/images/network/comment_pop1.png' />"</c:if> <c:if test="${net.tmpNum1 != '정보정리'}">src="<c:url value='/images/network/comment1.png' />"</c:if> style="vertical-align: bottom;width:18px;height:16px" border="0"></c:if>
					</span></td>
					<td class="link" onclick="popUp('','rcmdCst','','${net.snb1st}');">${net.cstNm1st}</td>
					<td><c:if test="${not empty net.cstNm2nd}">─<span class="" title="${net.text0}<c:if test="${empty net.text0}">내용없음</c:if>">
						<c:if test="${empty net.text0}"><img src="<c:url value='/images/network/comment.png' />" style="vertical-align: bottom;width:18px;height:16px" border="0"></c:if>
						<c:if test="${not empty net.text0}"><img src="<c:url value='/images/network/comment1.png' />" style="vertical-align: bottom;width:18px;height:16px" border="0"></c:if>
					</span></c:if></td>
					<td <c:if test="${not empty net.cstNm2nd and net.tmpNum2 != 'nwC'}">class="link" onclick="popUp('','rcmdCst','','${net.snb2nd}');"</c:if> <c:if test="${not empty net.cstNm2nd and net.tmpNum2 == 'nwC'}">class="link" onclick="popUp('','rcmdCpn','','${net.snb2nd}');"</c:if>>${net.cstNm2nd}</td>
				</tr>
			</c:if>
			<c:if test="${net.name == oldNm1 and net.cstNm1st == oldNm2 and net.cstNm2nd != oldNm3}">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>└<span class="" title="${net.text0}<c:if test="${empty net.text0}">내용없음</c:if>">
						<c:if test="${empty net.text0}"><img src="<c:url value='/images/network/comment.png' />" style="vertical-align: bottom;width:18px;height:16px" border="0"></c:if>
						<c:if test="${not empty net.text0}"><img src="<c:url value='/images/network/comment1.png' />" style="vertical-align: bottom;width:18px;height:16px" border="0"></c:if>
					</span></td>
					<td <c:if test="${not empty net.cstNm2nd and net.tmpNum2 != 'nwC'}">class="link" onclick="popUp('','rcmdCst','','${net.snb2nd}');"</c:if> <c:if test="${not empty net.cstNm2nd and net.tmpNum2 == 'nwC'}">class="link" onclick="popUp('','rcmdCpn','','${net.snb2nd}');"</c:if>>${net.cstNm2nd}</td>
				</tr>
			</c:if>
			
			<c:set var="oldNm1" value="${net.name}"/>
			<c:set var="oldNm2" value="${net.cstNm1st}"/>
			<c:set var="oldNm3" value="${net.cstNm2nd}"/>
		</c:forEach>
			</table>	
		</article>
	</section>
</body>
</html>