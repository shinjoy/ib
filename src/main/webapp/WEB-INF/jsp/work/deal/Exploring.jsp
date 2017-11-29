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
<link href="<c:url value='/css/management.css'/>" rel="stylesheet" type="text/css"/>
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/base.js'/>" ></script>
<script>

$(document).ready(function(){

	$("ul.dbody:even").css("background-color", "#E0F8F7");
	$("li font[color=blue]").parent().parent().addClass('bgGry');
	$("li font[color=red]").parent().parent().addClass('bgGry');
	$('.tabUnderBar').css('width','calc(100% - '+ parseInt(10 + 68*($('.1st').length)) +'px)');
	
	//정보정리 내용 수정
	$('.offerR_btnOk').click(function(){
		var obj = $(this).parent().parent().parent();
		var getSnb = obj.find('[id^=offerSnb]').val();
		var middleoffercd = obj.find('[id^=middleOfferCd]').val();
		var getOffercd = obj.find('[id^=offerCd]').val();
		var getCstId = obj.find('[id^=AP_cstId]').val();
		var getCpnId = obj.find('[id^=AP_cpnId]').val();
		var getPrice = obj.find('[id^=AP_price]').val();
		var getInvestPrice = obj.find('[id^=AP_investPrice]').val();
		var getInfoprovider = obj.find('[id^=AP_infoProviderId]').val();
		var getCoworker = obj.find('[id^=AP_coworkerId]').val();
		var getSupporter = obj.find('[id^=AP_supporterId]').val();
		var getSupporterRatio = obj.find('[id^=AP_supporterRatio]').val();
		var getSupporterText = obj.find('[id^=AP_supporterText]').val();
		var notNullSupporter = (getSupporter.is_null())?0:getSupporter;
		var getCategoryCd = obj.find('[id^=categoryCd]').val();
		var getRcmderSnb = obj.find('[id^=rcmderSnb]').val();
		var getExploringCnt = obj.find('[id^=AP_exploringCnt]').val();
		var getEntrust = '';
		var getCpnCst = '';

		switch(getOffercd){
		case '00003':
			if(0==getCstId) {alert("인물을 선택해 주세요.");return;}
			break;
		case '00013':
			if(0==getCategoryCd|getCategoryCd==null) {alert("유형을 선택해 주세요.");return;}
			//if(0==getInfoprovider) {alert("인물을 선택해 주세요.");return;}
			break;
		}
		if(""==getRcmderSnb) getRcmderSnb=0;

		var price = "";
		var investPrice = "";
		if(getPrice!="발행규모"&getPrice!=" 발행규모 : ") price = getPrice;
		if(getInvestPrice!="투자규모"&getInvestPrice!=" 투자규모 : ") investPrice = getInvestPrice;

		// if((obj.find('[id^=chk01_]').is(':checked')==false)&(obj.find('[id^=chk02_]').is(':checked')==false)&(obj.find('[id^=chk03_]').is(':checked')==false)&(obj.find('[id^=chk04_]').is(':checked')==false)) alert("핵심사항체크 및 내용을 입력하세요."); return;

		if(confirm("적용하시겠습니까?")){
			obj.hide();//ajax 보내면서 delay발생으로 저장을 여러번 클릭하는 문제로 div 화면상에서 hide
			var keyPfinancing = "";
			var keyPmanagement = "";
			var keyPmna = "";
			var keyPetc = "";
			var keyPshare = "";
			var keyPresource = "";
			var keyPhumanNet = "";
			var keyPaudit = "";
			var keyPinvestInte = "";

			if(obj.find('[id^=chk01_]').is(':checked') == true) keyPfinancing  = (obj.find('[id^=kyPoint01_]').val()=='NEEDS 내용'?'':obj.find('[id^=kyPoint01_]').val());
			if(obj.find('[id^=chk02_]').is(':checked') == true) keyPmanagement = (obj.find('[id^=kyPoint02_]').val()=='NEEDS 내용'?'':obj.find('[id^=kyPoint02_]').val());
			if(obj.find('[id^=chk03_]').is(':checked') == true) keyPmna        = (obj.find('[id^=kyPoint03_]').val()=='NEEDS 내용'?'':obj.find('[id^=kyPoint03_]').val());
			if(obj.find('[id^=chk04_]').is(':checked') == true) keyPetc        = (obj.find('[id^=kyPoint04_]').val()=='NEEDS 내용'?'':obj.find('[id^=kyPoint04_]').val());
			if(obj.find('[id^=chk05_]').is(':checked') == true) keyPshare      = (obj.find('[id^=kyPoint05_]').val()=='NEEDS 내용'?'':obj.find('[id^=kyPoint05_]').val());
			if(obj.find('[id^=chk06_]').is(':checked') == true) keyPresource   = (obj.find('[id^=kyPoint06_]').val()=='NEEDS 내용'?'':obj.find('[id^=kyPoint06_]').val());
			if(obj.find('[id^=chk07_]').is(':checked') == true) keyPhumanNet   = (obj.find('[id^=kyPoint07_]').val()=='NEEDS 내용'?'':obj.find('[id^=kyPoint07_]').val());
			if(obj.find('[id^=chk08_]').is(':checked') == true) keyPaudit	   = (obj.find('[id^=kyPoint08_]').val()=='NEEDS 내용'?'':obj.find('[id^=kyPoint08_]').val());
			if(obj.find('[id^=chk09_]').is(':checked') == true) keyPinvestInte = (obj.find('[id^=kyPoint09_]').val()=='NEEDS 내용'?'':obj.find('[id^=kyPoint09_]').val());

			if(getSnb==""){//새로 입력하기

				var day = obj.find('[id^=offerSnb]').attr('id').split('b')
					,dayLeng = day[1].length;
				if(dayLeng<3) day = parseInt(day[1])<10?('0'+day[1]):day[1];
				else day = day[1].substring((dayLeng-2),dayLeng);
				$.ajax({
					type:"POST",        //POST GET
					url:"../work/insertDeal.do",     //PAGEURL
					data : ({
							cpnId: getCpnId,
							//cpnNm: obj.find('[id^=AP_cpnNm]').html(),
							cstId: getCstId,
							cstNm: obj.find('[id^=AP_cstNm]').html(),
							price: price,
							investPrice: investPrice,
							entrust: getEntrust,
							cpnCst: getCpnCst,
							memo: obj.find('[id^=txtarea]').val(),
							middleOfferCd: middleoffercd,
							offerCd: getOffercd,
							categoryCd: getCategoryCd,
							choice_year: $('#choice_year').val(),
							choice_month: $('#choice_month').val(),
							day: day,
							rgId: $('#rgstId').val(),
							rgNm: $('#loginName').val(),
							financing: keyPfinancing,
							management: keyPmanagement,
							mna: keyPmna,
							etc: keyPetc,
							share: keyPshare,
							resource: keyPresource,
							humanNet: keyPhumanNet,
							audit: keyPaudit,
							investInte: keyPinvestInte,
							exploringCnt: getExploringCnt,
							coworker: getCoworker,
							infoProvider: getInfoprovider,
							rcmdSnb: getRcmderSnb,
							supporter: notNullSupporter,
							supporterRatio: getSupporterRatio,
							supporterText: getSupporterText
							}),
					timeout : 30000,       //제한시간 지정
					cache : false,        //true, false
					success: function whenSuccess(arg){  //SUCCESS FUNCTION
//						$(obj).hide();
						document.modifyRec.action = "selectWorkExporing.do";
						document.modifyRec.submit();
					},
					error: function whenError(x,e){    //ERROR FUNCTION
						ajaxErrorAlert(x,e);
					}
				});
			}else{//입력된 내용 수정하기
				$.ajax({
					type:"POST",        //POST GET
					url:"../work/modifyDeal.do",     //PAGEURL
					//  dataType: "html",       //HTML XML SCRIPT JSON
	
					data : ({sNb: getSnb,
							cpnId: getCpnId,
							cpnSnb: obj.find('[id^=AP_cpnSnb]').val(),
							//cpnNm: obj.find('[id^=AP_cpnNm]').html(),
							cstId: getCstId,
							cstNm: obj.find('[id^=AP_cstNm]').html() +" ; "+ obj.find('[id^=AP_cstNm]').attr('title'),
							price: price,
							investPrice: investPrice,
							entrust: getEntrust,
							cpnCst: getCpnCst,
							prevCpnCst: obj.find('[id^=prevCpnCst]').val(),
							memo: obj.find('[id^=txtarea]').val(),
							middleOfferCd: middleoffercd,
							offerCd: getOffercd,
							categoryCd: getCategoryCd,
							rgId: $('#rgstId').val(),
							rgNm: $('#loginName').val(),
							snbFinancing: obj.find('[id^=snbFinancing]').val(),
							snbManagement: obj.find('[id^=snbManagement]').val(),
							snbMna: obj.find('[id^=snbMna]').val(),
							snbEtc: obj.find('[id^=snbEtc]').val(),
							snbShare: obj.find('[id^=snbShare]').val(),
							snbResource: obj.find('[id^=snbResource]').val(),
							snbHumanNet: obj.find('[id^=snbHumanNet]').val(),
							snbAudit: obj.find('[id^=snbAudit]').val(),
							snbInvestInte: obj.find('[id^=snbInvestInte]').val(),
							financing: keyPfinancing,
							management: keyPmanagement,
							mna: keyPmna,
							etc: keyPetc,
							share: keyPshare,
							resource: keyPresource,
							humanNet: keyPhumanNet,
							audit: keyPaudit,
							investInte: keyPinvestInte,
							infoProvider: getInfoprovider,
							coworker: getCoworker,
							//rcmdSnb: getRcmderSnb,
							supporter: notNullSupporter,
							supporterRatio: getSupporterRatio,
							supporterText: getSupporterText
							}),
					timeout : 30000,       //제한시간 지정
					cache : false,        //true, false
					success: function whenSuccess(arg){  //SUCCESS FUNCTION
	//					alert(<c:out value='${message}'/>);
						document.modifyRec.action = "selectWorkExporing.do";
						document.modifyRec.submit();
	
					},
					error: function whenError(x,e){    //ERROR FUNCTION
						ajaxErrorAlert(x,e);
					}
				});
			}
		}
		else {
			//$(".popUpMenu").hide();
		}
	});
 });

