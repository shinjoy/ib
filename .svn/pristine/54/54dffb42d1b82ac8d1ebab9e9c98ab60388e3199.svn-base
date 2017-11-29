<!-- 이미지업로드 버그점검시 attach_photo.js 파일 확인 -->
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
				    		htmlStr += '<label><input type="checkbox" name="Consult" id="Consult" onclick="javascript:SelAll(this.name);"/>';
				    		//htmlStr += '<label><input type="checkbox" name="Consult" id="Consult" onclick="javascript:SelAll(this.name, ' + i + ', \'' + divisionList[i].divCode + '\');"/>';
				    		//htmlStr += divisionList[i].divName + '</label><br/>';
				    		htmlStr +=  '전체선택</label><br/>';
			    		}
			    	}
					$('#divSelAll').html(htmlStr);		//참조인 전체선택 체크박스
					
					
					
					InfoMessageView();
					loadEditer();
					DataSet();
					
					$('#NoticeSDate').datepicker(S_DatePickerOpt).parent().children('img').css({'vertical-align':'middle', 'line-height':'23px', 'margin-left':'5px'});
					$('#NoticeEDate').datepicker(E_DatePickerOpt).parent().children('img').css({'vertical-align':'middle', 'line-height':'23px', 'margin-left':'5px'});
					BtnSet();
					
					if($('#CMD').val() == 'Add' && $('#GrpCd').val() == '1' && $('#CateCd').val() == '6') {
						var con = '1. 물품 : <br/><br/>';
						con += '2. 세부사항 : <br/><br/>';
						con += '3. 단가/수량/총금액 : <br/><br/>';
						con += '4. 구입목적 : <br/><br/>';
						con += '5. 구매효과 : <br/><br/>';
						$('#WriteCon').val(con);
					}
					
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
					
					if($('#GrpCd').val() == '1' && $('#CateCd').val() == '4') {
						var dayNames = ['일', '월', '화', '수', '목', '금', '토'];
						if('${loginVO.regPerSabun}' == '201502007') $('#WriteTitle').val(replaceC(GetToday(), '-', '')+"_"+ dayNames[date.getDay()]+'요일회의록 (벤처)');
						else $('#WriteTitle').val(replaceC(GetToday(), '-', '')+"_"+ dayNames[date.getDay()]+'요일회의록');
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
				
				if('${BoardInfo.noticeFlag}' != '') {
					if('${BoardInfo.noticeFlag}'.search("Home") >= 0) $('#Home').attr("checked", true);
					if('${BoardInfo.noticeFlag}'.search("Board") >= 0) $('#Board').attr("checked", true);
				}
				
				if('${vo.confirmProcFlag}' == 'Y' && $('#ConfirmPerSabun').val() != '') $('#ConfirmView').show();
				else $('#ConfirmView').hide();
			}
			
			// 공지설정
			function NoticeSel(Obj) {
				if($('#Home').is(':checked') || $('#Board').is(':checked')) $('#NoticeSDate').val(GetToday());
				else $('#NoticeSDate').val("");
			}
			
			// 게시물 등록/수정 완료
			function BoardProcEnd() {
				var SMSSeq = '${SMSSeq}';
				var ToNum_tmp, index_tmp, cnt = 0;
				
				if($('#WriteTitle').val() == '') {
					alert('제목을 입력하세요.');
					$('#WriteTitle').focus();
					return false;
				}
				//if($('#ConfirmProcFlag').val() == 'Y' && $('#ConfirmPerSabun').val() != '' && ($('#WriteStatus').val() == 'write' || $('#WriteStatus').val() == '')) {
				if($('#ConfirmProcFlag').val() == 'Y' && $('#ConfirmPerSabun').val() != '' && $('#OldWriteStatus').val() != 'return') {
					if(confirm('저장 후 완료처리 하시겠습니까?\n(※확인!! 완료하시면 수정 및 삭제 불가!)\n\n- 확인: 완료처리\n- 취소: 임시저장')) $('#WriteStatus').val('ing');
					else $('#WriteStatus').val('write');
					
					if($('#RegPerSabun').val() == '201406001') $('#WriteStatus').val('write');	// 팀오피스 이동중인 이지연이 보고서 등록할때는 무조건 작성중으로 등록한다.
				}
				else $('#WriteStatus').val('end');
				
				// 에디터의 내용이 textarea에 적용된다.
			    oEditors.getById["WriteCon"].exec("UPDATE_CONTENTS_FIELD", []);
				
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
					$('#InfoMessage').val("등록 완료 되었습니다.");
					
					// 문자전송
// 			    	if($('#SMSSendFlag').is(':checked')) {
// 						for(var oOo = 1; oOo < (Number($('#EmpCnt').val()) + 1); oOo++) {
// 							if($('#EntryDelAry'+oOo).val() != 'Y' && $('#ConsultPhoneAry'+oOo).val() != '') {
// 								if(cnt == 0) {
// 									ToNum_tmp = $('#ConsultPhoneAry'+oOo).val();
// 									index_tmp = SMSSeq;
// 								}
// 								else {
// 									ToNum_tmp = ToNum_tmp + "," + $('#ConsultPhoneAry'+oOo).val();
// 									index_tmp = index_tmp + "," + SMSSeq;
// 								}
// 								$('#SMSSeq'+oOo).val(SMSSeq);
// 								cnt++;
// 								SMSSeq++;
// 							}
// 						}
// 					}
				}
				else {
					if(($('#OldWriteStatus').val() == 'return')) {
						$('#WriteStatus').val('ing');
						$('#InfoMessage').val("재기안 되었습니다.");
					}
					else $('#InfoMessage').val("수정 완료 되었습니다.");
				}
				if($('#PopFlag') == '') $('#BoardProc').attr('target', 'content');
				else $('#BoardProc').attr('target', '_parent');
				
				$('#BoardProc').attr('action', "<c:url value='/BoardProcEnd.do'/>").submit();
				showLayer();
				
