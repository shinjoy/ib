<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="ib.cmm.util.sim.service.FileScrty" %>
<%@ page import="ib.cmm.LoginVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
/*String u = request.getRequestURL().toString();
String arrU = new String(u);
if(arrU.indexOf(":8180")>0 && u.startsWith("http://")){
	u = u.replaceAll("http://","https://");
	u = u.replaceAll(":8180",":8181");
	u = u.split("WEB-INF")[0];
	response.sendRedirect(u);
}*/
String u = request.getRequestURL().toString();
String arrU = new String(u);
if(u.startsWith("https://")){
	u = u.replaceAll("https://","http://");
	u = u.replaceAll(":8181",":8180");
	u = u.split("WEB-INF")[0];
	response.sendRedirect(u);
}
%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, height=device-height"> -->
<%-- 
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
--%>
<title>ib system</title>
<link href="<c:url value='/css/bootstrap.min.css?ver=0.1'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/main.css?ver=0.2'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/bootstrap.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/top.js?ver=20170920'/>" ></script>
<script>
var g_chkApp="N";
$(document).ready(function(){
	var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson');
	for (var word in mobileKeyWords){
	    if (navigator.userAgent.indexOf(mobileKeyWords[word]) != -1){
	    	<c:if test="${userLoginInfo == null}">
	        $("#wrap").css("min-width","100%");
	        $("#main").css("min-width","100%");
	        $("#mainTopMenu").css("display","none");
	        </c:if>
	        $("#loginOut span").css("display","none");
	        break;
        }else{
	        $("#wrap").css("min-width","1126px");
	        // $("#main").css("min-width","560px");
	        //$("#mainTopMenu").css("width","70%");
	        $("#loginOut span").css("display","");
        }
	}
	if($(window).width()<1010){
		widthAuto();
		//$("#main").css("min-width","1126px");
	}
	
	
	
	//----------- 메일 읽지 않은 갯수 :S ----------------
	$.ajax({
		type:"POST",
		url:"http://mail.synergynet.co.kr/api/api_mail_get.php",
		data:{"id":"${fn:split(userLoginInfo.email, '@')[0]}",
			  "returntype":"json"},
		timeout:30000,
		dataType: "json",
		cache:false,
		success:function whenSuccess(args) {
			if(args.result > 0){
				$('#no_read_cnt').show();										//보이게 하면서
				$('#no_read_cnt').html(args.result);
				if(args.result>99){
					$('#no_read_cnt').html('99' + '<sup>+</sup>');		//99건 이 넘어갈때 + 추가... 99+
				}
			}
		},
		error:function whenError(x, e) {
			//ajaxErrorAlert(x, e);		//에러여도 alert 은 skip
		}
	});
	//----------- 메일 읽지 않은 갯수 :E ----------------
	
	
	
	$(".zeta-menu>li:has(ul)>a").each( function() {
		$(this).html( $(this).html()+' &or;' );
	});
	$(".zeta-menu ul li:has(ul)")
		.find("a:first")
		.append("<p style='float:right;margin:-3px'>&#9656;</p>");

	
	
	
	
	//드롭다운 목록 보이는 부분 toggle
	$(".dropdownAction").hover(function(){		
		var li = $($(this).find('.dropdownActionLi').get(0));
		li.children('ul').toggle();
	});

	
	//시스템 개선요청 안읽은 건수
	if('${reqNoReadCnt}' > 0)
		$('#request_cnt').show();
	
});



function widthAuto(w){
	if(w!='' && parseInt(w) > 0){
		$("#wrap").css("min-width",w);
		console.log('input width px '+w);
	}else{
		$("#wrap").css("min-width","100%");
		console.log('input width % '+$(window).width());
	}
		
	$("#main").css("min-width","");
	$("#main").css("background-color","white");
}
function reloadpage(){
	location.reload();
	location.href ="<c:url value='/index.do' />";
}

