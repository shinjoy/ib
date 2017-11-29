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
		<link href="<c:url value='/css/sp/new_btn.css'/>" rel="stylesheet" type="text/css">
		<script type="text/javaScript" src="js/sp/synergy_util.js"></script>
		<script type="text/javaScript" src="js/sp/jquery-1.8.2.min.js"></script>
		<style>
			.head {
				height:40px;
				font-weight:bold;
				color: #496b9b;
				padding-left:10px;
				padding-top:10px;
				border-top: 1px solid #b4cef3;
				border-bottom: 1px solid #b4cef3;
				background-position: left bottom;
				background-color:#EEEEEE;
				padding-bottom: 5px;
			}
			.CalList {display:inline-block;line-height:200%;text-align:center;}
		</style>
		
		<script type="text/javaScript" language="javascript">			
			var BaseHeight;
			$(document).ready(function () {
				$(window).load(function() {
					$('#PaddingTable').attr('style', 'padding-top:'+$('#TitleTable').height()+'px;');
					SetSche();
					InfoMessageView();
					if($('#OrderKey').val() != '') ListOrderTitleSet();
					BaseHeight = $('body').height();
					BtnSet();
					
					
					
					var UserAgent = navigator.userAgent;
					if(UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null)
					{
						$('.table_width').css('width', '100%');
						$('#header_tr_mobile').show();
						$('#header_tr_pc').hide();
					}
					
				});
			});
			
			// 일정 분류 검색 완료
			function ScheduleTypeSearchEnd(ScheType) {
				$('#ScheType').val(ScheType);
				$('#ScheduleList').attr('action', "<c:url value='/ScheduleList.do'/>").submit();
			}
			
			// 연도 변경
			function Move_Year(Year) {
				$('#SelYear').val(Year);
				$('#ScheduleList').attr('action', "<c:url value='/ScheduleList.do'/>").submit();
			}
			
			// 달력이동
			function Move_Cal(Year, Month) {
				$('#SelYear').val(Year);
				$('#SelMonth').val(Month);
				$('#ScheduleList').attr('action', "<c:url value='/ScheduleList.do'/>").submit();
			}
			
			// 월변경
			function Move_Month(Month) {
				$('#SelMonth').val(Month);
				$('#ScheduleList').attr('action', "<c:url value='/ScheduleList.do'/>").submit();
			}
			
			// 일정셋팅
			function SetSche() {
				$('#Parent', parent.left.myInfo).val("ScheduleList");
				var PerSabun = "", CalNm = "", ScheColor = "", FontColor = "", Today = "", SelDay = "", TodayColor = "", OldCalDate = "", ScheTime = "";
				var ScheCon = "", AddClick = "", ViewClick = "", RowSpan = 1;
				$('#'+'${vo.scheType}').attr('name', 'Orange');
				
				var Date = "", Con = "";
				ScheCon += "<table class=\"form3_noline\" align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">";
				<c:forEach var="result" items="${ScheList}" varStatus="status">
					PerSabun = '${result.persabun}';
					ScheTime = '${result.viewtime}';
					if(ScheTime == 'A') ScheTime = '';
					
					if('${result.schetype}' == 'IR') ScheColor = "#FFFF00";
					else if('${result.schetype}' == 'Visit') ScheColor = "#00FF00";
					else if('${result.schetype}' == 'Invest') ScheColor = "#FF7575";
					else if('${result.schetype}' == 'IB') ScheColor = "#FFF7D9";
					else ScheColor = "";
										
					ScheImportant = '${result.scheimportant}';	// 일정 중요도
					if(ScheImportant == 'top') FontStyle = "color:#FF0080;font-weight:bold;";
					else FontStyle = "color:#000000;";
					
					if(ScheColor == '' && '${result.mysche}' == 'My' && $('#SearchPerSabun').val().search($('#RegPerSabun').val()) > -1) {
						FontStyle += "font-weight:bold;"; // 내일정 구분
						ScheColor = "#ECD9FF";
					}
					
					CellOver = "bgcolor=\""+ScheColor+"\" onmouseover=\"this.style.background='#FF8000';CreateLayer2('EntryView', '${result.schetitle}', '${result.entrynm}');\" onmousemove=\"MoveLayer2('EntryView');\" onmouseout=\"this.style.background='"+ScheColor+"';RemoveLayer2('EntryView');\"";
					
					if('${result.schetitle}' != '') ViewClick = "onclick=\"ScheView('${result.persabun}', '${result.scheseq}', '${result.schetype}');\"";
					else ViewClick = "";
					ScheCon = '${fn:replace(fn:replace(result.schecon, cr, cn), cn, '')}';
					if('${status.count}' != 0 && '${result.caldate}' != OldCalDate) {
						if('${status.count}' != 0) {
							$('#Date'+OldCalDate).html(Date);
							$('#Con'+OldCalDate).html(Con);
							Con = "";
						}
						Date = '${result.caldate}' + " (" + '${result.calnm}' + ") <br/> <span style=\"color:#000000;font-size:9pt;\">"+' ${result.holiname}'+"</span>";
						if('${result.calyear}' == '2015' && '${result.calmonth}' == '8' && '${result.calday}' == '14') Date = '${result.caldate}' + " (" + '${result.calnm}' + ")<br/> <span style=\"color:#000000;font-size:9pt;\">임시공휴일</span>";
						Con += "<span style=\"display:inline-block;height:30px;background-color:"+ScheColor+";border-bottom:1px solid #000000;\" "+CellOver+" "+ViewClick+">";
						Con += "<span class=\"CalList\" style=\"width:80px;\">${result.regpernm}</span>";
						Con += "<span class=\"CalList\" style=\"width:60px;\">${result.schetypenm}</span>";
						Con += "<span style=\"width:289px;padding-left:10px;display:inline-block;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"+FontStyle+"\">"+ScheTime+" ${fn:substring(fn:split(result.schetitle, cn)[0], 0, 25)}</span>";
						Con += "<span class=\"CalList\" style=\"width:100px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;\">${result.schearea}</span>";
						Con += "<span class=\"CalList\" style=\"width:220px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;\">"+ScheCon+"</span>";
						Con += "<span class=\"CalList\" style=\"width:80px;\">${result.scheimportantnm}</span>";
						Con += "</span>";
					}
					else {
						Con += "<span style=\"display:inline-block;height:30px;background-color:"+ScheColor+";border-bottom:1px solid #000000;\" "+CellOver+" "+ViewClick+">";
						Con += "<span class=\"CalList\" style=\"width:80px;\">${result.regpernm}</span>";
						Con += "<span class=\"CalList\" style=\"width:60px;\">${result.schetypenm}</span>";
						Con += "<span style=\"width:289px;padding-left:10px;display:inline-block;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"+FontStyle+"\">"+ScheTime+" ${fn:substring(fn:split(result.schetitle, cn)[0], 0, 25)}</span>";
						Con += "<span class=\"CalList\" style=\"width:100px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;\">${result.schearea}</span>";
						Con += "<span class=\"CalList\" style=\"width:220px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;\">"+ScheCon+"</span>";
						Con += "<span class=\"CalList\" style=\"width:80px;\">${result.scheimportantnm}</span>";
						Con += "</span>";
					}
					OldCalDate = '${result.caldate}';
				</c:forEach>
				$('#Date'+OldCalDate).html(Date);
				$('#Con'+OldCalDate).html(Con);
			}
			
			// 일정 등록
			function ScheAdd(SelDay) {
// 				$('body').height('900');
				$('<div id="BackDiv" onclick="LayerClose();"></div>').css('opacity',0.3).appendTo('body');
				$('#BackDiv').css({'top':'0', 'width':'100%', 'height':$('#TitleTable').height()+$('#ContentTable').height()});
				$('#ViewDiv').css({'top':($('#TitleTable').height()+$('#ContentTable').height())/2-200, 'left':$('body').width()/2-100, 'z-index':'100', 'width':'770', 'height':'700', 'position':'absolute'}).fadeIn(300);
				
				Month = $('#SelMonth').val();
				if(Month.length == 1) Month = "0" + Month;
				if(SelDay.length == 1) SelDay = "0" + SelDay;
				SelDate = $('#SelYear').val() + "-" + Month + "-" + SelDay;
				$('#ScheSDate').val(SelDate);
				$('#SelDate').val(SelDate);
				
			    var LayerCon = "<iframe id='ScheduleProc' src='<c:url value='/ScheduleProc.do?CMD=${vo.CMD}&EventType=Add&ParentPage=Cal&ScheSDate="+SelDate+"'/>' frameborder='0' width='100%' height='100%' scrolling='yes' style='border-radius:10px;'/>";
			    $('#ViewDiv').html(LayerCon);
				
				
// 				$('<div id="BackDiv" onclick="LayerClose(\'Add\');"></div>').css('opacity',0.3).appendTo('body');
// 				$('#BackDiv').css('top', document.body.scrollTop);
// 				$('#ViewDiv').css({'left':'50%', 'z-index':'100', 'width':'770', 'height':'700'}).fadeIn(300);
				
// 				Month = $('#SelMonth').val();
// 				if(Month.length == 1) Month = "0" + Month;
// 				if(SelDay.length == 1) SelDay = "0" + SelDay;
// 				SelDate = $('#SelYear').val() + "-" + Month + "-" + SelDay;
// 				$('#ScheSDate').val(SelDate);
// 				$('#SelDate').val(SelDate);
				
// 			    var LayerCon = "<br/><iframe id='ScheduleProc' src='<c:url value='/ScheduleProc.do?CMD=${vo.CMD}&EventType=Add&ParentPage=List&ScheSDate="+SelDate+"'/>' frameborder='0' width='100%' height='100%'/>";
// 			    $('#ViewDiv').html(LayerCon);
// 			    var ViewDivTop = (screen.height - $('#ViewDiv').css('height').replace('px', '')) / 2 + 150;
// 			    $('#ViewDiv').css('top', document.body.scrollTop + ViewDivTop).css('left', '50%');
// 				$("body").css("overflow","hidden");
			}
			
			// 일정 상세보기
			function ScheView(PerSabun, ScheSeq, ScheType) {
// 				alert($('body').height());
				
// 				$('body').height('900');
				$('<div id="BackDiv" onclick="LayerClose();"></div>').css('opacity',0.3).appendTo('body');
				$('#BackDiv').css({'top':'0', 'width':'100%', 'height':$('#TitleTable').height()+$('#ContentTable').height()});
				$('#ViewDiv').css({'top':($('#TitleTable').height()+$('#ContentTable').height())/2-200, 'left':$('body').width()/2-100, 'z-index':'100', 'width':'770', 'height':'700', 'position':'absolute'}).fadeIn(300);
				
				var LayerCon = "<iframe id='ScheduleView' src='<c:url value='/ScheduleView.do?ScheSeq="+ScheSeq+"&PerSabun="+PerSabun+"&CMD=${vo.CMD}&ScheType="+ScheType+"&EventType=View&ParentPage=Cal'/>' frameborder='0' width='100%' height='100%' style='border-radius:10px;'/>";
			    $('#ViewDiv').html(LayerCon);
				
// 				$('<div id="BackDiv" onclick="LayerClose(\'View\');"></div>').css('opacity',0.3).appendTo('body');
// 				$('#BackDiv').css('top', document.body.scrollTop);
// 				$('#ViewDiv').css({'left':'50%', 'z-index':'100', 'width':'770', 'height':'700'}).fadeIn(300);
				
// 				var LayerCon = "<br/><iframe id='ScheduleView' src='<c:url value='/ScheduleView.do?ScheSeq="+ScheSeq+"&PerSabun="+PerSabun+"&CMD=${vo.CMD}&ScheType="+ScheType+"&EventType=View&ParentPage=List'/>' frameborder='0' width='100%' height='100%'/>";
// 			    $('#ViewDiv').html(LayerCon);
// 			    var ViewDivTop = (screen.height - $('#ViewDiv').css('height').replace('px', '')) / 2 + 150;
// 			    $('#ViewDiv').css('top', document.body.scrollTop + ViewDivTop).css('left', '50%');
// 				$("body").css("overflow","hidden");
			}
			
			// 레이어 닫기
			function LayerClose(flag) {
				if(flag == 'View') {
					$("#BackDiv").remove();
					$("#ViewDiv").hide();
				}
				else {
					if(confirm("이 페이지에서 나가면 작성하던 내용들은 저장되지 않습니다.\n정말 나가겠습니까?")) {
						$("#BackDiv").remove();
						$("#ViewDiv").hide();
					}
				}
// 				$('body').height(BaseHeight);
// 				$("body").css("overflow","auto");
			}
			
			// 일정 리스트 불러오기
			function ScheduleAlarmList() {
				Month = '${dateVO.selMonth}';
				if(Month.length == 1) Month = "0" + Month;
				SearchSDate = ${dateVO.selYear} + "-" + Month + "-01";
				SearchEDate = ${dateVO.selYear} + "-" + Month + "-" + ${dateVO.endDay};
				var URL = "<c:url value='/ScheduleAlarmList.do?EventType=Pop&SearchSDate="+SearchSDate+"&SearchEDate="+SearchEDate+"'/>";
				window.open(URL, 'ScheduleList', 'width=510, height=600, scrollbars=no');
			}
			
			// 일정 달력으로 보기
			function ScheduleCal() {
				$('#ScheduleList').attr('action', "<c:url value='/ScheduleCal.do'/>").submit();
			}
			
		</script>
	</head>
	<body>
	<form name="ScheduleList" id="ScheduleList" action="<c:url value='/ScheduleList.do'/>" method="post">
	<input type="hidden" name="InfoMessage"		id="InfoMessage">
	<input type="hidden" name="message"			id="message"		value="${message}">
	<input type="hidden" name="CMD"				id="CMD"			value="${vo.CMD}"/>
	<input type="hidden" name="SelDate"			id="SelDate"/>
	<input type="hidden" name="ScheSDate"		id="ScheSDate"/>
	<input type="hidden" name="PerSabun"		id="PerSabun"		value="${vo.perSabun}"/>
	<input type="hidden" name="RegPerSabun"		id="RegPerSabun"	value="${loginVO.regPerSabun}"/>
	<input type="hidden" name="SelYear" 		id="SelYear"		value="${dateVO.selYear}"/>
	<input type="hidden" name="SelMonth" 		id="SelMonth"		value="${dateVO.selMonth}"/>
	<input type="hidden" name="ScheGubun" 		id="ScheGubun"		value="${vo.scheGubun}"/>
	<input type="hidden" name="ScheType" 		id="ScheType"		value="${vo.scheType}"/>
	<input type="hidden" name="SearchPerSabun"	id="SearchPerSabun"	value="${vo.searchPerSabun}"/>
	<div id="ViewDiv" style="display:none;border-radius:10px;border:5px solid #DADADA;"></div>
	<div id="TitleTable" class="FixTable">
	<table class="subtable table_width" border="0" cellpadding="0" cellspacing="0" style="width:970px;">
		<tbody>
		<tr>
			<!-- <td class="head" style="padding-left:10px;">
				<a href="javascript:ScheduleTypeSearchEnd('AllType');" id="AllType" class="btn_lite_gray_small">전체보기</a>
				
				<a href="javascript:ScheduleTypeSearchEnd('Invest');" id="Invest" class="btn_lite_gray_small">투자</a>
				<a href="javascript:ScheduleTypeSearchEnd('Notice');" id="Notice" class="btn_lite_gray_small">알림(공지)</a>				
				<a href="javascript:ScheduleTypeSearchEnd('Schedule');" id="Schedule" class="btn_lite_gray_small">일정</a>
				<a href="javascript:ScheduleTypeSearchEnd('Mt_inside');" id="Mt_inside" class="btn_lite_gray_small"">회의</a>
				<a href="javascript:ScheduleTypeSearchEnd('Private');" id="Private" class="btn_lite_gray_small">개인메모</a>
				<a href="javascript:ScheduleTypeSearchEnd('Holiday');" id="Holiday" class="btn_lite_gray_small">휴가</a>
				<div style="margin:5px;"></div>
				<a href="javascript:ScheduleTypeSearchEnd('IR');" id="IR" class="btn_lite_gray_small">IR</a>
				<a href="javascript:ScheduleTypeSearchEnd('Visit');" id="Visit" class="btn_lite_gray_small">탐방</a>
				<a href="javascript:ScheduleTypeSearchEnd('Meet');" id="Meet" class="btn_lite_gray_small">미팅</a>
				<a href="javascript:ScheduleTypeSearchEnd('Mt_lunch');" id="Mt_lunch" class="btn_lite_gray_small">점심미팅</a>
				<a href="javascript:ScheduleTypeSearchEnd('Mt_dinner');" id="Mt_dinner" class="btn_lite_gray_small">저녁미팅</a>				
				<a href="javascript:ScheduleTypeSearchEnd('Inspect');" id="Inspect" class="btn_lite_gray_small">실사</a>
				<a href="javascript:ScheduleTypeSearchEnd('Mediate');" id="Mediate" class="btn_lite_gray_small">중개</a>
				<a href="javascript:ScheduleTypeSearchEnd('Manage');" id="Manage" class="btn_lite_gray_small">관리</a>
				<a href="javascript:ScheduleTypeSearchEnd('BusiTrip');" id="BusiTrip" class="btn_lite_gray_small">출장</a>
			</td>	 -->
			<td  class="head" > 	
				<span style="display:inline-block;width:10px;">&nbsp;</span>
				<a href="javascript:Move_Cal('${dateVO.preYear}', '${dateVO.preMonth}');" class="Btn" name="Silver">◀</a>
				<c:set var="year" value="2013"/>
				<select class="input_box" onchange="Move_Year(this.value);">
					<c:forEach begin="${year}" end="${MaxYear - 1}" step="1" varStatus="status">
						<c:choose>
							<c:when test="${year == dateVO.selYear}"><c:set var="sel" value="selected"/></c:when>
							<c:otherwise><c:set var="sel" value=""/></c:otherwise>
						</c:choose>
						<option value="${year}" ${sel}>${year}</option>
						<c:set var="year" value="${year + 1}"/>x
					</c:forEach>
				</select><font style="font-size:9pt;">년</font> 
				<select class="input_box" id="Month" onchange="Move_Month(this.value);">
					<c:forEach var="data" begin="1" end="12" step="1" varStatus="status" >
						<c:choose>
							<c:when test="${status.count == dateVO.selMonth}"><option value="${status.count}" selected>${status.count}</option></c:when>
							<c:otherwise><option value="${status.count}">${status.count}</option></c:otherwise>
						</c:choose>
					</c:forEach>
				</select><font style="font-size:9pt;">월</font>
				<a href="javascript:Move_Cal('${dateVO.nextYear}', '${dateVO.nextMonth}');" class="Btn" name="Silver">▶</a>
				<span style="display:inline-block;width:250px;">&nbsp;</span>
			</td>
			<td  class="head" >	
				<a href="javascript:ScheduleCal();" class="btn_orange">달력으로보기</a>
			</td>
		</tr>
		<tr id="header_tr_pc">
			<td colspan="3">
			<table class="form3" border="0" cellpadding="0" cellspacing="0">
				<tr class="Text_C Click">
					<td class="grid_title" style="width:130px;">일자</td>
					<td class="grid_title" style="width:80px;">작성자</td>
					<td class="grid_title" style="width:60px;">분류</td>
					<td class="grid_title" style="width:300px;">일정제목</td>
					<td class="grid_title" style="width:100px;">장소</td>
					<td class="grid_title" style="width:220px;">내용</td>
					<td class="grid_title" style="width:80px;">중요도</td>
				</tr>
			</table>
			</td>
		</tr>
		</tbody>
	</table>
	</div>
	<div id="PaddingTable">
	<div id="ContentTable" class="ConTable" onscroll="TableScrolling();">
	<table class="form3_noline" align="left" border="0" cellpadding="0" cellspacing="0" style="width:970px;">
		<tr id="header_tr_mobile" style="display:none;">
			<td colspan="2">
			<table class="form3" border="0" cellpadding="0" cellspacing="0">
				<tr class="Text_C Click">
					<td class="grid_title" style="width:130px;">일자</td>
					<td class="grid_title" style="width:80px;">작성자</td>
					<td class="grid_title" style="width:60px;">분류</td>
					<td class="grid_title" style="width:300px;">일정제목</td>
					<td class="grid_title" style="width:100px;">장소</td>
					<td class="grid_title" style="width:220px;">내용</td>
					<td class="grid_title" style="width:80px;">중요도</td>
				</tr>
			</table>
			</td>
		</tr>
		
		<c:forEach var="result" items="${Calendar}" varStatus="status">
		<c:choose>
			<c:when test="${dateVO.nowYear == dateVO.selYear && dateVO.nowMonth == dateVO.selMonth && status.count == dateVO.selDay}">
				<c:set var="TodayColor" value="bgcolor=\"#DDFFFF\""/>
			</c:when>
			<c:otherwise><c:set var="TodayColor" value="bgcolor=\"#FFFFFF\""/></c:otherwise>
		</c:choose>
		<tr class="Click" ${TodayColor}>
			<c:choose>
				<c:when test="${result.calnm eq '일'}"><c:set var="font" value="color:#FF0000;"/></c:when>
				<c:when test="${result.calnm eq '토'}"><c:set var="font" value="color:#0000FF;"/></c:when>
				<c:otherwise><c:set var="font" value="color:#000000;"/></c:otherwise>
			</c:choose>
			<c:if test="${result.holiflag eq 'Y' || (result.calyear eq 2015 && result.calmonth eq 8 && result.calday eq 14)}"><c:set var="font" value="color:#FF0000;"/></c:if>
			<td class="grid_input_BR Text_C" style="width:129px;border-bottom:2px solid #000000;${font}"  onclick="ScheAdd('${result.calday}');">
				<div id="Date${result.caldate}"></div>
			</td>
			<td class="grid_input_BR" style="width:839px;">
				<div id="Con${result.caldate}"></div>
			</td>
		</tr>
		</c:forEach>
	</table>
	</div>
	</div>
	</form>
	</body>
</html>