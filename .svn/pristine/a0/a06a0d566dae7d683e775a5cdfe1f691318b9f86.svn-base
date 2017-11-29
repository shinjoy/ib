<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<%-- ======================= 세션 정보에 따른 변수 선언 (간단한 이름으로 재정의 사용) :S  ======================== --%>
<c:set var="mezzL" value="${userLoginInfo.mezzL}"/>		<%-- 메자닌 상장 권한 --%>
<c:set var="mezzN" value="${userLoginInfo.mezzN}"/>		<%-- 메자닌 비상장 권한 --%>

<c:if test="${userLoginInfo.permission > '00020'  or  userLoginInfo.id eq 'gjh'}">	<%-- 개발자 or 대표님 은 무조건 'Y' --%>
<c:set var="mezzL" value="Y"/>
<c:set var="mezzN" value="Y"/>
</c:if>
<%-- ======================= 세션 정보에 따른 변수 선언 (간단한 이름으로 재정의 사용) :E  ======================== --%>


<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회사 상세</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js?ver=1.1'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/popUp.js'/>" ></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<script>
$(document).ready(function(){
/* 	var arg = window.dialogArguments;
	if(arg!=null){
		if(${empty companyList}) {
			$("#c_Name").val(arg.snb);
			$("#popUp").val("Y");
			$("#companyName").submit();
		}
	} */
	$('li').css('font-size','12px');
	if(${popUp == "Y"}){
		$("#addBtn").css("display","none");
		$("#modiBtn").css("display","none");
		//$("tr").attr("onclick","");
	}
	if($(window).width()<1010){
		$("#wrap").css("min-width","98%");
		try{
			parent.widthAuto('990px');
		}catch(e){
			//문제가 있으면 실행x
		}
		
	}
	
	//---------- draggable :S ----------
	$(".closePopUpMenu").mousedown(function(){
		$(".popUpMenu").draggable({disabled:false, opacity:'0.8'});		
	});
	$(".closePopUpMenu").mouseup(function(){
		$(".popUpMenu").draggable({disabled:true});
		$(".popUpMenu").css('height', 'auto');
	});	
	//---------- draggable :E ----------
	
 });

</script>
<base target="_self">
</head>
<body>

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">


<form id="companyName" name="companyName" action="<c:url value='/company/main.do' />" method="post">
	<input type="hidden" id="c_Name" name="sNb">
	<input type="hidden" id="i_Name" name="cpnId">
	<input type="hidden" id="popUp" name="popUp">
</form>
<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
</form>
<form id="downName" name="downName" action="<c:url value='/work/downloadProcess.do' />" method="post">
	<input type="hidden" name="makeName" id="makeName"/>
	<input type="hidden" name="recordCountPerPage" value="0"/>
</form>

<script>
function slctCpn(snb){
	$('#c_Name').val(snb);
	var frm = document.getElementById('companyName');//sender form id
	frm.target = "mainFrame";//target frame name
	frm.submit();
}
var arg = window.dialogArguments;
if(arg!=null){
	if(${empty companyList}) {
		$("#c_Name").val(arg.snb);
		$("#popUp").val("Y");
		$("#companyName").submit();
	}
};

