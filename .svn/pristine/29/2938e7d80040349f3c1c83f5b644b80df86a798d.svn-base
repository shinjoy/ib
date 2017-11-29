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
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js?ver=0.1"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->




<script type="text/JavaScript">
	//유형선택 팝업
	function showMezzType(id, knd){		//knd ... O:open, C:close
		if(knd == 'O'){
			id.style.display='block';
			$(id).css('left',	$('#aMezzType').position().left);
			$(id).css('top',	$('#aMezzType').position().top);
		}else{	//knd == 'C'
			id.style.display = 'none';
		}
	}
</script>

<style>
body {font-size:0.75em; line-height:160%; font-family:"돋움",Dotum,"굴림",Gulim,arial,sans-serif; color:#555;}

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

.radio_list { margin-right:10px; }
.radio_list label { margin-left:25px;  *margin-left:10px; }
.radio_list label input { margin-right:3px; border:none; *margin-right:0px; *paddnig:0px; }
.radio_list label:first-child { margin-left:0px; }

.radio_list2 label { margin-left:15px;  *margin-left:10px; vertical-align:middle; display:inline-block; }
.radio_list2 label input { margin-right:3px; border:none; *margin-right:0px; *paddnig:0px; }
.radio_list2 label:first-child { margin-left:0px; }
.radio_list2 label input, .radio_list2 label span, .radio_list2 label em { vertical-align:middle; }

.radio_list3 { float:none; *zoom:1; width:100%; }
.radio_list3:after { content:""; display:block; clear:both; height:0;}
.radio_list3 label { margin-right:15px;  *margin-right:10px; vertical-align:middle; display:inline-block; float:left; }
.radio_list3 label input { margin-right:3px; border:none; *margin-right:0px; *paddnig:0px; }
.radio_list3 label input, .radio_list3 label span, .radio_list3 label em { vertical-align:middle; }

.txtarea_b { border:#c2c2c2 solid 1px; height:90px; line-height:16px; color:#858585; padding:4px; box-sizing:border-box; text-align:left; }
.txtarea_b2 { border:#c2c2c2 solid 1px; height:150px; line-height:16px; color:#858585; padding:4px; box-sizing:border-box; text-align:left; }
.txtarea_b3 { border:#c2c2c2 solid 1px; height:60px; line-height:16px; color:#858585; padding:4px; box-sizing:border-box; text-align:left; }
.txtarea_b4 { border:#c2c2c2 solid 1px; height:240px; line-height:16px; color:#858585; padding:4px; box-sizing:border-box; text-align:left; }

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

.p_blueblack_btn { background:#59647a; border:#4f5a6f solid 1px; border-radius:2px; color:#ffffff!important; padding:4px 12px 3px; min-width:56px; }
.p_blueblack2_btn { background:#33577b; border:#58637b solid 1px; border-radius:2px; color:#ffffff!important; padding:4px 12px 3px; min-width:56px; }
.p_bluelight_btn { background:#2574ab; border:#1b6fa9 solid 1px; border-radius:2px; color:#ffffff!important; padding:4px 12px 3px; min-width:56px; }
.p_withelin_btn { border:#bdc3d1 solid 1px; color:#232c3f!important; border-radius:2px; padding:4px 12px 3px; min-width:56px; }
.p_grayline_btn {background:#efefef; border:#bfbfbf solid 1px; color:#232c3f!important; border-radius:2px; padding:4px 12px 3px; min-width:56px; }


/*검색영역*/
.carSearchBox { background:url(../images/work/bg_memo_search.gif) repeat-x 0 0; border:#b8bfcc solid 1px; box-shadow:0px 1px 0px #eceef1; height:24px; padding:11px 15px 11px 15px; position:relative; vertical-align:middle; }
.carSearchBox .input_b { box-sizing:border-box; width:80px; }
.carSearchBox .input_b2 { box-sizing:border-box; }
.carSearchBox .select_b { box-sizing:border-box; }
.carSearchBox span, .carSearchBox button, .carSearchBox input, .carSearchBox label, .carSearchBox select { vertical-align:middle; }
.carSearchBox .divide_line { border-left:#cfcfcf solid 1px; margin-left:8px; padding-left:18px; }

.carSearchBox .carSearchtitle { font-weight:bold; color:#3a485e; padding-right:5px; }
.carSearchBox .rd_List { display:inline-block; }
.carSearchBox .rd_List label { margin-left:8px; }
.carSearchBox .rd_List label:first-child { margin-left:0px; }
.carSearchBox .rd_List input + span { margin-left:3px; }

/*tab*/
.tabZone_st03 { float:none; *zoom:1; width:100%; height:35px; padding-top:3px; padding-left:3px; background:#547197; border:#3c5e8a solid 1px; /*background:#7d8fa2; border:#63788e solid 1px;*/ box-sizing:border-box; }
.tabZone_st03:after { content:""; display:block; clear:both; height:0; }
.tabZone_st03 li { float:left; background:url(../images/common/board/bg_tab03_divide.gif) no-repeat right 8px; /*background:url(../images/common/bg_tabdiv3.png) no-repeat right 9px;*/ height:29px; overflow:hidden; }
.tabZone_st03 li a {font-size:13px; line-height:15px; height:15px; vertical-align:middle; padding:5px 1.8em 9px; display:inline-block; color:#fff; letter-spacing:-0.05em; }
.tabZone_st03 li.current { border-bottom:#fff solid 2px; }
.tabZone_st03 li.current a { color:#303030; background:#FFF; font-size:14px; font-weight:bold; padding:8px 30px 6px; }

/*테이블*/
.datagrid_input { font-family:"돋움"; letter-spacing:-0.08px; width:100%; border-bottom:#c3c3c3 solid 1px; border-right:#c3c3c3 solid 1px; border-left:#c3c3c3 solid 1px; border-top:#c3c3c3 solid 1px; font-size:12px; }
.datagrid_input tbody tr.tr_divide_line td, .datagrid_input tbody tr.tr_divide_line th { border-top:#c1c1c1 solid 1px; background:#f8f9f9; }
.datagrid_input tbody th.bg_gary { border-right:#c1c1c1 solid 1px; background:#f8f9f9; }
.datagrid_input thead th { background:#efefef!important; font-weight:normal; color:#3b4354!important; line-height:16px; padding:6px 10px 7px; text-align:center!important; border-right:#d4d4d4 solid 1px; border-top:#d4d4d4 solid 1px; border-bottom:#d4d4d4 solid 1px; border-left:#d4d4d4 solid 1px; text-align:left; font-weight:normal!important; }
.datagrid_input tbody th { background:#efefef; font-weight:normal; color:#3b4354; line-height:16px; padding:6px 10px 7px; text-align:center; border-right:#d4d4d4 solid 1px; border-top:#d4d4d4 solid 1px; border-bottom:#d4d4d4 solid 1px; border-left:#d4d4d4 solid 1px; text-align:left;  }
.datagrid_input tbody td { border-top:#dfdfdf solid 1px; border-left:#dfdfdf solid 1px; line-height:16px; padding:6px 10px 7px; color:#6d6c74; text-align:center; letter-spacing:-0.5px; letter-spacing:-0.5px; line-height:16px; text-align:left;  word-break:break-all; }
.datagrid_input tbody tr th:first-child, .datagrid_input tbody tr td:first-child { border-left:none; }
.datagrid_input tbody tr:first-child td, .datagrid_input tbody tr:first-child th { border-top:none; }
.datagrid_input tbody tr:last-child th { border-bottom:none; }


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

</style>



	<div class="ib_AllWrap">
		<div class="carSearchBox">
			<span class="carSearchtitle"><label for="psYear">직원성과평가 시스템</label></span>
			<span id="spanPsYear"></span>
			<!-- <select class="select_b w_date" id="psYear" title="연도선택">
				<option>2017</option>
				<option selected>2016</option>
				<option>2015</option>
			</select> -->
		</div>
		<ul class="tabZone_st03 mgt20">
			<li id="liTabAll" class="current"><a href="javascript:fnObj.changeTab('ALL');">전체</a></li>
			<li id="liTabMezz"><a href="javascript:fnObj.changeTab('MEZZ');">Mezzanine</a></li>
			<li id="liTabMna"><a href="javascript:fnObj.changeTab('MNA');">M&amp;A</a></li>
			<li id="liTabTips"><a href="javascript:fnObj.changeTab('TIPS');">TIPS</a></li>
		</ul>		
		<h3 class="h3_simtitle_st mgt20">
			<span class="title">Mezzanine</span>
			<a href="javascript:fnObj.openMezzTypePop();" id="aMezzType" class="btn_s_type3 mgl30">유형선택</a>
			<ul class="stat_type_ulList mgl10" id="ulMezzType">
				<!-- <li><span class="code">CB</span><span class="btn_delete"><em>삭제</em></span></li>
				<li><span class="code">EB</span><span class="btn_delete"><em>삭제</em></span></li>
				<li><span class="code">Pre-IPO</span><span class="btn_delete"><em>삭제</em></span></li>
				<li><span class="code">M&amp;A</span><span class="btn_delete"><em>삭제</em></span></li> -->
			</ul>
		</h3>
		<div class="simul_boxWrap">
			<dl class="simmul_dllist">
				<dt><h4 class="h4_title_basic">IB투자_영업</h4></dt>
				<dd>
					<h5 class="grid_title2"><span>[대상자선택]</span><a href="javascript:fnObj.userPop('IB');" class="btn_s_type_g mgl10">직원선택</a></h5>
					<div class="simul_memberBox" id="divMezzStaffIb">
						<!-- <span class="employee_list"><span>박정인</span><em>(대리)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span>,
						<span class="employee_list"><span>박정인</span><em>(대리)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span> --> 
					</div>
					<h5 class="grid_title2">[성과금설정]</h5>
					<div class="sim_btnZone"><a href="javascript:fnObj.doInit();">초기화</a><a href="javascript:fnObj.simulate();">시뮬레이션</a><a href="javascript:fnObj.saveConfigInfo();"><strong>설정값 저장</strong></a></div>
					<table class="datagrid_input" summary="Mezzanine 설정(BEP, 구간금액, 구간비중, PS배분율, PI배분율)">
						<caption>Mezzanine 설정</caption>
						<colgroup>
							<col width="100"> <!--구분-->
							<col width="*"> <!--입력-->
							<col width="100"> <!--구간비중-->
							<col width="250"> <!--BEF구분-->
							<col width="130"> <!--입력-->
							<col width="150"> <!--입력-->
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">BEP</th>
								<td class="spanspace"><span>개별연봉</span><span>x</span><input type="text" id="inputBep" class="input_b simulation simtype" title="몇배" /><span>=</span><span class="resultBEP"><strong>? </strong>억</span></td>
								<th scope="row" rowspan="3">구간배분</th>
								<td><span class="icon_goal shortfall">BEP미달</span><span class="conditiontext"><em class="result">실적</em><em class="equalsign">&le;</em><em>BEP</em></span></td>
								<td rowspan="3"><input type="text" id="inputPrAmt" class="input_b simulation simtype" title="금액입력" /> 억당</td>
								<td class="txt_center"><input type="text" id="inputUBep" class="input_b simulation simtype" title="금액입력" disabled readonly  /> 백만원</td>
							</tr>
							<tr>
								<th scope="row">PS 배분율</th>
								<td><input type="text" id="inputPsRate" onKeyUp="fnObj.calPsPi();" class="input_b simulation simtype" title="PS배분율입력" /> %</td>
								<td><span class="icon_goal bep_exceed">BEP초과</span><span class="conditiontext"><em>BEP</em><em class="equalsign">&lt;</em><em class="result">실적</em><em class="equalsign">&le;</em><em>목표</em></span></td>
								<td class="txt_center"><input type="text" id="inputMBep" class="input_b simulation simtype" title="PS배분금액 입력" /> 백만원</td>
							</tr>
							<tr>
								<th scope="row">PI 배분율</th>
								<td><input type="text" id="inputPiRate" class="input_b simtype" title="PI배분율" disabled readonly /> %</td>
								<td><span class="icon_goal g_exceed">목표초과</span><span class="conditiontext"><em>BEP</em><em class="equalsign">&lt;</em><em>목표</em><em class="equalsign">&le;</em><em class="result">실적</em></span></td>
								<td class="txt_center"><input type="text" id="inputHBep" class="input_b simulation simtype" title="PS배분금액 입력" /> 백만원</td>
							</tr>
						</tbody>
					</table>
					<table id="SGridTarget" class="output_simul_tb mgt15" summary="IB투자 성과보수 안내 (직원명, 연봉, BEP, 목표, 실적, 성과기준, 평가, 적용비율, 기여수익, PS배분, PI배분, PS+PI)">
						<caption>IB투자 성과보수 안내</caption>
						<colgroup>
							<col width="100"> <!--직원-->
							<col width="9%"> <!--연봉-->
							<col width="9%"> <!--BEP-->
							<col width="9%"> <!--목표-->
							<col width="9%"> <!--실적-->
							<col width="*"> <!--성과기준-->
							<col width="8%"> <!--평가-->
							<col width="8.5%"> <!--기여수익-->
							<col width="8.5%"> <!--PS배분-->
							<col width="8.5%"> <!--PI배분-->
							<col width="8.5%"> <!--PS+PI배분-->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">직원</th>
								<th scope="col">연봉 <a href="javascript:fnObj.editStaffInfo('IB');"><span style="color:blue;font-size:15px;"><i class="axi axi-edit2"></i></span></a></th>
								<th scope="col">BEP</th>
								<th scope="col">목표 <a href="javascript:fnObj.editStaffInfo('IB');"><span style="color:blue;font-size:15px;"><i class="axi axi-edit2"></i></span></a></th>
								<th scope="col">실적</th>
								<th scope="col">성과기준<em>(실적-BEP)</em></th>
								<th scope="col">평가</th>
								<th scope="col">기여수익</th>
								<th scope="col">PS배분</th>
								<th scope="col">PI배분</th>
								<th scope="col">PS+PI</th>
							</tr>
						</thead>
						<tbody>
							<%-- <tr>
								<th scope="row">이명철</th>
								<td class="txt_income"><input type="text" class="input_b simulation simtype2" title="연봉입력" value="1.50" /></td>
								<td class="txt_num_st">225.00</td>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="목표금액입력" value="800.00" /></td>
								<td class="txt_num_st">820.00</td>
								<td class="txt_num_st">595.00</td>
								<td><span class="icon_goal g_exceed">목표초과</span></td>
								<td class="txt_conti_st">1.19</td>
								<td class="txt_num_st">0.18</td>
								<td class="txt_num_st">0.83</td>
								<td class="txt_total_st">1.01</td>
							</tr>
							<tr>
								<th scope="row">이주훈</th>
								<td class="txt_income"><input type="text" class="input_b simulation simtype2" title="연봉입력" value="1.20" /></td>
								<td class="txt_num_st">180.00</td>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="목표금액입력" value="800.00" /></td>
								<td class="txt_num_st">772.60</td>
								<td class="txt_num_st">592.60</td>
								<td><span class="icon_goal bep_exceed">BEP초과</span></td>
								<td class="txt_conti_st">0.89</td>
								<td class="txt_num_st">0.18</td>
								<td class="txt_num_st">0.62</td>
								<td class="txt_total_st">0.80</td>
							</tr>
							<tr>
								<th scope="row">박종서</th>
								<td class="txt_income"><input type="text" class="input_b simulation simtype2" title="연봉입력" value="0.90" /></td>
								<td class="txt_num_st">135.00</td>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="목표금액입력" value="400.00" /></td>
								<td class="txt_num_st">136.8</td>
								<td class="txt_num_st">1.80</td>
								<td><span class="icon_goal bep_exceed">BEP초과</span></td>
								<td class="txt_conti_st">0.00</td>
								<td class="txt_num_st">0.18</td>
								<td class="txt_num_st">0.00</td>
								<td class="txt_total_st">0.18</td>
							</tr>
							<tr>
								<th scope="row">정상호</th>
								<td class="txt_income"><input type="text" class="input_b simulation simtype2" title="연봉입력" value="0.70" /></td>
								<td class="txt_num_st">105.00</td>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="목표금액입력" value="400.00" /></td>
								<td class="txt_num_st">261.0</td>
								<td class="txt_num_st">156.00</td>
								<td><span class="icon_goal bep_exceed">BEP초과</span></td>
								<td class="txt_conti_st">0.23</td>
								<td class="txt_num_st">0.18</td>
								<td class="txt_num_st">0.16</td>
								<td class="txt_total_st">0.34</td>
							</tr>
							<tr>
								<th scope="row">김자점</th>
								<td class="txt_income"><input type="text" class="input_b simulation simtype2" title="연봉입력" value="0.80" /></td>
								<td class="txt_num_st">120.00</td>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="목표금액입력" value="200.00" /></td>
								<td class="txt_num_st">445.0</td>
								<td class="txt_num_st">325.00</td>
								<td><span class="icon_goal g_exceed">목표초과</span></td>
								<td class="txt_conti_st">0.65</td>
								<td class="txt_num_st">0.18</td>
								<td class="txt_num_st">0.46</td>
								<td class="txt_total_st">0.63</td>
							</tr> --%>
						</tbody>	
						<tfoot>	
							<tr>
								<th scope="row">합계</th>
								<td class="txt_income"><strong><span id="sumIncome"><!-- 5.10 --></span></strong></td>
								<td class="txt_num_st"><span id="sumBep"><!-- 765.00 --></span></td>
								<td class="txt_goal"><strong><span id="sumGoal"><!-- 2,600.00 --></span></strong></td>
								<td class="txt_num_st"><span id="sumAmt"><!-- 2,435.40 --></span></td>
								<td class="txt_num_st"><span id="sumOutcomBase"><!-- 1,670.40 --></span></td>
								<td>&nbsp;</td>
								<td class="txt_conti_st"><strong><span id="sumOutcome"><!-- 2.97 --></span></strong></td>
								<td class="txt_num_st"><span id="sumPs"><!-- 0.89 --></span></td>
								<td class="txt_num_st"><span id="sumPi"><!-- 2.08 --></span></td>
								<td class="txt_total_st"><strong><span id="sumPsPi"><!-- 2.97 --></span></strong></td>
							</tr>
						</tfoot>
					</table>
					<div class="total_wk_tb_wrap mgt15 mgb10">
						<table class="total_wk_perform" summary="전체">
							<caption>전체</caption>
							<colgroup>
								<col width="100">
								<col width="*" span="4">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" rowspan="2">IB 투자</th>
									<th scope="col" class="bg_gray">총 성과급</th>
									<th scope="col" class="bg_gray">PS합계</th>
									<th scope="col" class="bg_gray">PS배당</th>
									<th scope="col" class="bg_gray">PI배분</th>
								</tr>
								<tr>
									<td class="txt_money_red"><strong><span id="t_sumOutcome"><!-- 2.97 --></span></strong></td>
									<td><span id="t_sumPs"><!-- 0.89 --></span></td>
									<td><span id="t_onePs"><!-- 0.18 --></span></td>
									<td><span id="t_sumPi"><!-- 2.08 --></span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</dd>
			</dl>
			<dl class="simmul_dllist">
				<dt><h4 class="h4_title_basic">기업분석</h4></dt>
				<dd>
					<h5 class="grid_title2"><span>[대상자선택]</span><a href="javascript:fnObj.userPop('ANAL');" class="btn_s_type_g mgl10" style="height:inherit;">직원선택</a></h5>
					<div class="simul_memberBox" id="divMezzStaffAnal">
						<!-- <span class="employee_list"><span>박정인</span><em>(대리)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span>,
						<span class="employee_list"><span>박정인</span><em>(대리)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span>  -->
					</div>
					<h5 class="grid_title2">[성과금설정]</h5>					
					<div class="sim_btnZone"><a href="javascript:fnObj.doInit();">초기화</a><a href="javascript:fnObj.simulate();">시뮬레이션</a><a href="javascript:fnObj.saveConfigInfo();"><strong>설정값 저장</strong></a></div>
					<table class="datagrid_input" summary="Mezzanine 설정(BEP, 구간금액, 구간비중, PS배분율, PI배분율)">
						<caption>Mezzanine 설정</caption>
						<colgroup>
							<col width="100"> <!--구분-->
							<col width="*"> <!--입력-->
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">팀할당액</th>
								<td class="spanspace"><span>IB투자합계</span><span>x</span><input type="text" id="inputAnaNum" onchange="fnObj.calAnaRate();" class="input_b simulation simtype" title="분자입력" /><span>/</span><input type="text" id="inputAnaDnm" onchange="fnObj.calAnaRate();" class="input_b simulation simtype" title="분모입력" />
								<span>=</span><span class="resultBEP"><strong><span id="psAnalTeam">1.27</span></strong>억</span></td>
							</tr>
							<tr>
								<th scope="row">소싱성과금</th>
								<td class="spanspace"><span>투자결정금액</span><span>x</span><input type="text" id="inputAnaSrcAmt" class="input_b simulation simtype" title="투자결정금액의 몇퍼센트" /><span>%</span><span>x</span><input type="text" id="inputAnaSrcRate" class="input_b simulation simtype" title="수수료입력%" /><span>%</span></td>				
							</tr>
						</tbody>
					</table>
					<table id="SGridTarget2" class="output_simul_tb mgt15" summary="IB투자 성과보수 안내 (직원명, 연봉, BEP, 목표, 실적, 성과기준, 평가, 적용비율, 기여수익, PS배분, PI배분, PS+PI)">
						<caption>분석 성과보수 안내</caption>
						<colgroup>
							<col width="100"> <!--직원-->
							<col width="*"> <!--ROLE RATE-->
							<col width="18%"> <!--PS배분-->
							<col width="18%"> <!--실적-->
							<col width="18%"> <!--PI배분-->
							<col width="18%"> <!--PS+PI배분-->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">직원</th>
								<th scope="col">ROLE RATE <a href="javascript:fnObj.editStaffInfo('ANAL');"><span style="color:blue;font-size:15px;"><i class="axi axi-edit2"></i></span></a></th>
								<th scope="col">PS배분</th>
								<th scope="col">실적</th>
								<th scope="col">PI배분</th>
								<th scope="col">PS+PI</th>
							</tr>
						</thead>
						<tbody>
							<%-- <tr>
								<th scope="row">이명철</th>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="기여도입력" value="0.4" /></td>
								<td class="txt_num_st">0.51</td>
								<td class="txt_num_st">0</td>
								<td class="txt_num_st">0</td>
								<td class="txt_total_st">0.51</td>
							</tr>
							<tr>
								<th scope="row">김영도</th>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="기여도입력" value="0.3" /></td>
								<td class="txt_num_st">0.38</td>
								<td class="txt_num_st">40</td>
								<td class="txt_num_st">0.06</td>
								<td class="txt_total_st">0.44</td>
							</tr>
							<tr>
								<th scope="row">장영재</th>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="기여도입력" value="0.2" /></td>
								<td class="txt_num_st">0.25</td>
								<td class="txt_num_st">0</td>
								<td class="txt_num_st">0</td>
								<td class="txt_total_st">0.25</td>
							</tr>
							<tr>
								<th scope="row">김도연</th>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="기여도입력" value="0.1"></td>
								<td class="txt_num_st">0.13</td>
								<td class="txt_num_st">0</td>
								<td class="txt_num_st">0</td>
								<td class="txt_total_st">0.13</td>
							</tr> --%>
						</tbody>	
						<tfoot>	
							<tr>
								<th scope="row">합계</th>
								<td class="txt_goal"><strong><span id="sumRoleRate"><!-- 1.0 --></span></strong></td>
								<td class="txt_num_st"><span id="sumAnalPs"><!-- 1.27 --></span></td>
								<td class="txt_num_st"><span id="sumAnalAmt"><!-- 40.00 --></span></td>
								<td class="txt_num_st"><span id="sumAnalPi"><!-- 0.06 --></span></td>
								<td class="txt_total_st"><strong><span id="sumAnalPsPi"><!-- 1.33 --></span></strong></td>
							</tr>
						</tfoot>
					</table>
					<div class="total_wk_tb_wrap mgt15 mgb10">
						<table class="total_wk_perform" summary="전체">
							<caption>전체</caption>
							<colgroup>
								<col width="100">
								<col width="*" span="4">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" rowspan="2">기업분석</th>
									<th scope="col" class="bg_gray">총 성과급</th>
									<th scope="col" class="bg_gray">PS합계</th>
									<th scope="col" class="bg_gray">실적</th>
									<th scope="col" class="bg_gray">PI배분</th>
								</tr>
								<tr>
									<td class="txt_money_red"><strong><span id="t_sumAnalPsPi"><!-- 1.33 --></span></strong></td>
									<td><span id="t_sumAnalPs"><!-- 1.27 --></span></td>
									<td><span id="t_sumAnalAmt"><!-- 40.00 --></span></td>
									<td><span id="t_sumAnalPi"><!-- 0.06 --></span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</dd>
			</dl>
		</div>
		
		
		
		
		
		<div id="tempmodalPOP" style="display:none;">
			<div class="modalWrap2">
				<h1><strong>[유형선택]</strong> </h1>
				<div class="mo_container">
					<h3 class="h3_title_basic">유형선택</h3>				
					<div class="popup_ListBox">
						<ul class="labelList_st" id="ulMezzTypeAll">
							<!-- <li><label><input type="checkbox"><span>CB</span></label></li>
							<li><label><input type="checkbox"><span>EB</span></label></li>
							<li><label><input type="checkbox"><span>BW</span></label></li>
							<li><label><input type="checkbox"><span>유증</span></label></li>
							<li><label><input type="checkbox"><span>블록딜</span></label></li>
							<li><label><input type="checkbox"><span>실권주</span></label></li>
							<li><label><input type="checkbox"><span>워런트</span></label></li>
							<li><label><input type="checkbox"><span>프리IPO</span></label></li>
							<li><label><input type="checkbox"><span>벤처</span></label></li>
							<li><label><input type="checkbox"><span>M&amp;A</span></label></li>
							<li><label><input type="checkbox"><span>스팩</span></label></li>
							<li><label><input type="checkbox"><span>RCPS</span></label></li> -->
						</ul>
					</div>
					<div class="memberBox_controll"><!--닫기버튼<a href="#" class="btn_td_close"><em>닫기</em></a>--><!--열기버튼--><a href="javascript:;" class="btn_td_open"><em>열기</em></a></div>
					<div class="btnZoneBox"><a href="javascript:fnObj.doSaveMezzType();" class="p_blueblack_btn"><strong>저장</strong></a><a href="javascript:showMezzType(tempmodalPOP, 'C');" class="p_withelin_btn">취소</a></div>	
				</div>
					
				<!-- <a href="#" class="btn_modal_min"><em>창 최소화</em></a>
				<a href="#" class="btn_modal_max"><em>창 최대화</em></a> -->
				<a href="javascript:showMezzType(tempmodalPOP, 'C');" class="btn_modal_close"><em>창 닫기</em></a>
			</div>
		</div>
		
	</div>

	
	<br/>
	<!-- <div class="btn_baordZone2">
		<a href="#" class="btn_blueblack"><strong>저장</strong></a>
	</div> -->
	
	
	<form id="privateForm" name="privateForm" method="post">
		<input type="hidden" name="tmpNum1" />
		<input type="hidden" name="choice_year" />
	</form>
	


	
<script type="text/javascript">

//Global variables :S ---------------

//공통코드

//var myModal = new AXModal();		// instance
var myGrid = new SGrid();			// instance		new sjs
var myGrid2 = new SGrid();			// instance		new sjs

var g_mode = "new";					//"new", "update" 

var g_psMezzId;						//시스템 id

var g_yearList = [];				//연도 배열 (2015년 ~ 현재년도)
var g_mezzTypeAll;					//유형정보 코드 전체

var g_year;							//선택 연도
var g_mezzTypeList;					//유형정보
var g_mezzIbUser;					//IB투자 직원정보
var g_mezzAnalUser;					//기업분석 직원정보

var g_sumOutcome = 0;				//총 성과급


//var g_entryUserList = []; 						//선택한 유저 리스트.

//Global variables :E ---------------


/*
 * 코드등을 불러오는 함수(preloadCode), 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
 var fnObj = {
		
	preloadCode : function(){
		
		//검색 년도 선택 박스 세팅
		var nowYear = new Date().getFullYear(); 
		for(var i=nowYear; i>=2015; i--){
			g_yearList.push({'CD':i, 'NM':i});			//년도 추가
		}
		
		var yearSelectTag = createSelectTag('psYear', g_yearList, 'CD', 'NM', nowYear-1, 'fnObj.chngYear()', [], 90, 'select_b w_date');	//년도 선택박스
		$("#spanPsYear").html(yearSelectTag);
				
		g_year = $('#psYear').val();					//선택 년도	... global variable
		
		
		//유형 코드 전체
		g_mezzTypeAll = getCodeInfo(null, null, null, null, null, null, '/stats/getMezzTypeAll.do', null);
		
	},
	
	pageStart : function(){

		//유형선택 레이어 팝업 화면 세팅 :S -----------------------------------
		var typeHtml = '';
		for(var i=0; i<g_mezzTypeAll.length; i++){
			typeHtml += '<li><label><input type="checkbox" name="chkMezzType" value="' + g_mezzTypeAll[i]['cd'] + '"><span>' + g_mezzTypeAll[i]['nm'] + '</span></label></li>'; 
		}
		
		$('#ulMezzTypeAll').html(typeHtml);		//유형 체크 박스 세팅
		//유형선택 레이어 팝업 화면 세팅 :E -----------------------------------
		
		
		
		//-------------------------- 그리드 설정 (IB투자) :S ----------------------------
    	/* 그리드 설정정보 */
    	var configObj = {
    		
    		targetID : "SGridTarget",		//그리드의 id
    		
    		//그리드 컬럼 정보
    		colGroup : [
			{key:"name",		formatter:function(obj){			//직원명
									var val = '<a href="javascript:fnObj.privateList(\'' + obj.value + '\');">' + obj.value + ' <font color="pink" style="font-size:15px;"><i class="axi axi-pageview staffNm_dtl_view"></i></font></a>';
									return val;
								}},
			{key:"psStaffIncome",formatter:function(obj){			//연봉
									return !isEmpty(obj.value)?obj.value.toFixed(2):'';
            					}},
            {key:"psBep",		formatter:function(obj){			//BEP
            						return !isEmpty(obj.value)?obj.value.toFixed(2):'';
            					}},
            {key:"psStaffGoal",	formatter:function(obj){			//목표
            						return !isEmpty(obj.value)?obj.value.toFixed(2):'';
								}},
            {key:"psStaffAmt",	formatter:function(obj){			//실적
            						return !isEmpty(obj.value)?obj.value.toFixed(2):'';
            					}},
            {key:"psOutcomeBase", formatter:function(obj){			//성과기준
            						var val = (obj.item.psStaffAmt * 1)-(obj.item.psBep * 1); 
            						return !isEmpty(val)?val.toFixed(2):'';
            					}},
			{key:"result", 		formatter:function(obj){			//평가
									var result = '';
									if(obj.item.psStaffAmt <= obj.item.psBep)
										result = '<span class="icon_goal shortfall">BEP미달</span>';
									else if(obj.item.psStaffAmt >= obj.item.psStaffGoal)
										result = '<span class="icon_goal g_exceed">목표초과</span>';
									else
										result = '<span class="icon_goal bep_exceed">BEP초과</span>';
																		
            						return result;
            					}},
            {key:"psOutcome",	formatter:function(obj){			//기여수익
            						return !isEmpty(obj.value) && !isNaN(obj.value)?obj.value.toFixed(2):'';
            					}},
            {key:"psPs",		formatter:function(obj){			//PS배분
            						return !isEmpty(obj.value) && !isNaN(obj.value)?obj.value.toFixed(2):'';
            					}},
            {key:"psPi",		formatter:function(obj){			//PI배분
            						return !isEmpty(obj.value) && !isNaN(obj.value)?obj.value.toFixed(2):'';
            					}},
            {key:"psPsPi",		formatter:function(obj){			//PS+PI
            						var val = obj.item.psPs + obj.item.psPi;
            						return !isEmpty(val) && !isNaN(val)?val.toFixed(2):'';
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
                	
                	//if(obj.c < 3){
                		//상세보기
                    	//fnObj.doViewMemo(obj.item.newMainSnb, obj.item.grpMemCnt, obj.item.grpMemNms, obj.item.sNb, obj.item.mainSnb, obj.item.readStts );
                	//}
                	
                }
            }
            
    	};
    	
    	
    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
    	var rowHtmlStr = '<tr>';    	
    	rowHtmlStr += '<th scope="row">#[0]</th>';
    	rowHtmlStr += '<td class="txt_income">#[1]</td>';
    	rowHtmlStr += '<td class="txt_num_st">#[2]</td>';
    	rowHtmlStr += '<td class="txt_income">#[3]</td>';
    	rowHtmlStr += '<td class="txt_num_st">#[4]</td>';
    	rowHtmlStr += '<td class="txt_num_st">#[5]</td>';
    	rowHtmlStr += '<td>#[6]</td>';
    	rowHtmlStr += '<td class="txt_conti_st">#[7]</td>';
    	rowHtmlStr += '<td class="txt_num_st">#[8]</td>';
    	rowHtmlStr += '<td class="txt_num_st">#[9]</td>';
    	rowHtmlStr += '<td class="txt_total_st">#[10]</td>';		
    	rowHtmlStr += '</tr>';
    	
    	configObj.rowHtmlStr = rowHtmlStr;
        
    	
    	myGrid.setConfig(configObj);		//그리드 설정정보 세팅
    	//-------------------------- 그리드 설정 (IB투자) :E ----------------------------
    	
    	
    	//-------------------------- 그리드 설정 (분석) :S ----------------------------
    	/* 그리드 설정정보 */
    	var configObj2 = {
    		
    		targetID : "SGridTarget2",		//그리드의 id
    		
    		//그리드 컬럼 정보
    		colGroup : [
			{key:"name",		formatter:function(obj){			//직원명
									var val = '<a href="javascript:fnObj.privateList(\'' + obj.value + '\');">' + obj.value + ' <font color="pink" style="font-size:15px;"><i class="axi axi-pageview staffNm_dtl_view"></i></font></a>';
									return val;
								}},
			{key:"psMezzRate",formatter:function(obj){				//ROLE RATE
									return !isEmpty(obj.value)?obj.value.toFixed(2):'';
            					}},
            {key:"psPs",		formatter:function(obj){			//PS배분
            						return isEmpty(obj.value)||isNaN(obj.value)?'':obj.value.toFixed(2);
            					}},
            {key:"psStaffAnalAmt",	formatter:function(obj){		//실적
            						return !isEmpty(obj.value)?obj.value.toFixed(2):'';
								}},
			{key:"psPi",		formatter:function(obj){			//PI배분
            						return !isEmpty(obj.value)?obj.value.toFixed(2):'';
								}},
            {key:"psPsPi", 		formatter:function(obj){			//성과기준
            						var val = obj.item.psPs + obj.item.psPi;
            						return isEmpty(val)||isNaN(val)?'':val.toFixed(2);
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
    	var rowHtmlStr2 = '<tr>';    	
    	rowHtmlStr2 += '<th scope="row">#[0]</th>';
    	rowHtmlStr2 += '<td class="txt_income">#[1]</td>';
    	rowHtmlStr2 += '<td class="txt_num_st">#[2]</td>';
    	rowHtmlStr2 += '<td class="txt_num_st">#[3]</td>';
    	rowHtmlStr2 += '<td class="txt_num_st">#[4]</td>';
    	rowHtmlStr2 += '<td class="txt_total_st">#[5]</td>';		
    	rowHtmlStr2 += '</tr>';
    	
    	configObj2.rowHtmlStr = rowHtmlStr2;
        
    	
    	myGrid2.setConfig(configObj2);		//그리드 설정정보 세팅
    	//-------------------------- 그리드 설정 (분석) :E ----------------------------
		
	},
	
	
	//선택년도 변경
	chngYear : function(){
		g_year = $('#psYear').val();					//선택 년도
		this.doSearch();								//검색
	},
	
	
	//메자닌 성과 설정 정보 및 성과계산
	doSearch : function(){
 		
		//유형 정보
		this.getPsMezzType();
		
		//IB투자 직원정보(개인 실적정보 포함)
		this.getPsMezzStaff('IB');				//동기
		
		//기업분석 직원정보(개인 실적정보 포함)
		this.getPsMezzStaff('ANAL');			//동기
		
		//메자닌 성과 설정 정보
		this.getPsMezzConfigInfo();				//동기
		
		
		//설정 정보를 통한 성과 정보 계산 (설정 정보가 있을 경우)
		this.setPsMezzInfo();
		
	},
	
	
	//유형선택 팝업
	openMezzTypePop : function(){
		
		//체크박스 초기화
		$('input[name=chkMezzType]').attr('checked', false);		//일괄체크해제 후에
		for(var i=0; i<g_mezzTypeList.length; i++){
			//유형선택 팝업에 선택 표시 sync
			$('input[name=chkMezzType][value=' + g_mezzTypeList[i].psIbMatch + ']').attr('checked', true);		//선택한 정보들을 전체중에 체크상태로
		}
		
		
		showMezzType(tempmodalPOP, 'O');		//팝업 연다(보이도록)
	},
	
	
	//유형 정보
	getPsMezzType : function(){ 		
		var url = contextRoot + "/stats/getPsMezzType.do";	   	
		var param = { 
				year : g_year
		};
		var callback = function(result){
    		var obj = JSON.parse(result);
    		var list = obj.resultList;
    		
    		g_mezzTypeList = obj.resultList;		//유형정보 ... global variable
    		
    		var htmlStr = '';
    		for(var i=0;i<list.length;i++){
    			//선택 유형 정보 html
    			htmlStr += '<li><span class="code">' + list[i].psIbMatchNm + '</span></li>';	//<span class="btn_delete"><em>삭제</em></span>
    			
    			//유형선택 팝업에 선택 표시 sync
    			$('input[name=chkMezzType][value=' + list[i].psIbMatch + ']').attr('checked', true);		//선택한 정보들을 전체중에 체크상태로
    		}
    		
    		$("#ulMezzType").html(htmlStr);
    	};
    	
    	commonAjax("POST", url, param, callback, true);
	},
	
	
	//유형선택 저장
	doSaveMezzType : function(){

		var typeListStr = '';
		$('input[name=chkMezzType]:checked').each(function(){
			typeListStr += this.value + ',';
		});
		
    	var url = contextRoot + "/stats/doSaveMezzType.do";
    	var param = {
    			year 		: g_year,    			//선택년도
    			typeList	: typeListStr			//선택한 유형	    		    			
    	};
    	
    	//alert(JSON.stringify(param));
    	//return;
    	
    	var callback = function(result){    			
    		var obj = JSON.parse(result);
    		
    		if(obj.result == "SUCCESS"){    			
    			toast.push("저장 되었습니다!");    			
    			showMezzType(tempmodalPOP, 'C');		//팝업 닫는다(안보이도록)
    			
    			fnObj.doSearch();						//전체 재로딩
    			
    		}else{
    			//alertMsg();
    		}    		
    	};
    	
    	commonAjax("POST", url, param, callback);
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
    		var list = obj.resultList;
    		
    		var htmlStr = '';
    		for(var i=0;i<list.length;i++){    			
    			htmlStr += '<span class="employee_list"><span>' + list[i].name + '</span><em>(' + list[i].position + ')</em></span>';	//<a href="#" class="btn_delete_employee"><em>삭제</em></a></span>';
    			if(i<list.length-1) htmlStr += ', ';
    		}
    		
    		if(knd == 'IB'){
    			$("#divMezzStaffIb").html(htmlStr);
    			
    			g_mezzIbUser = obj.resultList;					//IB 직원정보 ... global variable
    			
    		}else if(knd == 'ANAL'){
    			$("#divMezzStaffAnal").html(htmlStr);
    			
    			g_mezzAnalUser = obj.resultList;				//분석 직원정보 ... global variable
    		}
    	};
    	
    	commonAjax("POST", url, param, callback, false);		//false 동기
	},
	
	
	//메자닌 성과 설정 정보
	getPsMezzConfigInfo : function(){
 		
		var url = contextRoot + "/stats/getPsMezzConfigInfo.do";
	   	 
		var param = { 
				year : g_year
		};

		var callback = function(result){
    		var obj = JSON.parse(result);
    		var list = obj.resultList;
    		

    		if(list.length > 0){		//저장된 설정정보가 있을때
    			var info = list[0];
	    		//설정 정보 화면 세팅
	    		
	    		g_psMezzId = info.psMezzId;						//설정정보 id		... global variable
	    		g_mode = "update";								//수정모드
	    		
	    		$('#inputBep').val(info.psMezzBep);				//BEP 금액(1억당)
	    		$('#inputPrAmt').val(info.psMezzPrAmt);			//성과적용 단위
	    		$('#inputUBep').val(info.psMezzUBep);			//BEP미달
	    		$('#inputMBep').val(info.psMezzMBep);			//BEP초과
	    		$('#inputHBep').val(info.psMezzHBep);			//목표초과
	    		$('#inputPsRate').val(info.psMezzPsRate);		//PS배분율
	    		$('#inputPiRate').val(info.psMezzPiRate);		//PI배분율
	    		$('#inputAnaNum').val(info.psAnaNum);			//분석팀분자
	    		$('#inputAnaDnm').val(info.psAnaDnm);			//분석팀분모
	    		$('#inputAnaSrcAmt').val(info.psAnaSrcAmt);		//소싱금액 적용율
	    		$('#inputAnaSrcRate').val(info.psAnaSrcRate);	//소싱금액 실적적용율
	    		
    		}else{		//저장된 설정정보가 없을때,
    			g_psMezzId = -1;								//설정정보 id		... global variable
	    		g_mode = "new";									//신규모드
	    		
	    		$('#inputBep').val('');							//BEP 금액(1억당)
	    		$('#inputPrAmt').val('');						//성과적용 단위
	    		$('#inputUBep').val('0');						//BEP미달
	    		$('#inputMBep').val('');						//BEP초과
	    		$('#inputHBep').val('');						//목표초과
	    		$('#inputPsRate').val('');						//PS배분율
	    		$('#inputPiRate').val('');						//PI배분율
	    		$('#inputAnaNum').val('');						//분석팀분자
	    		$('#inputAnaDnm').val('');						//분석팀분모
	    		$('#inputAnaSrcAmt').val('');					//소싱금액 적용율
	    		$('#inputAnaSrcRate').val('');					//소싱금액 실적적용율
    		}
    	};
    	
    	commonAjax("POST", url, param, callback, false);	//동기
	},
	
	
	//설정 정보를 통한 성과 정보 계산 (설정 정보가 있을 경우)
	setPsMezzInfo : function(){
		
		//IB투자 개인별 성과표 데이터 생성 :S ----------------------------- ①
		
		var factorBep = $('#inputBep').val();		//BEP 계수
		var prAmt = $('#inputPrAmt').val();			//성과적용 단위
		var sumIncome = 0;							//연봉합계
		var sumBep = 0;								//BEP합계
		var sumGoal = 0;							//목표합계
		var sumAmt = 0;								//실적합계
		var sumOutcomBase = 0;						//성과기준합계
		g_sumOutcome = 0;							//총성과급(총기여수익) 초기화
		for(var i=0; i<g_mezzIbUser.length; i++){
			g_mezzIbUser[i].psBep = g_mezzIbUser[i].psStaffIncome * factorBep;											//BEP
			
			var pOut = 0;
			if(g_mezzIbUser[i].psStaffAmt <= g_mezzIbUser[i].psBep)
				pOut = $('#inputUBep').val();		//BEP미달 적용금액
			else if(g_mezzIbUser[i].psStaffAmt >= g_mezzIbUser[i].psStaffGoal)
				pOut = $('#inputHBep').val();		//목표초과 적용금액
			else
				pOut = $('#inputMBep').val();		//BEP초과 적용금액
			g_mezzIbUser[i].psOutcome = ((g_mezzIbUser[i].psStaffAmt - g_mezzIbUser[i].psBep) / prAmt) * pOut / 100;	//기여수익
			
			g_mezzIbUser[i].psPi = g_mezzIbUser[i].psOutcome * (100-$('#inputPsRate').val()) / 100;						//PI배분
						
			//합계
			sumIncome += g_mezzIbUser[i].psStaffIncome;								//연봉합계
			sumBep += g_mezzIbUser[i].psBep;										//BEP합계
			sumGoal += g_mezzIbUser[i].psStaffGoal;									//목표합계
			sumAmt += g_mezzIbUser[i].psStaffAmt;									//실적합계
			sumOutcomBase += g_mezzIbUser[i].psStaffAmt - g_mezzIbUser[i].psBep;	//성과기준합계
			
			g_sumOutcome += g_mezzIbUser[i].psOutcome;			//총 성과급(총 기여수익) ... global variable
			
		}
		
		
		//합계표기 -------
		//성과표합계
		$('#sumIncome').html(sumIncome.toFixed(2));												//연봉
		$('#sumBep').html(sumBep.toFixed(2));													//BEP
		$('#sumGoal').html(sumGoal.toFixed(2));													//목표
		$('#sumAmt').html(sumAmt.toFixed(2));													//실적
		$('#sumOutcomBase').html(sumOutcomBase.toFixed(2));										//성과기준
		
		$('#sumOutcome').html(isEmpty(g_sumOutcome)||isNaN(g_sumOutcome)?'0.00':g_sumOutcome.toFixed(2));											//기여수익합계(총 성과급)
		$('#sumPs').html(isEmpty(g_sumOutcome)||isNaN(g_sumOutcome)?'':(g_sumOutcome * $('#inputPsRate').val() / 100).toFixed(2));			//PS합계
		$('#sumPi').html(isEmpty(g_sumOutcome)||isNaN(g_sumOutcome)?'':(g_sumOutcome * (100-$('#inputPsRate').val()) / 100).toFixed(2));		//PI합계
		$('#sumPsPi').html(isEmpty(g_sumOutcome)||isNaN(g_sumOutcome)?'':g_sumOutcome.toFixed(2));											//PS+PI(총 성과급)
		//별도합계
		$('#t_sumOutcome').html(isEmpty(g_sumOutcome)||isNaN(g_sumOutcome)?'0.00':g_sumOutcome.toFixed(2));										//총 성과급
		$('#t_sumPs').html(isEmpty(g_sumOutcome)||isNaN(g_sumOutcome)?'':(g_sumOutcome * $('#inputPsRate').val() / 100).toFixed(2));			//PS합계
		var onePs = g_sumOutcome * $('#inputPsRate').val() / 100 / g_mezzIbUser.length;
		$('#t_onePs').html(isEmpty(onePs)||isNaN(onePs)?'':onePs.toFixed(2));													//PS배당(1인당)
		$('#t_sumPi').html(isEmpty(g_sumOutcome)||isNaN(g_sumOutcome)?'':(g_sumOutcome * (100-$('#inputPsRate').val()) / 100).toFixed(2));	//PI합계
		
		
		//IB투자 개인별 성과표 데이터 추가사항
		for(var i=0; i<g_mezzIbUser.length; i++){
			g_mezzIbUser[i].psPs = onePs;
		}
		
		//성과표 데이터 적용
		myGrid.setGridData({
			list: g_mezzIbUser
		});
		
		//IB투자 개인별 성과표 데이터 생성 :E ----------------------------- ①
		
		
		
		//분석 개인별 성과표 데이터 생성 :S ------------------------------- ②
		
		//분석 팀할당액
		var psAnalTeam = g_sumOutcome * $('#inputAnaNum').val() / $('#inputAnaDnm').val();  
		$('#psAnalTeam').html(isEmpty(psAnalTeam)||isNaN(psAnalTeam)?'N/A':psAnalTeam.toFixed(2));
				
		var sumRoleRate = 0;						//ROLE RATE 합계
		var sumAnalPs = 0;							//PS 배분 합계
		var sumAnalAmt = 0;							//실적 합계
		var sumAnalPi = 0;							//PI 배분 합계
		
		for(var i=0; i<g_mezzAnalUser.length; i++){
			
			g_mezzAnalUser[i].psPs = g_mezzAnalUser[i].psMezzRate * psAnalTeam;												//PS배분
			g_mezzAnalUser[i].psStaffAnalAmt = (g_mezzAnalUser[i].ibUser == '1'? 0 : g_mezzAnalUser[i].psStaffAmt);			//실적
			g_mezzAnalUser[i].psPi = g_mezzAnalUser[i].psStaffAnalAmt * $('#inputAnaSrcAmt').val() / 100 * $('#inputAnaSrcRate').val() / 100;			//PI배분
						
			//합계
			sumRoleRate += g_mezzAnalUser[i].psMezzRate;							//ROLE RATE 합계
			sumAnalPs += g_mezzAnalUser[i].psPs;									//PS 배분 합계
			sumAnalAmt += g_mezzAnalUser[i].psStaffAnalAmt;							//실적 합계
			sumAnalPi += g_mezzAnalUser[i].psPi;									//PI 배분 합계
		}
		
		
		//합계표기 -------
		//성과표합계
		$('#sumRoleRate').html(sumRoleRate.toFixed(2));											//ROLE RATE
		$('#sumAnalPs').html(isEmpty(sumAnalPs)||isNaN(sumAnalPs)?'':sumAnalPs.toFixed(2));		//PS배분
		$('#sumAnalAmt').html(sumAnalAmt.toFixed(2));											//실적
		$('#sumAnalPi').html(sumAnalPi.toFixed(2));												//PI배분
		$('#sumAnalPsPi').html(isEmpty(sumAnalPs)||isNaN(sumAnalPs)?'':(sumAnalPs + sumAnalPi).toFixed(2));								//PS+PI

		//별도합계
		$('#t_sumAnalPsPi').html(isEmpty(sumAnalPs)||isNaN(sumAnalPs)?'':(sumAnalPs + sumAnalPi).toFixed(2));							//총 성과급 (PS+PI 총합)
		$('#t_sumAnalPs').html(isEmpty(sumAnalPs)||isNaN(sumAnalPs)?'':sumAnalPs.toFixed(2));											//PS합계
		$('#t_sumAnalAmt').html(sumAnalAmt.toFixed(2));											//실적
		$('#t_sumAnalPi').html(sumAnalPi.toFixed(2));											//PI배분
		
		
		//성과표 데이터 적용
		myGrid2.setGridData({
			list: g_mezzAnalUser
		});
		
		//분석 개인별 성과표 데이터 생성 :E ------------------------------- ②
	},
	
	
	//초기화
	doInit : function(){
		
		$("#ulMezzType").html('');				//유형 초기화
		$("#divMezzStaffIb").html('');			//IB투자 직원 초기화
		$("#divMezzStaffAnal").html('');		//분석 직원 초기화
		
		this.doSearch();
		
		toast.push('[OK] 초기화 실행!');
	},
	
	
	//시뮬레이션
	simulate : function(){
		this.setPsMezzInfo();
		
		toast.push('[OK] 시뮬레이션 실행!');
	},
	
	
	//PS배분율, PI배분율 변경
	calPsPi : function(){
		$('#inputPiRate').val(100 - $('#inputPsRate').val()*1);
	},
	
	
	//분석 팀할당률 변경
	calAnaRate : function(){
		//분석 팀할당액
		var psAnalTeam = g_sumOutcome * $('#inputAnaNum').val() / $('#inputAnaDnm').val();  
		$('#psAnalTeam').html(psAnalTeam.toFixed(2));		
	},
	
	
	//설정정보 저장
	saveConfigInfo : function(){
		
		//------------ validation :S --------------
		if(isEmpty($('#inputBep').val())){					//BEP 금액(1억당))
			dialog.push({body:"<b>확인!</b> BEP 계수?", type:"", onConfirm:function(){$('#inputBep').focus();}});
    		return;
		}
		if(isEmpty($('#inputPsRate').val())){				//BEP 금액(1억당))
			dialog.push({body:"<b>확인!</b> PS백분율?", type:"", onConfirm:function(){$('#inputPsRate').focus();}});
    		return;
		}
		if(isEmpty($('#inputPrAmt').val())){				//성과적용 단위
			dialog.push({body:"<b>확인!</b> 성과적용 단위 (억)?", type:"", onConfirm:function(){$('#inputPrAmt').focus();}});
    		return;
		}
		if(isEmpty($('#inputMBep').val())){					//BEP초과 성과
			dialog.push({body:"<b>확인!</b> BEP초과 성과분?", type:"", onConfirm:function(){$('#inputMBep').focus();}});
    		return;
		}
		if(isEmpty($('#inputHBep').val())){					//목표초과 성과
			dialog.push({body:"<b>확인!</b> 목표초과 성과분?", type:"", onConfirm:function(){$('#inputHBep').focus();}});
    		return;
		}
		if(isEmpty($('#inputAnaNum').val())){				//분석파트 할당 분자
			dialog.push({body:"<b>확인!</b> 분석파트 할당 분자?", type:"", onConfirm:function(){$('#inputAnaNum').focus();}});
    		return;
		}
		if(isEmpty($('#inputAnaDnm').val())){				//분석파트 할당 분모
			dialog.push({body:"<b>확인!</b> 분석파트 할당 분모?", type:"", onConfirm:function(){$('#inputAnaDnm').focus();}});
    		return;
		}
		if(isEmpty($('#inputAnaSrcAmt').val())){			//소싱성과금 적용율
			dialog.push({body:"<b>확인!</b> 소싱성과금 적용율?", type:"", onConfirm:function(){$('#inputAnaSrcAmt').focus();}});
    		return;
		}
		if(isEmpty($('#inputAnaSrcRate').val())){			//소싱성과금 실적적용율
			dialog.push({body:"<b>확인!</b> 소싱성과금 실적적용율?", type:"", onConfirm:function(){$('#inputAnaSrcRate').focus();}});
    		return;
		}
		
		//------------ validation :E --------------
		
    	var url = contextRoot + "/stats/doSavePsConfigInfo.do";
    	var param = {
    			psMezzId	: g_psMezzId,						//수정모드일때만 있다
    			
    			year 		: g_year,    						//선택년도
	    		bep			: $('#inputBep').val(),				//BEP 금액(1억당)
	    		prAmt		: $('#inputPrAmt').val(),			//성과적용 단위
	    		uBep		: $('#inputUBep').val(),			//BEP미달
	    		mBep		: $('#inputMBep').val(),			//BEP초과
	    		hBep		: $('#inputHBep').val(),			//목표초과
	    		psRate		: $('#inputPsRate').val(),			//PS배분율
	    		piRate		: $('#inputPiRate').val(),			//PI배분율
	    		anaNum		: $('#inputAnaNum').val(),			//분석팀분자
	    		anaDnm		: $('#inputAnaDnm').val(),			//분석팀분모
	    		anaSrcAmt	: $('#inputAnaSrcAmt').val(),		//소싱금액 적용율
	    		anaSrcRate	: $('#inputAnaSrcRate').val()		//소싱금액 실적적용율    			
    	};
    	
    	//alert(JSON.stringify(param));
    	//return;
    	
    	var callback = function(result){    			
    		var obj = JSON.parse(result);
    		
    		if(obj.result == "SUCCESS"){    			
    			toast.push("저장 되었습니다!");
    			
    			fnObj.doSearch();						//전체 재로딩
    		}else{
    			//alertMsg();
    		}
    	};
    	
    	commonAjax("POST", url, param, callback);
	},
	
	
	//연봉, 목표, ROLL RATE 변경
	editStaffInfo : function(knd){
		
		var url = "<c:url value='/stats/editStaffInfo.do?y=' />" + g_year + '&k=' + knd;
		
		window.open(url, 'editStaffInfo', 'scrollbars=no width=350 height=320');
		
	},
	
		
	//유저선택 공통 팝업
    userPop : function(knd){		//knd ... 'IB' or 'ANAL'
    	
    	var userStr ='';
    	var arr = [];
    	var selectUserList = (knd=='IB'? g_mezzIbUser : g_mezzAnalUser);
    	
    	for(var i=0;i<selectUserList.length;i++){
    		arr.push(selectUserList[i].psMezzStaff);
  		}

    	//if(arr.length == 0) arr.push('${userLoginInfo.staffSnb}');
    		
    	userStr = arr.join(',');
    	
    	var paramList = [];
		paramList.push({"name" : "userList" 		,"value" : userStr});
		paramList.push({"name" : "isOneOrg" 		,"value" : "Y"});
		paramList.push({"name" : "isAllOrgSelect" 	,"value" : "N"});
		paramList.push({"name" : "isAllOrgSelect" 	,"value" : "N"});
		paramList.push({"name" : "parentKey" 		,"value" : knd});
        
        
        userSelectPopCall(paramList);		//공통 선택 팝업 호출
 	},
	
 	
 	//직원 선택 
  	getResult : function(resultList, key){
  	
  		//alert(key);
		//alert(JSON.stringify(resultList));
		//return;
		
  		/* for(var i=0;i<resultList.length;i++){
  			
  			str +='<span class="employee_list" id="userOneArea_'+resultList[i].userId+'" style="display:inline-block;width:140px;"><span>'+resultList[i].userName+'</span><em>(';
  			str +=resultList[i].position+')</em><a onclick="javascript:fnObj.deleteUser('+resultList[i].userId+');" class="btn_delete_employee"><em>삭제</em></a>';
  			str +='<input type="hidden" name="selectUserId" value="'+resultList[i].userId+'"/>';
  			str +='<input type="hidden" name="selectUserSabun" value="'+resultList[i].sabun+'"/>';
  			if(i<resultList.length-1){
    				str+=',';
    		}
  			str+='</span>';
  			brCnt++;
  			
    	}
  		$("#userSelectArea").html(str);					//참여자 이름 */
  		
  		
		var staffListStr = '';
		for(var i=0; i<resultList.length; i++){
			staffListStr += resultList[i].staffSnb + ',';
		}
		
    	var url = contextRoot + "/stats/doSaveMezzStaff.do";
    	var param = {
    			year 	: g_year,    		//선택년도
    			role	: key,				//선택한 유형
    			staffList : staffListStr
    	};
    	    	
    	var callback = function(result){
    		var obj = JSON.parse(result);
    		
    		if(obj.result == "SUCCESS"){
    			toast.push("저장 되었습니다!");
    			
    			fnObj.doSearch();						//전체 재로딩    			
    		}else{
    			//alertMsg();
    		}
    	};
    	
    	commonAjax("POST", url, param, callback);  		
  	},
  	
 	
 	/* 
 	//삭제버튼 클릭
 	deleteUser : function(userId){
 		$("#userOneArea_"+userId).remove();
 		
 	} */
	
 	
 	//개인별 실적건 상세 페이지
  	privateList : function(nm){  		
  		document.privateForm.tmpNum1.value = nm;
  		document.privateForm.choice_year.value = g_year;
  		document.privateForm.action = "<c:url value='/stats/selectPrivateList.do' />";
  		document.privateForm.target = "_new";
  		document.privateForm.submit();
  	},
  	
  	
  	//탭 전환
  	changeTab : function(tab){
  		if(tab == 'MNA' || tab == 'TIPS'){
  			alert('준비중!');
  			return;
  		}
  		
  		//초기화
  		$('#liTabAll').removeClass('current');
  		$('#liTabMezz').removeClass('current');
  		$('#liTabMna').removeClass('current');
  		$('#liTabTips').removeClass('current');
  		
  		//탭 활성화
  		if(tab == 'ALL'){
  			$('#liTabAll').addClass('current');
  		}else if(tab == 'MEZZ'){
  			$('#liTabMezz').addClass('current');
  		}else if(tab == 'MNA'){
  			$('#liTabMna').addClass('current');  			
  		}else if(tab == 'TIPS'){
  			$('#liTabTips').addClass('current');  			
  		}
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