<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
//치환 변수 선언
pageContext.setAttribute("cr", "\r"); //Space
pageContext.setAttribute("cn", "\n"); //Enter
pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
pageContext.setAttribute("br", "<br>"); //br 태그
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Synergy Partners</title>
		<link href="<c:url value='/css/sp/synergy.css'/>" rel="stylesheet" type="text/css">
		<script src="js/sp/synergy_util.js"></script>
		<script src="js/sp/jquery-1.8.2.min.js"></script>
		<script type="text/javaScript" language="javascript">
			
			if('${vo.eventType}' == 'Alarm' || '${vo.eventType}' == 'Pop') top.document.title = "일정 상세보기";
			
			$(document).ready(function () {
				$(window).load(function() {
					DataSet();
					if('${vo.eventType}' == 'Pop') OpenerReload();
					InfoMessageView();
					BtnSet();
				});
			});
			
			// 참가자 셋팅
			function DataSet() {
				if('${fn:length(ScheduleEntryList)}' > 0) {
					var Cnt = 0, PerNm = "";
					<c:forEach var="result" items="${ScheduleEntryList}" varStatus="status">
						if('${result.delflag}' == 'N') {
							if(Cnt == 0) PerNm += "${result.pernm}";
							else PerNm += ", ${result.pernm}";
							Cnt++;
						}
					</c:forEach>
					$('#Entry').html(PerNm);
				}
			}
			
			// 일정 수정 페이지
			function ScheduleEdit() {
				$('#EventType').val('Edit');
				if($('#ScheGrpCd').val() == '' || $('#ScheGrpCd').val() == 'Period') $('#ScheduleView').attr('action', "<c:url value='/ScheduleProc.do'/>");
				else {
					$('#EventType').val('Edit');
					$('#ScheduleView').attr('action', "<c:url value='/ScheduleProcFlag.do'/>");
				}
				$('#ScheduleView').submit();
			}
			
			// 일정 삭제
			function ScheduleDelEnd() {
				if($('#ScheGrpCd').val() == '' || $('#ScheGrpCd').val() == 'Period') {
					if(confirm('일정을 삭제하시겠습니까?')) {
						//$('#InfoMessage').val('삭제 완료 되었습니다.');
						$('#ScheduleView').attr('target', 'mainFrame').attr('action', "<c:url value='/ScheduleDelEnd.do'/>").submit();		//content >> mainFrame (IBsystem mainFrame)						
					}
					//else alert('삭제 취소 되었습니다.');
				}
				else {
					$('#EventType').val('Del');
					$('#ScheduleView').attr('action', "<c:url value='/ScheduleProcFlag.do'/>").submit();
				}
			}
			
			// 일정 완료
			function ScheduleChkEnd() {
				$('#InfoMessage').val('일정이 완료처리 되었습니다.');
				$('#ScheduleView').attr('action', "<c:url value='/ScheduleChkEnd.do'/>").submit();
			}
			
			function OpenerReload() {
				opener.document.ScheduleAlarmList.action = "<c:url value='/ScheduleAlarmList.do'/>";
				opener.document.ScheduleAlarmList.target = "_self";
				opener.document.ScheduleAlarmList.submit();
			}
			
		</script>
		<style>
			.head {
				height:40px;
				width:99%;
				font-weight:bold;
				color: #496b9b;
				padding-left:10px;
				padding-top:10px;
				border: 1px solid #b4cef3;
				background-position: left bottom;
				background-color:#EEEEEE;
			}
		</style>
	</head>
	<body>
	<form name="ScheduleView" id="ScheduleView" action="" method="post">
	<input type="hidden" name="message"			id="message"		value="${message}"/>
	<input type="hidden" name="InfoMessage" 	id="InfoMessage"/>
	<input type="hidden" name="command"		 	id="command"		value="Schedule"/>
	<input type="hidden" name="CMD"				id="CMD"			value="${vo.CMD}"/>
	<input type="hidden" name="EventType"		id="EventType"		value="${vo.eventType}"/>
	<input type="hidden" name="ParentPage"		id="ParentPage"		value="${vo.parentPage}"/>
	<input type="hidden" name="SelDate"			id="SelDate"		value="${scheVO.scheSDate}"/>
	<input type="hidden" name="ScheAlarmFlag"	id="ScheAlarmFlag"/>
	<input type="hidden" name="PerSabun"		id="PerSabun"		value="${loginVO.regPerSabun}"/>
	<input type="hidden" name="ScheSeq"			id="ScheSeq"		value="${scheVO.scheSeq}"/>
	<input type="hidden" name="ScheGrpCd"		id="ScheGrpCd"		value="${scheVO.scheGrpCd}"/>
	<input type="hidden" name="ScheSDate"		id="ScheSDate"		value="${scheVO.scheSDate}"/>
	<input type="hidden" name="SchePeriodFlag"	id="SchePeriodFlag"	value="${scheVO.schePeriodFlag}"/>
	<input type="hidden" name="grpCd"		    id="grpCd"          value="${vo.grpCd}"/>
	
	<table class="subtable_noline " cellpadding="0" cellspacing="0" style="width:100%;" align="center">
		<tr>
			<td class="Title_B Text_L" style="width:20%;height:40px;"><img src="images/sp/arrow3.gif" style="line-height:23px;vertical-align:middle;"> 상세보기</td>
			<td class="Title_orange Title_noline Text_R">
				<c:if test="${scheVO.scheType ne 'IB'}">
				<c:choose>
					<c:when test="${scheVO.scheChkFlag eq 'N'}">완료되지 않은 일정</c:when>
					<c:otherwise>완료된 일정</c:otherwise>
				</c:choose>
				</c:if>
			</td>
		</tr>
		<tr style="display:none;">
			<td class="desc_BR Text_L" style="width:20%;height:35px;">일정구분</td>
			<td class="input_B Text_L">
				${scheVO.scheGubunNm}
				<span style="display:inline-block;width:60%;">&nbsp;</span>
				(${scheVO.regPerNm} ${scheVO.regDate})
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_L" style="height:35px;">분류</td>
			<td class="input_B Text_L">
				<c:choose>
					<c:when test="${scheVO.scheType eq 'Invest'}">투자</c:when>
					<c:when test="${scheVO.scheType eq 'Notice'}">알림</c:when>
					<c:when test="${scheVO.scheType eq 'Private'}">메모</c:when>
					<c:when test="${scheVO.scheType eq 'Mt_inside'}">회의</c:when>
					<c:when test="${scheVO.scheType eq 'Schedule'}">일정</c:when>
				
					<c:when test="${scheVO.scheType eq 'IR'}">IR</c:when>
					<c:when test="${scheVO.scheType eq 'Visit'}">탐방</c:when>
					<c:when test="${scheVO.scheType eq 'Meet'}">미팅</c:when>
					<c:when test="${scheVO.scheType eq 'Mt_lunch'}">점심미팅</c:when>
					<c:when test="${scheVO.scheType eq 'Mt_dinner'}">저녁미팅</c:when>
					<c:when test="${scheVO.scheType eq 'Holiday'}">휴가</c:when>
					<c:when test="${scheVO.scheType eq 'Inspect'}">실사</c:when>
					<c:when test="${scheVO.scheType eq 'Mediate'}">중개</c:when>
					<c:when test="${scheVO.scheType eq 'Manage'}">관리</c:when>
					<c:when test="${scheVO.scheType eq 'BusiTrip'}">출장</c:when>
										
					<c:otherwise>기타</c:otherwise>
				</c:choose>
				
				<c:if test="${scheVO.mnaType eq 'M'}">
					<%--<script>
					//분류 global variable
					var g_sTypeObj = {mna_m:'미팅'
								   ,mna_d:	'실사'
								   ,mna_a:	'중개'
								   ,mna_g:	'관리'
								   };
					</script>
					/<script>document.write(g_sTypeObj['${scheVO.mnaType}']);</script>
					 --%>
					 / M&A업무
				</c:if>
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_L" style="height:35px;">기간</td>
			<td class="input_B Text_L">
				<c:choose>
					<c:when test="${scheVO.scheAllTime eq 'Y'}">${scheVO.scheSDate} ~ ${scheVO.scheEDate}</c:when>
					<c:otherwise>${scheVO.scheSDate} ${scheVO.scheSTimeAMPMNm} ${scheVO.scheSTime} ~ ${scheVO.scheEDate} ${scheVO.scheETimeAMPMNm} ${scheVO.scheETime}</c:otherwise>
				</c:choose>
				<c:if test="${scheVO.scheChkFlag eq 'Y'}">(${scheVO.scheChkDate} 완료처리됨)</c:if>
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_L" style="height:35px;">차량사용여부</td>
			<td class="input_B Text_L">
				<c:choose>
					<c:when test="${scheVO.carUseFlag eq 'Y'}">
						사용함 ( ${scheVO.regPerNm} - ${scheVO.carNum} )
						<%-- 사용함 (${scheVO.regPerNm} - ${scheVO.carNum} : ${scheVO.scheSTimeAMPMNm} ${scheVO.scheSTime} ~ ${scheVO.scheETimeAMPMNm} ${scheVO.scheETime}) --%>
						<%-- <span style="font-weight:bold;color:#000080;">[차량위치 : ${scheVO.carFloor}, 최근사용자 : ${scheVO.carUsePerNm}]</span> --%>
					</c:when>
					<c:otherwise>사용안함</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_L" style="height:35px;">회의실 사용여부</td>
			<td class="input_B Text_L">
				<c:choose>
					<c:when test="${fn:length(meetingRoom) >0 }">
						<c:forEach items="${meetingRoom }" var="i">
							<strong>
								${i.meetingRoomNm} 
							</strong>
							<span>[사용시간 : ${i.showStartTime} ~ ${i.showEndTime} ] </span>
					
						</c:forEach>
					</c:when>
					<c:otherwise>
						<span>사용안함 </span>
					</c:otherwise>
				
				</c:choose>
				
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_L" style="height:35px;">제목</td>
			<td class="input_B Text_L">${scheVO.scheTitle}</td>
		</tr>
		
		
		
		<tr>
			<td class="desc_BR Text_L" style="height:35px;">장소</td>
			<td class="input_B Text_L">${scheVO.scheArea}</td>
		</tr>
		
		<tr>
			<td class="desc_BR Text_L" style="height:100px;">세부내용</td>
			<td class="input_B Text_L">${fn:replace(scheVO.scheCon, cn, br)}</td>
		</tr>
		<tr>
			<td class="desc_BR Text_L" style="height:50px;">참가자</td>
			<td class="input_B Text_L"><span id="Entry"></span>
				<c:if test="${scheVO.scheType eq 'IB'}">${scheVO.regPerNm}</c:if>
			</td>
		</tr>
		
		<tr>
			<td class="desc_BR Text_L" style="height:35px;">반복설정</td>
			<td class="input_B Text_L">${scheVO.scheRepetFlagNm}</td>
		</tr>
		<tr>
			<td class="desc_BR Text_L" style="height:35px;">알림발생시기 / 알림방법</td>
			<td class="input_B Text_L">${scheVO.scheAlarmFlagNm} / ${scheVO.scheAlarmHowNm}</td>
		</tr>
		<tr style="display:none;">
			<td class="desc_BR Text_L" style="height:35px;">알림방법</td>
			<td class="input_B Text_L">${scheVO.scheAlarmHowNm}</td>
		</tr>
		<tr>
			<td class="desc_BR Text_L" style="height:35px;">중요도</td>
			<td class="input_B Text_L">
				<c:choose>
					<c:when test="${scheVO.scheImportant eq 'top'}">상</c:when>
					<c:when test="${scheVO.scheImportant eq 'middle'}">중</c:when>
					<c:when test="${scheVO.scheImportant eq 'bottom'}">하</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_L" style="height:35px;">공개여부</td>
			<td class="input_B Text_L">
				<c:choose>
					<c:when test="${scheVO.schePublicFlag eq 'Y'}">공개</c:when>
					<c:otherwise>비공개</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td class="input_noline Text_C" colspan="2" style="padding-top:20px;padding-bottom:20px;">
				<c:choose>
					<c:when test="${vo.eventType ne 'Alarm'}">
						<c:if test="${scheVO.scheChkFlag eq 'N' && loginVO.regPerSabun eq scheVO.perSabun}">
							<a href="javascript:ScheduleChkEnd();" class="Btn" name="LightBlue">일정 완료처리</a>
							<a href="javascript:ScheduleEdit();" class="Btn" name="Orange">수정</a>
							<a href="javascript:ScheduleDelEnd();" class="Btn" name="Orange">삭제</a>
						</c:if>
						<c:choose>
							<c:when test="${vo.eventType eq 'View'}">
								<a href="javascript:parent.LayerClose($('#EventType').val());" class="Btn" name="DarkGold">창닫기</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:self.close();" class="Btn" name="DarkGold">창닫기</a>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:if test="${scheVO.scheChkFlag eq 'N' && loginVO.regPerSabun eq scheVO.perSabun}">
							<a href="javascript:ScheduleChkEnd();" class="Btn" name="LightBlue">일정 완료처리</a>
						</c:if>
						<a href="javascript:self.close();" class="Btn" name="LightBlue">창닫기</a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	</form>
	</body>
</html>