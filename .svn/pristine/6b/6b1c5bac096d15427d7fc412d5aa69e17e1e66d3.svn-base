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
		<script>var contextRoot="${pageContext.request.contextPath}";</script><!-- necessary! to import js files -->		
		<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- util folder -->
		<script type="text/javaScript" language="javascript">
			
			var divisionList = [];		//디비전 리스트
			if('${vo.CMD}' == 'Add') top.document.title = "게시물등록";
			else top.document.title = "게시물수정";
			
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
					BtnSet();
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
				else $('#HoliCancelCd').val('${BoardInfo.holiCancelCd}');
				
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
			
			// 게시물 등록/수정 완료
			function BoardProcEnd() {
				if($('#HoliCancelCd option:selected').val() == 'X') {
					alert('취소하실 휴가를 선택하세요.');
					$('#HoliCancelCd').focus();
					return false;
				} 
				
				if($('#WriteTitle').val() == '') {
					alert('제목을 입력하세요.');
					$('#WriteTitle').focus();
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

				if($('#CMD').val() == 'Add') $('#InfoMessage').val("등록 완료 되었습니다.");
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
			
			// 담당자 및 참조인 전체선택
			/* function SelAll(Obj, idx, divCd) {			//idx ... division list index ... 0:'SYNERGY', 1:'FIDES'		divCd...  'SYNERGY', 'FIDES'
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
	<input type="hidden" name="HoliDocFlag"		id="HoliDocFlag"		value="C"/>
	<input type="hidden" name="HoliUseDay"		id="HoliUseDay"			value="0"/>
	
	<div id="prolayer" style="height:100%;width:100%;display:none;">
		<table border="0" width="100%" height="100%">
			<tr><td align="center"><img src="<c:url value='/images/sp/loading.gif'/>"><p><b>등록중입니다.</b></td></tr>
		</table>
	</div>
	<table class="subtable" border="0" cellpadding="0" cellspacing="0" width="1024">
		<tr>
			<td class="desc_BR Text_C" style="width:12%;">취소휴가선택</td>
			<td class="input_B Text_L">
				<select name="HoliCancelCd" id="HoliCancelCd" onchange="$('#WriteCon').val($('#HoliCancelCd option:selected').text() + '휴가 일정 취소 신청합니다.')">
					<option value="X">취소하실 휴가기간을 선택하세요.</option>
					<c:forEach var="HoliResult" items="${HoliList}" varStatus="status">
						<option value="${HoliResult.writecd}">${HoliResult.holiperiod}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_C">제목</td>
			<td class="input_B Text_L"><input type="text" class="input_box" name="WriteTitle" id="WriteTitle" style="width:98%;" value="${BoardInfo.writeTitle}"/></td>
		</tr>
		<tr>
			<td class="desc_BR Text_C">내용</td>
			<td class="input_B Text_L">
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
							<c:set var="chkflag" value=""/>
							<c:set var="setflag" value="Y"/>
							<c:set var="disflag" value=""/>
							<c:if test="${EmpResult.persabun ne vo.confirmPerSabun}">
								<input type="checkbox" name="MiddleAry" id="MiddleAry${status.count}" value="${EmpResult.persabun}" ${chkflag} ${disflag} onclick="OneSel(this.id);"/>
								<label for="MiddleAry${status.count}">${EmpResult.pernm}</label>
								<c:set var="cnt" value="${cnt + 1}"/>
							</c:if>
							<input type="hidden" name="MiddlePerAry" id="MiddlePerAry${status.count}" value="${EmpResult.persabun}"/>
							<input type="hidden" name="MiddleDelAry" id="MiddleDelAry${status.count}" value="${setflag}"/>
							<input type="hidden" name="MiddleSabunAry${status.count}" id="MiddleSabunAry${status.count}"/>
							<input type="hidden" name="MiddleDelFlagAry${status.count}" id="MiddleDelFlagAry${status.count}"/>
							<c:if test="${cnt ne 0 && cnt % 13 eq 0}"><br/></c:if>
							<c:if test="${status.index lt fn:length(EmpList)-1 and EmpList[status.index].division ne EmpList[status.index+1].division}"><br/><div style="color:gray;border-top:silver 1px dotted;width:98%;;font-size:8px;margin-top:3px;">${EmpList[status.index+1].division}</div></c:if>
						</c:forEach>
					</td>
				</tr>
				<tr> 
					<td class="desc_BR Text_C">
						참조인<br/>
						<!-- <font style="font-weight:bold;">전체선택</font>-->
						<div id="divSelAll" style="text-align:left;padding-left:20px;"></div> 
					</td>
					<td class="input_B Text_L" style="padding:5px;">
						<c:forEach var="EmpResult" items="${EmpList}" varStatus="status">
							<c:set var="sabun" value="${EmpResult.persabun}"/>
							<c:choose>
								<c:when test="${sabun eq 201101002 || sabun eq loginVO.regPerSabun || sabun eq vo.confirmPerSabun}">
									<c:set var="chkflag" value="checked"/>
									<c:set var="setflag" value="N"/>
									<c:set var="disflag" value="disabled"/>
								</c:when>
								<c:otherwise>
									<c:set var="chkflag" value=""/>
									<c:set var="setflag" value="Y"/>
									<c:set var="disflag" value=""/>
								</c:otherwise>
							</c:choose>
							<input type="checkbox" name="ConsultAry" class="${EmpResult.division}" id="ConsultAry${status.count}" value="${EmpResult.persabun}" ${chkflag} ${disflag} onclick="OneSel(this.id);"/>
							<label for="ConsultAry${status.count}">${EmpResult.pernm}</label>
							<input type="hidden" name="ConsultPerAry" id="ConsultPerAry${status.count}" value="${EmpResult.persabun}"/>
							<input type="hidden" name="ConsultDelAry" id="ConsultDelAry${status.count}" value="${setflag}"/>
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