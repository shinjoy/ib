<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PersonMain</title>
<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>
<script>
$(document).ready(function(){
	$('li').css('font-size','12px');
	if(${popUp == "Y"}){
		//$(".popUpBtn").css("display","none");
		$("#popUp").val("Y");
		$("#rtn").val("popUp");
		$("tr.link td").attr("onclick","");
	}
	$(".tblBack>tbody>tr:odd").css("background-color", "#F6F9FB");
	if($(window).width()<1010){
		$("#wrap").css("min-width","98%");
		if(typeof(parent.widthAuto)=='function')parent.widthAuto('990px');
	}
 });

function view(divId,e){ //divId : 보여주기위한 target divId
	var browserWidth = document.documentElement.clientWidth;
	var calWidth= $("#" + divId).outerWidth();
	var pstn = getPosition(e);
	var top = pstn.y;
	var left = pstn.x;
	$("#"+divId).css({"top":top+"px","left":(left+calWidth<browserWidth?left:browserWidth-(calWidth+8))+"px"});
	$("#"+divId).css('display','block');
	$(".popUpMenu").hide();
	$("#"+divId).show();
}
function linkPage(pageNo,th){
	var obj = $(th).parent().parent().parent()
		,data = {cstSnb: $("#cst_snb").val(),cstId: $("#cst_snb").val(),pageIndex: pageNo}
		,fn = function(arg){
			obj.html(arg);
		}
		,url= obj.attr('id')+".do";
	ajaxModule(data,url,fn);
}
</script>
<style>
.hov:hover{
	background-color: moccasin/* #f90 */ !important;
}
</style>
<base target="_self">
</head>
<body>

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">	
<input type="hidden" id="rtn" value="">

<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
	<input type="hidden" id="popUp" name="popUp">
</form>

<form id="downName" name="downName" action="<c:url value='/work/downloadProcess.do' />" method="post">
	<input type="hidden" name="makeName" id="makeName"/>
	<input type="hidden" name="recordCountPerPage" value="0"/>
</form>
<%-- <form id="modifyCst" name="modifyCst" action="<c:url value='/person/modifyCst.do' />" method="post">
	<input type="hidden" id="m_Name" name="sNb">
</form> --%>

<script>
var arg = window.dialogArguments;
if(arg!=null){
	if(${empty cstList}) {
		$("#s_Name").val(arg.snb);
		$("#popUp").val("Y");
		$("#customerName").submit();
	}
};


function getPosition(e) {
    e = e || window.event;
    var cursor = {x:0, y:0};
    if (e.pageX || e.pageY){
        cursor.x = e.pageX;
        cursor.y = e.pageY;
    } 
    else {
        cursor.x = e.clientX + 
            (document.documentElement.scrollLeft || 
            document.body.scrollLeft) - 
            document.documentElement.clientLeft;
        cursor.y = e.clientY + 
            (document.documentElement.scrollTop || 
            document.body.scrollTop) - 
            document.documentElement.clientTop;
    }
    return cursor;
}

var cpnDivShow = function(e,divId){
	var browserWidth = document.documentElement.clientWidth;
	var calWidth= $("#" + divId).outerWidth();
	var pstn = getPosition(e);
	var top = pstn.y;
	var left = pstn.x;
	$("#"+divId).css({"top":top,"left":(left+calWidth<browserWidth?left:browserWidth-(calWidth+8))});
	$("#"+divId).css('display','block');
	$("#"+divId).show();
}

var ajaxOffer = function(e, snb, cstid, sort){
	var DATA = {
				 sNb: snb
				,cstId: cstid
				,tmpNum1:'off'
				,sort_t: sort
				//,choice_month:''
		};
	$.ajax({
		type:"POST",        //POST GET
		url:"../stats/statsPrivateOffer.do",     //PAGEURL
		data : DATA,
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			$("#offerDiv").html(arg);
			cpnDivShow(e,$("#offerPr").attr('id'));//alert(divId)
		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});
}

