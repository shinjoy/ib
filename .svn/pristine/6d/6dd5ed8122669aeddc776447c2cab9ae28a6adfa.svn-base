<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Synergy Partners</title>
		<link href="<c:url value='/css/sp/synergy.css'/>" rel="stylesheet" type="text/css">
		<script src="js/sp/synergy_util.js"></script>
		<script src="js/sp/dateUtil.js"></script>	<!-- 20160129 -->
		<script src="js/sp/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="js/naver/js/HuskyEZCreator.js" charset="utf-8"></script>
		<script src="http://code.jquery.com/jquery-1.9.1.js"/></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"/></script>
		<script>var contextRoot="${pageContext.request.contextPath}";</script><!-- necessary! to import js files -->		
		<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- util folder -->
		<script type="text/javaScript" language="javascript">
			
			if('${vo.CMD}' == 'Add') top.document.title = "게시물등록";
			else top.document.title = "게시물수정";
			
			/* 
				중간승인자
				M&A팀(2) - 정안식(201407001)
				시스템기획팀(8) - 서상옥(201410001)
				IB투자(1), 기업분석(4) - 이명철(200908001)
				경영지원(3) - 임지연(201301001)
				모든부서 참조 - 임지연(201301001)
			*/
			var PerSabun = '', PerDept = '', MiddlePer = '';
			
			$(document).ready(function () {
				$(window).load(function() {
					//디비전 리스트 가져오기
					divisionList= getCodeInfo(null,null,null,null,null,null,"/common/getDivisionList.do",null);
					//참조인 전체선택 체크박스 세팅
			    	var htmlStr = '';
			    	for(var i=0;i<divisionList.length;i++){
			    		if(divisionList[i].divCode=='${userLoginInfo.division}'){
			    		//htmlStr += '<label><input type="checkbox" name="Consult" id="Consult" onclick="javascript:SelAll(this.name, ' + i + ', \'' + divisionList[i].divCode + '\');"/>';
			    		//htmlStr += divisionList[i].divName + '</label><br/>';
			    		htmlStr += '<label><input type="checkbox" name="Consult" id="Consult" onclick="javascript:SelAll(this.name);"/>';
			    		htmlStr +=  '전체선택</label><br/>';
			    		}
			    	}
					$('#divSelAll').html(htmlStr);		//참조인 전체선택 체크박스
					
					InfoMessageView();
					DataSet();
					
					$('#HalfDate').datepicker(DatePickerOpt).parent().children('img').css({'vertical-align':'middle', 'line-height':'23px', 'margin-left':'5px'});

					$('#HoliSDate').datepicker(S_DatePickerOpt).parent().children('img').css({'vertical-align':'middle', 'line-height':'23px', 'margin-left':'5px'});
					$('#HoliEDate').datepicker(E_DatePickerOpt).parent().children('img').css({'vertical-align':'middle', 'line-height':'23px', 'margin-left':'5px'});
					BtnSet();
					
					PerSabun = '${loginVO.regPerSabun}';
					PerDept = '${loginVO.perDept}';
					MiddlePer = '${loginVO.teamLeaderSabun}';
					// 중간승인자 설정
		
					$('input[name=MiddleAry]').each(function(index) {

						
						if(PerSabun != MiddlePer && this.value == MiddlePer) {
						
							$(this).attr('disabled', true).prop('checked', true);
							$('#MiddleDelAry'+(index+1)).val('N');
						} 
					});
					
					// 참조인 설정
					$('input[name=ConsultAry]').each(function(index) {
						$(this).prop('checked', true);
						$('#ConsultDelAry'+(index+1)).val('N');
						if(this.value == '200402001' || this.value == MiddlePer || this.value == PerSabun || this.value == '201301001') {
							$(this).attr('disabled', true);
						}
					}); 
				});
			});
			
			// 보고서게시판일시 중간승인자와 참조인 셋팅
			function DataSet() {
				if('${vo.CMD}' == 'Add') {
					//참조인 기본 전체선택
					for(var i=0;i<divisionList.length;i++){
						if(divisionList[i].divCode == '${userLoginInfo.division}'){
							//$($('input:checkbox[name=Consult]')[i]).attr("checked", true);
							//SelAll('Consult', i, divisionList[i].divCode);
							$('input:checkbox[name=Consult]').attr("checked", true);
							SelAll('Consult');
						}
					}
				}
				else {
					$('input:radio[name=HoliFlag]:input[value=${BoardInfo.holiFlag}]').attr("checked", true);
					$('input:radio[name=HalfFlag]:input[value=${BoardInfo.halfFlag}]').attr("checked", true);
					if('${BoardInfo.holiFlag}' == 'half') $('#HalfView').show();
					else $('#AllView').show();
				}
				if('${fn:length(BoardConfirmOptPerList)}' > 0) {
					var Cnt = 0, OptFlag = "";
					<c:forEach var="result" items="${BoardConfirmOptPerList}" varStatus="status">
						OptFlag = '${result.optflag}';
						DelFlag = '${result.delflag}';
						
						for(var oOo = 1; oOo < (Number($('#EmpCnt').val()) + 1); oOo++) {
							if($('#'+OptFlag+'Ary'+oOo).val() == '${result.persabun}' && DelFlag == 'N') {
								Cnt++;
								$('#'+OptFlag+'Ary'+oOo).attr("checked", true);
								$('#'+OptFlag+'DelAry'+oOo).val('${result.delflag}');
								if(Cnt == Number($('#EmpCnt').val())) $('#'+OptFlag).attr("checked", true);
							}
						}
					</c:forEach>
				}
				if('${vo.confirmProcFlag}' == 'Y' && $('#ConfirmPerSabun').val() != '') $('#ConfirmView').show();
				else $('#ConfirmView').hide();
			}
			
			// 반차/종일 설정
			function HoliView(val) {
				if(val == 'half') {
					$('#HalfView').show();
					$('#AllView').hide();
				}
				else {
					$('#HalfView').hide();
					$('#AllView').show();
					$("input[name=HalfFlag]").attr("checked", false);
				}
				$('#HoliUseDay').val('').attr('disabled', true);
				$('#HoliUseDayTmp').val('');
			}
			
			// 휴가기간 자동계산
			function HoliPeriodCalcu() {
				var HoliFlag = $('input:radio[name="HoliFlag"]:checked').val();
				
				if($('input:radio[name="HoliFlag"]:checked').val() == 'half') {
					if($('input:radio[name="HalfFlag"]:checked').val() == undefined) {
						alert('반차 구분을 설정하셔야 합니다.');
						return false;
					}
					HoliDaySetFlag(HoliFlag, '0.5');
				}
				else {
					$.ajax({
						type:"POST",
						url:"<c:url value='/HolidayPeriod.do'/>",
						data:{"HoliSDate":$('#HoliSDate').val(), "HoliEDate":$('#HoliEDate').val()},
						
						success:function(data) {
							HoliDaySetFlag(HoliFlag, data);
						},
						error:function(xhr, status, error) {
							alert('error');
						}
					});
				}
			}
			
			// 설정된 기간 확인
			function HoliDaySetFlag(HoliFlag, HoliUseDay) {
				var SDate = '', HalfFlag = '', EDate = '', HoliTitle = '', HoliCon = '', Con = '';
				
				var today = new Date().yyyy_mm_dd();	//오늘날짜
				var nowHour = new Date().getHours();	//현재시
				
				if(HoliFlag == 'half') {
					SDate = $('#HalfDate').val();
					HalfFlag = $('input:radio[name="HalfFlag"]:checked').val();
					if(HalfFlag == 'am') HoliCon = SDate + "(오전반차) [총 "+ HoliUseDay +" 일]";
					else HoliCon = SDate + "(오후반차) [총 "+ HoliUseDay +" 일]";
						
					HoliTitle = '[${loginVO.perNm}] ';
						
					if(SDate < today){
						HoliTitle += '사후반차 보고 드립니다.';
					}else if(SDate > today){
						HoliTitle += '반차 신청 합니다.';
					}else {	//SDate == today
						
						if(HalfFlag == 'am'){		//오전반차
							if(nowHour < 14){
								HoliTitle += '반차 신청 합니다.';
							}else{
								HoliTitle += '사후반차 보고 드립니다.';
							}
						}else{						//오후반차
							if(nowHour < 18){
								HoliTitle += '반차 신청 합니다.';
							}else{
								HoliTitle += '사후 반차 보고 드립니다.';
							}
						}
					}
					//HoliTitle = '[${loginVO.perNm}] 반차 신청 합니다.';
				}
				else {
					SDate = $('#HoliSDate').val();
					EDate = $('#HoliEDate').val();
					HoliCon = SDate + " ~ " + EDate + " [총 " + $.trim(HoliUseDay) + " 일]";
										
					//HoliTitle = '[${loginVO.perNm}] 휴가 신청 합니다.';
					HoliTitle = '[${loginVO.perNm}] ';
					if(EDate < today){
						HoliTitle += '사후 휴가 보고 드립니다.';
					}else{
						HoliTitle += '휴가 신청 합니다.';
					}
					
				}
				
				if(confirm('설정하신 휴가일정이 '+ HoliCon + ' 맞습니까?')) {
					if(HoliFlag == 'half') $('#HoliSDate').val(SDate);
					Con += "일시 : " + HoliCon +"\n";
					Con += "사유 : ";
					$('#WriteCon').val(Con);
					$('#HoliUseDay').val(HoliUseDay).attr('disabled', false);
					$('#HoliUseDayTmp').val(HoliUseDay);
					$('#WriteTitle').val(HoliTitle);
					$('#WriteTitle').focus();
				}
				else {
					alert('휴가 일정이 취소되었습니다. 다시 설정해 주세요.');
					$('#HalfDate').val('');		//날짜 리셋
					$('#HoliSDate').val('');	//날짜 리셋
					$('#HoliEDate').val('');	//날짜 리셋
					return false;
				}
			}
			
			// 휴가 사용일 수 직접 입력 체크
			function UseHolidayChk() {
				if($('#HoliUseDay').val() != $('#HoliUseDayTmp').val()) {
					SDate = $('#HoliSDate').val();
					EDate = $('#HoliEDate').val();
					HoliCon = SDate + " ~ " + EDate + " [총 " + $('#HoliUseDay').val() + " 일]";
					HoliTitle = '[${loginVO.perNm}] 휴가 신청 합니다.';
					
					if(confirm('입력하신 휴가 사용일수가 '+ $('#HoliUseDay').val() + '일 맞습니까?')) {
						Con = "일시 : " + HoliCon +"\n";
						Con += "사유 : ";
						$('#WriteCon').val(Con);
						$('#HoliUseDayTmp').val($('#HoliUseDay').val());
						$('#WriteTitle').val(HoliTitle);
						$('#WriteTitle').focus();
					}
					else {
						alert('휴가 일정이 취소되었습니다. 다시 설정해 주세요.');
						$('#WriteCon').val('');
						$('#HoliUseDay').val('');
						$('#HoliUseDayTmp').val('');
						$('#WriteTitle').val('');
						$('#HalfDate').val(GetToday());
						$('#HoliSDate').val(GetToday());
						$('#HoliEDate').val(GetToday());
						return false;
					}
				}
			}
			
			// 게시물 등록/수정 완료
			function BoardProcEnd() {
				if($('#WriteTitle').val() == '') {
					alert('제목을 입력하세요.');
					$('#WriteTitle').focus();
					return false;
				}
				if($('#HoliUseDay').val() == '') {
					alert('날짜를 입력하세요.');
					$('#HoliUseDay').focus();
					return false;
				}
				
				if($('#ConfirmProcFlag').val() == 'Y' && $('#ConfirmPerSabun').val() != '' && $('#OldWriteStatus').val() != 'return') {
					if(confirm('보고를 완료 하시겠습니까?')) $('#WriteStatus').val('ing');
					else $('#WriteStatus').val('write');
				}
				else $('#WriteStatus').val('end');
				
				if($('input:radio[name="HoliFlag"]:checked').val() == 'half') {
					$('#HoliEDate').val($('#HoliSDate').val());
				}
				
			    // 보고문일 경우
			    if($('#ConfirmProcFlag').val() == 'Y' && $('#ConfirmPerSabun').val() != '') {
			    	for(var oOo = 1; oOo < (Number($('#EmpCnt').val()) + 1); oOo++) {
			    		
			    		if($("#MiddleAry"+oOo).is(':checked')) $('#MiddleDelAry'+(oOo)).val('N');
						else $('#MiddleDelAry'+(oOo)).val('Y');
						
			    		if($('#ConfirmPerSabun').val() == $('#MiddlePerAry'+oOo).val()) {
			    			$('#MiddleSabunAry'+oOo).val($('#MiddlePerAry'+oOo).val());
							$('#MiddleDelFlagAry'+oOo).val('N');
							
			    		}
			    		else {
			    			$('#MiddleSabunAry'+oOo).val($('#MiddlePerAry'+oOo).val());
							$('#MiddleDelFlagAry'+oOo).val($('#MiddleDelAry'+oOo).val());
			    		}
			    		if($('#MiddleDelFlagAry'+oOo).val() == 'N') {
			    			$('#ConsultSabunAry'+oOo).val($('#ConsultPerAry'+oOo).val());
							$('#ConsultDelFlagAry'+oOo).val('N');
			    		}
			    		else {
			    			$('#ConsultSabunAry'+oOo).val($('#ConsultPerAry'+oOo).val());
							$('#ConsultDelFlagAry'+oOo).val($('#ConsultDelAry'+oOo).val());
			    		}
					}
			    }

				if($('#CMD').val() == 'Add') {
					//$('#CateCd').val($('#CateList').val());
					NowTime = replaceC(GetToday(), "-", "") + replaceC(GetNowTime("HhMiSs"), ":", "");
					//$('#SMSReserTime').val(NowTime);
					//$('#startTime').val($('#SMSReserTime').val());
					//$('#SMSContent').val('' + ' 으로부터 고객게시판에 게시물이 등록되었습니다.');
					//$('#contents').val($('#SMSContent').val());
					$('#InfoMessage').val("등록 완료 되었습니다.");
				}
				else {
					if(($('#OldWriteStatus').val() == 'return')) {
						$('#WriteStatus').val('ing');
						$('#InfoMessage').val("재기안 되었습니다.");
					}
					else $('#InfoMessage').val("수정 완료 되었습니다.");
				}
				if($('#PopFlag') == '') $('#HolidayProc').attr('target', 'content').attr('action', "<c:url value='/BoardProcEnd.do'/>").submit();
				else $('#HolidayProc').attr('target', '_parent').attr('action', "<c:url value='/BoardProcEnd.do'/>").submit();
				
				showLayer();
				if($('#CMD').val() == 'Add') {
					document.SMS.target="moashot";
					document.SMS.action="https://biz.moashot.com/EXT/URLASP/mssendUTF.asp";
					//document.SMS.submit();
				}
			}
			// 게시물 등록/수정취소
			function BoardProcCancel() {
				if($('#PopFlag').val() == '') {
					if($('#CMD').val() == 'Add') $('#HolidayProc').attr('action', "<c:url value='/BoardList.do'/>");
					else $('#HolidayProc').attr('action', "<c:url value='/BoardView.do'/>");
					$('#HolidayProc').attr('target', "mainFrame");
				}
				else {
					$('#HolidayProc').attr('action', "<c:url value='/BoardList.do'/>");
					$('#HolidayProc').attr('target', "_parent");
				}
				$('#HolidayProc').submit();
				//else $('#HolidayProc').attr('action', "<c:url value='/ReturnList.do'/>").attr('target', "_parent").submit();
			}	
			// 게시물 등록/수정취소
		/* 	function BoardProcCancel() {
				if($('#PopFlag').val() == '') {
					if($('#CMD').val() == 'Add') $('#HolidayProc').attr('target', 'content').attr('action', "<c:url value='/BoardList.do'/>").submit();
					else $('#HolidayProc').attr('target', 'content').attr('action', "<c:url value='/BoardView.do'/>").submit();
				}
				else $('#HolidayProc').attr('target', '_parent').attr('action', "<c:url value='/ReturnList.do'/>").submit();
			} */
			
			// 담당자 및 참조인 전체선택
		/* 	function SelAll(Obj, idx, divCd) {			//idx ... division list index ... 0:'SYNERGY', 1:'FIDES'		divCd...  'SYNERGY', 'FIDES'
				var All = $($('input:checkbox[name='+Obj+']')[idx]);
				var ChkList = $('input[name='+Obj+'Ary]');
				var DelList = $('input[name='+Obj+'DelAry]');
				
				if(!All.is(':checked')) {// 전체선택 체크박스가 해제되었다면
					for(var i=0; i<ChkList.length; i++) {
						if(ChkList[i].disabled || !$(ChkList[i]).hasClass(divCd)) continue;	// 모든 체크박스를 체크해제
						ChkList[i].checked = false;
						DelList[i].value = "Y";				//체크해제
					}
				}
				else { // 그게 아니라면
					for(var i=0; i<ChkList.length; i++) {
						if(!$(ChkList[i]).hasClass(divCd)) continue;
						ChkList[i].checked = true;			// 모든 체크박스를 체크
						DelList[i].value = "N";				//체크
					}
				}
			}
			*/
			// 담당자 및 참조인 개별선택
			function OneSel(Obj) {
				if($('#'+Obj).is(':checked')) $('#'+Obj.replace("Ary", "DelAry")).val("N");
				else $('#'+Obj.replace("Ary", "DelAry")).val("Y");
			} 
			
			// 담당자 및 참조인 전체선택
			function SelAll(Obj) {
				var All = $('#'+Obj+'');
				var ChkList = $('input[name='+Obj+'Ary]');
				var DelList = $('input[name='+Obj+'DelAry]');

				if(!All.is(':checked')) {// 전체선택 체크박스가 해제되었다면
					for(var oOo = 0; oOo <= ChkList.length - 1; oOo++) {// 모든 체크박스를 체크해제
						if(ChkList[oOo].disabled) continue;
						ChkList[oOo].checked = false;
						DelList[oOo].value = "Y";
					}
				}
				else { // 그게 아니라면
					for(var oOo = 0; oOo <= ChkList.length - 1; oOo++) {
						ChkList[oOo].checked = true;// 모든 체크박스를 체크
						DelList[oOo].value = "N";
					}
				}
			}
		
		</script>
	</head>
	<body>
	<form name="HolidayProc" id="HolidayProc" method="post" enctype="multipart/form-data">
	<input type="hidden" name="message"			id="message"			value="${message}"/>
	<input type="hidden" name="InfoMessage"		id="InfoMessage"/>
	<input type="hidden" name="GrpCd"			id="GrpCd"				value="${vo.grpCd}"/>
	<input type="hidden" name="CateCd"			id="CateCd"				value="${vo.cateCd}"/>
	<input type="hidden" name="WriteCd"			id="WriteCd"			value="${vo.writeCd}"/>
	<input type="hidden" name="ConfirmProcFlag"	id="ConfirmProcFlag"	value="${vo.confirmProcFlag}"/>
	<input type="hidden" name="ConfirmPerSabun"	id="ConfirmPerSabun"	value="${vo.confirmPerSabun}"/>
	<input type="hidden" name="CMD"				id="CMD"				value="${vo.CMD}"/>
	<input type="hidden" name="PopFlag"			id="PopFlag"			value="${vo.popFlag}"/>
	<input type="hidden" name="EmpCnt"			id="EmpCnt"				value="${fn:length(EmpList)}"/>
	<input type="hidden" name="RegPerSabun"		id="RegPerSabun"		value="${loginVO.regPerSabun}"/>
	<input type="hidden" name="WriteStatus"		id="WriteStatus"/>
	<input type="hidden" name="OldWriteStatus"	id="OldWriteStatus"		value="${BoardInfo.writeStatus}"/>
	<input type="hidden" name="BoardVer"		id="BoardVer"			value="${BoardInfo.boardVer}"/>
	<input type="hidden" name="HoliDocFlag"		id="HoliDocFlag"		value="Y"/>
	<input type="hidden" name="HoliCancelCd"	id="HoliCancelCd"		value="0"/>
	<input type="hidden" name="SubmitFlag"		id="SubmitFlag"			value="N"/>
	<!-- 
	<input type="hidden" name="SMSTitle"		id="SMSTitle"	value="CusBoard">
	<input type="hidden" name="SMSType"			id="SMSType"	value="3">
	<input type="hidden" name="SMSToNum"		id="SMSToNum"	value="${loginVO.perPhone}">
	<input type="hidden" name="SMSFromNum"		id="SMSFromNum"	value="${loginVO.cusTel}">
	<input type="hidden" name="SMSContent"		id="SMSContent">
	<input type="hidden" name="SMSReserTime"	id="SMSReserTime">
	 -->
	<div id="prolayer" style="height:100%;width:100%;display:none;">
		<table border="0" width="100%" height="100%">
			<tr><td align="center"><img src="<c:url value='/images/sp/loading.gif'/>"><p><b>등록중입니다.</b></td></tr>
		</table>
	</div>
	<table class="subtable" border="0" cellpadding="0" cellspacing="0" width="1024">
		<tr>
			<td class="desc_BR Text_C" style="width:12%;height:60px;">휴가기간설정</td>
			<td class="input_B Text_L">
				<input type="radio" name="HoliFlag" id="HalfHoli" value="half" onclick="HoliView(this.value);"><label for="HalfHoli">반차</label>
				<input type="radio" name="HoliFlag" id="AllHoli" value="all" onclick="HoliView(this.value);"><label for="AllHoli">종일</label>
				<div id="HalfView" style="display:none;">
					<input type="text" class="input_box Text_C" name="HalfDate" id="HalfDate" value="${BoardInfo.holiSDate}" size="12" readonly onblur="$('#HalfType').show();">
					<span id="HalfType" style="display:none;">
					(<input type="radio" name="HalfFlag" id="HalfAM" value="am" onclick="HoliPeriodCalcu();"><label for="HalfAM">오전</label>
					<input type="radio" name="HalfFlag" id="HalfPM" value="pm" onclick="HoliPeriodCalcu();"><label for="HalfPM">오후</label>)
					</span>
				</div>
				<div id="AllView" style="display:none;">
					<input type="text" class="input_box Text_C" name="HoliSDate" id="HoliSDate" value="${BoardInfo.holiSDate}" size="12" readonly> ~
					<input type="text" class="input_box Text_C" name="HoliEDate" id="HoliEDate" value="${BoardInfo.holiEDate}" size="12" readonly>
				</div>
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_C">사용일수</td>
			<td class="input_B Text_L">
				<input type="text" class="input_box Text_R" name="HoliUseDay" id="HoliUseDay" size="5" value="${BoardInfo.holiUseDay}" readonly onkeyup="ReOnlyNum(this.name, this.value);" onblur="UseHolidayChk();"/>일 (계산된 휴가일수가 맞지 않을 경우 직접 입력하실 수 있습니다.)
				<input type="hidden" class="input_box" name="HoliUseDayTmp" id="HoliUseDayTmp" value="${BoardInfo.holiUseDay}"/>
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_C">제목</td>
			<td class="input_B Text_L"><input type="text" class="input_box" name="WriteTitle" id="WriteTitle" style="width:99%;" value="${BoardInfo.writeTitle}"/></td>
		</tr>
		<tr>
			<td class="desc_BR Text_C">내용</td>
			<td class="input_B Text_L" style="padding:5px;">
				<textarea name="WriteCon" id="WriteCon" style="ime-mode:active;width:99%;height:300px;">${BoardInfo.writeCon}</textarea>
			</td>
		</tr>
		<tr id="ConfirmView" style="display:none;">
			<td colspan="2">
			<table width="100%">
				<tr>
					<td class="desc_BR Text_C" style="width:12%;">최종승인자</td>
					<td class="input_B Text_L"><span id="LastConfirm">${vo.confirmPerNm}</span></td>
				</tr>
				<tr> 
					<td class="desc_BR Text_C">
						중간승인자<br/>
					</td>
					<td class="input_B Text_L" style="padding:5px;">
						<c:set var="cnt" value="0"/>
						<c:forEach var="EmpResult" items="${EmpList}" varStatus="status">

							<c:if test="${EmpResult.persabun ne vo.confirmPerSabun}">
								<%--<input type="checkbox" name="MiddleAry" id="MiddleAry${status.count}" value="${EmpResult.persabun}" ${chkflag} ${disflag} onclick="OneSel(this.id);"/> --%>
