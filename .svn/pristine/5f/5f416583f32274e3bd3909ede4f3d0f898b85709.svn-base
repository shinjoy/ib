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
		<script type="text/javaScript" src="js/sp/synergy_util.js"></script>
		<script type="text/javaScript" src="js/sp/jquery-1.8.2.min.js"></script>
		<style>
			
		</style>
		<script type="text/javaScript" language="javascript">
			<!--
			top.document.title = "${GrpInfo.grpNm}";
			
			$(document).ready(function () {
				$(window).load(function() {
					$('#PaddingTable').attr('style', 'padding-top:'+$('#TitleTable').height()+'px;');
					InfoMessageView();
					if($('#OrderKey').val() != '') ListOrderTitleSet();
					
					$('#WinClose').click(function() {
						if($('#WinClose').is(':checked')) setWinCookie('return', 'Y', 1);
						self.close();
					});
					BtnSet();
				});
			});
			
			// 게시물 상세보기
			function BoardView(GrpCd, CateCd, WriteCd) {
				$('#GrpCd').val(GrpCd);
				$('#CateCd').val(CateCd);
				$('#WriteCd').val(WriteCd);
				$('#ReturnList').attr('action', "<c:url value='/BoardView.do'/>").submit();
			}
			-->
		</script>
	</head>
	<body>
	<form name="ReturnList" id="ReturnList" action="<c:url value='/ReturnList.do'/>" method="post">
	<input type="hidden" name="InfoMessage"		id="InfoMessage"/>
	<input type="hidden" name="message"			id="message"			value="${message}"/>
	<input type="hidden" name="CMD"				id="CMD"				value="ReturnList"/>
	<input type="hidden" name="PopFlag"			id="PopFlag"			value="Pop"/>
	<input type="hidden" name="GrpCd"			id="GrpCd"/>
	<input type="hidden" name="CateCd"			id="CateCd"/>
	<input type="hidden" name="WriteCd"			id="WriteCd"/>
	<input type="hidden" name="OrderType"		id="OrderType"			value="${spCmmVO.orderType}"/>
	<input type="hidden" name="OrderKey"		id="OrderKey"			value="${spCmmVO.orderKey}"/>
	<input type="hidden" name="OrderObj"		id="OrderObj"			value="${spCmmVO.orderObj}"/>
	<input type="hidden" name="OrderObjNm"		id="OrderObjNm"			value="${spCmmVO.orderObjNm}"/>
	<input type="hidden" name="OrderFlag"		id="OrderFlag"			value="${spCmmVO.orderFlag}"/>
	<div id="TitleTable" class="FixTable">
	<table class="subtable" border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
		<tr>
			<td class="Title_TB Text_L" colspan="2" style="height:40px;"><img src="images/sp/arrow3.gif" style="line-height:23px;vertical-align:middle;"> 반송된 문서</td>
		</tr>	
		<tr>
			<td colspan="2">
			<table class="form3" border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr class="Text_C Click">
					<td class="grid_title" style="width:5%;">순번</td>
					<td class="grid_title" style="width:15%;" id="Order1" onclick="javascript:ListOrderSet('ReturnList.do', '_self', 'ReturnList', this.id, '보고서명', 'CateNm', 'S');">보고서명(▲)</td>
					<td class="grid_title" style="width:*;" id="Order2" onclick="javascript:ListOrderSet('ReturnList.do', '_self', 'ReturnList', this.id, '제목', 'WriteTitle', 'S');">제목(▲)</td>
					<td class="grid_title" style="width:5%;">파일</td>
					<td class="grid_title" style="width:10%;" id="Order3" onclick="javascript:ListOrderSet('ReturnList.do', '_self', 'ReturnList', this.id, '작성일', 'RegDate', 'S');">작성일(▲)</td>
					<td class="grid_title" style="width:10%;" id="Order4" onclick="javascript:ListOrderSet('ReturnList.do', '_self', 'ReturnList', this.id, '작성자', 'PerNm', 'S');">작성자(▲)</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	</div>
	<div id="PaddingTable">
	<div id="ContentTable" class="ConTable" onscroll="TableScrolling();">
	<table class="form3_noline" border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
		<c:forEach var="result" items="${ReturnList}" varStatus="status">
			<tr class="Text_C Click" onclick="javascript:BoardView('${result.grpcd}', '${result.catecd}', '${result.writecd}');" ${spCmmVO.cellColor}>
				<td class="grid_input_LBR" style="width:5%;">${status.count}</td>
				<td class="grid_input_BR" style="width:15%;">${result.catenm}</td>
				<td class="grid_input_BR Text_L" style="width:*;">${result.writetitle}</td>
				<td class="grid_input_BR" id="FileBtn" style="width:5%;">
					<c:if test="${result.filecnt ne 0}"><img src="<c:url value='/images/sp/file.gif'/>" align="middle"></c:if>
				</td>
				<td class="grid_input_BR" style="width:10%;">${result.regdate} (${result.datenm})</td>
				<td class="grid_input_BR" style="width:10%;">${result.pernm}</td>
			</tr>
		</c:forEach>
		<tr>
			<td class="input_noline Text_L" colspan="3" style="padding:10px;">
				<input type="checkbox" name="WinClose" id="WinClose"><label for="WinClose">오늘하루 열지 않음</label>
			</td>
			<td class="input_noline Text_R" colspan="3" style="padding:10px;">
				<a href="javascript:self.close();" class="Btn" name="LightBlue">닫기</a>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</form>
	</body>
</html>