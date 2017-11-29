<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>


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

<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>

<title>Main</title>
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/memo.css'/>" rel="stylesheet" type="text/css">

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js?ver=0.3'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/popUp.js?ver=0.1'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/part/memo.js?ver=1.0'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/work.js?ver=0.2'/>" ></script>


<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<script type="text/JavaScript" src="<c:url value='/js/ajaxRequest.js?ver=0.1'/>" ></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 


<script>

$(document).ready(function(){
	//파일 다운로드
	$(document).on("click",".filePosition",function(){
		var obj = $(this).parent();
		// var frm = document.getElementById('modifyRec');//sender form id
		// frm.action = "downloadProcess.do";//target frame name
		// frm.submit();
		var obj_id = $(this).attr('id');
		var num = obj_id.split('ile');
		$("#makeName").val(obj.find('[id^=mkNames'+num[1]+']').val());
		// document.downName.submit();
		$("#downName").submit();
	});
	
	$('.Toogle').hover(function(){
		$(this).find('[class*=ToogleIpt]').next().fadeIn('slow');
	},function(){
		$(this).find('[class*=ToogleIpt]').next().delay(5000).fadeOut('fast');
	});
	
	$(".frt_idea ul:odd").css("background-color", "#EDF4F8");
	$(".frt_newNet ul:odd").css("background-color", "#EDF4F8");
	window.parent.mainPadding0();
	
	alarm();
	
	// 법인카드 사용내역 조회 후 팝업창
	cardCorpUsedList();
	
});

//알림 팝업 호출
function alarm(){
	// popUp 규격
	var w = '550';
	var h = '320';
	var init_top = 30;
	var init_left = 30;
	var ah = screen.availHeight - 30;
	
	h = (ah-40>h?h:ah-40);
	var xc = ((screen.availWidth - 10) - w) / 2;
	var yc = (ah - h) / 2;
				
	//알림 팝업 해당 사용자인 경우
	if('${popupShow}' == 'Y'){
		<c:forEach items="${popupInfoList}" var="item" varStatus="status">			
			var alarmId = '${item}';
			var title = "pop_"+alarmId;
			var cookie = "cookie_"+alarmId;
			if (getCookie(cookie) == ""){
				init_top += 25;
				init_left += 25;
				//모니터 중간 지점을 넘어가지 않도록.
				var left= (init_left < xc) ? init_left : xc;
				var top = (init_top < yc) ? init_top : yc;
				var win1 = window.open("../alarm/alarmInfo.do?id="+alarmId, title, "resizable=yes,width=550,height=550,left="+left+",top="+top );
				win1.focus();
			}
		</c:forEach>
	}
}


function cardCorpUsedList(){
	// popUp 규격
	var w = '550';
	var h = '320';
	var init_top = 30;
	var init_left = 30;
	var ah = screen.availHeight - 30;
	
	h = (ah-40>h?h:ah-40);
	var xc = ((screen.availWidth - 10) - w) / 2;
	var yc = (ah - h) / 2;
				
	//카드사용 건수가 0이 아닌 경우 알람팝업을 띄움		
	if('${cardCorpUsedCount}' != '0'){		
		var nh = 130+ (${cardCorpUsedCount}*28);
		window.open("${pageContext.request.contextPath}/card/cardCorpUsedListPopup.do?usrId=" + $('#rgstId').val(), '법인카드 사용내역', "resizable=yes,width=720, height=" + nh + ",left="+xc+",top="+yc );
		
	}
}

//쿠키 값 설정여부 가져오기 
function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i].trim();
		if (c.indexOf(name) == 0)
			return c.substring(name.length, c.length);
	}
	return "";
}

/*
function resize_iframe(){
	var height = document.documentElement.clientHeight || window.innerHeight || document.body.clientHeight;
	var stockCstFrame = $(".line1").offsetTop;
	$(".frt_data").style.height=parseInt(height-stockCstFrame-70)+"px";
	$(".line2").style.height=parseInt(height-stockCstFrame-70)+"px";
	$(".line3").style.height=parseInt(height-stockCstFrame-70)+"px";
} 
*/


function mainMemoChkOK(th, stts){
	var obj = $(th).parent().parent();
	var data = {
			memoSNb: obj.find('[id^=memoSNb]').val(),
			sttsCd: stts,
			rgId: $('#rgstId').val(),
			importance: obj.find('[id^=importance]').val()
			};
	var url = "../work/checkMemo.do";
	var fn = function(){
		parent.mainFrame.location.replace("mainLogo.do");
	};
	ajaxModule(data,url,fn);
}

function newCstNnetwork(th,cd,snb,flag){
	if(cd==='2'||cd==='5') {
		//checkMainTable($(th).parent().parent(),cd,snb);
		if(flag!='no'){
			return popUp('','rcmdCst','',snb);
		}
	}
	checkMainTable($(th).parent().parent(),cd,snb);
}
function checkMainTable(th,cd,snb){
	var clickSentence = $(th);
	var data = {
			categoryCd: "0000"+cd
			,offerSnb: snb
			,rgId: $('#rgstId').val()
			};
	var url = "../main/checkMainTable.do";
	var fn = function(){
		clickSentence.css('display','none');
		//parent.mainFrame.location.replace("mainLogo.do");
	};
	ajaxModule(data,url,fn);
}
function memoDivNew(e,rcvStf){
	
	if('${userLoginInfo.name}' == rcvStf){		//나한테는 발송 할 수 없게 막는다.
		return;
	}
	
	var fn = function(arg){
		$("#offerDiv").html(arg);
		$("#offerDiv").find('[id^=memoSndName]').val(rcvStf);
		$("#offerDiv").find('[id^=memoarea0]').attr('placeholder','\''+rcvStf+'\'에게 메모를 전달합니다.');
		view("offerPr",'',e);
	};
	ajaxModule('',"../main/sendNewMemo.do",fn);
}
/* 
//메모 추가
function memoDivAjax_new(th,e,snb,mainSnb){ 
	var DATA = {sNb: snb};
	if(!(mainSnb==null||mainSnb=='')) DATA = {sNb:snb,mainSnb: mainSnb};
	var fn = function(arg){
		$("#offerDiv").html(arg);
		//var day = $(th).parent().parent().attr('class').split('day')[1];
		var day = new Date().getDate();		
		if(!(day==null||day=='')) $("#offerDiv").find('[id^=memoSNb]').attr('id','memoSNb'+day);
		view("offerPr",'',e);
	};
	ajaxModule(DATA,"../main/privateMemo.do",fn);
} */

//메모 내용수정 확인
function sndMemo_btnOk(th,f){
	var obj = $(th).parent().parent()
	,comment = obj.find('[id^=memoarea]').val();
	
	if(comment.indexOf('에게 메모를 전달합니다.')>0) {
		alert('내용을 입력하세요.');
		return;
	}
	
	$(".popUpMenu").hide();
	var DATA = {
			memoSndName: $('#memoSndName').val(),
			comment: comment,

			subMemo: "N",
			importance: obj.find('[id^=importance]').val(),
			priv: obj.find('[id^=priv]').val(),
			tmpNum2: '${userLoginInfo.name}'
			};
	var url = "../work/insertMainNewMemo.do";
	var fn = function(){
		//if(f==='popUpMemo') document.mainPageForm.action = "popUpMemo.do";
		//else document.mainPageForm.action = "selectPrivateWorkV.do";
		//document.mainPageForm.submit();
	};
	ajaxModule(DATA, url, fn);
}


