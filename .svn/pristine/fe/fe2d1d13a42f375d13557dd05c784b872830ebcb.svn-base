<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

<link href="<c:url value='/css/new_sis.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/main.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/bootstrap.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/topSis.js'/>" ></script>


<script type="text/javascript">
	$(function(){
		$("ul.main_menu li").hover(function(){
			$(">ul:not(:animated)",this).show();
		},
		function(){
			$(">ul",this).hide();
		});
	});
</script>

<script>function showlayer(id)
   {if(id.style.display == 'none')
       {id.style.display='block';}
       else{id.style.display = 'none';}
   }
</script>


<script>
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
	var soze = parseInt(height-document.getElementById("mainFrame").offsetTop-15)+"px";
	console.debug(soze);
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

function slctMobileMenu(a,b){
	slctMainMenu(a,b);
	
	if($('#main_navi').css('left') == '0px'){
		$('#spotmnBox .spot_etc').animate({left:'-1000px'},"slow");
		$('#main_navi').animate({left:'-1000px'},"slow");
	}else{		
		$('#spotmnBox .spot_etc').animate({left:'0px'},"slow");
		$('#main_navi').animate({left:'0px'},"slow");
	}
}

function slctMobileMenuSis(a,b, sabun){
	slctMainMenuSis(a,b,sabun);
	
	if($('#main_navi').css('left') == '0px'){
		$('#spotmnBox .spot_etc').animate({left:'-1000px'},"slow");
		$('#main_navi').animate({left:'-1000px'},"slow");
	}else{		
		$('#spotmnBox .spot_etc').animate({left:'0px'},"slow");
		$('#main_navi').animate({left:'0px'},"slow");
	}
}

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