<%-- 								<input type="checkbox" name="MiddleAry" id="MiddleAry${status.count}" value="${EmpResult.persabun}" ${chkflag} onclick="OneSel(this.id);"/>		20151211 전무님 부재시 중간승인자를 선택할 수 있게 일단 disable 안되게 --%>
								<input type="checkbox" name="MiddleAry" id="MiddleAry${status.count}" value="${EmpResult.persabun}" onclick="OneSel(this.id);"/>
								<label for="MiddleAry${status.count}">${EmpResult.pernm}</label>
								<c:set var="cnt" value="${cnt + 1}"/>
							</c:if>
							<input type="hidden" name="MiddlePerAry" id="MiddlePerAry${status.count}" value="${EmpResult.persabun}"/>
<%-- 							<input type="hidden" name="MiddleDelAry" id="MiddleDelAry${status.count}" value="${setflag}"/> --%>
							<input type="hidden" name="MiddleDelAry" id="MiddleDelAry${status.count}"/>
							<input type="hidden" name="MiddleSabunAry${status.count}" id="MiddleSabunAry${status.count}"/>
							<input type="hidden" name="MiddleDelFlagAry${status.count}" id="MiddleDelFlagAry${status.count}"/>
							<c:if test="${cnt ne 0 && cnt % 13 eq 0}"><br/></c:if>
							<c:if test="${status.index lt fn:length(EmpList)-1 and EmpList[status.index].division ne EmpList[status.index+1].division}"><br/><div style="color:gray;border-top:silver 1px dotted;width:98%;;font-size:8px;margin-top:3px;">${EmpList[status.index+1].division}</div></c:if>
						</c:forEach>
					</td>
				</tr>
				<tr> 
					<td class="desc_BR Text_C">
						참조인<br/><br/>
						<!-- <font style="font-weight:bold;">전체선택</font> -->
						<div id="divSelAll" style="text-align:left;padding-left:20px;"></div>
					</td>
					<td class="input_B Text_L" style="padding:5px;">
						<c:forEach var="EmpResult" items="${EmpList}" varStatus="status">
							<c:set var="sabun" value="${EmpResult.persabun}"/>

							<input type="checkbox" name="ConsultAry"  class="${EmpResult.division}" id="ConsultAry${status.count}" value="${EmpResult.persabun}" onclick="OneSel(this.id);"/>
							<label for="ConsultAry${status.count}">${EmpResult.pernm}</label>
							<input type="hidden" name="ConsultPerAry" id="ConsultPerAry${status.count}" value="${EmpResult.persabun}"/>