// 				if(cnt != 0) {
// 					NowTime = replaceC(GetToday(), "-", "") + replaceC(GetNowTime("HhMiSs"), ":", "");
					
// 					var Title = $('#WriteTitle').val();
// 					if(Title.length > 5) Title = Title.substring(0, 5) + "..";
					
// 					$('#toNumber').val(replaceC(ToNum_tmp, "-", ""));
// 					$('#contents').val("[${GetBoardInfo.cateNm}] 게시판에 '" + Title + "' ${reqURL}?${vo.grpCd}/${vo.cateCd}/${vo.writeCd}");
// 					$('#SMSContent').val("[${GetBoardInfo.cateNm}] 게시판에 '" + Title + "' ${reqURL}?${scheVO.scheSeq}");
// 					$('#fromNumber').val(replaceC($('#RegPerPhone').val(), "-", ""));
// 					$('#startTime').val(NowTime);
// 					$('#indexCode').val(index_tmp);
// 					form.target="moashot";
// 					form.action="https://biz.moashot.com/EXT/URLASP/mssendUTF.asp";
// 					form.submit();
// 				}
			}
			
			// 게시물 등록/수정취소
			function BoardProcCancel() {
				if($('#PopFlag').val() == '') {
					if($('#CMD').val() == 'Add') $('#BoardProc').attr('action', "<c:url value='/BoardList.do'/>");
					else $('#BoardProc').attr('action', "<c:url value='/BoardView.do'/>");
					$('#BoardProc').attr('target', "mainFrame");
				}
				else {
					$('#BoardProc').attr('action', "<c:url value='/BoardList.do'/>");
					$('#BoardProc').attr('target', "_parent");
				}
				$('#BoardProc').submit();
			}
			
			// 파일 삭제 하기
			function BoardFileDelEnd(FileSeq, FileNm) {
				if(confirm("선택하신 파일 ("+ FileNm +")을 정말 삭제 하시겠습니까?")) {
					$('#InfoMessage').val("삭제 완료 되었습니다.");
					$('#BoardProc').attr('action', "<c:url value='/BoardFileDelEnd.do?FileSeq="+FileSeq+"'/>").submit();
				}
				else {
					alert("삭제 취소 되었습니다.");
					return false;
				}
			}
			
			// 에디터 설정
			var oEditors = [];
			function loadEditer() {
				nhn.husky.EZCreator.createInIFrame({
				    oAppRef: oEditors,
				    elPlaceHolder: "WriteCon",
				    sSkinURI: "js/naver/SmartEditor2Skin.html",
				    fCreator: "createSEditor2"
				});
			}
			
			function pasteHTML(FileNm) {
				var sHTML = "<img src=\"<c:url value='/DATA/ImgView/"+FileNm+"'/>\" border=\"0\">";
			    oEditors.getById["WriteCon"].exec("PASTE_HTML", [sHTML]);
			}
			
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
	<form name="BoardProc" id="BoardProc" method="post" enctype="multipart/form-data">
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
	<input type="hidden" name="RegPerPhone"		id="RegPerPhone"		value="${loginVO.perPhone}"/>
	<input type="hidden" name="WriteStatus"		id="WriteStatus"/>
	<input type="hidden" name="OldWriteStatus"	id="OldWriteStatus"		value="${BoardInfo.writeStatus}"/>
	<input type="hidden" name="BoardVer"		id="BoardVer"			value="${BoardInfo.boardVer}"/>
	<input type="hidden" name="FilePath"		id="FilePath"/>
	<input type="hidden" name="FileUpNm"		id="FileUpNm"/>
	<input type="hidden" name="FileNm"			id="FileNm"/>
	<input type="hidden" name="HoliDocFlag"		id="HoliDocFlag"		value="N"/>
	<input type="hidden" name="HoliFlag"		id="HoliFlag"/>
	<input type="hidden" name="HalfFlag"		id="HalfFlag"/>
	<input type="hidden" name="HoliSDate"		id="HoliSDate"/>
	<input type="hidden" name="HoliEDate"		id="HoliEDate"/>
	<input type="hidden" name="HoliUseDay"		id="HoliUseDay"			value="0"/>
	<input type="hidden" name="HoliCancelCd"	id="HoliCancelCd"		value="0"/>
	<input type="hidden" name="SMSContent"		id="SMSContent"/>
	<input type="hidden" name="SubmitFlag"		id="SubmitFlag"			value="N"/>
	<!-- 모아샷 연동 파라메터 -->
