<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>


<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js?ver=0.1"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 


<script>
var divisionList;
var division ="${userLoginInfo.division}";
$(document).ready(function(){
	$(".t_skinR00 tbody tr.bgOdd:odd").css("background-color", "#F6F9FB");
	$(".t_skinR00 tbody tr.gray").css("background-color", "#B9B9B9");
	$(".t_skinR00 tbody tr.hold").css("background-color", "#E7E7E7");
	$(".t_skinR00 tbody tr.success").css("background-color", "#A9F5BC");

	var divisionList= getCodeInfo(null,null,null,null,null,null,"/common/getDivisionList.do",null);
	$("#divisionDiv").empty();
	for(var i=0;i<divisionList.length;i++){
		var str="";
		str='<div id="userListDiv'+divisionList[i].divCode+'"></div>'
		$("#divisionDiv").append(str);
		getUserList(divisionList[i].divCode,divisionList[i].divName,divisionList.length); 
		
	}
});
function getUserList(divCode,divName,count){
	var url = contextRoot + "/work/selectuserList.do";
	var param = {division : divCode};

	    	    	
	var callback = function(result){
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;		//결과수
		var list = obj.resultList;		//결과데이터JSON
		
		if(list.length>0){
			var str=' ';
			str+='<p class="pd0 mg0">';
			for(var i=0 ; i<list.length ;i++){
				str+=' <input type="radio" class="chbox id="chbox'+i+'" name="memoSndName" value="'+list[i].usrNm+'"> ';
				str+=' <label for="chbox'+i+'" class="checkR">'+list[i].usrNm+'</label> ';
				 if(i%2==1){
					str+='</p><p class="pd0 mg0">';
				} 
			}
			str+='</p>';
			if(count>1){
				str=' <p style="background-color:white;text-align:center;width:100%;"> <b>'+divName+'</b> </p>'+str;
			}
			$("#userListDiv"+divCode).html(str);
		}
	};
	commonAjax("POST", url, param, callback, true, null, null);
}



function updateRCMD(tag,rslt,snb,cpnNm,rowCnt,th,category,proposer,price){
	
	var sttsObj = {'00001':'검토중',			//진행상태 코드
				   '00002':'보류',
				   '00003':'딜제안',
				   '10000':'drop'};
	
	var DATA = null;
	var msg = "변경하시겠습니까?";
	
	if(tag=='rslt'){
		DATA = ({sNb:snb, result:rslt});
	}else if(tag=='progress'){
		
		if(rslt == '00003'){		//진행사항 -- 딜제안

			if(isEmpty(proposer)){		//딜제안자 미입력시
				alert('딜 제안자를 먼저 등록하시 바랍니다!');
				$(th).val($('#progVal'+rowCnt).val());		//원래 상태값으로 되돌아가기.
				return;
			}
			
			//딜(딜제안중) 등록 팝업			
			if(confirm("[추천종목 -> 딜제안중] 변경\n\n추천종목을 딜제안중 으로 진행하시겠습니까?\n\n  step1. 추천종목을 통해 제안중 딜이 신규 등록되고,\n  step2. 추천종목은 딜제안으로 상태변경\n")){
				regDealPopup(snb, rowCnt, cpnNm, category, proposer, price, th);				
			}else{
				$(th).val($('#progVal'+rowCnt).val());		//원래 상태값으로 되돌아가기.
			}			
			return;
		}
		
		msg = sttsObj[rslt] + ' (으)로 ' + msg;
		DATA = ({sNb:snb, progressCd:rslt});
		
	}else if(tag=='proposer'){
		DATA = ({sNb:snb, rcmdProposer: $(".chbox:checked").val(),cpnNm:cpnNm, subMemo: "N"});
	}else if(tag=='price'){
		DATA = ({sNb:snb, price:rslt});
	}
	
	if(confirm(msg)){
		
		var url = "../recommend/updateResult.do";
		var fn = function(){
			document.location.reload();
			//document.companyName.submit();
		};
		ajaxModule(DATA,url,fn);
		
	}else{
		if(tag=='progress'){
			$(th).val($('#progVal'+rowCnt).val());		//원래 상태값으로 되돌아가기.
		}
	}
}