function sortTable(flag){
	$("#sorting").val(flag);
	document.modifyRec.submit();
}

function chgExploring(th,cnt){
	var obj = $(th);
	var data = {
			sNb: $("#cpnSNb"+cnt).val()
			,exploring: obj.val()
			,rgId: $("#rgstId").val()
			,name: $("#name").val()
	};
	var url = "../work/modifyExploring.do";
	var fn = function(){
		document.modifyRec.action = "selectWorkExporing.do";
		document.modifyRec.submit();
	};
	ajaxModule(data,url,fn);
}

function chgPbr(th,cnt){
	var data = {
			sNb: $("#cpnSNb"+cnt).val()
			// ,pbr: obj.val()
			,pbr: "B"
			,rgId: $("#rgstId").val()
			,name: $("#name").val()
	};
	var url = "../work/modifyPbr.do";
	var fn = function(){
		document.modifyRec.action = "selectWorkExporing.do";
		document.modifyRec.submit();
	};
	ajaxModule(data,url,fn);
}

function saveOpinion(snb){
	var data = {
			sNb: snb
			,opinion: $("#opinionarea"+snb).val()
			,rgId: $("#rgstId").val()
			,name: $("#name").val()
	};
	var url = "../work/modifyOpinion.do";
	var fn = function(){
		document.modifyRec.action = "selectWorkExporing.do";
		document.modifyRec.submit();
	};
	ajaxModule(data,url,fn);
}

