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
		<script type="text/javaScript" language="javascript">
			
			top.document.title = "${GrpInfo.grpNm}";
			
			$(document).ready(function () {
				$(window).load(function() {
					$('#PaddingTable').attr('style', 'padding-top:'+$('#TitleTable').height()+'px;');
					InfoMessageView();
					if($('#OrderKey').val() != '') ListOrderTitleSet();
					
					var Month = '';
					if('${vo.regMonth}'.substring(0, 1) == '0') Month = '${vo.regMonth}'.replace('0', '');
					else Month = '${vo.regMonth}';
					$('#Month'+Month).attr("name", "Orange");
					BtnSet();
				});
			});
			
			// 게시물 등록
			function BoardAdd() {
				$('#CMD').val('Add');
				$('#BoardList').attr('action', '<c:url value="/BoardProcMain.do"/>').submit();
			}
			
			// 게시물 상세보기
			function BoardView(GrpCd, CateCd, WriteCd) {
				$('#CateCd').val(CateCd);
				$('#WriteCd').val(WriteCd);
				$('#BoardList').attr('action', '<c:url value="/BoardView.do"/>').submit();
			}
			
			// 게시물 열람자 정보
			function ReadLogView(GrpCd, CateCd, WriteCd) {
				$('<div id="BackDiv" onclick="LayerClose();"></div>').css('opacity',0.3).appendTo('body');
				$('#BackDiv').css('top', document.body.scrollTop);
				$('#ViewDiv').css('left', '50%').css('z-index', '100').css('width', '300').css('height', '300').css('background', '#F0F4FD').fadeIn(300);
				
				var LayerCon = "<br/><iframe id='ReadLogView' src='<c:url value='/BoardReadLogList.do?GrpCd="+GrpCd+"&CateCd="+CateCd+"&WriteCd="+WriteCd+"'/>' frameborder='0' width='100%' height='100%'/>";
			    $('#ViewDiv').html(LayerCon);
			    var ViewDivTop = (screen.height - $('#ViewDiv').css('height').replace('px', '')) / 2;
				$('#ViewDiv').css('top', document.body.scrollTop + ViewDivTop);
				$("body").css("overflow","hidden");
			}
			
			// 레이어 닫기
			function LayerClose() {
				$("#BackDiv").remove();
				$("#ViewDiv").hide();
				$("body").css("overflow","auto");
			}
			
			// 달력 검색
			function SearchEnd(Month) {
				if(Month.length == 1) Month = "0" + Month;
				$('#RegMonth').val(Month);
				$('#BoardList').submit();
			}
			
			function linkPage(pageNo){
				$('#BoardList').attr('action', "<c:url value='/BoardList.do?currentPageNo="+pageNo+"'/>").submit();
			}
			
			function noReadSearch(flag){
				if(flag == 'all'){
					$('#readN').val('');
				}else{
					$('#readN').val('Y');
				}
				$('#BoardList').submit();
			}
			
		</script>
		<style>
		.activeBtn{
			    padding: 3px;
			    border: 1px solid #adabab;
			    background: white;
			    margin-right: 3px;
		}
		.btnSpan{
			        padding: 3px;
				    border: 1px solid #adabab;
				    background: #d2d0d0;
				    margin-right: 3px;
				    color: gray;
		}
		
		</style>
	</head>
	<body>
	<form name="BoardList" id="BoardList" action="<c:url value='/BoardList.do'/>" method="post">
	<input type="hidden" name="InfoMessage"		id="InfoMessage"/>
	<input type="hidden" name="message"			id="message"			value="${message}"/>
	<input type="hidden" name="CMD"				id="CMD"/>
	<input type="hidden" name="GrpCd"			id="GrpCd"				value="${vo.grpCd}"/>
	<input type="hidden" name="CateCd"			id="CateCd"				value="${vo.cateCd}"/>
	<input type="hidden" name="WriteCd"			id="WriteCd"/>
	<input type="hidden" name="ConfirmProcFlag"	id="ConfirmProcFlag"	value="${GrpInfo.confirmProcFlag}"/>
	<input type="hidden" name="GrpNm"			id="GrpNm"				value="${GrpInfo.grpNm}"/>
	<input type="hidden" name="RegPerSabun"		id="RegPerSabun"		value="${loginVO.regPerSabun}"/>
	<input type="hidden" name="OrderType"		id="OrderType"			value="${spCmmVO.orderType}"/>
	<input type="hidden" name="OrderKey"		id="OrderKey"			value="${spCmmVO.orderKey}"/>
	<input type="hidden" name="OrderObj"		id="OrderObj"			value="${spCmmVO.orderObj}"/>
	<input type="hidden" name="OrderObjNm"		id="OrderObjNm"			value="${spCmmVO.orderObjNm}"/>
	<input type="hidden" name="OrderFlag"		id="OrderFlag"			value="${spCmmVO.orderFlag}"/>
	<input type="hidden" name="readN"			id="readN"				value="${vo.readN}"/>
	<div id="ViewDiv" style="display:none;"></div>
	<div id="TitleTable" class="FixTable">
	<table class="subtable" border="0" cellpadding="0" cellspacing="0" style="word-break:break-all;width:1024px;">
		<tr>
			<td class="input_T input_search Text_L" style="height:40px;">
				<span style="margin-right:5px;">
					<label><input type="radio"   ${vo.readN == '' ? 'checked' : ''} onclick="javascript:noReadSearch('all');" /><strong ${vo.readN == '' ? 'style="background:#f9bb07;padding: 3px;"' : ''}>전체보기</strong></label>
					<label><input type="radio"   ${vo.readN == 'Y' ? 'checked' : ''} onclick="javascript:noReadSearch('no');" /><strong ${vo.readN == 'Y' ? 'style="background:#f9bb07;padding: 3px;"' : ''}>안 읽은 게시글 보기</strong></label>
				</span>
				
				
				<select name="KeyType" id="KeyType" onchange="if(this.value != 'NoCate') $('#CateCd').val(this.value);" style="height:23px;">
					<option value="">${GrpInfo.grpNm}</option>
					<c:forEach var="result" items="${BoardCateList}" varStatus="status">
						<c:choose>
							<c:when test="${vo.cateCd eq result.catecd}"><option value="${result.catecd}" selected>${result.catenm}</option></c:when>
							<c:otherwise><option value="${result.catecd}">${result.catenm}</option></c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<input type="text" class="input_box" name="KeyWord" id="KeyWord" value="${vo.keyWord}" onkeydown="if(event.keyCode=='13') $('#BoardList').submit();"/>
				<a href="javascript:$('#BoardList').submit();" class="Btn" name="Orange">검색</a>
				
			</td>
			
			
			
			<td class="input_T input_search Text_R">
				<a href="javascript:BoardAdd();" class="Btn" name="Violet">글쓰기</a>
			</td>
		</tr>
		<tr>
			<td class="input_search Text_L" colspan="2">
				<select name="RegYear" id="RegYear" onchange="$('#BoardList').submit();">
					<c:if test="${vo.regYear eq ''}">
						<option value="${year}" selected>선택..</option>
					</c:if>
					<c:set var="year" value="2011"/>
					<c:forEach begin="${year}" end="${MaxYear}" step="1" varStatus="status">
						<c:choose>
							<c:when test="${year eq vo.regYear}">
								<option value="${year}" selected>${year}년</option>
							</c:when>
							<c:otherwise>
								<option value="${year}">${year}년</option>
							</c:otherwise>
						</c:choose>
						<c:set var="year" value="${year + 1}"/>
					</c:forEach>
				</select>
				<input type="hidden" name="RegMonth" id="RegMonth"  value="${vo.regMonth}"/>
				<c:forEach begin="1" end="12" step="1" varStatus="status">
					<a href="javascript:SearchEnd('${status.count}');" class="Btn" id="Month${status.count}" name="Silver">${status.count}월</a>
				</c:forEach>
				<a href="javascript:SearchEnd('All');" id="MonthAll" class="Btn" name="Silver">전체</a>
			</td>
		</tr>
		<c:choose>
			<c:when test="${GrpInfo.cateCd ne ''}">
				<tr>
					<td class="Title_TB Text_L" colspan="2" style="height:40px;"><img src="images/sp/arrow3.gif" style="line-height:23px;vertical-align:middle;"> ${GrpInfo.cateNm}</td>
				</tr>
				<c:if test="${GrpInfo.cateInfo ne ''}">
				<tr>
					<td class="input_search Text_L" colspan="2" style="line-height:2em;">
						${fn:replace(GrpInfo.cateInfo, cn, br)}
					</td>
				</tr>
				</c:if>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${vo.keyWord eq ''}"><c:set var="Title" value="등록된 글 보기"/></c:when>
					<c:otherwise><c:set var="Title" value="검색 결과"/></c:otherwise>
				</c:choose>
				<tr>
					<td class="Title_TB Text_L" colspan="2" style="height:40px;"><img src="images/sp/arrow3.gif" style="line-height:23px;vertical-align:middle;"> ${Title}</td>
				</tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="2">
			<table class="form3" border="0" cellpadding="0" cellspacing="0" style="width:1024px;">
				<tr class="Text_C Click">
					<td class="grid_title" style="width:5%;">순번</td>
					<c:if test="${GrpInfo.confirmProcFlag eq 'Y'}">
						<td class="grid_title" style="width:10%;" id="Order1" onclick="javascript:ListOrderSet('BoardList.do', '_self', 'BoardList', this.id, '상태', 'WriteStatusNm', 'S');">상태(▲)</td>
					</c:if>
					<td class="grid_title" style="width:*;" id="Order2" onclick="javascript:ListOrderSet('BoardList.do', '_self', 'BoardList', this.id, '제목', 'WriteTitle', 'S');">제목(▲)</td>
					<td class="grid_title" style="width:5%;">파일</td>
					<td class="grid_title" style="width:12%;" id="Order3" onclick="javascript:ListOrderSet('BoardList.do', '_self', 'BoardList', this.id, '작성일', 'RegDate', 'S');">작성일(▲)</td>
					<td class="grid_title" style="width:8%;" id="Order4" onclick="javascript:ListOrderSet('BoardList.do', '_self', 'BoardList', this.id, '작성자', 'RegPerNm', 'S');">작성자(▲)</td>
					<td class="grid_title" style="width:6%;" id="Order5" onclick="javascript:ListOrderSet('BoardList.do', '_self', 'BoardList', this.id, '조회', 'Hit', 'I');">조회(▲)</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	</div>
	<div id="PaddingTable">
	<div id="ContentTable" class="ConTable" onscroll="TableScrolling();">
	<table class="form3_noline" align="left" border="0" cellpadding="0" cellspacing="0" style="width:1024px;">
		<c:if test="${fn:length(boardList) eq 0}"><tr><td class="Text_C" style="width:1024px;height:50px;">검색된 게시물이 없습니다.</td></tr></c:if>
		<c:forEach var="result" items="${boardList}" varStatus="status">
			<c:choose>
				<c:when test="${GrpInfo.cateCd eq ''}">
					<c:set var="CateNm" value="<span style='color:#888888;'> - ${result.catenm}</span><br/>"/>
					<c:set var="TrHeight" value="40"/>
				</c:when>
				<c:otherwise>
					<c:set var="CateNm" value=""/>
					<c:set var="TrHeight" value="30"/>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${result.confirmpersabun ne ''}">
					<c:choose>
						<c:when test="${result.writestatus eq 'return'}"><c:set var="CellColor" value="${spCmmVO.notCellColor} style='font-weight:bold;'"/></c:when>
						<c:when test="${result.writestatus eq 'end'}"><c:set var="CellColor" value="${spCmmVO.etcCellColor}"/></c:when>
						<c:when test="${result.writestatus eq 'write'}"><c:set var="CellColor" value="${spCmmVO.claimColor}"/></c:when>
						<c:otherwise><c:set var="CellColor" value="${spCmmVO.cellColor}"/></c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise><c:set var="CellColor" value="${spCmmVO.cellColor}"/></c:otherwise>
			</c:choose>
			<c:if test="${result.noticeorder eq 0}"><c:set var="CellColor" value="${spCmmVO.hopeCellColor} style='font-weight:bold;'"/></c:if>
			<tr class="Click" height="${TrHeight}" align="center" onclick="if(event.srcElement.id != 'HitBtn') BoardView('${result.grpcd}', '${result.catecd}', '${result.writecd}');" ${CellColor}>
				<td class="grid_input_LBR" style="width:5%;">${status.count + vo.firstRecordIndex}</td>
				<c:if test="${GrpInfo.confirmProcFlag eq 'Y'}">
					<td class="grid_input_BR" style="width:10%;">${result.writestatusnm}</td>
				</c:if>
				<td class="grid_input_BR Text_L" style="width:*;">
					<div style="width:*;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal">
					<c:if test="${result.noticeorder eq 0}"><img src="<c:url value='/images/sp/base/notice.gif'/>" align="middle"></c:if> ${CateNm}
					<!-- 제목 안읽음 표시 -->
					<c:choose>
						<c:when test="${(result.boardreadflag eq 0)}">
							<span style="color:#0471e4;font-weight: bold;">${result.writetitle}</span>
						</c:when>
						<c:otherwise>
							${result.writetitle}
						</c:otherwise>
					</c:choose>
					
					<!-- 신규 표시 -->
					<c:if test="${(result.newCnt > 0)}">
						<img src="<c:url value='/images/sp/icon_new.gif'/>" width="13" height="10">
					</c:if>
					
					<!-- 댓글수 표시 -->
					<c:if test="${result.replycnt ne 0}">
						<span style="color:#FF0000;">[${result.replycnt}]</span>
						<c:if test="${result.replyfilecnt ne '0'}"><img src="<c:url value='/images/sp/file.gif'/>" align="middle"></c:if>
					</c:if>
					</div>
				</td>
				<td class="grid_input_BR" id="FileBtn" style="width:5%;">
					<c:if test="${result.filecnt ne 0}"><img src="<c:url value='/images/sp/file.gif'/>" align="middle"></c:if>
				</td>
				<td class="grid_input_BR" style="width:12%;">${result.regdate} (${result.datenm})</td>
				<td class="grid_input_BR" style="width:8%;">${result.regpernm}</td>
				<td class="grid_input_BR" id="HitBtn" style="width:6%;">
					<c:choose>
						<c:when test="${result.hit ne 0}"><c:set var="LogView" value="onclick=\"ReadLogView('${result.grpcd}', '${result.catecd}', '${result.writecd}');\""/></c:when>
						<c:otherwise><c:set var="LogView" value=""/></c:otherwise>
					</c:choose>
					<a href="javascript:#;" id="HitBtn" ${LogView}>${result.hit}</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td class="Text_C" colspan="6" style="font-size:15pt;">
			<div id="paging">
				<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage"/>
			</div>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</form>
	</body>
</html>