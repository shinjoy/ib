<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
%>
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
<script type="text/JavaScript" src="<c:url value='/js/jquery.event.drag-1.5.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.event.drop-1.2.min.js'/>" ></script>
<style type="text/css">
.but66 {
	background: url(../images/arrow/up.gif) no-repeat;
	height:13px;width:15px;
	padding-left:1px;
	cursor:pointer;
	border: none;
}
.year {padding-left: 5px;}
</style>
<script>
$(document).ready(function(){
	if('<c:out value='${saveCnt}'/>' > 0 ) {
		location.href ="<c:url value='index.do' />";
		alert("저장되었습니다.");
	}
	
	var clickObj = null;	//$(this.parentNode).add(''); 
	$(".dnTbl .movBtn").bind('dragstart', function(event){ 
		clickObj = $(this).parent().parent().parent();
		$("#moveDiv").css('display',''); 
		return clickObj.clone().appendTo("#moveTable"); 
	}).bind('drag', function(event){ 
		$("#moveDiv").css({ top:event.offsetY }); 
		//$("#moveTable tr").css({'background-color':'#7CB57C','cursor':'move'});  
		//$("#moveTable tr td").addClass('active');
	}).bind('dragend', function(event){ 
		$("#moveDiv").fadeOut(); 
		$("#moveTable").html(''); 
	});
	
	$(".dnTbl").bind('dropstart', function(event){ 
		$(this).addClass('active');
		$(this).removeClass('trEven');
		
	}).bind('drop', function(event){ 
		$(this).append('<span>&nbsp;&bull;<span>');
		//console.log($(this).attr('id')+"::"+clickObj.attr('id')); return;
		var snb = clickObj.find('[name^=ARsNb]').val();
		var actFlag = $(this).attr('class').split(' ');
		var date = $(this).find('[id^=tmDt]').val();
		date = actFlag[2] == 'active'?date:null;
		
		var DATA = {sNb: snb
				,name: $("#name").val()
				,tmDt: date/*날짜*/
				};
		var url = "../bsnsPlan/modifyBusinessPlanTmdt.do";
		var fn = function(){
			document.modifyRec.action = "index.do";
			document.modifyRec.submit();
		};
		if("<c:out value='${userLoginInfo.id}'/>" == $("#regId").val() | "<c:out value='${userLoginInfo.permission}' />" > "00019"){
			ajaxModule(DATA,url,fn);
		}
		
	}).bind('dropend', function(event){ 
		$(this).removeClass('active');
		//$(this).addClass('trEven');
	});
	// 추가 버튼 클릭시
	$("#addTblBtn").click(function(){
		// tbl 의 최대번호 구하기
		var lastItemNo = $(".dnTbl:last").attr("class").replace("tbl", "");

		var newitem = $("#dynamicTbl .dnTbl:eq(-1)").clone();
		newitem.removeClass();
		// newitem.find("td:eq(0)").val("");
		newitem.find("td input:text").val("");
		var num = parseInt(lastItemNo)+1;
		// newitem.find("[id^=monL]").attr("id","monL"+num);
		// newitem.find("[id^=monH]").attr("id","monH"+num);
		newitem.find("[name^=monLH]").attr("name","monLH"+num);
		newitem.find("[name^=ARrdo]").attr("id","ARrdoID"+num);
		newitem.find("[class^=2ndSelect]").removeClass('dspN');
		newitem.find("[class^=2ndSelect]").addClass('dspN');
		newitem.find("[class^=2ndSelect]:first").removeClass('dspN');
		// newitem.find("[class^=2ndSelect]").css('display','none');
		// newitem.find("[class^=2ndSelect]:first").css('display','block');

		newitem.addClass("tbl"+num);
		newitem.addClass("dnTbl");
		newitem.find("input:button").attr("onclick","downup("+num+",-1)");
		newitem.find("span a").attr("onclick","downup("+num+",1)");

		$("#dynamicTbl").append(newitem);
	});

	//바 클릭시
	$(document).on("click",".barClick",function(){
		var obj = $(this);
		var clickNo = obj.attr("id").replace("bar","");
		var barB = obj.parent().find(".barClick");
		var barTd = obj.parent().find("td:first");
		barB.removeClass("bgOrg");

		if(obj.parent().find("input").val()==clickNo){
			obj.parent().find("input").val(0);
			return;
		}
		for(var i=1;i<=clickNo;i++) {
			barTd.addClass("bgOrg");
			barTd = barTd.next();
		}
		obj.parent().find("input").val(clickNo);
	});
	//업무계획 저장 클릭시
	$(document).on("click","#saveBsnsPlan",function(){
	var frm = document.getElementById('planForm');//sender form id
		frm.action="insertBsnsPlan.do";
		frm.submit();
	});
	//라디오 버튼 클릭시
	$(document).on("click",".rdoLH",function(){
		var obj = $(this);
		var radioName = obj.attr('name');
		radioName = radioName.split('LH');
		$("#ARrdoID"+radioName[1]).val(obj.val());
	});

	//메모 버튼 클릭시
	$(document).on("click",".memoBtn",function(){
		var t_num = $(this).attr('id').split('_');
		divId = 'bsnsPmemo_'+ t_num[1];
		$(".popUpMenu").hide();
		divShow($(this));
	});

	//업무내용 첫번째 셀렉트 박스
	$(document).on("change",".1stSelect",function(){
		var obj = $(this);

		var parentObj = obj.parent().next();//bsns2nd
		var parentObj2 = parentObj.next();//detail
		var parentObj3 = parentObj2.next();//goal
		parentObj.find('select').removeClass('dspN');
		parentObj.find('select').addClass('dspN');
		parentObj2.find('select, input').removeClass('dspN');
		parentObj2.find('select, input').addClass('dspN');
		//parentObj2.find('select, input').css('display', 'none');
		//parentObj2.find('input:eq(0)').val('00000');

		if('00001' == obj.val()) {
			//parentObj.find('select:eq(0)').css('display', 'block');
			parentObj.find('select:eq(0)').removeClass('dspN');
			obj.parent().find('input').val('00001');

			parentObj2.find('select:eq(0)').removeClass('dspN');
			parentObj3.find('input:eq(0)').addClass('dspN');
			parentObj3.find('span').removeClass('dspN');

		} else if('00002' == obj.val()) {
			parentObj.find('select:eq(1)').removeClass('dspN');
			obj.parent().find('input').val('00011');

			parentObj2.find('select:eq(1)').removeClass('dspN');
			parentObj3.find('input:eq(0)').addClass('dspN');
			parentObj3.find('span').removeClass('dspN');

		} else if('00003' == obj.val()) {
			parentObj.find('select:eq(2)').removeClass('dspN');
			obj.parent().find('input').val('00021');

			parentObj2.find('input').val('');
			parentObj2.find('input').removeClass('dspN');
			parentObj3.find('input:eq(0)').removeClass('dspN');
			parentObj3.find('span').addClass('dspN');

		} else if('00004' == obj.val()) {
			parentObj.find('select:eq(3)').removeClass('dspN');
			obj.parent().find('input').val('00031');

			parentObj2.find('input').val('');
			parentObj2.find('input').removeClass('dspN');
			parentObj3.find('input:eq(0)').removeClass('dspN');
			parentObj3.find('span').addClass('dspN');

		} else if('00005' == obj.val()) {
			obj.parent().find('input').val('00041');

			parentObj2.find('input').val('');
			parentObj2.find('input').removeClass('dspN');
			parentObj3.find('input:eq(0)').removeClass('dspN');
			parentObj3.find('span').addClass('dspN');
		}
	});

	//업무내용 두번째 셀렉트 박스
	$(document).on("change",".2ndSelect",function(){
		var obj = $(this);
		var parentObj = obj.parent().prev();
		var parentObj3 = obj.parent().next();
		//parentObj3.find('select').css('display', 'none');
		parentObj3.find('select, input').removeClass('dspN');
		parentObj3.find('select, input').addClass('dspN');

		if('00001' == obj.val()) {
			parentObj3.find('select:eq(0)').removeClass('dspN');
		} else if('00002' == obj.val()) {
			parentObj3.find('select:eq(1)').removeClass('dspN');
		} else if('00011' == obj.val() || '00012' == obj.val()) {
			parentObj3.find('select:eq(1)').removeClass('dspN');
		} else {
			parentObj3.find('input').removeClass('dspN');
		}
		parentObj.find('input').val(obj.val());
	});

	$(document).on("change",".3rdSelect",function(){
		var obj = $(this);
		obj.parent().find('input:eq(0)').val(obj.val());
	});
	$("tr:even").addClass('trEven');
});