//딜 제안중 등록
var myModal = new AXModal();		// instance

function regDealPopup(sNb, rowCnt, cpnNm, category, proposer, price, th){			////딜 제안중 등록 팝업
	
	var url = "<c:url value='/recommend/regDealPopup.do'/>";
   	var params = {'oriSnb':sNb,		//추천종목 딜
   				  'rowCnt':rowCnt,
   				  'cpnNm':cpnNm,
   				  'category':category,
   				  'regNm':proposer,
   				  'price':price};	//"btype=1&cate=1".queryToObject();		//게시판유형(board_type), 게시판 카테고리 를 넘긴다. 
   	
   	myModal.setConfig({windowID:"myModalCT",
   					   onclose:function(){$(th).val($('#progVal'+rowCnt).val());}});		//원래 상태값으로 되돌아가기.
   	       	
   	myModal.open({
   		url: url,
   		pars: params,
   		titleBarText: '[딜등록] 추천종목 -> 딜제안중',		//titleBarText 속성 추가하였음.(원 Axisj에는 없었던것)
   		method:"POST",
   		top: 150,
   		width: 840,
   		closeByEscKey: true				//esc 키로 닫기   		
   	});
   	
   	$('#myModalCT').draggable();
	
}


</script>
<style>.wVariable{width:210px !important;}.overFlowHide{overflow:hidden}</style>
</head>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<form id="downName" name="downName" action="<c:url value='/work/downloadProcess.do' />" method="post">
	<input type="hidden" name="makeName" id="makeName"/>
	<input type="hidden" name="recordCountPerPage" value="0"/>
</form>

<body>
<div id="wrap" style="height:100%;">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

	<input type="hidden" id="SendReceive" value="RC">
	
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">

<!-- 지정 -->
	<div class="popUpMenu" id="test"  >
		<p class="closePopUpMenu" title="닫기">ⅹ닫기</p>
			<div id="divisionDiv"></div>
		
		<p class="bsnsR_btn" style="padding:5px;">
			<span class="memo_btnSnd btn s green"><a id="saveBTN" >저장</a></span>
			<input type="text" id="PM_0" style="height:1px;width:1px;border:0px none;padding:0;vertical-align:bottom;">
		</p>
	</div>	
<!-- 지정 -->
<%-- 메모 --%>
<div>
	<c:forEach var="offer" items="${recommendList}" varStatus="status">
	
		<div class="popUpMenu title_area" id="memoPr${offer.offerSnb}" name="textR">
			<input type="hidden" id="dealMemoSNb${offer.offerSnb}" value="${offer.offerSnb }">
			<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
			<ul>
				<c:choose>
					<c:when test="${empty offer.subMemo}">
					<li class="c_note"><textarea id="memoarea0" placeholder="메모(전달사항)를 입력하세요."></textarea></li>
					</c:when>
					<c:otherwise>
					<li class="c_note"><textarea id="memoarea${offer.offerSnb}">${offer.subMemo}</textarea></li>
					</c:otherwise>
				</c:choose>
				<p class="bsnsR_btn">
					<span class="btn s green" onclick="recommendSubMemo(this,'${offer.cpnNm}','${offer.rgNm}','${offer.rcmdProposer}','${offer.progressCd}')"><a>저장</a></span>&nbsp;&nbsp;&nbsp;
					<!-- <span class="dealMemo_btnDel">완전삭제</span> -->
					<input type="text" tabindex="1" id="RM_${offer.offerSnb}" style="height:1px;width:1px;border:0px none;padding:0;vertical-align:bottom;">
				</p>
			</ul>
		
		</div>
