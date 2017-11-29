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
			<!--
			
			$(document).ready(function () {
				$(window).load(function() {
					BtnSet();
				});
			});
			
			function CateSet(Val) {
				$('#CateCd').val($('#CateList').val().split("_-_")[0]);
			}
			
			// 게시물 이동 완료
			function BoardMoveEnd() {
				if(confirm('해당 게시물을 이동하시겠습니까?')) {
					$('#InfoMessage').val("이동 완료 되었습니다.");
					$('#BoardMove').attr('target', 'content').attr('action', '<c:url value="/BoardMoveEnd.do"/>').submit();
				}
				else {
					alert('이동 취소 되었습니다.');
					return false;
				}
			}
			
			-->
		</script>
	</head>
	<body>
	<form name="BoardMove" id="BoardMove" method="post">
	<input type="hidden" name="InfoMessage"		id="InfoMessage"/>
	<input type="hidden" name="GrpCd"			id="GrpCd"				value="${vo.grpCd}"/>
	<input type="hidden" name="CateCd"			id="CateCd"/>
	<input type="hidden" name="WriteCd"			id="WriteCd"			value="${vo.writeCd}"/>
	<input type="hidden" name="OldCateCd"		id="OldCateCd"			value="${vo.cateCd}"/>
	<input type="hidden" name="OldWriteCd"		id="OldWriteCd"			value="${vo.writeCd}"/>
	<input type="hidden" name="ConfirmProcFlag"	id="ConfirmProcFlag"	value="${vo.confirmProcFlag}"/>
	<input type="hidden" name="ConfirmPerSabun"	id="ConfirmPerSabun"/>
	<input type="hidden" name="ConfirmPerNm"	id="ConfirmPerNm"/>
	<input type="hidden" name="HoliDocFlag"		id="HoliDocFlag"/>
	<input type="hidden" name="RegPerSabun"		id="RegPerSabun"		value="${loginVO.regPerSabun}"/>
	<table class="subtable" border="0" cellpadding="0" cellspacing="0" style="width:300px;" align="center">
		<tr>
			<td class="Title_TBR Text_L" colspan="2" style="height:40px;"><img src="images/sp/arrow3.gif" style="line-height:23px;vertical-align:middle;"> 게시물이동</td>
		</tr>
		<tr>
			<td class="desc_BR Text_C" style="width:120px">기존게시판</td>
			<td class="input_BR Text_L">
				<c:choose>
					<c:when test="${fn:length(BoardCateList) eq 0}">${vo.grpNm}</c:when>
					<c:otherwise>
						<c:forEach var="result" items="${BoardCateList}" varStatus="status">
							<c:if test="${vo.cateCd eq result.catecd}">
								${result.catenm}
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td class="desc_BR Text_C" style="width:120px">이동할게시판</td>
			<td class="input_BR Text_L">
				<select name="CateList" id="CateList" onchange="CateSet(this.value);">
				<c:forEach var="result" items="${BoardCateList}" varStatus="status">
					<c:if test="${vo.cateCd ne result.catecd && vo.grpCd eq 1 && (result.catecd ne 2 && result.catecd ne 3 && result.catecd ne 8)}">
						<option value="${result.catecd}_-_${result.confirmpersabun}_-_${result.confirmpernm}_-_${result.holidocflag}" selected>${result.catenm}</option>
						<script>$('#CateCd').val('${result.catecd}');</script>
					</c:if>
					
					<c:if test="${vo.grpCd ne 1 && vo.cateCd ne result.catecd}">
						<option value="${result.catecd}_-_${result.confirmpersabun}_-_${result.confirmpernm}_-_${result.holidocflag}" selected>${result.catenm}</option>
						<script>$('#CateCd').val('${result.catecd}');</script>
					</c:if>
				</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td class="input_noline Text_C" colspan="4">
				<a href="javascript:BoardMoveEnd();" class="Btn" name="LightBlue">이동</a>
				<a href="javascript:parent.LayerClose();" class="Btn" name="LightBlue">취소</a>
			</td>
		</tr>
	</table>
	</form>
	</body>
</html>