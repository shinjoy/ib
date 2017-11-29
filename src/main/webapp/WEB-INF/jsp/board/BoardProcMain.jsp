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
		<style type="text/css">
			html,body {
				height:90%;
			}
		</style>
		<script type="text/javaScript" language="javascript">
			
			if('${vo.CMD}' == 'Add') top.document.title = "게시물등록";
			else top.document.title = "게시물수정";
			
			$(document).ready(function () {
				$(window).load(function() {
					InfoMessageView();
					DataSet();
				});
			});
			
			// 보고서게시판일시 중간승인자와 참조인 셋팅
			function DataSet() {
				
				$('#CateCd').val($('#CateList').val().split("_-_")[0]);
				$('#ConfirmPerSabun').val($('#CateList').val().split("_-_")[1]);
				$('#ConfirmPerNm').val($('#CateList').val().split("_-_")[2]);
				$('#HoliDocFlag').val($('#CateList').val().split("_-_")[3]);
				
				if($('#HoliDocFlag').val() == 'F') $('#BoardProcMain').attr('action', "<c:url value='FamilyEventProc.do'/>");
				else if($('#HoliDocFlag').val() == 'Y') $('#BoardProcMain').attr('action', "<c:url value='HolidayProc.do'/>");
				else if($('#HoliDocFlag').val() == 'C') $('#BoardProcMain').attr('action', "<c:url value='HolidayCancelProc.do'/>");
				else $('#BoardProcMain').attr('action', "<c:url value='BoardProc.do'/>");
				$('#BoardProcMain').attr('target', 'SelView').submit();
			}
			
			function CateSet(Val) {
				$('#CateCd').val($('#CateList').val().split("_-_")[0]);
				$('#ConfirmPerSabun').val($('#CateList').val().split("_-_")[1]);
				$('#ConfirmPerNm').val($('#CateList').val().split("_-_")[2]);
				$('#HoliDocFlag').val($('#CateList').val().split("_-_")[3]);
				
				if($('#HoliDocFlag').val() == 'F') $('#BoardProcMain').attr('action', "<c:url value='FamilyEventProc.do'/>");
				else if($('#HoliDocFlag').val() == 'Y') $('#BoardProcMain').attr('action', "<c:url value='HolidayProc.do'/>");
				else if($('#HoliDocFlag').val() == 'C') $('#BoardProcMain').attr('action', "<c:url value='HolidayCancelProc.do'/>");
				else $('#BoardProcMain').attr('action', "<c:url value='BoardProc.do'/>");
				$('#BoardProcMain').attr('target', 'SelView').submit();
			}
			
		</script>
	</head>
	<body>
	<form name="BoardProcMain" id="BoardProcMain" method="post" enctype="multipart/form-data">
	<input type="hidden" name="message"			id="message"			value="${message}"/>
	<input type="hidden" name="InfoMessage"		id="InfoMessage"/>
	<input type="hidden" name="GrpCd"			id="GrpCd"				value="${vo.grpCd}"/>
	<input type="hidden" name="CateCd"			id="CateCd"				value="${vo.cateCd}"/>
	<input type="hidden" name="WriteCd"			id="WriteCd"			value="${vo.writeCd}"/>
	<input type="hidden" name="ConfirmProcFlag"	id="ConfirmProcFlag"	value="${vo.confirmProcFlag}"/>
	<input type="hidden" name="ConfirmPerSabun"	id="ConfirmPerSabun"/>
	<input type="hidden" name="ConfirmPerNm"	id="ConfirmPerNm"/>
	<input type="hidden" name="HoliDocFlag"		id="HoliDocFlag"/>
	<input type="hidden" name="CMD"				id="CMD"				value="${vo.CMD}"/>
	<input type="hidden" name="PopFlag"			id="PopFlag"			value="${vo.popFlag}"/>
	<input type="hidden" name="EmpCnt"			id="EmpCnt"				value="${EmpCnt}"/>
	<input type="hidden" name="RegPerSabun"		id="RegPerSabun"		value="${loginVO.regPerSabun}"/>
	<input type="hidden" name="WriteStatus"		id="WriteStatus"/>
	<input type="hidden" name="OldWriteStatus"	id="OldWriteStatus"		value="${BoardInfo.writeStatus}"/>
	<input type="hidden" name="BoardVer"		id="BoardVer"			value="${BoardInfo.boardVer}"/>
	<table class="subtable" border="0" cellpadding="0" cellspacing="0" width="1024">
		<tr>
			<td class="Title_TB Text_L" colspan="2" style="height:40px;"><img src="images/sp/arrow3.gif" style="line-height:23px;vertical-align:middle;"> 게시물등록</td>
		</tr>
		<tr>
			<td class="desc_BR Text_C" style="width:12%;">게시판</td>
			<td class="input_B Text_L">
				<c:choose>
					<c:when test="${fn:length(BoardCateList) eq 0}">${vo.grpNm}</c:when>
					<c:when test="${vo.CMD eq 'Add'}">
						<select name="CateList" id="CateList" onchange="CateSet(this.value);">
						<c:forEach var="result" items="${BoardCateList}" varStatus="status">
							<c:choose>
								<c:when test="${vo.cateCd eq result.catecd}"><option value="${result.catecd}_-_${result.confirmpersabun}_-_${result.confirmpernm}_-_${result.holidocflag}" selected>${result.catenm}</option></c:when>
								<c:otherwise><option value="${result.catecd}_-_${result.confirmpersabun}_-_${result.confirmpernm}_-_${result.holidocflag}">${result.catenm}</option></c:otherwise>
							</c:choose>
						</c:forEach>
						</select>
					</c:when>
					<c:otherwise>
						<select name="CateList" id="CateList" onchange="CateSet(this.value);" style="display:none;">
						<c:forEach var="result" items="${BoardCateList}" varStatus="status">
							<c:choose>
								<c:when test="${vo.cateCd eq result.catecd}">
									<option value="${result.catecd}_-_${result.confirmpersabun}_-_${result.confirmpernm}_-_${result.holidocflag}" selected>${result.catenm}</option>
									<c:set var="CateNm" value="${result.catenm}"/>
								</c:when>
								<c:otherwise><option value="${result.catecd}_-_${result.confirmpersabun}_-_${result.confirmpernm}_-_${result.holidocflag}">${result.catenm}</option></c:otherwise>
							</c:choose>
						</c:forEach>
						</select>
						${CateNm}
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	<iframe name="SelView" id="SelView" frameborder="0" width="100%" height="750"></iframe>
	</form>
	</body>
</html>