function saveRank(snb){
	var data = {
			sNb: snb
			,rank: $("#rank"+snb).val()
			,rgId: $("#rgstId").val()
			,name: $("#name").val()
	};
	var url = "../work/modifyRank.do";
	var fn = function(){
		document.modifyRec.action = "selectWorkExporing.do";
		document.modifyRec.submit();
	};
	ajaxModule(data,url,fn);
}

function chkBoxViewTextarea(th){
	var obj = $(th);
	var objId = obj.attr('id');
	var objNum = objId.split('chk')[1];
	var textArea = $("#kyPoint"+objNum);
	if(obj.attr('checked')) textArea.css('display','');
	else textArea.css('display','none');
}

function popUp(num,flag,nm,snb){
// popUp 규격
	var w = '500';
	var h = '600';
	var ah = screen.availHeight - 30;
	var aw = screen.availWidth - 10;
	var xc = (aw - w) / 2;
	var yc = (ah - h) / 2;

	var sUrl = '';

	if(flag=='p' | flag=='iP') {
		sUrl = "../work/popUpCst.do";
		sUrl+='?f='+flag+'&n='+num;
		
	}else if(flag=='rcmdCpn'){
		sUrl = "../company/main.do";
		sUrl+='?sNb='+snb;
		w='740',h='740';
		
	}else if(flag=='files') {
		var numb = (parseInt(num)<10?('0'+num):num);
		if(numb.length===3) numb = numb.substring(1,3);
		//alert("다중 업로드 기능 작업 중입니다.");
		day = $('#choice_year').val()+ $('#choice_month').val()+ numb;
		sUrl = "../work/multiUpload.do";
		sUrl+='?f='+flag+'&n='+num+'&nm='+nm+'&snb='+$("#offerSnb").val()+'&day='+day;
		if($("#reportYN_ input:checkbox").is(":checked")==true) sUrl+='&report=Y';
		else sUrl+='&report=N';
	}
	
	var option = "left=" + xc
				+",top=" + yc
				+",width=" + w
				+",height=" + h
				+",menubar=no"
				+",status=no"
				+",toolbar=no"
				+",location=no"
				+",scrollbars=yes"
				+",resizable=no"
				;
	window.open(sUrl, "_blank", option);
}

