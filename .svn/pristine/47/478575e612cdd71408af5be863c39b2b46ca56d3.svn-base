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
		<script src="js/sp/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="js/naver/js/HuskyEZCreator.js" charset="utf-8"></script>
		<script src="http://code.jquery.com/jquery-1.9.1.js"/></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"/></script>
		<script>var contextRoot="${pageContext.request.contextPath}";</script><!-- necessary! to import js files -->		
		<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- util folder -->
		
		<style type="text/css">
			.Sum_Box {
				border:1px;
				background-color:#FFFFFF;
				height:15pt;
				width:55pt;
			}
		</style>
		<script type="text/javaScript" language="javascript">
			var divisionList = [];	
			if('${vo.CMD}' == 'Add') top.document.title = "경조사게시물등록";
			else top.document.title = "경조사게시물수정";
			
			/* 
				중간승인자
				M&A팀(2) - 정안식(201407001)
				시스템기획팀(8) - 서상옥(201410001)
				IB투자(1), 기업분석(4) - 이명철(200908001)
				경영지원(3) - 임지연(201301001)
				모든부서 참조 - 임지연(201301001)
			*/
			var PerSabun = '', PerDept = '', MiddlePer = '';
			
			var Opt = ['결혼', '출산', '칠순,팔순', '사망'];
			var Opt0 = ['본인', '자녀', '본인형제자매', '배우자형제자매'];
			var Opt1 = ['본인 및 배우자'];
			var Opt2 = ['부모', '배우자부모'];
			var Opt3 = ['본인', '배우자', '부모', '배우자부모', '자녀', '형제,자매', '배우자형제자매', '조부모', '배우자조부모', '부모의 형제자매', '외조부모'];
			
			var Holi0 = ['7', '1', '1', '1'];
			var Holi1 = ['3'];
			var Holi2 = ['1', '1'];
			var Holi3 = ['-', '7', '5', '5', '5', '3', '3', '3', '3', '1', '1'];
			
			var Money0 = ['1,000,000', '500,000', '-', '-'];
			var Money1 = ['500,000'];
			var Money2 = ['300,000', '300,000'];
			var Money3 = ['5,000,000', '5,000,000', '1,000,000', '1,000,000', '1,000,000', '100,000', '100,000', '100,000', '100,000', '-', '-'];
			
			$(document).ready(function () {
				$(window).load(function() {
					//디비전 리스트 가져오기
					divisionList= getCodeInfo(null,null,null,null,null,null,"/common/getDivisionList.do",null);
					//참조인 전체선택 체크박스 세팅
			    	var htmlStr = '';
			    	for(var i=0;i<divisionList.length;i++){
			    		//htmlStr += '<label><input type="checkbox" name="Consult" id="Consult" onclick="javascript:SelAll(this.name, ' + i + ', \'' + divisionList[i].divCode + '\');"/>';
			    		//htmlStr += divisionList[i].divName + '</label><br/>';
			    		htmlStr += '<label><input type="checkbox" name="Consult" id="Consult" onclick="javascript:SelAll(this.name);"/>';
			    		htmlStr +=  '전체선택</label><br/>';
			    	}
					$('#divSelAll').html(htmlStr);		//참조인 전체선택 체크박스
					
					InfoMessageView();
 					DataSet();
					SetOpt('main');
					
					if('${vo.CMD}' == 'Add') {
						WriteDate = GetToday().split("-");
					}
					else {
						SetOpt('${BoardInfo.eventSelCd1}');
						EditSetContent();
						WriteDate = '${BoardInfo.regDate}'.split(" ")[0].split("-");
					}
					$('#Today').html(WriteDate[0] +" 년 "+ WriteDate[1] +" 월 "+ WriteDate[2] +" 일");
					/* 
					if('${vo.CMD}' == 'Add') {
						$('#Consult').attr("checked", true);
						SelAll('Consult');
					} */
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
					
					if('${BoardInfo.noticeFlag}' != '') {
						if('${BoardInfo.noticeFlag}'.search("Home") >= 0) $('#Home').attr("checked", true);
						if('${BoardInfo.noticeFlag}'.search("Board") >= 0) $('#Board').attr("checked", true);
					}
					
					$('#EventDay').datepicker(DatePickerOpt).parent().children('img').css({'vertical-align':'middle', 'line-height':'23px', 'margin-left':'5px'});

					$('#HoliSDate').datepicker(S_DatePickerOpt).parent().children('img').css({'vertical-align':'middle', 'line-height':'23px', 'margin-left':'5px'});
					$('#HoliEDate').datepicker(E_DatePickerOpt).parent().children('img').css({'vertical-align':'middle', 'line-height':'23px', 'margin-left':'5px'});
					BtnSet();
					
					PerSabun = '${loginVO.regPerSabun}';
					PerDept = '${loginVO.perDept}';
					MiddlePer = '${loginVO.teamLeaderSabun}';
					
				/* 	$('input[name=MiddleAry]').each(function(index) {
						if(PerSabun != MiddlePer && this.value == MiddlePer) {
							$(this).attr('disabled', true).prop('checked', true);
							$('#MiddleDelAry'+(index+2)).val('N');
						}
					});
					
					$('input[name=ConsultAry]').each(function(index) {
						$(this).prop('checked', true);
						$('#ConsultDelAry'+(index+1)).val('N');
						if(this.value == '200402001' || this.value == MiddlePer || this.value == PerSabun || this.value == '201301001') {
							$(this).attr('disabled', true);
						}
					}); */
				});
			});
			
			// 셀렉트 박스 셋팅
			function SetOpt(Flag) {
				var Obj, OptVal;
				if(Flag == 'main') {
					Obj = $('#EventSelCd1');
					OptVal = Opt;
				}
				else if(Flag == 'X') {
					$('#EventSelCd2').hide();
				}
				else {
					Obj = $('#EventSelCd2');
					OptVal = eval("Opt" + Flag);
					Obj.empty();
					Obj.show();
					Obj.append('<option value="X">선택하세요.</option>');
				}
				
				for(var oOo = 0; oOo < OptVal.length; oOo++) {
					Obj.append('<option value='+oOo+'>'+OptVal[oOo]+'</option>');
				}
			}
			
			// 경조 분류 선택에 따른 데이터 셋팅
			var HoliVal, MoneyVal;
			function SetContent(Val) {
				$('#EventDay').val('');
				$('#HoliSDate').val('');
				$('#HoliEDate').val('');
				HoliVal = eval("Holi" + $('#EventSelCd1').val());
				MoneyVal = eval("Money" + $('#EventSelCd1').val());
				
				$('#EventNm').html($('#EventSelCd1 option:selected').text() + " ("+ $('#EventSelCd2 option:selected').text() +")");
				$('#EventMoney').html(MoneyVal[Val] +" 원");
				$('#EventHoli').html(HoliVal[Val] + " 일");
				$('#HoliUseDay').val(HoliVal[Val]);
				
// 				$('#WriteTitle').val($('#WriteTitle').val() + " ["+$('#EventSelCd1 option:selected').text() + " ("+ $('#EventSelCd2 option:selected').text() +")]");
				$('#WriteTitle').val('${BoardInfo.writeTitle}' + " ["+$('#EventSelCd1 option:selected').text() + " ("+ $('#EventSelCd2 option:selected').text() +")]");
				
				$('#EventDay').parent().show();
				$('#HoliSDate').parent().show();
			}
			
			// 수정시 기존 데이터 셋팅
			function EditSetContent() {
				var HoliVal, MoneyVal, EventSelCd1, EventSelCd2;
				EventSelCd1 = '${BoardInfo.eventSelCd1}';
				EventSelCd2 = '${BoardInfo.eventSelCd2}';
				
				HoliVal = eval("Holi" + (EventSelCd1 - 1));
				MoneyVal = eval("Money" + (EventSelCd1 - 1));
				
				$('#EventSelCd1 option:eq('+EventSelCd1+')').attr("selected", "selected");
				$('#EventSelCd2 option:eq('+EventSelCd2+')').attr("selected", "selected");
				
				$('#EventNm').html($('#EventSelCd1 option:selected').text() + " ("+ $('#EventSelCd2 option:selected').text() +")");
				$('#EventMoney').html(MoneyVal[(EventSelCd2 - 1)] +" 원");
				$('#EventHoli').html(HoliVal[(EventSelCd2 - 1)] + " 일");
			}
			
			// 보고서게시판일시 중간승인자와 참조인 셋팅
			function DataSet() {
				if('${vo.CMD}' == 'Add') {
					for(var i=0;i<divisionList.length;i++){
						if(divisionList[i].divCode == '${userLoginInfo.division}'){
							
							$($('input:checkbox[name=Consult]')[i]).attr("checked", true);
							SelAll('Consult');
							//SelAll('Consult', i, divisionList[i].divCode);
						}
					}
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
			
			// 경조휴가기간 자동 설정
			function FamilyEventPeriodSet() {
				var EventSelCd1, EventSelCd2;
				if('${vo.CMD}' == 'Add') {
					EventSelCd1 = $('#EventSelCd1').val();
					EventSelCd2 = $('#EventSelCd2').val();
				}
				else {
					EventSelCd1 = '${BoardInfo.eventSelCd1}' - 1;
					EventSelCd2 = '${BoardInfo.eventSelCd2}' - 1;
				}
				
				var HoliVal = eval("Holi" + EventSelCd1);
				var HoliEDate = new Date($('#EventDay').val());
				HoliEDate.setDate(HoliEDate.getDate() + parseInt(HoliVal[EventSelCd2] - 1));
				$('#HoliSDate').val($('#EventDay').val());
				$('#HoliEDate').val(HoliEDate.getFullYear() + "-" + ("00" + (HoliEDate.getMonth() + 1)).slice(-2)  + "-" + ("00" + HoliEDate.getDate()).slice(-2));
			}
			
			// 휴가기간 자동계산
			function HoliPeriodCalcu() {
				$.ajax({
					type:"POST",
					url:"<c:url value='/HolidayPeriod.do'/>",
					data:{"HoliSDate":$('#HoliSDate').val(), "HoliEDate":$('#HoliEDate').val(), "HoliDocFlag":$('#HoliDocFlag').val()},
					
					success:function(data) {
// 						$('#HolidayPeriod').html(data);
// 						HoliDaySetFlag($('#HolidayPeriod').find('input').val());
						
						HoliDaySetFlag($.trim(data));
					},
					error:function(xhr, status, error) {
						alert('error');
					}
				});
			}
			
			// 설정된 기간 확인
			function HoliDaySetFlag(HoliUseDay) {
				if($('#EventSelCd1').val() == 'X' || $('#EventSelCd2').val() == 'X') {
					alert("경조사 분류가 선택되지 않았습니다.");
					if($('#EventSelCd1').val() == 'X') $('#EventSelCd1').focus();
					if($('#EventSelCd2').val() == 'X') $('#EventSelCd2').focus();
					return false;
				}
				HoliVal = eval("Holi" + $('#EventSelCd1').val())[$('#EventSelCd2').val()];
				if(Number(HoliVal) < Number(HoliUseDay)) {
					alert("경조제공휴가보다 더 많은 일수의 휴가를 사용하셨습니다.");
					$('#HoliSDate').val('').focus();
					$('#HoliEDate').val('');
					return false;
				}
				else {
					SDate = $('#HoliSDate').val();
					EDate = $('#HoliEDate').val();
					HoliCon = SDate + " ~ " + EDate + " [총 " + HoliUseDay + " 일]";
					
					if(!confirm('설정하신 휴가일정이 '+ HoliCon + ' 맞습니까?')) {
						alert('휴가 일정이 취소되었습니다. 다시 설정해 주세요.');
						return false;
					}
					$('#HoliUseDay').val(HoliUseDay);
				}
			}
			
			// 게시물 등록/수정 완료
			function BoardProcEnd() {
				if($('#WriteTitle').val() == '') {
					alert('제목을 입력하세요.');
					$('#WriteTitle').focus();
					return false;
				}
				
				if($('#EventSelCd1').val() == 'X' || $('#EventSelCd2').val() == 'X') {
					alert("경조사 분류가 선택되지 않았습니다.");
					if($('#EventSelCd1').val() == 'X') $('#EventSelCd1').focus();
					if($('#EventSelCd2').val() == 'X') $('#EventSelCd2').focus();
					return false;
				}
				
				if($('#EventDay').val() == '') {
					alert('경조일을 입력하세요.');
					$('#EventDay').focus();
					return false;
				}
				
				if($('#EventDoc').val() == '') {
					alert('경조 관련 증빙서류를 입력하세요.');
					$('#EventDoc').focus();
					return false;
				}
				
				if($('#HoliSDate').val() == '' || $('#HoliEDate').val() == '') {
					alert("경조사 휴가기간이 설정되지 않았습니다.");
					return false;
				}
				
				if($('#ConfirmProcFlag').val() == 'Y' && $('#ConfirmPerSabun').val() != '' && $('#OldWriteStatus').val() != 'return') {
					if(confirm('보고를 완료 하시겠습니까?')) $('#WriteStatus').val('ing');
					else $('#WriteStatus').val('write');
				}
				else $('#WriteStatus').val('end');
				
			    // 보고문일 경우
			    if($('#ConfirmProcFlag').val() == 'Y' && $('#ConfirmPerSabun').val() != '') {
			    	for(var oOo = 1; oOo < (Number($('#EmpCnt').val()) + 1); oOo++) {
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
				
				if($('#PopFlag') == '') $('#FamilyEventProc').attr('target', 'content');
				else $('#FamilyEventProc').attr('target', '_parent');
				
				$('#FamilyEventProc').attr('action', "<c:url value='/BoardProcEnd.do'/>").submit();
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
					if($('#CMD').val() == 'Add') $('#FamilyEventProc').attr('action', "<c:url value='/BoardList.do'/>");
					else $('#FamilyEventProc').attr('action', "<c:url value='/BoardView.do'/>");
					$('#FamilyEventProc').attr('target', "mainFrame");
				}
				else {
					$('#FamilyEventProc').attr('action', "<c:url value='/BoardList.do'/>");
					$('#FamilyEventProc').attr('target', "_parent");
				}
				$('#FamilyEventProc').submit();
				//else $('#HolidayProc').attr('action', "<c:url value='/ReturnList.do'/>").attr('target', "_parent").submit();
			}
		/* 	
			// 게시물 등록/수정취소
			function BoardProcCancel() {
				if($('#PopFlag').val() == '') {
					if($('#CMD').val() == 'Add') $('#FamilyEventProc').attr('target', 'content').attr('action', "<c:url value='/BoardList.do'/>");
					else $('#FamilyEventProc').attr('target', 'content').attr('action', "<c:url value='/BoardView.do'/>");
				}
				else {
					$('#FamilyEventProc').attr('target', '_parent').attr('action', "<c:url value='/ReturnList.do'/>");
				}
				$('#FamilyEventProc').submit();
			}
			 */

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
			} */
			
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
			
			// 담당자 및 참조인 개별선택
			function OneSel(Obj) {
				if($('#'+Obj).is(':checked')) $('#'+Obj.replace("Ary", "DelAry")).val("N");
				else $('#'+Obj.replace("Ary", "DelAry")).val("Y");
			}
			
			// 파일 삭제 하기
			function BoardFileDelEnd(FileSeq, FileNm) {
				if(confirm("선택하신 파일 ("+ FileNm +")을 정말 삭제 하시겠습니까?")) {
					$('#InfoMessage').val("삭제 완료 되었습니다.");
					$('#FamilyEventProc').attr('action', "<c:url value='/BoardFileDelEnd.do?FileSeq="+FileSeq+"'/>").submit()
				}
				else {
					alert("삭제 취소 되었습니다.");
					return false;
				}
			}
			
			function PerChange() {
				$('#WriteTitle').val('['+$('#TargetPer option:selected').text()+'] '+ '경조금 및 경조휴가 신청합니다.');
				$('#RegPerSabun').val($('#TargetPer option:selected').val().split('_-_')[0]);
				$('#PerPosition').val($('#TargetPer option:selected').val().split('_-_')[1]);
				$('#PerDept').val($('#TargetPer option:selected').val().split('_-_')[2]);
				$('#PerJoinCom').val($('#TargetPer option:selected').val().split('_-_')[3]);
			}
			
		</script>
	</head>
	<body>
	<form name="FamilyEventProc" id="FamilyEventProc" method="post" enctype="multipart/form-data">
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
	<input type="hidden" name="HoliDocFlag"		id="HoliDocFlag"		value="F"/>
	<input type="hidden" name="HoliUseDay"		id="HoliUseDay"			value="${BoardInfo.holiUseDay}"/>
	<input type="hidden" name="HoliFlag"		id="HoliFlag"			value="all"/>
	<input type="hidden" name="HalfFlag"		id="HalfFlag"/>
	<input type="hidden" name="HoliCancelCd"	id="HoliCancelCd"		value="0"/>
	<input type="hidden" name="FilePath"		id="FilePath"/>
	<input type="hidden" name="FileUpNm"		id="FileUpNm"/>
	<input type="hidden" name="FileNm"			id="FileNm"/>
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
			<td class="desc_BR Text_C" style="width:12%;">경조사분류</td>
			<td class="input_B Text_L" colspan="3">
				<select name="EventSelCd1" id="EventSelCd1" onchange="javascript:SetOpt(this.value);">
					<option value="X">선택하세요.</option>
				</select>
				
				<select name="EventSelCd2" id="EventSelCd2" style="display:none;" onchange="javascript:SetContent(this.value);">
					<option value="X">선택하세요.</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_C">제목</td>
			<td class="input_B Text_L" colspan="3"><input type="text" class="input_box" name="WriteTitle" id="WriteTitle" style="width:99%;" value="${BoardInfo.writeTitle}"/></td>
		</tr>
		
		<tr class="Text_C">
			<td class="desc_T desc_BR" style="width:12%;">성명</td>
			<td class="input_T input_BR" style="widht:38%;">
				<c:choose>
					<c:when test="${loginVO.perSabun eq '201509001' || loginVO.perSabun eq '201301001' || loginVO.perSabun eq '201504001'}">
						<select name="TargetPer" id="TargetPer" onchange="PerChange();">
						<c:forEach var="result" items="${EmpList}" varStatus="status">
							<c:choose>
								<c:when test="${result.persabun eq loginVO.perSabun}"><option value="${result.persabun}_-_${result.perpositionnm}_-_${result.perdept}_-_${result.perjoincom}" selected>${result.pernm}</option></c:when>
								<c:otherwise><option value="${result.persabun}_-_${result.perpositionnm}_-_${result.perdept}_-_${result.perjoincom}">${result.pernm}</option></c:otherwise>
							</c:choose>
						</c:forEach>
						</select>
					</c:when>
					<c:otherwise>${loginVO.perNm}</c:otherwise>
				</c:choose>
			</td>
			<td class="desc_T desc_BR" style="width:12%;">직위</td>
			<td class="input_T input_B" style="widht:38%;"><input type="text" class="Text_C" name="PerPosition" id="PerPosition" value="${loginVO.perPositionNm}" style="border:0px;"/></td>
		</tr>
		<tr class="Text_C">
			<td class="desc_BR">소속부서</td>
			<td class="input_BR"><input type="text" class="Text_C" name="PerDept" id="PerDept" value="${loginVO.perDept}" style="border:0px;"/></td>
			<td class="desc_BR">입사일</td>
			<td class="input_B"><input type="text" class="Text_C" name="PerJoinCom" id="PerJoinCom" value="${loginVO.perJoinCom}" style="border:0px;"/></td>
		</tr>
		<tr class="Text_C">
			<td class="desc_BR">경조내용</td>
			<td class="input_B" colspan="3"><span name="EventNm" id="EventNm"></span></td>
		</tr>
		<tr class="Text_C">
			<td class="desc_BR">경조금액</td>
			<td class="input_B" colspan="3"><span name="EventMoney" id="EventMoney"></span></td>
		</tr>
		<tr class="Text_C">
			<td class="desc_BR">경조제공휴가</td>
			<td class="input_B" colspan="3"><span name="EventHoli" id="EventHoli"></span></td>
		</tr>
		<tr>
			<td class="desc_BR Text_C">경조일자</td>
			<td class="input_B Text_L" colspan="3">
				<span style="display:none;">
					<input type="text" class="input_box Text_C" name="EventDay" id="EventDay" value="${BoardInfo.eventDay}" size="12" maxlength="10" onkeyup="javascript:DateFormat(this.name, this.value);" onblur="FamilyEventPeriodSet();">
				</span>
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_C">관련증빙서류</td>
			<td class="input_B Text_L" colspan="3"><input type="text" class="input_box" name="EventDoc" id="EventDoc" style="width:99%;" value="${BoardInfo.eventDoc}"/></td>
		</tr>
		<tr class="Text_C">
			<td class="input_B" colspan="4" style="padding-top:30px;">
				관련 사규에 의거하여 위와 같이 경조금 및 경조휴가를 신청하오니 허가해 주시기 바랍니다.<P><P><P>
				<span name="Today" id="Today" style="display:inline-block;padding-top:30px;"></span>
			</td>
		</tr>
		<tr>
			<td class="input_B" colspan="4" style="font-size:9pt;">
				<ul>
					<li>본인결혼, 본인사망, 배우자사망, 부모사망, 배우자부모 사망 시 대표이사명의 화환<br>
					(조사의 경우 근조기 미리 장만하여 장례식장에 설치)</li>
					<li>본인 또는 배우자출산 자녀의 돌 : 대표이사명의 꽃바구니</li>
					<li>모든 경조사 휴가는 휴일 여부와 무관하게 발생일로부터 기산함.(휴일포함)</li>
					<li>칠순, 팔순은 실제 발생일로 기준하며, 현재 부모 및 배우자 부모의 실제 생신(개인별로 양력, 음역여부)를 작성하여 제출하여 주시기 바랍니다.(신규직원 입사시 미리 제출 받음)</li>
					<li>관련증빙서류 : 결혼 (청첩장), 조사 (공고문,부고장,사망확인서등), 출생 (출생신고서,등본 등)</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_C">경조휴가기간설정</td>
			<td class="input_B Text_L" colspan="3">
				<span style="display:none;">
				<input type="text" class="input_box Text_C" name="HoliSDate" id="HoliSDate" value="${BoardInfo.holiSDate}" size="12" maxlength="10" onkeyup="DateFormat(this.name, this.value);"> ~
				<input type="text" class="input_box Text_C" name="HoliEDate" id="HoliEDate" value="${BoardInfo.holiEDate}" size="12" maxlength="10" onkeyup="DateFormat(this.name, this.value);">
				</span>
			</td>
		</tr>
		<c:if test="${fn:length(BoardFileList) > 0}">
			<tr ${spCmmVO.cellColor}> 
				<td class="desc_BR Text_C">첨부파일</td>
				<td class="input_BR Text_L" colspan="3" style="line-height:20px;padding:5px;">
				<c:forEach var="result" items="${BoardFileList}" varStatus="status">
					<a href="javascript:BoardFileDelEnd('${result.fileseq}', '${result.filenm}');" class="Btn" name="LightBlue">삭제</a>
					<a href="javascript:FileDown('<c:url value='/FileDown.do'/>', '${result.filepath}', '${result.fileupnm}', '${result.filenm}');">${result.filenm}</a><br/>
				</c:forEach>
				</td>
			</tr>
		</c:if>
		<tr>
			<td class="desc_BR Text_C">첨부파일</td>
			<td class="input_BR Text_L" colspan="3" style="padding:5px;">
				<input type="File" id="InFile" multiple="true" name="DataAry" onchange="javascript:FileSel(this.files)">
				<div id="FileInfo" style="border:2px solid #C9C9C9;min-height:50px;">(선택된 파일이 없습니다.)</div>
			</td>
		</tr>
		<tr id="ConfirmView" style="display:none;">
			<td colspan="4">
			<table width="100%">
				<tr>
					<td class="desc_BR Text_C" style="width:12%;">최종승인자</td>
					<td class="input_B Text_L"><span id="LastConfirm">${vo.confirmPerNm}</span></td>
				</tr>
				<tr> 
					<td class="desc_BR Text_C">
						중간승인자<br/>
					</td>
					<td class="input_B Text_L" style="padding:5px;line-height:20px;">
						<c:set var="cnt" value="0"/>
						<c:forEach var="EmpResult" items="${EmpList}" varStatus="status">

							<c:if test="${EmpResult.persabun ne vo.confirmPerSabun}">
<%-- 								<input type="checkbox" name="MiddleAry" id="MiddleAry${status.count}" value="${EmpResult.persabun}" ${chkflag} ${disflag} onclick="javascript:OneSel(this.id);"/> --%>
								<input type="checkbox" name="MiddleAry" id="MiddleAry${status.count}" value="${EmpResult.persabun}" onclick="javascript:OneSel(this.id);"/>
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
						참조인<br/><br/><font style="font-weight:bold;">전체선택</font>
						<div id="divSelAll" style="text-align:left;padding-left:20px;"></div>
					</td>
					<td class="input_B Text_L" style="padding:5px;line-height:20px;">
						<c:forEach var="EmpResult" items="${EmpList}" varStatus="status">
							<c:set var="sabun" value="${EmpResult.persabun}"/>

<%-- 							<input type="checkbox" name="ConsultAry" id="ConsultAry${status.count}" value="${EmpResult.persabun}" ${chkflag} ${disflag} onclick="javascript:OneSel(this.id);"/> --%>
							<input type="checkbox" name="ConsultAry"  class="${EmpResult.division}" id="ConsultAry${status.count}" value="${EmpResult.persabun}" onclick="javascript:OneSel(this.id);"/>
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
			<td class="input_noline Text_C" colspan="4">
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