<!-- 의견 -->
		<div class="popUpMenu title_area" id="opinionPr${offer.offerSnb}" name="textR">
		<c:choose><c:when test="${userLoginInfo.permission > '00019'  or  userLoginInfo.name==offer.rgNm or userLoginInfo.permission == '00014'}"> 
				<input type="hidden" id="dealOpinionSNb${offer.offerSnb}" value="${offer.offerSnb }">
				<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
				<ul><c:choose>
					<c:when test="${empty offer.investOpinion}"><li class="c_note"><textarea id="opinionarea0" placeholder="투자의견을 입력하세요."></textarea></li></c:when>
					<c:otherwise><li class="c_note"><textarea id="opinionarea${offer.offerSnb}">${offer.investOpinion}</textarea></li></c:otherwise></c:choose>
					<p class="bsnsR_btn">
						<span class="dealResult_btnOk btn s green"><a>저장</a></span>&nbsp;&nbsp;&nbsp;
						<!-- <span class="dealResult_btnDel">완전삭제</span> -->
					</p>
				</ul>
			</c:when><c:otherwise>
				<input type="hidden" id="opinionSNb${offer.offerSnb}" value="${offer.offerSnb }">
				<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
				<ul>
					<li class="c_note v-textarea">${fn:replace(offer.investOpinion, lf,"<br/>")}</li>
				</ul></c:otherwise>
		</c:choose>
		</div>
<!-- 의견 -->
	</c:forEach>
</div>
<%-- 메모 --%>

	<section>
			<c:set var="now" value="<%= new java.util.Date() %>"/>
			<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
			<fmt:formatDate var="cur_month" value='${now}' pattern='MM'/>
			
			<%-- <input type="hidden" id="choice_month" name="choice_month" value="${OPlist.choice_month}"> --%>
	<form name="modifyRec" action="<c:url value='/recommend/index.do' />" method="post"><input type="hidden" name="sorting" id="sorting"><input type="hidden" name="total" value="${ttT}"></form>
	<header>
		<form name="dayForm" id="dayForm" method="post">
			<input type="hidden" name="total">
		<div class="year_wrap" style="top:0px"><h2 style="margin: 5px 0px 5px 0px;">
		
			<c:set var="now" value="<%= new java.util.Date() %>"/>
			<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
			<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
						
			<%-- <input type="hidden" id="choice_month" name="choice_month" value="${choice_month }"/> --%>
			<input type="hidden" id="total" name="total"/>
			<%-- <input type="hidden" id="carNum" name="carNum" value="${carNumber }"/> --%>
			
			<span class="year">
				<select id='deal_select_year' name='choice_year'>
					<c:forEach var="year" begin="2013" end="${cur_year}">
						<option value="${year}"
						<c:choose>
							<c:when test="${choice_year == null}">
								<c:if test="${year == cur_year}">selected</c:if>>
							</c:when>
							<c:otherwise>
								<c:if test="${year == choice_year}">selected</c:if>>
							</c:otherwise>
						</c:choose> 
						${year}</option>
					</c:forEach>
				</select>
			</span>
			<span class="btn s red"><a onclick="totalView('total');">전체</a></span>
			추천종목</h2>
		</div>
		</form>
		<h2 class="headerTitle">&nbsp;</h2>
		</header>

			<table class="t_skinR00 t_skin05width">
				<thead>
					<tr>
 						<th onclick="sortTable()" class="hand w70p">일자<br/>▼</th>
 						<th onclick="sortTable(4)" class="hand">종목<br/>▼</th>
 						<th onclick="sortTable(5)" class="hand w80p"><nobr>유형</nobr><br/>▼</th>
 						<th onclick="sortTable(3)" class="hand w50">추천인<br/>▼</th>
 						<th class="wVariable">증권사IB<br/><small>(과거 거래이력이 있는  증권사IB)</small></th>
 						<th class="w50"><nobr>파일</nobr></th>
 						<th class="w50">보기</th>
 						<th class="bgYlw"><nobr>투자</nobr></br>의견</th>
 						<th class="w50">결과</th>
 						<th class="w50"><nobr>딜제안자</nobr></th>
 						<th class="w50">규모</th>
 						<th class="w50">진행사항</th>
 						<th class=""><nobr>성과/중요도</nobr></th>
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
				<tbody>
					<c:forEach var="rcmd" items="${recommendList}" varStatus="status"><c:set var="cnt" value="${status.count }"/>
						<tr class="bgOdd <c:if test="${rcmd.progressCd=='10000'}">gray</c:if> <c:if test="${rcmd.progressCd=='00003'}">success</c:if>  <c:if test="${rcmd.progressCd=='00002'}">hold</c:if>">
							<td class="cent"><nobr>${rcmd.tmDt}</nobr></td>
							<td class="cent navy bold pd0"><nobr><a onclick="popUp('','rcmdCpn','','${rcmd.sNb}')">${rcmd.cpnNm}</a></nobr></td>
							<td class="cent"><nobr><c:forEach var="cmmCd" items="${cmmCdCategoryList}"><c:if test="${rcmd.categoryCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach></nobr></td>
							<td class="cent"><nobr>${rcmd.rgNm}</nobr></td>
							<td class="cent navy bold pd0 ibs"><c:if test="${not empty rcmd.ibInfo or not empty rcmd.ibInfoDealNet}"><div class="wVariable overFlowHide">
								<table class="" style="margin:1px;float:left;"><tr><c:if test="${not empty rcmd.ibInfo}">
									<c:set var="eachIB" value="${fn:split(rcmd.ibInfo, ',')}"/>
									<c:forEach var="IBs" items="${eachIB}" varStatus="imSt">
										<c:set var="IBinfo" value="${fn:split(IBs, '^')}"/>
										<td class="" title="${IBinfo[2]}" style="padding:2px 4px;"><a onclick="popUp('','rcmdCst','','${IBinfo[0]}')">
											<small><nobr>${IBinfo[4]}</nobr></small><br/>${IBinfo[1]}
										</a></td>
									</c:forEach>
								</c:if><c:if test="${not empty rcmd.ibInfoDealNet}">
									<c:set var="eachIBdealNet" value="${fn:split(rcmd.ibInfoDealNet, ',')}"/>
									<c:forEach var="IBs2" items="${eachIBdealNet}" varStatus="imSt">
										<c:set var="IBinfoDealNet" value="${fn:split(IBs2, '^')}"/>
										<td class="" title="${IBinfoDealNet[2]}"><a onclick="popUp('','rcmdCst','','${IBinfoDealNet[0]}')">
											<nobr>${IBinfoDealNet[4]}</nobr><br/>
											${IBinfoDealNet[1]}
										</a></td>
									</c:forEach>
								</c:if>
								</tr></table></div></c:if>
							</td>
							
							<td>
								<input type="hidden" id="offerSnb${cnt}" value="${rcmd.offerSnb}">
								<span class="btn s" style="vertical-align:top;"><a onclick="popUp('${cnt}','files_rcmd','recommend')">파일첨부</a></span>		<%-- files -> files_rcmd 20160524 --%> 
								
