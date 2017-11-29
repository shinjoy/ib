<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Synergy Partners</title>
		<link href="<c:url value='/css/sp/synergy.css'/>" rel="stylesheet" type="text/css">
		<script src="js/sp/synergy_util.js"></script>
		<script src="js/sp/jquery-1.8.2.min.js"></script>
		<script type="text/javaScript" language="javascript">	
			$(document).ready(function () {
				$(window).load(function() {
					InfoMessageView();
					BtnSet();
				});
			});
			
			// 일정 수정/삭제 완료
			function ScheduleProcFlagEnd() {
				if($('#EventType').val() == 'Edit') {
					if($('input:radio[name="ProcFlag"]:checked').val() == 'alone'){
						$('#alone').val('alone');	
					}
					$('#ScheduleProcFlag').attr('action', "<c:url value='/ScheduleProc.do'/>").submit();
				}
				else {
					if(confirm('일정을 삭제하시겠습니까?')) {
						$('#InfoMessage').val('삭제 완료 되었습니다.');
						$('#ScheduleProcFlag').attr('target', 'mainFrame').attr('action', "<c:url value='/ScheduleDelEnd.do'/>").submit();		//content >> mainFrame (IBsystem mainFrame)
						showLayer();
					}
					else alert('삭제 취소 되었습니다.');
				}
			}
			
			// 일정 상세보기
			function ScheView() {
				$('#EventType').val('View');
				$('#ScheduleProcFlag').attr('action', "<c:url value='/ScheduleView.do'/>").submit();
			}			
		</script>
	</head>
	<body>
	<form name="ScheduleProcFlag" id="ScheduleProcFlag" action="<c:url value='/ScheduleProcFlag.do'/>" method="post">
	<input type="hidden" name="InfoMessage"	id="InfoMessage">
	<input type="hidden" name="message"		id="message"		value="${message}">
	<input type="hidden" name="CMD"			id="CMD"			value="${vo.CMD}"/>
	<input type="hidden" name="EventType"	id="EventType"		value="${vo.eventType}"/>
	<input type="hidden" name="ParentPage"	id="ParentPage"		value="${vo.parentPage}"/>
	<input type="hidden" name="ScheSeq"		id="ScheSeq"		value="${vo.scheSeq}"/>
	<input type="hidden" name="ScheGrpCd"	id="ScheGrpCd"		value="${vo.scheGrpCd}"/>
	<input type="hidden" name="ScheSDate"	id="ScheSDate"		value="${vo.scheSDate}"/>
	<input type="hidden" name="PerSabun"	id="PerSabun"		value="${loginVO.regPerSabun}"/>
	<input type="hidden" name="grpCd"		id="grpCd"          value="${vo.grpCd}"/>
	<input type="hidden" name="alone"		id="alone"         />
	<div id="prolayer" style="height:100%;width:100%;display:none;">
		<table border="0" width="100%" height="100%">
			<tr><td align="center"><img src="<c:url value='/images/sp/loading.gif'/>"><p><b>저장중입니다.</b></td></tr>
		</table>
	</div>
	<table class="subtable" border="0" cellpadding="0" cellspacing="0" align="center" style="width:300px;">
		<c:choose>
			<c:when test="${vo.eventType eq 'Edit'}"><c:set var="tag" value="수정"/></c:when>
			<c:otherwise><c:set var="tag" value="삭제"/></c:otherwise>
		</c:choose>
		<tr>
			<td class="Title_TB input_R Text_L" style="height:40px;"><img src="images/sp/arrow3.gif" style="line-height:23px;vertical-align:middle;"> 반복 일정 ${tag}</td>
		</tr>
		<tr>
			<td class="input_BR" height="70px;">
				<input type="radio" name="ProcFlag" id="ProcFlag1" value="alone" checked/><label for="ProcFlag1">이 일정만 ${tag}</label><br/>
				<input type="radio" name="ProcFlag" id="ProcFlag2" value="after"/><label for="ProcFlag2">이 일정부터 이후 모든 일정 ${tag}</label><br/>
				<input type="radio" name="ProcFlag" id="ProcFlag3" value="all"/><label for="ProcFlag3">전체 반복 일정 ${tag}</label><br/>
			</td>
		</tr>
		<tr style="height:40px;">
			<td class="input_noline Text_C">
				<a href="javascript:ScheduleProcFlagEnd();" class="Btn" name="LightBlue">확인</a>
				<a href="javascript:ScheView();" class="Btn" name="LightBlue">취소</a>
			</td>
		</tr>
	</table>
	</form>
	</body>
</html>