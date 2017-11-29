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
<title>PersonMgmt</title>

<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->

<style>
#leftPane{
	width:150px;
	height:500px;
	float:left;	
}

#rightPane{
	padding-left:5px;
	overflow: hidden;
}

.favormenu {
    height: 3px;
}

.custManagerGap{
    float: none;
    background: url(../images/common/bg_gtab.gif) repeat-x 0 top;
    height: 37px;
    overflow: hidden;
}
.custManager{
	padding-top:10px;
	height:30px;
	vertical-align:middle;
	text-align:center;
    float: none;
    background: url(../images/common/bg_bookmark_repeat.gif) repeat-x bottom;
    display: block;
    color: #242424;
}

.tNav li.active a {
    font-weight: normal;
    color: #999;
}
.showManaAll{
	padding-top:10px;
	padding-left:20px;
}
.showNotyet{
	padding-top:10px;
	padding-left:20px;
}
#containerWrap {
    padding: 20px;
}
.tb_titleZone {
    margin-bottom: 3px;
    margin-top: 10px;
}
.tb_titleZone .title a {
    margin-left: 3px;
}
.classicBox dl dd {
    width: 80%;
}
.btn_wh_bevel {
	/*float:left;*/ 
	width:100px; height:21px; line-height:21px; vertical-align:middle; border:#c2c2c2 solid 1px; 
	color:#666; display:inline-block; font-size:12px; text-align:center;
}
/*
.classtitleBox { width:100%; float:none; *zoom:1; max-width:1000px; }
.classtitleBox:after { content:""; display:block; clear:both; height:0;}
.classtitleBox li { float:left; width:50%; line-height:20px; height:24px; vertical-align:middle; display:inline-block; }
.classtitleBox li .title { float:left; width:20%; max-width:100px; min-width:20px; display:inline-block; }
.classtitleBox .inputarea { float:left; width:80%; display:inline-block; }
.classtitleBox input { float:left; border:#dadada solid 1px; line-height:20px; height:22px; width:70%; box-sizing:border-box; }
.classtitleBox a { float:left; display:inline-block; margin-left:9px; text-align:center; vertical-align:middle; line-height:1.5; background:#fff; border:#bdc4c9 solid 1px; border-radius:2px; color:#697275; padding:2px 8px 2px; font-size:11px; width:20%; max-width:30px; overflow:hidden; }
*/

/* 페이징 */
.btnPageZone { margin-top:20px; text-align:center; font-family:Verdana, Geneva, sans-serif; vertical-align:middle; }
.btnPageZone button { background:url(../images/common/board/btn_board_collection.gif) no-repeat; width:19px; height:23px; display:inline-block; line-height:13px; font-size:12px; vertical-align:middle; }
.btnPageZone button em { position:absolute; left:-9999999999px; width:0px; height:0px; overflow:hidden; }
.btnPageZone button.pre_end_btn { background-position: -137px 6px; } 
.btnPageZone button.pre_btn { background-position: -166px 6px; margin-right:20px; } 
.btnPageZone button.next_btn { background-position: -192px 6px; margin-left:20px; }
.btnPageZone button.next_end_btn { background-position: -220px 6px; }

.btnPageZone span { height:23px; }
.btnPageZone span a { background:url(../images/common/board/bg_divide_boardnum.gif) no-repeat left center; height:16px; line-height:16px; font-size:12px; padding:3px 8px 4px; text-align:center; vertical-align:middle; display:inline-block; }
.btnPageZone .pre_btn + span a { background:none; }
.btnPageZone span.current a { border:#5d697c solid 1px; background:none; color:#242424; font-weight:bold; padding:2px 9px 3px; }
.btnPageZone span.current + span a { background:none; }

</style>



<style type="text/css" >
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.2); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
    z-index: 1000000;
}
.wrap-loading div{ /*로딩 이미지*/
    position: fixed;
    top:50%;
    left:50%;
    margin-left: -21px;
    margin-top: -21px;
    z-index: 1000000;
}
.display-none{ /*감추기*/
    display:none;
}
        
</style>
 
<div class="wrap-loading display-none">
    <div><img src="<c:url value='/images/ajax_loading.gif'/>" /></div>
</div>


</head>