//모바일버전 메뉴버튼 클릭
function clickMmenu(){
	if($('#main_navi').css('left') == '0px'){
		$('#spotmnBox .spot_etc').animate({left:'-1000px'},"slow");
		$('#main_navi').animate({left:'-1000px'},"slow");
	}else{		
		$('#spotmnBox .spot_etc').animate({left:'0px'},"slow");
		$('#main_navi').animate({left:'0px'},"slow");
	}
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
<div id="wrap" style="height:800px;">
<form name="movePage000" id="movePage000" method="post"></form>


<!-- header -->
	
		<%-- 
		<div id="loginOut">
			<c:if test="${userLoginInfo == null}">
				<a id="login">로그인</a>
			</c:if>
			<c:if test="${userLoginInfo != null}">
			<div>
				<div id="seaRch">
					<input type="search" id="" onKeyPress="if (event.keyCode==13){ searchProcess(this);event.returnValue=false; }"/><button type="submit" onclick="javascript:searchProcess(this);"><img src="<c:url value='/images/magnify_W.png'/>" style="height:20px;min-width:20px;"></button>
				</div>
			</div>	
			<div>
				<a class="btn glass s" onclick="gotoERP(this,'Erp');" style="color:darkgreen;width:99px;margin-bottom:3px;font-weight:bold;">Inside시스템</a><br/>
				<a class="btn glass s" onclick="gotoERP(this,'Cus');" style="color:peru;width:99px;margin-bottom:3px;font-weight:bold;">고객관리시스템</a><br/>
				<div id="logoutNmodi"><span class="btn s black" style="display:inline-block"><a id="logout">로그아웃</a></span>
				<!-- <span class="btn s red"><a id="modifyUsrInfo">수정</a></span> -->
					<img id="modifyUsrInfo" src="<c:url value='/images/cogwheel.png'/>" style="height:19px;min-width:20px;cursor:pointer;">
				</div>
			</div>
			</c:if>
		</div>

		<div id="logo">
			<a href="<c:url value='' />"><img src="<c:url value='/images/bigLogo.png' />" style="width:120px;height:55px" alt="ib_logo" border="0"></a>
		</div>
		--%>
<div id="header">
        <div id="headerwrap">
            <!--spot메뉴-->
            <div id="spotmnBox">
                <h1 class="logo"><a href="<c:url value='' />"><img src="${pageContext.request.contextPath}/images/common/h1_logo.gif" alt="IBISS" /></a></h1>
				<a href="javascript:clickMmenu();" class="mobile_totalIcon">링크</a>
                <div class="searchBox">
                    <input type="text" placeholder="검색어를 입력하세요" class="input_search" title="시너지 투자자문 사이트내에 통합검색입니다." /><input type="button" class="btn_search" />
                   
                </div>



                <div class="spot_etc">
                     <ul>
						<li><%--<a href="#" class="proPic"><img src="${pageContext.request.contextPath}/images/common/pic_pro.gif" alt="김선희" /></a>--%>
						<!--  <a href="javascript:showlayer(profile)" class="proName">${userLoginInfo.usrNm}</a>  -->
						
						<span class="proName">${userLoginInfo.name}</span>
                        <%--<div id="profile" style="display:none"><img src="${pageContext.request.contextPath}//images/profile.png" usemap="#profileMap" alt="임시" />
                            <map name="profileMap">
                                <area shape="rect" coords="237,200,349,231" href="/deal/mydeal.jsp" alt="">
                                <area shape="rect" coords="119,200,238,231" href="/mypage/incentive.jsp" alt="">
                                <area shape="rect" coords="0,200,120,231" href="/mypage/myinfo.jsp" alt="">
                                <area shape="rect" coords="319,13,347,41" href="javascript:showlayer(profile)" alt="">
                            </map>
                        </div>--%>
                    	</li> 
                        <%--<li><a href="/mypage/alarm.jsp" class="spot_mail"><span class="hide">메일:</span><span class="count">1</span></a></li>
                        <li><a href="/mypage/alarm2.jsp" class="spot_bell"><span class="hide">알림:</span><span class="count">1</span></a></li>
                        <li><a href="javascript:showlayer(favorite)" class="btnfavor"><span class="hide">즐겨찾기:</span></a>
                            <div id="favorite" style="display:none">
                                <div class="favorList">
                                    <span class="arrowup"></span>
                                    <ul>
                                        <li><a href="http://www.krx.co.kr/main/main.jsp" target="_blank"><img src="images/common/img_favor_banner01.jpg" alt="KRX 한국거래소" /></a></li>
                                        <li><a href="http://www.thebell.co.kr/front/free/index.asp" target="_blank"><img src="images/common/img_favor_banner02.jpg" alt="the bell" /></a></li>
                                        <li><a href="http://www.wisereport.co.kr/Default.aspx" target="_blank"><img src="images/common/img_favor_banner03.jpg" alt="WiseReport" /></a></li>
                                        <li><a href="http://www.cretop.com/" target="_blank"><img src="images/common/img_favor_banner04.jpg" alt="CRETOP" /></a></li>
                                        <li><a href="http://ahpekmna.or.kr/" target="_blank"><img src="images/common/img_favor_banner05.jpg" alt="ahpek M&amp;A CENTER" /></a></li>
                                        <li><a href="http://ipostory.com/" target="_blank"><img src="images/common/img_favor_banner06.jpg" alt="IPOstory" /></a></li>
                                        <li><a href="http://globalib.net/member/signin.php" target="_blank"><img src="images/common/img_favor_banner07.jpg" alt="the best deal" /></a></li>
                                        <li><a href="http://www.mna.go.kr/front/main/frontMain.do" target="_blank"><img src="images/common/img_favor_banner08.jpg" alt="중소기업청" /></a></li>
                                        <li><a href="http://www.38.co.kr/" target="_blank"><img src="images/common/img_favor_banner09.jpg" alt="38커뮤니케이션" /></a></li>
                                        <li><a href="http://www.pstock.co.kr/" target="_blank"><img src="images/common/img_favor_banner10.jpg" alt="PSTOCK" /></a></li>
                                        <li><a href="https://dart.fss.or.kr/" target="_blank"><img src="images/common/img_favor_banner11.jpg" alt="DART" /></a></li>
                                    </ul>
                                    <span class="btnclose"><a href="javascript:showlayer(favorite)"><img src="images/common/btn_close.gif" alt="닫기" /></a></span>
                                </div>
                             </div>
                        </li>--%>
                        <li><a id="modifyUsrInfo" href="#" class="btnfixpro"><span class="hide">마이페이지</span></a></li>
                        <li><a id="logout" class="btnlogout"><span class="hide">로그아웃</span></a></li>

                    </ul>
                </div>
            </div>
            <!--// spot메뉴 //-->
            

				<c:if test="${userLoginInfo != null}">
					 <div id="main_navi">
              		  <ul class="main_menu">
              		  <li class="first"></li>        

					<c:forEach var="mMenu" items="${cmmCdMainMenuList}" varStatus="mMenuS"><c:set var="view" value="true"/><c:if test="${userLoginInfo.id eq 'kjw' and mMenuS.count ne 3}"><c:set var="view" value="false"/></c:if>
						<c:if test="${view eq true }">
						<!-- <li id="dCode${mMenu.dTailCd}" class="dropdown cent<c:if test="${mMenuS.count<9}"> blueTitle</c:if><c:if test="${mMenuS.count>8 and mMenuS.count<12}"> managementTitle</c:if><c:if test="${mMenuS.count>11 and mMenuS.count<14}"> pupleTitle</c:if><c:if test="${mMenuS.count eq 14}"> developTitle</c:if>"> -->
						<li class="menwidesize" id="dCode${mMenu.dTailCd}">
							<c:set var="newVal1" value="${mMenu.cdNm}" />
							<c:set var="newVal2" value="${fn:replace(newVal1,'<br/>', '')}" />							
							<a onclick="javascript:slctMobileMenuSis('${mMenu.dTailCd}',this, ${userLoginInfo.sabun});">${newVal2}</a>
						</li></c:if>
					</c:forEach>
					<%-- EIS 메뉴 추가 (공통코드로 안하고 그냥 추가) --%>
					<%-- <c:if test="${userLoginInfo.permission > '00020'  }">   || userLoginInfo.id == 'gjh' --%>
					<script>					
						$('<li class="dropdown cent blueTitle"><a onclick="javascript:slctMainMenu(\'00077\',this);"><font color="#A566FF">E</font><font color="#BD24A9">I</font><font color="#F361A6">S</font></a></li>').insertAfter('#dCode00004');					
					</script>
					<%-- </c:if> --%>
					
						<c:if test="${userLoginInfo.permission > '00020'}">
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
								<!-- <li class="developTitle"><a id="mainNetwork">검색</a></li>-->
						</c:if>
						
					<!-- </ul><ul class="nav navbar-nav navbar-right"> -->
						<!-- <li><a><span class="glyphicon glyphicon-user"></span></a></li> -->
						<c:if test="${userLoginInfo == null}"><li class="cent"><a id="login">로그인</a></li></c:if>
						<c:if test="${userLoginInfo != null}">
							<!-- <li class="cent visible-lg" style="margin-bottom:0px !important;">
								<div><a class="btn glass s" onclick="gotoERP(this,'Erp');" style="color:darkgreen;width:99px;margin-bottom:3px;font-weight:bold;">Inside시스템</a><br/>
								<a class="btn glass s" onclick="gotoERP(this,'Cus');" style="color:peru;width:99px;margin-bottom:3px;font-weight:bold;">고객관리시스템</a><br/></div>
							</li>	 -->
							<li class="cent">
								<%--
								<div id="logoutNmodi">
									<span class="btn s black" style="display:inline-block"><a id="logout">로그아웃</a></span>
								<!-- <span class="btn s red"><a id="modifyUsrInfo">수정</a></span> -->
									<img id="modifyUsrInfo" src="<c:url value='/images/cogwheel.png'/>" style="height:19px;min-width:20px;cursor:pointer;">
									<div class="hidden-xs">
									<span class="btn s" style="display:inline-block"><a onclick="gotoERP(this,'Erp');" style="font-weight:bold;color:darkgreen;">Inside시스템</a></span>
									<c:if test="${userLoginInfo.permission > '00019' or userLoginInfo.id == 'jsh' or userLoginInfo.id == 'ksj'}">
									<span class="btn s" style="display:inline-block"><a onclick="gotoERP(this,'Cus');" style="font-weight:bold;color:darkgreen;">고객관리</a></span>
									</c:if>
									</div>
								</div>
								 --%>

								
							</li>	
						</c:if>
						<li class="last"></li>
					</ul>	
					</div>


				</c:if>
				<!--end nav-collapse -->


			
			
		</div>
    </div>
	
<!-- header -->
	
	
<!-- main contents -->
	<section id="mid">
		<article id="front">
			<div id="content">
				<div id="left" style="display:none;">
					<iframe id="leftFrame" name="leftFrame" onload="resize_iframe()" src="<c:url value='basic/selectLeft.do' />" frameborder="no" scrolling="no"></iframe>
				</div>
				
				<div id="main" style="margin-left:0px;">
					<c:if test="${userLoginInfo == null}"><iframe id="mainFrame" name="content" onload="resize_iframe()" src="<c:url value='login/ibLoginUsr.do'/>" marginwidth="0" marginheight="0" frameborder="no" scrolling-x="no" scrolling-y="no"></iframe></c:if>						
					<c:if test="${userLoginInfo != null}"><iframe id="mainFrame" name="content" onload="resize_iframe()" src="<c:url value='basic/mainLogo.do'/>" marginwidth="0" marginheight="0" frameborder="no" scrolling-x="no" scrolling-y="no"></iframe>
											<%--<%@ include file ="<c:url value='basic/mainSisLogo.jsp' />" %>--%>
					</c:if>
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