//더보기 버튼을 통해 메뉴로 이동을 위해 추가
function goMenuByMoreBtn(sUrl, knd) {
	location.href = sUrl + '?sorting=' + knd;	
}

// 법인카드 화면으로 이동
function goMenuCardCorp(){
	parent.leftIframeOFF();
	top_menu_new("${pageContext.request.contextPath}/card/cardCorpIndex.do", "mainFrame");
}

//인물추가 ... 더보기 버튼을 통해 메뉴로 이동을 위해 추가
function goMenuPerson(){
	parent.leftIframeON();
	top_menu_new("${pageContext.request.contextPath}/person/selectLeft.do", "leftFrame");
	top_menu_new("${pageContext.request.contextPath}/person/index.do", "mainFrame");
}

function top_menu_new(sUrl, frame) {
	
	if (frame=="mainFrame") {
		parent.mainFrame.location.href = sUrl;
	}else if (frame == "leftFrame") {
		parent.leftFrame.location.href = sUrl;
	}
}

//parent.slctMainMenu(6);



//팝업 재정의 (인물 추가) 
function popUpNew(num,flag,nm,snb){

	// popUp 규격
	var w = '740';
	var h = '740';
	var ah = screen.availHeight - 30;
	var aw = screen.availWidth - 10;

	var sUrl = '';

	if(flag=='new_person') {
		sUrl = "../person/rgstCst.do";
		sUrl+='?f='+flag+'&n='+num;
		sUrl+='&fromMain=y';
		w='690';
		h='400';	
	}
	
	h = (ah-40>h?h:ah-40);
	var xc = (aw - w) / 2;
	var yc = (ah - h) / 2;
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
	return;
}




//메모 검색 화면 팝업
function openMemoSearchPop(){
	
	var url = "${pageContext.request.contextPath}/work/memoBox.do";
	var option = "left=" + (screen.width > 1400?"200":"0") + ", top=" + (screen.height > 810?"100":"0") + ", width=1400, height=810, menubar=no, status=no, toolbar=no, location=no, scrollbars=auto, resizable=no";
	
	window.open(url, "_blank", option);
	
}


//투자심의 팝업
var myModal = new AXModal();		// instance

function investPopup(count, sNb, cpnNm, progressCd){			//딜 제안중 등록 팝업
	
	//누른 딜 스타일주기
	$('#investTr' + count).addClass('investClick');
	
	
	var url = "<c:url value='/work/investPopup.do'/>";
   	var params = {'sNb':sNb,
   				  'cpnNm': cpnNm,
   				  'progressCd': progressCd
   					};
   	
   	myModal.setConfig({windowID:"myModalCT",
   					   onclose:function(){
   						   	//누른 딜 스타일원복
   							$('#investTr' + count).removeClass('investClick');}});		//close callback.
   	       	
   	myModal.open({
   		url: url,
   		pars: params,
   		titleBarText: ' 투자심의&nbsp; [ ' + cpnNm + ' ]',		//titleBarText 속성 추가하였음.(원 Axisj에는 없었던것)
   		method:"POST",
   		top: 150 + $(document).scrollTop(),
   		width: 700,
   		closeByEscKey: true				//esc 키로 닫기   		
   	});
   	
   	$('#myModalCT').draggable();
	
}


//인물정보 팝업
function slctCst_this(sNb){
	
	window.open("", "popup_window", "width=900, height=700, scrollbars=auto");
	
	if($(".popUpBtn").css("display")=="none") return;
	$('#s_Name').val(sNb);
	var frm = document.getElementById('customerName');//sender form id
	frm.target = "popup_window";//target		
	frm.submit();
}


//딜 탭 변경
function moveTab(tab){
	//highlight
	$('.tab_t_on').removeClass("tab_t_on");
	$("span[class='tab_t tab_" + tab + "']").addClass("tab_t_on");
	
	
	$("#sorting").val(tab);	
	
	
	
	//로딩 이미지 보여주기 위한 리스너 함수 :S -----------
	var beforeFn = function(){
		// 로딩 이미지 보여주기 처리
		$('.wrap-loading', parent.mainFrame.document).removeClass('display-none');
	};
	var completeFn = function(){
		// 로딩 이미지 감추기 처리
        $('.wrap-loading', parent.mainFrame.document).addClass('display-none');
	};
	//로딩 이미지 보여주기 위한 리스너 함수 :E -----------
	
	
	commonAjaxSubmit("POST", $("#dealForm"), callbackFn, true, beforeFn, completeFn);
}
//탭변경 callback function
function callbackFn(data){
	$(".line_all_deal").empty();
	$(".line_all_deal").html(data);
}


//문자열 byte 길이
function getByteLength(str){
	var size = 0;
	for(var i=0; i<str.length; i++){
		size++;
		if(44032 <= str.charCodeAt(i) && str.charCodeAt(i) <= 55203)
			size++;
		if(12593 <= str.charCodeAt(i) && str.charCodeAt(i) <= 12686)
			size++;
	}
	return size;
}


$(document).on("click",".dealResult_btnOk2", function(){
	var obj = $(this).parent().parent().parent();
	
	var rgId = $('#rgstId').val();
	
	if(!confirm("등록하시겠습니까?\n(등록과 함께, 딜 등록자에게 메모 및 문자가 전달됩니다)")){ return; }
	var DATA = {
		sNb: obj.find('[id^=dealOpinionSNb]').val()
		,opinion: obj.find('[id^=opinionarea]').val()
		,rgId: rgId
		,tmpNum1: 'op'
		
		,cpnNm: obj.find('[id^=dealOpinionCpnNm]').val()	//딜 회사
		,usrId: obj.find('[id^=dealOpinionDealRgId]').val()	//딜 등록자 usr_id
	};
	
	//--------------------- SMS발송 :S ----------------------
	var smsMsg = "[투자의견] -회사명: " + obj.find('input[name=dealCpnNm]').val() + " -의견: " + obj.find('[id^=opinionarea]').val();
		
	if(obj.find('input[name=dealRgNm]').val() != '${userLoginInfo.name}' && '${userLoginInfo.dealSms}' == 'Y'){		//투자의견자가 딜 등록자 본인인 경우에는 skip (SMS수신자)	
		if(getByteLength(smsMsg) > 80){
			document.frmSMS.sendType.value = 5;		//LMS
		}else{
			document.frmSMS.sendType.value = 3;		//SMS
		}
		document.frmSMS.contents.value = smsMsg;
		document.frmSMS.toNumber.value = obj.find('input[name=dealRgUserPhn]').val();
		document.frmSMS.submit();					//SMS발송(등록자에게)
	}
	//--------------------- SMS발송 :E ----------------------
	

	$.ajax({
		type	: "POST",        //POST GET
		url		: "../work/modifyDealResult.do",     //PAGEURL
		data	: DATA,
		timeout : 30000,       //제한시간 지정
		cache	: false,        //true, false
		success	: function whenSuccess(arg){  //SUCCESS FUNCTION
			document.mainPageForm.submit();
		},
		error	: function whenError(x,e){    //ERROR FUNCTION
			ajaxErrorAlert(x,e);
		}
	});
});


</script>
<style>