function returnPopUp(rVal){
	var num = rVal.n
		,flag = rVal.f;
	if(flag=='p'){
		if(rVal.nm != null) $("#AP_cstNm"+num).html(rVal.cpnNm+" : "+rVal.nm);
		if(rVal.snb != null) $("#AP_cstId"+num).val(rVal.snb);
		if(rVal.snb != null) $("#AP_cpnSnb"+num).val(rVal.cpnSnb);
		if($("#offerCd"+num).val() != '00006' && $("#offerCd"+num).val() != '00007'){
		}
	}else if(flag=='iP'){
		if(rVal.nm != null) $("#AP_infoProviderNm"+num).html(rVal.cpnNm+" : "+rVal.nm);
		if(rVal.snb != null) $("#AP_infoProviderId"+num).val(rVal.snb);
	}else if(flag=='files'){
		var name = null, img = null;
		var leng = rVal.status;

		if(rVal.nm=='recommend') {
			$("#dayForm").action = 'index.do';
			$("#dayForm").submit();
		}

		if(rVal.snb != null) $('#offerSnb'+num).val(rVal.snb);
		//alert(rVal.snb+"/"+rVal.name1+"/"+rVal.path)

		if(rVal.path != null & rVal.name1 != null){
			for(var k=1;k<parseInt(leng)+1;k++){//최대 업로드 파일 5개
				var nm = null,dot = null;
				if(k==1) nm = rVal.name1;
				else if(k==2) nm = rVal.name2;
				else if(k==3) nm = rVal.name3;
				else if(k==4) nm = rVal.name4;
				else if(k==5) nm = rVal.name5;

				if(nm != null) name = nm;
				dot = name.split('.');
				var extention = dot.length-1;
				if(dot[extention] == 'doc'||dot[extention] == 'docx')	img = 'doc';
				else if(dot[extention] == 'xls'||dot[extention] == 'xlsx') img = 'xls';
				else if(dot[extention] == 'ppt'||dot[extention] == 'pptx') img = 'ppt';
				else if(dot[extention] == 'pdf') img = 'pdf';
				else img = 'files';

				$('#file'+k+'_'+num).attr('title', name);//floating 되는 파일이름
				$('#file'+k+'_'+num).attr('src', '../images/file/'+img+'.png');//확장자에 따른 이미지
				if(rVal.path != null) $('#'+num).attr(rVal.path + name);//파일을 불러오기위한 경로

			}
		}
		$('#fileAdd_'+num).attr('style', 'display:none');//파일첨부 후 버튼 없애기
	}
}
	
function dataPop(snb, sep){
	var day = $("#curDay").val();	
	view(day+'offerPr'+sep);
	$("#AP_cpnId_0"+day).val($("#cpnId"+snb).html());
	if(sep == 0) {$("#AP_cpnNm_0"+day).html($("#cpnNm"+snb).html());}
}

function viewPer(th,sep){
	$("#name").val(sep);
	if(sep==0) {$("#tmpNum1").val(sep);}
	document.modifyRec.action = "selectWorkExporing.do";
	document.modifyRec.submit();
	/*
	$(".per").css('display','');
	if(''!=sep)$(".per"+sep).css('display','none');
	
	var cls = $(".subTabon").attr("class");
	$(".subTabon").attr("class",cls.replace("subTabon","subTab"));
	cls = $(th).attr("class");
	$(th).attr("class",cls.replace("subTab","subTabon"));
	*/
}

