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
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css_m/land/swiper.css">
	<link href="${pageContext.request.contextPath}/css_m/land/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css_m/land/font-awesome.min.css" rel="stylesheet">
			
	
	
	<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
	<script src="${pageContext.request.contextPath}/js/m/swiper/swiper.min.js"></script>
	
	<!--====== MAIN STYLESHEETS ======-->
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
	    
	    
	<style>
	html, body {
	position: relative;
	height: 100%;
		}
	body {
		font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
		font-size: 14px;
		color: #000;
		margin: 0;
		padding: 0;
		}
	.swiper-container {
		/*width: 100%;*/
		/*height: 90%;*/
		}
	.swiper-slide {
		text-align: center;
		font-size: 18px;
		background: #fff;
		display: -webkit-box;
		display: -ms-flexbox;
		display: -webkit-flex;
		display: flex;
		-webkit-box-pack: center;
		-ms-flex-pack: center;
		-webkit-justify-content: center;
		justify-content: center;
		-webkit-box-align: center;
		-ms-flex-align: center;
		-webkit-align-items: center;
		align-items: center;
		}
	</style>
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
	<style>
	
	</style>
	</head>
	<body>
	
	
	
	
	
	<div class="windowbox">
		<h1 class="mo_title"><strong>App설치 및 사용안내</strong><a id="myModalCT_close" class="closeBtn"><em>창닫기</em></a></h1>
		<div class="gtabZone mgb10" id="tabArea">
			<ul>
				<li><a href="${pageContext.request.contextPath}/iosGuide.do">IOS 설치안내</a></li>
				<li class="on"><a href="${pageContext.request.contextPath}/andGuide.do">Android 설치안내</a></li>
				<li><a href="${pageContext.request.contextPath}/mvGuide.do">사용안내(동영상)</a></li>
			</ul>
		</div>
		<div class="and_titleZone">
			<span class="btn_close"><img src="${pageContext.request.contextPath}/images_m/land/guide/btn_closed.gif" alt=""></span>
		</div>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/images_m/land/guide/and_01.png" alt=""></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/images_m/land/guide/and_02.png" alt=""></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/images_m/land/guide/and_03.png" alt=""></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/images_m/land/guide/and_04.png" alt=""></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/images_m/land/guide/and_05.png" alt=""></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/images_m/land/guide/and_06.png" alt=""></div>
			</div>
			<div class="swiper-pagination"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</div>
	
	
	
	
	
	
		
 
		<script src="../dist/js/swiper.min.js"></script>
		<script>
		    var swiper = new Swiper('.swiper-container', {
		        pagination: '.swiper-pagination',
		        paginationClickable: true,
		        nextButton: '.swiper-button-next',
		        prevButton: '.swiper-button-prev',
		        spaceBetween: 30
		    });
	    </script>
	</body>
</html>