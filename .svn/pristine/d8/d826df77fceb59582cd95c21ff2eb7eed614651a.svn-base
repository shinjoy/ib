<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/management.css'/>" rel="stylesheet" type="text/css"/>
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/staffNetwork.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/popUp.js'/>" ></script>
<script type="text/JavaScript">
$(document).ready(function(){
	resize_iframe();
	$('.tabUnderBar').css('width','calc(100% - '+ parseInt(10 + 68*($('.1st').length)) +'px)');
});

window.onresize=resize_iframe;

function resize_iframe(){
	var height = document.documentElement.clientHeight || window.innerHeight || document.body.clientHeight;
	var stockCstFrame = document.getElementById("netInfoFrame").offsetTop;
	document.getElementById("staffName").style.height=parseInt(height-stockCstFrame-106)+"px";
	document.getElementById("cmmCD").style.height=parseInt(height-stockCstFrame-106)+"px";
	document.getElementById("netInfoL").style.height=parseInt(height-stockCstFrame-106)+"px";
	document.getElementById("netInfoFrame").style.height=parseInt(height-stockCstFrame-106)+"px";
}

function insertStaffNet(th){
	var obj = $(th).parent().parent();
	var netCode = obj.find('input:radio[name=rdoS]:checked').val();
	var cst = obj.find('input:eq(0)').val();
	if(cst==null || cst=='0'){
		alert("인물을 선택하지 않았습니다.\n선택후 다시등록해 주세요.");
		return;
	}
	if(netCode==null || netCode==''){
		alert("구분을 선택하지 않았습니다.\n선택후 다시등록해 주세요.");
		return;
	}
	var data = {
			cstSnb: cst
			,netCd: netCode
			,comment: obj.find('textarea').val()
			,rgId: $("#rgstId").val()
	};	
	var url = "<c:url value='/network/insertStaffNetwork.do' />";
	var fn = function(){
		document.switc.action="selectStaffNetwork.do";
		document.switc.submit();
	};
	ajaxModule(data,url,fn);
}
</script>
</head>
<body>

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
	
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">	
<input type="hidden" id="slctID">	
<form id="modifyRec" name="modifyRec" action="<c:url value='/network/selectStaffNetwork.do' />" method="post"><input type="hidden" name="sorting" id="sorting" value="${TAB}"></form>
<form id="switch" name="switc" method="post"></form>
	<header>
	</header>
	<div class="popUpMenu" style="width:460px;" id="tbl00">
		<p class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</p>
		<table class="t_skinR00" style="width:100%">
			<thead>
			<tr>
				<th style="width:40px;border-radius:0px;">인물</th>
				<input type="hidden" id="AP_cstId_0" value="0"/>
				<td style="border-radius:0px;"><span class="btn s glass" style="margin:0px 0px 0px 5px;" onclick="popUp('_0','p')" id="AP_cstNm_0${cnt}">선택</span></td>
			</tr>
			<tr>
				<th>구분</th>
				<td><span style="margin:0px 0px 0px 5px;display:inline-block;line-height: 150%;"><c:forEach var="cm" items="${cmmCdNet}" varStatus="cmS">
						<label><input type="radio" name="rdoS" value="${cm.dTailCd}" align="absmiddle"/>
						${cm.cdNm}</label><c:if test="${cmS.count==5}"><br/></c:if>
				</c:forEach></span></td>
			</tr>
			<tr>
				<th>메모</th>
				<td><textarea style="width:95%;margin:0px 0px 0px 5px;border:1px solid lightgray;font-size:11px;"></textarea></td>
			</tr>
			</thead>
		</table>
		<p class="cent" style="margin:3px 0px;"><span class="btn s green" onclick="javascript:insertStaffNet(this);"><a>저장</a></span></p>
	</div>
	<section>
		<article>
		<div class="clear" style="height:4px;"></div>
		<div class="clear" style="width:10px;float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
		<div class="1st subTab<c:if test="${TAB eq '00001' or empty TAB}">on</c:if>" onclick="sortTable('00001')">직원인맥</div>
		<div class="1st subTab<c:if test="${TAB eq '00002'}">on</c:if>" onclick="sortTable('00002')">담당자</div>
		<div class="tabUnderBar" style="float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
		<div class="clear" style="height:4px;"></div>
			
		<span class="btn glass" onclick="view('tbl00',this,event)"><b>개인인맥 입력</b></span>
		<div class="clear" style="height:4px;"></div>
			<table class="t_skin04">
				<thead>
					<tr>
						<th class="cent bgYlw" style="width:90px;"><b>시너지직원</b></th>
						<th class="cent bgYlw" style="width:130px;"><b>구분</b></th>
						<th class="cent bgYlw" style="width:400px;"><b>개인인맥 정보</b></th>
						<th class="cent bgYlw" style="" colspan="2"><b>세부정보</b></th>
					</tr>
				</thead>
				<tbody>
					<tr style="vertical-align:top;">
						<td>
							<div id="staffName" style="height:400px;overflow-y:scroll;overflow-x:hidden;border:2px solid gray;">
								<table class="t_skin04_cstNcpn">
									<tr class="link LK1st" onclick="selectStaff4NetInfo('',this);resize_iframe();"><td style="padding:5px 7px;width:80px;">전체</td></tr>
									<c:forEach var="staff" items="${userList}">
									<tr class="link LK1st" onclick="selectStaff4NetInfo('${staff.usrId}',this);resize_iframe();"><td style="padding:5px 7px;width:80px;">
										${staff.usrNm }
									</td></tr></c:forEach>
								</table>
							</div>
						</td>
						<td>
							<div id="cmmCD" style="height:400px;overflow-y:scroll;overflow-x:hidden;border:2px solid gray;">
								<table class="t_skin04_cstNcpn"><c:forEach var="cm" items="${cmmCdNet}">
										<tr><td style="padding:5px 7px;width:70px;">
											${cm.cdNm }
										</td></tr></c:forEach>
								</table>
							</div>
						</td>
						<td>
							<div id="netInfoL" style="height:400px;overflow-y:scroll;overflow-x:hidden;border:2px solid gray;"></div>
						</td>
						<td>
							<iframe style="width:100%;height:500px;" id="netInfoFrame" name="netInfoFrame" <%-- src="<c:url value='/person/index.do'/>" --%> marginwidth="0" marginheight="0" frameborder="no" scrolling-x="no"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</article>
	</section>

</body>
</html>