<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Synergy Partners</title>
		<link href="<c:url value='/css/sp/synergy.css'/>" rel="stylesheet" type="text/css">
		<script type="text/javaScript" src="js/sp/synergy_util.js"></script>
		<script type="text/javaScript" src="js/sp/jquery-1.8.2.min.js"></script>
		<script src="http://code.jquery.com/jquery-1.9.1.js"/></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"/></script>
		<script type="text/javaScript" language="javascript">
			<!--
			top.document.title = "일정리스트";
			
			$(document).ready(function () {
				$(window).load(function() {
					$('#PaddingTable').attr('style', 'padding-top:'+$('#TitleTable').height()+'px;');
					InfoMessageView();
					if($('#OrderKey').val() != '') ListOrderTitleSet();
					
					$('#WinClose').click(function() {
						if($('#WinClose').is(':checked')) setWinCookie('sche', 'Y', 1);
						self.close();
					});
					
					if('${vo.eventType}' == 'Pop' && '${vo.scheSDate}' == '') {
						$('#SearchSDate').focus();
						
						$('#SearchSDate').datepicker(S_DatePickerOpt).parent().children('img').css({'vertical-align':'middle', 'line-height':'23px', 'margin-left':'5px'});
						$('#SearchEDate').datepicker(E_DatePickerOpt).parent().children('img').css({'vertical-align':'middle', 'line-height':'23px', 'margin-left':'5px'});
					}
					BtnSet();
				});
			});
			
			// 선택일정 상세보기
			function ScheView(ScheSeq) {
				$('#ScheSeq').val(ScheSeq);
				window.open('', 'ScheView', 'width=770, height=700, scrollbars=no');
				$('#ScheduleAlarmList').attr('target', 'ScheView').attr('action', "<c:url value='/ScheduleView.do'/>").submit();
			}
			
			// 검색 완료
			function SearchEnd() {
				$('#ScheduleAlarmList').attr('target', '_selt').attr('action', "<c:url value='/ScheduleAlarmList.do'/>").submit();
			}
			-->
		</script>
	</head>
	<body>
	<form name="ScheduleAlarmList" id="ScheduleAlarmList" action="<c:url value='/ScheduleAlarmList.do'/>" method="post">
	<input type="hidden" name="InfoMessage"	id="InfoMessage">
	<input type="hidden" name="message"		id="message"		value="${message}">
	<input type="hidden" name="EventType"	id="EventType"		value="${vo.eventType}">
	<input type="hidden" name="OrderType"	id="OrderType"		value="${spCmmVO.orderType}"/>
	<input type="hidden" name="OrderKey"	id="OrderKey"		value="${spCmmVO.orderKey}"/>
	<input type="hidden" name="OrderObj"	id="OrderObj"		value="${spCmmVO.orderObj}"/>
	<input type="hidden" name="OrderObjNm"	id="OrderObjNm"		value="${spCmmVO.orderObjNm}"/>
	<input type="hidden" name="OrderFlag"	id="OrderFlag"		value="${spCmmVO.orderFlag}"/>
	<input type="hidden" name="ScheSeq"		id="ScheSeq"/>
	<input type="hidden" name="ScheSDate"	id="ScheSDate"		value="${vo.scheSDate}"/>
	<input type="hidden" name="PerSabun"	id="PerSabun"		value="${loginVO.perSabun}"/>
	<c:choose>
		<c:when test="${vo.scheGubun eq 'All'}"><c:set var="Title" value="전체"/></c:when>
		<c:otherwise><c:set var="Title" value="내"/></c:otherwise>
	</c:choose>
	<div id="TitleTable" class="FixTable">
	<table class="subtable" border="0" cellpadding="0" cellspacing="0" align="center" style="height:100%;">
		<tr>
			<td class="Title_TB Text_L" colspan="2" style="height:40px;">
				<img src="images/sp/arrow3.gif" style="line-height:23px;vertical-align:middle;"> ${Title}일정 리스트
			</td>
		</tr>
		<c:if test="${vo.eventType eq 'Pop' && vo.scheSDate eq ''}">
		<tr>
			<td class="input_search Text_R" colspan="2">
				기간검색 :
				<input type="text" class="input_box Text_C" size="12" name="SearchSDate" id="SearchSDate" value="${spCmmVO.searchSDate}" onkeyup="javascript:DateFormat(this.name, this.value);" maxlength="10"/> ~
				<input type="text" class="input_box Text_C" size="12" name="SearchEDate" id="SearchEDate" value="${spCmmVO.searchEDate}" onkeydown="if(event.keyCode=='13') SearchEnd();" onkeyup="javascript:DateFormat(this.name, this.value);" maxlength="10"/>
				<a href="javascript:SearchEnd();" class="Btn" name="Orange">검색</a>
			</td>
		</tr>
		</c:if>
		<tr>
			<td colspan="2">
			<table id="title" class="form3" border="0" cellpadding="0" cellspacing="0">
				<tr class="Text_C">
					<td class="grid_title" style="width:100px;">일자</td>
					<td class="grid_title" style="width:280px;">일정제목</td>
					<td class="grid_title" style="width:50px;">중요도</td>
					<td class="grid_title" style="width:50px;">잔여일</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	</div>
	<div id="PaddingTable">
	<div id="ContentTable" class="ConTable" onscroll="TableScrolling();">
	<table class="form3_noline" align="center" border="0" cellpadding="0" cellspacing="0">
		<c:forEach var="result" items="${AlarmList}" varStatus="status">
			<c:choose>
				<c:when test="${result.scheimportant eq 'top'}"><c:set var="CellColor" value="#FF0080"/></c:when>
				<c:otherwise><c:set var="CellColor" value="#FFFFFF"/></c:otherwise>
			</c:choose>
			<tr class="Text_C Click" style="background:${CellColor};" onmouseover="this.style.background='#F0F0F0';" onmouseout="this.style.background='${CellColor}';" onclick="ScheView('${result.scheseq}');">
				<td class="grid_input_LBR" style="width:99px;" bgcolor="#FFFFFF">${result.alarmdate} (${result.calnm})</td>
				<td class="grid_input_BR Text_L" style="width:274px;">
					<c:choose>
						<c:when test="${result.viewtime eq 'A'}"></c:when>
						<c:otherwise>${result.viewtime}</c:otherwise>
					</c:choose> ${result.schetitle}
				</td>
				<td class="grid_input_BR" style="width:49px;">${result.scheimportantnm}</td>
				<fmt:parseNumber var="ExtraDay" value="${result.extraday}"/>
				<c:choose>
					<c:when test="${ExtraDay < 3}">
						<td class="grid_input_BR" style="width:49px;" bgcolor="#FF0000">${ExtraDay}일</td>
					</c:when>
					<c:when test="${ExtraDay < 7 && ExtraDay > 3}">
						<td class="grid_input_BR" style="width:49px;" bgcolor="#FF4D4D">${ExtraDay}일</td>
					</c:when>
					<c:when test="${ExtraDay < 14 && ExtraDay > 7}">
						<td class="grid_input_BR" style="width:49px;" bgcolor="#FF7979">${ExtraDay}일</td>
					</c:when>
					<c:otherwise>
						<td class="grid_input_BR" style="width:49px;" bgcolor="#FFACAC">${ExtraDay}일</td>
					</c:otherwise>
				</c:choose>
			</tr>	
		</c:forEach>
		<tr>
			<td class="input_noline Text_L" colspan="2" style="padding:10px;">
				<input type="checkbox" name="WinClose" id="WinClose"><label for="WinClose">오늘하루 열지 않음</label>
			</td>
			<td class="input_noline Text_R" colspan="2" style="padding:10px;">
				<a href="javascript:self.close();" class="Btn" name="LightBlue">닫기</a>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</form>
	</body>
</html>