function resize_iframe(){
	var height = document.documentElement.clientHeight || window.innerHeight || document.body.clientHeight;
	document.getElementById("leftFrame").style.height=parseInt(height-document.getElementById("leftFrame").offsetTop-15)+"px"; //하단 여유분 지정
	document.getElementById("mainFrame").style.height=parseInt(height-document.getElementById("mainFrame").offsetTop-15)+"px"; //하단 여유분 지정	
}
window.onresize=resize_iframe;
/* 
	function resizeHeight(id) {
	var the_height = document.getElementById(id).contentWindow.document.body.scrollHeight;
	document.getElementById(id).height = the_height + 30;
}
*/
// window.setTimeout('window.location.reload()',20000);//4*60*60*1000=32400000 4시간마다 리프레쉬

function getTodayTime(){
	var today = new Date();
	
	var h=today.getHours();
	//if(h>12){h-=12;ap='PM';}else{ap='AM';}
	var m=today.getMinutes();
	//var s=today.getSeconds();

	if(h===6){
		if(m===30){
			setTimeout("window.location.reload()",1*60*1000);
		}
		setTimeout("getTodayTime()", 1*60*1000);
	}else{
		setTimeout("getTodayTime()", 40*60*1000);
	}
}
getTodayTime();

function insertStockFirmIbYN(){
	return "N";
}
function mainPadding0(){
	$("#main").css('padding','0');
}
function allMask(){
	$("#wrap").after('<div style="z-index:1999;display: block;" id="mask"></div>');
}
function delMask(){
	$("#mask").remove();
}
function initModal(){
	$("#wrap").after('<style>.md-modal {position: fixed;overflow:auto; top: 50%;left: 50%;width: 50%;height:80%;min-width:580px;max-width: 640px;max-height: 740px;z-index: 2000;visibility: hidden;-webkit-transform: translateX(-50%) translateY(-50%);-moz-transform: translateX(-50%) translateY(-50%);-ms-transform: translateX(-50%) translateY(-50%);transform: translateX(-50%) translateY(-50%);}.md-content {color: #FFF;background: none repeat scroll 0% 0% #E74C3C;position: relative;border-radius: 3px;margin: 0px auto;}.md-content h3 {margin: 0px;padding: 0.4em;text-align: center;font-size: 2.4em;font-weight: 300;opacity: 0.8;background: none repeat scroll 0% 0% rgba(0, 0, 0, 0.1);border-radius: 3px 3px 0px 0px;}.md-show {visibility: visible}</style><div class="md-modal md-effect-1 md-show" id="modal"><div class="md-content"></div></div>');
}
function putModal(arg){
	$('.md-content').append(arg);
	$('.md-content #wrap').attr('style','min-width:auto;height:100%;');
}
function delModal(){
	$("#modal").remove();
	delMask();
}
function searchProcess(th){
	var frm = $('#movePage000');//sender form id
	frm.append('<input type="hidden" id="searCh" name="search"/>');
	$("#searCh").val($(th).parent().find('input').val());
	frm.attr('target','mainFrame').attr('action',"<c:url value='/network/integratedSearch.do' />");
	frm.submit();
	$("#searCh").remove();
}
function dispLeft(){
	return $('#left').css('display');
}
</script>
<style>
#mask {
    display: none;
    background: none repeat scroll 0% 0% #000;
    position: fixed;
    left: 0px;
    top: 0px;
    z-index: 10;
    width: 100%;
    height: 100%;
    opacity: 0.8;
}
#loginOut>div{float:left;}
#seaRch *,#logoutNmodi *{vertical-align:middle;}/*343A41 55606E*/
#logoutNmodi{text-align:left;}
#seaRch input{ background-color:#E8FAFF;border:2px solid #E8FAFF;padding:4px 5px;font-size:12px;width:100px;}
#seaRch button{background-color:#26A8DF;border:2px solid #E8FAFF;padding:2px 3px;margin-left:0px;}
#logout{vertical-align:top;}