.popUpMenuPop {
	display: none;
	position: absolute;
	z-index: 9999;
	
    background-color: #ECEADF;
    border: 1px solid hsl(0, 0%, 79%);
    border-radius: 4px;
    box-shadow: 0 2px 6px hsla(0, 0%, 0%, 0.25);
    color: hsl(0, 0%, 20%);
}
.popUpMenu {
	display: none;
	position: absolute;
	z-index: 9999;
	
    background-color: #ECEADF;
    border: 1px solid hsl(0, 0%, 79%);
    border-radius: 4px;
    box-shadow: 0 2px 6px hsla(0, 0%, 0%, 0.25);
    color: hsl(0, 0%, 20%);
}

.popUpMenu .closePopUpMenu{
	margin: 0;
	text-align: right;
	
	background-color: #323232;
    border-bottom: 1px solid hsl(0, 0%, 95%);
    color: hsl(0, 0%, 100%);
	border-radius: 4px 4px 0 0;
    font-weight: bold;
    padding: 7px 12px 7px 15px;
    position: relative;
}

.popUpMenu .closePopUpMenu:hover{
	margin: 0;
	text-align: left;
	cursor: pointer;
	
	background-color: #666666;
}

.popUpMenu select, .popUpMenu input, .popUpMenu textarea {
	border: 1px solid gray;
	border-radius: 2px;
}
.popUpMenu input, .popUpMenu textarea {
	padding: 2px 1px 2px 2px;
}

.t_skinR00{
	table-layout:fixed;
	width:100%;
	border-spacing: 0;
}
/* 
.t_skinR00 thead th,.t_skinR00 tbody td {
	padding: 5px;
} */

.t_skinR00 > tbody > tr:hover {
	background-color: moccasin !important;
}

.hov:hover {
	color: orange !important;
}