<!--  -->
								<c:if test="${not empty rcmd.realNm}">
								
									<c:set var="eachFile" value="${fn:split(rcmd.realNm, ',')}"/>
									<c:forEach var="Files" items="${eachFile}" varStatus="imStT">
										<c:set var="FileInfo" value="${fn:split(Files, '^')}"/>

											<c:set var="extension" value="${fn:split(FileInfo[1],'.')}"/>
											<c:set var="lastDot" value="${fn:length(extension)-1}"/>
											<input type="hidden"  id="mkNames${imStT.count}" value="${FileInfo[2]}"/>
											<c:set var="ext" value=""/>
											<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
											<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
											<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
											<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
		
											&nbsp;<img class="mail_send filePosition" id="file${imStT.count}"
											<c:choose>
												<c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when>
												<c:otherwise>src="../images/file/${ext}.png"</c:otherwise>
											</c:choose>
											title="${FileInfo[1]}">
									</c:forEach>
								</c:if>
<!--  -->
							</td>
							
							
							<td class="cent pd0"><nobr>
								&nbsp;<span class="btn s gold"><a id="opinionBtn${cnt }" onclick="popUp('','rcmdComment','','${rcmd.offerSnb}');">보기</a></span>
								<%-- <c:if test="${rcmd.analysis != 0}"><span style="color:mediumvioletred">&nbsp;<b>[${rcmd.analysis}]</b></span></c:if>
								<c:if test="${rcmd.opinion != 0}"><span style="color:darkgoldenrod">&nbsp;<b>[${rcmd.opinion}]</b></span></c:if>&nbsp; --%>
								</nobr>
							</td>
							<td style="width:70px;padding:2px;">
								<a class="opinion_m" id="opinion_${rcmd.offerSnb}"><font color="blue">
								<c:choose><c:when test="${empty rcmd.investOpinion}"><small><font style="color:silver"><i class="axi axi-edit2" style="font-size:15px;"></i></font></small></c:when>
									<c:otherwise>${fn:substring(rcmd.investOpinion,0,25)}<c:if test="${fn:length(rcmd.investOpinion) > 25}">...</c:if></c:otherwise></c:choose>
								</font></a>
							</td>
							<td class="cent pd0"><c:if test="${userLoginInfo.permission > '00019' or userLoginInfo.permission == '00014'}">
								<span class="btn s <c:if test="${rcmd.result == '00001'}">red</c:if>"><a onclick="updateRCMD('rslt','00001','${rcmd.offerSnb}');">&nbsp;적격&nbsp;</a></span><br/>
								<span class="btn s <c:if test="${rcmd.result == '00002'}">red</c:if>"><a onclick="updateRCMD('rslt','00002','${rcmd.offerSnb}');">부적격</a></span></c:if>
								
								<c:if test="${userLoginInfo.permission < '00020' and userLoginInfo.permission != '00014'}"><c:if test="${rcmd.result!='00000'}">
										<c:if test="${rcmd.result=='00001'}"><nobr><b style="color:red">적격</b></nobr></c:if>
										<c:if test="${rcmd.result=='00002'}"><nobr><b>부적격</b></nobr></c:if>
								</c:if></c:if>
							</td>
							<td class="cent"><c:if test="${userLoginInfo.permission > '00019' or userLoginInfo.permission == '00014'}">
									<c:if test="${empty rcmd.rcmdProposer}"><span class="btn s"><a id="staffID${cnt }" onclick="staffDiv(this,'test','${rcmd.offerSnb}','${rcmd.cpnNm}');">지정</a></span></c:if>
									<c:if test="${not empty rcmd.rcmdProposer}"><span class="btn s navy"><a id="updateStaff${cnt }" onclick="staffDiv(this,'test','${rcmd.offerSnb}','${rcmd.cpnNm}');">${rcmd.rcmdProposer}</a></span></c:if>
								</c:if><c:if test="${userLoginInfo.permission < '00020' and userLoginInfo.permission != '00014'}">
									<nobr>${rcmd.rcmdProposer}</nobr></c:if>
							</td>
							<td class="cent">
								<c:if test="${userLoginInfo.permission < '00020' and userLoginInfo.permission != '00014'}"><nobr>${rcmd.price}</nobr></c:if>
								<c:if test="${userLoginInfo.permission > '00019' or userLoginInfo.permission == '00014'}">
								<input type="text" id="price${cnt}" value="${rcmd.price}" style="width:50px;text-align:right;">
								<span class="btn s green"><a onclick="updateRCMD('price',$('#price${cnt}').val(),'${rcmd.offerSnb}');">수정</a></span><br/>
								</c:if>
							</td>
							<td class="cent">
								<input type="hidden" id="progVal${cnt}" value="${rcmd.progressCd}"><!-- 상태변화 전 값 -->
								<select onchange="updateRCMD('progress',this.value,'${rcmd.offerSnb}','${rcmd.cpnNm}','${cnt}', this, '${rcmd.categoryCd}', '${rcmd.rcmdProposer}', '${rcmd.price}');">
									<option value="00001" <c:if test="${rcmd.progressCd =='00001'}">selected</c:if>>검토중</option><!-- 구 진행중 -->
									<option value="00003" <c:if test="${rcmd.progressCd =='00003'}">selected</c:if>>딜제안</option><!-- 구 성사 -->
									<option value="00002" <c:if test="${rcmd.progressCd =='00002'}">selected</c:if>>보류</option>
									<option value="10000" <c:if test="${rcmd.progressCd =='10000'}">selected</c:if>>drop</option>
								</select>
							</td>
							<td>
								<a class="memo_m" id="memo_${rcmd.offerSnb}">
								<c:choose>
									<c:when test="${empty rcmd.subMemo}"><font style="color:burlywood"><nobr>성과/중요도</nobr></font></c:when>
									<c:otherwise><b>${fn:substring(rcmd.subMemo,0,19)}<c:if test="${fn:length(rcmd.subMemo) > 19}">...</c:if></b></c:otherwise>
								</c:choose>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</section>
</div>
<div class="clear"></div>
</body>
</html>