function slctCpn(snb,stock){
	$('body').append('<form id="companyName" name="companyName" action="../company/main.do" method="post"><input type="hidden" id="c_Name" name="sNb"></form>');
	$('#c_Name').val(snb);//snb, cpnId 두개 모두 가능
	var target = "mainFrame";
	if(parent.insertStockFirmIbYN()=="Y") target = "stockCstFrame";
	var frm = document.getElementById('companyName');//sender form id
	frm.target = target;//target frame name
	frm.submit();
}
function refresh(th){
	var obj = $(th);
	$("#expCnt").val(obj.val());
	$("#modifyRec").submit();
}
</script>
<style>
tbody tr:hover{background-color: moccasin !important;}
.bgClr00001{background-color:#F6CECE}
.bgClr00003{background-color:orange}
.bgClr00004{background-color:#E7E7E7}
.bgClr10000{background-color:GRAY}
.bgClrB{background-color:#A9F5BC}
</style>
</head>
<body>
<section>
<div id="wrap">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
<c:set var="now" value="<%= new java.util.Date() %>"/>
<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
<fmt:formatDate var="cur_mon" value='${now}' pattern='MM'/>
<fmt:formatDate var="cur_day" value='${now}' pattern='dd'/>
<input type="hidden" id="choice_year" value="<c:out value='${cur_year}'/>">
<input type="hidden" id="choice_month" value="<c:out value='${cur_mon}'/>">
<input type="hidden" id="curDay" value="<c:out value='${cur_day}'/>">

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">

<form name="modifyRec" id="modifyRec" method="post" action="<c:url value='/work/selectWorkExporing.do' />">
	<input type="hidden" name="sorting" id="sorting">
	<input type="hidden" name="tmpNum1" id="tmpNum1">
	<input type="hidden" name="exploringCnt" id="expCnt" value="${exploringCnt}">
	<input type="hidden" name="name" id="name" value="<c:out value='${name}'/>">
</form>
<div class="fixed-top" style="z-index:10;">
	<header>
		<c:set var="now" value="<%= new java.util.Date() %>"/>
		<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
		<h2 class="headerTitle">
		<div style="float:left">탐방 발굴</div>
		<div style="float:left">&nbsp;&nbsp;
			<select id="dataPopUp" onchange="refresh(this)" style="font-size:14px;"><c:forEach var="expCnt" items="${exploringCntList}" varStatus="status">
				<option value="${expCnt.exploringCnt}" <c:if test="${expCnt.exploringCnt == exploringCnt}">selected</c:if>>${expCnt.exploringCnt}차</option>
			</c:forEach></select>
			<span style="color:blue; font-size:17px;">${comMent}</span>
		</div>
		</h2>
	</header>
	<div class="clear" style="height:4px;"></div>
	<div class="clear" style="width:10px;float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
	<div class="1st subTab<c:if test="${empty name}">on</c:if>" onclick="viewPer(this)">전체</div>
	<div class="1st subTab<c:if test="${name == '김지영'}">on</c:if>" onclick="viewPer(this,'김지영')">김지영</div>
	<div class="1st subTab<c:if test="${name == '오일평'}">on</c:if>" onclick="viewPer(this,'오일평')">오일평</div>
	<div class="1st subTab<c:if test="${name == '채원흠'}">on</c:if>" onclick="viewPer(this,'채원흠')">채원흠</div>
	<div class="1st subTab<c:if test="${name == '0'}">on</c:if> sng" onclick="viewPer(this,0)">모두보기</div>
	<div class="tabUnderBar" style="float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
	
	<!-- <div class="2nd subTabon clear sng" onclick="viewPer(this)">1차</div> -->
	
	<table class="t_skinR00" style="padding-top:5px;">
		<colgroup>
			<col width="75">
			<col width="47">
			<col width="122">
			<col width="122">
			<col width="47">
			<col width="80">
			<col width="90">
			<col width="90">
			<col width="200">
			<col width="75">
			<col width="90">
			<col width="70">
		</colgroup>
		<thead>
			<tr>
				<th onclick="sortTable();" class="hand bgYlw">회사코드<br/>▼</th>
				<th onclick="sortTable(1);" class="hand bgYlw pd0"><nobr>담당자</nobr><br/>▼</th>
				<th onclick="sortTable(2);" class="hand bgYlw pd0">회사명<br/>▼</th>
				<th onclick="sortTable(4);" class="hand bgYlw pd0">업종<br/>▼</th>
				<th onclick="sortTable(3);" class="hand bgYlw pd0">지분율<br/>▼</th>
				<th onclick="sortTable(5);" class="hand bgYlw pd0">차입금<br/>▼</th>
				<th onclick="sortTable(6);" class="hand bgYlw pd0">부채비율<br/>▼</th>
				<th class="bgYlw pd0">검토</th>
				<th class="bgYlw pd0">의견</th>
				<th class="hand bgYlw pd0">우선순위</th>
				<th class="bgYlw pd0">결과</th>
				<th class="bgYlw pd0">확인</th>
			</tr>
			<tr style="height:1px;"></tr>
		</thead>
	</table>
</div>
<div style="padding-top:111px;">
<table class="t_skinR00">
	<colgroup>
		<col width="75">
		<col width="47">
		<col width="122">
		<col width="122">
		<col width="47">
		<col width="80">
		<col width="90">
		<col width="90">
		<col width="200">
		<col width="75">
		<col width="90">
		<col width="70">
	</colgroup>
	<tbody>
		<c:forEach var="exp" items="${exploringList}" varStatus="status"><c:if test="${!(exp.pbr == 'B' && userLoginInfo.permission < '00019')}">
			<tr class="bgClr${exp.exploring} bgClr${exp.pbr} per <c:if test="${exp.per =='김지영'}">per1</c:if> <c:if test="${exp.per =='채원흠'}">per2</c:if> <c:if test="${exp.per =='오일평'}">pe3</c:if>" >
				<input type="hidden" id="cpnSNb${status.count}" value="${exp.cpnSnb}">
				<td class="cent" id="cpnId${exp.sNb}">${exp.cpnId }</td>
				<td class="cent pd0"><nobr>${exp.per}</nobr></td>
				<td class="cent pd0 hov hand" id="cpnNm${exp.sNb}" onclick="popUp('','rcmdCpn','','${exp.cpnSnb}');"><b>${exp.cpnNm}</b></td>
				<td class="cent pd0">${exp.categoryBusiness}</td>
				<td class="cent pd0">${exp.share}</td>
				<td class="cent pd0"><nobr>${exp.fluctuation}</nobr></td>
				<td class="cent pd0">${exp.debtRatio}</th>
				<td class="cent pd0">
					<select onchange="chgExploring(this,${status.count})">
						<option value="00010" <c:if test="${exp.exploring == '00010'}">selected</c:if>>-선택-</option>
						<option value="00001" <c:if test="${exp.exploring == '00001'}">selected</c:if>>적격</option>
						<option value="00002" <c:if test="${exp.exploring == '00002'}">selected</c:if>>관심종목</option>
						<option value="00003" <c:if test="${exp.exploring == '00003'}">selected</c:if>>탐방필요</option>
						<option value="00004" <c:if test="${exp.exploring == '00004'}">selected</c:if>>보류</option>
						<option value="10000" <c:if test="${exp.exploring == '10000'}">selected</c:if>>대상아님</option>
					</select>
				</td>
				<td style="padding:2px;">
					<a id="opinion_${exp.sNb}" onclick="view('opinionPr${exp.sNb}',this)"><font color="navy"><c:choose><c:when test="${empty exp.opinion}"><small><font style="color:gray">의견...</font></small></c:when><c:otherwise>${fn:substring(exp.opinion,0,40)}<c:if test="${fn:length(exp.opinion) > 40}">...</c:if></c:otherwise></c:choose>
					</font></a>
				</td>
				<td class="cent pd0">
					<select id="rank${exp.sNb}" onchange="saveRank(${exp.sNb})" <c:if test="${userLoginInfo.permission < '00020'}">disabled="disabled"</c:if>>
						<option value="4">미정</option>
						<option value="1" <c:if test="${exp.rank == '1'}">selected</c:if>>1</option>
						<option value="2" <c:if test="${exp.rank == '2'}">selected</c:if>>2</option>
						<option value="3" <c:if test="${exp.rank == '3'}">selected</c:if>>3</option>
					</select>
				</td>
				<td class="cent pd0">
					<span class="btn s <c:if test="${exp.tmpNum2=='Y'}">navy</c:if><c:if test="${exp.tmpNum2!='Y'}">orange</c:if>"><a onclick="dataPop('${exp.sNb}','0')">추천</a></span>
					<span class="btn s <c:if test="${exp.tmpNum1=='Y'}">navy</c:if><c:if test="${exp.tmpNum1!='Y'}">orange</c:if>"><a onclick="dataPop('${exp.sNb}','1')">탐방</a></span>
				</td>
				<td class="cent pd0"><c:if test="${exp.pbr != 'B'}">
					<span class="btn s blue"<c:if test="${userLoginInfo.id == 'lmc'}"> onclick="chgPbr(this,${status.count})"</c:if>><a>확인</a></span></c:if>
					<%-- <select onchange="chgPbr(this,${status.count})" <c:if test="${userLoginInfo.permission < '00020'}">disabled="disabled"</c:if>>
						<option value="A" <c:if test="${exp.pbr == 'A'}">selected</c:if>>탐방대상</option>
						<option value="B" <c:if test="${exp.pbr == 'B'}">selected</c:if>>완료대기</option>
						<option value="0" <c:if test="${exp.pbr == '0'}">selected</c:if>>완료</option>
					</select> --%>
				</td>
				<%-- <td style="width:70px;padding:2px;">
					<a class="result_m" id="result_${exp.sNb}"><font color="red"><c:choose><c:when test="${empty exp.result}"><small><font style="color:gray">성과...</font></small></c:when><c:otherwise>${fn:substring(exp.result,0,10)}<c:if test="${fn:length(exp.result) > 10}">...</c:if></c:otherwise></c:choose>
					</font></a>
				</td> --%>
			</tr></c:if>
		</c:forEach>
	</tbody>
</table>
</div>
</section>

<!-- floating div menu -->
	
<!-- 의견 -->
<c:forEach var="exp" items="${exploringList}" varStatus="status">
<div class="popUpMenu title_area" id="opinionPr${exp.sNb}" name="textR">
	<input type="hidden" id="dealOpinionSNb${exp.sNb}" value="${exp.sNb }">
	<input type="hidden" id="opExploringCnt${exp.sNb}" value="${exploringCnt}">
	<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
	<ul>
		<li>최종수정자 : ${exp.rgNm} / ${exp.upDt}</li>
		<c:choose><c:when test="${empty exp.opinion}"><li class="c_note"><textarea id="opinionarea${exp.cpnSnb}" placeholder="투자의견을 입력하세요."></textarea></li></c:when>
		<c:otherwise><li class="c_note"><textarea id="opinionarea${exp.cpnSnb}">${exp.opinion}</textarea></li></c:otherwise></c:choose>
		<p class="bsnsR_btn">
			<span class="btn s green" onclick="saveOpinion(${exp.cpnSnb})"><a>저장</a></span>&nbsp;&nbsp;&nbsp;
			<!-- <span class="dealResult_btnDel">완전삭제</span> -->
		</p>
	</ul>
</div>
</c:forEach>
<!-- 의견 -->
<!-- data -->
<div class="popUpMenu title_area" id="${cur_day}offerPr0" name="textR" style="z-index:11;">
	<input type="hidden" id="offerSnb0${cur_day}">
	<p class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</p>
	<ul>
		<li>
		<input type="hidden" id='middleOfferCd_${cur_day}' value="00000"/>
		<input type="hidden" id='offerCd_${cur_day}' value="00013"/>
			<select disabled><!-- 딜 -->
					<option>추천종목</option>
			</select>
					<span id='CateCd_${cur_day}'><!-- &nbsp;유형: -->
					<select id='categoryCd_${cur_day}'>
						<option value="" selected>-유형선택-</option>
						<c:forEach var="cmmCd" items="${cmmCdCategoryList}">
							<option value="${cmmCd.dTailCd}" <c:if test="${workVO.categoryCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
						</c:forEach>
					</select></span>

					<input type="hidden" id="AP_infoProviderId0${cur_day}"/>
					<input type="hidden" id="AP_coworkerId0${cur_day}"/>
					<input type="hidden" id="AP_supporterId0${cur_day}"/>
					<input type="hidden" id="AP_supporterRatio0${cur_day}"/>
					<input type="hidden" id="AP_supporterText0${cur_day}"/>
					<input type="hidden" id="AP_exploringCnt0${cur_day}" value="${exploringCnt}"/>
					
					<span id="SlctPerson_${cur_day}">
						<b><span id="infoProviderTitle1_${cur_day}">정보제공자 : </span>
						<%-- <span id="infoProviderTitle2_${cur_day}" style="display:none">소개자 : </span> --%>
						</b><span id="selectInfoProvider_0${cur_day}" class="btn s navy" style="vertical-align:top;"><a onclick="popUp('0${cur_day}','iP')" id="AP_infoProviderNm0${cur_day}" class="c_title" title="이름">인물선택</a></span>
					&nbsp;</span>

					<input type="hidden" id="AP_cpnId_0${cur_day}" value="${workVO.cpnId }"/>
					<input type="hidden" id="AP_cstId_0${cur_day}" value="0"/>
					<input type="hidden" id="AP_cpnSnb_0${cur_day}" value="0"/>
					<span id="slctCpn_${cur_day}"><b>
						<span id="cpnTitle1_${cur_day}">회사</span>
						<span id="textTmp_${cur_day}"><small>(물건)</small></span></b> : <span class="btn s orange" style="vertical-align:top;"><a id="AP_cpnNm_0${cur_day}" class="c_title" title="">회사</a></span>
					</span>
					
					<span id="split1_${cur_day}"></span>
						
				&nbsp;<span id="fileAdd_${cur_day}" style="display:inline-block;text-align:right;vertical-align:top;">
						<span id="reportYN_0${cur_day}" style="display:none;"><input type="checkbox"/><b>리포트</b></span>
						<span class="btn s" style="vertical-align:top;"><a onclick="popUp('0${cur_day}','files')">파일첨부</a></span>
						&nbsp;<img id="file1_${cur_day}" src="../images/dot.png" title="">
						&nbsp;<img id="file2_${cur_day}" src="../images/dot.png" title="">
						&nbsp;<img id="file3_${cur_day}" src="../images/dot.png" title="">
						&nbsp;<img id="file4_${cur_day}" src="../images/dot.png" title="">
						&nbsp;<img id="file5_${cur_day}" src="../images/dot.png" title="">
					</span>
				</li>
				<li><input type="text" class="m_note" id="AP_price_0${cur_day}" placeholder="발행규모" style="width:500px;margin-top:2px;"/></li>
				
				<li class="c_note" style="margin-top:2px;"><textarea id="txtarea${cur_day}">${workVO.memo}</textarea></li>

		<li class="bsnsR_btn">
			<span class="offerR_btnOk btn s green"><a>저장</a></span>&nbsp;&nbsp;&nbsp;
			<!-- <span class="offerR_btnDel">완전삭제</span> -->
			<input type="text" id="foCus_0_0" style="height:1px;width:1px;border:0px none;padding:0;vertical-align:bottom;">
		</li>
	</ul>
</div>
<div class="popUpMenu title_area" id="${cur_day}offerPr1" name="textR" style="z-index:11;">
	<input type="hidden" id="offerSnb1${cur_day}">
	<p class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</p>
	<ul>
		<li>
		<input type="hidden" id='middleOfferCd_${cur_day}' value="00000"/>
		<input type="hidden" id='offerCd_${cur_day}' value="00003"/>
			<select disabled><!-- 딜 -->
					<option>탐방</option>
			</select>

			<input type="hidden" id="AP_coworkerId1${cur_day}"/>
			<input type="hidden" id="AP_supporterId1${cur_day}"/>
			<input type="hidden" id="AP_supporterRatio1${cur_day}"/>
			<input type="hidden" id="AP_supporterText1${cur_day}"/>
			<input type="hidden" id="AP_cpnId_1${cur_day}" value="${workVO.cpnId }"/>
			<input type="hidden" id="AP_cstId_1${cur_day}" value="0"/>
			<input type="hidden" id="AP_cpnSnb_1${cur_day}" value="0"/>
			<input type="hidden" id="AP_exploringCnt0${cur_day}" value="${exploringCnt}"/>
				
			<span id="slctPrsn_${cur_day}"><nobr>
				<span id="cstTitle3_${cur_day}"><b>회사관계자</b></span> : <span class="btn s blue" style="vertical-align:top;">
					<a onclick="popUp('_1${cur_day}','p')" id="AP_cstNm_1${cur_day}" class="c_title" title="이름">인물선택</a></span></nobr>
			</span>
			
		&nbsp;<span id="fileAdd_${cur_day}" style="display:inline-block;text-align:right;vertical-align:top;">
				<span id="reportYN_1${cur_day}"><input type="checkbox"/><b>리포트</b></span>
				<span class="btn s" style="vertical-align:top;"><a onclick="popUp('1${cur_day}','files')">파일첨부</a></span>
				&nbsp;<img id="file1_${cur_day}" src="../images/dot.png" title="">
				&nbsp;<img id="file2_${cur_day}" src="../images/dot.png" title="">
				&nbsp;<img id="file3_${cur_day}" src="../images/dot.png" title="">
				&nbsp;<img id="file4_${cur_day}" src="../images/dot.png" title="">
				&nbsp;<img id="file5_${cur_day}" src="../images/dot.png" title="">
			</span>
		</li>
		
		<li id="KP_title_${cur_day}" style="padding-top:5px;padding-bottom:2px;"><b>핵심체크사항</b><%-- &nbsp;&nbsp;&nbsp;&nbsp;<span class="btn s black" style="vertical-align:bottom;"><a class="viewKeyP" id="viewKP_${cur_day}">보이기</a></span> --%></li>
		<li id="KP_slct_${cur_day}" style="width: 502px;border:2px dotted navy;">
			<ul style="padding: 1px;font-family: 맑은 고딕, Trebuchet MS, Verdana, Geneva, sans-serif;">
				<li><span style="display:inline-block;width:80px;vertical-align:top;"><input type="checkbox" id="chk01_1${cur_day}" value="Y" class="input_chk" onclick="chkBoxViewTextarea(this)"/><label for="chk01_1${cur_day}">자금조달 </label></span><textarea id="kyPoint01_1${cur_day}" class="d_note" style="display:none" placeholder="NEEDS 내용"></textarea>
				    <span style="display:inline-block;width:80px;vertical-align:top;"><input type="checkbox" id="chk02_1${cur_day}" value="Y" class="input_chk" onclick="chkBoxViewTextarea(this)" /><label for="chk02_1${cur_day}">자산운용 </label></span><textarea id="kyPoint02_1${cur_day}" class="d_note" style="display:none" placeholder="NEEDS 내용"></textarea></li>
				<li><span style="display:inline-block;width:80px;vertical-align:top;"><input type="checkbox" id="chk03_1${cur_day}" value="Y" class="input_chk" onclick="chkBoxViewTextarea(this)" /><label for="chk03_1${cur_day}">M&A    </label></span><textarea id="kyPoint03_1${cur_day}" class="d_note" style="display:none" placeholder="NEEDS 내용"></textarea>
				    <span style="display:inline-block;width:80px;vertical-align:top;" title="회사의 과거실적"><input type="checkbox" id="chk04_1${cur_day}" value="Y" class="input_chk" onclick="chkBoxViewTextarea(this)" /><label for="chk04_1${cur_day}">실적     </label></span><textarea id="kyPoint04_1${cur_day}" class="d_note" style="display:none" title="회사의 과거실적" placeholder="NEEDS 내용"></textarea></li>
				<li><span style="display:inline-block;width:80px;vertical-align:top;"><input type="checkbox" id="chk05_1${cur_day}" value="Y" class="input_chk" onclick="chkBoxViewTextarea(this)" /><label for="chk05_1${cur_day}">공유     </label></span><textarea id="kyPoint05_1${cur_day}" class="d_note" style="display:none" placeholder="NEEDS 내용"></textarea>
				    </li>
			</ul>
		</li>
		
		<li class="c_note" style="margin-top:2px;"><textarea id="txtarea${cur_day}">${workVO.memo}</textarea></li>

		<li class="bsnsR_btn">
			<span class="offerR_btnOk btn s green"><a>저장</a></span>&nbsp;&nbsp;&nbsp;
			<!-- <span class="offerR_btnDel">완전삭제</span> -->
			<input type="text" id="foCus_1_1" style="height:1px;width:1px;border:0px none;padding:0;vertical-align:bottom;">
		</li>
	</ul>
</div>
<!-- data -->
<!-- floating div menu -->
</div>
</body>
</html>