.btn_synergymail { background:url("<c:url value='/images/bg_btn_mail2.gif'/>") no-repeat 0 0; width:72px; height:23px; position:relative; display:inline-block; text-decoration:none; vertical-align: middle;}
.btn_synergymail em { visibility:hidden; }
.btn_synergymail .mail_count { display:none; background:#F00; color:#fff; font-size:11px; font-weight:bold; position:absolute; left:58px; top:-10px; border-radius:9px; padding:2px 5px 2px; line-height:12px; vertical-align:middle; text-align:center; }
.btn_synergymail .mail_count sup { line-height:7px; padding-right:1px; }


body { margin: 0; }

.zeta-menu { margin: 0; padding: 0; margin-top : -16px; }
.zeta-menu li {
  	float: left;
  	list-style:none;
  	position: relative;
  	border-top:0px solid silver;
}

.zeta-menu a { 
  	display: block;
  	padding: 10px 20px;
  	text-decoration: none;
}
.zeta-menu ul {
 	background: #eee;
  	border-left: 1px solid silver;
  	border-right: 1px solid silver;
  	border-bottom: 1px solid silver;
  	display: none;
  	padding: 0;
  	position: absolute;
  	left: 0;  
  	top: 13px;
  	width: 120px;
}
.zeta-menu ul li:hover{
	background: #FFBB00;
}
.zeta-menu ul li { float: none; }
.zeta-menu ul li.expand { background: #ddd; }
.zeta-menu ul li.expand a { color: black; }
.zeta-menu ul a { color: black; }
.zeta-menu ul ul { left: 100%; top: 0; }

ul.style_mgmt{	
    font-size: 11px;
    list-style: none;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ccc;
    border: 1px solid rgba(0, 0, 0, .15);
    border-radius: 4px;
    -webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
    box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
}
/* 
.homepg {
    background: url(./images/btn_top_down.gif) no-repeat right center;
    padding-right: 21px;
    padding-left: 10px;
    margin-right: 2px;
    
    font-size: 12px;
    font-weight: bold;
    letter-spacing: -0.05em;
    color: #797979;
    display: inline-block;
    height: 30px;
    line-height: 30px;
    
    font-family: "돋움",Dotum,"굴림",Gulim,arial,sans-serif;
} */


/* #homepage_s_Box { box-shadow: 0 2px 2px 0 rgba(0,0,0,0.16), 0 0 0 1px rgba(0,0,0,0.08); position: absolute; width:150px; top:26px; left:165px; 
	padding:10px 12px 10px 12px; vertical-align:middle; box-sizing:border-box; background:#fff; z-index:1000; }
#homepage_s_Box ul li { clear:both; color:#797979; background:url(./images/bu_arrow_mypage.gif) no-repeat 0 center; 
	padding-left:8px; margin-left:0px; width:100%; height:20px; line-height:20px; font-size:12px;}
#homepage_s_Box ul li a { height:18px; line-height:18px; }
#homepage_s_Box ul li a:hover { text-decoration:underline; }

 */

.req_noread_count {
    display: none;    
    background: #F00;
    color: #fff;
    font-size: 11px;
    font-weight: bold;
    position: absolute;
    left: 46px;
    top: 3px;
    border-radius: 9px;
    padding: 2px 5px 2px;
    line-height: 12px;
    vertical-align: middle;
    text-align: center;
}


/* 사이트 바로가기 */
ol, ul {list-style:none; -webkit-padding-start:0px; font-family:"돋움",Dotum,"굴림",Gulim,arial,sans-serif;}
.Alarm_listbtn { display:inline-block; padding-top:0px; margin-right:12px; }
.Alarm_listbtn:after { display:block; height:0; }
.Alarm_listbtn li { padding-left:5px; margin-left:5px; dispaly:inline-block; background:url(./images/common/div_gnb_div.gif) no-repeat 0 center;  position:relative; height:25px; line-height:25px; }
.Alarm_listbtn li:first-child { background:none; margin-left:0px; }
.Alarm_listbtn li a { font-size:11px; letter-spacing:-0.05em; color:#797979; display:inline-block;  height:25px; line-height:25px; */ }
.Alarm_listbtn li:hover a { color:#398aee;}

.Alarm_listbtn .mypagebtn { background:url(./images/common/btn_spop_down.gif) no-repeat right center; padding-right:19px; margin-right:0px; }
.Alarm_listbtn li #mypage_s_Box { display:none; }
.Alarm_listbtn li:hover #mypage_s_Box { display:block; }

.Alarm_listbtn #mypage_s_Box {box-shadow: 0 2px 2px 0 rgba(0,0,0,0.16), 0 0 0 1px rgba(0,0,0,0.08); position: absolute; width:145px; top:24px; left:0; padding:10px 0px 10px 12px; vertical-align:middle; box-sizing:border-box; background:#fff; z-index:600; border-top:#398aee solid 2px; }
.Alarm_listbtn #mypage_s_Box ul li { color:#797979; background:url(./images/common/bu_arrow_mypage.gif) no-repeat 0 center; padding-left:8px; margin-left:0px; height:22px; line-height:22px; }
.Alarm_listbtn #mypage_s_Box ul li a { height:22px; line-height:22px; color:#797979; text-align:left;}
.Alarm_listbtn #mypage_s_Box ul li a:hover { color:#398aee; text-decoration:underline; text-align:left;}



</style>
</head>

<body>
<!--[if lt IE 9]> <mce:script src="//html5shiv.googlecode.com/svn/trunk/html5.js" mce_src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></mce:script> <![endif]-->
<!-- [if lt IE]>
<script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
<script>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/chrome-frame/1/CFInstall.min.js"></script>
    <load target="http://ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js" targetie="IE" />
    <script type="text/javascript">window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
<![endif]-->
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<input type="hidden" id="rgstSabun" value="<c:out value='${userLoginInfo.sabun}'/>">
<div id="wrap">
<form name="movePage000" id="movePage000" method="post"></form>

<!-- header -->
	<header class="navbar navbar-default navbar-fixed-top" role="navigation">
		
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<!-- <a class="navbar-brand" href="/"><span class="sol-butn sol-butn-bland"></span></a> -->
					<!-- IB로고 -->
					<a class="navbar-brand" href="<c:url value='/' />"><img src="<c:url value='/images/bigLogo.png' />" style="height:50px" alt="ib_logo" border="0"></a>
				</div>
				<div style="height: auto;" class="navbar-collapse collapse" id="gnb">
				<c:if test="${userLoginInfo != null}">
					<ul class="nav navbar-nav">
					
					<c:forEach var="mMenu" items="${cmmCdMainMenuList}" varStatus="mMenuS">
						<c:set var="view" value="true"/>
						
						<!-- 차량일지 권한 : carWorkYn = Y or permission 20 이상, 또는 총무 permission  16 -->
						<c:if test="${mMenu.dTailCd eq '00010'}">
							<c:set var="view" value="false"/>
							<c:if test="${userLoginInfo.carWorkYn eq 'Y' || userLoginInfo.permission > '00020' || userLoginInfo.permission eq '00016'}">
								<c:set var="view" value="true"/>
							</c:if>
						</c:if>
						
						<!-- 통계,지출,자료 권한 : 정사원직전(CFO직원)  제한 -->
						<c:if test="${userLoginInfo.preStaff eq 'Y' and (mMenu.dTailCd eq '00004' or mMenu.dTailCd eq '00009' or mMenu.dTailCd eq '00013')}">
							<c:set var="view" value="false"/>
						</c:if>
						
						<!-- 관계사 권한 : 개발자, 대표님, 천경민이사, 임지연과장, 민재영, 김준연 -->
						<c:if test="${mMenu.dTailCd eq '00020' and userLoginInfo.permission ne '00021' 
										and userLoginInfo.id ne 'gjh' 
										and userLoginInfo.id ne 'ckm' 
										and userLoginInfo.id ne 'jyl' 
										and userLoginInfo.id ne 'mjy'
										and userLoginInfo.id ne 'jyk'
										}">
							<c:set var="view" value="false"/>
						</c:if>
						
						
						<c:if test="${view eq true }">																<!-- 상기 권한에 합당할때 -->
							<li id="dCode${mMenu.dTailCd}" class="dropdown cent ${mMenu.temp}Title">				<!-- 각 메뉴 노출 -->
								<a onclick="javascript:slctMainMenu('${mMenu.dTailCd}',this);">${mMenu.cdNm}</a>
							</li>
						</c:if>
						
						<c:if test="${mMenu.dTailCd eq '00013' and userLoginInfo.permission ge '00021'}">			<!-- 자료('00013') 뒤에 권한에 따라 관리 메뉴 추가 -->
							<li class="dropdown cent developTitle dropdownAction">
								<a>관리 <br/><span class="caret"></span></a>
								<ul class="zeta-menu" style="background:white;">
									<li class="dropdownActionLi" style="z-index:100;">
										<ul class="style_mgmt">
											<li style="text-align:left;"><a href="javascript:slctMainMenu('14',this);" id="boardListMenu"><strong>사용자관리</strong></a></li>
											<li style="text-align:left;"><a href="javascript:slctMainMenu('23',this);" id="boardListMenu"><strong>게시판관리</strong></a></li>
											<li style="text-align:left;"><a href="javascript:slctMainMenu('30',this);" id="boardListMenu"><strong>회의실관리</strong></a></li>
											<li style="text-align:left;"><a href="javascript:slctMainMenu('32',this);" id="boardListMenu"><strong>팝업공지관리</strong></a></li>
										</ul>
									</li>
								</ul> 
							</li>
						</c:if>
						
					</c:forEach>
					
					
					<!-- 직원성과 관련 -->
					<c:if test="${userLoginInfo.permission > '00020' or userLoginInfo.id eq 'gjh'}">
						<li class="dropdown cent eisTitle dropdownAction" >
							<a>개인<br/>성과<br/> <span class="caret"></span></a>
							<ul class="zeta-menu" style="background:white;">
								<li class="dropdownActionLi" style="z-index:100;">
									<ul class="style_mgmt">
										<li style="text-align:left;"><a href="javascript:slctMainMenu('26',this);">설정</a></li>
										<li style="text-align:left;display:none;"><a href="javascript:slctMainMenu('27',this);">개인성과</a></li>
									</ul>
								</li>
							</ul>
						</li>
					</c:if> 
					
					<c:if test="${userLoginInfo.permission > '00020'}">
						<li class="dropdown cent eisTitle dropdownAction" >
							<a>성과<br/>관리<br/> <span class="caret"></span></a>
							<ul class="zeta-menu" style="background:white;">
								<li class="dropdownActionLi" style="z-index:100;">
									<ul class="style_mgmt">
										<li style="text-align:left;"><a href="javascript:slctMainMenu('31',this);">성과</a></li>
										<li style="text-align:left;"><a href="javascript:slctMainMenu('29',this);">설정(구)</a></li>
									</ul>
								</li>
							</ul>
						</li>
					</c:if>
					
					
					<!-- 시너지 보이는 버튼 -->
					<c:if test="${userLoginInfo.division ne 'FIDES' and userLoginInfo.preStaff ne 'Y' and userLoginInfo.permission gt '00001' and userLoginInfo.srtCd gt '00000'}">
					
					<!-- 업무요청 메뉴 : 개발자, 구대표님, 경영지원팀 -->
					<li class="dropdown cent eisTitle">
						<a href="javascript:slctMainMenu('28',this);">업무<br/>요청</a>
					</li>
					
					
					<!-- 게시판 -->
					<li class="dropdown cent eisTitle">
						<a href="javascript:slctMainMenu('130',this);" id="boardAtag">시스템<br>개선요청
							<span class="req_noread_count" id="request_cnt" style="z-index:10000;">${reqNoReadCnt}</span>
						</a>
						<!-- <a href="javascript:slctMainMenu('25',this);" id="boardAtag">보고서</a> -->
						<%-- <ul class="zeta-menu" id="boardUltag">
							<li style="z-index:5;" id="boardLitag">
								<ul>
									<li class=""><a href="javascript:slctMainMenu('22',this);" id="boardListMenu"><strong>게시판</strong></a></li>
									<li class=""><a href="javascript:slctMainMenu('24',this);" id="boardListMenu"><strong>보고서</strong></a></li>
									<li class=""><a href="javascript:slctMainMenu('25',this);" id="boardListMenu"><strong>주간회의록</strong></a></li>
									<li class=""><a href="javascript:slctMainMenu('23',this);" id="boardManagerMenu"><strong>관리</strong></a></li>
								</ul>
							</li>
						</ul>--%>
					</li>
					
					</c:if>
					
					
					<!-- 개발 관련...현재 사용 X -->
					<c:if test="${userLoginInfo.permission > '00020' and false}">
						<li class="dropdown cent developTitle" style="z-index:5;">
							<a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">개발 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class=""><a id="mainLog">L<small>OG</small></a></li>
								<li class=""><a id="mainLogGraph">Graph</a></li>
								<li class=""><a id="mainMonthly">Monthly</a></li>
								<li class=""><a id="mainNetwork">Network</a></li>
								<li class=""><a id="mainPersonnel" >근태</a></li>
								<li class=""><a id="selfImprovement">자기계발</a></li>
								<li class=""><a id="mainBook">추천도서</a></li>
								<li class=""><span class="btn s"><a onclick="gotoERP(this,'Cus');" style="font-weight:bold;color:peru;">고객관리시스템</a></span></li>
							</ul>
						</li>
					</c:if>
					
					
					<!-- 시너지 보이는 검색란(버튼) -->
					<c:if test="${userLoginInfo.division != 'FIDES'}">	
					<li class="cent">
						<div id="seaRch"><input type="search" id="" style="width:70px;" onKeyPress="if (event.keyCode==13){ searchProcess(this);event.returnValue=false; }"/><button type="submit" onclick="javascript:searchProcess(this);"><img src="<c:url value='/images/magnify_W.png'/>" style="height:20px;min-width:20px;"></button></div>
					</li>
					</c:if>
					
					<c:if test="${userLoginInfo ne null}">							
						<li class="">
							 <div id="logoutNmodi" <c:if test="${userLoginInfo.division == 'FIDES'}">style="padding-left:20px;padding-top:8px;"</c:if>>	<!-- FIDES 스타일 차별 -->
							  
								<a id="logout"><img class="btn" src="<c:url value='/images/btn_logout.gif'/>" style="height:24px;min-width:66px;cursor:pointer;"></a>								
								<img id="modifyUsrInfo" src="<c:url value='/images/btn_myinfoedit.gif'/>" style="height:24px;min-width:93px;cursor:pointer;">
								
								<!-- 시너지 보이는 버튼 -->
								<c:if test="${userLoginInfo.division ne 'FIDES' and userLoginInfo.preStaff ne 'Y' and userLoginInfo.permission gt '00001' and userLoginInfo.srtCd gt '00000'}">
								
								
								<!-- 사이트 바로가기:S -->
								<span>
								<ul class="Alarm_listbtn">
									<li>
										<a href="#" class="mypagebtn">사이트 바로가기</a>
							            <div id="mypage_s_Box">
							               	<ul>
												<li><a href="http://www.synergypartners.kr/" target="_blank">시너지파트너스</a></li>
						               			<li><a href="http://www.synergynet.co.kr/" target="_blank">시너지넷</a></li>
						               			<li><a href="http://www.synergyasset.kr/" target="_blank">시너지투자자문</a></li>
						               			<li><a href="http://www.synergyib.co.kr/" target="_blank">시너지IB투자</a></li>
						               			<li><a href="http://report.synergynet.co.kr/main/main.do" target="_blank">등용문</a></li>							               		
						               			<li><a href="<c:url value='/mobileInfo.do' />" target="_blank">IB모바일</a></li>
							               	</ul>
							            </div>
									</li>
								</ul>
								</span>
								<!-- 사이트 바로가기:E -->
								
								
								<div style="padding-top:4px;">
								
								<!-- <span class="hidden-xs"> -->
								<a onclick="gotoERP(this,'Erp');" style="font-weight:bold;color:darkgreen;"><img class="btn" src="<c:url value='/images/btn_inside.gif'/>" style="height:24px;min-width:79px;cursor:pointer;"></a>
								<%-- <c:if test="${userLoginInfo.permission > '00019' or userLoginInfo.id == 'jsh' or userLoginInfo.id == 'ljm'}">
								<a onclick="gotoERP(this,'Cus');" style="font-weight:bold;color:darkgreen;"><img class="btn" src="<c:url value='/images/btn_customer.gif'/>" style="height:24px;min-width:86px;cursor:pointer;"></a>
								</c:if> --%>
								<!-- </span> -->

								<a href="http://mail.synergynet.co.kr" target="_blank" class="btn_synergymail"><em>mail</em><span class="mail_count" id="no_read_cnt" style="z-index:10000;"></span></a>
								
								<c:if test="${userLoginInfo.id eq 'gjh' 
											or userLoginInfo.id eq 'ckm'
											or userLoginInfo.id eq 'jyk'
											or userLoginInfo.deptId eq '8'
											
											or userLoginInfo.id eq 'cas'
											or userLoginInfo.id eq 'yis'
											or userLoginInfo.id eq 'bcw'
											or userLoginInfo.id eq 'pjm'
											or userLoginInfo.id eq 'sml'											
											}"> <!-- PASS 바로가기버튼 : 구대표님, 천경민이사, 김준연과장, 시스템기획팀 -->
								<a href="javascript:gotoPASS('<%=FileScrty.encode(((LoginVO)session.getAttribute("userLoginInfo")).getId())%>');" style="padding-left:2px;z-index:-1;"><img class="btn" src="<c:url value='/images/btn_pass.png'/>" style="height:23px;min-width:87px;cursor:pointer;"></a>
								</c:if>
								</div>
								
								</c:if>
							</div>
						</li>
					</c:if>
					</ul>
				</c:if>
				</div><!--end nav-collapse -->
			</div>
	</header>
<!-- header -->
	<div class="clear" id="bar_0"></div>
	
<!-- main contents -->
	<section id="mid">
		<article id="front">
			<div id="content">
			
				<!-- 왼쪽메뉴 -->
				<div id="left" style="display:none;">
					<iframe id="leftFrame" name="leftFrame" onload="resize_iframe()" src="<c:url value='basic/selectLeft.do' />" frameborder="no" scrolling="no"></iframe>
				</div>
			
				<!-- 메인내용 -->
				<div id="main" style="margin-left:0px;">
					<iframe id="mainFrame" name="mainFrame" onload="resize_iframe()" src="<c:url value='basic/mainLogo.do'/>" marginwidth="0" marginheight="0" frameborder="no" scrolling-x="no"></iframe>
				</div>
			
				<div class="clear"></div>
			</div>
		</article>
	</section>
<!-- main contents -->
<!-- footer -->
	<footer>
	</footer>
<!-- footer -->
</div>
</body>
</html>