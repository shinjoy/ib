<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Synergy Mobile Info</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="시너지 그룹, 시너지 업무관리 시스템, 시너지 헬퍼, Synergy Helper" />
<meta name="description" content="시너지 그룹 업무관리 시스템 모바일" />
<meta name="copyright" content="Copyright © 2016 Synergy Group. All rights reserved" />
<meta name="author" content="㈜시너지 자산운용 02-586-5982" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">

<script>var contextRoot="${pageContext.request.contextPath}";</script>

<!--====== STYLESHEETS ======-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css_m/land/normalize.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css_m/land/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css_m/land/owl.carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css_m/land/jquery-responsiveGallery.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css_m/land/slick.css">
<link href="${pageContext.request.contextPath}/css_m/land/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css_m/land/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/m/swiper/swiper.min.css">		


<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<script src="${pageContext.request.contextPath}/js/m/swiper/swiper.min.js"></script>

<!--====== MAIN STYLESHEETS ======-->
<link href="${pageContext.request.contextPath}/css_m/land/info_style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css_m/land/responsive.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/js/land/modernizr-2.8.3.min.js"></script>


<!--====== 추가SCRIPTS JS ======-->
<script src="${pageContext.request.contextPath}/js/land/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/land/bootstrap.min.js"></script>

<!--====== PLUGINS JS ======-->
<script src="${pageContext.request.contextPath}/js/land/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/land/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/land/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/land/jquery.responsiveGallery.js"></script>
<script src="${pageContext.request.contextPath}/js/land/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/js/land/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/js/land/contact-form.js"></script>
<script src="${pageContext.request.contextPath}/js/land/jquery.sticky.js"></script>
<script src="${pageContext.request.contextPath}/js/land/jquery.ajaxchimp.js"></script>


<!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<script>
$(document).ready(function(){

	 var workSwiper = new Swiper('.work_swiper', {
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
      	autoplay: 2500,
        autoplayDisableOnInteraction: false 
    });
	 
	 var mainSwiper = new Swiper('.main_swiper', {
	        paginationClickable: true,
	        direction: 'vertical',
	        spaceBetween: 30,
	        centeredSlides: true,
	        slidesPerView: 1,
	        mousewheelControl: true,
	      	autoplay: 2500,
	        autoplayDisableOnInteraction: false 
	 });
	 
	 var workDiarySwiper = new Swiper('.workDiary_swiper', {
		 	pagination: '.swiper-pagination',
	     	paginationClickable: true,
	        spaceBetween: 30,
	        centeredSlides: true,
	        slidesPerView: 1,
	        
	 });
	 var scheduleSwiper = new Swiper('.schedule_swiper', {
		 	pagination: '.swiper-pagination',
	        nextButton: '.swiper-button-next',
	        prevButton: '.swiper-button-prev',
	        paginationClickable: true,
	        spaceBetween: 30,
	        centeredSlides: true,
	        slidesPerView: 1,
	       
	 });
	 var memoSwiper = new Swiper('.memo_swiper', {
		 	pagination: '.swiper-pagination',
	        nextButton: '.swiper-button-next',
	        prevButton: '.swiper-button-prev',
	        paginationClickable: true,
	        spaceBetween: 30,
	        centeredSlides: true,
	        slidesPerView: 1,
	        
	 });
	 
		 
});

//sms 전송
function openSmsPop(){
	window.open(contextRoot+'/sendSmsToMobile.do',"aaa","width=400 height=220 menubar=no status=no");

}

function downLoadApk(type){
	
	if(type == 'Android') location.href = contextRoot+"/file/apkFileDown.do";
	//else location.href = '';
	
}

