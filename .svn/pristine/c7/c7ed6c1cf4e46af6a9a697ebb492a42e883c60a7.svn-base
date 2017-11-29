<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Synergy Partners</title>
		<link href="<c:url value='/css/sp/synergy.css'/>" rel="stylesheet" type="text/css">
		<script src="js/sp/synergy_util.js"></script>
		<script src="js/sp/jquery-1.8.2.min.js"></script>
		<script type="text/javaScript" language="javascript">
			<!--
			$(document).ready(function () {
				$(window).load(function() {
					if('${fn:length(AlarmList)}' > 0) SMSSendEnd();
				});
			});
			
			// 문자 전송 완료
			function SMSSendEnd() {
				var List = '${fn:length(AlarmList)}';
				List = Number(List) + 1;
				var cnt = 0;
				var SMSSeq = '${SMSSeq}';
				var FromNum_Tmp, ToNum_tmp, index_tmp;
				
				for(var oOo = 1 ; oOo < List; oOo++) {
					if($('#ReceiveNum'+oOo).val() != '') {
						if(cnt == 0) {
							FromNum_Tmp = $('#SendNum'+oOo).val();
							ToNum_tmp = $('#ReceiveNum'+oOo).val();
							index_tmp = SMSSeq;
						}
						else {
							FromNum_Tmp = FromNum_Tmp + "," + $('#SendNum'+oOo).val();
							ToNum_tmp = ToNum_tmp + "," + $('#ReceiveNum'+oOo).val();
							index_tmp = index_tmp + "," + SMSSeq;
						}
						$('#SMSSeq'+oOo).val(SMSSeq);
						cnt++;
						SMSSeq++;
					}
				}
				
				$('#SMSType').val('3');	// 단문이냐 장문이냐
				NowTime = replaceC(GetToday(), "-", "") + replaceC(GetNowTime("HhMiSs"), ":", "");
				$('#SMSReserTime').val(NowTime);
				$('#ScheduleSMSList').submit();
				
				SMSSeq = '${SMSSeq}';
				for(var oOo = 1 ; oOo < List; oOo++) {
					NowTime = replaceC(GetToday(), "-", "") + replaceC(GetNowTime("HhMiSs"), ":", "");
					$('#sendType').val($('#SMSType').val());
					$('#toNumber').val(replaceC($('#ReceiveNum'+oOo).val(), "-", ""));
					$('#contents').val($('#SMSContent'+oOo).val());
// 					$('#fromNumber').val(replaceC($('#SendNum'+oOo).val(), "-", ""));
					$('#startTime').val(NowTime);
					$('#indexCode').val(SMSSeq);
					$('#ScheduleSMSList').attr('target', "moashot"+oOo).attr('action', "https://biz.moashot.com/EXT/URLASP/mssendUTF.asp").submit();
				}
			}
			
			-->
		</script>
	</head>
	<body>
	<form name="ScheduleSMSList" id="ScheduleSMSList" action="<c:url value='/ScheduleSMSSendEnd.do'/>" method="post">
		<input type="hidden" name="SendCnt"			id="SendCnt"		value="${fn:length(AlarmList)}">
		<input type="hidden" name="SMSTitle"		id="SMSTitle"		value="일정알림">
		<input type="hidden" name="SMSType"			id="SMSType">
		<input type="hidden" name="SMSReserTime"	id="SMSReserTime">
		<input type="hidden" name="SMSFlag"			id="SMSFlag"		value="Schedule">
		<!-- 모아샷 연동 파라메터 -->
		<input type="hidden" name="uid"				id="uid"			value="synergy">
		<input type="hidden" name="pwd"				id="pwd"			value="00synergy00">
		<input type="hidden" name="sendType"		id="sendType">
		<input type="hidden" name="toNumber"		id="toNumber">
		<input type="hidden" name="contents"		id="contents">
		<input type="hidden" name="fromNumber"		id="fromNumber" value="025865981">
		<input type="hidden" name="startTime"		id="startTime">
		<input type="hidden" name="nType"			id="nType"			value="3">
		<input type="hidden" name="indexCode"		id="indexCode">
		<input type="hidden" name="returnUrl"		id="returnUrl"		value="http://106.250.177.91:8280/SynergyCus/SMSSendResult.do">
		<input type="hidden" name="returnType"		id="returnType"		value="2">
		<input type="hidden" name="redirectUrl"		id="redirectUrl"	value="http://106.250.177.91:8280/SynergyCus/ClosePage.do">
		
		<c:forEach var="result" items="${AlarmList}" varStatus="status">
			<input type="hidden" name="SMSSeq${status.count}"		id="SMSSeq${status.count}">
			<input type="hidden" name="SMSContent${status.count}"	id="SMSContent${status.count}"	value="일정시스템에 등록된 일정이 ${result.alarmcnt} 개 있습니다.">
			<input type="hidden" name="SendNum${status.count}"		id="SendNum${status.count}"		value="${result.perphone}">
			<input type="hidden" name="ReceiveNum${status.count}"	id="ReceiveNum${status.count}"	value="${result.perphone}">
			<iframe id="moashot${status.count}" width="0" height="0" frameborder="0"></iframe>
		</c:forEach>
	</form>
	
	<center>
	<h1><font color="pink">일정 알림 SMS 전송 완료</font></h1>
	</center>
	
	</body>
</html>