p{font-size:11px;}.cent{text-align: center;}
.popUpMenu #closeTab{
	margin: 0;
	text-align: right;
	
	background-color: #323232;
    border-bottom: 1px solid hsl(0, 0%, 95%);
    color: hsl(0, 0%, 100%);
	border-radius: 4px 4px 0 0;
    font-weight: bold;
    padding: 7px 12px 7px 15px;
    position: relative;
}
select{font-size:11px;}.mainDataLayout{border-radius:5px;box-shadow:2px 2px 10px#888888;margin:0 auto;}.mainDataLayoutTitle{text-align:center;padding:10px 0;border-radius:5px 5px 0 0;}.title_areaS{width:400px;}.title_areaS ul{padding:7px;margin:0;list-style:none;min-width:390px;border-radius:5px;}.popUpMenu{display:none;position:absolute;z-index:9999;background-color:#ECEADF;border:1px solid hsl(0,0%,79%);border-radius:4px;box-shadow:0 2px 6px hsla(0,0%,0%,0.25);color:hsl(0,0%,20%);font-size:12px;}.popUpMenu .closePopUpMenu:hover{margin:0;text-align:left;cursor:pointer;background-color:#666666;}.popUpMenu select,.popUpMenu input{border:1px solid gray;border-radius:2px;}.popUpMenu input{font-size:0.95em;padding:2px 1px 2px 2px;}.title_area{width:530px;}.title_area ul{padding:7px;margin:0;list-style:none;min-width:420px;border-radius:5px;}.popUpTitle_area ul{padding:7px;margin:0;list-style:none;min-width:320px;list-style:none;}.overFlowHidden{width:98%;overflow:hidden;}.title,.c_title,.cpnNm,.bold{font-weight:bold;}.c_title{line-height:18px;vertical-align:middle;}.c_note{color:gray;line-height:150%;min-height:180px;}.mini_c_note{color:gray;line-height:150%;}
textarea{resize:none;min-height: 180px; font-family:맑은 고딕, Trebuchet MS, Verdana, Geneva, sans-serif;}.bsnsR_btn{margin:0;text-align:center;}.t_note{margin:0;color:gray;font-size:12px;}.v-textarea{background-color:white;border:1px solid#AFAFAF;width:504px;margin-top:2px;padding:2px;}
textarea,.c_note,.m_note{font-size:12px;width:500px;}.bgRed {background-color: #F6CECE !important;}
a img{cursor:pointer;}

.mg0 {	margin:0 !important;}.pd0 {	padding:0 !important;}
html, body{	height:100%;	background-color:rgba(230, 230, 230, 0.44)}


.frt_data, .frt_cmnt, .frt_mna, .frt_cbeb, .frt_prjt, .frt_memo, .frt_majorMemo, .frt_keyPt, .frt_newCst, .frt_newNet, .frt_idea, .frt_ipo{ border: 1px solid gray; background-color:white;overflow-y:auto;}
/*.frt_{height: -moz-calc( 50% -12px);height: -webkit-calc( 50% -12px);height:calc( 50% - 12px);margin-bottom: 10px;}*/
/* .frt_keyPt{height:38%;} */

/*.frt_cbeb,.frt_cmnt00{height: -moz-calc( 43% -12px);height: -webkit-calc( 43% -12px);height:calc( 43% - 12px);margin-bottom: 10px;}
.frt_mna,.frt_memo00{height:30%; margin-bottom: 10px;}

.frt_newNet,.frt_cmnt,.frt_data{height: -moz-calc( 49% -12px);height: -webkit-calc( 49% -12px);height:calc( 49% - 12px);margin-bottom: 10px;}
.frt_memo,.frt_keyPt{height: -moz-calc( 50%);height: -webkit-calc( 50%);height:calc( 50%);}
.frt_ipo{height: -moz-calc( 26% -12px);height: -webkit-calc( 26% -12px);height:calc( 26% - 12px);margin-bottom: 10px;}
.frt_newCst{height: -moz-calc( 50%);height: -webkit-calc( 50%);height:calc( 50%);}
.frt_idea{height:28%;}
.frt_majorMemo{height:50%;}
.frt_prjt{height:18%;}*/


.frt_cbeb {height: 48%;margin-bottom: 10px;  } /*cb*/
.frt_mna{height:24%; margin-bottom: 10px; } /*mna*/
.frt_ipo { height: 24%; margin-bottom: 10px; } /*프리*/

.frt_data { height:48%; margin-bottom:10px; } /*정보정리*/
.frt_keyPt { height:49.3%;  } /*정보정리핵심체크*/

.frt_newNet { height:48%; margin-bottom:10px;  } /*네트워크*/
.frt_newCst { height: 49.3%; } /*인물추가*/

.frt_cmnt { height:48%; margin-bottom:10px; } /*코멘트*/
.frt_majorMemo { height:49.3%;  } /*메모*/

.frt_memo { height:50%;  } /**/
.frt_idea { height:28%;   } /**/
.frt_prjt { height:18%; } /**/



.frt_title{font-weight:bold;font-size:14px;font-family: 맑은 고딕, Trebuchet MS, Verdana, Geneva, sans-serif;display:inline-block;padding:0px 4px 8px 10px;}
.frt_body{font-weight:bold;font-size:12px;line-height:18px;font-family: 맑은 고딕, Trebuchet MS, Verdana, Geneva, sans-serif; }
.frt_body ul:not(.hov),.frt_body ul div.hov{cursor:pointer;}
.frt_body ul:hover:not(.hov),.frt_body ul div.hov:hover {background-color: moccasin !important;}
.frt_body .nameNdate{float:right;font-weight:normal;padding-right:5px;height:18px;}
/* Internet Explorer */
html {scrollbar-3dLight-Color: #efefef; scrollbar-arrow-color: #dfdfdf; scrollbar-base-color: #efefef; scrollbar-Face-Color: #dfdfdf; scrollbar-Track-Color: #efefef; scrollbar-DarkShadow-Color: #efefef; scrollbar-Highlight-Color: #efefef; scrollbar-Shadow-Color: #efefef}
/* Chrome, Safari용 스크롤 바 */
::-webkit-scrollbar {width: 8px; border: 3px solid #fff; }
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: #efefef}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}

.bg00002{background-color:lightgray;}
.bg00003,bgMna00006{background-color:#E94F51;}
.clr1{color:green;}.clr2{color:blue;}.clr3{color:red;}

.mainBoxTitle { background:#2b9abf; /*border-top-left-radius:5px; border-top-right-radius:5px;*/ line-height:1; height:17px; vertical-align:middle; color:#fff; font-weight:bold; font-size:13px; font-family: "나눔고딕", 맑은 고딕, Verdana, sans-serif; padding:5px 15px 7px 15px!important; position:relative; }
.mainBoxTitle .title  { line-height:17px; vertical-align:middle; }
.mainBoxTitle .btnZone { position:absolute; z-index:10; right:6px; top:6px; }

.line2 {width:330px;height:100%; min-height:500px; float:left; margin:10px 0px 0px 10px; } /* 딜 */
.line1 {width:330px;height:100%;min-height:500px;float:left; margin:10px 0px 0px 10px; } /* 정보정리 */
.line4 {width:330px;height:100%;min-height:500px;float:left; margin:10px 0px 0px 10px; } /* 네트워크 인물추가 */
.line3 {width:330px;height:100%; min-height:500px; float:left; margin:10px 0px 0px 10px; } /* 코멘트 메모		width:351px; */
.line5 {width:330px;height:100%; min-height:500px; float:left; margin:5px; } /* 없는듯 */

.frt_data {width:330px;height:48%;min-height:250px;float:left; margin:10px 0px 0px 10px; } 		/* 정보정리 */
.frt_keyPt{width:330px;height:48%;min-height:250px;float:left; margin:10px 0px 0px 10px; } 		/* 정보정리 > 핵심체크 */
.frt_newNet{width:330px;height:48%;min-height:250px;float:left; margin:10px 0px 0px 10px; } 	/* 네트워크 / 경력 */
.frt_newCst{width:330px;height:48%;min-height:250px;float:left; margin:10px 0px 0px 10px; } 	/* 인물추가 / 수정 */
.frt_cmnt {width:330px;height:48%;min-height:250px;float:left; margin:10px 0px 0px 10px; } 		/* 코멘트 */
.frt_majorMemo{width:330px;height:48%;min-height:250px;float:left; margin:10px 0px 0px 10px; } /* 업무보고 */

.line2 .mainBoxTitle { background:#2b9abf; }
.frt_data  .mainBoxTitle { background:#4cb1c9; }
.frt_keyPt .mainBoxTitle { background:#4cb1c9; }
.frt_newNet .mainBoxTitle { background:#4a9fca; }
.frt_newCst .mainBoxTitle { background:#4a9fca; }
.frt_cmnt 	   .mainBoxTitle { background:#2b9abf; }	/* #3585c8 */
.frt_majorMemo .mainBoxTitle { background:#3585c8; }


.line_all_deal{width:672px;float:left;height:48%;font-family: 맑은 고딕, Trebuchet MS, Verdana, Geneva, sans-serif;}


@media (min-width: 1034px) {
  .line2 {				/* 모바일 버전 메자닌 */
    display: none;
  }
  
  .line_all_deal{		/* PC버전 딜 전체 */
  	display: block;
  }
}
@media (max-width: 1033px) {
  .line2 {				/* 모바일 버전 메자닌 */
    display: block;
  }
  
  .line_all_deal{		/* PC버전 딜 전체 */
  	display: none;
  }
}


/* ajax 로딩 중 아이콘 표시 */
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.1); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
    z-index: 1000000;
}
.wrap-loading div{ /*로딩 이미지*/
    position: fixed;
    top:30%;
    left:40%;
    margin-left: -21px;
    margin-top: -21px;
    z-index: 1000000;
}
.display-none{ /*감추기*/
    display:none;
}








.icon_count_em {
    background: url(../images/work/icon_count_em.gif) no-repeat 2px center;
    padding: 0px 2px 0px 9px;
    border: #c0c5c9 solid 1px;
    border-radius: 2px;
    height: 11px;
    margin-left: 5px;
    font-size: 10px;
    font-family: Tahoma, Geneva, sans-serif;
    line-height: 11px;
    color: #a6adb3;
    vertical-align: middle;
    overflow: hidden;
    display: inline-block;
}
.division_area{
	margin:0px;
	padding:6px;
	border-top:1px solid #bfc9de;
	background: url(../images_m/work/bg_workbtn2.gif) repeat-x 0 0 #dcdcdc;
}
.user_dl{
	margin:0px;
}
.user_dt{
	padding:3px;
	border-bottom:1px dotted #859bca;
	border-top:1px dotted #859bca;
	background:#d6d5d2;
}
.user_dd{
	margin:2px;
}
#divisionDiv{
	border-bottom:1px solid #bfc9de;
}
#divisionDiv div dl dd label {
    display: inline-block;
    margin-left: 4px;
   	color: #838383;
}
.user_p{
	border-bottom:1px dotted #8a8daf;
}

.btn_tab{
	text-align: left;
	border-bottom:1px solid #838588;
}
button {
  color: #FFF;
  background-color: #838588;
  border:0px;
  border-top-left-radius:3px;
  border-top-right-radius:3px;
}
.click_tab{
	background-color: #403333;
}
.click_tab_pop{
	background-color: #403333;
}

.no_read{
	border-bottom:#F69999 dashed 1px;
}

.first_contact_from {
    background: url(../images/work/icon_recive2.gif) no-repeat left center;
    /* position: absolute; */
    left: 3px;
    top: 3px\0/IE8+9;
    padding-left: 15px;
    font-size: 11px;
    font-weight: bold;
    font-family: "돋움";
    color: #252525;
    display: inline-block;
    height: 12px;

}

.first_contact_to {
    background: url(../images/work/icon_send2.gif) no-repeat left center;
    /* position: absolute; */
    left: 3px;
    top: 3px\0/IE8+9;
    padding-left: 15px;
    font-size: 11px;
    font-weight: bold;
    font-family: "돋움";
    color: #252525;
    display: inline-block;
    height: 12px;

}
.fold_down {
    background: url(../images/system/sys_tb_open.png) no-repeat;
    width: 60px;
    height: 21px;
}
.fold_up {
    background: url(../images/system/sys_tb_close.png) no-repeat;
    width: 83px;
    height: 21px;
}

.repleR{
	font-size:11px;
}

</style>



</head>
	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
<c:set var="now" value="<%= new java.util.Date() %>"/>
<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>

<body style="height:calc(98%);margin:2px 0 0 5px; max-width:1370px;">	<!--  -->

<!-- 로딩중 아이콘 -->
<div class="wrap-loading display-none">
    <div><img src="<c:url value='/images/ajax_loading.gif'/>" /></div>
</div>


<input type="hidden" id="pageName" value="MainLogo">
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<form id="downName" name="downName" action="<c:url value='/work/downloadProcess.do' />" method="post">
	<input type="hidden" name="makeName" id="makeName"/>
	<input type="hidden" name="recordCountPerPage" value="0"/>
</form>

<form id="mainPageForm" name="mainPageForm" action="<c:url value='/basic/mainLogo.do' />" method="post"></form>

<!-- 인물정보 팝업위한 폼 -->
<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
	<input type="hidden" name="popupYn" value="Y">
</form>

<!-- 메인화면내 딜 전체 모듈 탭 검색을 통한 재검색 위한 폼 -->
<form id="dealForm" name="dealForm" action="<c:url value='/work/selectWorkAllDeal.do' />" method="post">
	<input type="hidden" name="toMain" id="toMain" value="Y">			<!-- 메인 페이지 여부 -->
	<input type="hidden" name="sorting" id="sorting" value="${TAB}">	<!-- 탭 -->
</form>


<div id="offerDiv"><div id="offerPr" style="display: none;"></div></div>


<!-- ---------------------- 문자 발송 관련 :S ------------------------ -->
<iframe id="iframeSMS" name="iframeSMS" style="display:none"></iframe>
<form id="frmSMS" name="frmSMS" action="https://biz.moashot.com/EXT/URLASP/mssendUTF.asp" method="post" target="iframeSMS">	
	<input type="hidden" name="uid" id="uid" value="synergy"/>
	<input type="hidden" name="pwd" id="pwd" value="00synergy00"/>
	<input type="hidden" name="returnUrl" id="returnUrl" value="http://106.250.177.91:8280/SynergyCus/SMSSendResult.do"/>
	<input type="hidden" name="sendType" id="sendType" value="3"/>			<!-- 3:단문, 5:장문 -->
	<input type="hidden" name="toNumber" id="toNumber" value=""/>			<!-- 수신 번호 -->
	<input type="hidden" name="contents" id="contents" value="테스트문구"/>
	<input type="hidden" name="fromNumber" id="fromNumber" value="025865981"/>
	<input type="hidden" name="startTime" id="startTime" value=""/>
	<input type="hidden" name="indexCode" id="indexCode" value=""/>
	<input type="hidden" name="returnType" id="returnType" value="0"/>
	<input type="hidden" name="nType" id="nType" value="2"/>	
</form>
<!-- ---------------------- 문자 발송 관련 :E ------------------------ -->



	<div class="line2">
		<!-- cb / eb -->
		<div class="frt_cbeb">
	        <div class="mainBoxTitle"><span class="title">CB / EB</span><span class="btnZone"><a href="javascript:goMenuByMoreBtn('${pageContext.request.contextPath}/work/selectWorkAllDeal.do', '');"><img src="../images/main/btn_more_st01.gif" alt="더보기"/></a></span></div>
	        <div class="frt_body">
	            <c:forEach var="ofer" items="${offerList2}" varStatus="status">
	            
	            
	            	<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :S  ================== --%>
					<c:choose>
					<c:when test="${mezzL eq 'Y'}">
						<c:set var="asterDeal" value="N"/>
					</c:when>		<%-- 내가 등록한 딜이 아니면서 --%>		<%--             상장사 이고			 --%>		<%--						메자닌 (CB, EB, BW, RCPS) 이고															 --%>		<%--	진행중 인 건		 --%>		<%--						제안중이 아니고					 --%>
					<c:when test="${ofer.rgId ne userLoginInfo.id and ('A' eq ofer.cpnStts or 'Q' eq ofer.cpnStts) and (ofer.categoryCd eq '00001' or ofer.categoryCd eq '00002' or ofer.categoryCd eq '00003' or ofer.categoryCd eq '00015') and (ofer.progressCd eq '00001' or ofer.progressCd eq '00002')}">		<%--  and (ofer.middleOfferCd ne '00004' and ofer.middleOfferCd ne '00005') --%>
						<c:set var="asterDeal" value="Y"/>	<%-- 별표시(숨김) --%>
					</c:when>
					<c:otherwise>
						<c:set var="asterDeal" value="N"/>
					</c:otherwise>
					</c:choose>
					<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :E  ================== --%>
	            
	            
		            <c:choose>									
					<c:when test="${ofer.rgId ne userLoginInfo.id and ((ofer.categoryCd ne '00008' and ofer.infoLevel lt userLoginInfo.infoLevel)||(ofer.categoryCd eq '00008' and ofer.infoLevel lt userLoginInfo.mnaLevel))}">	<%--of.secretYn eq 'Y' and of.rgId ne userLoginInfo.id --%>
					<!-- 보안등급이 나의 등급보다 높고 내가 등록한게 아니면 안보인다. -->
					</c:when>
					<c:otherwise>
		            
		            <c:if test="${ofer.categoryCd == '00001' || ofer.categoryCd == '00003'}">
		            <ul class="mg0 pd0 hov bg${ofer.progressCd}" style="width:100%;overflow: hidden;">
		                <nobr>
		                    <div class="mg0 hov" style="overflow:hidden;width:204px;float:left;padding:0 0 0 5px;"
		                    <c:choose>
		                        <c:when test="${(ofer.offerCd == '00006') or (ofer.offerCd == '00007') or (ofer.offerCd == '00013') or (ofer.middleOfferCd == '00004') or (ofer.middleOfferCd == '00005') }"> onclick="popUp('${ofer.tmDt}','rcmdComment','','${ofer.sNb}');"</c:when>
		                        <c:otherwise> onclick="statsOfferdivAjax(event,'${ofer.rgNm}',this.parentNode.parentNode,'${ofer.sNb}','${ofer.reportYN}')"</c:otherwise>
		                    </c:choose>
		                    >
		                        <font <c:if test="${((fn:length(ofer.cpnId)!=0) and (fn:length(ofer.cpnId)!=7)) or ((fn:length(ofer.cpnId)==0) and (fn:length(ofer.cstCpnId)!=7))}">color="#084B8A"</c:if>>
		                            -
		                            <c:choose><c:when test="${asterDeal eq 'Y'}">***</c:when><c:otherwise>${ofer.cpnNm}<c:if test="${empty ofer.cpnNm}">${ofer.cstCpnNm}</c:if></c:otherwise></c:choose> 
		                            <%-- ${ofer.cstNm}<c:if test="${empty ofer.cpnNm}">(${ofer.cstCpnNm})</c:if><c:if test="${not empty ofer.cpnNm and not empty ofer.cstCpnNm}">(${ofer.cstCpnNm})</c:if> --%>
		                        </font> 
		                        <font color="green">${ofer.middleOfferNm }<c:if test="${empty ofer.middleOfferNm}"> ${ofer.offerNm}</c:if></font>
		                        <c:if test="${not empty ofer.realNm}"><img src="../images/file/files.png" align="absmiddle"></c:if>
		                    </div>
		                    <div class="nameNdate hov" onclick="checkMainTable(this.parentNode.parentNode,'1','${ofer.sNb}')"><small>&nbsp;X&nbsp;</small></div>
		                    <div class="nameNdate hov" onclick="memoDivNew(event,'${ofer.rgNm}');"><small>${ofer.rgNm} | '${fn:replace(fn:substring(ofer.tmDt,2,10),'-','.')}</small></div>
		                </nobr>
		            </ul>
		            </c:if>
		            
		            </c:otherwise>
		            </c:choose>
	            
	            </c:forEach>
	        </div>
		</div>
		<!-- M & A -->
		<div class="frt_mna">
	        <div class="mainBoxTitle"><span class="title">M &amp; A</span><span class="btnZone"><a href="javascript:goMenuByMoreBtn('${pageContext.request.contextPath}/work/selectWorkAllDeal.do', '00007');"><img src="../images/main/btn_more_st01.gif" alt="더보기"/></a></span></div>
			<div class="frt_body">
				<c:forEach var="ofer" items="${offerList2}" varStatus="status">
				
				<c:choose>									
				<c:when test="${ofer.rgId ne userLoginInfo.id and ((ofer.categoryCd ne '00008' and ofer.infoLevel lt userLoginInfo.infoLevel)||(ofer.categoryCd eq '00008' and ofer.infoLevel lt userLoginInfo.mnaLevel))}">	<%--of.secretYn eq 'Y' and of.rgId ne userLoginInfo.id --%>
				<!-- 보안등급이 나의 등급보다 높고 내가 등록한게 아니면 안보인다. -->
				</c:when>
				<c:otherwise>
				
				<c:if test="${ofer.categoryCd == '00008'}">
				<ul class="mg0 pd0 hov bgMna${ofer.progressCd}" style="width:100%;overflow: hidden;">
					<nobr>
						<div class="mg0 hov" style="overflow:hidden;width:204px;float:left;padding:0 0 0 5px;" 
						<c:choose>
							<c:when test="${(ofer.offerCd == '00006') or (ofer.offerCd == '00007') or (ofer.offerCd == '00013') }"> onclick="popUp('${ofer.tmDt}','rcmdComment','','${ofer.sNb}');"</c:when>
							<c:otherwise> onclick="statsOfferdivAjax(event,'${ofer.rgNm}',this.parentNode.parentNode,'${ofer.sNb}','${ofer.reportYN}')"</c:otherwise>
						</c:choose>
						>
							<font <c:if test="${((fn:length(ofer.cpnId)!=0) and (fn:length(ofer.cpnId)!=7)) or ((fn:length(ofer.cpnId)==0) and (fn:length(ofer.cstCpnId)!=7))}">color="#084B8A"</c:if>>
								- ${ofer.cpnNm}<c:if test="${empty ofer.cpnNm}">${ofer.cstCpnNm}</c:if><%-- ${ofer.cstNm}<c:if test="${empty ofer.cpnNm}">(${ofer.cstCpnNm})</c:if><c:if test="${not empty ofer.cpnNm and not empty ofer.cstCpnNm}">(${ofer.cstCpnNm})</c:if> --%>
							</font> 
							<font color="green">${ofer.middleOfferNm }<c:if test="${empty ofer.middleOfferNm}"> ${ofer.offerNm}</c:if></font>
							<c:if test="${not empty ofer.realNm}"><img src="../images/file/files.png" align="absmiddle"></c:if>
						</div>
						<div class="nameNdate hov" onclick="checkMainTable(this.parentNode.parentNode,'1','${ofer.sNb}')"><small>&nbsp;X&nbsp;</small></div>
						<div class="nameNdate hov" onclick="memoDivNew(event,'${ofer.rgNm}');"><small>${ofer.rgNm} | '${fn:replace(fn:substring(ofer.tmDt,2,10),'-','.')}</small></div>
					</nobr>
				</ul>
				</c:if>
				
				</c:otherwise>
				</c:choose>
				
				</c:forEach>
			</div>
		</div>
		<!-- 프리IPO / 벤처 -->
		<div class="frt_ipo">
			<div class="mainBoxTitle"><span class="title">프리IPO / 벤처</span><span class="btnZone"><a href="javascript:goMenuByMoreBtn('${pageContext.request.contextPath}/work/selectWorkAllDeal.do', '00005');"><img src="../images/main/btn_more_st01.gif" alt="더보기"/></a></span></div>
			<div class="frt_body">
				<c:forEach var="ofer" items="${offerList4}" varStatus="status">
				
				<c:choose>									
				<c:when test="${ofer.rgId ne userLoginInfo.id and ((ofer.categoryCd ne '00008' and ofer.infoLevel lt userLoginInfo.infoLevel)||(ofer.categoryCd eq '00008' and ofer.infoLevel lt userLoginInfo.mnaLevel))}">	<%--of.secretYn eq 'Y' and of.rgId ne userLoginInfo.id --%>
				<!-- 보안등급이 나의 등급보다 높고 내가 등록한게 아니면 안보인다. -->
				</c:when>
				<c:otherwise>
				
				<%-- <c:if test="${ofer.categoryCd == '00012'}"> --%>
				<ul class="mg0 pd0 hov bg${ofer.progressCd}" style="width:100%;overflow: hidden;">
					<nobr>
						<div class="mg0 hov" style="overflow:hidden;width:204px;float:left;padding:0 0 0 5px;" 
						<c:choose>
							<c:when test="${(ofer.offerCd == '00006') or (ofer.offerCd == '00007') or (ofer.offerCd == '00013') }"> onclick="popUp('${ofer.tmDt}','rcmdComment','','${ofer.sNb}');"</c:when>
							<c:otherwise> onclick="statsOfferdivAjax(event,'${ofer.rgNm}',this.parentNode.parentNode,'${ofer.sNb}','${ofer.reportYN}')"</c:otherwise>
						</c:choose>
						>
							<font <c:if test="${((fn:length(ofer.cpnId)!=0) and (fn:length(ofer.cpnId)!=7)) or ((fn:length(ofer.cpnId)==0) and (fn:length(ofer.cstCpnId)!=7))}">color="#084B8A"</c:if>>
								- ${ofer.cpnNm}<c:if test="${empty ofer.cpnNm}">${ofer.cstCpnNm}</c:if><%-- ${ofer.cstNm}<c:if test="${empty ofer.cpnNm}">(${ofer.cstCpnNm})</c:if><c:if test="${not empty ofer.cpnNm and not empty ofer.cstCpnNm}">(${ofer.cstCpnNm})</c:if> --%>
							</font> 
							<font color="green">${ofer.middleOfferNm }<c:if test="${empty ofer.middleOfferNm}"> ${ofer.offerNm}</c:if></font>
							<c:if test="${not empty ofer.realNm}"><img src="../images/file/files.png" align="absmiddle"></c:if>
						</div>
						<div class="nameNdate hov" onclick="checkMainTable(this.parentNode.parentNode,'1','${ofer.sNb}')"><small>&nbsp;X&nbsp;</small></div>
						<div class="nameNdate hov" onclick="memoDivNew(event,'${ofer.rgNm}');"><small>${ofer.rgNm} | '${fn:replace(fn:substring(ofer.tmDt,2,10),'-','.')}</small></div>
					</nobr>
				</ul>
				<%-- </c:if> --%>
				
				</c:otherwise>
				</c:choose>
				
				</c:forEach>
			</div>
		</div>		
	</div>

	
	<!-- 업무일지>정보등록 -->
		<div class="frt_data">
	        <div class="mainBoxTitle"><span class="title">정보정리</span></div>
			<div class="frt_body">
				<c:forEach var="ofer" items="${offerList}" varStatus="status">
				
					<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :S  ================== --%>
					<c:choose>
					<c:when test="${mezzL eq 'Y'}">
						<c:set var="asterDeal" value="N"/>
					</c:when>	<%-- 내가 등록한 정보가 아니면서 --%>	<%-- 상장사 메자닌 딜이 진행중이거나 보류인것 --%>
					<c:when test="${ofer.rgId ne userLoginInfo.id and ofer.cpnStts eq 'A' and ofer.dealIngInfoYn eq 'Y'}">
						<c:set var="asterDeal" value="Y"/>	<%-- 별표시(숨김) --%>
					</c:when>
					<c:otherwise>
						<c:set var="asterDeal" value="N"/>
					</c:otherwise>
					</c:choose>
					<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :E  ================== --%>
				
					<ul class="mg0 pd0 bg${ofer.progressCd}" style="width:100%;overflow: hidden;">
						<nobr>
							<div class="mg0" style="overflow:hidden;width:204px;float:left;padding:0 0 0 5px;" 
							<c:choose>
								<c:when test="${asterDeal eq 'Y'}"><%-- 안 열린다 --%></c:when>
								<c:when test="${(ofer.offerCd == '00006') or (ofer.offerCd == '00007') or (ofer.offerCd == '00013') or (ofer.middleOfferCd == '00004') or (ofer.middleOfferCd == '00005') }"> onclick="popUp('${ofer.tmDt}','rcmdComment','','${ofer.sNb}');"</c:when>
								<c:otherwise> onclick="statsOfferdivAjax(event,'${ofer.rgNm}',this.parentNode.parentNode,'${ofer.sNb}','${ofer.reportYN}')"</c:otherwise>
							</c:choose>
							>
								<font <c:if test="${ofer.cpnStts ne 'A' and ofer.cstCpnStts ne 'A'}">color="#084B8A"</c:if>>
									<c:choose><c:when test="${asterDeal eq 'Y'}">***</c:when><c:otherwise>${ofer.cpnNm}<c:if test="${empty ofer.cpnNm}">${ofer.cstCpnNm}</c:if></c:otherwise></c:choose>									
								</font>
								<font color="green">${ofer.middleOfferNm }<c:if test="${empty ofer.middleOfferNm}"> ${ofer.offerNm}</c:if></font>
								<c:if test="${not empty ofer.realNm}"><img src="../images/file/files.png" align="absmiddle"></c:if>
							</div>
							<div class="nameNdate hov" onclick="checkMainTable(this.parentNode.parentNode,'1','${ofer.sNb}')"><small>&nbsp;X&nbsp;</small></div>
							<div class="nameNdate hov" onclick="memoDivNew(event,'${ofer.rgNm}');"><small>${ofer.rgNm} | '${fn:replace(fn:substring(ofer.tmDt,2,10),'-','.')}</small></div>
						</nobr>
					</ul>
				
				</c:forEach>
			</div>
		</div>
	
	
	<!-- ======================================= 딜 전체 :S =========================================== -->
		<div class="line_all_deal" name="divAllDeal" style="float:left;margin:10px 0px 0px 10px;border: 1px solid gray;background-color:white;overflow-y:hidden;">
			<jsp:include page="./include/allDealMain_INC.jsp"></jsp:include>
		</div>	
	<!-- ======================================= 딜 전체 :E =========================================== -->
	
		<!-- 코멘트 -->
		<div class="frt_cmnt">
	        <div class="mainBoxTitle"><span class="title">코멘트</span></div>
			<div class="frt_body">
				<c:forEach var="rp" items="${replyList}" varStatus="memoS">
				
					<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :S  ================== --%>
					<c:choose>
					<c:when test="${mezzL eq 'Y'}">
						<c:set var="asterDeal" value="N"/>
					</c:when>		<%-- 내가 등록한 딜이 아니면서 --%>		<%--             상장사 이고			 --%>		<%--						메자닌 (CB, EB, BW, RCPS) 이고								 						--%> <%--	진행중, 보류 인 건		 --%>	<%--						제안중이 아니고					 --%>
					<c:when test="${rp.offerRgId ne userLoginInfo.id and ('A' eq rp.cpnStts or 'Q' eq rp.cpnStts) and (rp.categoryCd eq '00001' or rp.categoryCd eq '00002' or rp.categoryCd eq '00003' or rp.categoryCd eq '00015') and (rp.progressCd eq '00001' or rp.progressCd eq '00002')}">	<%-- and (rp.middleOfferCd ne '00004' and rp.middleOfferCd ne '00005') --%>
						<c:set var="asterDeal" value="Y"/>	<%-- 별표시(숨김) --%>
					</c:when>
					<c:otherwise>
						<c:set var="asterDeal" value="N"/>
					</c:otherwise>
					</c:choose>
					<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :E  ================== --%>
				
					<ul class="mg0 pd0" style="width:100%;overflow: hidden;">
						<nobr> 
							<div class="mg0" style="overflow:hidden;width:190px;float:left;padding:0 0 0 5px;" onclick="popUp('${rp.rgDt}','rcmdComment','','${rp.offerSnb}');">
								<font color="navy">
								<c:choose><c:when test="${asterDeal eq 'Y'}">***</c:when><c:otherwise>${rp.cpnNm}</c:otherwise></c:choose>
								</font>
								<font color="green">${rp.categoryNm}</font>
								<font color="#5A5A66" <c:if test="${asterDeal eq 'N'}">title="${rp.comment}"</c:if>>
								<c:choose><c:when test="${asterDeal eq 'Y'}">***</c:when><c:otherwise>${rp.comment}</c:otherwise></c:choose>								
								</font>
							</div>
							
							<div class="mg0 pd0" style="width:12px;float:left;color:#5A5A66;"><c:if test="${fn:length(rp.comment)>=12}">&nbsp;...</c:if></div>
							<div class="nameNdate hov" onclick="checkMainTable(this.parentNode.parentNode,'5','${rp.sNb}')"><small>&nbsp;X&nbsp;</small></div>
							<div class="nameNdate hov" onclick="memoDivNew(event,'${rp.rgNm}');"><small>${rp.rgNm} | '${fn:replace(fn:substring(rp.rgDt,2,10),'-','.')}</small></div>
						</nobr>
					</ul>
					
				</c:forEach>
			</div>
		</div>
		
	<!-- <div class="line1"> -->
		
		<!-- 정보정리>핵심>중요도 3,4,5 -->
		<div class="frt_keyPt">
	    	<div class="mainBoxTitle"><span class="title">정보정리 > 핵심체크</span></div>
			<!-- <span class="frt_title" style="float:right;"><font color="blue">3</font> 〈 <font color="orange">4</font> 〈 <font color="red">5</font></span> -->
			<div class="frt_body">
				<c:forEach var="kp" items="${keyPointList}" varStatus="stat"><c:set var="text" value="${kp.financing}"/>
				<ul class="mg0 pd0 bg${ofer.progressCd}" style="width:100%;overflow:hidden;">
					<nobr>
						<div class="mg0 hov" style="overflow:hidden;width:204px;float:left;padding:0 0 0 5px;" onclick="statsOfferdivAjax(event,'${kp.rgNm}',this.parentNode.parentNode,'${kp.sNb}','${kp.reportYN}')">
							<small style="color:navy;">${kp.categoryNm}</small>
							<font <c:choose>
								<c:when test="${kp.lvCd == '00002'}"> color='navy'</c:when>
								<c:when test="${kp.lvCd == '00003'}"> color='blue'</c:when>
								<c:when test="${kp.lvCd == '00004'}"> color='orange'</c:when>
								<c:when test="${kp.lvCd == '00005'}"> color='red'</c:when>
								<c:otherwise>color='#5A5A66'</c:otherwise></c:choose>
							>${kp.cpnNm}<c:if test="${empty kp.cpnNm}">${kp.cstCpnNm}</c:if> : ${text}</font>
						</div><div class="mg0 pd0 hov" style="width:12px;float:left;color:#5A5A66;"><c:if test="${fn:length(text)>=12}">&nbsp;...</c:if></div>
						<div class="nameNdate hov" onclick="memoDivNew(event,'${kp.rgNm}');"><small>${kp.rgNm} | '${fn:replace(fn:substring(kp.tmDt,2,10),'-','.')}</small></div>
					</nobr>
				</ul>
				</c:forEach>
			</div>
		</div>
	<!-- </div> -->
	<!-- <div class="line4"> -->
		<!-- 네트워크 / 경력 -->
		<div class="frt_newNet">
	        <div class="mainBoxTitle"><span class="title">네트워크 / 경력</span></div>
			<div class="frt_body">
				<c:forEach var="net" items="${netList}"><c:if test="${net.netYn ne '인물수정' and net.netYn ne '인물추가' }">
				<ul class="mg0 pd0 hov" style="width:100%;overflow:hidden;">
					<nobr>
						<div class="mg0" style="overflow:hidden;width:204px;float:left;padding:0 0 0 5px;" onclick="popUp('','rcmdCst','','${net.snb1st}');" title="${net.position1st}"><small>${net.netYn}&nbsp;</small><font color="navy">&nbsp;${net.cstNm1st}&nbsp;</font><small>${net.cpnNm1st}</small></div>
						<div class="nameNdate" onclick="newCstNnetwork(this,'<c:if test="${net.netYn=='인물넷'}">3</c:if><c:if test="${net.netYn=='딜경력' or net.netYn=='법인넷'}">4</c:if>','${net.sNb}')"><small>&nbsp;X&nbsp;</small></div>
						<div class="mg0" style="overflow:hidden;width:204px;float:left;padding:0 0 0 5px;" <c:if test="${not empty net.cstNm2nd}">onclick="popUp('','rcmdCst','','${net.snb2nd}');"</c:if> <c:if test="${empty net.cstNm2nd}">onclick="popUp('','rcmdCpn','','${net.snb2nd}');"</c:if> title="${net.position2nd}"><small style="visibility:hidden;">${net.netYn}&nbsp;</small><font color="navy">&nbsp;${net.cstNm2nd}<c:if test="${empty net.cstNm2nd}">${net.cpnNm2nd}</c:if>&nbsp;</font><c:if test="${not empty net.cstNm2nd}"><small>${net.cpnNm2nd}</small></c:if></div>
						<div class="nameNdate hov" onclick="memoDivNew(event,'${net.rgNm}');"><small>${net.rgNm} | '${fn:replace(fn:substring(net.rgDt,2,10),'-','.')}</small></div>
					</nobr>
				</ul></c:if>
				</c:forEach>
			</div>
		</div>
		<!-- 인물 추가 / 수정 -->
		<div class="frt_newCst">
	        <div class="mainBoxTitle"><span class="title">인물 추가 / 수정</span><span class="btnZone"><a href="javascript:popUpNew('_0','new_person','${cst.cstNm}','${cst.sNb}');"><img src="../images/main/btn_add_st03.gif" alt="추가"/></a><a href="javascript:goMenuPerson();"><img src="../images/main/btn_more_st03.gif" alt="더보기"/></a></span></div>
			<div class="frt_body">
				<c:forEach var="net" items="${netList}">
				<c:if test="${net.netYn eq '인물수정' or net.netYn eq '인물추가' }">
				<c:set var="kind" value="${fn:split(net.netYn,'인물')[0]}"/>
				<ul class="mg0 pd0" style="width:100%;overflow:hidden;">
					<nobr>
						<div class="mg0" onclick="newCstNnetwork(this,'2','${net.sNb}');" title="${net.position1st}" style="overflow:hidden;width:204px;float:left;padding:0 0 0 5px;"><small>${kind}</small><font color="navy">&nbsp;${net.cstNm1st}&nbsp;</font><small>${net.cpnNm1st}</small></div>
						<div class="nameNdate" onclick="newCstNnetwork(this,'2','${net.sNb}','no')"><small>&nbsp;X&nbsp;</small></div>
						<div class="nameNdate hov" onclick="memoDivNew(event,'${net.rgNm}');"><small>${net.rgNm} | '${fn:replace(fn:substring(net.rgDt,2,10),'-','.')}</small></div>
					</nobr>
				</ul>
				</c:if>
				</c:forEach>
			</div>
		</div>		
	<!-- </div> -->
	<!-- <div class="line3"> -->
		
		<!-- 업무보고 -->
		<div class="frt_majorMemo">
	        <div class="mainBoxTitle"><span class="title">업무보고 <a href="javascript:openMemoSearchPop();" style="float:right;"><img src="<c:url value='/images/work/btn_memo_search.jpg' />"  style="vertical-align:bottom;" title="상세보기"></a></span><!-- <span class="btnZone"><a href="javascript:memoDivAjax_new(this,event,'0','0');"><img src="../images/main/btn_add_st04.gif" alt="추가"/></a></span> --></div>
			<div class="frt_body">
				<c:forEach var="memo" items="${memoList}" varStatus="memoS">
				<ul class="mg0 pd0<c:if test="${userLoginInfo.name != memo.cstNm}"> bgRed</c:if>" style="width:100%;overflow:hidden;">
					<nobr>
						<div class="mg0 clr${memo.importance}" style="overflow:hidden;width:200px;float:left;padding:0 0 0 5px;" onclick="memoDivAjax(this,event,'${memo.sNb}','${memo.mainSnb}');" >
							<c:choose>
							<c:when test="${fn:substring(memo.tmDt,0,10) eq cur_day or fn:substring(memo.rgDt,0,10) eq cur_day}">
								<img src="<c:url value='/images/n.gif'/>">
							</c:when>
							<c:otherwise></c:otherwise>
							</c:choose>
							<c:if test="${memo.priv eq 'Y'}"><b><font style="background:#FAAC58;">[S]</font></b> ******</c:if>
							<c:if test="${memo.priv ne 'Y'}">${memo.comment}</c:if>
						</div>
						
						<div class="mg0 pd0" style="width:12px;float:left;color:#5A5A66;"><c:if test="${fn:length(memo.comment)>=20}">&nbsp;...</c:if></div>						
						<div class="nameNdate"><small><c:choose><c:when test="${userLoginInfo.name != memo.cstNm}">${memo.cstNm}</c:when><c:otherwise>내메모</c:otherwise></c:choose> | '${fn:replace(fn:substring(memo.tmDt,2,10),'-','.')}</small></div>
					</nobr>
				</ul>
				</c:forEach>
			</div>
		</div>
	<!-- </div> -->


</body>
</html>