function saveNoteOFnet(cate, cnt){
	$(".popUpMenu").hide();
	var DATA = {
		sNb: $("#"+cate+"Snb"+cnt).val(),
		cate:cate,
		note: $("#"+cate+"Area"+cnt).val(),
		title: $("#"+cate+"Title"+cnt).val()
		};
	var url = "../person/modifyNetwork.do";
	var fn = function(){
		if($(".popUpBtn").css("display")=="none") return;
		var frm = document.getElementById('customerName');//sender form id

		if($("#rtn").val()!='popUp'){
			var target = "mainFrame";
			if(parent.insertStockFirmIbYN()=="Y") target = "stockCstFrame";
			frm.target = target;//target frame name
		}
		frm.submit();
	};
	ajaxModule(DATA,url,fn);
}
function modifyNet(th, cnt, snb,netSnb,cate){

	$(".popUpMenu").hide();
	$('#s_Name').val(snb);

	if('cstNet'==cate) 		div = 'netPr';
	else if('cpnNet'==cate) div = 'cpnNetPr';
	else if('dealNet'==cate)div = 'cstDealPr';
	else if('info'==cate) 	div = 'infoPr';

	divShow($(th), div+cnt);
}

function deleteNet(snb,netSnb,cate){
	var DATA = {sNb: netSnb, cate:cate};

	if(confirm("삭제하시겠습니까?")){
		var url = "../person/deleteNetwork.do";
		var fn = function(){
			$('#s_Name').val(snb);
			var frm = document.getElementById('customerName');//sender form id

			if($("#rtn").val()!='popUp'){
				var target = "mainFrame";
				if(parent.insertStockFirmIbYN()=="Y") target = "stockCstFrame";
				frm.target = target;//target frame name
			}
			frm.submit();
		};
		ajaxModule(DATA,url,fn);

	};
}
function re_fresh(){
	$("#s_Name").val($("#cst_snb").val());
	$("#customerName").submit();
}
function insertStaffNet(th){
	var obj = $(th).parent().parent()
	,netCode = obj.find('input:radio[name=rdoS]:checked').val()
	,cst = obj.find('input:eq(0)').val()
	,rgid = obj.find('input:eq(1)').val()
	,s_nb = $("#cst_snb").val();
	if(netCode==null || netCode==''){
		alert("구분을 선택하지 않았습니다.\n선택후 다시등록해 주세요.");
		return;
	}
	var data = {
			cstSnb: cst
			,netCd: netCode
			,comment: obj.find('textarea').val()
			,snb1st: rgid
	};	
	var url = "../network/insertStaffNetwork.do";
	var fn = function(arg){
		if(arg>0){
			alert("중복된 직원인맥입니다.");
			$(".popUpMenu").hide();
		}else{
			$("#s_Name").val(s_nb);
			$('.popUpMenu').hide();
			//$("#customerName").submit();
		}
	};
	ajaxModule(data,url,fn);
}

