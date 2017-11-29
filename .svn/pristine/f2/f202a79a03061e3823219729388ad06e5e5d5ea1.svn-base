<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		<script src="js/sp/synergy_util.js"></script>
		<script src="js/sp/jquery-1.8.2.min.js"></script>
		<style type="text/css">
			img {
				max-width:570px;
			}
		</style>
		<script type="text/javaScript" language="javascript">
			<!--
			top.document.title = "게시물상세보기";
			
			$(document).ready(function () {
				$(window).load(function() {
					InfoMessageView();
					if('${BoardInfo.confirmProcFlag}' == 'Y') {
						DataSet();
						$('#ConfirmInfo').show();
					}
					BtnSet();
				});
			});
			
			// 요청게시판일시 담당자와 참조인 셋팅
			function DataSet() {
				if('${fn:length(BoardConfirmOptPerList)}' > 0) {
					var Cnt = 0, OptFlag = "", OldOptFlag = "", OldPerSabun = "", PerNm = "", ConfirmCnt = 0, ConfirmInfo = "", ConfirmFlag = true;
					<c:forEach var="result" items="${BoardConfirmOptPerList}" varStatus="status">
						OptFlag = '${result.optflag}';
						DelFlag = '${result.delflag}';
						
						if(Cnt != 0 && OptFlag != OldOptFlag) {
							if(PerNm != '') $('#'+OldOptFlag).html(PerNm);
							else $('#'+OldOptFlag).parent().parent().hide();
							PerNm = "";
							Cnt = 0;
						}
						
						if(OptFlag == 'Middle' && '${result.persabun}' == '${BoardInfo.confirmPerSabun}') ConfirmFlag = false;
						else ConfirmFlag = true;
						if(ConfirmFlag && OldPerSabun != '${result.persabun}') {
							if(Cnt == 0) PerNm += "${result.pernm}";
							else {
// 								if(Cnt % 10 == 0) PerNm += ",<br/>${result.pernm}";
// 								else PerNm += ", ${result.pernm}";
								PerNm += ", ${result.pernm}";
							}
							Cnt++;
						}
						OldOptFlag = OptFlag;
						OldPerSabun = '${result.persabun}';
					</c:forEach>
					if(PerNm != '') {
						$('#'+OldOptFlag).html(PerNm);
						$('#'+OldOptFlag).addClass("Text_Cut");
					}
					else $('#'+OldOptFlag).parent().parent().hide();
				}
			}
			
			// 보고완료 처리
			function BoardWriteEnd() {
				if(confirm('완료처리 하시겠습니까?')) {
					$('#InfoMessage').val("해당 보고서를 보고완료 하였습니다.");
				}
				else  return false;
				$('#BoardView').attr('action', "<c:url value='/BoardWriteEnd.do'/>").submit();
			}
			
			// 보고서 승인/반송 처리 완료
			function BoardConfirmEnd(flag) {
				var Txt = "";
				if(flag == 'end') Txt = "승인";
				else Txt = "반송";
				if(confirm("해당 보고서를 "+Txt+" 하시겠습니까?")) {
					$('#InfoMessage').val(Txt + " 완료 되었습니다.");
					$('#WriteStatus').val(flag);
					if($('#ConfirmConTmp').val() == $('#ConfirmCon').val()) $('#ConfirmCon').val(Txt + ' 되었습니다.');
					$('#BoardView').attr('action', "<c:url value='/BoardConfirmEnd.do'/>").submit();
				}
				else {
					alert(Txt + " 취소 되었습니다.");
					return false;
				}
			}
			
			// 게시물 수정
			function BoardEdit() {
				$('#CMD').val('Edit');
				$('#BoardView').attr('action', "<c:url value='/BoardProcMain.do'/>").submit();
			}
			
			// 게시물 삭제
			function BoardDelEnd() {
				if(confirm("정말 삭제 하시겠습니까?")) {
					$('#CMD').val('Del');
					$('#InfoMessage').val("삭제 완료 되었습니다.");
					$('#BoardView').attr('action', "<c:url value='/BoardProcEnd.do'/>").submit();
				}
				else {
					alert("삭제 취소 되었습니다.");
					return false;
				}
			}
			
			// 게시물 이동
			function BoardMove() {
				var GrpCd = $('#GrpCd').val();
				var CateCd = $('#CateCd').val();
				var WriteCd = $('#WriteCd').val();
				
				$('<div id="BackDiv" onclick="LayerClose(\'End\');"></div>').css('opacity',0.3).appendTo('body');
				$('#BackDiv').css({'top':'0', 'width':'100%', 'height':$('body').height()});
				$('#ViewDiv').css({'top':screen.height*0.5	, 'left':screen.width*0.5-150, 'z-index':'100', 'width':'310', 'height':'200', 'position':'absolute'}).fadeIn(300);
				
			    var LayerCon = "<br/><iframe id='BoardMove' src='<c:url value='/BoardMove.do?GrpCd="+GrpCd+"&CateCd="+CateCd+"&WriteCd="+WriteCd+"'/>' frameborder='0' width='100%' height='100%'/>";
			    $('#ViewDiv').html(LayerCon);
			    $('body').animate({scrollTop:0}, 500);
				$("body").css("overflow","hidden");
			}
			
			// 레이어 닫기
			function LayerClose() {
				$("#BackDiv").remove();
				$("#ViewDiv").hide();
				$("body").css("overflow","auto");
			}
			
			// 목록
			function BoardList() {
				$('#BoardView').attr('action', "<c:url value='/BoardList.do'/>").submit();
			}
			
			// 결재//반송 목록
			function PopList() {
				if($('#CMD').val() == 'ConfirmList') $('#BoardView').attr('action', "<c:url value='/ConfirmList.do'/>");
				else $('#BoardView').attr('action', "<c:url value='/ReturnList.do'/>");
				$('#BoardView').submit();
			}
			
			// 댓글 등록 완료
			function ReplyAddEnd() {
				if($('#ReplyCon').val() == '') {
					alert('내용을 입력하세요.');
					$('#ReplyCon').focus();
					return false;
				}
				$('#CMD').val("Add");
				NowTime = replaceC(GetToday(), "-", "") + replaceC(GetNowTime("HhMiSs"), ":", "");
				//$('#SMSReserTime').val(NowTime);
				//$('#startTime').val($('#SMSReserTime').val());
				//$('#SMSContent').val('' + ' 으로부터 고객게시판에 댓글이 등록되었습니다.');
				//$('#contents').val($('#SMSContent').val());
				$('#InfoMessage').val("등록 완료 되었습니다.");
				$('#BoardView').attr('action', "<c:url value='/ReplyProcEnd.do'/>").submit();
				
				/*
				if($('#CMD').val() == 'Add') {
					document.SMS.target="moashot";
					document.SMS.action="https://biz.moashot.com/EXT/URLASP/mssendUTF.asp";
					//document.SMS.submit();
				}*/
			}
			
			var Ele_Array = ["Con", "File", "Btn"];
			// 댓글 수정&취소
			function ReplyEdit(ReplyCd, flag) {
				for(var cnt = 0; cnt < Ele_Array.length; cnt++) {
					if(flag == 'Edit') {
						$('#'+Ele_Array[cnt]+ReplyCd+'Edit').show();
						if(Ele_Array[cnt] != "File") $('#'+Ele_Array[cnt]+ReplyCd).hide();
						else $('#'+Ele_Array[cnt]+ReplyCd).attr("class", "desc_noline");
					}
					else {
						$('#'+Ele_Array[cnt]+ReplyCd+'Edit').hide();
						if(Ele_Array[cnt] != "File") $('#'+Ele_Array[cnt]+ReplyCd).show();
						else $('#'+Ele_Array[cnt]+ReplyCd).attr("class", "input_noline");
					}
				}
			}
			
			// 댓글 수정 완료
			function ReplyEditEnd(ReplyCd) {
				$('#CMD').val("Edit");
				$('#InfoMessage').val("수정 완료 되었습니다.");
				$('#ReplyCd').val(ReplyCd);
				$('#ReplyCon').val($('#ReplyConEdit').val());
				$('#BoardView').attr('action', "<c:url value='/ReplyProcEnd.do'/>").submit();
			}
			
			// 댓글 삭제 완료
			function ReplyDelEnd(ReplyCd) {
				if(confirm("정말 삭제 하시겠습니까?")) {
					$('#CMD').val("Del");
					$('#InfoMessage').val("삭제 완료 되었습니다.");
					$('#ReplyCd').val(ReplyCd);
					$('#BoardView').attr('action', "<c:url value='/ReplyProcEnd.do'/>").submit();
				}
				else {
					alert("삭제 취소 되었습니다.");
					return false;
				}
			}
			
			// 경로 복사
			function URLCopy() {
				if(window.clipboardData != undefined) {
					window.clipboardData.setData('Text', $('#URL').val());
					alert('복사되었습니다.');
				}
				else alert('복사기능은 Internet Explorer에서만 지원됩니다.');
			}
			-->
		</script>
	</head>
	<body>
	<form name="BoardView" id="BoardView" method="post" enctype="multipart/form-data">
	<input type="hidden" name="InfoMessage"		id="InfoMessage"/>
	<input type="hidden" name="message"			id="message"			value="${message}"/>
	<input type="hidden" name="CMD"				id="CMD"				value="${vo.CMD}"/>
	<input type="hidden" name="PopFlag"			id="PopFlag"			value="${vo.popFlag}"/>
	<input type="hidden" name="EventType"		id="EventType"			value="${vo.eventType}"/>
	<input type="hidden" name="GrpCd"			id="GrpCd"				value="${BoardInfo.grpCd}"/>
	<input type="hidden" name="ConfirmProcFlag"	id="ConfirmProcFlag"	value="${BoardInfo.confirmProcFlag}"/>
	<input type="hidden" name="ConfirmPerSabun"	id="ConfirmPerSabun"	value="${BoardInfo.confirmPerSabun}"/>
	<input type="hidden" name="HoliDocFlag"		id="HoliDocFlag"		value="${BoardInfo.holiDocFlag}"/>
	<input type="hidden" name="CateCd"			id="CateCd"				value="${BoardInfo.cateCd}"/>
	<input type="hidden" name="WriteCd"			id="WriteCd"			value="${BoardInfo.writeCd}"/>
	<input type="hidden" name="WriteStatus"		id="WriteStatus"/>
	<input type="hidden" name="ReplyCd"			id="ReplyCd"			value="${vo.replyCd}"/>
	<input type="hidden" name="FilePath"		id="FilePath"/>
	<input type="hidden" name="FileUpNm"		id="FileUpNm"/>
	<input type="hidden" name="FileNm"			id="FileNm"/>
	<input type="hidden" name="RegPerSabun"		id="RegPerSabun"		value="${loginVO.regPerSabun}"/>
	<input type="hidden" name="URL"				id="URL"				value="${reqURL}?${BoardInfo.grpCd}/${BoardInfo.cateCd}/${BoardInfo.writeCd}"/>
	<div id="ViewDiv" style="display:none;"></div>
	<table class="subtable" border="0" cellpadding="0" cellspacing="0" width="1024">
		<tr>
			<td class="Title_TB Text_L" colspan="2" style="height:40px;"><img src="images/sp/arrow3.gif" style="line-height:23px;vertical-align:middle;"> ${BoardInfo.grpNm} > ${BoardInfo.cateNm}</td>
			<td class="Title_T Title_orange Text_R" colspan="2">
				<c:if test="${BoardInfo.confirmPerSabun ne ''}">
				<c:choose>
					<c:when test="${BoardInfo.writeStatus eq 'return'}">반송된 문서</c:when>
					<c:when test="${BoardInfo.middleCnt eq BoardInfo.endCnt}">승인된 문서</c:when>
					<c:when test="${BoardInfo.boardVer ne 1}">재기안된 문서</c:when>
				</c:choose>
				</c:if>
			</td>
		</tr>
		<tr>
			<td class="input_search Text_L" colspan="4" style="size:8pt;">
				<div style="width:90%;float:left;line-height:23px;vertical-align:middle;">
					경로복사 : <a href="javascript:URLCopy();">${reqURL}?${BoardInfo.grpCd}/${BoardInfo.cateCd}/${BoardInfo.writeCd}</a>
					<a href="javascript:URLCopy();"><img src="images/sp/base/copy.gif" style="line-height:23px;vertical-align:middle;"></a>
				</div>
				<c:if test="${BoardInfo.regPerSabun eq loginVO.perSabun && BoardInfo.writeStatus eq 'write'}">
				<div class="Text_R" style="float:left;">
					<a href="javascript:BoardWriteEnd();" class="Btn" name="Orange">완료처리</a>
				</div>
				</c:if>
			</td>
		</tr>
		<c:if test="${BoardInfo.noticeFlag ne ''}">
		<tr>
			<td class="desc_BR Text_C" rowspan="2" style="width:12%;">공지설정</td>
			<td class="input_B Text_L" colspan="3">
				<c:choose>
					<c:when test="${BoardInfo.noticeFlag eq 'Home,Board'}">홈 공지, 게시판 공지</c:when>
					<c:when test="${BoardInfo.noticeFlag eq 'Home'}">홈 공지</c:when>
					<c:otherwise>게시판 공지</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td class="input_B Text_L" colspan="3">공지기간 : ${BoardInfo.noticeSDate} ~ ${BoardInfo.noticeEDate}</td>
		</tr>
		</c:if>

		<tr>
			<td class="desc_BR Text_C">제목</td>
			<td class="input_B Text_L" colspan="3">${BoardInfo.writeTitle}</td>
		</tr>
		<tr>
			<td class="desc_BR Text_C" style="height:100px;">내용</td>
			<td class="input_B" colspan="3" style="padding:5px;word-break:break-all;">${BoardInfo.writeCon}</td>
		</tr>
		<c:if test="${fn:length(BoardFileList) > 0}">
		<tr ${spCmmVO.cellColor}> 
			<td class="desc_BR Text_C">첨부파일</td>
			<td class="input_B Text_L" colspan="3" style="line-height:20px;padding:5px;">
				<c:forEach var="result" items="${BoardFileList}" varStatus="status">
					<input type="checkbox" name="AttachFile" id="file${status.count}" value="${result.filepath}_-_${result.fileupnm}_-_${result.filenm}" />
	     			<label for="file${status.count}">${result.filenm}</label><br/>
				</c:forEach>
				<a href="javascript:downloadAll('<c:url value='/FileDown.do'/>', '${fn:length(BoardFileList)}', 'file', 'alone');" class="Btn" name="LightGreen">선택받기</a>
				<a href="javascript:downloadAll('<c:url value='/FileDown.do'/>', '${fn:length(BoardFileList)}', 'file', 'all');" class="Btn" name="Orange">모두받기</a>
			</td>
		</tr>
		</c:if>
		
		<c:if test="${BoardInfo.confirmProcFlag eq 'Y' && BoardInfo.confirmPerSabun ne ''}">
			<tr>
				<td class="desc_BR Text_C">최종승인자</td>
				<td class="input_B Text_L" colspan="3">${BoardInfo.confirmPerNm}</td>
			</tr>
			<tr> 
				<td class="desc_BR Text_C">중간승인자</td>
				<td class="input_B Text_L" colspan="3" style="padding:5px;line-height:20px;"><span id="Middle"></span></td>
			</tr>
			<tr> 
				<td class="desc_BR Text_C">참조인</td>
				<td class="input_B Text_L" colspan="3" style="padding:5px;line-height:20px;"><span id="Consult"></span></td>
			</tr>
		</c:if>
		<tr>
			<td class="desc_BR Text_C" style="width:12%;">작성자</td>
			<td class="input_BR Text_L" style="width:38%;">${BoardInfo.regPerNm}</td>
			<td class="desc_BR Text_C" style="width:12%;">작성일</td>
			<td class="input_B Text_L" style="width:38%;">${BoardInfo.regDate}</td>
		</tr>
		<!-- 결제정보 -->
		<c:if test="${BoardInfo.confirmProcFlag eq 'Y'}">
			<tr id="ConfirmInfo" style="display:none;">
				<td colspan="4" valign="top">
				<c:set var="ConCnt" value="0"/>
			<c:forEach var="result" items="${BoardConfirmOptPerList}" varStatus="status">
				<c:if test="${result.optflag eq 'Middle' && result.confirmstatus ne '' && result.confirmstatus ne null}">
					<c:set var="STable" value="<table class='subtable_secret' align='left' border='0' cellpadding='0' cellspacing='0' width='100%'>"/>
					<c:set var="ETable" value="</table>"/>
					
					<c:if test="${ConCnt eq 0}">
						${STable}
							<tr>
								<td class="input_B" colspan="3">&nbsp;</td>
							</tr>
							<tr>
								<td class="Title_TB Text_L" colspan="3">* 결제 의견 및 상태</td>
							</tr>
							<tr>
								<td class="desc_BR Text_C" style="width:140px;">결재자</td>
								<td class="desc_BR Text_C">결재의견</td>
								<td class="desc_B Text_C" style="width:150px;">상태</td>
							</tr>
					</c:if>
						<tr>
							<td class="input_BR Text_C" style="width:140px;">${result.pernm}</td>
							<td class="input_BR Text_L" style="line-height:150%;">
								${fn:replace(result.confirmcon, cn, br)}
							</td>
							<td class="input_B Text_C" style="width:150px;">
								${result.confirmstatusnm}<br/>(${result.confirmdate})
							</td>
						</tr>
						<c:set var="ConCnt" value="${ConCnt + 1}"/>
					<c:if test="${ConCnt eq result.confirmcnt}">
						${ETable}
					</c:if>
				</c:if>
				
				<c:if test="${BoardInfo.regPerSabun ne loginVO.regPerSabun && BoardInfo.writeStatus ne 'return'}"><!-- 작성자 본인이 아니고 반송된 문서가 아니면 -->
					<c:if test="${result.optflag eq 'Middle' && BoardInfo.confirmPerSabun ne result.persabun && result.persabun eq loginVO.regPerSabun && result.endflag ne '1'}">
						<table class="subtable_secret" align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td class="desc_BR Text_R" style="width:140px;height:80px;">결제의견</td>
								<td class="desc_B Text_L">
									<textarea name="ConfirmCon" id="ConfirmCon" style="ime-mode:active;height:60px;width:98%;" onclick="$('#ConfirmCon').val('');">승인 또는 반송시 결제의견을 작성하실 수 있습니다.</textarea>
									<input type="hidden" name="ConfirmConTmp" id="ConfirmConTmp" value="승인 또는 반송시 결제의견을 작성하실 수 있습니다."/>
								</td>
								<td class="desc_B Text_C" style="width:100px;">
									<a href="javascript:BoardConfirmEnd('end');" class="Btn" name="Orange">승인</a>
									<a href="javascript:BoardConfirmEnd('return');" class="Btn" name="Violet">반송</a>
								</td>
							</tr>
						</table>
					</c:if>
				</c:if>
			</c:forEach>
				</td>
			</tr>
		</c:if>
		<fmt:parseNumber var="val1" value="${BoardInfo.middleCnt - 1}"/>
		<c:if test="${BoardInfo.confirmPerSabun eq loginVO.regPerSabun && val1 eq BoardInfo.endCnt && BoardInfo.writeStatus ne 'return'}">
		<tr>
			<td class="input_B input_T" colspan="4" valign="top">
			<table class="subtable_secret" align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="desc_BR Text_R" style="width:140px;height:80px;">결제의견</td>
					<td class="desc_B Text_L">
						<textarea name="ConfirmCon" id="ConfirmCon" style="ime-mode:active;height:60px;width:98%;" onclick="$('#ConfirmCon').val('');">승인 또는 반송시 결제의견을 작성하실 수 있습니다.</textarea>
						<input type="hidden" name="ConfirmConTmp" id="ConfirmConTmp" value="승인 또는 반송시 결제의견을 작성하실 수 있습니다."/>
					</td>
					<td class="desc_B Text_C" style="width:100px;">
						<a href="javascript:BoardConfirmEnd('end');" class="Btn" name="Orange">승인</a>
						<a href="javascript:BoardConfirmEnd('return');" class="Btn" name="Violet">반송</a>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		</c:if>
		<c:if test="${BoardInfo.confirmProcFlag eq 'N'}">
			<tr><td class="input_noline" colspan="4">&nbsp;</td></tr>
		</c:if>
		<tr>
			<td colspan="4" valign="top">
			<table class="subtable_secret" align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="Title_TB Text_L" colspan="3">* 댓글</td>
				</tr>
				<tr>
					<td class="desc_R Text_R" style="width:140px;height:80px;">
						${loginVO.perNm}
						<input type="hidden" name="ReplyPerNm" id="ReplyPerNm" value="${loginVO.perNm}"/>
						<input type="hidden" name="ReplyPerSabun" id="ReplyPerSabun" value="${loginVO.perSabun}"/>
					</td>
					<td class="desc_noline Text_L"><textarea name="ReplyCon" id="ReplyCon" style="ime-mode:active;height:60px;width:98%;"></textarea></td>
					<td class="desc_noline Text_C" style="width:100px;"><a href="javascript:ReplyAddEnd();" class="Btn" name="Orange">댓글등록</a></td>
				</tr>
				<tr>
					<td class="desc_BR Text_C">첨부파일</td>
					<td class="desc_B Text_L" colspan="2" style="padding:5px;">
						<input type="File" id="InFile" multiple="true" name="DataAry" onchange="FileSel(this.files)">
						<div id="FileInfo" style="border:2px solid #C9C9C9;min-height:50px;">(선택된 파일이 없습니다.)</div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<c:if test="${fn:length(ReplyList) > 0}">
		<tr><td class="input_noline" colspan="4">&nbsp;</td></tr>
		<tr>
			<td colspan="4" width="100%;">
			<table class="subtable_secret" align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
			<c:forEach var="result" items="${ReplyList}" varStatus="status">
				<c:choose>
					<c:when test="${result.cnt ne 0}"><c:set var="rowspan" value="2"/></c:when>
					<c:otherwise><c:set var="rowspan" value="1"/></c:otherwise>
				</c:choose>
				<tr>
					<td class="desc_T Text_C" rowspan="${rowspan}" style="width:20px;">${status.count}</td>
					<td class="desc_TR Text_C" style="width:120px;">${result.replypernm}</td>
					<td class="input_T Text_L" id="Con${result.replycd}" style="padding:5px;">${fn:replace(result.replycon, cn, br)}</td>
					<td class="desc_T Text_L" id="Con${result.replycd}Edit" style="display:none;">
						<textarea name="ReplyConEdit" id="ReplyConEdit" style="ime-mode:active;height:60px;width:98%;">${result.replycon}</textarea>
					</td>
					<td class="input_T Text_C" id="Btn${result.replycd}" style="width:100px;padding:5px;" rowspan="${rowspan}">
						${result.regdate}<br>
						<c:if test="${loginVO.perSabun eq result.replypersabun}">
							<a href="javascript:ReplyDelEnd('${result.replycd}');" class="Btn" name="Violet">댓글삭제</a>
						</c:if>
					</td>
					<td class="desc_T Text_C" id="Btn${result.replycd}Edit" rowspan="${rowspan}" style="width:100px;display:none;">
						${result.regdate}<br>
						<c:if test="${loginVO.perSabun eq result.replypersabun}">
							<a href="javascript:ReplyEditEnd('${result.replycd}');" class="Btn" name="LightBlue">완료</a>
							<a href="javascript:ReplyEdit('${result.replycd}', 'Cancel');" class="Btn" name="LightBlue">취소</a>
						</c:if>
					</td>
				</tr>
				<c:if test="${result.cnt ne 0}">
				<tr>
					<td class="desc_R Text_C" style="width:120px;" height="${result.cnt * 20}">첨부파일</td>
					<td class="input_noline Text_L" id="File${result.replycd}" style="line-height:20px;padding:5px;">
						<c:forEach var="fileresult" items="${ReplyFileList}" varStatus="status">
							<c:if test="${result.replycd eq fileresult.replycd}">
								<input type="checkbox" name="ReplyAttachFile${result.replycd}" id="replyfile${result.replycd}${status.count}" value="${fileresult.filepath}_-_${fileresult.fileupnm}_-_${fileresult.filenm}" />
			     				<label for="replyfile${result.replycd}${status.count}">${fileresult.filenm}</label><br/>
							</c:if>
						</c:forEach>
						<a href="javascript:downloadAll('<c:url value='/FileDown.do'/>', '${result.cnt}', 'replyfile${result.replycd}', 'alone');" class="Btn" name="LightGreen">선택받기</a>
						<a href="javascript:downloadAll('<c:url value='/FileDown.do'/>', '${result.cnt}', 'replyfile${result.replycd}', 'all');" class="Btn" name="Orange">모두받기</a>
					</td>
				</tr>
				</c:if>
				<c:if test="${result.cnt eq 0 && fn:length(ReplyList) eq 1}"><tr><td class="input_T" colspan="4">&nbsp;</td></tr></c:if>
				<c:if test="${status.count ne fn:length(ReplyList)}"><tr><td class="input_T" colspan="4">&nbsp;</td></tr></c:if>
				<c:if test="${status.count eq fn:length(ReplyList)}"><tr><td class="input_T" colspan="4">&nbsp;</td></tr></c:if>
			</c:forEach>
			</table>
			</td>
		</tr>
		</c:if>
		<tr>
			<td class="input_noline Text_C" colspan="4" style="padding:30px;">
				<c:choose>
					<c:when test="${vo.eventType eq 'Alarm'}">
						<a href="javascript:self.close();" class="Btn" name="LightBlue">닫기</a>
					</c:when>
					<c:otherwise>
						<c:if test="${(BoardInfo.regPerSabun eq loginVO.perSabun && (BoardInfo.writeStatus eq 'write' || BoardInfo.confirmPerSabun eq '')) || (BoardInfo.delFlag eq 'Y' && loginVO.masterFlag eq 'Y')}">
							<c:if test="${BoardInfo.grpCd eq 1 && BoardInfo.cateCd ne 3}">
								<a href="javascript:BoardMove();" class="Btn" name="LightGreen">이동</a>
							</c:if>
							<c:if test="${BoardInfo.grpCd ne 1}">
								<a href="javascript:BoardMove();" class="Btn" name="LightGreen">이동</a>
							</c:if>
							<a href="javascript:BoardEdit();" class="Btn" name="Orange">수정</a>
							<a href="javascript:BoardDelEnd();" class="Btn" name="Violet">삭제</a>
						</c:if>
						<c:if test="${BoardInfo.regPerSabun eq loginVO.perSabun && BoardInfo.writeStatus eq 'return'}">
							<a href="javascript:BoardEdit();" class="Btn" name="Orange">재기안</a>
						</c:if>
						<c:choose>
							<c:when test="${vo.popFlag eq 'Pop'}">
								<a href="javascript:PopList();" class="Btn" name="LightBlue">목록</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:BoardList();" class="Btn" name="LightBlue">목록</a>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	</form>
	</body>
</html>