<body>
<div id="wrap"> 
	
    <div id="leftPane">
        <div class="favormenu"></div>
		<div class="custManagerGap"></div>
		<div class="custManager">담당자 선택</div>
		
		<div class="showManaAll"><label><input type="checkbox" onclick="fnObj.selStaff(this, 'all');" id="chkboxShowAll" /> 전체보기</label></div>
		
       	<div class="tNav">
       		<span id="spanStaffTree"></span>	<!-- 담당자 선택 트리  -->
        </div>
        
        <div class="showNotyet"><label><input type="checkbox" onclick="fnObj.selStaff(this, 'notyet');" id="chkboxNotyet" /> 미담당고객</label></div>
    </div>
    
    <div id="rightPane">
    	<div class="favormenu">
        	<a href="#" onclick="setVisibleLeftMenu(0);" id="btnLeftMenuHide" class="btn_leftmn_cl"><em>레프트 메뉴닫기</em></a>
        	<a href="#" onclick="setVisibleLeftMenu(1);" id="btnLeftMenuShow" class="btn_leftmn_op"><em>레프트 메뉴열기</em></a>
            <%--<ul class="favormn_list">
                <li><a href="#">메뉴01</a></li>
                <li><a href="#">메뉴02</a></li>
                <li><a href="#">메뉴03</a></li>
                <li><a href="#">메뉴04</a></li>
            </ul> --%>
        </div>
         
        <!--tab-->
        <div class="gtabZone">
        	<ul>
            	<li class="on"><a href="#">담당자별 고객관리</a></li>
                <%--<li><a href="#">담당자별 고객관리</a></li> --%>
            </ul>
        </div>
        <!--//tab//-->
        
        
        <div id="containerWrap">
            <!--선택박스-->
            <div class="classicBox">
            	<%--<div class="classtitleBox">
			    	<ul>
			        	<li><label><span class="title" style="color:#242424;padding-left:15px;">고객명</span><span class="inputarea"><input type="textbox" name="srchCustNm" /></span></label></li>
			            <li><label><span class="title" style="color:#242424;padding-left:15px;">회사명</span><span class="inputarea"><input type="textbox" name="srchCpnNm" />검색</span></label></li>
			        </ul>    
			    </div> --%>
            	<dl>
                    <dt style="width:70px!important;">고객명</dt>
                    <dt style="width:200px!important;padding-left:18px;">
                    	<input type="textbox" name="srchCustNm" id="srchCustNm" onkeypress="if(event.keyCode==13){fnObj.doSearch(1);}" style="width:200px;height:17px;border:1px solid #bbb;" />
                    </dt>
                    <dd style="padding-left:70px;width:70%;">
                    	회사명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<input type="textbox" name="srchCpnNm" id="srchCpnNm" onkeypress="if(event.keyCode==13){fnObj.doSearch(1);}" style="width:200px;height:17px;border:1px solid #bbb;" />
						<div style="float:right;"><a href="#" onclick="fnObj.doSearch(1);" class="btn_wh_bevel">검 색</a></div>
					</dd>
                </dl>
                <dl>
                    <dt style="width:70px!important;">고객구분</dt>
                    <dt style="padding-left:20px;width:80px;">
                    	<ul>
                            <li><label><input type="checkbox" id="chkboxCstTypeAll" onclick="fnObj.clickCstTypeAll(this);" /> 전체</label></li>
                        </ul>
					</dt>
                    <dd>
                        <ul class="classic_list">
                            <span id="cstRadioTag"></span>
                        </ul>
                    </dd>
                </dl>
                <dl>
                    <dt style="width:70px!important;">증권사</dt>
                    <dt style="padding-left:20px;width:100px;">
                    	<ul>
                            <li><label><input type="checkbox" id="chkboxStockCpnAll" checked onclick="fnObj.clickStockCpnAll(this);" /> 전체</label>
                            	<label>&nbsp;&nbsp;<a href="#" onclick="fnObj.showAllStockCpn();" class="btn_wh_bevel sort_normal" style="width:25px;">펼침</a></label></li>                            
                        </ul>
					</dt>
                    <dd>
                        <ul class="classic_list">
                        	<div id="spanStockCpn" style="max-height:45px;overflow-y:auto;"></div>
                        </ul>                        
                    </dd>
                </dl>
            </div>                
            <!--//선택박스//-->
            <%--
            <!--선택속성-->
            <div class="chooseResult">
            	<dl>
                	<dt>선택한 속성</dt>
                	<dd><a href="#">구자형<em>X</em></a><a href="#">이주훈<em>X</em></a><a href="#" class="btn_allcancel "><em>전체해제</em></a></dd>
                </dl>
            </div>
            <!--//선택속성//-->
             --%>
            <div class="tb_titleZone">
            	<div class="title">
                	<h3>담당자 : <span id="spanChargeNm">${userLoginInfo.name}</span></h3>
                	( <span id="total_count"></span> 건 )
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	
                	<a href="javascript:fnObj.chngChrgStaff();" id="aChngChrgStaff" class="btn_change_network"><em>담당자 변경</em></a>&nbsp;		<!-- btn_change_network_on ... 활성화 -->
                	<!-- <a href="#" class="btn_add_network"><em>고객 등록</em></a> -->
                </div>
                <div class="btnBox">
                	<ul>
                		<%--<li><span id="total_count"></span> 건</li> --%>
                		<li><a href="#" class="btn_excel"><em>엑셀로 저장</em></a></li>
                        <li><a href="#" class="btn_print"><em>인쇄하기</em></a></li>
                        <li><a href="#" class="btn_option"><em>테이블 옵션설정</em></a></li>
                    </ul>
                </div>
            </div>
            
            
            
            <!--고객 리스트-->
            <div class="network_st_box">
            	<span class="scroll_cover"></span>
            	
                <div class="scroll_header">
                    <table class="network_tb_st" style="table-layout:fixed;" summary="고객관리 리스트(이름, 업종, 회사, 기본정보, 네트워크, 최근정보, 시너지와의 이력)">
                        <caption>
                            고객관리 리스트
                        </caption>
                        <colgroup>
                            <col width="35" /> <!--선택-->
                            <col width="70" /> <!--이름-->                            
                            <col width="180" /> <!--회사-->
                            <col width="100" /> <!--고객구분-->
                            <%--<col width="100" /> <!--부서--> --%>
                            <col width="150" /> <!--직책-->
                            <col width="100" /> <!--연락처-->
                            <col width="150" /> <!--이메일-->
                            
                            <col width="70" /> <!--담당자-->
                            <col width="50" /> <!--친밀도-->
                            <col width="50" /> <!--등록수-->
                            <col width="70" /> <!--연락-->
                            <col width="80" /> <!--내용-->
                            <col width="70" /> <!--등록자-->
                            <col width="45" /> <!--전화-->
                            <col width="45" /> <!--미팅-->
                            <col width="60" /> <!--받은제안-->
                            <col width="45" /> <!--성과-->
                            <col width="60" /> <!--규모(억)-->
                            
                            <col width="80" /> <!--등록일-->
                        </colgroup>
                        <thead>
                            <tr>
                                <th rowspan="2" scope="col" class="checkinput"><label><input onclick="fnObj.chkCustAll(this);" type="checkbox" /><em>전체선택</em></label></th>
                                <%--<th rowspan="2" scope="col"><a href="#" class="sort_normal">이름<em>정렬</em></a></th>
                                <th rowspan="2" scope="col"><a href="#" class="sort_lowtohigh">업종<em>오름차순</em></a></th>
                                <th rowspan="2" scope="col"><a href="#" class="sort_hightolow">회사<em>내림차순</em></a></th> --%>
                                <th colspan="6" scope="col"><a href="#people_info" class="modalAnchor">기본정보</a></th>
                                <th colspan="3" scope="col"><a href="#network_info" class="modalAnchor">네트워크</a></th>
                                <th colspan="3" scope="col"><a href="#recen_info" class="modalAnchor">최근정보</a></th>
                                <th colspan="5" scope="col"><a href="#detail_history" class="modalAnchor">시너지와의 이력</a></th>
                                <th rowspan="2" scope="col"><a href="#" onclick="fnObj.doSort(4);" id="sort_column_prefix4" class="sort_normal">등록일<em>정렬</em></a></th>
                                </tr>
                            <tr>
                            	<th scope="col"><a href="#" onclick="fnObj.doSort(0);" id="sort_column_prefix0" class="sort_normal">이름<em>정렬</em></a></th>
                            	<th scope="col"><a href="#" onclick="fnObj.doSort(1);" id="sort_column_prefix1" class="sort_normal">회사<em>내림차순</em></a></th>
                            	<th scope="col"><a href="#" onclick="fnObj.doSort(2);" id="sort_column_prefix2" class="sort_normal">고객구분<em>오름차순</em></a></th>                            	
                                <%--<th scope="col">부서</th> --%>
                                <th scope="col">직급</th>
                                <th scope="col">연락처</th>
                                <th scope="col">이메일</th>
                                <th scope="col">담당자</th>
                                <th scope="col">친밀도</th>
                                <th scope="col">등록수</th>
                                <th scope="col"><a href="#" onclick="fnObj.doSort(3);" id="sort_column_prefix3" class="sort_normal">연락</a></th>
                                <th scope="col">내용</th>
                                <th scope="col">등록자</th>
                                <th scope="col">전화</th>
                                <th scope="col">미팅</th>
                                <th scope="col">받은제안</th>
                                <th scope="col">성과</th>
                                <th scope="col">규모(억)</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                
                <div class="scroll_body" style="height:450px;">
                    <table id="SGridTarget" class="network_tb_st" style="table-layout:fixed;" summary="고객관리 리스트(이름, 업종, 회사, 기본정보, 네트워크, 최근정보, 시너지와의 이력)">
                        <caption>
                            고객관리 리스트
                        </caption>
                        <colgroup>
                            <col width="35" /> <!--선택-->
                            <col width="70" /> <!--이름-->
                            <col width="180" /> <!--회사-->
                            <col width="100" /> <!--고객구분-->                            
                            <%--<col width="100" /> <!--부서--> --%>
                            <col width="150" /> <!--직책-->
                            <col width="100" /> <!--연락처-->
                            <col width="150" /> <!--이메일-->
                            
                            <col width="70" /> <!--담당자-->
                            <col width="50" /> <!--친밀도-->
                            <col width="50" /> <!--등록수-->
                            <col width="70" /> <!--연락-->
                            <col width="80" /> <!--내용-->
                            <col width="70" /> <!--등록자-->
                            <col width="45" /> <!--전화-->
                            <col width="45" /> <!--미팅-->
                            <col width="60" /> <!--받은제안-->
                            <col width="45" /> <!--성과-->
                            <col width="60" /> <!--규모(억)-->
                            
                            <col width="80" /> <!--등록일-->
                        </colgroup>
                        <tbody>
                        	<%--
                            <tr>
                                <td class="checkinput"><label><input type="checkbox" /><em>선택</em></label></td>
                                <td>윤병권</td>
                                <td class="left_txt">증권사 IB</td>
                                <td class="left_txt">교보증권</td>
                                <!-- <td class="left_txt">기업금융1팀</td> -->
                                <td class="left_txt">부장</td>
                                <td class="numst">010-1234-5678</td>
                                <td class="left_txt engst"><a href="mailto:synergy@naver.com">synergy@naver.com</a></td>
                                <td>이주훈</td>
                                <td class="numst pointcolor01">4</td>
                                <td class="numst pointcolor02">‘15.01.01</td>
                                <td class="left_txt">받은제안</td>
                                <td>이주훈</td>
                                <td class="numst">28</td>
                                <td class="numst">15</td>
                                <td class="numst">15</td>
                                <td class="numst">1</td>
                                <td class="right_txt numst">100</td>
                                <td class="numst">2015-01-01</td>
                            </tr>
                            --%>
                            </tbody>
                        </table>
                        
                    </div>
                </div>    
                
                <%--
                <!-- 페이지 목록 -->
		        <div class="btnPageZone" id="btnPageZone">
		            <button type="button" class="pre_end_btn"><em>맨처음 페이지</em></button>
		            <button type="button" class="pre_btn"><em>이전 페이지</em></button>
		           
		            <button type="button" class="next_btn"><em>다음 페이지</em></button>
		            <button type="button" class="next_end_btn"><em>맨마지막 페이지</em></button>
		        </div>
		        <!--/ 페이지 목록 /-->
                 --%>
            <!--//고객 리스트//-->
            
                        
            <!--모달 담당자변경-->         
            <div class="modal" id="changeManager">
                <div class="modalWrap">
                    <h1>담당자 변경</h1>
                    <div class="mo_container">
                    	<div class="changeManabox">
                        	<div class="Block01">
                            	<h2 class="title">선택된 고객리스트</h2>
                                <div class="scrollwrap">
                                	<div class="scrollbox">
                                    	<ul class="mo_list_tb">
                                        	<li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                            <li class="select"><label><input type="checkbox" checked="checked" /><span class="customer">윤병권</span><span class="company">대우증권</span><span class="manager">이주훈</span></label></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="Block02">
                            	<span class="btn_arrow_add">&nbsp;</span>
                            </div>
                            <div class="Block03">
                            	<h2 class="title">담당자 선택</h2>
                                <div class="scrollwrap">
                                	<div class="scrollbox">
                                    	<ul class="mo_list_tb">
                                        	<li><label><input type="radio" name="manager_choice01" /><span class="ch_manager">이주훈</span><span class="company">시너지파트너스<em>(이사)</em></span></label></li>
                                            <li><label><input type="radio" name="manager_choice01" /><span class="ch_manager">이주훈</span><span class="company">시너지파트너스<em>(이사)</em></span></label></li>
                                            <li><label><input type="radio" name="manager_choice01" /><span class="ch_manager">이주훈</span><span class="company">시너지파트너스<em>(이사)</em></span></label></li>
                                            <li><label><input type="radio" name="manager_choice01" /><span class="ch_manager">이주훈</span><span class="company">시너지파트너스<em>(이사)</em></span></label></li>
                                            <li><label><input type="radio" name="manager_choice01" /><span class="ch_manager">이주훈</span><span class="company">시너지파트너스<em>(이사)</em></span></label></li>
                                            <li><label><input type="radio" name="manager_choice01" /><span class="ch_manager">이주훈</span><span class="company">시너지파트너스<em>(이사)</em></span></label></li>
                                            <li><label><input type="radio" name="manager_choice01" /><span class="ch_manager">이주훈</span><span class="company">시너지파트너스<em>(이사)</em></span></label></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p class="notice_script"><span class="red">*</span>선택된 고객들은 담당자를 지정하여 일괄적으로 변경해주실수 있습니다.</p>
                    </div>
                    <div class="mo_footer">
                    	<div class="btnZone"><a href="#"><strong>담당자변경</strong></a><a href="#">취소</a></div>
                    </div>
                    <a href="#" class="btn_modal_min"><em>창 최소화</em></a>
                    <a href="#" class="btn_modal_max"><em>창 최대화</em></a>
                    <a href="#" class="btn_modal_close"><em>창 닫기</em></a>
                </div> 
            </div>
            <!--//모달 담당자변경//-->
        
        </div>
        
    </div>