<%-- 							<input type="hidden" name="ConsultDelAry" id="ConsultDelAry${status.count}" value="${setflag}"/> --%>
							<input type="hidden" name="ConsultDelAry" id="ConsultDelAry${status.count}"/>
							<input type="hidden" name="ConsultSabunAry${status.count}" id="ConsultSabunAry${status.count}"/>
							<input type="hidden" name="ConsultDelFlagAry${status.count}" id="ConsultDelFlagAry${status.count}"/>
							<c:if test="${status.count % 13 eq 0}"><br/></c:if>
							<c:if test="${status.index lt fn:length(EmpList)-1 and EmpList[status.index].division ne EmpList[status.index+1].division}"><br/><div style="color:gray;border-top:silver 1px dotted;width:98%;;font-size:8px;margin-top:3px;">${EmpList[status.index+1].division}</div></c:if>
						</c:forEach>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<c:choose>
			<c:when test="${BoardInfo.writeStatus eq 'return'}"><c:set var="BtnNm" value="재기안완료"/></c:when>
			<c:when test="${vo.CMD eq 'Edit'}"><c:set var="BtnNm" value="수정완료"/></c:when>
			<c:otherwise><c:set var="BtnNm" value="등록"/></c:otherwise>
		</c:choose>	
		<tr>
			<td class="input_noline Text_C" colspan="2">
				<c:if test="${vo.CMD eq 'Edit'}"><a href="javascript:BoardProcEnd('TMP');" class="Btn" name="Green">임시저장</a></c:if>
				<a href="javascript:BoardProcEnd();" class="Btn" name="Orange">${BtnNm}</a>
				<a href="javascript:BoardProcCancel();" class="Btn" name="LightBlue">취소</a>
			</td>
		</tr>
	</table>
	<div id="HolidayPeriod"></div>
	</form>
	<form name="SMS" method="post">
		<input type="hidden" name="uid"			id="uid"			value="synergy">
		<input type="hidden" name="pwd"			id="pwd"			value="00synergy00">
		<input type="hidden" name="title"		id="title"			value="CusBoard">
		<input type="hidden" name="sendType"	id="sendType"		value="3">
		<input type="hidden" name="toNumber"	id="toNumber"		value="${fn:replace(loginVO.perPhone, '-', '')}">
		<input type="hidden" name="contents"	id="contents">
		<input type="hidden" name="fromNumber"	id="fromNumber"		value="${fn:replace(loginVO.cusTel, '-', '')}">
		<input type="hidden" name="startTime"	id="startTime">
		<input type="hidden" name="nType"		id="nType"			value="3">
		<input type="hidden" name="indexCode"	id="indexCode"		value="">
		<input type="hidden" name="returnUrl"	id="returnUrl"		value="http://106.250.177.91:8280/SynergyCus/SMSSendResult.do">
		<input type="hidden" name="returnType"	id="returnType"		value="2">
		<input type="hidden" name="redirectUrl"	id="redirectUrl"	value="http://106.250.177.91:8280/SynergyCus/ClosePage.do">
		<iframe id="moashot" width="0" height="0" frameborder="0"></iframe>
	</form>
	</body>
</html>