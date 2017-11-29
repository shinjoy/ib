<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<! DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
    	<title>업무일정(Month) | 일정관리 | 업무일지 | Synergy Helper</title>
		<meta name="keywords" content="시너지 그룹, 시너지 업무관리 시스템, 시너지 헬퍼, Synergy Helper" />
		<meta name="description" content="시너지 그룹 업무관리 시스템 모바일" />
		<meta name="copyright" content="Copyright © 2016 Synergy Group. All rights reserved" />
		<meta name="author" content="㈜시너지 자산운용 02-586-5982" />
		<meta name="viewport" content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link href="${pageContext.request.contextPath}/css_m/style.css?ver=7" rel="stylesheet" type="text/css">
		
		
	 	<script>var contextRoot="${pageContext.request.contextPath}";</script><!-- necessary! to import js files -->	
	 	<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
	 	<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sp/synergy_util.js" ></script>
		<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- util folder -->	
		<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/m/mobile.js?ver=2"></script><!-- util folder -->
	
	
		<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
		<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
		<script type="text/JavaScript" src="<c:url value='/js/jquery.form.js'/>" ></script>
		
	
		<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
		<%@ include file="/includeAxisj.jsp" %>
		<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 
		
		<!-- -------------- highlight (JS) :S -------------- -->
		<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/m/jquery.highlight-4.js"></script>
		<!-- -------------- highlight (JS) :E -------------- --> 
		
		<!-- -------------- swal (alert change) (JS, CSS) :S -------------- -->
		<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/m/sweetalert.min.js?ver=2"></script>
		<link href="<c:url value='/css_m/sweetalert.css?ver=1'/>" rel="stylesheet" type="text/css">
		<!-- -------------- swal alert change (JS, CSS) :E -------------- --> 
		
		<!-- -------------- sjs (JS) :S -------------- -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
		<!-- -------------- sjs (JS) :E -------------- -->
	
		<!-- -------------- bottombtn (JS,CSS) :S -------------- -->
		<script type="text/JavaScript" src="<c:url value='/js/jquery.fab.js?ver=1'/>" ></script>
		<link href="<c:url value='/css_m/jquery-fab.css?ver=5'/>" rel="stylesheet" type="text/css"> 
		<!-- -------------- bottombtn (JS,CSS) :E -------------- -->
		
		
		<!-- -------------- modal (JS,CSS) :S -------------- -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/m/modal/jquery.modal.js?ver=3"></script>
		<link href="${pageContext.request.contextPath}/js/m/modal/jquery.modal.css?ver=3" rel="stylesheet" type="text/css">
		<!-- -------------- modal (JS,CSS) :E -------------- -->
		
		<!-- -------------- swiper (JS,CSS) :S -------------- -->
		<script src="${pageContext.request.contextPath}/js/m/swiper/swiper.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/m/swiper/swiper.min.css">
		<!-- -------------- swiper (JS,CSS) :E -------------- -->
		
		<!-- -------------- deal tab scroll (JS,CSS) :S -------------- -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/m/scrollTop/sly.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/m/scrollTop/horizontal.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/m/scrollTop/vendorplugins.js"></script>
		<!-- -------------- deal tab scroll (JS,CSS) :E -------------- -->
		
		 <script src="${pageContext.request.contextPath}/js/m/switch_btn/ToggleSwitch.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/m/switch_btn/ToggleSwitch.css"> 
		
		<!-- -------------- fullcalendar (JS,CSS) :S -------------- -->
		<link href='${pageContext.request.contextPath}/css/fullCalendar/fullcalendar.min.css' rel='stylesheet' />
		<link href='${pageContext.request.contextPath}/css/fullCalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
		<link href='${pageContext.request.contextPath}/css/fullCalendar/scheduler.min.css' rel='stylesheet' />
		<script src='${pageContext.request.contextPath}/js/fullCalendar/moment.min.js'></script>
		<script src='${pageContext.request.contextPath}/js/fullCalendar/fullcalendar.js'></script>
		<script src='${pageContext.request.contextPath}/js/fullCalendar/scheduler.min.js'></script>
		<!-- -------------- fullcalendar (JS,CSS) :E -------------- -->
		
		<!-- -------------- 스와이프 부드럽게  (JS) :S -------------- -->
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
</head>
