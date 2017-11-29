<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>업무지원 | Synergy Helper</title>
<meta name="keywords" content="시너지 그룹, 시너지 업무관리 시스템, 시너지 헬퍼, Synergy Helper" />
<meta name="description" content="시너지 그룹 업무관리 시스템 모바일" />
<meta name="copyright" content="Copyright © 2016 Synergy Group. All rights reserved" />
<meta name="author" content="㈜시너지 자산운용 02-586-5982" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
<link rel="stylesheet" href="/css_m/style.css"  />
<script src="/js_m/jquery-1.9.1.min.js"></script>
</head>

<body class="mobile_sub_bg">
	 <div id="wrap">
     	<div class="mb_sub_location"><button type="button" class="back"><em>이전</em></button><a href="#" class="depth01">Car Service</a></div>
    	<div class="mobile_sub_visual"></div>
        <!--서브-->
        <div class="containerWrap"> 	
            <ul class="mobile_sub_list">
                <li><a href="#">차량예약</a></li>
                <li><a href="/car/car_record.jsp">운행기록</a></li>
                <li><a href="#">차량리스트</a></li>
            </ul>
            <div class="btn_box_bottom">
                <a href="/index.jsp" class="btn_mobile_gray01">메인으로</a>
            </div>
        </div>
        <!--//서브//-->
        <!--퀵메뉴-->
        <%@ include file ="/includeJSP/quickmenu.jsp" %>
        <!--//퀵메뉴//-->
    </div>    	
</body>
</html>