</script><style>.active{background:#457845;border:1px solid #558755;cursor:move} .trEven{background:#E0F8F7} .movBtn:hover{cursor:move;background:#456789}</style>
</head>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<body>

<div id="wrap">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

	<header>
		<form name="modifyRec" id="dayForm" method="post">
		<div class="year_wrap">
		
			<c:set var="now" value="<%= new java.util.Date() %>"/>
			<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
			<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
						
			<input type="hidden" id="choice_month" name="choice_month" value="${choice_month }"/>
			<input type="hidden" id="total" name="total"/>
			
			<span class="year">
				<select id='select_year' name='choice_year'>
					<c:forEach var="year" begin="2012" end="${cur_year+2}">
						<option value="${year}"
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
		</div>
		</form>
	</header>
	<section>
		<article style="padding-top:35px;">
			
		<div id="moveDiv" style="position:absolute;"><table id="moveTable" class="t_skinR00 t_skin05width"></table></div>

		<!-- 메모   -->
			<c:forEach var="plan" items="${bsnsPlanList}" varStatus="planStatus">
			<div class="popUpMenu title_area" id="bsnsPmemo_${planStatus.count }">
				<input type="hidden" id="bsnsPsnb${planStatus.count }" value="${plan.sNb}"/>
				
				<p class="closePopUpMenu" title="닫기">ⅹ닫기</p>
				<ul>
					<li class="c_note"><textarea id="memoarea${planStatus.count }">${plan.note}</textarea></li>
				</ul>
				<p class="bsnsR_btn">
					<span class="bsnsPsave btn s green" id="bsnsPlanSaveBtn_${planStatus.count }"><a onclick="bsnsPsave('bsnsPlan','bsnsPlanSaveBtn_${planStatus.count }');">저장</a></span>
				</p>
			</div>
			</c:forEach>
			
			<div class="popUpMenu title_area" id="bsnsPmemo_0">
				<p class="closePopUpMenu" title="닫기">ⅹ닫기</p>
				<ul>
					<li class="c_note"><textarea id="memoarea0" placeholder="메모를 입력하세요."></textarea></li>
				</ul>
			</div>
		<!-- 메모   -->
		
		<form name="insertPlan" id="planForm" method="post">
			<input type="hidden" id="choice_year" name="choice_year" value="${choice_year }"/>
			<input type="hidden" name="obLen" value="${fn:length(bsnsPlanList)}"/>
			<table class="t_skinR00 t_skin05width">
				<colgroup>
					<col width="55">
					<col width="100">
					<col width="100">
					<col width="320">
					<col width="320">
					<col width="20">
					<col width="20">
					<col width="20">
					<col width="20">
					<col width="20">
					<col width="20">
					<col width="20">
					<col width="40">
				</colgroup>
				<thead>
					<tr>
						<th class="bgYlw" colspan="13"><font style="color:navy">${sltNm }</font> <font style="color:crimson">${choice_year}년</font> 업무목표</th>
					</tr>
					<tr>
						<th class="bgYlw" rowspan="3">구분</th>
						<th class="bgYlw" rowspan="3" colspan="2">업무내용</th>
						<th class="bgYlw" rowspan="3">세부내용</th>
						<th class="bgYlw" rowspan="3">목표/목표량</th>
						<th class="bgYlw" colspan="7">월별 목표량</th>
						<th class="bgYlw" rowspan="3">진행<br/>상황</th>
					</tr>
					<tr>
						<c:forEach var="cnt" begin="1" end="6">
							<th class="bgYlw pd0" style="line-height:17px;"><small>${cnt}</small></th>
						</c:forEach>
							<th class="bgYlw pd0" rowspan="2" style="line-height:17px;"><small>합</small></th>
					</tr>
					<tr>
						<c:forEach var="cnt" begin="7" end="12">
							<th class="bgYlw pd0" style="line-height:17px;"><small>${cnt}</small></th>
						</c:forEach>
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
				
			
				<tbody id="dynamicTbl">
					<tr class="tbl0 dnTbl dspN">
						<td class="cent"></td>
						<td class="cent"></td>
						<td class="cent"></td>
						<td class="cent"></td>
						<td class="cent"></td>
						<td class="cent"></td>
						<!-- <td class="bar" colspan="10"><table><tr> -->
						<c:forEach var="cnt" begin="1" end="6">
							<td id="bar${cnt}" class="h5 hand"><input type="text" style="width:70%"/></td>
						</c:forEach>
						<!-- </tr></table></td> -->
						<td></td>
						<td></td>
					</tr>
					
					
					<c:forEach var="plan" items="${bsnsPlanList}" varStatus="planStatus">
						<input type="hidden" id="regId" value="${plan.rgId}"/>
					<tr class="tbl${planStatus.count} dnTbl">
						<input type="hidden" id="tmDt${planStatus.count}" value="${fn:substring(plan.tmDt,0,10)}"/>
						<input type="hidden" name="ARsNb" value="${plan.sNb }"/>
						<input type="hidden" name="ARrdo" id="ARrdoID${Leng+1}" value="${plan.choice_month }"/>
<td class="cent pd0" style="width:51px;">
	<div style="float:left">
	<div class="pd0 bd0 movBtn"><img src="<c:url value='/images/arrow/move.png'/>" title="이동" style="padding-top:6px;height:25px;width:25px;">
	</div>
	<%-- 
		<div class="pd0 bd0" style="line-height:13px;">
			<input type="button" class="but66" onclick="<c:if test="${planStatus.count!=1}">downup(${planStatus.count},-1)</c:if>" title="▲"/>
		</div>
		<div class="pd0 bd0" style="line-height:13px;">
			<span><a onclick="downup(${planStatus.count},1)"><img src="<c:url value='/images/arrow/down.gif'/>" title="▼"></a></span>
		</div>
		 --%>
	</div>
	<div class="pd0 bd0">
		<a onclick="removeTr(${planStatus.count})"><img src="<c:url value='/images/arrow/delete.png'/>" title="삭제"></a>
	</div>
</td>
						<%-- <td style="vertical-align:middle;line-height:14px;" class="cent pd0 <c:if test="${plan.choice_month < 6}">bgGrn</c:if> <c:if test="${plan.choice_month > 5}">bgRed</c:if>">
							<p class="mg0"><input class="rdoLH mg0" type="radio" name="monLH${planStatus.count}" value="1" <c:if test="${plan.choice_month < 7}">checked="checked"</c:if>><small style="vertical-align:top"> 상반기</small></p>
							<p class="mg0"><input class="rdoLH mg0" type="radio" name="monLH${planStatus.count}" value="7" <c:if test="${plan.choice_month > 6}">checked="checked"</c:if>><small style="vertical-align:top"> 하반기</small></p>
						</td> --%>
						<fmt:parseNumber value="${plan.detailDivCd}" var="num"/>
						<td class="cent" style="width:100px;">
							<select class="1stSelect w96">
								<option value="00001" <c:if test="${num < 11}">selected</c:if>>딜소싱</option>
								<option value="00002" <c:if test="${num > 10 and num < 21}">selected</c:if>>자금유치</option>
								<option value="00003" <c:if test="${num > 20 and num < 31}">selected</c:if>>투자/분석/탐방</option>
								<option value="00004" <c:if test="${num > 30 and num < 41}">selected</c:if>>내부업무</option>
								<option value="00005" <c:if test="${num > 40 and num < 51}">selected</c:if>>개인</option>
							</select>
							<input type="hidden" name="ARdetailDivCd" value="${plan.detailDivCd}"/>
						</td>
						<td style="width:100px;">
							<select class="2ndSelect w96" <c:if test="${!(num < 11)}">style="display:none;"</c:if>>
								<c:forEach var="cmmCd" items="${cmmCdList}">
								<c:if test="${cmmCd.cdSort == '00000'}">
									<option value="${cmmCd.dTailCd}" <c:if test="${plan.detailDivCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
								</c:if>
								</c:forEach>
							</select>
							<select class="2ndSelect w96" <c:if test="${!(num > 10 and num < 21)}">style="display:none;"</c:if>>
								<c:forEach var="cmmCd" items="${cmmCdList}">
								<c:if test="${cmmCd.cdSort == '00001'}">
									<option value="${cmmCd.dTailCd}" <c:if test="${plan.detailDivCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
								</c:if>
								</c:forEach>
							</select>
							<select class="2ndSelect w96" <c:if test="${!(num > 20 and num < 31)}">style="display:none;"</c:if>>
								<c:forEach var="cmmCd" items="${cmmCdList}">
								<c:if test="${cmmCd.cdSort == '00002'}">
									<option value="${cmmCd.dTailCd}" <c:if test="${plan.detailDivCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
								</c:if>
								</c:forEach>
							</select>
							<select class="2ndSelect w96" <c:if test="${!(num > 30 and num < 41)}">style="display:none;"</c:if>>
								<c:forEach var="cmmCd" items="${cmmCdList}">
								<c:if test="${cmmCd.cdSort == '00003'}">
									<option value="${cmmCd.dTailCd}" <c:if test="${plan.detailDivCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
								</c:if>
								</c:forEach>
							</select>
						</td>
						
						<td class="cent">
							<!-- 2ndSelect 선택에 따라 3rdSelect가 보여지거나  ARbsnsDtail이 보여진다. -->
							<select class="3rdSelect w96<c:if test="${!(num < 2)}"> dspN</c:if>">
								<c:forEach var="cmmCd" items="${cmmCdList}">
								<c:if test="${cmmCd.cdSort == '00006'}">
									<option value="${cmmCd.dTailCd}" <c:if test="${plan.bsnsList == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
								</c:if>
								</c:forEach>
							</select>
							<select class="3rdSelect w96<c:if test="${!(num < 21 && num > 1)}"> dspN</c:if>">
								<c:forEach var="cmmCd" items="${cmmCdList}">
								<c:if test="${cmmCd.cdSort == '00005'}">
									<option value="${cmmCd.dTailCd}" <c:if test="${plan.bsnsList == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
								</c:if>
								</c:forEach>
							</select>
							<!-- 위 셀렉트값을 넣는 input -->
							<input type="hidden" name="ARbsnsList" value="${plan.bsnsList}"/>
							
							<!-- 2ndSelect 선택에 따라 3rdSelect가 보여지거나  ARbsnsDtail이 보여진다. -->
							<input class="w96<c:if test="${plan.bsnsList+0 > 50}"> dspN</c:if>" type="text" name="ARbsnsDtail" value="${plan.bsnsDtail}"/>
						</td>
						
						<td class="cent" nowrap="nowrap">
							<input class="w96 <c:if test='${(plan.bsnsList+0 > 50)}'>dspN</c:if>" type="text" name="ARgoal" maxlength="150" value="${plan.goal}"/>
							<span <c:if test="${!(plan.bsnsList+0 > 50)}">class="dspN"</c:if>>
								<input class="w48 intNum" type="text" name="ARgoalM" maxlength="150" value="${plan.goalM}" onKeyPress="return numbersonly(event, false)"/><c:if test="${plan.detailDivCd+0 ==11 or plan.detailDivCd+0 ==12}">억</c:if><c:if test="${plan.detailDivCd+0 ==1 or plan.detailDivCd+0 ==2}">딜</c:if>/월
								<input class="w48 intNum" type="text" name="ARgoalHY" maxlength="150" value="${plan.goalHY }" onKeyPress="return numbersonly(event, false)"/><c:if test="${plan.detailDivCd+0 ==11 or plan.detailDivCd+0 ==12}">억</c:if><c:if test="${plan.detailDivCd+0 ==1 or plan.detailDivCd+0 ==2}">딜</c:if>/년
							</span>
<%-- 
							<input style="float:left;" class="<c:if test="${!(plan.bsnsList+0 > 50 and plan.bsnsList+0 < 61)}">w96</c:if> <c:if test="${(plan.bsnsList+0 > 50 and plan.bsnsList+0 < 61)}">w48 intNum</c:if>" type="text" name="ARgoal" maxlength="150" value="${plan.goal}"/>
							<span style="width:75%;<c:if test="${(plan.bsnsList+0 > 50 and plan.bsnsList+0 < 61)}">display:block;</c:if>" <c:if test="${!(plan.bsnsList+0 > 50 and plan.bsnsList+0 < 61)}">class="dspN"</c:if>>/월</span>
 --%>							
						</td>
						
						
						<!-- <td class="bar" colspan="6"><table style="width:100%"><tr> -->
						<input type="hidden" name="ARschedule" value="${plan.schedule }">
							<td id="bar1" class="pd0 h5 hand cent"><input type="text" name="ARmon1" style="width:70%" value="${plan.mon1 }"/></td>
							<td id="bar2" class="pd0 h5 hand cent"><input type="text" name="ARmon2" style="width:70%" value="${plan.mon2 }"/></td>
							<td id="bar3" class="pd0 h5 hand cent"><input type="text" name="ARmon3" style="width:70%" value="${plan.mon3 }"/></td>
							<td id="bar4" class="pd0 h5 hand cent"><input type="text" name="ARmon4" style="width:70%" value="${plan.mon4 }"/></td>
							<td id="bar5" class="pd0 h5 hand cent"><input type="text" name="ARmon5" style="width:70%" value="${plan.mon5 }"/></td>
							<td id="bar6" class="pd0 h5 hand cent"><input type="text" name="ARmon6" style="width:70%" value="${plan.mon6 }"/></td>
						<!-- </tr></table></td> -->
							<c:set var="sumMon" value="${0+plan.mon1+plan.mon2+plan.mon3+plan.mon4+plan.mon5+plan.mon6}"/>
						<td class="pd0 h5 hand cent"><c:if test="${not empty sumMon}">${sumMon }</c:if></td>
						<td class="cent" style="width:40px;"><c:if test="${not empty plan.sNb }"><a class="memoBtn" id="mm_${planStatus.count}"><img src="<c:url value='/images/edit-5-icon.png'/>" title="메모 입력" <c:if test="${fn:length(plan.note)>1}">style="background-color:#F7E7CC"</c:if>></a></c:if></td>
					</tr>
					<c:set var="Leng" value="${planStatus.count}"/>
					</c:forEach>
					<tr class="tbl${Leng+1} dnTbl">
						<input type="hidden" name="ARsNb" />
						<input type="hidden" name="ARrdo" id="ARrdoID${Leng+1}" value="1"/>
<%-- 
<td class="cent" style="width:15px;">
	<div style="float:left">
		<div class="pd0 bd0" style="line-height:13px;">
			<input type="button" class="but66" onclick="downup(${Leng+1},-1)" title="▲"/>
		</div>
		<div class="pd0 bd0" style="line-height:13px;">
			<span><a onclick="downup(,1)"><img src="<c:url value='/images/arrow/down.gif'/>" title="▼"></a></span>
		</div>
	</div>
</td>
 --%>

						<%-- <td style="vertical-align:middle;line-height:14px;" class="cent pd0" colspan="2">
							<p class="mg0"><input class="rdoLH mg0" type="radio" name="monLH${planStatus.count}" value="1" checked="checked"><small style="vertical-align:top"> 상반기</small></p>
							<p class="mg0"><input class="rdoLH mg0" type="radio" name="monLH${planStatus.count}" value="7"><small style="vertical-align:top"> 하반기</small></p>
						</td> --%>
						<td></td>
						<td class="cent">

							<select class="1stSelect w96">
								<option value="00001">딜소싱</option>
								<option value="00002">자금유치</option>
								<option value="00003">투자/분석/탐방</option>
								<option value="00004">내부업무</option>
								<option value="00005">개인</option>
							</select>
							<input type="hidden" name="ARdetailDivCd" value="00001"/>
						</td>
						<td>
							<select class="2ndSelect w96">
								<c:forEach var="cmmCd" items="${cmmCdList}">
								<c:if test="${cmmCd.cdSort == '00000'}">
									<option value="${cmmCd.dTailCd}" <c:if test="${plan.detailDivCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
								</c:if>
								</c:forEach>
							</select>
							<select class="2ndSelect dspN w96">
								<c:forEach var="cmmCd" items="${cmmCdList}">
								<c:if test="${cmmCd.cdSort == '00001'}">
									<option value="${cmmCd.dTailCd}" <c:if test="${plan.detailDivCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
								</c:if>
								</c:forEach>
							</select>
							<select class="2ndSelect dspN w96">
								<c:forEach var="cmmCd" items="${cmmCdList}">
								<c:if test="${cmmCd.cdSort == '00002'}">
									<option value="${cmmCd.dTailCd}" <c:if test="${plan.detailDivCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
								</c:if>
								</c:forEach>
							</select>
							<select class="2ndSelect dspN w96">
								<c:forEach var="cmmCd" items="${cmmCdList}">
								<c:if test="${cmmCd.cdSort == '00003'}">
									<option value="${cmmCd.dTailCd}" <c:if test="${plan.detailDivCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
								</c:if>
								</c:forEach>
							</select>
						</td>

						<td class="cent">
							<select class="3rdSelect w96">
								<c:forEach var="cmmCd" items="${cmmCdList}">
								<c:if test="${cmmCd.cdSort == '00006'}">
									<option value="${cmmCd.dTailCd}" <c:if test="${plan.bsnsList == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
								</c:if>
								</c:forEach>
							</select>
							<select class="3rdSelect w96 dspN">
								<c:forEach var="cmmCd" items="${cmmCdList}">
								<c:if test="${cmmCd.cdSort == '00005'}">
									<option value="${cmmCd.dTailCd}" <c:if test="${plan.detailDivCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
								</c:if>
								</c:forEach>
							</select>
							<input type="hidden" name="ARbsnsList" value="00061"/>
							<input class="w96 dspN" type="text" name="ARbsnsDtail" value=""/>
						</td>
						
						
						<td class="cent" nowrap="nowrap">
							<input class="w96 dspN" type="text" name="ARgoal" maxlength="150"/>
							<span>
								<input class="w48 intNum" type="text" name="ARgoalM" maxlength="150" onKeyPress="return numbersonly(event, false)"/>/월
								<input class="w48 intNum" type="text" name="ARgoalHY" maxlength="150" onKeyPress="return numbersonly(event, false)"/>/년
							</span>
<!-- 
							<span style="width:35%;display:block;">/월</span>
 -->
						</td>
						
						<!-- <td class="bar" colspan="10">
							<table style="width:100%"><tr> -->
							<input type="hidden" name="ARschedule">
							<td id="bar1" class="pd0 h5 hand cent"><input type="text" name="ARmon1" style="width:70%"/></td>
							<td id="bar2" class="pd0 h5 hand cent"><input type="text" name="ARmon2" style="width:70%"/></td>
							<td id="bar3" class="pd0 h5 hand cent"><input type="text" name="ARmon3" style="width:70%"/></td>
							<td id="bar4" class="pd0 h5 hand cent"><input type="text" name="ARmon4" style="width:70%"/></td>
							<td id="bar5" class="pd0 h5 hand cent"><input type="text" name="ARmon5" style="width:70%"/></td>
							<td id="bar6" class="pd0 h5 hand cent"><input type="text" name="ARmon6" style="width:70%"/></td>
						<!-- </tr></table></td> -->
						<td></td>
						<td class="cent"><%-- <a class="memoBtn" id="mm_0"><img src="<c:url value='/images/edit-5-icon.png'/>" title="메모 입력"></a> --%></td>
					</tr>

					<table><tr><td>
						<span class="btn s orange" id="addTblBtn"><a>추가</a></span>
						<span class="btn s green" id="saveBsnsPlan"><a>저장</a></span>
					</td></tr></table>
				</tbody>
			</table>
		</form>
						
		</article>
	</section>
</div>
<div class="clear"></div>
</body>
</html>