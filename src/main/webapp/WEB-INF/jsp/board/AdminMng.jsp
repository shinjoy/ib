<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<script type="text/javaScript" src="<c:url value='js/sp/synergy_util.js'/>"></script>
		<script type="text/javaScript" src="<c:url value='js/sp/jquery-1.8.2.min.js'/>"></script>
		<script type="text/javaScript" language="javascript">
			<!--
			top.document.title = "관리";
			
			$(document).ready(function () {
				$(window).load(function() {
					$('#PaddingTable').attr('style', 'padding-top:'+$('#TitleTable').height()+'px;');
					InfoMessageView();
					DataSet();
					BtnSet();
				});
			});
			
			function DataSet() {
				if('${fn:length(GrpCateList)}' != 0) {
					// 신규그룹 순서 셋
					var GrpCd = "", CateCd = "", GrpOpt = "", GrpCnt = 1, NewCateCnt = 0, NewCateOpt = "", CateOpt = "";
					<c:forEach var="result" items="${GrpCateList}" varStatus="status">
						GrpCd = '${result.grpcd}';
						CateCd = '${result.catecd}';
						if('${result.pcflag}' == 'P') {
							NewCateCnt = '${result.cnt}';
							NewCateOpt = "";
							GrpOpt += "<option value="+GrpCnt+">"+GrpCnt+"</option>";
							GrpCnt++;

							$('#GrpOrder'+GrpCd).val('${result.grporder}').attr("selected", "selected");
							$('input:radio[name="ConfirmFlag'+GrpCd+'"]:input[value="${result.confirmprocflag}"]').attr("checked", true);
							
							if(NewCateCnt == 0) $('#CateOrder'+GrpCd).html("<option value='1' selected>1</option>");
							else {
								for(var oOo = 1; oOo <= Number(NewCateCnt) + 1; oOo++) {
									if(oOo == Number(NewCateCnt) + 1) NewCateOpt += "<option value="+oOo+" selected>"+oOo+"</option>";
									else NewCateOpt += "<option value="+oOo+">"+oOo+"</option>";
								}
								$('#CateOrder'+GrpCd).html(NewCateOpt);
							}
						}
						else {
							CateOpt = "";
							$('#CateOrder'+GrpCd+CateCd).val('${result.cateorder}').attr("selected", "selected");
							for(var oOo = 1; oOo <= NewCateCnt; oOo++) {
								if(oOo == '${result.cateorder}') CateOpt += "<option value="+oOo+" selected>"+oOo+"</option>";
								else CateOpt += "<option value="+oOo+">"+oOo+"</option>";
							}
							$('#CateOrder'+GrpCd+CateCd).html(CateOpt);
							
							if('${result.confirmprocflag}' == 'Y' && '${result.confirmpersabun}' != '') {
								$('#ConfirmUse'+GrpCd+CateCd).attr("checked", true);
								$('#ConfirmPerSabun'+GrpCd+CateCd).show();
								$('#ConfirmPerSabun'+GrpCd+CateCd).val('${result.confirmpersabun}');
							}
							if('${result.holidocflag}' == 'Y') $('#HoliDocFlag'+GrpCd+CateCd).attr("checked", true);
						}
					</c:forEach>
					GrpOpt += "<option value="+GrpCnt+" selected>"+GrpCnt+"</option>";
					$('#GrpOrder').html(GrpOpt);
					$('#GrpOrderLog').val(GrpCnt);
					
					if('${fn:length(CateOptPerList)}' != 0) {
						var Cnt = 0, GrpCd = "", CateCd = "", OptFlag = "", ChkAry = "", DelAry = "", PerNm = "", ChkVal = "", OldChkVal = "";
						<c:forEach var="result" items="${CateOptPerList}" varStatus="status">
							GrpCd = '${result.grpcd}';
							CateCd = '${result.catecd}';
							OptFlag = '${result.optflag}';
							DelFlag = '${result.delflag}';
							
							ChkVal = OptFlag + GrpCd + CateCd;
							if(Cnt != 0 && ChkVal != OldChkVal) {
								$('#'+OldChkVal).html(PerNm);
								PerNm = "";
								Cnt = 0;
							}
							
							if(DelFlag == 'N') {
								if(Cnt == 0) PerNm += "${result.pernm}";
								else {
									if(Cnt % 8 == 0) PerNm += ",<br/>${result.pernm}";
									else PerNm += ", ${result.pernm}";
								}
								Cnt++;
							}
							
							if(OptFlag == 'Public') {
								ChkAry = GrpCd+CateCd+'PublicAry';
								DelAry = GrpCd+CateCd+'PublicDelAry';
							}
							else {
								ChkAry = GrpCd+CateCd+'ReceiveAry';
								DelAry = GrpCd+CateCd+'ReceiveDelAry';
							}
							
							for(var oOo = 1; oOo < (Number($('#EmpCnt').val()) + 1); oOo++) {
								if($('#'+ChkAry+oOo).val() == '${result.persabun}' && DelFlag == 'N') {
									$('#'+ChkAry+oOo).attr("checked", true);
									$('#'+DelAry+oOo).val('${result.delflag}');
									if(Cnt == Number($('#EmpCnt').val())) $('#'+GrpCd+CateCd+OptFlag).attr("checked", true);
								}
							}
							OldChkVal = OptFlag + GrpCd + CateCd;
						</c:forEach>
						$('#'+OldChkVal).html(PerNm);
					}
				}
				else {
					$('#GrpOrder').html("<option value='1' selected>1</option>");
					$('#GrpOrderLog').val("1");
				}
			}
			
			// 그룹 추가&취소
			function GrpAdd(flag) {
				if(flag == 'Add') {
					$('#GrpAddView').show();
					$('#GrpNm').focus();
				}
				else {
					$('#GrpAddView').hide();
					$('#GrpNm').val("");
					$('#GrpInfo').val("");
					$('input:radio[name=ConfirmProcFlag]').attr("checked", false);
				}
			}
			
			// 그룹 추가 완료
			function GrpAddEnd() {
				$('#CMD').val('Add');
				$("#InfoMessage").val("그룹 추가 완료 되었습니다.");
				$('#ConfirmProcFlag').val($('input:radio[name=ConfirmFlag]:checked').val());
				$('#AdminMng').attr('action', "<c:url value='/GrpProcEnd.do'/>").submit();
			}
			
			// 그룹 수정&취소
			function GrpEdit(GrpCd, flag) {
				if(flag == 'Edit') $('#GrpEdit'+GrpCd).show();
				else $('#GrpEdit'+GrpCd).hide();
			}
			
			// 그룹 수정 완료
			function GrpEditEnd(GrpCd) {
				$('#CMD').val('Edit');
				$("#InfoMessage").val("그룹 수정 완료 되었습니다.");
				$('#GrpCd').val(GrpCd);
				$('#GrpNm').val($('#GrpNm'+GrpCd).val());
				$('#GrpInfo').val($('#GrpInfo'+GrpCd).val());
				$('#GrpOrder').val($('#GrpOrder'+GrpCd).val());
				$('#GrpOrderLog').val($('#GrpOrderLog'+GrpCd).val());
				$('#ConfirmProcFlag').val($('input:radio[name=ConfirmFlag'+GrpCd+']:checked').val());
				$('#AdminMng').attr('action', "<c:url value='/GrpProcEnd.do'/>").submit();
			}
			
			// 그룹 삭제 완료
			function GrpDelEnd(GrpCd, GrpNm) {
				if(confirm(GrpNm + " 그룹을 삭제하면 하위게시판 및 모든 글들이 삭제됩니다. 삭제 하시겠습니까?")) {
					$('#CMD').val('Del');
					$("#InfoMessage").val("삭제 완료 되었습니다.");
					$('#GrpCd').val(GrpCd);
					$('#AdminMng').attr('action', "<c:url value='/GrpProcEnd.do'/>").submit();
				}
				else {
					alert('삭제 취소 되었습니다.');
					return false;
				}
			}
			
			// 게시판 추가&취소
			function CateAdd(GrpCd, flag) {
				if(flag == 'Add') {
					$('#CateAdd'+GrpCd).show();
					$('#CateNm'+GrpCd).focus();
					$('#CateOrderLog').val($('#CateOrder'+GrpCd).val());
				}
				else {
					$('#CateAdd'+GrpCd).hide();
					$('#CateNm'+GrpCd).val("");
					$('#CateInfo'+GrpCd).val("");
					$('#CateOrderLog').val("");
				}
			}
			
			// 게시판 승인기능
			function ConfirmView(GrpCd) {
				if($('#ConfirmUse'+GrpCd).is(":checked")) $('#ConfirmPerSabun'+GrpCd).show();
				else $('#ConfirmPerSabun'+GrpCd).hide();
			}
			
			// 공개설정 및 수신설정 전체선택
			function SelAll(Obj) {
				var All = $('#'+Obj+'');
				var ChkList = $('input[name='+Obj+'Ary]');
				var DelList = $('input[name='+Obj+'DelAry]');

				if(!All.is(':checked')) {// 전체선택 체크박스가 해제되었다면
					for(var oOo = 0; oOo <= ChkList.length - 1; oOo++) {// 모든 체크박스를 체크해제
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
			
			// 공개설정 및 수신설정 개별선택
			function OneSel(Obj) {
				if($('#'+Obj).is(':checked')) $('#'+Obj.replace("Ary", "DelAry")).val("N");
				else $('#'+Obj.replace("Ary", "DelAry")).val("Y");
			}
			
			// 게시판 추가 완료
			function CateAddEnd(GrpCd) {
				$('#CMD').val('Add');
				$("#InfoMessage").val("게시판 추가 완료 되었습니다.");
				$('#GrpCd').val(GrpCd);
				$('#CateNm').val($('#CateNm'+GrpCd).val());
				$('#CateInfo').val($('#CateInfo'+GrpCd).val());
				$('#CateOrder').val($('#CateOrder'+GrpCd).val());
				if($('#ConfirmUse'+GrpCd).is(":checked")) $('#ConfirmPerSabun').val($('#ConfirmPerSabun'+GrpCd).val());
				else $('#ConfirmPerSabun').val("");
				if($('#HoliDocFlag'+GrpCd).is(":checked")) $('#HoliDocFlag').val("Y");
				for(var oOo = 1; oOo < (Number($('#EmpCnt').val()) + 1); oOo++) {
					$('#PublicValAry'+oOo).val($('#'+GrpCd+'PublicPerAry'+oOo).val());
					$('#PublicDelAry'+oOo).val($('#'+GrpCd+'PublicDelAry'+oOo).val());
					$('#ReceiveValAry'+oOo).val($('#'+GrpCd+'ReceivePerAry'+oOo).val());
					$('#ReceiveDelAry'+oOo).val($('#'+GrpCd+'ReceiveDelAry'+oOo).val());
				}
				$('#AdminMng').attr('action', "<c:url value='/CateProcEnd.do'/>").submit();
			}
			
			// 게시판 상세보기
			function CateView(GrpCd, CateCd) {
				if($('#CateView'+GrpCd+CateCd).attr("style").search("display: none") < 0) {
					$('#CateView'+GrpCd+CateCd).attr("style", "display: none;background-color:#FFF7E1;height:380px;");
				}
				else {
					$('#CateView'+GrpCd+CateCd).attr("style", "background-color:#FFF7E1;height:380px;");
				}
			}
			
			var Ele_Array = ["Title", "Nm", "Info", "Confirm", "HoliDoc", "SystemLink", "PublicAll", "Public", "ReceiveAll", "Receive", "Order", "Btn"];
			// 게시판 수정&취소
			function CateEdit(GrpCd, CateCd, flag) {
				for(var cnt = 0; cnt < Ele_Array.length; cnt++) {
					if(flag == 'Edit') {
						$('#'+Ele_Array[cnt]+GrpCd+CateCd+'Edit').show();
						$('#'+Ele_Array[cnt]+GrpCd+CateCd).hide();
					}
					else {
						$('#'+Ele_Array[cnt]+GrpCd+CateCd+'Edit').hide();
						$('#'+Ele_Array[cnt]+GrpCd+CateCd).show();
					}
				}
			}
			
			// 게시판 수정 완료
			function CateEditEnd(GrpCd, CateCd) {
				$('#CMD').val('Edit');
				$("#InfoMessage").val("게시판 수정 완료 되었습니다.");
				$('#GrpCd').val(GrpCd);
				$('#CateCd').val(CateCd);
				$('#CateNm').val($('#CateNm'+GrpCd+CateCd).val());
				$('#CateInfo').val($('#CateInfo'+GrpCd+CateCd).val());
				$('#CateOrder').val($('#CateOrder'+GrpCd+CateCd).val());
				$('#CateOrderLog').val($('#CateOrderLog'+GrpCd+CateCd).val());
				
				if($('#ConfirmUse'+GrpCd+CateCd).is(":checked")) $('#ConfirmPerSabun').val($('#ConfirmPerSabun'+GrpCd+CateCd).val());
				else $('#ConfirmPerSabun').val("");
				
				if($('#HoliDocFlag'+GrpCd+CateCd).is(":checked")) $('#HoliDocFlag').val("Y");
				else if(GrpCd == 1 && CateCd == 3) $('#HoliDocFlag').val("C");
				else if(GrpCd == 1 && CateCd == 8) $('#HoliDocFlag').val("F");
				
				for(var oOo = 1; oOo < (Number($('#EmpCnt').val()) + 1); oOo++) {
					$('#PublicValAry'+oOo).val($('#'+GrpCd+CateCd+'PublicPerAry'+oOo).val());
					$('#PublicDelAry'+oOo).val($('#'+GrpCd+CateCd+'PublicDelAry'+oOo).val());
					
					$('#ReceiveValAry'+oOo).val($('#'+GrpCd+CateCd+'ReceivePerAry'+oOo).val());
					$('#ReceiveDelAry'+oOo).val($('#'+GrpCd+CateCd+'ReceiveDelAry'+oOo).val());
				}
				$('#AdminMng').attr('action', "<c:url value='/CateProcEnd.do'/>").submit();
			}
			
			// 게시판 삭제 완료
			function CateDelEnd(GrpCd, CateCd, CateNm) {
				if(confirm(CateNm + " 게시판을 삭제하면 해당 게시판의 모든 글들이 삭제됩니다. 삭제 하시겠습니까?")) {
					$('#CMD').val('Del');
					$("#InfoMessage").val("삭제 완료 되었습니다.");
					$('#GrpCd').val(GrpCd);
					$('#CateCd').val(CateCd);
					$('#CateOrder').val($('#CateOrder'+GrpCd+CateCd).val());
					$('#AdminMng').attr('action', "<c:url value='/CateProcEnd.do'/>").submit();
				}
				else {
					alert('삭제 취소 되었습니다.');
					return false;
				}
			}
			-->
		</script>
	</head>
	<body>
	<form name="AdminMng" id="AdminMng" action="" method="post">
	<input type="hidden" name="message"			id="message"		value="${message}"/>
	<input type="hidden" name="InfoMessage"		id="InfoMessage"/>
	<input type="hidden" name="CMD"				id="CMD"/>
	<input type="hidden" name="GrpCd"			id="GrpCd"/>
	<input type="hidden" name="GrpOrderLog"		id="GrpOrderLog"/>
	<input type="hidden" name="ConfirmProcFlag" id="ConfirmProcFlag"/>
	<input type="hidden" name="HoliDocFlag"		id="HoliDocFlag"	value="N"/>
	<input type="hidden" name="CateCd"			id="CateCd"/>
	<input type="hidden" name="CateNm"			id="CateNm"/>
	<input type="hidden" name="CateInfo"		id="CateInfo"/>
	<input type="hidden" name="CateOrder"		id="CateOrder"/>
	<input type="hidden" name="CateOrderLog"	id="CateOrderLog"/>
	<input type="hidden" name="ConfirmPerSabun"	id="ConfirmPerSabun"/>
	<input type="hidden" name="EmpCnt"			id="EmpCnt"			value="${fn:length(EmpList)}"/>
	<input type="hidden" name="RegPerSabun"		id="RegPerSabun"	value="${loginVO.regPerSabun}"/>
	<div id="TitleTable" class="FixTable">
	<table class="subtable" border="0" cellpadding="0" cellspacing="0" style="height:100%">
		<c:set var="GrpCnt" value="0"/>
		<c:forEach var="result" items="${GrpCateList}" varStatus="status">
			<c:if test="${result.pcflag eq 'P'}">
				<c:set var="GrpCnt" value="${GrpCnt + 1}"/>
			</c:if>
		</c:forEach>
		<tr>
			<td class="input_search input_T Text_R" colspan="2">
				<!-- <a href="javascript:$('#AdminMng').attr('action', 'AdminMain.do').submit();" class="Btn" name="Orange">관리페이지가기</a> -->
			</td>
		</tr>
		<tr>
			<td class="Title_TB Text_L" style="height:40px;"><img src="images/sp/arrow3.gif" style="line-height:23px;vertical-align:middle;"> 게시판 관리</td>
			<td class="Title_TB Text_R">
				<a href="javascript:GrpAdd('Add');" class="Btn" name="LightBlue">그룹추가</a>
			</td>
		</tr>
		<tr id="GrpAddView" style="display:none;background-color:#FFF7E1;height:100px;">
			<td colspan="2" class="Text_L">
			<table class="subtable" border="0" cellpadding="0" cellspacing="0" style="width:98%">
				<tr>
					<td class="Title_TB Text_L" colspan="9" style="height:20px;">* 그룹추가</td>
				</tr>
				<tr>
					<td class="desc_BR Text_C" style="width:45px;">그룹명</td>
					<td class="input_BR Text_L"><input type="text" class="input_box" name="GrpNm" id="GrpNm"/></td>
					<td class="desc_BR Text_C" style="width:35px;">설명</td>
					<td class="input_BR Text_L"><input type="text" class="input_box" name="GrpInfo" id="GrpInfo" size="50"/></td>
					<td class="desc_BR Text_C" style="width:35px;">순서</td>
					<td class="input_BR Text_L">
						<select name="GrpOrder" id="GrpOrder"></select>
					</td>
					<td class="desc_BR Text_C">컨펌여부</td>
					<td class="input_BR Text_L">
						<input type="radio" name="ConfirmFlag" id="Yes" value="Y"/><label for="Yes">Y</label>
						<input type="radio" name="ConfirmFlag" id="No" value="N"/><label for="No">N</label>
					</td>
					<td class="input_BR Text_C">
						<a href="javascript:GrpAddEnd();" class="Btn" name="Orange">완료</a>
						<a href="javascript:GrpAdd('Cancel');" class="Btn" name="LightBlue">취소</a>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<table class="form3" border="0" cellpadding="0" cellspacing="0">
				<tr class="Text_C">
					<td class="grid_title" style="width:250px;">그룹(게시판)명</td>
					<td class="grid_title" style="width:500px;">그룹(게시판)설명</td>
					<td class="grid_title" style="width:100px;">수정및삭제</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	</div>
	<div id="PaddingTable">
	<div id="ContentTable" class="ConTable" onscroll="TableScrolling();">
	<table class="form3_noline" align="left" border="0" cellpadding="0" cellspacing="0">
		<c:if test="${fn:length(GrpCateList) eq 0}">
			<tr><td class="input_noline Text_C" style="width:850px;">검색된 데이터가 없습니다.</td></tr>
		</c:if>
	<c:set var="Cnt" value="0"/>
	<c:forEach var="result" items="${GrpCateList}" varStatus="status">
		<c:choose>
			<c:when test="${result.pcflag eq 'P'}">
				<!-- 그룹 보기 -->
				<tr ${spCmmVO.cellColor}>
					<c:choose>
						<c:when test="${result.cnt ne 0}">
							<td class="grid_input_LB Click Text_L" onclick="TrOpen(C${result.grpcd});" style="width:145px;"> + ${result.grpnm}</td>
						</c:when>
						<c:otherwise>
							<td class="grid_input_LB Text_L" style="width:145px;">${result.grpnm}</td>
						</c:otherwise>
					</c:choose>
					
					<td class="grid_input_BR Text_R" style="width:94px;">
						<a href="javascript:CateAdd('${result.grpcd}', 'Add');" class="Btn" name="LightBlue">게시판추가</a>
					</td>
					<td class="grid_input_B Text_L" style="width:345px;">${result.grpinfo}</td>
					<td class="grid_input_BR Text_R" style="width:144px;">(순서 : ${result.grporder}, 컨펌여부 : ${result.confirmprocflag})</td>
					<td class="grid_input_BR Text_C" style="width:99px;">
						<a href="javascript:GrpEdit('${result.grpcd}', 'Edit');" class="Btn" name="Orange">수정</a>
						<a href="javascript:GrpDelEnd('${result.grpcd}', '${result.grpnm}');" class="Btn" name="LightBlue">삭제</a>
					</td>
				</tr>
				<!-- 그룹 수정 -->
				<tr id="GrpEdit${result.grpcd}" style="display:none;background-color:#FFF7E1;height:70px;">
					<td class="grid_input_LBR Text_L" colspan="5">
					<table class="subtable" border="0" cellpadding="0" cellspacing="0" style="width:98%">
						<tr>
							<td class="Title_TB Text_L" colspan="9" style="height:20px;">* ${result.grpnm} 그룹 수정</td>
						</tr>
						<tr>
							<td class="desc_BR Text_C" style="width:45px;">그룹명</td>
							<td class="input_BR Text_L"><input type="text" class="input_box" name="GrpNm${result.grpcd}" id="GrpNm${result.grpcd}" value="${result.grpnm}"/></td>
							
							<td class="desc_BR Text_C" style="width:35px;">설명</td>
							<td class="input_BR Text_L"><input type="text" class="input_box" name="GrpInfo${result.grpcd}" id="GrpInfo${result.grpcd}" size="50" value="${result.grpinfo}"/></td>
							
							<td class="desc_BR Text_C" style="width:35px;">순서</td>
							<td class="input_BR Text_L">
								<input type="hidden" name="GrpOrderLog${result.grpcd}" id="GrpOrderLog${result.grpcd}" value="${result.grporder}"/>
								<select name="GrpOrder${result.grpcd}" id="GrpOrder${result.grpcd}">
									<c:forEach begin="1" end="${GrpCnt}" step="1" varStatus="status">
										<option value="${status.count}">${status.count}</option>
									</c:forEach>
								</select>
							</td>
							<td class="desc_BR Text_C">컨펌여부</td>
							<td class="input_BR Text_L">
								<input type="radio" name="ConfirmFlag${result.grpcd}" id="Yes" value="Y"/><label for="Yes">Y</label>
								<input type="radio" name="ConfirmFlag${result.grpcd}" id="No" value="N"/><label for="No">N</label>
							</td>
							<td class="input_BR Text_L">
								<a href="javascript:GrpEditEnd('${result.grpcd}');" class="Btn" name="LightBlue">완료</a>
								<a href="javascript:GrpEdit('${result.grpcd}', 'Cancel');" class="Btn" name="Orange">취소</a>
							</td>
						</tr>
					</table>
					</td>
				</tr>
				
				<!-- 게시판 추가 -->
				<tr id="CateAdd${result.grpcd}" style="display:none;background-color:#FFF7E1;height:380px;">
					<td class="grid_input_LBR Text_L" colspan="5">
					<table class="subtable" border="0" cellpadding="0" cellspacing="0" style="width:98%">
						<tr>
							<td class="Title_TB Text_L" colspan="9">* ${result.grpnm} 게시판 추가</td>
						</tr>
						<tr>
							<td class="desc_BR Text_C" style="width:150px;">게시판명</td>
							<td class="input_BR Text_L"><input type="text" class="input_box" name="CateNm${result.grpcd}" id="CateNm${result.grpcd}" size="70"/></td>
						</tr>
						<tr>
							<td class="desc_BR Text_C">설명</td>
							<td class="input_BR Text_L">
								<textarea name="CateInfo${result.grpcd}" id="CateInfo${result.grpcd}" cols="50" rows="4" style="ime-mode:active;"></textarea>
							</td>
						</tr>
						<c:if test="${result.confirmprocflag eq 'Y'}">
						<tr>
							<td class="desc_BR Text_C">승인기능</td>
							<td class="input_BR Text_L">
								<input type="checkbox" name="ConfirmUse${result.grpcd}" id="ConfirmUse${result.grpcd}" onclick="ConfirmView('${result.grpcd}');"><label for="ConfirmUse${result.grpcd}">사용</label>
								<select name="ConfirmPerSabun${result.grpcd}" id="ConfirmPerSabun${result.grpcd}" style="display:none;">
									<c:forEach var="EmpResult" items="${EmpList}" varStatus="status">
										<option value="${EmpResult.persabun}">${EmpResult.pernm}</option>
										
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="desc_BR Text_C">휴가보고서여부</td>
							<td class="input_BR Text_L">
								<input type="checkbox" name="HoliDocFlag${result.grpcd}" id="HoliDocFlag${result.grpcd}"><label for="HoliDocFlag${result.grpcd}">사용</label>
								(해당 보고서가 휴가 보고서일 경우 체크 하세요. 이는 스케쥴러 및 연차와 연동됩니다.)
							</td>
						</tr>
						</c:if>
						<tr style="height:50px;">
							<td class="desc_BR Text_C">
								공개설정<br/><input type="checkbox" name="${result.grpcd}Public" id="${result.grpcd}Public" onclick="SelAll(this.name)"/>
								<label for="${result.grpcd}Public"><font style="font-weight:bold;">전체공개</font></label>
							</td>
							<td class="input_BR Text_L">
								<c:forEach var="EmpResult" items="${EmpList}" varStatus="status">
									<input type="hidden" name="PublicValAry${status.count}" id="PublicValAry${status.count}"/>
									<input type="hidden" name="PublicDelAry${status.count}" id="PublicDelAry${status.count}"/>
									<input type="hidden" name="ReceiveValAry${status.count}" id="ReceiveValAry${status.count}"/>
									<input type="hidden" name="ReceiveDelAry${status.count}" id="ReceiveDelAry${status.count}"/>
									<input type="checkbox" name="${result.grpcd}PublicAry" id="${result.grpcd}PublicAry${status.count}" value="${EmpResult.persabun}" onclick="OneSel(this.id);"/>
									<label for="${result.grpcd}PublicAry${status.count}">${EmpResult.pernm}</label>
									<input type="hidden" name="${result.grpcd}PublicPerAry" id="${result.grpcd}PublicPerAry${status.count}" value="${EmpResult.persabun}"/>
									<input type="hidden" name="${result.grpcd}PublicDelAry" id="${result.grpcd}PublicDelAry${status.count}" value="Y"/>
									<c:if test="${status.count % 8 eq 0}"><br/></c:if>
								</c:forEach>
							</td>
						</tr>
						<tr style="height:50px;">
							<td class="desc_BR Text_C">
								이메일 및 문자 수신설정<br/><input type="checkbox" name="${result.grpcd}Receive" id="${result.grpcd}Receive" onclick="SelAll(this.name)"/>
								<label for="${result.grpcd}Receive"><font style="font-weight:bold;">전체수신</font></label>
							</td>
							<td class="input_BR Text_L">
								<c:forEach var="EmpResult" items="${EmpList}" varStatus="status">
									<input type="checkbox" name="${result.grpcd}ReceiveAry" id="${result.grpcd}ReceiveAry${status.count}" value="${EmpResult.persabun}" onclick="OneSel(this.id);"/>
									<label for="${result.grpcd}ReceiveAry${status.count}">${EmpResult.pernm}</label>
									<input type="hidden" name="${result.grpcd}ReceivePerAry" id="${result.grpcd}ReceivePerAry${status.count}" value="${EmpResult.persabun}"/>
									<input type="hidden" name="${result.grpcd}ReceiveDelAry" id="${result.grpcd}ReceiveDelAry${status.count}" value="Y"/>
									<c:if test="${status.count % 8 eq 0}"><br/></c:if>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td class="desc_BR Text_C" style="width:35px;">순서</td>
							<td class="input_BR Text_L">
								<select name="CateOrder${result.grpcd}" id="CateOrder${result.grpcd}"></select>
							</td>
						</tr>
						<tr>	
							<td class="input_BR Text_C" colspan="2">
								<a href="javascript:CateAddEnd('${result.grpcd}');" class="Btn" name="Orange">완료</a>
								<a href="javascript:CateAdd('${result.grpcd}', 'Cancel');" class="Btn" name="LightBlue">취소</a>
							</td>
						</tr>
					</table>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<!-- 게시판 보기 -->
				<tr id="C${result.grpcd}" ${spCmmVO.hopeCellColor} class="Click" style="display: none;" onClick="CateView('${result.grpcd}', '${result.catecd}');">
					<td class="grid_input_LBR Text_L" colspan="2" style="width:244px;"> - ${result.grpnm}</td>
					<td class="grid_input_B Text_L" style="width:345px;">${fn:replace(result.grpinfo, cn, br)}</td>
					<td class="grid_input_BR Text_R" style="width:144px;">(순서 : ${result.cateorder})</td>
					<td class="grid_input_BR Text_C" style="width:99px;">&nbsp;</td>
				</tr>
				<!-- 게시판 상세보기&수정 -->
				<c:set var="EditCd" value="${result.grpcd}${result.catecd}"/>
				<tr id="CateView${EditCd}" style="display: none;background-color:#FFF7E1;height:380px;">
					<td class="grid_input_LBR Text_L" colspan="5">
					<table class="subtable" border="0" cellpadding="0" cellspacing="0" style="width:98%">
						<tr>
							<td class="Title_TB Text_L" colspan="9">
								<span id="Title${EditCd}">* ${result.grpnm} 게시판 정보</span>
								<span id="Title${EditCd}Edit" style="display:none;">* ${result.grpnm} 게시판 수정</span>
							</td>
						</tr>
						<tr>
							<td class="desc_BR Text_C" style="width:150px;">게시판명</td>
							<td class="input_BR Text_L">
								<span id="Nm${EditCd}">${result.grpnm}</span>
								<span id="Nm${EditCd}Edit" style="display:none;"><input type="text" class="input_box" name="CateNm${EditCd}" id="CateNm${EditCd}" size="70" value="${result.grpnm}"/></span>
							</td>
						</tr>
						<tr>
							<td class="desc_BR Text_C">설명</td>
							<td class="input_BR Text_L">
								<span id="Info${EditCd}">${fn:replace(result.grpinfo, cn, br)}</span>
								<span id="Info${EditCd}Edit" style="display:none;"><textarea name="CateInfo${EditCd}" id="CateInfo${EditCd}" cols="50" rows="4" style="ime-mode:active;">${result.grpinfo}</textarea></span>
							</td>
						</tr>
						<c:if test="${result.confirmprocflag eq 'Y'}">
						<tr>
							<td class="desc_BR Text_C">승인기능</td>
							<td class="input_BR" style="text-align:center;">
								<span id="Confirm${EditCd}">${result.confirmprocnm} <c:if test="${result.confirmpernm ne null}">(승인자 : ${result.confirmpernm})</c:if></span>
								<span id="Confirm${EditCd}Edit" style="display:none;">
									<input type="checkbox" name="ConfirmUse${EditCd}" id="ConfirmUse${EditCd}" onclick="ConfirmView('${EditCd}');"><label for="ConfirmUse${EditCd}">사용</label>
									<select name="ConfirmPerSabun${EditCd}" id="ConfirmPerSabun${EditCd}" style="display:none;">
										<c:forEach var="EmpResult" items="${EmpList}" varStatus="status">
											<option value="${EmpResult.persabun}">${EmpResult.pernm}</option>
										</c:forEach>
									</select>
								</span>
							</td>
						</tr>
						<tr>
							<td class="desc_BR Text_C">휴가보고서여부</td>
							<td class="input_BR Text_L">
								<span id="HoliDoc${EditCd}">${result.holidocflagnm}</span>
								<span id="HoliDoc${EditCd}Edit" style="display:none;">
								<input type="checkbox" name="HoliDocFlag${EditCd}" id="HoliDocFlag${EditCd}"><label for="HoliDocFlag${EditCd}">사용</label>
								(해당 보고서가 휴가 보고서일 경우 체크 하세요. 이는 스케쥴러 및 연차와 연동됩니다.)
								</span>
							</td>
						</tr>
						</c:if>
						<tr style="height:50px;">
							<td class="desc_BR Text_C">
								공개설정<br/>
								<span id="PublicAll${EditCd}"></span>
								<span id="PublicAll${EditCd}Edit" style="display:none;">
								<input type="checkbox" name="${EditCd}Public" id="${EditCd}Public" onclick="SelAll(this.name)"/>
								<label for="${EditCd}Public"><font style="font-weight:bold;">전체공개</font></label>
								</span>
							</td>
							<td class="input_BR Text_L">
								<span id="Public${EditCd}"></span>
								<span id="Public${EditCd}Edit" style="display:none;">
								
								<c:forEach var="EmpResult" items="${EmpList}" varStatus="status">
									<input type="checkbox" name="${EditCd}PublicAry" id="${EditCd}PublicAry${status.count}" value="${EmpResult.persabun}" onclick="OneSel(this.id);"/>
									<label for="${EditCd}PublicAry${status.count}">${EmpResult.pernm}</label>
									<input type="hidden" name="${EditCd}PublicPerAry" id="${EditCd}PublicPerAry${status.count}" value="${EmpResult.persabun}"/>
									<input type="hidden" name="${EditCd}PublicDelAry" id="${EditCd}PublicDelAry${status.count}" value="Y"/>
									<c:if test="${status.count % 8 eq 0}"><br/></c:if>
								</c:forEach>
								</span>
							</td>
						</tr>
						<tr style="height:50px;">
							<td class="desc_BR Text_C">
								이메일 및 문자 수신설정<br/>
								<span id="ReceiveAll${EditCd}"></span>
								<span id="ReceiveAll${EditCd}Edit" style="display:none;">
								<input type="checkbox" name="${EditCd}Receive" id="${EditCd}Receive" onclick="SelAll(this.name)"/>
								<label for="${EditCd}Receive"><font style="font-weight:bold;">전체수신</font></label>
								</span>
							</td>
							<td class="input_BR Text_L">
								<span id="Receive${EditCd}"></span>
								<span id="Receive${EditCd}Edit" style="display:none;">
								
								<c:forEach var="EmpResult" items="${EmpList}" varStatus="status">
									<input type="checkbox" name="${EditCd}ReceiveAry" id="${EditCd}ReceiveAry${status.count}" value="${EmpResult.persabun}" onclick="OneSel(this.id);"/>
									<label for="${EditCd}ReceiveAry${status.count}">${EmpResult.pernm}</label>
									<input type="hidden" name="${EditCd}ReceivePerAry" id="${EditCd}ReceivePerAry${status.count}" value="${EmpResult.persabun}"/>
									<input type="hidden" name="${EditCd}ReceiveDelAry" id="${EditCd}ReceiveDelAry${status.count}" value="Y"/>
									<c:if test="${status.count % 8 eq 0}"><br/></c:if>
								</c:forEach>
								</span>
							</td>
						</tr>
						<tr>
							<td class="desc_BR Text_C" style="width:35px;">순서</td>
							<td class="input_BR Text_L">
								<input type="hidden" name="CateOrderLog${EditCd}" id="CateOrderLog${EditCd}" value="${result.cateorder}"/>
								<span id="Order${EditCd}">${result.cateorder}</span>
								<span id="Order${EditCd}Edit" style="display:none;"><select name="CateOrder${EditCd}" id="CateOrder${EditCd}"></select></span>
							</td>
						</tr>
						<tr>
							<td class="input_BR Text_C" colspan="2">
								<span id="Btn${EditCd}">
									<a href="javascript:CateEdit('${result.grpcd}', '${result.catecd}', 'Edit');" class="Btn" name="Orange">수정</a>
									<a href="javascript:CateDelEnd('${result.grpcd}', '${result.catecd}', '${result.grpnm}');" class="Btn" name="Orange">삭제</a>
									<a href="javascript:CateView('${result.grpcd}', '${result.catecd}');" class="Btn" name="LightBlue">닫기</a>
								</span>
								<span id="Btn${EditCd}Edit" style="display:none;">
									<a href="javascript:CateEditEnd('${result.grpcd}', '${result.catecd}');" class="Btn" name="LightBlue">수정완료</a>
									<a href="javascript:CateEdit('${result.grpcd}', '${result.catecd}', 'Cancel');" class="Btn" name="LightBlue">취소</a>
								</span>
							</td>
						</tr>
					</table>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</table>
	</div>
	</div>
	</form>
	</body>
</html>