<!--// 인물관리목록 //-->

</div>
</body>
</html>



<script type="text/javascript">

//Global variables :S ---------------

//공통코드
var comCodeCstType;			//고객구분


var myModal = new AXModal();		// instance


var myGrid = new SGrid();		// instance		new sjs
var myPaging = new SPaging();	// instance		new sjs
var mySorting = new SSorting();	// instance		new sjs


//var curPageNo = 1;				//현재페이지번호
//var pageSize = 15;				//페이지크기(상수 설정)


//div popup 방식을 위한 글쓰기,수정 위한 변수
var mode;						//"new", "view", "update" 

//var articleObj;					//글보기 데이터

var fileSeqArray = new Array();		//업로드된 파일 key list
var fileSeqArrayTemp = new Array();	//업로드된 파일 key list (글저장을 누르기전...글에 파일키가 등록되기 전 상태)


var g_chargeType = '';									//담당자 타입	...	'all':전체보기, 'notyet':미담당보기, '':특정담당자, 'new':신규등록고객(꼽사리)
var g_chargeStaffCusId = ['${userLoginInfo.cusId}'];	//담당자 사원 고객id ... 담당자 일경우 (처음에는 로그인 사용자 고객id)

var g_staffList = new Array();							//담당자 전체 리스트 ... [{cusId:'123', usrNm:'시너지'}]