<!-- 	<input type="hidden" name="uid"			id="uid"			value="synergy"> -->
<!-- 	<input type="hidden" name="pwd"			id="pwd"			value="00synergy00"> -->
<!-- 	<input type="hidden" name="sendType"	id="sendType"		value="3"> -->
<!-- 	<input type="hidden" name="toNumber"	id="toNumber"> -->
<!-- 	<input type="hidden" name="contents"	id="contents"> -->
<!-- 	<input type="hidden" name="fromNumber"	id="fromNumber"> -->
<!-- 	<input type="hidden" name="startTime"	id="startTime"> -->
<!-- 	<input type="hidden" name="nType"		id="nType"			value="3"> -->
<!-- 	<input type="hidden" name="indexCode"	id="indexCode"> -->
<!-- 	<input type="hidden" name="returnUrl"	id="returnUrl"		value="http://106.250.177.91:8281/SynergyCus/SMSSendResult.do"> -->
<!-- 	<input type="hidden" name="returnType"	id="returnType"		value="2"> -->
<!-- 	<input type="hidden" name="redirectUrl"	id="redirectUrl"	value="http://106.250.177.91:8281/SynergyCus/ClosePage.do"> -->
	<div id="prolayer" style="height:100%;width:100%;display:none;">
		<table border="0" width="100%" height="100%">
			<tr><td align="center"><img src="<c:url value='/images/sp/loading.gif'/>"><p><b>등록중입니다.</b></td></tr>
		</table>
	</div>
	<table class="subtable" border="0" cellpadding="0" cellspacing="0" width="1024">
		<tr>
			<td class="desc_BR Text_C" rowspan="2" style="width:12%;">공지설정</td>
			<td class="input_B" style="padding-left:5px;">
				<input type="checkbox" name="NoticeFlag" id="Home" value="Home" onclick="javascript:NoticeSel(this.id);"/><label for="Home">홈 공지로 지정</label>
				<input type="checkbox" name="NoticeFlag" id="Board" value="Board" onclick="javascript:NoticeSel(this.id);"/><label for="Board">게시판 공지로 지정</label>
			</td>
		</tr>
		<tr>
			<td class="input_B Text_L">
				공지기간 : 
				<input type="text" class="input_box Text_C" name="NoticeSDate" id="NoticeSDate" value="${BoardInfo.noticeSDate}" size="12" maxlength="10" onkeyup="javascript:DateFormat(this.name, this.value);"> ~
				<input type="text" class="input_box Text_C" name="NoticeEDate" id="NoticeEDate" value="${BoardInfo.noticeEDate}" size="12" maxlength="10" onkeyup="javascript:DateFormat(this.name, this.value);">
			</td>
		</tr>
		
		<tr>
			<td class="desc_BR Text_C">제목</td>
			<td class="input_B Text_L"><input type="text" class="input_box" name="WriteTitle" id="WriteTitle" style="width:99%;" value="${BoardInfo.writeTitle}"/></td>
		</tr>
		<tr>
			<td class="desc_BR Text_C">내용</td>
			<td class="input_B Text_L" style="padding:5px;">
				<textarea name="WriteCon" id="WriteCon" style="ime-mode:active;width:100%;height:400px;">${BoardInfo.writeCon}</textarea>
			</td>
		</tr>
		<c:if test="${fn:length(BoardFileList) > 0}">
			<tr ${spCmmVO.cellColor}> 
				<td class="desc_BR Text_C">기존첨부파일</td>
				<td class="input_B Text_L" style="padding:5px;">
				<c:forEach var="result" items="${BoardFileList}" varStatus="status">
					<a href="javascript:BoardFileDelEnd('${result.fileseq}', '${result.filenm}');" class="Btn" name="LightBlue">삭제</a>
					<a href="javascript:FileDown('<c:url value='/FileDown.do'/>', '${result.filepath}', '${result.fileupnm}', '${result.filenm}');">${result.filenm}</a><br/>
				</c:forEach>
				</td>
			</tr>
		</c:if>
		<tr>
			<td class="desc_BR Text_C">첨부파일</td>
			<td class="input_B Text_L" style="padding:5px;">
				<input type="File" id="InFile" multiple="true" name="DataAry" onchange="javascript:FileSel(this.files)">
				<div id="FileInfo" style="border:2px solid #C9C9C9;min-height:50px;">(선택된 파일이 없습니다.)</div>
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
						<%--
						<input type="checkbox" name="Middle" id="Middle" onclick="javascript:SelAll(this.name);"/>
						<label for="Middle"><font style="font-weight:bold;">전체선택</font></label> --%>
					</td>
					<td class="input_B Text_L" style="padding:5px;">
						<c:set var="cnt" value="0"/>
						<c:forEach var="EmpResult" items="${EmpList}" varStatus="status">
							
								<c:choose>
									<c:when test="${(vo.grpCd eq 1 and vo.cateCd eq 1) and EmpResult.persabun eq 200908001 and loginVO.regPerSabun ne 200908001 and userLoginInfo.division eq 'SYNERGY'}">
										<c:set var="chkflag" value="checked"/>
										<c:set var="setflag" value="N"/>
										<%--<c:set var="disflag" value="disabled"/> --%>
									</c:when>
									<%-- 구매요청 (vo.grpCd eq 1 and vo.cateCd eq 6) 201301001(임지연) --%>
									<c:when test="${(vo.grpCd eq 1 and vo.cateCd eq 6) and EmpResult.persabun eq 201301001 and loginVO.regPerSabun ne 201301001 and userLoginInfo.division eq 'SYNERGY'}">
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
						참조인<br/><br/>
						<!-- <font style="font-weight:bold;">전체선택</font> -->
						<div id="divSelAll" style="text-align:left;padding-left:20px;"></div>
						<!-- <input type="checkbox" name="Consult" id="Consult" onclick="javascript:SelAll(this.name);"/>
						<label for="Consult"><font style="font-weight:bold;">전체선택</font></label> -->
					</td>
					<td class="input_B Text_L" style="padding:5px;">
						<c:forEach var="EmpResult" items="${EmpList}" varStatus="status">
							
								<c:set var="sabun" value="${EmpResult.persabun}"/>
								<c:choose>
									<c:when test="${(sabun eq loginVO.regPerSabun || sabun eq vo.confirmPerSabun)}">
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
								<input type="checkbox" name="ConsultAry" class="${EmpResult.division}" id="ConsultAry${status.count}" value="${EmpResult.persabun}" ${chkflag} ${disflag} onclick="javascript:OneSel(this.id);"/>
								<label for="ConsultAry${status.count}">${EmpResult.pernm}</label>
								<input type="hidden" name="ConsultPerAry" id="ConsultPerAry${status.count}" value="${EmpResult.persabun}"/>
								<input type="hidden" name="ConsultDelAry" id="ConsultDelAry${status.count}" value="${setflag}"/>
								<input type="hidden" name="ConsultSabunAry${status.count}" id="ConsultSabunAry${status.count}"/>
								<input type="hidden" name="ConsultDelFlagAry${status.count}" id="ConsultDelFlagAry${status.count}"/>
								<input type="hidden" name="ConsultPhoneAry${status.count}" id="ConsultPhoneAry${status.count}" value="${EmpResult.perphone}"/>
								<c:if test="${status.count % 13 eq 0}"><br/></c:if>
								<c:if test="${status.index lt fn:length(EmpList)-1 and EmpList[status.index].division ne EmpList[status.index+1].division}"><br/><div style="color:gray;border-top:silver 1px dotted;width:98%;;font-size:8px;margin-top:3px;">${EmpList[status.index+1].division}</div></c:if>
							
						</c:forEach>
					</td>
				</tr>
<%-- 				<c:if test="${vo.CMD eq 'Add'}"> --%>
<!-- 				<tr> -->
<!-- 					<td class="desc_BR" style="width:100px;height:35px;padding-left:10px;">문자전송</td> -->
<!-- 					<td class="input_B" style="padding-left:10px;"> -->
<!-- 						<input type="checkbox" name="SMSSendFlag" id="SMSSendFlag" value="Y"/><label for="SMSSendFlag">문자전송</label> -->
<!-- 						<span style="color:#FF0000;">(체크하시고 게시물을 등록하시면 참조인으로 선택한 사람에게 해당 게시물에 대한 문자가 전송됩니다.)</span> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 				</c:if> --%>
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
	</form>
	</body>
</html>