<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Synergy Partners</title>
		<link href="<c:url value='/css/sp/synergy.css?ver=0.1'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sp/new_btn.css?ver=0.1'/>" rel="stylesheet" type="text/css">
		<script type="text/javaScript" src="js/sp/synergy_util.js?ver=0.1"></script>
		<script type="text/javaScript" src="js/sp/jquery-1.8.2.min.js"></script>
		
		<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
		<%@ include file="/includeAxisj.jsp" %>
		<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 
				
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
			
			.ellipsis {
				widht:250px;
				display:inline-block;
				text-overflow:ellipsis;
				overflow:hidden;
				white-space:nowrap;
			}
			
			.btn.s:not(.glass), .btn.s:not(.glass) a, .btn.s:not(.glass) input {
			    height: 20px;
			    line-height: 19px;
			}
			.btn.red{
			    color: #fff;
			    background-image: url(./images/cssbtn/buttonRed.gif);
			    width:30px;
			    cursor:pointer;
			}
			.btn.s a, .btn.s input {
			    padding: 0 6px 13px; 4px;
			    font-size: 11px;
			    background-position: right -106px;
			}
			
		</style>
		<script type="text/javaScript" language="javascript">
			
			top.document.title = "일정관리";
			var BaseHeight;
			$(document).ready(function () {
				$(window).load(function() {
					
					
					InfoMessageView();
					$('#Parent', parent.left.myInfo).val('ScheduleCal');
					$('#ContactLoc').val($('#ContactLoc', parent.document).val());
					if('${fn:length(ScheList)}' > 0) SetSche();
					
					$('.ellipsis').css('width', (document.body.clientWidth - 50) / 7);
					$('td[name=Caltitle]').css('width', (document.body.clientWidth - 50) / 7);
					BaseHeight = $('body').height();
					BtnSet();
					
					
					if( '${googlelinkflag}' == 'true' ){						
						//toast.push('CAUTION','성공!!');
					}else if( '${googlelinkflag}' == 'false' ){
						//toast.push('CAUTION','구글캘린더 연동에 실패하였습니다. 캘린더 설정을 확인하세요.');
						//toast.push({body:'구글캘린더 연동에 실패하였습니다. 캘린더 설정을 확인하세요.', type:'Caution'});
					}
					
					
					
					var UserAgent = navigator.userAgent;
					if(UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null)
					{
						parent.leftIframeOFF();
						$('#srch_type').hide();
						//location.href = "<c:url value='/MbTodaySchedule.do'/>";
						//return;
						
						$('.ellipsis').css('width', '150px');
						$('td[name=Caltitle]').css('width', '150px');
					}
					
				});
			});
			
			// 일정 분류 검색 완료
			function ScheduleTypeSearchEnd(ScheType) {
				$('#ScheType').val(ScheType);
				$('#ScheSDate').val("");
				$('#ScheduleCal').attr('target', '_self').attr('action', "<c:url value='/ScheduleCal.do'/>").submit();
			}
			
			// 연도 변경
			function Move_Year(Year) {
				$('#SelYear').val(Year);
				$('#ScheSDate').val("");
				$('#ScheduleCal').attr('target', '_self').attr('action', "<c:url value='/ScheduleCal.do'/>").submit();
			}
			
			// 달력이동
			function Move_Cal(Year, Month) {
				$('#SelYear').val(Year);
				$('#SelMonth').val(Month);
				$('#ScheSDate').val("");
				$('#ScheduleCal').attr('target', '_self').attr('action', "<c:url value='/ScheduleCal.do'/>").submit();
			}
			
			// 월변경
			function Move_Month(Month) {
				$('#SelMonth').val(Month);
				$('#ScheSDate').val("");
				$('#ScheduleCal').attr('target', '_self').attr('action', "<c:url value='/ScheduleCal.do'/>").submit();
			}

			// 일정셋팅
			function SetSche() {
				var PerSabun = '', Date = '', OldDate = '', ScheCon = '', Cnt = 0, ScheImportant = "", ScheColor = "", FontStyle = "", CellOver = "", ScheTime = "", Con = "", CalDayTmp = "", OldBirthNm = "";
// 				$('#'+'${vo.scheGubun}').attr("class", "button btn_Orange");
// 				$('#'+'${vo.scheType}').attr("class", "button btn_Violet");
				
				$('#'+'${vo.scheType}').attr('class', 'btn_orange_small');
				
				<c:forEach var="result" items="${ScheList}" varStatus="status">
					PerSabun = '${result.persabun}';
					Date = '${result.schesday}';
					ScheTime = '${result.viewtime}';
					if(ScheTime == 'A') ScheTime = '';
					if(Date != '' && Date.substring(0, 1) == 0) Date = Date.substring(1);
					
					if(CalDayTmp != "${result.calday}") Con = "${result.calday}";
					if('${result.holiflag}' == 'Y' && CalDayTmp != "${result.calday}" || ('${result.calyear}' == '2015' && '${result.calmonth}' == '8' && '${result.calday}' == '14')) {	// 공휴일이면..
						$('#'+'${result.calday}').attr('style', 'padding-left:5px;color:red;');
						if('${result.holiname}' != '') Con += " <span style=\"color:black;font-size:9pt;\">"+' ${result.holiname}'+"</span>";
						if('${result.calyear}' == '2015' && '${result.calmonth}' == '8' && '${result.calday}' == '14') Con += " <span style=\"color:black;font-size:9pt;\">임시공휴일</span>";
					}

					if('${loginVO.regPerSabun}' == '201509001' && '${result.birthnm}' != '' && '${result.birthnm}' != OldBirthNm) {	// 생일자 정보가 있으면..
						var BirthNm = '${result.birthnm}';
						for(var oOo = 0; oOo < BirthNm.split(',').length; oOo++) {
							Con += "<br><span style=\"padding-left:10px;font-weight:bold;color:black;font-size:9pt;\"><img src='/SynergyCus/images/sp/crown.png' border='0'> "+ BirthNm.split(',')[oOo] +" 생일</span>";
						}
						$('#'+'${result.calday}').html(Con);
						OldBirthNm = '${result.birthnm}';
					}
					else $('#'+'${result.calday}').html(Con);
					
					if('${result.schetype}' == 'IR') ScheColor = "#FFFF00";
					else if('${result.schetype}' == 'Visit') ScheColor = "#00FF00";
					else if('${result.schetype}' == 'Invest') ScheColor = "#FF7575";
					else if('${result.schetype}' == 'IB') ScheColor = "#FFF7D9";
					else ScheColor = "";
					
					ScheImportant = '${result.scheimportant}';	// 일정 중요도
					if(ScheImportant == 'top') FontStyle = "color:#FF0080;font-weight:bold;";
					else FontStyle = "color:#000000;";
					
					if(ScheColor == '' && '${result.mysche}' == 'My' && $('#SearchPerSabun').val().search($('#RegPerSabun').val()) > -1) {	// 내일정 구분
						FontStyle += "font-weight:bold;";
						ScheColor = "#ECD9FF";
						if('${result.schepublicflag}' == 'N') ScheColor = "#F69C68";	// 비공개 내일정
					}
					
					
					
					reTitle${status.count} = '${result.schetitle}';
					reTitle${status.count} = reTitle${status.count}.replace(/\s\|A?[0-9]+\|/gi, '');	//회사코드 제거
					reTitle${status.count} = reTitle${status.count}.replace(/\s\([0-9]+\)/gi, ' ');		//인물id sequence 제거
					reTitle${status.count} = reTitle${status.count}.replace(/\/\sM&A\s\//gi, '<span style="font-size:11px;font-weight:bold;">M&A</span>');		//M&A여부 폰트변경		
					
					
					CellOver = "bgcolor=\""+ScheColor+"\" onmouseover=\"this.style.background='#FFDD21';CreateLayer2('EntryView', reTitle${status.count}, '${result.entrynm}');\" onmousemove=\"MoveLayer2('EntryView');\" onmouseout=\"this.style.background='"+ScheColor+"';RemoveLayer2('EntryView');\"";
					if('${result.schepublicflag}' == 'N') CellOver = "onmouseover=\"this.style.background='#FFDD21';\" onmouseout=\"this.style.background='"+ScheColor+"';\"";
					
					if(OldDate != Date) {
						ScheCon = "<span name=\""+PerSabun+"\" style=\"background-color:"+ScheColor+";\"><a href=\"javascript:ScheView('${result.persabun}', '${result.scheseq}', '${result.schetype}', '', '${result.grpCd}');\" "+CellOver+"><font style=\""+FontStyle+"\">"+ScheTime+" "+ reTitle${status.count} + "</font></a></span>";
						Cnt = 0;
					}
					else {
						if(Cnt < 4) ScheCon += "<br/>" + "<span name=\""+PerSabun+"\" style=\"background-color:"+ScheColor+";\"><a href=\"javascript:ScheView('${result.persabun}', '${result.scheseq}', '${result.schetype}', '', '${result.grpCd}');\" "+CellOver+"><font style=\""+FontStyle+"\">"+ScheTime+" " + reTitle${status.count} + "</font></a></span>";
						else $('#MoreView'+Date).show();
						Cnt++;
					}
					$('#ScheView'+Date).html(ScheCon);
					OldDate = Date;
					CalDayTmp = "${result.calday}";
				</c:forEach>
			}
			
			// 다음달 일정셋팅
			function SetNextSche(MaxDay) {
				var PerSabun = '', Date = '', OldDate = '', ScheCon = '', Cnt = 0, ScheImportant = "", ScheColor = "", FontStyle = "", CellOver = "", ScheTime = "";
				<c:forEach var="result" items="${NextScheList}" varStatus="status">
					Date = '${result.schesday}';	
					if(Date < MaxDay) {
						PerSabun = '${result.persabun}';
						ScheTime = '${result.viewtime}';
						if(ScheTime == 'A') ScheTime = '';
						if(Date != '' && Date.substring(0, 1) == 0) Date = Date.substring(1);
						
						if('${result.holiflag}' == 'Y') {
							$('#Next'+'${result.calday}').attr('style', 'padding-left:5px;color:red;');
							if('${result.holiname}' != '') $('#Next'+'${result.calday}').html('${result.calday} ' + "<span style=\"color:black;font-size:9pt;\">"+' ${result.holiname}'+"</span>");
						}
						
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
		
						CellOver = "bgcolor=\""+ScheColor+"\" onmouseover=\"this.style.background='#FFDD21';CreateLayer2('EntryView', '${result.schetitle}', '${result.entrynm}');\" onmousemove=\"MoveLayer2('EntryView');\" onmouseout=\"this.style.background='"+ScheColor+"';RemoveLayer2('EntryView');\"";
						if(OldDate != Date) {
							ScheCon = "<span name=\""+PerSabun+"\" style=\"background-color:"+ScheColor+";\"><a href=\"javascript:ScheView('${result.persabun}', '${result.scheseq}', '${result.schetype}', 'next', '${result.grpCd}');\" "+CellOver+"><font style=\""+FontStyle+"\">"+ScheTime+" ${result.schetitle}</font></a></span>";
							Cnt = 0;
						}
						else {
							if(Cnt < 4) ScheCon += "<br/>" + "<span name=\""+PerSabun+"\" style=\"background-color:"+ScheColor+";\"><a href=\"javascript:ScheView('${result.persabun}', '${result.scheseq}', '${result.schetype}', 'next', '${result.grpCd}');\" "+CellOver+"><font style=\""+FontStyle+"\">"+ScheTime+" ${result.schetitle}</font></a></span>";
							else $('#NextMoreView'+Date).show();
							Cnt++;
						}
						$('#NextScheView'+Date).html(ScheCon);
						OldDate = Date;
					}
				</c:forEach>
			}
			
			// 일정 등록
			function ScheAdd(SelDay) {
				$('body').height('900');
				$('<div id="BackDiv" onclick="LayerClose();"></div>').css('opacity',0.3).appendTo('body');
				$('#BackDiv').css({'top':'0', 'width':'100%', 'height':'900'});
				$('#ViewDiv').css({'top':$('body').height()/2-140, 'left':700, 'z-index':'100', 'width':'770', 'height':'820', 'position':'absolute'}).fadeIn(300);
				
				Month = $('#SelMonth').val();
				if(Month.length == 1) Month = "0" + Month;
				if(SelDay.length == 1) SelDay = "0" + SelDay;
				SelDate = $('#SelYear').val() + "-" + Month + "-" + SelDay;
				$('#ScheSDate').val(SelDate);
				$('#SelDate').val(SelDate);
				
			    var LayerCon = "<iframe id='ScheduleProc' src='<c:url value='/ScheduleProc.do?CMD=${vo.CMD}&EventType=Add&ParentPage=Cal&ScheSDate="+SelDate+"'/>' frameborder='0' width='100%' height='100%' scrolling='yes' style='border-radius:10px;'/>";
			    $('#ViewDiv').html(LayerCon);
// 			    $("body").css("overflow","hidden");
			}
			
			// 일정 상세보기
			function ScheView(PerSabun, ScheSeq, ScheType, Flag, grpCd) {
				if(Flag == 'next') {
					$('body').height('900');
					$('<div id="BackDiv" onclick="LayerClose(\'View\');"></div>').css('opacity',0.3).appendTo('body');
					$('#BackDiv').css({'top':'0', 'width':'100%', 'height':'900'});
				}
				$('#ViewDiv').css({'top':$('body').height()/2-100, 'left':700, 'z-index':'100', 'width':'770', 'height':'730', 'position':'absolute'}).fadeIn(300);
				
				var LayerCon = "<iframe id='ScheduleView' src='<c:url value='/ScheduleView.do?ScheSeq="+ScheSeq+"&PerSabun="+PerSabun+"&CMD=${vo.CMD}&ScheType="+ScheType+"&grpCd="+grpCd+"&EventType=View&ParentPage=Cal'/>' frameborder='0' width='100%' height='100%' style='border-radius:10px;'/>";
			    $('#ViewDiv').html(LayerCon);
// 			    $("body").css("overflow","hidden");
			}
			
			// 레이어 닫기
			function LayerClose(flag) {
				if(flag == 'View') {
					$("#BackDiv").remove();
					$("#ViewDiv").hide();
				} else {
					//if(confirm("이 페이지에서 나가면 작성하던 내용들은 저장되지 않습니다.\n정말 나가겠습니까?")) {
						$("#BackDiv").remove();
						$("#ViewDiv").hide();
					//}
				}
				$('body').height(BaseHeight);
//  				$("body").css("overflow","auto");
			}
			
			// 일정 리스트 불러오기
			function OnlyScheduleList() {
				Month = '${dateVO.selMonth}';
				if(Month.length == 1) Month = "0" + Month;
				
				SearchSDate = ${dateVO.selYear} + "-" + Month + "-01";
				SearchEDate = ${dateVO.selYear} + "-" + Month + "-" + ${dateVO.endDay};
				var URL = "<c:url value='/ScheduleAlarmList.do?ScheGubun=${vo.scheGubun}&SearchSDate="+SearchSDate+"&SearchEDate="+SearchEDate+"'/>";
				window.open(URL, 'ScheduleList', 'width=510, height=600, scrollbars=no');
			}
			
			// 특정일자 일정 리스트 모두 보기
			function SelDateScheduleList(SelYear, SelMonth, SelDay) {
				if(SelMonth.length == 1) SelMonth = "0" + SelMonth;
				if(SelDay.length == 1) SelDay = "0" + SelDay;
				ScheSDate = SelYear + "-" + SelMonth + "-" + SelDay;
				
				$('#SelYear').val(SelYear);
				$('#SelMonth').val(SelMonth);
				$('#SelDay').val(SelDay);
				$('#ScheSDate').val(ScheSDate);
				window.open('', 'ScheduleMoreList', 'width=750, height=600, scrollbars=no');
				
				$('#ScheduleCal').attr('target', 'ScheduleMoreList').attr('action', "<c:url value='/ScheduleMoreList.do'/>").submit();
			}
			
			// 일정 리스트로 보기
			function ScheduleList() {
				$('#ScheSDate').val("");
				$('#ScheduleCal').attr('target', '_self').attr('action', "<c:url value='/ScheduleList.do'/>").submit();
			}
			
			// 달력 생성
			function MakeCalendar() {
				$('#ScheSDate').val("");
				$('#ScheduleCal').attr('action', "<c:url value='/MakeCalendar.do'/>").submit();
			}
			
			// 문자 알람리스트
			function SMSList() {
				$('#ScheSDate').val("");
				$('#ScheduleCal').attr('action', "<c:url value='/ScheduleSMSList.do'/>").submit();
			}
			
			//왼쪽메뉴 보기,숨기기
			function hideView(th){
				var dsp = parent.dispLeft()
					,arrow = $(th).children();
				if(dsp==''||dsp=='block'){
					parent.leftIframeOFF();
				}else{
					parent.leftIframeON();
				}
			}
			
		</script>
	</head>
	<body>
	<form name="ScheduleCal" id="ScheduleCal" method="post">
	<input type="hidden" name="message"			id="message"		value="${message}"/>
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
	<input type="hidden" name="ContactLoc"		id="ContactLoc"/>
	<input type="hidden" name="ScheSYear"		id="ScheSYear"/>
	<input type="hidden" name="ScheSMonth"		id="ScheSMonth"/>
	<input type="hidden" name="ScheSDay"		id="ScheSDay"/>
	<input type="hidden" name="grpCd"		    id="grpCd"          value="${vo.grpCd}"/>
	<div id="ViewDiv" style="display:none;border-radius:10px;border:5px solid #DADADA;"></div>
	
	<span class="btn s red" onclick="javscript:hideView(this);" style="color:white;"><a>◀▶</a></span>
	
	<table class="subtable" cellpadding="0" cellspacing="0" style="padding-left:10px;width:1000px;">		
		<tr>
			<td class="head Text_L" colspan="2" id="srch_type">
				
				
				<a href="javascript:ScheduleTypeSearchEnd('AllType');" id="AllType" class="btn_lite_gray_small">전체보기</a>
				
				<a href="javascript:ScheduleTypeSearchEnd('Invest');" id="Invest" class="btn_lite_gray_small">투자</a>
				<a href="javascript:ScheduleTypeSearchEnd('Notice');" id="Notice" class="btn_lite_gray_small">알림(공지)</a>				
				<a href="javascript:ScheduleTypeSearchEnd('Schedule');" id="Schedule" class="btn_lite_gray_small">일정</a>
				<a href="javascript:ScheduleTypeSearchEnd('Mt_inside');" id="Mt_inside" class="btn_lite_gray_small">회의</a>
				<a href="javascript:ScheduleTypeSearchEnd('Private');" id="Private" class="btn_lite_gray_small">개인메모</a>
				<a href="javascript:ScheduleTypeSearchEnd('Holiday');" id="Holiday" class="btn_lite_gray_small">휴가</a>
				<div style="margin-top:5px;"></div>
				<a href="javascript:ScheduleTypeSearchEnd('IR');" id="IR" class="btn_lite_gray_small">IR</a>
				<a href="javascript:ScheduleTypeSearchEnd('Visit');" id="Visit" class="btn_lite_gray_small">탐방</a>
				<a href="javascript:ScheduleTypeSearchEnd('Meet');" id="Meet" class="btn_lite_gray_small">미팅</a>
				<a href="javascript:ScheduleTypeSearchEnd('Mt_lunch');" id="Mt_lunch" class="btn_lite_gray_small">점심미팅</a>
				<a href="javascript:ScheduleTypeSearchEnd('Mt_dinner');" id="Mt_dinner" class="btn_lite_gray_small">저녁미팅</a>				
				<a href="javascript:ScheduleTypeSearchEnd('Inspect');" id="Inspect" class="btn_lite_gray_small">실사</a>
				<a href="javascript:ScheduleTypeSearchEnd('Mediate');" id="Mediate" class="btn_lite_gray_small">중개</a>
				<a href="javascript:ScheduleTypeSearchEnd('Manage');" id="Manage" class="btn_lite_gray_small">관리</a>
				<a href="javascript:ScheduleTypeSearchEnd('BusiTrip');" id="BusiTrip" class="btn_lite_gray_small">출장</a>
				
							
				
<!-- 				<a href="javascript:#;" class="Btn" name="Green">분류색인</a> -->
			</td>
			<td class="head Text_C" colspan="3">
				<a href="javascript:Move_Cal('${dateVO.preYear}', '${dateVO.preMonth}');" class="Btn" name="Silver">◀</a>
				<c:set var="year" value="2013"/>
				<select class="input_box" onchange="Move_Year(this.value);">
					<c:forEach begin="${year}" end="${MaxYear - 1}" step="1" varStatus="status">
						<c:choose>
							<c:when test="${year == dateVO.selYear}"><c:set var="sel" value="selected"/></c:when>
							<c:otherwise><c:set var="sel" value=""/></c:otherwise>
						</c:choose>
						<option value="${year}" ${sel}>${year}</option>
						<c:set var="year" value="${year + 1}"/>
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
			</td>
			<td class="head Text_R" colspan="2">
				<a href="javascript:ScheduleList();" class="btn_orange">리스트보기</a>
				<c:if test="${loginVO.regPerSabun eq '201509001' || loginVO.regPerSabun eq '201504001' }">
					<a href="javascript:MakeCalendar();" class="btn_purple">달력생성</a>
					<a href="javascript:SMSList();" class="btn_purple">문자알람</a>
				</c:if>
			</td>
		</tr>
		<tr><td colspan="7">&nbsp;</td></tr>
		<fmt:parseNumber var="width" value="${100/7}%" integerOnly="true"/>
		<tr class="Text_BC" bgcolor="#F5F5F5" style="height:40px;font-size:13pt;">
			<td class="input_BR input_T" name="Caltitle"><font color="red">일</font></td>
			<td class="input_BR input_T" name="Caltitle">월</td>
			<td class="input_BR input_T" name="Caltitle">화</td>
			<td class="input_BR input_T" name="Caltitle">수</td>
			<td class="input_BR input_T" name="Caltitle">목</td>
			<td class="input_BR input_T" name="Caltitle">금</td>
			<td class="input_B input_T" name="Caltitle"><font color="blue">토</font></td>
		</tr>
		<c:set var="WeekSeq" value="0"/>
		<tr style="height:100px;font-size:13pt;">
			<c:forEach var="data" begin="1" end="${dateVO.startPosition - 1}" step="1" varStatus="status" > 
				<td class="input_BR">&nbsp;</td>
				<c:set var="WeekSeq" value="${WeekSeq + 1}"/>
			</c:forEach>
			<c:forEach var="data" begin="1" end="${dateVO.endDay}" step="1" varStatus="status" >
				<c:set var="Event" value="onclick=\"if(event.srcElement.id != 'MoreView${status.count}') ScheAdd('${status.count}');\" style=\"cursor:pointer;\""/>
				<c:set var="MoreOver" value="onmouseover=\"this.style.background='#F0F0F0';\" onmouseout=\"this.style.background='#DDFFFF';\""/>
				<c:choose>
					<c:when test="${WeekSeq == 0}"><c:set var="FontColor" value="red"/></c:when>
					<c:when test="${WeekSeq == 6}"><c:set var="FontColor" value="blue"/></c:when>
					<c:otherwise><c:set var="FontColor" value="black"/></c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${dateVO.nowYear == dateVO.selYear && dateVO.nowMonth == dateVO.selMonth && status.count == dateVO.selDay}">
						<c:set var="TodayColor" value="bgcolor=\"#DDFFFF\""/>
					</c:when>
					<c:otherwise>
						<c:set var="TodayColor" value=""/>
					</c:otherwise>
				</c:choose>
				<td class="input_BR" ${TodayColor} ${Event}>
					<span id="${status.count}" class="Text_L" style="float:left;color:${FontColor};">${status.count}</span>
					<div class="Text_R">
						<a id="MoreView${status.count}" href="javascript:#;" style="display:none;font-weight:bold;color:#0000FF;" ${MoreOver} onmousedown="SelDateScheduleList('${dateVO.selYear}', '${dateVO.selMonth}', '${status.count}');">more</a>
					</div>
					<div class="ellipsis" id="ScheView${status.count}" style="height:80px;font-size:10pt;padding-left:3px;">&nbsp;</div>
				</td>
				
				<c:set var="WeekSeq" value="${WeekSeq + 1}"/>
				<c:if test="${WeekSeq == 7 && status.count != dateVO.endDay}">
				<c:set var="WeekSeq" value="0"/>
					</tr>
					<tr style="height:100px;font-size:13pt;">
				</c:if>
			</c:forEach>
			<c:if test="${WeekSeq == 7}">
			<c:set var="WeekSeq" value="0"/>
				</tr>
				<tr style="height:100px;font-size:13pt;">
			</c:if>
			<c:set var="NextDay" value="1"/>
			<c:forEach var="data" begin="1" end="${NextMonthEnd}" step="1" varStatus="status">
				<c:choose>
					<c:when test="${WeekSeq == 0}"><c:set var="FontColor" value="red"/></c:when>
					<c:when test="${WeekSeq == 6}"><c:set var="FontColor" value="blue"/></c:when>
					<c:otherwise><c:set var="FontColor" value="black"/></c:otherwise>
				</c:choose>
				<td class="input_BR" style="filter:alpha(opacity=50);opacity:.5">
					<span id="Next${status.count}" class="Text_L" style="float:left;color:${FontColor};">${NextDay}</span>
					<div class="Text_R">
						<a id="NextMoreView${status.count}" href="javascript:#;" style="display:none;font-weight:bold;color:#0000FF;" ${MoreOver} onmousedown="SelDateScheduleList('${dateVO.selYear}', '${dateVO.selMonth + 1}', '${status.count}');">more</a>
					</div>
					<div class="ellipsis" id="NextScheView${status.count}" style="height:80px;font-size:10pt;padding-left:3px;">&nbsp;</div>
				</td>
				<c:set var="NextDay" value="${NextDay + 1}"/>
				<c:set var="WeekSeq" value="${WeekSeq + 1}"/>
				
				<c:if test="${WeekSeq == 7 && status.count != NextMonthEnd}">
				<c:set var="WeekSeq" value="0"/>
					</tr>
					<tr style="height:100px;font-size:13pt;">
				</c:if>
			</c:forEach>
			<c:if test="${NextDay ne 1}">
				<script>SetNextSche(${NextDay});</script>
			</c:if>
		</tr>
	</table>
	</form>
	</body>
</html>