var g_stockCpnList = new Array();						//증권사 array

var g_gridListStr;										//그리드 데이터 string (객체화되기전 문자열 json... JSON.parse 로 객체로 만들어사용) (증권사 필터링을 위해..)

var g_sortCol = '';		//소팅 컬럼
var g_sortAD = '';		//소팅 방향(A or D)

//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		//공통코드
		comCodeCstType = getCommonCode('00013', null, 'CD', 'NM');		//고객구분('00013') 공통코드 (Sync ajax)
		
		//'optionValue','optionText' 프로퍼티를 생성하며 값으로 CD, NM 의 값 할당
		//this.addComCodeArray(comCodeMenuType);
		var cstRadioTag = createRadioTag('rdCstType', comCodeCstType, 'CD', 'NM', '00001', 17, null, 'fnObj.clickRdCstType(this)');	//'fnObj.clickRdBudget(this);');//radio tag creator 함수 호출 (common.js)		
		$("#cstRadioTag").html(cstRadioTag);
		
		
		//페이지크기 세팅
		//fnObj.setPageSize();
	},
	
	
	//화면세팅
    pageStart: function(){
    	
    	this.setStaffTreeMenu();		//담당자 선택 트리 메뉴 세팅
    	
    	
    	//-------------------------- 그리드 설정 :S ----------------------------
    	/* 그리드 설정정보 */
    	var configObj = {
    		
    		targetID : "SGridTarget",		//그리드의 id
    		
    		//그리드 컬럼 정보
    		colGroup : [    		
            {key:"chk",			formatter:function(obj){return ("<input type='checkbox' name='mCheck' value='" + obj.value + "' onclick='fnObj.clickCheckbox(this, " + obj.index + ");' />");}},
            {key:"cstNm", 		formatter:function(obj){return obj.value;}},            
            {key:"cpnNm"		},
            {key:"custTypeNm",	formatter:function(obj){return obj.value;}},
            {key:"position",	},
            {key:"phn1",		},
            {key:"email"		},
            {key:"usrNm"		},
            {key:"lvCd",		formatter:function(obj){return (!isEmpty(obj.value)?parseInt(obj.value):'');}},
            {key:"netCnt",		formatter:function(obj){return (obj.value==0?'':obj.value);}},
            {key:"lastDt"		},
            {key:"lastType"		},
            {key:"lastNm"		},
            {key:"callCnt"		},
            {key:"meetCnt",		formatter:function(obj){return ((obj.item.meetCnt + obj.item.nightMeetCnt)==0?'':(obj.item.meetCnt + obj.item.nightMeetCnt));}},
            {key:"dealCnt"		},
            {key:"dealSCnt"		},
            {key:"price"		},
            {key:"rgDt"			}
            ],
            
            body : {
                onclick: function(obj){
                	/* ***** obj *****
                		obj.c 		- column index,
						obj.index 	- row index,
						obj.item 	- row data object,
						obj.list 	- grid data object
                	*/                	
                	if(obj.c > 0 && obj.c < 7){
                		//fnObj.viewProject(obj.item.projectId);
                		alert('보기 연결');
                	}
                	
                }
            }
            
    	};
    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
    	var rowHtmlStr = '<tr>';
    	rowHtmlStr +=	 '<td class="checkinput"><label>#[0]<em>선택</em></label></td>';
    	rowHtmlStr +=	 '<td style="cursor:pointer;">#[1]</td>';
    	rowHtmlStr +=	 '<td class="left_txt" style="cursor:pointer;">#[2]</td>';
    	rowHtmlStr +=	 '<td class="left_txt" style="cursor:pointer;">#[3]</td>';
    	rowHtmlStr +=	 '<td class="left_txt" style="cursor:pointer;">#[4]</td>';			//직급
    	rowHtmlStr +=	 '<td class="numst" style="cursor:pointer;">#[5]</td>';
    	rowHtmlStr +=	 '<td class="left_txt engst" style="cursor:pointer;">#[6]</td>';	//이메일
    	rowHtmlStr +=	 '<td>#[7]</td>';													//담당자
    	rowHtmlStr +=	 '<td class="numst pointcolor01">#[8]</td>';						//친밀도
    	rowHtmlStr +=	 '<td class="numst">#[9]</td>';										//등록수
    	rowHtmlStr +=	 '<td class="numst pointcolor02">#[10]</td>';						//연락
    	rowHtmlStr +=	 '<td class="left_txt">#[11]</td>';									//내용
    	rowHtmlStr +=	 '<td>#[12]</td>';													//등록자
    	rowHtmlStr +=	 '<td class="numst">#[13]</td>';
    	rowHtmlStr +=	 '<td class="numst">#[14]</td>';
    	rowHtmlStr +=	 '<td class="numst">#[15]</td>';
    	rowHtmlStr +=	 '<td class="numst">#[16]</td>';
    	rowHtmlStr +=	 '<td class="right_txt numst">#[17]</td>';
    	rowHtmlStr +=	 '<td class="numst">#[18]</td>';
        rowHtmlStr +=	 '</tr>';
    	configObj.rowHtmlStr = rowHtmlStr; 
        
    	
    	myGrid.setConfig(configObj);		//그리드 설정정보 세팅
    	//-------------------------- 그리드 설정 :E ----------------------------
    	
    	
    	//-------------------------- 페이징 설정 :S ----------------------------
    	/* 
    	myPaging.setConfig({				//페이징 설정정보 세팅
    		
			targetID		: "btnPageZone",		//대상 페이징 id ... <div>
			pageSize		: pageSize,				//global variable value 
			
			preEndBtnClass	: 'pre_end_btn',		//맨처음 페이지 	버튼 클래스명
			preBtnClass		: 'pre_btn',			//이전 페이지		버튼 
			nextBtnClass	: 'next_btn',			//다음 페이지		버튼 
			nextEndBtnClass	: 'next_end_btn',		//맨마지막 페이지	버튼 클래스명
			
			curPageNoClass	: 'current',			//현재페이지를 표시해주기위한 style Class name
			clickFnName		: 'fnObj.doSearch'		//페이지 이동 함수명(버튼 클릭)
			
    	});
    	 */
    	//-------------------------- 페이징 설정 :E ----------------------------
    	
    	
    	//-------------------------- 소팅 설정 :S ----------------------------    	
    	mySorting.setConfig({
			colList : ['cstNm', 'cpnNm', 'custTypeNm', 'lastDt', 'rgDt'],						//['PROJECT_TYPE', 'END_DATE', 'BUDGET_AMT'],
			classNameNormal		: 'sort_normal',				//정렬기본 아이콘 css class
			classNameHighToLow	: 'sort_hightolow',				//오름정렬 아이콘 css class
			classNameLowToHigh	: 'sort_lowtohigh'				//내림정렬 아이콘 css class
		});
    	//-------------------------- 소팅 설정 :E ----------------------------
    	
    	
    	//-------------------------- 모달창 :S -------------------------
    	myModal.setConfig({
    		windowID:"myModalCT",
    		//openModalID:"kkkkk",
    		width:740,
            mediaQuery: {
                mx:{min:0, max:767}, dx:{min:767}
            },
    		displayLoading:true,
            scrollLock: true,
    		onclose: function(){
    			//toast.push("모달 close");

				//if(window[myModal.winID].isSaved == false){		//저장을 안한상태로 창이 닫힐때, 이미 업로드한 파일은 삭제
    			//	window[myModal.winID].fnObj.deleteFile();	//팝업창 내 파일삭제함수 호출.
    			//}    			
    		}
    	});
    	//-------------------------- 모달창 :E -------------------------
    	
    },//end pageStart.
  	//################# init function :E #################
    
    
    //################# else function :S #################
    
  	//검색
    doSearch: function(page){ 
    	
    	//--------- 고객명, 회사명
    	var srchCustNm = $('#srchCustNm').val();			//고객명
    	var srchCpnNm = $('#srchCpnNm').val();				//회사명
    	if(!isEmpty(srchCustNm) || !isEmpty(srchCpnNm)){	//고객명 이나 회사명으로 검색하는 경우
    		/* 전체대상으로 검색한다 */
    		fnObj.unSelStaff();								//담당자 선택관련 체크박스 모두 해제
    		g_chargeStaffCusId = [];						//담당자 초기화
    		g_chargeType = 'all';							//전체대상으로
    		$('#chkboxShowAll').attr('checked',true);		//전체보기 체크
    		
    		
    		$('#chkboxCstTypeAll').attr('checked', true);				//고객구분 전체 체크
        	$('input:radio[name=rdCstType]').removeAttr('checked');		//고객구분 라디오 체크해제
    		    		
        	$('#chkboxStockCpnAll').attr('checked', true);				//증권사 전체 체크
    	} 
    	
    	//alert($('#chkboxCstTypeAll').is(':checked'));
    	//return;
    	
    	if(g_chargeType == 'all'){		//전체보기 검색모드인 경우
    		if(isEmpty(srchCustNm) && isEmpty(srchCpnNm) && $('#chkboxCstTypeAll').is(':checked')){
    			alert("[ 확인! ]\n\n전체보기 모드는 고객구분 '전체' 선택은 불가능 합니다!\n\n");
    			return;
    		}
    	}
    	
    	
    	//--------- 고객구분
    	var cstType = $('input:radio[name=rdCstType]:checked').val();
    	if(isEmpty(cstType)) cstType = '';		//undefined >> ''
    	
    	
    	//--------- 담당자 리스트 string
    	var staffCusIdStr = '';
    	for(var i=0; i<g_chargeStaffCusId.length; i++){
    		if(i>0) staffCusIdStr += ',';
    		staffCusIdStr += g_chargeStaffCusId[i];
    	}
    	
    	
    	var url = contextRoot + "/person/getCustList.do";
    	var param = {
		    			//pageSize: pageSize,
		    			//pageNo:	page,
    			
    					staffCusId: staffCusIdStr,		//g_chargeStaffCusId,					//담당자
    					isNotyet: (g_chargeType=='notyet'?'Y':''),		//미담당자 여부
    					isNew: (g_chargeType=='new'?'Y':''),			//신규등록 고객 여부
    					
    					cstType: cstType,								//고객구분
    					isStock: (cstType=='00001'?'Y':''),				//고객구분 이 증권사IB 여부	'Y'
    					
    					
    					srchCustNm: $('#srchCustNm').val(),				//고객명
    					srchCpnNm: $('#srchCpnNm').val(),				//회사명
    					
    					
    					
   						sortCol:	'',		//g_sortCol,
   						sortAD:		''		//(g_sortAD == 'D'?'DESC':'ASC'),
    					
		    		};
    	
    	
    	//alert(JSON.stringify(param));
    	//return;
    	    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		    		
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON


    		//alert(JSON.stringify(cnt));
    		//return;
    		
    		/*     		
    		curPageNo = obj.pageNo;			//현재페이지세팅(global variable)
    		
    		var pageObj = {						//페이징 데이터
					pageNo : curPageNo,
					pageSize : pageSize,
					pageCount: obj.pageCount
				} */
    		
    		//alert(JSON.stringify(pageObj));
    		
    		//myPaging.setPaging(pageObj);		//페이징 데이터 세팅	*** 1 ***
    		
    		myGrid.setGridData({				//그리드 데이터 세팅	*** 2 ***
								list: list		//그리드 테이터
								//,page: pageObj	//페이징 데이터
    						});
    		
    		g_gridListStr = result;				//따로 전역변수에 넣어둔다
    		
    		//alert(JSON.stringify(list));
    		
    		//mySorting.clearSort();			//소팅초기화
			//mySorting.applySortIcon();		//소팅화면적용
			
			
			fnObj.setStockCpnChkbox(list);			//증권사 체크박스 세팅
			
			
			//전체 건수 세팅
			$('#total_count').html(cnt);
			
			
			//소팅 초기화
			mySorting.clearSort();
			//----- 하단 기본 소팅 설정은 기본정책에 따라 바꿔준다. 
			mySorting.setSort(1);				//소팅객체를 소팅한다.(상태값들의 변화)
			mySorting.applySortIcon();			//소팅화면적용
    	};
    	
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
    	
    	
    	commonAjax("POST", url, param, callback, true, beforeFn, completeFn);
    	
    },//end doSearch
    
    
    /* //정렬정보 세팅 ... 전역변수 세팅
    setSortInfo: function(sortCol){
    	//sorting 방향
    	if(g_sortAD == '' || g_sortAD == 'D' || g_sortCol != sortCol){
    		g_sortAD = 'A';
    	}else{
    		g_sortAD = 'D';
    	}
    	//sorting 컬럼
    	if(sortCol == null || sortCol == ''){
    		g_sortCol = '';
    	}else{
    		g_sortCol = sortCol;
    	}
    	
    	
    }, */
    
    
  	//프로젝트 보기
    viewProject: function(projectId){
    	
    	//현재 페이지 파라미터 추출---------
    	var url = decodeURIComponent(location.href);
     	var params = url.substring( url.indexOf('?')+1, url.length );	// url에서 '?' 문자 이후의 파라미터 문자열까지 자르기
    	//-------------------------------
    	
    	var url = "<c:url value='/project/projectView.do'/>" + "?saved=&pId=" + projectId + "&" + params;
    	
    	
    	document.location.href = url;
    	
    },//end viewProject
    
    
    
    //엑셀다운
    excelDownload: function(){    	  
    	 excelDown(myGrid.getExcelFormat('html'), "download");		//common.js    	
    },
    
    
    /* //툴팁 세팅
    setTooltip: function(){
    	var tooltipStr = '';    	
    	//for(var i=1; i<comCodeRoleCd.length; i++){
    	//	tooltipStr += comCodeRoleCd[i].NM + " : " + comCodeRoleCd[i].DESCRIPTION + "<br>";
    	//}
    	tooltipStr += "수정을 하시려면 해당 '아이디', '한글명', '영문명' 중 하나를 클릭하시기 바랍니다";
    	
  		AXPopOver.bind({
  	        id:"myPopOver",
  	        theme:"AXPopOverTooltip", 	// 선택항목
  	        width:"200", 				// 선택항목
  	        body:tooltipStr				//"설명입니다.<br/>액시스제이는 이렇게 유용 합니다."
  	    });
  		$("#ttipUserRole").bind("mouseover", function(event){
  	        AXPopOver.open({id:"myPopOver", sendObj:{}}, event); // event 직접 연결 방식
  	    });
  	}, */
  	
  	    
  	//글보기
    viewMenu: function(menuInfoObj){
    	var url = "<c:url value='/system/addMenu.do'/>";
    	var params = {mode:'update',
    				  menuInfoObj:JSON.stringify(menuInfoObj)};//("mode=view&boardSeq="+boardSeq+"&btype=1&cate=1").queryToObject();	//게시판유형(board_type), 게시판 카테고리 를 넘긴다. 
    	
    	myModal.open({
    		url: url,
    		pars: params,
    		titleBarText: '메뉴수정',		//titleBarText 속성 추가하였음.(원 Axisj에는 없었던것)
    		method:"POST",
    		top: 150,
    		width: 650,
    		closeByEscKey: true			//esc 키로 닫기
    	});
    	
    	$('#myModalCT').draggable();
    },//end writeOpen
    	
    
  	//배열에 새로운 인자로 추가 (공통코드 이상문제해결)
    addComCodeArray: function(obj){    	
		for(var i=0; i<obj.length; i++){
			obj[i].optionValue = obj[i].CD;		//'optionValue' 프로퍼티를 생성하며 값으로 CD 의 값 할당 
			obj[i].optionText  = obj[i].NM;		//'optionText'  프로퍼티를 생성하며 값으로 NM 의 값 할당
		}		
    },
    
    
  	//체크박스 전체 체크
    allCheck: function(){
    	
   		var chkList = document.getElementsByName('mCheck');
   		//var list = myGrid.getList();
   		//var addIdx = chkList.length/2;
   		var toBe = document.getElementsByName('allChk')[0].checked;
   		for(var i=0; i<chkList.length; i++){
       		chkList[i].checked = toBe;		//체크여부
       		//list[i-addIdx].chk = toBe?1:0;	//그리드데이터도 함께 변환(아직 그리드 데이터는 변하지 않은 상태이기때문에)
       	}    		
   	
    },
    
    
    //페이지 사이즈 세팅
    setPageSize: function(isSearch){
    	
    	pageSize = $('#sel_page_size').val();
    	
    	//검색도 바로할 경우 ... isSearch ... true
		if(isSearch){
			fnObj.doSearch(1);
    	}
    },
    
    
    //담당자 선택 트리 메뉴
    setStaffTreeMenu: function(){
    	
    	var url = contextRoot + "/common/getStaffList.do";
    	var param = {		    			
		    		};
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		    		
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
    	    
    		//alert(JSON.stringify(list));
    		//alert(cnt);
    		
    		
    		//------------------------- 받아온 사원 데이터로 트리 세팅 :S --------------------------    		
    		
    		//-------- 트리 데이터 세팅
    		
    		var treeHtmlStr = '<ul>';
    		var team = '';		//팀(부서)
    		var foldSeq = [3,6,8];	//팀(부서)중 트리메뉴에서 처음 접을 부서코드 ... 3:경영지원, 6:벤처투자팀, 8:시스템기획팀, 9: 오픈플랫폼팀
    		
    		for(var i=0; i<cnt; i++){
    			if(team != list[i].deptSeq){	//부서가 달라질때
    				if(i>0){
    					treeHtmlStr += '</ul>';
    		    		treeHtmlStr += '</li>';
    				}
    				
    				treeHtmlStr += '<li ' + ((foldSeq.indexOf(list[i].deptSeq) > -1)?'':' class="active"') + '><a href="#"><label>' + list[i].deptNm + '</label></a>';
    	    		treeHtmlStr += '<ul>';
    	    		team = list[i].deptSeq;
    			}
    			treeHtmlStr += '<li><label><input type="checkbox" ' + ('${userLoginInfo.cusId}'==list[i].cusId?'checked':'') + ' onclick="fnObj.selStaff(this, \'\', \'' + list[i].cusId + '\', \'' + list[i].usrNm + '\');" name="chkboxStaff" value="' + list[i].cusId + '" />' + list[i].usrNm + '</label></li>';
    			
    			if(i==cnt-1){	//마지막 일때
    				treeHtmlStr += '</ul>';
		    		treeHtmlStr += '</li>';
    			}
    			
    			
    			//------------- [{cusId,usrNm}] -----
    			g_staffList.push({cusId:list[i].cusId, usrNm:list[i].usrNm});
    			
    		}
    		
    		treeHtmlStr += '</ul>';
    		
    		$('#spanStaffTree').html(treeHtmlStr);
    		
    		
    		
    		//-------- 트리 스타일 세팅
    		
    		// Tree Navigation
        	var tNav = $('.tNav');
        	var tNavPlus = '\<button type=\"button\" class=\"tNavToggle plus\"\>+\<\/button\>';
        	var tNavMinus = '\<button type=\"button\" class=\"tNavToggle minus\"\>-\<\/button\>';
        	tNav.find('li>ul').css('display','none');
        	tNav.find('ul>li:last-child').addClass('last');
        	tNav.find('li>ul:hidden').parent('li').prepend(tNavPlus);
        	tNav.find('li>ul:visible').parent('li').prepend(tNavMinus);
        	tNav.find('li.active').addClass('open').parents('li').addClass('open');
        	tNav.find('li.open').parents('li').addClass('open');
        	tNav.find('li.open>.tNavToggle').text('-').removeClass('plus').addClass('minus');
        	tNav.find('li.open>ul').slideDown(100);
        	$('.tNav .tNavToggle').click(function(){
        		t = $(this);
        		t.parent('li').toggleClass('open');
        		if(t.parent('li').hasClass('open')){
        			t.text('-').removeClass('plus').addClass('minus');
        			t.parent('li').find('>ul').slideDown(100);
        		} else {
        			t.text('+').removeClass('minus').addClass('plus');
        			t.parent('li').find('>ul').slideUp(100);
        		}
        		return false;
        	});
        	$('.tNav a[href=#]').click(function(){
        		t = $(this);
        		t.parent('li').toggleClass('open');
        		if(t.parent('li').hasClass('open')){
        			t.prev('button.tNavToggle').text('-').removeClass('plus').addClass('minus');
        			t.parent('li').find('>ul').slideDown(100);
        		} else {
        			t.prev('button.tNavToggle').text('+').removeClass('minus').addClass('plus');
        			t.parent('li').find('>ul').slideUp(100);
        		}
        		return false;
        	});
        	

        	// Lined Tab Navigation
        	var tab_line = $('div.tab.line');
        	var tab_line_i = tab_line.find('<ul<li');
        	var tab_line_ii = tab_line.find('<ul<li<ul<li');
        	tab_line.removeClass('jx');
        	if($(document).width()<=640){
        		tab_line.addClass('jx');	
        	}
        	$(window).resize(function(){
        		if($(document).width()<=640){
        		tab_line.addClass('jx');	
        		} else {
        		tab_line.removeClass('jx');
        		}
        	});
        	tab_line_i.find('>ul').hide();
        	tab_line_i.find('<ul<li[class=active]').parents('li').attr('class','active');
        	tab_line.find('<ul<li[class=active]').find('>ul').show();
        	function lineTabMenuToggle(event){
        		if (!tab_line.hasClass('jx')){
        			var t = $(this);
        			tab_line_i.find('>ul').hide();
        			t.next('ul').show();
        			tab_line_i.removeClass('active');
        			t.parent('li').addClass('active');
        			return false;
        		}
        	}
        	function lineTabSubMenuActive(){
        		tab_line_ii.removeClass('active');
        		$(this).parent(tab_line_ii).addClass('active');
        		return false;
        	}; 
        	tab_line_i.find('>a[href=#]').click(lineTabMenuToggle).focus(lineTabMenuToggle);
        	tab_line_ii.find('>a[href=#]').click(lineTabSubMenuActive).focus(lineTabSubMenuActive);
    		
    		//------------------------- 받아온 사원 데이터로 트리 세팅 :E --------------------------
    	};
    	
    	
    	commonAjax("POST", url, param, callback, false);		// false (sync 처리)
    	
    },//setStaffTreeMenu
    
    
    //담당자 선택
    selStaff: function(th, knd, staffCusId, staffNm){		//knd ... 'all'(전체보기), 'notyet'(미담당보기), ''(특정담당자), 'new'(신규등록고객)
    	
    	//전역변수 세팅
    	g_chargeType = knd;						//담당자 타입	...	'all':전체보기, 'notyet':미담당보기, '':특정담당자, 'new':신규등록고객(꼽사리)
    	
    	
    	g_chargeStaffCusId = [];				//초기화(담당자 사원 고객id list)
    	
    	if(!isEmpty(knd)){						//knd ... 'all' or 'notyet' or 'new' 일때
    		
    		fnObj.unSelStaff();					//담당자 해제
    		
    		$(th).attr('checked', true);		//누른 체크박스 무조건체크
    		
    	}else{		//특정 담당자 클릭
    		
    		$('#chkboxShowAll').removeAttr('checked');						//전체보기 해제        		
        	$('#chkboxNotyet').removeAttr('checked');						//미담당보기 해제
    		
        	var tmp=0;	//담당자수
    		$('input:checkbox[name=chkboxStaff]').each(function(idx, obj){
    			if(obj.checked){							//선택한 담당자
    				g_chargeStaffCusId.push(obj.value);		//선택 리스트에 담아
    				tmp++;
    			}
    		});
        	
        	if(tmp==0){	//담당자 모두 해제하는 클릭이었을때
        		$('#chkboxShowAll').attr('checked', true);	//전체보기 체크상태로
        		g_chargeType = 'all';						//전체보기 모드로 global variable setting
        	}
    	}
    		
    	/* if(isEmpty(staffCusId)){		//특정담당자 아닌 모드(전체보기, 미담당, 신규)
    		g_chargeStaffCusId = [];	//담당자 사원 고객id
    	}else{
    		if(g_chargeStaffCusId.indexOf(staffCusId) == -1){	//체크한 담당자 리스트에 없을때 추가
    			g_chargeStaffCusId.push(staffCusId);
    		}
    	} */
    	//g_chargeStaffCusId = (isEmpty(staffCusId)?'':staffCusId);	//담당자 사원 고객id

    	//고객명,회사명 초기화
    	$('#srchCustNm').val('');
    	$('#srchCpnNm').val('');
    	
    	//alert(g_chargeStaffCusId.length);
    	
    	var staffNmLst = '';
    	for(var i=0; i<g_chargeStaffCusId.length; i++){
    		if(staffNmLst!='') staffNmLst += ', ';
    		staffNmLst += g_staffList[getRowIndexWithValue(g_staffList, 'cusId', g_chargeStaffCusId[i])].usrNm;
    	}
    	$('#spanChargeNm').html(staffNmLst);		//담당자명 세팅
    	
    	
    	fnObj.doSearch(1);
    },
    //담당자 해제
    unSelStaff: function(){
    	$('#chkboxShowAll').removeAttr('checked');						//전체보기 해제
    	$('input:checkbox[name=chkboxStaff]').removeAttr('checked');	//담당자 해제    	
    	$('#chkboxNotyet').removeAttr('checked');						//미담당보기 해제
    },
    
    
    //고객구분 체크
    clickRdCstType: function(th){
    	$('#chkboxCstTypeAll').removeAttr('checked');
    	
    	//고객명,회사명 초기화
    	$('#srchCustNm').val('');
    	$('#srchCpnNm').val('');
    	
    	fnObj.doSearch(1);
    },
    //고객구분 전체
    clickCstTypeAll: function(th){
    	$(th).attr('checked', true);								//전체 체크
    	$('input:radio[name=rdCstType]').removeAttr('checked');		//고객구분 라디오 체크해제
    	
    	fnObj.doSearch(1);
    },
    
    
    //증권사 전체
    clickStockCpnAll: function(th){
    	$(th).attr('checked', true);								//전체 체크
    	$('input:radio[name=chkStockCpn]').removeAttr('checked');		//고객구분 라디오 체크해제
    	
    	
    	//그리드 데이터 마지막 DB검색의 데이터로 세팅
    	var list = JSON.parse(g_gridListStr).resultList;
    	myGrid.setGridData({			//그리드 데이터 세팅
			list: list					//그리드 테이터		
		});
    	
    	
    	//소팅 초기화
		mySorting.clearSort();
		//----- 하단 기본 소팅 설정은 기본정책에 따라 바꿔준다. 
		mySorting.setSort(1);				//소팅객체를 소팅한다.(상태값들의 변화)
		mySorting.applySortIcon();			//소팅화면적용
    },
    
    
    //증권사 라디오박스 세팅
    setStockCpnChkbox: function(listObj){
    	
    	var stockCpnChkboxStr = '';		//체크박스 html string
    	
    	g_stockCpnList = new Array();	//초기화 
    	
    	var cnt = listObj.length;		//고객수
    	
    	for(var i=0; i<cnt; i++){
    		if(listObj[i].cpnCate == '증권'){
    			
    			if(g_stockCpnList.indexOf(listObj[i].cpnId) == -1){		//없는 증권사이면
    				stockCpnChkboxStr += '<li><label><input type="radio" name="chkStockCpn" onclick="fnObj.findStockCpn(\'' + listObj[i].cpnId + '\');" value="' + listObj[i].cpnId + '" />' + listObj[i].cpnNm + '</label></li>';	//추가
    				g_stockCpnList.push(listObj[i].cpnId);				//추가된 증권사 리스트에 추가
    			}
    			
    		}
    	}

    	$('#spanStockCpn').html(stockCpnChkboxStr);
    },
    
    //증권사 필터링
    findStockCpn: function(cpnId){
    	
    	$('#chkboxStockCpnAll').removeAttr('checked');		//증권사 전체 체크박스 체크해제
    	
    	
    	var list = JSON.parse(g_gridListStr).resultList;
    	var cnt = list.length;
    	
    	for(var i=cnt-1; i>=0; i--){
    		if(list[i].cpnId != cpnId) list.remove(i);
    	}
    	
    	myGrid.setGridData({			//그리드 데이터 세팅
			list: list					//그리드 테이터		
		});
    },
    
    //증권사 div height toggle
    showAllStockCpn: function(){
    	if($('#spanStockCpn').height() == 45){
    		$('#spanStockCpn').css('max-height', '1000px');
    	}else{
    		$('#spanStockCpn').css('max-height', '45px');
    	}
    },
    
    //담당자 변경
    chngChrgStaff: function(){
    	//var document.getElementsByName('mCheck');
    	var jObj = $('input:checkbox[name=mCheck]:checked');
    	if(jObj.length > 0){
    		
    		///////////////////////////// 담당자 변경 팝업 ////////////////////////////
    		
    		var url = "<c:url value='/person/chngCstManagerPopup.do'/>";
        	var params = {};	//"btype=1&cate=1".queryToObject();		//게시판유형(board_type), 게시판 카테고리 를 넘긴다. 
        	
        	//params 에 고객리스트 전달------
        	var tObj = [];					//임시 객체(배열)
        	var list = myGrid.getList();	//그리드 데이터(array object)
        	
        	var chkboxAll = document.getElementsByName('mCheck');		//고객 체크박스
        	for(var i=0; i<chkboxAll.length; i++){
        		if(chkboxAll[i].checked){
        			tObj.push({sNb:list[i].sNb, cstNm: list[i].cstNm, cpnNm:list[i].cpnNm, usrNm:list[i].usrNm});
        		}
        	}
        	
        	params.cstList = JSON.stringify(tObj);				//선택한 고객리스트 														/***** param 1 *****/
        	
        	//params 에 담당자(사원)리스트 전달------
        	params.staffList = JSON.stringify(g_staffList);		//담당자 리스트(사원리스트) 전달 (궂이 다시 코드를 가져올 필요없이 재 사용)		/***** param 2 *****/
        	
        	
        	myModal.open({
        		url: url,
        		pars: params,
        		titleBarText: '담당자 변경',		//titleBarText 속성 추가하였음.(원 Axisj에는 없었던것)
        		method:"POST",
        		top: 150,
        		width: 900,
        		closeByEscKey: true				//esc 키로 닫기
        	});
        	    	
        	$('#myModalCT').draggable();
    	}
    },
    
    //고객리스트 체크박스 전체체크
    chkCustAll: function(th){
    	if(th.checked){
    		$('input:checkbox[name=mCheck]').attr('checked', true);		//고객전체 체크
    	}else{
    		$('input:checkbox[name=mCheck]').removeAttr('checked');		//고객전체 체크해제
    	}
    	
    	fnObj.clickCheckbox();		//고객 체크 이벤트 함수 호출(담당자 변경 버튼 활성화 여부 등.)
    },
    
    //고객 체크
    clickCheckbox: function(th, idx){
    	var l = $('input:checkbox[name=mCheck]:checked').length
    	if(l>0){
    		$('#aChngChrgStaff').attr('class','btn_change_network_on');	//담당자변경 버튼 활성화
    	}else{
    		$('#aChngChrgStaff').attr('class','btn_change_network');	//담당자변경 버튼 비활성화
    	}
    },
    
    
  	//컬럼 소팅
    doSort: function(idx){
    	
    	mySorting.setSort(idx);				//소팅객체를 소팅한다.(상태값들의 변화)
    	    	
		//소팅
        sortByKey(myGrid.getList(), mySorting.nowSortCol, mySorting.nowDirection);
        myGrid.refresh();
         
        
		mySorting.applySortIcon();			//소팅화면적용
    }
    
    
  	//################# else function :E #################
  	
  	
    
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	fnObj.pageStart();		//화면세팅
	fnObj.doSearch(1);		//검색
	//fnObj.setTooltip();
});
</script>