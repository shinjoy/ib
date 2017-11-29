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
					
					if('${vo.eventType}' == 'Pop' && '${vo.scheSDate}' == '') {
						$('#SearchSDate').focus();
						
						$('#SearchSDate').datepicker(S_DatePickerOpt).parent().children('img').css({'vertical-align':'middle', 'line-height':'23px', 'margin-left':'5px'});
						$('#SearchEDate').datepicker(E_DatePickerOpt).parent().children('img').css({'vertical-align':'middle', 'line-height':'23px', 'margin-left':'5px'});
					}
					BtnSet();
				});
			});
			
			// 선택일정 상세보기
			function ScheView(ScheSeq, ScheType) {
				$('#ScheSeq').val(ScheSeq);
				$('#ScheType').val(ScheType);
				window.open('', 'ScheView', 'width=770, height=700, scrollbars=no');
				$('#ScheduleAlarmList').attr('target', 'ScheView').attr('action', "<c:url value='/ScheduleView.do'/>").submit();
			}
			
			// 검색 완료
			function SearchEnd() {
				$('#ScheduleAlarmList').attr('target', '_self').attr('action', "<c:url value='/ScheduleAlarmList.do'/>").submit();
			}
			
			// 마우스오버 참가자 보기
			function OpenEntry(DivID, Entry) {
				if(Entry == "") return false;
				if(Entry.split(",").length > 8) var Con = "<span style=\"display:inline-block;height:25px;padding:5px;font-size:9pt;background-color:#E7E7E7;\">";
				else var Con = "<span style=\"display:inline-block;height:15px;padding:5px;font-size:9pt;background-color:#E7E7E7;\">";
				if(Entry.split(",").length > 8) {
					Con += replaceC(Entry.split(Entry.split(",")[8])[0], ",", ", ") + "<br/>";
					Con += Entry.split(",")[8].replace(",", ", ");
					Con += replaceC(Entry.split(Entry.split(",")[8])[1], ",", ", ");
				}
				else Con += replaceC(Entry, ",", ", ");
				Con += "</span>";
				
				elDiv = document.createElement("DIV");
				document.body.appendChild(elDiv);
				elDiv.id = DivID;
				elDiv.style.position = "absolute";
				
				var nMouseTop = window.event.clientY - 20;
				var nMouseLeft = window.event.clientX + 30;
			    
				elDiv.style.top = nMouseTop + 'px';
				elDiv.style.left = nMouseLeft + 'px';
				elDiv.innerHTML = Con;
			}
			
			function CloseEntry() {
				document.body.removeChild(elDiv);
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
	<input type="hidden" name="ScheType"	id="ScheType"/>
	<input type="hidden" name="ScheSDate"	id="ScheSDate"		value="${vo.scheSDate}"/>
	<input type="hidden" name="PerSabun"	id="PerSabun"		value="${loginVO.perSabun}"/>
	<div id="TitleTable" class="FixTable">
	<table class="subtable" border="0" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td class="Title_TB Text_L" colspan="2" style="height:40px;">
				<img src="images/sp/arrow3.gif" style="line-height:23px;vertical-align:middle;"> 일정 리스트 (${vo.scheSDate})
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
					<td class="grid_title" style="width:99px;">일자</td>
					<td class="grid_title" style="width:80px;">작성자</td>
					<td class="grid_title" style="width:60px;">분류</td>
					<td class="grid_title" style="width:59px;">차량</td>
					<td class="grid_title" style="width:346px;">일정제목</td>
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
		<script>
		var reTitle${status.count} = '${result.schetitle}';
		reTitle${status.count} = reTitle${status.count}.replace(/\s\|A?[0-9]+\|/gi, '');	//회사코드 제거
		reTitle${status.count} = reTitle${status.count}.replace(/\s\([0-9]+\)/gi, ' ');		//인물id sequence 제거
		reTitle${status.count} = reTitle${status.count}.replace(/\/\sM&A\s\//gi, '<span style="font-size:11px;font-weight:bold;">M&A</span>');		//M&A여부 폰트변경		
		</script>
			<c:choose>
				<c:when test="${result.schetype eq 'IR'}"><c:set var="ScheColor" value="#FFFF00"/></c:when>
				<c:when test="${result.schetype eq 'Visit'}"><c:set var="ScheColor" value="#00FF00"/></c:when>
				<c:when test="${result.schetype eq 'Invest'}"><c:set var="ScheColor" value="#FF7575"/></c:when>
				<c:when test="${result.schetype eq 'IB'}"><c:set var="ScheColor" value="#FFF7D9"/></c:when>
				<c:otherwise><c:set var="ScheColor" value=""/></c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${result.scheimportant eq 'top'}"><c:set var="FontStyle" value="color:#FF0080;font-weight:bold;"/></c:when>
				<c:otherwise><c:set var="FontStyle" value="color:#000000;"/></c:otherwise>
			</c:choose>
<%-- 			<c:set var="CellOver" value="this.style.background='#FF8000';OpenEntry('EntryView', '${result.entrynm}');"/> --%>
<%-- 			<c:set var="CellOut" value="this.style.background='${ScheColor}';CloseEntry('EntryView');"/> --%>
			<c:set var="CellOver" value="onmouseover=\"this.style.background='#FF8000';CreateLayer2('EntryView', reTitle${status.count}, '${result.entrynm}');\""/>
			<c:set var="CellMove" value="onmousemove=\"MoveLayer2('EntryView');\""/>
			<c:set var="CellOut" value="onmouseout=\"this.style.background='${ScheColor}';RemoveLayer2('EntryView');\""/>
			<c:set var="ViewClick" value="ScheView('${result.scheseq}', '${result.schetype}');"/>
		<tr class="Text_C Click" style="background:${ScheColor};" ${CellOver} ${CellMove} ${CellOut} onclick="${ViewClick}">
			<td class="grid_input_LBR" style="width:98px;" bgcolor="#FFFFFF">${result.schesdate} (${result.calnm})</td>
			<td class="grid_input_BR" style="width:79px;">${result.regpernm}</td>
			<td class="grid_input_BR" style="width:59px;">${result.schetypenm}</td>
			<td class="grid_input_BR" style="width:59px;">${result.carnum}</td>
			<td class="grid_input_BR Text_L" style="width:340px;">
				<table><tr><td width="35"><span style="color:blue;font-weight:bold;font-size:11px;">
				<c:choose>
					<c:when test="${result.viewtime eq 'A'}">종일</c:when>
					<c:otherwise>${result.viewtime}</c:otherwise>
				</c:choose></span></td>
				<td>
				<span>
					<script>					
					document.write(reTitle${status.count});
					</script>
				</span>
				</td></tr></table>
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
			<td class="input_noline Text_C" colspan="6" style="padding:20px;">
				<a href="javascript:self.close();" class="Btn" name="LightBlue">닫기</a>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</form>
	</body>
</html>