function getPosition(e) {
    e = e || window.event;
    var cursor = {x:0, y:0};
    if (e.pageX || e.pageY){
        cursor.x = e.pageX;
        cursor.y = e.pageY;
    } else {
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
	$("#"+divId).css({"top":top,"left":0});		//(left+calWidth<browserWidth?left:browserWidth-(calWidth+8))});
	$("#"+divId).css('display','block');
	$("#"+divId).show();
}

var ajaxOffer = function(e, snb, cpnid, sort){
	var DATA = {
				 sNb: snb
				,cpnId: cpnid
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
function sAvEOPinion(th){
	var obj = $(th).parent()
		,data = {sNb:$("#cst_snb").val(),opinion:obj.find('textarea').val(),rgId: $("#rgstId").val()}
		,fn = function(){
			//alert("저장되었습니다. 화면을 새로고침하세요.");$('.popUpMenu').hide();
			re_fresh();
		};
	ajaxModule(data,"../work/modifyOpinion.do",fn);
}

function chgExploring(th){
	var data = {
			sNb: $("#cst_snb").val()
			,exploring: $(th).val()
			,rgId: $("#rgstId").val()
			,name: $("#name").val()
		}
		,fn = function(){
			//alert("저장되었습니다. 화면을 새로고침하세요.");
			re_fresh();
		};
	ajaxModule(data,"../work/modifyExploring.do",fn);
}
function re_fresh(){
	$("#c_Name").val($('#cst_snb').val());
	$("#companyName").submit();
}
function saveModiOfIf(cnt){
	$(".popUpMenu").hide();
	var DATA = {
		offerSnb: $("#infoSnb"+cnt).val(),
		comment: $("#infoArea"+cnt).val(),
		};
	var url = "../company/modifyOfferInfo.do";
	var fn = function(){
		if($(".popUpBtn").css("display")=="none") return;
		re_fresh();
	};
	ajaxModule(DATA,url,fn);
}
$(document).on("click",".modiInfo", function(){
	var obj = $(this)
	, t_num = obj.attr('id').split('_')
	, divId = t_num[0]+"Pr"+ t_num[1];
	$(".popUpMenu").hide();
	divShow($(this),divId);
});

function chkBoxViewTextarea(th){
	var obj = $(th)
	, chNum = obj.attr('id').split('_')[1];
	if(obj.attr('checked') =='checked')
		$('#infoArea'+chNum).parent().parent().css('display','');
	else
		$('#infoArea'+chNum).parent().parent().css('display','none');
}

function saveKeyPoint(){
	var arr00='' ,arr01='';
	$('.input_chk:checked').each(function(){
		var num = $(this).attr('id').split('_')[1]
		  , text = $('#infoArea'+num).val();
		if(num == '00'){
			arr00 = text;
		}else if(num =='01'){
			arr01 = text;
		}
	});
	var today = new Date()
	   ,year = today.getFullYear()
	   ,mon  = today.getMonth()+1
	   ,day  = today.getDate();
	if(day<10) day= '0'+day;
	var Data = {
			cpnId:$('#cpn_ID').val()
			,memo:'회사 NEEDS에서 입력'
			,middleOfferCd:'00000'
			,offerCd:'00004'
			,rcmdSnb:'0'
			,supporter:'0'
			,sellBuy:'0'
			,choice_year:year
			,choice_month: ((mon<10)?('0'+mon):mon)
			,day:day
			,management:arr00
			,mna:arr01

	},url = "<c:url value='/work/insertDeal.do' />"
	,fn = function(){
		re_fresh();
	};
	ajaxModule(Data,url,fn);
}
function saveIncharge(cpnNm,staffNm,snb,target){
	if(confirm(" '"+cpnNm+"' 의 담당자로\n '"+staffNm+"' 을/를 지정합니다.")){
		var url="<c:url value='/company/saveIncharge.do' />"
		,data={sNb:snb,categoryCd:'1',tmpNum1:target}
		,fn=function(){
			re_fresh();
		};
		ajaxModule(data,url,fn);
	}
}

function investment(e,snb){
	var DATA = {
				 sNb: snb
		}
		,url = "<c:url value='/company/selectInvestment.do'/>"
		,fn = function(arg){
			$("#offerDiv").html(arg);
			cpnDivShow(e,$("#tbl00").attr('id'));
		};
		ajaxModule(DATA,url,fn);
}

//공시 메자닌 삭제 20170915 ksm
function deleteNoticeMezzanine(snb){
	if(confirm('삭제하시겠습니까?')){
		var url = "<c:url value='/work/deletePublicNoticeMezzanine.do'/>"
		var data = {sNb:snb}
		var fn = function(arg){
			//toast.push('삭제되었습니다.');
			alert('삭제되었습니다.');
			re_fresh();
		};
		
		//로딩 이미지 보여주기 위한 리스너 함수 :S -----------
	   	var beforeFn = function(){
	   		// 로딩 이미지 보여주기 처리
	   		$('.wrap-loading', parent.mainFrame.document).removeClass('display-none');
	   	};
	   	var completeFn = function(){
	   		// 로딩 이미지 감추기 처리
	        //$('.wrap-loading', parent.mainFrame.document).addClass('display-none');  >> 계속 유지하다가 submit 마무리 되면 어차피 화면 재로딩 되며 사라진다.
	   	};
	   	//로딩 이미지 보여주기 위한 리스너 함수 :E -----------
	   	
	   	//commonAjax("POST", url, data, fn, true, beforeFn, completeFn);
	   	commonAjax("POST", url, data, fn);
	}else{
		return;
	}
}

//공시문서 팝업
function officialNotice(e, cpnId, knd){
	var options = "width=800, height=600, scrollbars=auto";
	options += ",left=" + (e.screenX - 200);
	options += ",top=" + (e.screenY + 20);
	
	window.open("../dart/officialNotice.do?cpnId="+cpnId+"&knd="+knd, "new_win", options);
}


//회사명 수정 팝업
function modifyCpnNmPop(e, cpnSnb){
	var options = "width=450, height=150, scrollbars=auto";
	options += ",left=" + (e.screenX - 200);
	options += ",top=" + (e.screenY + 20);
	
	window.open("../work/popModifyCpn.do?cpnSnb="+cpnSnb, "new_win", options);
}

//공시 메자닌 수정 팝업 20170915 ksm
function modifyNoticeMezzaninePopup(e, snb){
	var options = "width=1330, height=300, scrollbars=yes, resizable=yes";
	options += ",left=" + (e.screenX - 200);
	options += ",top=" + (e.screenY + 20);
	
	window.open("../company/modifyMezzaninePopup.do?snb="+snb, "new_win", options);
}

</script>
<style>.cpnInfo>tr>th{font-size:12px;}.cpnInfo>tr>td{padding:5px 10px;min-width:160px;}.cpnInfo>tr>td:last-child >span{display:inline-block;text-align:right;width:80px;}
tr.hov:hover,td.hov:hover {background-color: moccasin !important;}
.t_skinR00>tbody>tr:hover{background-color:white !important;}
.t_skinR00>thead>tr>td{border-top: 1px solid #E6E6E6;}
/* .t_skinR00>thead>tr>td.tbColorSub{border-bottom: 1px solid #E6E6E6 !important;} */
tbody>tr>td{ vertical-align: top; }

.official_notice{
	border: 1px solid #DFDFDF;
	background-color: white;
    height: 100%;
	margin: 1px;
	
    padding: 5px 5px;
    padding-top: 2px;
	border-radius: 5px;
	
	margin-top: 5px;
	font-size:10pt;
	text-align:left;
}
.btn_official_notice{
	font-size:13px!important;
}

</style>

<!-- 정보정리 -->
<div id="offerDiv"><div id="offerPr" style="display: none;"></div></div>

<!-- 정보정리 -->
<!-- 노트 -->
<div z-index="100">
	<c:forEach var="note" items="${noteList}" varStatus="status">
	<div class="popUpMenu title_area" id="00notePr${status.count}">
		<p class="closePopUpMenu">ⅹ닫기</p>
			<ul>
				<li class="c_title">${note.title}&nbsp;</li>
				<li class="c_note">&nbsp;${fn:replace(note.note, lf,"<br/>")}</li>
			</ul>
	</div>
	</c:forEach>
</div>
<!-- 노트 -->

 
	<header>
	</header>
	<section>
		<article>
			<c:if test="${empty companyList}">
			<!-- <h2>&nbsp;이름을 선택하세요.</h2> -->
			<h3>&nbsp;&nbsp;신규 추가된 법인 네트워크 정보 20</h3>
			<div class=" title_area offerL" id="offerPr" style="display:block">
			<c:forEach var="net" items="${cpnNetList}">
				<ul class="bgYlw" style="border: solid gray 1px;padding: 4px;margin:3px;">
					<li style="width:100px;float:left;padding-left:7px;"><small>&nbsp;</small></li>
					<li style="width:30px;float:left">&nbsp;</li>
					<li style="width:80px;float:left;"><small>${net.cstCpnNm}</small></li>
					<li style="float:right;padding-right:7px;">${net.rgDt }</li>
					<div class="clear"></div>
					<li style="width:100px;font-weight:bold;float:left;padding-left:7px;" class="hand" onclick="slctCpn('${net.snb1st}');">${net.cpnNm}</li>
					<li style="width:30px;float:left">→</li>
					<li style="width:80px;font-weight:bold;float:left;" class="hand" onclick="slctCst('${net.snb2nd}');">${net.cstNm}</li>
					<li style="float:right;padding-right:7px;"><small>${net.rgNm}</small></li>
					<div class="clear"></div>
					<li style="background-color:white;float:none;margin:5px;padding:2px;border: solid lightgray 1px;">&nbsp;${net.note}</li>
				</ul>
			</c:forEach>
			</div>
			</c:if>
			
		<c:forEach var="cpn" items="${companyList}">
	<!-- 탐방대상 의견 -->
	<div class="popUpMenu title_area" id="0opinionPr0" z-index="100">
		<p class="closePopUpMenu">ⅹ닫기</p>
			<ul>
				<li>최종수정자 : ${cpn.rgNm} / ${cpn.upDt}</li>
				<li><textarea>${cpn.opinion}</textarea></li>
				<c:if test="${empty cpn.opinion}"><li class="cent" onclick="javascript:sAvEOPinion(this);"><span class="btn s green"><a>저장</a></span></li></c:if>
				<c:if test="${not empty cpn.opinion}"><li class="cent" onclick="javascript:sAvEOPinion(this);"><span class="btn s orange"><a>수정</a></span></li></c:if>
			</ul>
	</div>
	<!-- 탐방대상 의견 -->
			<input type="hidden" id="cst_snb" value="${cpn.sNb}">
			<input type="hidden" id="cpn_ID" value="${cpn.cpnId}">
			
			<table class="t_skinR00">
				<colgroup>
					<col width="122">
					<col width="">
					<col width="122">
					<col width="">
					<col width="122">
					<col width="">
				</colgroup>
				<thead class="cpnInfo">
					<tr>
						<th class="tbColor">회사명</th>
						<td colspan="2"><h3>&nbsp;&nbsp;${cpn.cpnNm} (${cpn.aCpnId})
							<c:if test="${not empty cpn.usrNm}"><span style="float:right;">담당자 : ${cpn.usrNm}</span></c:if></h3>
						</td>
						<td>
							<c:if test="${fn:substring(cpn.aCpnId, 0, 1) ne 'A'}">		<!-- 비상장 회사만 수정 -->
							<span class="btn s red popUpBtn">
								<a href="#" onclick="modifyCpnNmPop(event, '${cpn.sNb}');">회사명수정</a>
							</span>
							</c:if>
						</td>
						<td colspan="2">
							<c:if test="${fn:substring(cpn.aCpnId, 0, 1) eq 'A'}">
							<span class="official_notice" style="text-align:center;">
								<a onclick="officialNotice(event,'${cpn.aCpnId}','ALL');" class="btn_official_notice" ><i class="axi axi-ion-android-search"></i>전자공시</a>
							</span>
							<span class="official_notice" style="text-align:center;">
								<a onclick="officialNotice(event,'${cpn.aCpnId}','');" class="btn_official_notice" ><i class="axi axi-ion-android-search"></i>보고서</a>
							</span>
							</c:if>
							<span class="btn s" style="display:none;" onclick="javascript:saveIncharge('${cpn.cpnNm}','${userLoginInfo.name}','${cpn.snb1st}','${cpn.sNb}');"><a>담당자로 지정</a></span>
						</td>
					</tr>
					<tr>
						<th class="tbColor">업종</th>
						<td>${cpn.categoryBusiness}&nbsp;</td>
						<th class="tbColor">대표이사</th>
						<td>${cpn.ceo}&nbsp;</td>
						<th class="tbColor">액면가</th>
						<td><c:if test="${not empty cpn.faceValue}"><span>${cpn.faceValue} 원</span></c:if>&nbsp;</td>
					</tr>
					<tr>
						<th rowspan="2" class="tbColor">주소</th>
						<td rowspan="2">${cpn.addr}&nbsp;</td>
						<th class="tbColor">최대주주</th>
						<td>${cpn.maxHolder}&nbsp;</td>
						<th class="tbColor">주가</th>
						<td><c:if test="${not empty cpn.unitPrice}"><span>${cpn.unitPrice} 원</span></c:if>&nbsp;</td>
					</tr>
					<tr>
						<th class="tbColor">지분율</th>
						<td><c:if test="${not empty cpn.maxStockRate}">${cpn.maxStockRate} %</c:if>&nbsp;</td>
						<th class="tbColor">시가총액</th>
						<td><c:if test="${not empty cpn.stockValue}"><span>${cpn.stockValue} 억원</span></c:if>&nbsp;</td>
					</tr>
					<tr>
						<th class="tbColor">Tel(담당자)</th>
						<td>${cpn.tel}<c:if test="${not empty cpn.irTel}">, IR: ${cpn.irTel}</c:if>&nbsp;</td>
						<th class="tbColor">설립일</th>
						<td>${cpn.foundDate}&nbsp;</td>
						<th class="tbColor">자기주식수</th>
						<td><span>${cpn.ownStock}</span>&nbsp;</td>
					</tr>
					<tr>
						<th class="tbColor">결산월</th>
						<td><c:if test="${not empty cpn.accountMonth}">${cpn.accountMonth} 월</c:if>&nbsp;</td>
						<th class="tbColor">상장일</th>
						<td>${cpn.publicDate}&nbsp;</td>
						<th class="tbColor">금액</th>
						<td><c:if test="${not empty cpn.money}"><span>${cpn.money} 억원</span></c:if>&nbsp;</td>
					</tr>
					<tr>
						<th class="tbColor" style="border-bottom-left-radius: 10px;">주요품목</th>
						<td colspan="5" style="text-align:left;">${cpn.majorProduct}&nbsp;</td>
					</tr>
				</thead>
			</table><br/><br/>
			<table class="t_skinR00">
				<thead><tr>
					<th class="tbColor">대표이사</th>
					<td class="tbColorSub" style="width:calc(50%-115px);min-width:220px;">&nbsp;
						<span <c:if test="${cpn.ceoId != 0}">class="link" onclick="slctCst('${cpn.ceoId}');" </c:if>style="vertical-align: middle;">
							<b>${cpn.cstNm}</b>
							<c:if test="${fn:length(cpn.cstNm) == 0}">&nbsp;&nbsp;<spring:message code="info.nodata.msg" /></c:if>
						</span>
						&nbsp;&nbsp;
						<span class="red btn s" id="modiBtn"><a onclick="popUp('_0','ceo','','${cpn.cpnId}')">&nbsp;&nbsp;수정&nbsp;&nbsp;</a></span>
						<span style="color:silver;"><small>※직원중선택</small></span>
					</td>
					<th class="tbColor">회사 NEEDS</th>
					<td class="tbColorSub" style="width:calc(50% - 120px);min-width:220px;">&nbsp;
						<span class="link modiInfo btn s blue" id="info_0">
							<a>&nbsp;&nbsp;추가&nbsp;&nbsp;</a>
						</span>
						&nbsp;
						<span style="color:silver;"><small>※정보등록 > 핵심체크사항 (<b> 투자/자산운용관심, M&A </b>)</small></span>
					</td>
				</thead>
			
				<tbody>
					<td colspan="2">
						<table class="sub_tbl">
							<c:forEach var="note" items="${noteList}" varStatus="status">
							<tr>
								<td><a class="noteNote" id="0_noteNote_${status.count}"><nobr><b>${fn:substring(note.title,0,18)}<c:if test="${fn:length(note.title) > 18}">...</c:if></b></nobr></a></td>
								<td></td>
								<td>${fn:replace(note.note,lf, "<br/>")}</td>
								<td></td>
								<td><nobr><small>입력자:${note.rgNm}</small></nobr>
									<br/><nobr><small>'${fn:replace(fn:substring(note.rgDt,2,10),'-','.')}</small></nobr>
								</td>
							</tr>
							</c:forEach>
							<c:if test="${empty noteList}"><tr><td><spring:message code="info.nodata.msg" /></td></tr></c:if>
							<c:forEach var="meet" items="${meetList}" varStatus="status"><c:if test="${not empty meet.meetNm}">
							<tr>
								<td><nobr><b>${meet.meetNm}</b></nobr></td>
								<td></td>
								<td>${fn:replace(meet.note,lf, "<br/>")}</td>
								<td></td>
								<td><nobr><small>${meet.rgNm}</small></nobr>
									<br/><nobr><small>'${fn:replace(fn:substring(meet.rgDt,2,10),'-','.')}</small></nobr>
								</td>
							</tr>
							</c:if></c:forEach>
						</table>
					</td>
					<td colspan="2">
						<table class="sub_tbl">
							<c:forEach var="offer2" items="${offerInfoList}" varStatus="status"><c:if test="${userLoginInfo.permission > '00019' or userLoginInfo.id == offer2.rgId}">
							<tr>
								<td>'${fn:replace(fn:substring(offer2.tmDt,2,10),'-','.')}</td>
								<td class="link modiInfo" id="info_${status.count}" style="max-width:400px;">
									<font color="#B45F04">
										<b>${offer2.tmpNum1}:</b> ${offer2.comment}
									</font>
								</td>
							</tr>
							</c:if></c:forEach>
						</table>
					</td>
				</tbody>


				<thead>
					<th class="tbColor">대표이사 네트워크</th>
					<td class="tbColorSub" style="min-width:220px;">&nbsp;
						<span class="btn s blue" id="addBtn">
							<a href="" onclick="popUp('_0','C','${cpn.cstNm}','${cpn.ceoId}'); return false;">&nbsp;&nbsp;추가&nbsp;&nbsp;</a>
						</span>
						<span style="color:silver;"><small>※대표이사의 인물 네트워크</small></span>
					</td>
					<th class="tbColor">관련인물</th>
					<td class="tbColorSub" style="min-width:220px;">
						<span class="btn s blue popUpBtn" >
							<%-- <a href="" onclick="popUp('_0','PersonCPNnet','${cst.cstNm}','${cst.sNb}'); return false;">&nbsp;&nbsp;추가&nbsp;&nbsp;</a> --%>
						</span>
						<span style="color:silver;"><small>※추가 : 인물상세 > 법인네트워크</small></span>
					</td>
				</thead>
				<tbody>
					<td colspan="2">
						<table class="sub_tbl t_skin04_cstNcpn">
							<c:forEach var="netP" items="${netList}" varStatus="status">
							<tr class="link" onclick="slctCst('${netP.cstId}');">
								<td><nobr><b>${netP.cstNm}</b></nobr></td>
								<td><nobr>${netP.cpnNm}</nobr></td>
								<td><small>${netP.position}</small></td>
								<td></td>
								<td>${fn:replace(netP.note,lf, "<br/>")}</td>
								<td><nobr><small>${netP.rgNm}</small></nobr></td>
							</tr>
							</c:forEach>
							<c:if test="${empty netList}"><tr><td><spring:message code="info.nodata.msg" /></td></tr></c:if>
						</table>
					</td>
					<td colspan="2">
						<table class="sub_tbl t_skin04_cstNcpn">
							<c:forEach var="cstN" items="${cstList}" varStatus="status">
							<tr class="link" onclick="slctCst('${cstN.subSNb}');">
								<td><nobr><b>${cstN.cstNm}</b></nobr></td>
								<td>${cstN.cpnNm}</td>
								<td></td>
								<td>${fn:replace(cstN.note,lf, "<br/>")}</td>
								<td></td>
								<td><nobr><small>${cstN.rgNm}</small></nobr></td>
							</tr>
							<tr>
								<!-- <td style="background-color:white !important;">|</td> -->
								
								<td valign="top" style="padding:1px; color:gray" align="right">└─▷</td>
								<td valign="middle" style="padding:1px; color:gray"><nobr>${cpn.cpnNm}&nbsp;</nobr><br/>친밀도</td>
								<td class="pd0" colspan="4">
									<table class="t"><tr><c:forEach var="loop5" varStatus="L5" begin="1" end="5">
										<td class="tabImportant <c:if test="${cstN.lvCd>=L5.count}">bgLightGray</c:if>" title="${L5.count}" onclick="javascript:selectLvCd('CD','${L5.count}','${cstN.sNb}','companyName')"></td>
									</c:forEach></tr></table>
								</td>
							</tr>
							</c:forEach>
							<c:if test="${empty cstList}"><tr><td><spring:message code="info.nodata.msg" /></td></tr></c:if>
						</table>
					</td>
				</tbody>

			<!-- </table><br/>&nbsp;<br/><table class="t_skin04"> -->
				
				<thead>
					<th class="tbColor">직원</th>
					<td colspan="3" class="tbColorSub"></td>
				</thead>
				<tbody>
					<td colspan="4">
						<table class="sub_tbl t_skin04_cstNcpn">
							<c:forEach var="employee" items="${employeeList}" varStatus="status">
							<tr class="link" onclick="slctCst('${employee.sNb}');" style="float:left;">
								<td><b>${employee.cstNm}</b></td>
								<td>${employee.position}</td>
							</tr><tr style="float:left;"><td>|</td></tr>
							</c:forEach>
							<c:if test="${empty employeeList}"><tr><td><spring:message code="info.nodata.msg" /></td></tr></c:if>
						</table>
					</td>
				</tbody>

				<thead>
					<th class="tbColor">시너지 컨텍포인트</th>
					<td colspan="3" class="tbColorSub"></td>
					<!-- <th class="tbColor">기투자 내역</th>
					<td class="tbColorSub">&nbsp;
						<span class="link btn s blue" onclick="javascript:investment(event);">
							<a>&nbsp;&nbsp;추가&nbsp;&nbsp;</a>
						</span>
					</td> -->
				</thead>
				<tbody>
					<td colspan="4">
						<table class="sub_tbl" style="width:auto;">
							<c:set var="ibStaff"/><c:set var="cpnCst"/>
							
							<c:forEach var="contact2" items="${contactList2}" varStatus="status">
							<c:if test="${(cpnCst != contact2.cstNm || ibStaff != contact2.rgNm)}">
							<tr>
								<c:if test="${cpnCst == contact2.cstNm}">
									<td></td><td></td><td></td>
								</c:if>
								<c:if test="${cpnCst != contact2.cstNm}">
									<td style="text-align: right;">${contact2.cstCpnNm}</td>
									<td><c:set var="cpnCst" value="${contact2.cstNm}"/><nobr><b>${contact2.cstNm}</b></nobr></td>
									<td><small>${contact2.position}</small></td>
								</c:if>
								<td><c:if test="${ibStaff != contact2.rgNm}">
									<c:set var="ibStaff" value="${contact2.rgNm}"/><nobr><b>${contact2.rgNm}</b></nobr>
									</c:if>
								</td>
							</tr>
							</c:if>
							</c:forEach>
							<c:if test="${empty contactList2}"><tr><td><spring:message code="info.nodata.msg" /></td></tr></c:if>
						</table>
					</td>
					<%-- <td colspan="2">
						<table class="sub_tbl" style="width:auto;">
							<c:forEach var="ivm" items="${investmentList}" varStatus="ivmS">
							<tr class="hov" onclick="javascript:investment(event,'${ivm.sNb}');">
								<td>${ivm.cpnNm}</td>
								<td>${ivm.categoryNm}</td>
								<td>${ivm.price}</td>
								<td>${ivm.comment}</td>
							</tr>
							</c:forEach>
						</table>
					</td> --%>
				</tbody>

				<thead>
					<th class="tbColor">시너지와 이력</th>
					<td class="tbColorSub">&nbsp;&nbsp;<span class="btn s navy"><a onclick="ajaxOffer(event,'','${cpn.cpnId}')">전체이력</a></span><%-- &nbsp;&nbsp;<span class="btn s navy"><a onclick="ajaxOffer(event,'','${cpn.cpnId}','100')">[${opinionCnt}] 의견</a></span> --%>
						<%-- <c:if test="${cpn.exploring != '00010'}"> --%>
							&nbsp;&nbsp;<span class="btn s black" onclick="cpnDivShow('','0opinionPr0')"><a>탐방발굴 의견</a></span>
							<select onchange="chgExploring(this)">
								<option value="00010" <c:if test="${cpn.exploring == '00010'}">selected</c:if>>-선택-</option>
								<option value="00001" <c:if test="${cpn.exploring == '00001'}">selected</c:if>>적격</option>
								<option value="00002" <c:if test="${cpn.exploring == '00002'}">selected</c:if>>관심종목</option>
								<option value="00003" <c:if test="${cpn.exploring == '00003'}">selected</c:if>>탐방필요</option>
								<option value="00004" <c:if test="${cpn.exploring == '00004'}">selected</c:if>>보류</option>
								<option value="10000" <c:if test="${cpn.exploring == '10000'}">selected</c:if>>대상아님</option>
							</select>
						<%-- </c:if> --%>
					</td>
					<th class="tbColor">발행</th>
					<td class="tbColorSub"></td>
				</thead>
				<tbody>

				<tr>
					<td colspan="2">
						<table class="sub_tbl t_skin04_cstNcpn" style="width:auto;font-size:11px;">
							<c:forEach var="offer2" items="${offerList2}" varStatus="status">
							
								<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :S  ================== --%>
								<c:choose>
								<c:when test="${mezzL eq 'Y'}">
									<c:set var="asterDeal" value="N"/>
								</c:when>		<%-- 내가 등록한 딜이 아니면서 --%>		<%--             상장사 이고			 --%>		<%--						메자닌 (CB, EB, BW, RCPS) 이고								 												--%>	<%--	진행중 인 건		 --%>		<%--						제안중이 아니고					 --%>
								<c:when test="${offer2.rgId ne userLoginInfo.id and ('A' eq offer2.cpnStts or 'Q' eq offer2.cpnStts) and (offer2.categoryCd eq '00001' or offer2.categoryCd eq '00002' or offer2.categoryCd eq '00003' or offer2.categoryCd eq '00015') and offer2.progressCd eq '00001'}">		<%--  and (offer2.middleOfferCd ne '00004' and offer2.middleOfferCd ne '00005') --%>
									<c:set var="asterDeal" value="Y"/>	<%-- 별표시(숨김) --%>
								</c:when>
								<c:otherwise>
									<c:set var="asterDeal" value="N"/>
								</c:otherwise>
								</c:choose>
								<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :E  ================== --%>
							
								<c:choose><%-- 하단 or (offer2.middleOfferCd == '00004') 조건 추가(딜>>딜제안중(제안중(니즈)) 인건도 딜 팝업화면 뜨도록 하기위해 20150921 --%>
									<c:when test="${(offer2.offerCd == '00006') or (offer2.offerCd == '00007') or (offer2.offerCd == '00013') or (offer2.middleOfferCd == '00004') or (offer2.middleOfferCd == '00005') }"><tr class="link"  onclick="popUp('${offer2.tmDt}','rcmdComment','','${offer2.sNb}');"></c:when>
									<c:otherwise><tr class="link" onclick="ajaxOffer(event,'${offer2.sNb}')"></c:otherwise>
								</c:choose>
								<td style="padding: 5px 0 0 0">
								
								<table>
									<colgroup>
										<col width="60"/>
										<col width="110"/>
										<col width="65"/>
										<col width="70"/>
										<col width="50"/>
										<col width=""/>
										<col width="50"/>
									</colgroup>
									<tr>
										<td class="pd0">'${fn:replace(fn:substring(offer2.tmDt,2,10),'-','.')}</td>
										<%-- <td>${fn:substring(offer2.memo,0,8)}<c:if test="${fn:length(offer2.memo) > 8}">...</c:if></td> --%>
										<td style="padding:0 5px 0 0;text-align: right;"><c:choose><c:when test="${asterDeal eq 'Y'}">***</c:when><c:otherwise>${offer2.cstCpnNm}</c:otherwise></c:choose></td>
										<td class="pd0"><b><c:choose><c:when test="${asterDeal eq 'Y'}">***</c:when><c:otherwise>${offer2.cstNm}</c:otherwise></c:choose></b><br/><small>${fn:substring(offer2.position,0,6)}<c:if test="${fn:length(offer2.position) > 6}">..</c:if></small></td>
										<td class="pd0"><font color="green">${offer2.offerNm}<c:if test="${empty offer2.offerNm}">${offer2.middleOfferNm }</c:if></font>
											<c:if test="${offer2.opinion != 0}"><span style="color:darkgoldenrod">&nbsp;<b>[${offer2.opinion}]</b></span></c:if>&nbsp;</nobr>
										</td>
										<td class="pd0"><nobr>${offer2.rgNm}</nobr></td>
										<td class="pd0"><c:if test="${not empty offer2.realNm}"><c:choose><c:when test="${fn:indexOf(offer2.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(offer2.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(offer2.makeNm, '^^^')}"/><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file${imSt.count}" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(offer2.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file1" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${offer2.realNm}"></c:otherwise></c:choose></c:if>
										</td><c:if test="${offer2.middleOfferCd > 0}">
										<td class="pd0"><c:forEach var="cmmCd" items="${cmmCdProgressCdList}"><c:if test="${offer2.progressCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach></td>
										<td class="pd0" style="max-width: 200px;"><c:if test="${not empty offer2.result}">/</c:if> ${offer2.result}</td>
										<td class="pd0" style="max-width: 200px;"><c:if test="${not empty offer2.subMemo}">/</c:if> ${offer2.subMemo}</td></c:if><c:if test="${offer2.middleOfferCd < 1}"><td></td><td></td><td></td></c:if>
									</tr>
								<c:if test="${not empty offer2.financing or not empty offer2.humanNet or not empty offer2.management or not empty offer2.mna or not empty offer2.etc or not empty offer2.share or not empty offer2.resource or not empty offer2.investInte}">
									<tr>
										<td></td>
										<td colspan="8" class="pd0" style="max-width:400px;">
											<font color="#B45F04">
												<c:if test="${not empty offer2.financing 	}">&nbsp;&nbsp;<b>CB/EB:</b> ${offer2.financing}</c:if>
												<c:if test="${not empty offer2.humanNet 		}">&nbsp;&nbsp;<b>워런트/블록딜:</b> ${offer2.humanNet}</c:if>
												<c:if test="${not empty offer2.audit 		}">&nbsp;&nbsp;<b>분석의견:</b> ${offer2.audit}</c:if>
												<c:if test="${not empty offer2.management 	}">&nbsp;&nbsp;<b>자산운용:</b> ${offer2.management}</c:if>
												<c:if test="${not empty offer2.etc 			}">&nbsp;&nbsp;<b>실적:</b> ${offer2.etc}</c:if>
												<c:if test="${not empty offer2.investInte 	}">&nbsp;&nbsp;<b>투자관심:</b> ${offer2.investInte}</c:if>
												<c:if test="${not empty offer2.resource 		}">&nbsp;&nbsp;<b>매수추천:</b> ${offer2.resource}</c:if>
												<c:if test="${not empty offer2.mna 			}">&nbsp;&nbsp;<b>M&A:</b> ${offer2.mna}</c:if>
												<c:if test="${not empty offer2.share 		}">&nbsp;&nbsp;<b>공유:</b> ${offer2.share}</c:if>
											</font>
										</td>
									</tr>
								</c:if>
								</table>
								
								</td>
							</c:forEach>
							<c:if test="${empty offerList2}"><tr><td><spring:message code="info.nodata.msg" /></td></tr></c:if>
						</table>
					</td>
					<td colspan="2">
						<table class="sub_tbl t_skin04_cstNcpn" style="width:auto;">
						<!-- 공시팝업 -->
							<c:forEach var="nt" items="${NoticeList}" varStatus="ntS">
							<tr class="link" onclick="javascript:view('tbl${ntS.count}',this,event)">
								<td>'${fn:replace(fn:substring(nt.subscriptionDt,2,10),'-','.')}<c:if test="${empty nt.subscriptionDt}">${fn:replace(fn:substring(nt.payupDt,2,10),'-','.')}</c:if></td>
								<td width="20px"></td>
								<td>${nt.way}</td>
								<td>${nt.categoryCd}</td>
								<td width="20px"></td>
								<td>${nt.price}<c:if test="${not empty nt.price}">억</c:if></td>
							</tr>
							</c:forEach>
						<!-- 공시팝업 -->
							<%-- <c:forEach var="offer2" items="${offerList2}" varStatus="status"><c:if test="${(offer2.offerCd == '00002') or (offer2.offerCd == '00004') or (offer2.offerCd == '00013') }">
							<c:choose>
								<c:when test="${(offer2.offerCd == '00006') or (offer2.offerCd == '00007') or (offer2.offerCd == '00013') }"><tr class="link"  onclick="popUp('${offer2.tmDt}','rcmdComment','','${offer2.sNb}');"></c:when>
								<c:otherwise><tr class="link" onclick="ajaxOffer(event,'${offer2.sNb}')"></c:otherwise>
							</c:choose>
								<td>${offer2.tmDt}</td>
								<td>${fn:substring(offer2.memo,0,8)}<c:if test="${fn:length(offer2.memo) > 8}">...</c:if></td>
								<td style="text-align: right;">${offer2.cstCpnNm}</td>
								<td><b>${offer2.cstNm}</b> <small>${fn:substring(offer2.position,0,6)}<c:if test="${fn:length(offer2.position) > 6}">..</c:if></small></td>
								<td><font color="green">${offer2.offerNm}<c:if test="${empty offer2.offerNm}">${offer2.middleOfferNm }</c:if></font>
									<c:if test="${offer2.opinion != 0}"><span style="color:darkgoldenrod">&nbsp;<b>[${offer2.opinion}]</b></span></c:if>&nbsp;</nobr>
								</td>
								<td>${offer2.rgNm}</td>
								<td><c:if test="${not empty offer2.realNm}"><c:choose><c:when test="${fn:indexOf(offer2.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(offer2.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(offer2.makeNm, '^^^')}"/><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file${imSt.count}" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(offer2.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file1" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${offer2.realNm}"></c:otherwise></c:choose></c:if>
								</td><c:if test="${offer2.middleOfferCd > 0}">
								<td><c:forEach var="cmmCd" items="${cmmCdProgressCdList}"><c:if test="${offer2.progressCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach></td>
								<td style="max-width: 200px;"><c:if test="${not empty offer2.result}">/</c:if> ${offer2.result}</td>
								<td style="max-width: 200px;"><c:if test="${not empty offer2.subMemo}">/</c:if> ${offer2.subMemo}</td></c:if><c:if test="${offer2.middleOfferCd < 1}"><td></td><td></td><td></td></c:if>
							</tr>
							</c:if></c:forEach> --%>
							<c:if test="${empty NoticeList}"><tr><td><spring:message code="info.nodata.msg" /></td></tr></c:if>
						</table>
					</td>
				</tr>
				</tbody>


			</c:forEach>
			</table>
		</article>
	</section>
	
<%-- 회사NEEDS :S --%>
		<div class="popUpMenu title_area" id="infoPr0">
			<p class="closePopUpMenu">ⅹ닫기</p>
			<div style="height:25px;">정보등록 > 핵심체크사항</div>
			<span style="display:inline-block;width:170px;vertical-align:top;"><label><input type="checkbox" id="chk_00" value="Y" class="input_chk" onclick="chkBoxViewTextarea(this)" />투자/자산운용관심 </label></span>
			<ul style="display:none;"><li class="c_note"><textarea id="infoArea00"></textarea></li></ul>
			<span style="display:inline-block;width:80px;vertical-align:top;"><label><input type="checkbox" id="chk_01" value="Y" class="input_chk" onclick="chkBoxViewTextarea(this)" />M&A </label></span>
			<ul style="display:none;"><li class="c_note"><textarea id="infoArea01"></textarea></li></ul>
			<p class="bsnsR_btn"><span class="btn s green" onclick="saveKeyPoint();"><a>저장</a></span></p>
		</div>
	<c:forEach var="ofif" items="${offerInfoList}" varStatus="status"><c:if test="${userLoginInfo.permission > '00019' or userLoginInfo.id == offer2.rgId}">
		<div class="popUpMenu title_area" id="infoPr${status.count}">
			<input type="hidden" id="infoSnb${status.count}" value="${ofif.sNb}">
			<p class="closePopUpMenu">ⅹ닫기</p>
			<ul><li class="c_note"><textarea id="infoArea${status.count}">${ofif.comment}</textarea></li></ul>
			<p class="bsnsR_btn"><span class="btn s green" onclick="saveModiOfIf(${status.count})"><a>저장</a></span></p>
		</div>
	</c:if></c:forEach>
<%-- 회사NEEDS :E --%>

<!-- 공시팝업 -->
	<c:forEach var="nt" items="${NoticeList}" varStatus="ntS"><c:if test="${empty nt.subscriptionDt}">
	<div class="popUpMenu" style="position:absolute;width:700px;display:none;overflow:hidden;" id="tbl${ntS.count}">
		<p class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</p>
		<table class="t_skinR00">
			<thead>
				<tr>
					<th class="" style="width:60px;border-radius:0px;">접수일자</th>
					<th class="pd0 w40p">방법</th>
					<th class="pd0 w30p">구분</th>
					<th class="pd0 companyName">회사명</th>
					<th class="pd0 w30p">회차</th>
					<th class="pd0 w50p">금액<small>(억)</small></th>
					<th class="pd0 w40p">쿠폰</th>
					<th class="pd0 w40p">YTM</th>
					<th class="pd0 w40p">YTP</th>
					<th class="pd0 w60p">납입일</th>
					<th class="pd0 w60p" style="border-radius:0px;">사채만기</th>
				</tr>
			</thead>
			<tbody>
				<tr height="25px;">
					<td class="cent bgWht pd0" style="width:70px;border-radius:0px;">${nt.tmDt}</td>
					<td class="cent bgWht pd0">${nt.way}</td>
					<td class="cent bgWht pd0">${nt.categoryCd}</td>
					<td class="cent bgWht pd0">${nt.cpnNm}</td>
					<td class="cent bgWht pd0">${nt.rank}</td>
					<td class="cent bgWht won" style="width:47px;color:blue;font-weight:bold;">${nt.price}</td>
					<td class="cent bgWht pd0">${nt.coupon}%</td>
					<td class="cent bgWht pd0">${nt.ytm}%</td>
					<td class="cent bgWht pd0"><c:if test="${nt.ytp != '0.0'}">${nt.ytp}%</c:if><c:if test="${nt.ytp == '0.0'}">${nt.ytm}%</c:if></td>
					<td class="cent bgWht pd0" style="font-size:11px;">${nt.payupDt}</td>
					<td class="cent bgWht pd0" style="border-radius:0px;font-size:11px;">${nt.dueDt}</td>
				</tr>
			</tbody>
		</table>
		<table class="t_skinR00">
			<thead>
				<tr>
					<th class="pd0 w60p" style="border-radius:0px;">PUT</th>
					<th class="pd0 w60p">행사가</th>
					<th class="pd0 w60p">워런트<br/>만기</th>
					<th class="pd0 w40p">리픽싱</th>
					<th class="pd0 w80p">주관회사<br/><small>(담당자)</small></th>
					<!-- <th class="pd0 w80p">인수자</th> -->
					<th class="pd0 w40p">BuyBack</th>
					<th class="pd0 w50p">프리미엄</th>
					<th class="pd0 w160p">대상</th>
					<th class="pd0" style="border-radius:0px;">관계</th>
				</tr>
			</thead>
			<tbody>
				<tr height="25px;">
					<td class="cent bgWht pd0" style="border-radius:0px;font-size:11px;">${nt.put}</td>
					<td class="cent bgWht won" style="width:57px;">${nt.eventPrice}</td>
					<td class="cent bgWht pd0" style="font-size:11px;">${nt.wrtDueDt}</td>
					<td class="cent bgWht pd0">${nt.refixSale}</td>
					<td class="cent bgWht pd0">${nt.superCpn}</td>
					<%-- <td class="cent bgWht pd0">${nt.underWriter}</td> --%>
					<td class="cent bgWht pd0">${nt.buyback}</td>
					<td class="cent bgWht pd0">${nt.premium}</td>
					<td class="cent bgWht pd0">${nt.target}</td>
					<td class="cent bgWht pd0" style="border-radius:0px;">${nt.relation}</td>
					<input type="hidden" value="${nt.sNb}"/>
				</tr>
			</tbody>
		</table>
		<!-- S : 인수자, 인수자당 투자액 복수 개선으로 인한 수정 개선 20170915 ksm -->
		<table class="t_skinR00">
			<thead>
				<tr>
					<th class="cent bgWht pd0" style="height:30px;border-radius:0px;">인수자</th> 
				</tr>
			</thead>
			<tbody>
				<tr height="25px;">
					<td class="bgWht pd0" style="border-radius:0px;margin-left:5px;">
						<c:choose>
							<c:when test="${fn:length(nt.receiverList) gt 0}">
								<c:forEach var="rc" items="${nt.receiverList}" varStatus="rcS">
									<c:if test="${rcS.index gt 0}">,&nbsp;&nbsp;</c:if>${rc.cpnNm}&nbsp;&nbsp;<font color="blue"><b>${rc.price}</b></font>
								</c:forEach>
							</c:when>
							<c:otherwise>${nt.underWriter}</c:otherwise> 
						</c:choose>												
					</td>					
				</tr>
			</tbody>
		</table>
		<p class="cent" style="margin:3px 0px;">
			<span class="btn s orange" onclick="javascript:modifyNoticeMezzaninePopup(this,${nt.sNb});"><a>수정</a></span>
			<span class="btn s red" onclick="javascript:deleteNoticeMezzanine(${nt.sNb});"><a>삭제</a></span>
		</p>
		<!--E : 인수자, 인수자당 투자액 복수 개선으로 인한 수정 개선 20170915 ksm -->
	</div>
	</c:if>
	<c:if test="${not empty nt.subscriptionDt}">
	<div class="popUpMenu" style="width:930px;display:none" id="tbl${ntS.count}">
		<p class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</p>
		<table class="t_skinR00">
			<thead>
				<tr>
					<th class="" style="width:60px;border-radius:0px;">접수일자</th>
					<th class="pd0 w50p">구분</th>
					<th class="pd0 w120p">회사명</th>
					<th class="pd0 w120p">증자방식</th>
					<th class="pd0 w60p">발행규모<small>(억)</small></th>
					<th class="pd0 w80p">배정기준일</th>
					<th class="pd0 w80p">신주인수권<br/>상장일</th>
					<th class="pd0 w80p">청약일</th>
					<th class="pd0 w40p">할인율</th>
					<th class="pd0 w120p">주관회사<br/><small>(담당자)</small></th>
					<th class="pd0 w80p" style="border-radius:0px;"><nobr>인수자</nobr></th>
				</tr>
			</thead>
			<tbody>
				<tr height="25px;">
					<td class="cent bgWht" style="width:70px;border-radius:0px;padding: 5px 0px;">${nt.tmDt}</td>
					<td class="cent bgWht pd0">${nt.categoryCd}</td>
					<td class="cent bgWht pd0">${nt.cpnNm}</td>
					<td class="cent bgWht pd0">${nt.way}</td>
					<td class="cent bgWht won">${nt.price}</td>
					<td class="cent bgWht pd0">${nt.assignmentDt}</td>
					<td class="cent bgWht pd0">${nt.payupDt}</td>
					<td class="cent bgWht pd0">${nt.subscriptionDt}</td>
					<td class="cent bgWht pd0">${nt.refixSale}</td>
					<td class="cent bgWht pd0">${nt.superCpn}</td>
					<td class="cent bgWht pd0" style="border-radius:0px;">${nt.underWriter}</td>
					<input type="hidden" value="${nt.sNb}"/>
				</tr>
			</tbody>
		</table>
	</div></c:if>
	</c:forEach>
<!-- 공시팝업 -->
</body>
</html>