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

<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/new_style.css'/>" rel="stylesheet" type="text/css">

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>

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




<script type="text/JavaScript">
//레이어 보였다 안보였다
	function showlayer(id)
	   {if(id.style.display == 'none')
		   {id.style.display='block';}
		   else{id.style.display = 'none';}
	   }
</script>

<style>
body {font-size:0.75em; line-height:160%; padding-left:10px; padding-right:10px; font-family:"돋움",Dotum,"굴림",Gulim,arial,sans-serif; color:#555;}

.vm_typho { vertical-align:middle; }
.vm_typho input, label { vertical-align:middle; }
/******************인풋, 셀렉트모음********************/
.input_s_b { border:#b5b5b5 solid 1px; vertical-align:middle; height:28px; box-sizing:border-box; font-size:12px; letter-spacing:-0.05em; color:#787878; padding:5px; line-height:18px; }
.sel_basic { border:#b5b5b5 solid 1px; vertical-align:middle; height:28px; box-sizing:border-box; font-size:12px; letter-spacing:-0.05em; color:#787878; padding:5px; line-height:18px; }
.w_date { width:82px; }
.w200px { width:200px; }
.w240px { width:240px; }
.w20pro { width:20%; }
.w30pro { width:30%; }
.w100pro { width:100%; }
.f_redPoint { color:#fc5262; }
.f_bluePoint { color:#4565d0; }

/* 게시판 인풋관련 */
.money_input_b { width:165px; border:#dadada solid 1px; height:21px; font-family:Tahoma, Geneva, sans-serif; font-size:11px; letter-spacing:0; text-align:right; margin-right:6px; padding-right:4px; color:#666666; }
.yesno_select { border:#c2c2c2 solid 1px; width:38px; height:23px; color:#858585; box-sizing:border-box; }
.select_b { border:#c2c2c2 solid 1px; height:23px; color:#858585; box-sizing:border-box; }
.period { font-size:11px; letter-spacing:-0.6px; }
.input_b {height:23px; border:#c2c2c2 solid 1px!important; text-indent:4px; box-sizing:border-box; }
.input_b[disabled] { border:#c2c2c2 solid 1px; background:#f3f3f3; }
.input_b[readonly] { border:#c2c2c2 solid 1px; background:#f3f3f3; }

.input_b2 {height:23px; border:#c2c2c2 solid 1px; text-indent:4px; box-sizing:border-box; }
.input_b2[disabled] { border:#c2c2c2 solid 1px; background:#f3f3f3; }
.input_b2[readonly] { border:#c2c2c2 solid 1px; background:#f3f3f3; }

.input_b3 {height:23px; border:#c2c2c2 solid 1px; padding-left:4px; box-sizing:border-box; }
.input_b3[disabled] { border:#c2c2c2 solid 1px; background:#f3f3f3; }
.input_b3[readonly] { border:#c2c2c2 solid 1px; background:#f3f3f3; }

.input_mrb {height:23px; border:#c2c2c2 solid 1px; box-sizing:border-box; text-align:right; padding-right:4px; }
.input_mrb[disabled] { border:#c2c2c2 solid 1px; background:#f3f3f3; }
.input_mrb[readonly] { border:#c2c2c2 solid 1px; background:#f3f3f3; }

.h3_title_basic { background:url(../images/common/bu_h3_title.gif) no-repeat 0 3px; color:#2a3a5b; font-family:'NanumBarunL'; font-weight:bold; font-size:16px; letter-spacing:-0.04em; padding-left:12px; margin-bottom:10px; }
.h3_title_basic span { vertical-align:middle; }
.h3_title_basic .sub_desc { font-size:13px; margin-left:6px; color:#6a798e; font-family:'NanumBarun'; font-weight:normal; }


/* 버튼모음 */
.btn_baordZone2 { margin-top:20px; text-align:center; margin-bottom:20px; }
.btn_baordZone2 a { border-radius:2px; letter-spacing:-0.8px; color:#fff; padding:6px 15px 7px; line-height:16px; height:16px; font-size:12px; vertical-align:middle; margin-left:10px; display:inline-block; min-width:60px;  }
.btn_baordZone2 a:first-child { margin-left:0px; }

.btn_blueblack { background:#59647a; }
.btn_blueblack2 { background:#33577b; }
.btn_witheline { border:#bdc3d1 solid 1px; color:#232c3f!important; }
.btn_grayline { background:#efefef; border:#bfbfbf solid 1px; color:#232c3f!important;  }

.btnZoneBox { text-align:center; margin-top:25px; }
.btnZoneBox a { display:inline-block; margin-left:9px; text-align:center; vertical-align:middle; line-height:1.6; }
.btnZoneBox a:first-child { margin-left:0px; }
.btnPageZone + .btnZoneBox { border-top:#7f7f7f solid 1px; padding-top:25px; }

/* 직원성과 시뮬레이션 */
.grid_title2 { font-weight:bold; color:#3b4354; font-size:12px; margin-bottom:6px; }
.output_simul_memBox { border:#c8cbce solid 1px; border-top:none; border-bottom-left-radius:3px;border-bottom-right-radius:3px; padding:5px 15px; background:url(../images/common/bg_detailcon.png) repeat-x 0 0; float:none; *zoom:1;}
.output_simul_memBox:after { content:""; display:block; height:0px; clear:both; }
.output_simul_memBox li { float:left; display:inline-block; line-height:1.8; margin-left:20px;word-break:keep-all; vertical-align:middle; }
.output_simul_memBox li strong { color:#242424; font-weight:normal; }
.output_simul_memBox li em { margin-left:5px; font-size:11px; }
.output_simul_memBox label, .output_simul_memBox input { vertical-align:middle; line-height:1.8; letter-spacing:-0.03em!important; }
.output_simul_memBox input { margin-right:4px; }

.output_simul_memBox2 { border:#c8cbce solid 1px; border-radius:3px; padding:5px 15px; float:none; *zoom:1;}
.output_simul_memBox2:after { content:""; display:block; height:0px; clear:both; }
.output_simul_memBox2 li { float:left; display:inline-block; margin-left:8px;word-break:keep-all; vertical-align:middle; background:url(../images/common/bu_simul_dot.png) no-repeat left center; padding-left:10px; }
.output_simul_memBox2 li:first-child { background:none; margin-left:0px; padding-left:0px; }
.output_simul_memBox2 li strong { color:#555; font-weight:normal; letter-spacing:-0.03em; }
.output_simul_memBox2 li em { margin-left:3px; font-size:11px; color:#999; letter-spacing:-0.03em; }
.output_simul_memBox2 li.current a { background:url(../images/common/icon_check.png) no-repeat left center; padding-left:12px; font-weight:bold; color:#202020; }


.datagrid_input td.spanspace span { margin-right:10px; display:inline-block; }
.datagrid_input td.spanspace span + input { margin-right:10px; display:inline-block; }
.datagrid_input .resultBEP { color:#202020; }
.icon_goal { display:inline-block; vertical-align:middle; border-radius:2px; padding:3px 5px; width:47px; display:inline-block; color:#fff; font-size:11px; text-align:center; line-height:1.2; letter-spacing:-0.03em;  }
.icon_goal.g_exceed { background:#2c5186; }
.icon_goal.bep_exceed { background:#387cc8; }
.icon_goal.shortfall { background:#fc6a6a; }
.conditiontext { vertical-align:middle; margin-left:15px; }
.conditiontext .equalsign { color:#a9a9a9; }
.conditiontext .result { color:#202020; }
.conditiontext em { color:#777; margin-left:5px; vertical-align:middle; }

.output_simul_tb { letter-spacing:-0.08px; width:100%; border:#b9c1ce solid 1px;  font-size:12px; }
.output_simul_tb thead th {background:#d8dce3; font-weight:bold; color:#3b4354; line-height:16px; padding:6px 5px 6px; text-align:center; border-right:#b9c1ce solid 1px; border-bottom:#b9c1ce solid 1px; }
.output_simul_tb thead th em { font-size:11px; color:#616b7e; margin-left:3px; }
.output_simul_tb thead th:first-child { border-left:none; }
.output_simul_tb tbody th { font-weight:normal; background:#f3f4f7; padding:4px 8px 4px; border-top:#d6d7d9 solid 1px; border-right:#d6d7d9 solid 1px; }
.output_simul_tb tbody td { font-family:"돋움"; border-top:#e6e6e6 solid 1px; border-left:#e6e6e6 solid 1px; line-height:16px; padding:4px 5px 4px; color:#6d6c74; text-align:center; letter-spacing:-0.5px; color:#6d6c74; letter-spacing:-0.5px; line-height:16px;}
.output_simul_tb tfoot tr { background:#ebedf1; }
.output_simul_tb tfoot th { border-top:#d2d3d5 solid 1px; font-weight:bold; color:#3b4354; padding:5px 5px 5px; text-align:center; }
.output_simul_tb tfoot em { font-weight:normal; }
.output_simul_tb tfoot td { border-left:#d2d3d5 solid 1px; border-top:#d2d3d5 solid 1px; color:#484e5b; padding:5px 5px 5px; text-align:center; }
.output_simul_tb tfoot .sum_result { color:#F00; }
.sum_result { color:#eb2b2b; }
.output_simul_tb .txt_income { text-align:right; letter-spacing:0; color:#2069dd;}
.output_simul_tb .txt_num_st { text-align:right; letter-spacing:0; }
.output_simul_tb .txt_goal { text-align:right; letter-spacing:0; }
.output_simul_tb .txt_conti_st { text-align:right; letter-spacing:0; color:#eb2b2b; }
.output_simul_tb .txt_total_st { text-align:right; letter-spacing:0; color:#eb2b2b; }
.output_simul_tb input { height:20px; line-height:20px; border:#dadada solid 1px; text-indent:4px; box-sizing:border-box; vertical-align:middle; *text-indent:0px; }
.output_simul_tb input[readonly] { background: #eee; color: #676767; text-shadow: 0px 1px #fff; }

.simulation { background:#fffee0; }
.simtype { font-family:Tahoma, Geneva, sans-serif!important; font-size:12px; letter-spacing:0!important; text-align:right!important; padding-right:4px; box-sizing:border-box; width:80px;}
.simtype2 { font-family:Tahoma, Geneva, sans-serif!important; font-size:12px; letter-spacing:0!important; text-align:right!important; padding-right:4px; box-sizing:border-box; width:100%; }
.btn_s_type3 { background:#4e5a72; border:#394960 solid 1px; border-radius:3px; height:20px; min-width:30px; padding:0 7px; font-size:11px; color:#fff!important; font-weight:normal; display:inline-block; vertical-align:middle; line-height:20px; }

.h3_simtitle_st { background:url(../images/common/board/bg_tab06_repeat.gif) repeat-x 0 bottom; border:#b8bfcc solid 1px; border-top-left-radius:5px; border-top-right-radius:5px; padding:7px 15px 9px; }
.h3_simtitle_st .title { background:url(../images/common/bu_h3_title.gif) no-repeat 0 center; color:#2a3a5b; font-family:'NanumBarunL'; font-weight:bold; font-size:17px; letter-spacing:-0.02em; padding-left:12px; line-height:1; vertical-align:middle; }
.h3_simtitle_st span, .h3_simtitle_st a, .h3_simtitle_st ul { vertical-align:middle; }

.h4_title_basic { background:url(../images/common/bu_h4_title.gif) no-repeat left center; padding-left:18px; color:#2a3a5b; font-family:'NanumBarunL'; font-weight:bold; font-size:13px; line-height:1.2; letter-spacing:-0.04em; vertical-align:middle; }
.h4_title_basic span, .h4_title_basic em, .h4_title_basic a, .h4_title_basic button { vertical-align:middle; }
.h5_title_basic { background:url(../images/common/bu_h5_title.gif) no-repeat left center; padding-left:7px; color:#3673b7; font-family:'NanumBarunL'; font-weight:bold; font-size:12.5px; line-height:1.2; letter-spacing:-0.04em; vertical-align:middle; }
.h5_title_basic span, .h5_title_basic em, .h5_title_basic a, .h5_title_basic button { vertical-align:middle; }
.h5_title_basic .btn_s_type_g { height:inherit; line-height:1; font-family:"돋움",Dotum,"굴림",Gulim,arial,sans-serif; }

.simul_boxWrap { border:#b8bfcc solid 1px;  border-top:none; background:url(../images/common/bg_detailcon.png) repeat-x 0 0; }
.simmul_dllist { border-top:#c1c1c1 dashed 1px; }
.simmul_dllist:first-child { border-top:none; }
.simmul_dllist dt { float:left; width:120px; padding:12px 0px 15px 13px; box-sizing:border-box; }
.simmul_dllist dd { width:auto; overflow:hidden; border-left:#dadada solid 1px; padding:12px 18px 15px 18px; box-sizing:border-box; }
.simmul_dllist dd h5 { margin-bottom:8px; margin-top:20px; }
.simmul_dllist dd h5:first-child { margin-top:2px; }
.simul_memberBox { border:#c8cbce solid 1px; border-radius:3px; padding:5px 10px; float:none; *zoom:1; }
.simul_memberBox:after { content:""; display:block; height:0px; clear:both; }

.stat_type_ulList { float:none; *zoom:1; display:inline-block; }
.stat_type_ulList:after { content:""; display:block; clear:both; height:0; }
.stat_type_ulList li { float:left; vertical-align:middle; border:#9aaacc solid 1px; border-radius:20px; font-size:11px; padding:0 5px; box-sizing:border-box; background:#f7f9fc; margin:2px 0 2px 5px; }
.stat_type_ulList li span { vertical-align:middle; letter-spacing:0em; }
.stat_type_ulList li .code { vertical-align:middle; color:#3d5da1; }
.stat_type_ulList li .btn_delete { background:url(../images/mypage/icon_delete2.gif) no-repeat center center; width:12px; height:16px; display:inline-block; vertical-align:middle; margin-left:2px; cursor:pointer; opacity:0.7; }
.stat_type_ulList li .btn_delete em { display:none; }

.sim_btnZone { text-align:right; margin-top:-30px; margin-bottom:10px; }
.sim_btnZone a { margin-left:6px; background:url(../images/common/bg_btn_gra_s.gif) repeat-x 0 center; border:#c4c4c4 solid 1px; border-radius:2px; min-width:30px; padding:4px 6px; font-size:11px; color:#666!important; font-weight:normal; display:inline-block; vertical-align:middle; letter-spacing:-0.05em; box-sizing:border-box; line-height:13px; }
.sim_btnZone a strong { color:#242424; }
.sim_btnZone a:first-child { margin-left:0px; }

.total_wk_tb_wrap { text-align:right; }

.total_wk_perform { border-bottom:#9298a2 solid 1px; display:inline-block; border:#b9c1ce solid 1px; font-size:12px; }
.total_wk_perform th { font-weight:normal; background:#d8dce3; padding:4px 10px 4px; border-top:#b9c1ce solid 1px; border-left:#b9c1ce solid 1px; line-height:1; text-align:center;  }
.total_wk_perform th.bg_gray { background:#e7e9ec; font-weight:normal; }
.total_wk_perform td { border-top:#b9c1ce solid 1px; border-left:#dadada solid 1px; padding:10px 7px 5px 7px; color:#797979; text-align:right; font-size:14px; min-width:90px; font-weight:bold; }
.total_wk_perform th:first-child { border-left:none; font-weight:bold; }
.total_wk_perform tr:first-child th, .total_wk_perform tr:first-child td { border-top:none; }
.total_wk_perform .txt_money_red { color:#eb2b2b; }
.total_wk_perform .txt_money_black { color:#202020; }
.ib_AllWrap { width:1200px; margin:0 auto; }
.employee_list { color:#84888d; font-size:11px; letter-spacing:-0.5px; margin-left:3px; }
.employee_list span { color:#6d6c74; margin-right:2px; }
.btn_delete_employee { background:url(../images/common/board/btn_board_collection.gif) no-repeat; width:13px; height:13px; line-height:13px; display:inline-block; vertical-align:middle; background-position:5px 5px; padding:5px 4px; }
.btn_delete_employee em { position:absolute; left:-9999999999999px; visibility:hidden; }
.btn_s_type_g { background:url(../images/common/bg_btn_gra_s.gif) repeat-x 0 center; border:#c4c4c4 solid 1px; border-radius:2px; height:23px; min-width:30px; padding:4px 6px; font-size:11px; color:#666!important; font-weight:normal; display:inline-block; vertical-align:middle; letter-spacing:-0.05em; box-sizing:border-box; line-height:13px; }


#tempmodalPOP { position:absolute; left:100px; top:100px; z-index:5; background:#fff; box-shadow:10px 10px 10px rgba(0,0,0, 0.5); }

.modalWrap2 h1 { background:#20304a; color:#fff; padding:8px 15px; height:26px; font-size:12px; line-height:16px; height:16px; }

.modalWrap2 .btn_modal_min { position:absolute; right:53px; top:11px; background:url(../images/common/btn_modal_min.gif) no-repeat; width:10px; height:9px; display:inline-block; }
.modalWrap2 .btn_modal_max { position:absolute; right:34px; top:11px; background:url(../images/common/btn_modal_max.gif) no-repeat; width:11px; height:9px; display:inline-block; }
.modalWrap2 .btn_modal_close { position:absolute; right:15px; top:11px; background:url(../images/common/btn_modal_close.gif) no-repeat; width:11px; height:9px; display:inline-block; }
.modalWrap2 .btn_modal_max em, .modalWrap2 .btn_modal_min em, .modalWrap2 .btn_modal_close em { position:absolute; left:-999999999999999999px; overflow:hidden; width:0px; height:0px; }

.modalWrap2 .mo_container { margin:0 15px; padding:20px 0 25px; }
.modalWrap2 .mo_container2 { margin:0; padding:0px; }
.modalWrap2 .mo_footer { border-top:#dadada solid 1px; padding-bottom:30px; }

.modalWrap2 .gtabZone { border-left:none; }
.modalWrap2 .gtabZone ul { margin-top:12px; margin-left:16px; }

.modalWrap2 h2.title { font-size:12px; font-weight:bold; color:#242424; line-height:1.6; margin-bottom:8px; }
.modalWrap2 h2.title_arrow { float:none; *zoom:1; background:url(../images/common/h2_mo_title.gif) no-repeat 0 3px; line-height:1.6; font-size:12px; font-weight:bold; color:#345698; vertical-align:middle; padding-left:10px; margin-bottom:5px; position:relative; }
.modalWrap2 h2.title_arrow:after { content:""; display:block; clear:both; height:0px; }

.popup_ListBox { position:relative; border:1px solid #c1c1c1; border-top-left-radius:3px; border-top-right-radius:3px; background:#f9f9f9; overflow:auto; overflow-x:hidden; max-height:109px; border-bottom:none; }
.labelList_st { float:none; *zoom:1; padding:15px; margin-left:-15px; }
.labelList_st:after { content:""; display:block; clear:both; height:0; }
.labelList_st li { float:left; vertical-align:middle; min-width:20%; margin-left:15px; }
.labelList_st li label { display:inline-block; vertical-align:middle; }
.labelList_st li input { vertical-align:middle; }
.labelList_st li span { vertical-align:middle; margin-left:4px; }

.memberBox_controll { border:1px solid #c1c1c1; border-bottom-left-radius:3px; border-bottom-right-radius:3px; height:11px; background:#f5f5f5; }
.memberBox_controll:hover { background:#f0f0f0; }
.memberBox_controll em { position:absolute; left:-99999999999999px; visibility:hidden; font-size:0; }
.memberBox_controll .btn_td_close { background:url(../images/common/btn_td_close.gif) no-repeat center 3px; height:11px; width:100%; display:block; }
.memberBox_controll .btn_td_open { background:url(../images/common/btn_td_open.gif) no-repeat center 3px; height:11px; width:100%; display:block; }


/* IB투자 or 분석쪽 직원정보 에 따라 컬럼 숨기기 */
<c:if test="${param.k eq 'IB'}">
.hide_anal {display:none;}
</c:if>
<c:if test="${param.k eq 'ANAL'}">
.hide_ib {display:none;}
</c:if>

</style>




	<table id="SGridTarget" class="output_simul_tb mgt15" summary="IB투자 성과보수 안내 (직원명, 연봉, BEP, 목표, 실적, 성과기준, 평가, 적용비율, 기여수익, PS배분, PI배분, PS+PI)">
		<caption>IB투자 성과보수 안내</caption>
		<colgroup>
			<col width="100"> <!--직원-->
			<col width="100"> <!--연봉-->
			<col width="100"> <!--목표-->
			<col width="100"> <!--ROLE RATE-->
		</colgroup>
		<thead>
			<tr>
				<th scope="col">직원</th>
				<th scope="col" class="hide_ib">연봉</th>
				<th scope="col" class="hide_ib">목표</th>
				<th scope="col" class="hide_anal">ROLE RATE</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">이명철</th>
				<td class="txt_income"><input type="text" class="input_b simulation simtype2" title="연봉입력" value="1.50" /></td>
				<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="목표금액입력" value="800.00" /></td>
				<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="기여도입력" value="0.2" /></td>				
			</tr>
			<tr>
				<th scope="row">이주훈</th>
				<td class="txt_income"><input type="text" class="input_b simulation simtype2" title="연봉입력" value="1.50" /></td>
				<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="목표금액입력" value="800.00" /></td>
				<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="기여도입력" value="0.2" /></td>	
			</tr>			
		</tbody>	
		<tfoot>	
			<tr>
				<th scope="row">합계</th>
				<td class="txt_income hide_ib"><strong><span id="sumIncome">5.10</span></strong></td>
				<td class="txt_goal hide_ib"><strong><span id="sumGoal">2,600.00</span></strong></td>
				<td class="txt_goal hide_anal"><strong><span id="sumRoleRate">2,600.00</span></strong></td>
			</tr>
		</tfoot>
	</table>

	<div class="btn_baordZone2">
		<a href="javascript:fnObj.saveStaffInfo();" class="btn_blueblack"><strong>저장</strong></a>
	</div>
	
	


	
<script type="text/javascript">

//Global variables :S ---------------

//공통코드

//var myModal = new AXModal();		// instance
var myGrid = new SGrid();			// instance		new sjs


var g_year = '${param.y}';				//연도
var g_knd = '${param.k}';					//종류	'IB' or 'ANAL'

var g_mezzUser;						//직원정보

/* var g_mode = "new";					//"new", "update" 

var g_psMezzId;						//시스템 id

var g_yearList = [];				//연도 배열 (2015년 ~ 현재년도)

var g_year;							//선택 연도
var g_mezzTypeList;					//유형정보
var g_mezzIbUser;					//IB투자 직원정보
var g_mezzAnalUser;					//기업분석 직원정보

var g_sumOutcome = 0;				//총 성과급 */


//var g_entryUserList = []; 						//선택한 유저 리스트.

//Global variables :E ---------------


/*
 * 코드등을 불러오는 함수(preloadCode), 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
 var fnObj = {
		
	preloadCode : function(){
		
	},
	
	pageStart : function(){

		//-------------------------- 그리드 설정 (IB투자) :S ----------------------------
    	/* 그리드 설정정보 */
    	var configObj = {
    		
    		targetID : "SGridTarget",		//그리드의 id
    		
    		//그리드 컬럼 정보
    		colGroup : [
				{key:"name",		formatter:function(obj){				//직원명										
										return obj.value;
									}},
				{key:"psStaffIncome",formatter:function(obj){				//연봉
										var html = '<input type="text" class="input_b simulation simtype2" onchange="fnObj.syncInfo(this,\'income\',' + obj.index + ');" ';
										html += 'title="연봉입력" value="' + (!isEmpty(obj.value)?obj.value:'') + '"/>';
										return html;
	            					}},
	            {key:"psStaffGoal",	formatter:function(obj){				//목표
						            	var html = '<input type="text" class="input_b simulation simtype2" onchange="fnObj.syncInfo(this,\'goal\',' + obj.index + ');" ';
										html += 'title="목표금액입력" value="' + (!isEmpty(obj.value)?obj.value:'') + '"/>';
										return html;
									}},
				{key:"psMezzRate",	formatter:function(obj){				//ROLE RATE
										var html = '<input type="text" class="input_b simulation simtype2" onchange="fnObj.syncInfo(this,\'rate\',' + obj.index + ');" ';
										html += 'title="기여도입력" value="' + (!isEmpty(obj.value)?obj.value:'') + '"/>';
										return html;
	            					}}
            ],
            
            body : {
                onclick: function(obj, e){
                	/* ***** obj *****
                		obj.c 		- column index,
						obj.index 	- row index,
						obj.item 	- row data object,
						obj.list 	- grid data object
                	*/
                	
                }
            }
            
    	};
    	
    	
    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
    	var rowHtmlStr = '<tr>';    	
    	rowHtmlStr += '<th scope="row">#[0]</th>';
    	rowHtmlStr += '<td class="txt_income hide_ib">#[1]</td>';
    	rowHtmlStr += '<td class="txt_goal hide_ib">#[2]</td>';
    	rowHtmlStr += '<td class="txt_goal hide_anal">#[3]</td>';
    	rowHtmlStr += '</tr>';
    	
    	configObj.rowHtmlStr = rowHtmlStr;
        
    	
    	myGrid.setConfig(configObj);		//그리드 설정정보 세팅
    	//-------------------------- 그리드 설정 (IB투자) :E ----------------------------
    	
	},
	
	
	//메자닌 성과 설정 정보
	doSearch : function(){
 		
		if(g_knd == 'IB'){
			//IB투자 직원정보(개인 실적정보 포함)
			this.getPsMezzStaff('IB');				//동기
		}else{
			//기업분석 직원정보(개인 실적정보 포함)
			this.getPsMezzStaff('ANAL');			//동기
		}
		
		//하단 합계 계산
		this.setSumInfo();
	},
	
	
	//직원정보(개인 실적정보 포함)	... knd : 'IB' or 'ANAL'
	getPsMezzStaff : function(knd){
		
		var url = contextRoot + "/stats/getPsMezzStaff.do";	   	
		var param = { 
				year : g_year,
				role : knd
		};
		var callback = function(result){
    		var obj = JSON.parse(result);
    		//var list = obj.resultList;
    		
    		g_mezzUser = obj.resultList;						//IB 직원정보 ... global variable
    	};
    	
    	commonAjax("POST", url, param, callback, false);		//false 동기
	},
	
	
	//하단 합계 계산
	setSumInfo : function(){
		
		var sumIncome = 0;						//연봉 합계
		var sumGoal = 0;						//목표 합계
		var sumRoleRate = 0;					//ROLE RATE 합계
		
		for(var i=0; i<g_mezzUser.length; i++){			
			sumIncome += g_mezzUser[i].psStaffIncome * 1;			//연봉 합계
			sumGoal += g_mezzUser[i].psStaffGoal * 1;				//목표 합계
			sumRoleRate += g_mezzUser[i].psMezzRate * 1;			//ROLE RATE 합계
		}
		
		//표 데이터 적용
		myGrid.setGridData({
			list: g_mezzUser
		});
		
		$('#sumIncome').html(sumIncome.toFixed(2));				//연봉
		$('#sumGoal').html(sumGoal.toFixed(2));					//목표
		$('#sumRoleRate').html(sumRoleRate.toFixed(2));			//ROLE RATE
	},
	
	
	//직원 정보 싱크
	syncInfo : function(th, knd, idx){		
		var k = '';
		if(knd == 'income') k = 'psStaffIncome';
		else if(knd == 'goal') k = 'psStaffGoal';
		else if(knd == 'rate') k = 'psMezzRate';
		
		g_mezzUser[idx][k] = $(th).val();			//데이터 동기화
		
		this.setSumInfo();			//합계 계산
	},
	
	
	//정보 저장
	saveStaffInfo : function(){
		
    	var url = contextRoot + "/stats/doSaveStaffInfo.do";
    	var param = {
    			//role 		: g_knd,							//유형 'IB' or 'ANAL'
    			staffInfo	: JSON.stringify(g_mezzUser)		//표 정보
    	};
    	
    	//alert(JSON.stringify(param));
    	//return;
    	
    	var callback = function(result){    			
    		var obj = JSON.parse(result);
    		
    		if(obj.result == "SUCCESS"){    			
    			//alert("저장 되었습니다!");    			
    			window.close();
    			
    			//부모창 재로딩
    			//직원정보
    			opener.fnObj.getPsMezzStaff(g_knd);				//동기    			    			
    			//설정 정보를 통한 성과 정보 계산 (설정 정보가 있을 경우)
    			
    			opener.fnObj.setPsMezzInfo();
    			
    			toast.push('[OK] 시뮬레이션 실행!');
    		}else{
    			//alertMsg();
    		}    		
    	};
    	
    	commonAjax("POST", url, param, callback);
	}
			
			
 };//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();		//공통코드 or 각종선로딩코드
	fnObj.pageStart();
	fnObj.doSearch();

});
</script>