function chgExposure(th){
	var obj = $("#cellPhn").html()
		,phnNum = ''
		,s_nb = $("#cst_snb").val()
		,tm = '[N]';
	if($(th).attr('checked')=='checked'){
		exp = 'N';
	}else{
		exp = 'Y';
	}
	if(obj.indexOf(tm)>-1){
		phnNum = obj.split(tm)[1];
	}else{
		phnNum = obj;
	}
	var data = {sNb:s_nb, phn1: phnNum, phnExposure: exp}
		,fn = function(){
			re_fresh();
	};
	ajaxModule(data,"../person/updateCstPhn.do",fn);
}
function saveIncharge(cstNm,staffNm,snb,target){
	if(confirm(" '"+cstNm+"' 의 담당자로\n '"+staffNm+"' 을/를 지정합니다.")){
		var url="<c:url value='/company/saveIncharge.do' />"
		,data={sNb:snb,categoryCd:'2',tmpNum1:target}
		,fn=function(){
			re_fresh();
		};
		ajaxModule(data,url,fn);
	}
}
</script>
<style>
.cstInfo>tr>th{font-size:12px;}.cstInfo>tr>td{padding:5px 10px;min-width:160px;}
tr.hov:hover,td.hov:hover {background-color: moccasin !important;}
.t_skinR00>tbody>tr:hover{background-color:white !important;}
.t_skinR00>thead>tr>td{border-top: 1px solid #E6E6E6;}
</style>
<div id="offerDiv"><div id="offerPr" style="display: none;"></div></div>


	<header>
	</header>
	<section>
		<article>
							
			<c:forEach var="cst" items="${cstList}">
			<input type="hidden" id="cst_snb" value="${cst.sNb}">

			<table class="t_skinR00">
				<colgroup>
					<col width="122">
					<col width="">
				</colgroup>
				<thead class="cstInfo">
				<th class="tbColor" >이름</th>
				<td style="min-width:220px;">&nbsp;<b>${cst.cstNm}</b>
					<c:if test="${fn:length(cst.cstNm) == 0}">
					<spring:message code="info.nodata.msg" />
					</c:if>
				</td>
				<tr>
					<th class="tbColor" >담당자</th>
					<td>&nbsp;<b>${cst.usrNm}</b></td>
				</tr>
				<tr>
					<th class="tbColor" style="border-bottom-left-radius: 10px;">e-mail</th>
					<td>&nbsp;<c:if test="${userLoginInfo.permission >'00019' or userLoginInfo.id eq cst.rgId}">${cst.email}</c:if></td>
				</tr>
				</thead>
			</table>
			<div style="height:15px;">&nbsp;</div>
			<table class="t_skinR00">
				<colgroup>
					<col width="122">
					<col width="">
				</colgroup>
				<thead>
				<tr>
					<th class="tbColor tbColorSub">이력/정보</th>
					<td>&nbsp;</td>
				</tr>
				</thead>
				<tbody><tr>
					<td colspan="2">
						<table class="sub_tbl">
							<c:forEach var="note" items="${noteList}" varStatus="status">
							<tr>
								<%--<td><nobr><b>${fn:substring(note.title,0,18)}<c:if test="${fn:length(note.title) > 18}">...</c:if></b></nobr></td> --%>
								<td><b>${note.title}</b></td>
								<td></td>
								<td>${fn:replace(note.note, lf, "<br/>")}</td>
								<td></td>
								<td style="background-color:white !important;"><nobr><small>${note.rgNm}</small></nobr>
									<br/><nobr><small>'${fn:replace(fn:substring(note.rgDt,2,10),'-','.')}</small></nobr>
									<c:if test="${userLoginInfo.permission > '00019'  or  userLoginInfo.name==note.rgNm}">
									<br/>&nbsp;<img id="modiInfo${status.count}" style="vertical-align:bottom;" class="hand" src="<c:url value='/images/recommend/modify.png'/>" onclick="modifyNet(this,'${status.count}','${cst.sNb}','${note.noteSNb}','info')" title="수정"/>&nbsp;<img style="vertical-align:bottom;" class="hand" src="<c:url value='/images/recommend/delete.png'/>" onclick="deleteNet('${cst.sNb}','${note.noteSNb}','info')" title="삭제"/></td>
									</c:if>
								</td>
							</tr>
							</c:forEach>
							<c:if test="${fn:length(noteList) == 0}"><tr><td><spring:message code="info.nodata.msg" /></td></tr></c:if>
						</table>
						<table class="sub_tbl">
							<c:forEach var="meet" items="${meetList}" varStatus="status">
							<tr>
								<td><nobr><b>${meet.meetNm}</b></nobr></td>
								<td></td>
								<td>${fn:replace(meet.note,lf, "<br/>")}</td>
								<td></td>
								<td><nobr><small>${meet.rgNm}</small></nobr>
									<br/><nobr><small>'${fn:replace(fn:substring(meet.rgDt,2,10),'-','.')}</small></nobr>
								</td>
							</tr>
							</c:forEach>
						</table>
					</td>					
					</tr>
				</tbody>

				<thead><tr>
					<th class="tbColor tbColorSub">인물 네트워크</th>
					<td class="tbColorSub" style="min-width:220px;">&nbsp;</td>
					</tr>
				</thead>
				<tbody><tr>
					<td colspan="2" style="vertical-align: top;"><!-- 인물네트워크 -->
						<table class="sub_tbl t_skin04_cstNcpn tblBack" style="float:left;">
							<colgroup>
								<col width="180px;">
								<col />
								<col width="40px;">
							</colgroup>
							<tbody id="ajaxNetP">
							<c:forEach var="netP" items="${netList}" varStatus="status"><input type="hidden" id="snb2${netP.sNb}" value="${netP.cstId}"/><input type="hidden" id="snb1${netP.sNb}" value="${cst.sNb}"/><input type="hidden" id="npnm${netP.sNb}" value="${cst.cstNm} - ${netP.cstNm}"/>
							
							<tr>
								<td valign="top">
									<table class="sub_tbl t_skin04_cstNcpn">
										<colgroup>
											<col width="70px;">
											<col />
										</colgroup>
										<tr class="link" onclick="slctCst('${netP.cstId}');" title="${netP.position}">
											<td><b><nobr>${netP.cstNm}</nobr></b></td>
											<td>${netP.cpnNm}</td>
										</tr>
										<tr>
											<td style="padding:1px; color:gray;font-size:11px;" align="right"><span valign="top">└▷</span><nobr>${cst.cstNm}</nobr><br/><nobr>친밀도</nobr></td>
											<td><table class="t"><tr><c:forEach var="loop5" varStatus="L5" begin="1" end="5"><td class="tabImportant<c:if test="${netP.lvCd>=L5.count}"> bgLightGray</c:if>" title="${L5.count}" style="width:12px !important;"<c:if test="${not empty netP.sNb}"> onclick="javascript:selectLvCd('NP','${L5.count}','${netP.sNb}','customerName',event,this);"</c:if>></td></c:forEach></tr></table></td>
										</tr>
									</table>
								</td>
								<td style="padding:0 5px 0 2px;" id="modiCstNet${status.count}"<c:if test="${not empty netP.sNb}"> class="link" onclick="modifyNet(this,'${status.count}','${cst.sNb}','${netP.sNb}','cstNet')" title="수정"</c:if>>${fn:replace(netP.note,lf, "<br/>")}</td>
								<td align="center" style="color:gray;">
									<small>${netP.rgNm}</small>
									<c:if test="${not empty netP.sNb and (userLoginInfo.permission > '00019'  or  userLoginInfo.name==netP.rgNm)}"><img style="vertical-align:bottom;" class="hand" src="<c:url value='/images/recommend/delete.png'/>" onclick="deleteNet('${cst.sNb}','${netP.sNb}','cstNet')" title="삭제"/><br/></c:if>
								
							</tr>
							</c:forEach>
							<c:if test="${fn:length(netList) > 0}"><tr><td colspan="3" style="text-align:center;padding-left:60px;"><ui:pagination type="image" paginationInfo = "${paginationInfo}" jsFunction="linkPage" /></td></tr></c:if>
							<c:if test="${fn:length(netList) == 0}"><tr><td><spring:message code="info.nodata.msg" /></td></tr></c:if>
							</tbody>
						</table>
					</td>
					</tr>
				</tbody>

				<thead><tr>
					<th class="tbColor tbColorSub">시너지와 이력</th>
					<td class="tbColorSub">&nbsp;&nbsp;<span class="btn s navy"><a onclick="ajaxOffer(event,'','${cst.sNb}')">상세보기</a></span></td>					
					</tr>
				</thead>
				<tbody><tr>
					<td colspan="2">
						<table class="sub_tbl t_skin04_cstNcpn" style="width:auto;">
							<tbody id="ajaxOfferP">
							<c:forEach var="offer" items="${offerList}" varStatus="status">
							<c:choose>
								<c:when test="${(offer.offerCd == '00006') or (offer.offerCd == '00007') or (offer.offerCd == '00013') }"><tr class="link"  onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');"></c:when>
								<c:otherwise><tr class="link" onclick="ajaxOffer(event,'${offer.sNb}')"></c:otherwise>
							</c:choose>
								<td>'${fn:replace(fn:substring(offer.tmDt,2,10),'-','.')}</td>
								<td><b>${offer.cpnNm}</b></td>
								<td><font color="green">${offer.offerNm}<c:if test="${empty offer.offerNm}">${offer.middleOfferNm }</c:if></font><c:if test="${offer.opinion != 0}"><span style="color:darkgoldenrod">&nbsp;<b>[${offer.opinion}]</b></span></c:if>&nbsp;</nobr></td>
								<td></td>
								<td>${offer.rgNm}</td>
								<td>
									<c:if test="${not empty offer.realNm}"><c:choose><c:when test="${fn:indexOf(offer.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(offer.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(offer.makeNm, '^^^')}"/><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file${imSt.count}" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(offer.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file1" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${offer.realNm}"></c:otherwise></c:choose></c:if>
								</td>
							<c:if test="${offer.middleOfferCd > 0}">
								<td><c:forEach var="cmmCd" items="${cmmCdProgressCdList}"><c:if test="${offer.progressCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach></td>
								<td style="max-width: 200px;"><c:if test="${not empty offer.result}">/</c:if> ${offer.result}</td>
								<td style="max-width: 200px;"><c:if test="${not empty offer.subMemo}">/</c:if> ${offer.subMemo}</td></c:if><c:if test="${offer.middleOfferCd < 1}"><td></td><td></td><td></td></c:if>
							</tr>
							<c:if test="${not empty offer.financing or not empty offer.humanNet or not empty offer.management or not empty offer.mna or not empty offer.etc or not empty offer.share or not empty offer.resource or not empty offer.investInte}">
							<tr>
								<td></td>
								<td colspan="8" style="max-width:400px;">
									<font color="#B45F04">
										<c:if test="${not empty offer.financing 	}">&nbsp;&nbsp;<b>CB/EB:</b> ${offer.financing}</c:if>
										<c:if test="${not empty offer.humanNet 		}">&nbsp;&nbsp;<b>워런트/블록딜:</b> ${offer.humanNet}</c:if>
										<c:if test="${not empty offer.audit 		}">&nbsp;<c:forEach var="starC" begin="1" end="${offer.star}"><img class="" id="file${starC}" src="../images/figure/star_y.png" style="width:10px;height:10px;"/></c:forEach><c:forEach var="starC" begin="${offer.star+1}" end="5"><img class="" id="file${starC}" src="../images/figure/star_g.png" style="width:10px;height:10px;"/></c:forEach>&nbsp;<b>분석의견:</b> ${offer.audit}</c:if>
										<c:if test="${not empty offer.management 	}">&nbsp;&nbsp;<b>자산운용:</b> ${offer.management}</c:if>
										<c:if test="${not empty offer.etc 			}">&nbsp;&nbsp;<b>실적:</b> ${offer.etc}</c:if>
										<c:if test="${not empty offer.investInte 	}">&nbsp;&nbsp;<b>투자관심:</b> ${offer.investInte}</c:if>
										<c:if test="${not empty offer.resource 		}">&nbsp;&nbsp;<b>매수추천:</b> ${offer.resource}</c:if>
										<c:if test="${not empty offer.mna 			}">&nbsp;&nbsp;<b>M&A:</b> ${offer.mna}</c:if>
										<c:if test="${not empty offer.share 		}">&nbsp;&nbsp;<b>공유:</b> ${offer.share}</c:if>
									</font>
								</td>
							</tr>
							</c:if>
							</c:forEach>
							
							<c:forEach var="offer" items="${staffOfferList}" varStatus="status">
							<c:choose>
								<c:when test="${(offer.offerCd == '00006') or (offer.offerCd == '00007') or (offer.offerCd == '00013') }"><tr class="link"  onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');"></c:when>
								<c:otherwise><tr class="link" onclick="ajaxOffer(event,'${offer.sNb}')"></c:otherwise>
							</c:choose>
								<td>'${fn:replace(fn:substring(offer.tmDt,2,10),'-','.')}</td>
								<td><b>${offer.cpnNm}</b></td>
								<td><font color="green">${offer.offerNm}<c:if test="${empty offer.offerNm}">${offer.middleOfferNm }</c:if></font></td>
								<td>${offer.cstCpnNm}&nbsp;&nbsp;</td>
								<td>${offer.cstNm}</td>
								<td>
									<c:if test="${not empty offer.realNm}"><c:choose><c:when test="${fn:indexOf(offer.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(offer.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(offer.makeNm, '^^^')}"/><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file${imSt.count}" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(offer.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file1" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${offer.realNm}"></c:otherwise></c:choose></c:if>
								</td>
								
							<c:if test="${offer.middleOfferCd > 0}">
								<td><c:forEach var="cmmCd" items="${cmmCdProgressCdList}"><c:if test="${offer.progressCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach></td>
								<td style="max-width: 200px;"><c:if test="${not empty offer.result}">/</c:if> ${offer.result}</td>
								<td style="max-width: 200px;"><c:if test="${not empty offer.subMemo}">/</c:if> ${offer.subMemo}</td></c:if><c:if test="${offer.middleOfferCd < 1}"><td></td><td></td><td></td></c:if>
							</tr>
							<c:if test="${not empty offer.financing or not empty offer.humanNet or not empty offer.management or not empty offer.mna or not empty offer.etc or not empty offer.share or not empty offer.resource or not empty offer.investInte}">
							<tr>
								<td></td>
								<td colspan="8" style="max-width:400px;">
									<font color="#B45F04">
										<c:if test="${not empty offer.financing 	}">&nbsp;&nbsp;<b>CB/EB:</b> ${offer.financing}</c:if>
										<c:if test="${not empty offer.humanNet 	}">&nbsp;&nbsp;<b>워런트/블록딜:</b> ${offer.humanNet}</c:if>
										<c:if test="${not empty offer.audit 		}">&nbsp;<c:forEach var="starC" begin="1" end="${offer.star}"><img class="" id="file${starC}" src="../images/figure/star_y.png" style="width:10px;height:10px;"/></c:forEach><c:forEach var="starC" begin="${offer.star+1}" end="5"><img class="" id="file${starC}" src="../images/figure/star_g.png" style="width:10px;height:10px;"/></c:forEach>&nbsp;<b>분석의견:</b> ${offer.audit}</c:if>
										<c:if test="${not empty offer.management 	}">&nbsp;&nbsp;<b>자산운용:</b> ${offer.management}</c:if>
										<c:if test="${not empty offer.etc 			}">&nbsp;&nbsp;<b>실적:</b> ${offer.etc}</c:if>
										<c:if test="${not empty offer.investInte 	}">&nbsp;&nbsp;<b>투자관심:</b> ${offer.investInte}</c:if>
										<c:if test="${not empty offer.resource 	}">&nbsp;&nbsp;<b>매수추천:</b> ${offer.resource}</c:if>
										<c:if test="${not empty offer.mna 			}">&nbsp;&nbsp;<b>M&A:</b> ${offer.mna}</c:if>
										<c:if test="${not empty offer.share 		}">&nbsp;&nbsp;<b>공유:</b> ${offer.share}</c:if>
									</font>
								</td>
							</tr>
							</c:if>
							</c:forEach>
							<c:if test="${not empty staffOfferList}"><tr><td colspan="9" style="text-align:center;padding-left:120px;"><ui:pagination type="image" paginationInfo = "${paginationInfoOf}" jsFunction="linkPage" /></td></tr></c:if>
							<c:if test="${empty staffOfferList or not empty offerList}"><tr><td><spring:message code="info.nodata.msg" /></td></tr></c:if>
							</tbody>
						</table>
					</td></tr>
				</tbody>
			
			</table>
			</c:forEach>
		</article>
	</section>
	
	<div class="popUpMenu" style="width:460px;" id="tbl00">
		<p name="textR" style="margin: 0;text-align: right;background-color: #323232;border-bottom: 1px solid #F2F2F2;color: #FFF;border-radius: 4px 4px 0 0;font-weight: bold;padding: 7px 12px 7px 15px;position: relative;">&nbsp;</p>
		<table class="t_skinR00" style="width:100%">
			<thead>
			<tr>
				<th style="width:40px;border-radius:0px;">인물</th>
				<input type="hidden" id="AP_cstId_0" value=""/>
				<input type="hidden" id="NPrgId" value=""/>
				<td style="border-radius:0px;"><span id="NPrgNm" class="btn s glass" style="margin:0px 0px 0px 5px;"></span></td>
			</tr>
			<tr>
				<th>구분</th>
				<td><span style="margin:0px 0px 0px 5px;display:inline-block;line-height: 150%;"><c:forEach var="cm" items="${cmmCdNet}" varStatus="cmS">
						<label><input type="radio" name="rdoS" value="${cm.dTailCd}" align="absmiddle"/>
						${cm.cdNm}</label><c:if test="${cmS.count==5}"><br/></c:if>
				</c:forEach></span></td>
			</tr>
			<tr>
				<th>메모</th>
				<td><textarea style="width:95%;margin:0px 0px 0px 5px;border:1px solid lightgray;font-size:11px;"></textarea></td>
			</tr>
			</thead>
		</table>
		<p class="cent" style="margin:3px 0px;"><span class="btn s green" onclick="javascript:insertStaffNet(this);"><a>저장</a></span></p>
	</div>
<%-- 네트워크 --%>
	<c:forEach var="note" items="${cpnNet}" varStatus="status">
		<div class="popUpMenu popUpTitle_area" id="cpnNetPr${status.count}">
			<input type="hidden" id="cpnNetSnb${status.count}" value="${note.sNb}">
			<p class="closePopUpMenu">ⅹ닫기</p>
			<ul>
				<li><textarea id="cpnNetArea${status.count}" class="pop_note">${note.note}</textarea></li>
			</ul>
			<p class="bsnsR_btn">
				<span class="btn s green" onclick="saveNoteOFnet('cpnNet',${status.count});"><a>저장</a></span>&nbsp;&nbsp;&nbsp;
			</p>
		</div>
	</c:forEach>
	<c:forEach var="note" items="${cstDealInfo}" varStatus="status">
		<div class="popUpMenu popUpTitle_area" id="cstDealPr${status.count}">
			<input type="hidden" id="dealNetSnb${status.count}" value="${note.sNb}">
			<p class="closePopUpMenu">ⅹ닫기</p>
			<ul>
				<li><textarea id="dealNetArea${status.count}" class="pop_note">${note.note}</textarea></li>
			</ul>
			<p class="bsnsR_btn">
				<span class="btn s green" onclick="saveNoteOFnet('dealNet',${status.count});"><a>저장</a></span>&nbsp;&nbsp;&nbsp;
			</p>
		</div>
	</c:forEach>
<%-- 네트워크 --%>

<%-- 노트수정 --%>
<div>
	<c:forEach var="note" items="${noteList}" varStatus="status">
		<div class="popUpMenu title_area" id="infoPr${status.count}">
			<input type="hidden" id="infoSnb${status.count}" value="${note.noteSNb}">
			<p class="closePopUpMenu">ⅹ닫기</p>
			<ul>
				<li class="c_title"><input class="m_note" type="text" id="infoTitle${status.count}" value="${note.title}"/></li>
				<li class="c_note"><textarea id="infoArea${status.count}">${note.note}</textarea></li>
			</ul>
			<p class="bsnsR_btn">
				<span class="btn s green" onclick="saveNoteOFnet('info',${status.count})"><a>저장</a></span>&nbsp;&nbsp;&nbsp;
			</p>

		</div>
	</c:forEach>
</div>
<%-- 노트수정 --%>
<%-- 노트 추가 --%>
		<div class="popUpMenu title_area" id="addNotePr0" name="textR">
			<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
			<ul>
				<li class="c_title"><input class="m_note" type="text" id="txt0" placeholder="이력/정보 제목"/></li>
				<li><textarea id="resultarea0" placeholder="이력/정보사항.."></textarea></li>
			</ul>
			<p class="bsnsR_btn">
				<span class="nt_btnOk btn s green"><a>저장</a></span>&nbsp;&nbsp;&nbsp;
			</p>
		
		</div>
<%-- 노트 추가 --%>
</body>
</html>