</script>
</head>


	<body>
	
		<!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

    <!--- PRELOADER -->
    <div class="preeloader">
        <div class="preloader-spinner"></div>
    </div>

    <!--SCROLL TO TOP-->
    <a href="#home" class="scrolltotop"><i class="fa fa-long-arrow-up"></i></a>

    <!--START TOP AREA-->
    <header class="top-area" id="home">
        <div class="top-area-bg"></div>
        <div class="header-top-area">
            <!--MAINMENU AREA-->
            <div class="mainmenu-area" id="mainmenu-area">
                <div class="mainmenu-area-bg"></div>
                <nav class="navbar">
                    <div class="container">
                        <div class="navbar-header">
                            <button class="collapsed navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-example-js-navbar-scrollspy">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a href="#home" class="navbar-brand"><img src="${pageContext.request.contextPath}/images_m/land/logo.png" alt="logo"></a>
                        </div>
                        <div class="collapse navbar-collapse bs-example-js-navbar-scrollspy">
                            <ul id="nav" class="nav navbar-nav cl-effect-11">
                                <li><a href="#home">Download</a></li>
                                <li><a href="#about">About</a></li>
                                <li><a href="#features">Features</a></li>
                                <li><a href="#screenshot">Screenshort</a></li>
                                <!--<li><a href="#download">Download</a></li>-->
                                <!-- <li><a href="#contact">Contact</a></li> -->
                                <li><a href="#team">Team</a></li>
                                <li><a href="#pricing">Plan</a></li>
                                <li><a href="#pricing">guide</a><span class="btn_guideGo" onClick="javascript:void(window.open('${pageContext.request.contextPath}/iosGuide.do', 'newcr','resizable=no,width=800,height=780,scrollbars=yes'));"><em>메뉴얼가이드</em></span></li>
                            </ul>
                           
                        </div>
                    </div>
                </nav>
            </div>
            <!--END MAINMENU AREA END-->
        </div>
        <div class="welcome-text-area">
            <div class="welcome-img hidden-sm hidden-xs">
                <div class="welcome-mockup-img animated wow fadeInUp"><img src="${pageContext.request.contextPath}/images_m/land/slider/slide_1.png" alt=""></div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-7 col-lg-7 col-md-offset-5 col-lg-offset-5 col-sm-12 col-xs-12">
                        <div class="welcome-text">
                            <h3>Synergy Group</h3>
                            <h1>IBsystem <span>Mobile</span></h1>
                            <p>모바일에서도 IBsystem을 편리하게 이용할수 있도록 시스템기획팀에서 개선하고 있습니다. 
                            개발순서는 업무일지 &gt; 딜 &gt; 네트워크 순으로 작업예정이며 먼저 업무일지가 완료되어 모바일 버전1.0을 오픈하였습니다. 
                            많은 이용 부탁드리겠습니다. 설치는 핸드폰에서만 됩니다.</p>
                            <p class="point" onclick="openSmsPop();"><i class="fa fa-mobile"></i> 핸드폰으로 APP설치 URL보내기</p>
                            <div class="home-button">
                            	<a href="itms-services://?action=download-manifest&url=https://dl.dropboxusercontent.com/s/sdyfcn40yyj9i7n/SYNERGY_IB.plist">
                            		<i class="fa fa-apple"></i>IOS
                            		<span class="iosver_des">IOS 8.0이상</span>
                            	</a>
                                <a href="javascript:downLoadApk('Android');">
                                	<i class="fa fa-android"></i>Android
                                	<span class="andver_des">Android 6.0이상</span>
                                </a>
                            </div>
                           	<p class="ver_notice">※ Android 6.0이상 / IOS 8.0이상 (이하버전시 설치가 안되거나 앱이 종료됨)</br>
                           	<a href="javascript:void(window.open('${pageContext.request.contextPath}/iosGuide.do', 'newcr','resizable=no,width=800,height=780,scrollbars=yes'));">설치 및 사용가이드</a>
                           	</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!--END TOP AREA-->

    <!--ABOUT AREA-->
    <section class="about-area  padding-top" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 col-sm-12 col-xs-12">
                    <div class="area-title text-center wow fadeIn">
                        <h2>IBsystem Mobile <span>About</span></h2>
                        <div class="area-title-after"><span class="area-icon"><i class="fa fa-angle-right"></i></span></div>
                        <p>기존 IBsystem의 아이디와 비번을 입력하시면 모바일 첫 메인화면으로 이동됩니다. 각 해당메뉴에 대한 설명을 참고하여</br> 
                        메인화면에서 원하는 메뉴로 이동하여 편리하게 사용하시기 바랍니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-7 col-lg-7 col-sm-6 col-xs-12">
                    <div class="about-left-image">
                        <div class="about-img-one hidden-sm hidden-xs animated wow fadeInLeft" data-wow-delay="0.3s">
                            <img src="${pageContext.request.contextPath}/images_m/land/about/mobile_big.png" alt="">
                            <div class="bottome-shadow"></div>
                        </div>
                        <div class="about-img-two hidden-xs animated wow fadeInLeft" data-wow-offset="10">
                            <img src="${pageContext.request.contextPath}/images_m/land/about/mobile_small.png" alt="">
                            <div class="bottome-shadow"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-lg-5 col-sm-6 col-xs-12">
                    <div class="single-about wow fadeIn">
                        <div class="about-icon"><i class="fa fa-calendar-check-o"></i></div>
                        <h3>업무일지</h3>
                        <p>업무, 일정, 메모를 한곳에서 볼수 있게 UI 개선하였습니다. 달력형과 목록형 두가지 타입을 취향에 맞게 선택가능합니다.</p>
                    </div>
                    <div class="single-about wow fadeIn">
                        <div class="about-icon"><i class="fa fa-car"></i></div>
                        <h3>차량운행등록</h3>
                        <p>차량을 사용한후 이동거리를 입력할때 혹시 거리를 외워서 입력하고 계셨나요? 이제는 차안에서 모바일로 손쉽게 입력가능합니다.</p>
                    </div>
                    <div class="single-about wow fadeIn">
                        <div class="about-icon"><i class="fa fa-users"></i></div>
                        <h3>회의실예약</h3>
                        <p>회의실 예약은 PC/모바일 둘다 가능합니다. 이제 밖에서도 회의실 예약을 해보세요. 일정등록이 쉬워집니다.</p>
                    </div>
                    <div class="single-about wow fadeIn">
                        <div class="about-icon"><i class="fa fa-list-alt"></i></div>
                        <h3>직원전화</h3>
                        <p>시너지그룹에 속한 모든 직원의 연락처가 등록되어 있습니다. 신규입사자의 연락처나 저장이 안된 직원의 연락처를 확인할수 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--ABOUT AREA END-->
    <!--FEATURES AREA-->
    <section class="features-area section-padding" id="features">
        <div class="features-bg"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 col-sm-12 col-xs-12">
                    <div class="area-title text-center wow fadeIn">
                        <h2>IBsystem Mobile <span>Features</span></h2>
                        <div class="area-title-after"><span class="area-icon"><i class="fa fa-angle-right"></i></span></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 col-lg-5 col-sm-6 col-xs-12">
                    <div class="single-features wow fadeIn">
                        <div class="features-border wow fadeIn" data-wow-delay=".6s"></div>
                        <div class="features-icon"><i class="fa fa-map-o"></i></div>
                        <h3>Navigation</h3>
                        <p>상단의 Navigation에 현재의 화면위치와 항상 이전화면으로 넘어갈수 있는 버튼 및  주요 기능이 숨어있습니다.</p>
                    </div>
                    <div class="single-features wow fadeIn">
                        <div class="features-border wow fadeIn" data-wow-delay=".6s"></div>
                        <div class="features-icon"><i class="fa fa-calendar"></i></div>
                        <h3>달력형 UI추가</h3>
                        <p>업무일지에서 달력UI를 추가하여 날짜 이동이 수월하며 달력을 위로 올려 업무확인 영역을  넓게해서 보실수 있습니다.</p>
                    </div>
                    <div class="single-features wow fadeIn">
                        <div class="features-border wow fadeIn" data-wow-delay=".6s"></div>
                        <div class="features-icon"><i class="fa fa-leaf"></i></div>
                        <h3>탭버튼활용</h3>
                        <p>탭버튼을 활용하여 내 업무를 한번에 업무별로 모아서 볼수 있습니다. 또한 하단에 있는 +버튼으로 업무등록이 용이합니다.</p>
                    </div>
                    <div class="single-features wow fadeIn">
                        <div class="features-border wow fadeIn" data-wow-delay=".6s"></div>
                        <div class="features-icon"><i class="fa fa-desktop"></i></div>
                        <h3>이전 모바일화면</h3>
                        <p>아직 생성되지 않은 IBsystem기능들은  기존의 PC버전으로 들어가셔서 동일하게 </br>사용가능합니다.</p>
                    </div>
                </div>
                <div class="col-md-7 col-lg-7 col-sm-6 col-xs-12">
                    <div class="features-right-image animated wow fadeInRight">
                        <div class="features-img"><img src="${pageContext.request.contextPath}/images_m/land/features/features.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--FEATURES AREA END-->

    <!--CLIENT AREA-->
    <!-- <section class="client-area section-padding wow fadeIn" id="client">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 col-sm-12 col-xs-12">
                    <div class="area-title text-center">
                        <h2>The best techThe best <span>technology partners</span></h2>
                        <p>모바일의 전체 개선사항은 IBsystem에 기반을 두고 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!--CLIENT AREA END-->

    <!--SCREENSHOT AREA-->
    <section class="screenshot-area section-padding" id="screenshot">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 col-sm-12 col-xs-12">
                    <div class="area-title text-center wow fadeIn">
                        <h2>IBsystem Mobile <span>Guide</span></h2>
                        <div class="area-title-after"><span class="area-icon"><i class="fa fa-angle-right"></i></span></div>
                        <p>IBsystem 모바일 버전 각 화면 캡쳐입니다. 업무일지는 달력스타일을 신규추가하여 좀더 편리하게 이용가능하며, 일정등록 및 업무메모까지 새롭게 변경되었습니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 wow fadeIn ">
                    <div class="screenshot-slider">
                        <ul class="responsiveGallery-wrapper">
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/1.jpg" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/2.jpg" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/3.jpg" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/4.jpg" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/5.jpg" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/6.jpg" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/7.jpg" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/8.jpg" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/9.PNG" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/10.PNG" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/11.PNG" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/12.jpg" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/13.jpg" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/14.jpg" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/15.jpg" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/16.jpg" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/17.jpg" alt="">
                            </li>
                            <li class="responsiveGallery-item">
                                <img src="${pageContext.request.contextPath}/images_m/land/screenshot/18.jpg" alt="">
                            </li>
                        </ul>
                    </div>
                    <div class="responsive-slider-button">
                        <span class="responsiveGallery-btn responsiveGallery-btn_prev"><i class="fa fa-angle-left"></i></span>
                        <span class="responsiveGallery-btn responsiveGallery-btn_next"><i class="fa fa-angle-right"></i></span>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--SCREENSHOT AREA END-->

    <!--ABOUT VIDEO AREA-->
    <section class="about-video-area wow fadeIn padding-bottom pdb190" id="video">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 col-sm-12 col-xs-12">
                    <div class="area-title text-center mgb168">
                        <h2>IBsystem Mobile <span>Guide</span></h2>
                        <div class="area-title-after"><span class="area-icon"><i class="fa fa-angle-right"></i></span></div>
                        <p>IBsystem 모바일 버전 각 화면 캡쳐입니다. 변경된 업무일지, 일정, 메모 UI와 기능을 사용해보세요.</p>
                    </div>
                </div>
                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                	<div class="iphone_cover"></div>
                    <div class="video-area">
                        <video id="bgvid" loop>
                            <source src="/folder/synergy.mov" type="video/mp4">
                        </video>
                        <button><i class="fa fa-play wow fadeIn"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--ABOUT VIDEO AREA END-->
    
    <!--TEAM AREA-->
    <section class="download-area team-area padding-top padding-bottom" id="team">
    	<div class="download-area-bg"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 col-sm-12 col-xs-12">
                    <div class="area-title text-center wow fadeIn">
                        <h2>Made By <span>Professionals</span></h2>
                        <div class="area-title-after"><span class="area-icon"><i class="fa fa-angle-right"></i></span></div>
                        <p>모바일 개발을 담당하고 있는 담당자들입니다. 모바일에 좋은 아이디어나 요구사항을 편하게 말씀해 주세요~!</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-lg-4 col-sm-4 col-xs-12">
                    <div class="single-team wow fadeIn">
                        <div class="member-name-and-image">
                            <div class="member-img"><img src="${pageContext.request.contextPath}/images_m/land/team/1.jpg" alt=""></div>
                            <div class="member-social-bookmark">
                                <ul>
                                    <li><a href="mailto:jipark@synergymna.com"><i class="fa fa-envelope"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="member-details">
                            <h3>Jeong-in Park</h3>
                            <p class="member-title">Chief Manager / Designer</p>
                            <p>디자인 및 기획을 진행하였습니다. 모바일관련 기능개선 및 요구사항을 보내주세요~!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-lg-4 col-sm-4 col-xs-12">
                    <div class="single-team wow fadeIn">
                        <div class="member-name-and-image">
                            <div class="member-img"><img src="${pageContext.request.contextPath}/images_m/land/team/2.jpg" alt=""></div>
                            <div class="member-social-bookmark">
                                <ul>
                                    <li><a href="mailto:qwe6867@naver.com"><i class="fa fa-envelope"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="member-details">
                            <h3>Duck-soo kim</h3>
                            <p class="member-title">IOS Developer</p>
                            <p>IOS관련 개발담당자 입니다. 아이폰 사용시 발생하는 오류에 대해 말씀해주세요~!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-lg-4 col-sm-4 col-xs-12">
                    <div class="single-team wow fadeIn">
                        <div class="member-name-and-image">
                            <div class="member-img"><img src="${pageContext.request.contextPath}/images_m/land/team/3.jpg" alt=""></div>
                            <div class="member-social-bookmark">
                                <ul>
                                    <li><a href="mailto:sjy@synergynet.co.kr"><i class="fa fa-envelope"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="member-details">
                            <h3>Joy Shin</h3>
                            <p class="member-title">Server/Android Developer</p>
                            <p>Server 및 Android 개발담당자 입니다. Android 사용시 발생하는 오류에 대해 말씀해주세요~!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--TEAM AREA END-->
    
    <!--PRICEING AREA-->
    <section class="priceing-area section-padding" id="pricing">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 col-sm-12 col-xs-12">
                    <div class="area-title text-center wow fadeIn">
                        <h2>Mobile Team <span>Work Plan</span></h2>
                        <div class="area-title-after"><span class="area-icon"><i class="fa fa-angle-right"></i></span></div>
                        <p>모바일 팀의 앞으로 개발진행 계획입니다. 좋은 아이디어나 혹은 원하는 요구사항을 말씀해주시면 개발자들과 논의하여 반영하도록 하겠습니다. 단 다른업무의 지시가 있을경우 일정은 변경될수 있습니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
                    <div class="single-price finish text-center wow fadeIn">
                        <div class="price-top-title">
                            <div class="price-title">
                                <div class="price-rate">
                                    <p>1차개발</p>
                                    <h3><span>ver</span>1.0</h3>
                                </div>
                            </div>
                        </div>
                        <div class="price-details">
                            <ul>
                                <li><i class="fa fa-check"></i> 업무일지 (업무, 일정, 메모)</li>
                                <li><i class="fa fa-check"></i> 메모통합검색</li>
                                <li><i class="fa fa-check"></i> 차량운행입력</li>
                                <li><i class="fa fa-check"></i> 회의실예약</li>
                                <li><i class="fa fa-check"></i> 직원번호</li>
                            </ul>
                        </div>
                        <div class="price-button">
                            <a href="#">7/24 (완료배포)</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
                    <div class="single-price text-center wow fadeIn">
                        <div class="price-top-title">
                            <div class="price-title">
                                <div class="price-rate">
                                    <p>2차개발</p>
                                    <h3><span>ver</span>2.0</h3>
                                </div>
                            </div>
                        </div>
                        <div class="price-details">
                            <ul>
                                <li><i class="fa fa-check"></i> 딜 등록</li>
                                <li><i class="fa fa-check"></i> 딜 상세화면</li>
                                <li><i class="fa fa-check"></i> 코멘트목록</li>
                                <li><i class="fa fa-check"></i> PUSH 알림기능</li>
                                <li><i class="fa fa-check"></i> 알림설정관리</li>
                            </ul>
                        </div>
                        <div class="price-button">
                            <a href="#">9/11 (완료예정)</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
                    <div class="single-price text-center wow fadeIn">
                        <div class="price-top-title">
                            <div class="price-title">
                                <div class="price-rate">
                                    <p>3차개발</p>
                                    <h3><span>ver</span>3.0</h3>
                                </div>
                            </div>
                        </div>
                        <div class="price-details">
                            <ul>
                                <li><i class="fa fa-check"></i> 네트워크 통합검색</li>
                                <li><i class="fa fa-check"></i> 인물/회사 등록화면</li>
                                <li><i class="fa fa-check"></i> 인물/회사 상세화면</li>
                                <li><i class="fa fa-check"></i> today 미팅목록</li>
                                <li><i class="fa fa-check"></i> 그룹별관리</li>
                            </ul>
                        </div>
                        <div class="price-button">
                            <a href="#">10/30 (완료예정)</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--PRICEING AREA END-->

    <!--DOWNLOAD AREA-->
    <!--<section class="download-area section-padding wow fadeIn" id="download">
        <div class="download-area-bg"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 col-sm-12 col-xs-12">
                    <div class="area-title text-center">
                        <h2>Download App</h2>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority There are many variations of passages of Lorem Ipsum available, but the majority</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                    <ul class="download-button">
                        <li><a href="#"><i class="fa fa-apple"></i>apple store</a></li>
                        <li><a href="#"><i class="fa fa-android"></i>Play Store</a></li>
                        <li><a href="#"><i class="fa fa-windows"></i>Windows Store</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>-->
    <!--DOWNLOAD AREA END-->

    

    <!--FOOER AREA-->
    <div class="footer-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                    <div class="footer-copyright text-center wow fadeIn">
                        <p>Copyright &copy; syenrgypartners All Right Reserved. Design By <a href="mailto:jipark@synergymna.com">Syenrgy Mobile team</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--FOOER AREA END-->
		
		
	<!--===== ACTIVE JS=====-->
	<script src="${pageContext.request.contextPath}/js/land/main.js"></script>
	</body>
</html>